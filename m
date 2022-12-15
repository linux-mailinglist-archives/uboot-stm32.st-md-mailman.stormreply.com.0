Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1940864DDDD
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Dec 2022 16:34:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1722C64109;
	Thu, 15 Dec 2022 15:34:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5917BC6334A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Dec 2022 15:34:34 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BB7B084F72;
 Thu, 15 Dec 2022 16:34:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671118473;
 bh=wFQTBUp2bvWtqpFXK5QE1N4kB9pSJUSHgi2hsHbCKbA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JyRHC7RItzj2DdJF8LVJfPlPGWS85F3UEkPdqICWXcRHqYPEjf8EedBkrKG3c80ly
 ytQCf7sGr2iWm6xxRjfYVhFBcSoHSvdEWZyD2RA2Iwzh0Bj72OWK7bVIzD7BqsI5bY
 /gvCRVaILrXOW7WGF50Ii32NxsL+L8kXmomfIZ6cDte0yn6+40DzB5PF2srf6aLgeC
 znyj/+MzMkGqNJY/TzgcjCiGCRuZgMRjRTk3z7cdMvo4Mwihtqqe+AcMgpd9vNu6+m
 ctpHnPYMgAn+FJzWDQVuIGtUGcgqd0LQGyi8XIO0SSm7e5dVFpN/rGTACo95UCqJLh
 eNbxiBg9vgrRA==
Message-ID: <0f4ca954-e36f-3dff-916d-f6ecbbbc782f@denx.de>
Date: Thu, 15 Dec 2022 15:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221215101547.1.Ic4654626494193d6dd4788d14fda0aae447783a5@changeid>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221215101547.1.Ic4654626494193d6dd4788d14fda0aae447783a5@changeid>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Simon Glass <sjg@chromium.org>,
 Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] fastboot: remove #ifdef CONFIG when it is
	possible
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 12/15/22 10:15, Patrick Delaunay wrote:
> Much of the fastboot code predates the introduction of Kconfig and
> has quite a few #ifdefs in it which is unnecessary now that we can use
> IS_ENABLED() et al.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>   cmd/fastboot.c                  |  35 +++++------
>   drivers/fastboot/fb_command.c   | 104 ++++++++++++--------------------
>   drivers/fastboot/fb_common.c    |  11 ++--
>   drivers/fastboot/fb_getvar.c    |  49 ++++++---------
>   drivers/usb/gadget/f_fastboot.c |   7 +--
>   include/fastboot.h              |  13 ----
>   net/fastboot.c                  |   8 +--
>   7 files changed, 82 insertions(+), 145 deletions(-)
> 
> diff --git a/cmd/fastboot.c b/cmd/fastboot.c
> index b498e4b22bb3..b94dbd548843 100644
> --- a/cmd/fastboot.c
> +++ b/cmd/fastboot.c
> @@ -19,8 +19,14 @@
>   static int do_fastboot_udp(int argc, char *const argv[],
>   			   uintptr_t buf_addr, size_t buf_size)
>   {
> -#if CONFIG_IS_ENABLED(UDP_FUNCTION_FASTBOOT)

Unrelated to this, don't we need to define Kconfig entries for 'config 
SPL_UDP_FUNCTION_FASTBOOT' and 'config TPL_UDP_FUNCTION_FASTBOOT' and 
the other macros tested in fastboot, so it would be correctly 
configurable in SPL ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
