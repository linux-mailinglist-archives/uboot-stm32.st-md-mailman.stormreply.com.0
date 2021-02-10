Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3522316910
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Feb 2021 15:26:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49BCEC57B52;
	Wed, 10 Feb 2021 14:26:06 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E1EDC5718A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Feb 2021 14:26:04 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DbMWH47M4z1ryY1;
 Wed, 10 Feb 2021 15:26:03 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DbMWH3GDhz1t6px;
 Wed, 10 Feb 2021 15:26:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id vnI_re1vPoMh; Wed, 10 Feb 2021 15:26:02 +0100 (CET)
X-Auth-Info: /UKH2W6ZtODI5BnX3fT0JdDhZeN8SQZgquKb9YMnTDo=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 10 Feb 2021 15:26:02 +0100 (CET)
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20210210141759.5641-1-patrice.chotard@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <ec67a889-1639-5652-2766-aeb0badb70d3@denx.de>
Date: Wed, 10 Feb 2021 15:26:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210141759.5641-1-patrice.chotard@foss.st.com>
Content-Language: en-US
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] usb: gadget: dwc2_udc_otg: Fix
	dwc2_gadget_start()
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

On 2/10/21 3:17 PM, Patrice Chotard wrote:
> Since commit 8745b9ebccae ("usb: gadget: add super speed support")
> ums was no more functional on platform which use dwc2_udc_otg driver.
> 
> Remove the speed test in dwc2_gadget_start() to fix it.
> Tested on stm32mp157c-ev1 board.

Isn't the speed check correct though ?

What is really going on when this fails ?

> Fixes: c791c8431c34 ("usb: dwc2: convert driver to DM_USB_GADGET")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>   drivers/usb/gadget/dwc2_udc_otg.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
> index e3871e381e..4f3d761eb1 100644
> --- a/drivers/usb/gadget/dwc2_udc_otg.c
> +++ b/drivers/usb/gadget/dwc2_udc_otg.c
> @@ -248,10 +248,7 @@ int usb_gadget_register_driver(struct usb_gadget_driver *driver)
>   
>   	debug_cond(DEBUG_SETUP != 0, "%s: %s\n", __func__, "no name");
>   
> -	if (!driver
> -	    || (driver->speed != USB_SPEED_FULL
> -		&& driver->speed != USB_SPEED_HIGH)
> -	    || !driver->bind || !driver->disconnect || !driver->setup)
> +	if (!driver || !driver->bind || !driver->disconnect || !driver->setup)
>   		return -EINVAL;
>   	if (!dev)
>   		return -ENODEV;
> @@ -320,10 +317,7 @@ static int dwc2_gadget_start(struct usb_gadget *g,
>   
>   	debug_cond(DEBUG_SETUP != 0, "%s: %s\n", __func__, "no name");
>   
> -	if (!driver ||
> -	    (driver->speed != USB_SPEED_FULL &&
> -	     driver->speed != USB_SPEED_HIGH) ||
> -	    !driver->bind || !driver->disconnect || !driver->setup)
> +	if (!driver || !driver->bind || !driver->disconnect || !driver->setup)
>   		return -EINVAL;
>   
>   	if (!dev)
> 


[...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
