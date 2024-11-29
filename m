Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9229DEC15
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 Nov 2024 19:26:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEE6FC71289;
	Fri, 29 Nov 2024 18:26:21 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DC67C6DD6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2024 18:26:14 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1AEFF89452;
 Fri, 29 Nov 2024 19:26:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1732904774;
 bh=uB3Bws2nhjgEvGA5B3O9X479bxoTIuu7McBcpqw7xfU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ruxMfZNaM/X8mpNnfH9pQbreG9p7BoIIljCiU1qAlcVg8Sdtf+YksmWztjXUim3kQ
 nxL0EvLiftGBR/sDVpXk/XwN/k+z4yPW1pfXMLw7x8+8smVPh/mcm7bseQb64WZIQX
 lUVYEu0aRipQhEdh8KRgi1ebeq7ufR8o1gVsTzsIBxdFzw+EI4xQLRbdg97WMe+gox
 nrZh6ni48xIvzboztnH2J7JSRgLOnq39xz4pbOlxllnhXgZdS5YY+wbWoGTYTea08X
 jERgj5K40ZOo2PcDeelw/8xl31J+nkBl8M14d2571SenArmAcPzm1Z/iHpH0ENOGDN
 S40Sk2pE/+iLw==
Message-ID: <98fb1df2-b5ba-4ccf-97c8-d0555c1cdb61@denx.de>
Date: Fri, 29 Nov 2024 18:35:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20241129124617.436381-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241129124617.436381-1-patrice.chotard@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: gadget: f_mass_storage: Add
 schedule() in sleep_thread()
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

On 11/29/24 1:46 PM, Patrice Chotard wrote:
> In case "ums" command is used on platforms which don't implement
> g_dnl_board_usb_cable_connected() and USB cable is not connected,
> we stay inside sleep_thread() forever and watchdog is triggered.
> 
> Add schedule() call to avoid this issue.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>   drivers/usb/gadget/f_mass_storage.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/f_mass_storage.c b/drivers/usb/gadget/f_mass_storage.c
> index ffe1ae6eb73..6dc73ef447b 100644
> --- a/drivers/usb/gadget/f_mass_storage.c
> +++ b/drivers/usb/gadget/f_mass_storage.c
> @@ -680,6 +680,7 @@ static int sleep_thread(struct fsg_common *common)
>   				return -EIO;
>   
>   			k = 0;
> +			schedule();
>   		}
>   
>   		dm_usb_gadget_handle_interrupts(udcdev);

Shouldn't that schedule() be placed right before/after 
dm_usb_gadget_handle_interrupts() ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
