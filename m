Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE012FACFD
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Jan 2021 22:55:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A21D7C32EA8;
	Mon, 18 Jan 2021 21:55:14 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD5B6C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jan 2021 21:55:11 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10ILsn5J120917;
 Mon, 18 Jan 2021 15:54:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1611006889;
 bh=psk1jTcAxV5pEJdyHZ3pXrPtetyhKO8hqQ6BU5wE1Vg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=BZmzs1KRzU5wQH8EoLU0naHZesfb7Kfj44ODZsVRSuz2m124u+HsO6V9TNSbmBJ5D
 T4j4/5AzSBaeZR3vQHqun8rtqH0DtFGAg2QE1Uz5ym2k8GLfs6hlAkHn3qH9nmptL3
 xpkKLiLU3/wP+IfITUiLjUdU7NfzpjpY+mKGwyrs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10ILsnut068688
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 18 Jan 2021 15:54:49 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 18
 Jan 2021 15:54:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 18 Jan 2021 15:54:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10ILsl7V078989;
 Mon, 18 Jan 2021 15:54:48 -0600
Date: Tue, 19 Jan 2021 03:24:47 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20210118215431.2oky32uppehqqe4u@ti.com>
References: <20210115140500.846307-1-sjg@chromium.org>
 <20210115140500.846307-4-sjg@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115140500.846307-4-sjg@chromium.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Bin Meng <bmeng.cn@gmail.com>, Walter Lozano <walter.lozano@collabora.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Heiko Schocher <hs@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dario Binacchi <dariobin@libero.it>
Subject: Re: [Uboot-stm32] [PATCH 03/15] dm: gpio: Rename get_dir_flags()
 method to get_flags()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 15/01/21 07:04AM, Simon Glass wrote:
> It is more useful to be able to read all the flags, not just the direction
> ones. In fact this is what the STM32 driver does. Update the method name
> to reflect this.
> 
> Tweak the docs a little and use 'flagsp' as the return argument, as is
> common in driver model, to indicate it returns a value.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  drivers/gpio/gpio-uclass.c      | 30 +++++++++++++++---------------
>  drivers/gpio/sandbox.c          |  8 ++++----
>  drivers/gpio/stm32_gpio.c       |  8 ++++----
>  drivers/pinctrl/pinctrl-stmfx.c |  8 ++++----
>  include/asm-generic/gpio.h      | 13 +++++++------
>  5 files changed, 34 insertions(+), 33 deletions(-)
> 

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments India
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
