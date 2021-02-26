Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A54E83263CB
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Feb 2021 15:10:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58A21C3FADC;
	Fri, 26 Feb 2021 14:10:25 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76A9DC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 14:10:23 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id o10so1101891wmc.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 06:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3krQ2FXX4JH8brX+r4K1F7rKkXsLPCfJRE+dU8ljq5A=;
 b=DprKHIFqdFgY2BPx7b/QcT+0XqZcYf38ifnDa2iFo9Bf2psEvetxKbjr/9ib0DHQnP
 nR+OoHl+lveomHdWYmeZLdXKgwerbko0SVrgGzNsS4yLw8B+WI4N56wNw4BI5wN2/oNw
 LwYkE5tMX4j94BwGr15ST6l0J1zFrKVgNfO3G6/Zl4U/FQfr0/9Z9ntQILWxh/D58Tu5
 4r5h6ui9F9WPI1nkX7noN1IApU8YvCVils9Hf4hNN2ex5pDRL9DFUuP27bbVHhh2PT+2
 lZd7RMXHYsI0Dqffp574Xdv6jbVSFVzq2vN5v1eFs4Q/OLR9lFhdzUyLHttMNgNfCMK+
 C3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3krQ2FXX4JH8brX+r4K1F7rKkXsLPCfJRE+dU8ljq5A=;
 b=HozkCbo0QJg2MEoL279LSH8xHIHNy591fTd4pPsDxCglZHxQ682OCSmjyS0/z1J/9r
 4mTflGH2br7Fd8PmhtB9+nI8XTccXyjtusF/dkqB20FzjeXgFUv5RUMDaEFEVo+xGHVw
 +AccV9mD1WXnvXwvAq/6k2AMaeTWvOoe2u79gVeAw1ob2xaQSETaudfprUBOw7Jm1nvA
 3joArk/ws1xKIER4NAdGjeexyrQuFdT+Tawzhs2inAFMItYl9vgmOzwaZNATnQH95O8J
 TmUR1tcWpeFzPkp8OR1NYB7idmItgm1DIdfOF9t3vU960ElET6t42KI14ETU3AdnTCeQ
 y/kQ==
X-Gm-Message-State: AOAM531Q2USFBa9pO9/nWqJKN9XVFLBIsh9UlzwXDp844czWd2uTMnRD
 h70E8KIhJ5iAYO66sYHmT1Buqw==
X-Google-Smtp-Source: ABdhPJxZHLjMojU5PNb1Ahpn906ISZz7HgxR0A5f78avToqlZYYUj0XWpnLj8m5vVhv0RWC0Bn9KVg==
X-Received: by 2002:a1c:31c1:: with SMTP id x184mr3023719wmx.109.1614348622851; 
 Fri, 26 Feb 2021 06:10:22 -0800 (PST)
Received: from [10.1.3.24] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v17sm13590489wru.85.2021.02.26.06.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 06:10:22 -0800 (PST)
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20210217091727.23923-1-patrice.chotard@foss.st.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <98a10558-98d2-46f8-6a21-c5b4eeca48b6@baylibre.com>
Date: Fri, 26 Feb 2021 15:10:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217091727.23923-1-patrice.chotard@foss.st.com>
Content-Language: en-US
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2] usb: gadget: dwc2_udc_otg: Fix
 dwc2_gadget_start() and usb_gadget_register_driver()
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

On 17/02/2021 10:17, Patrice Chotard wrote:
> Since commit 8745b9ebccae ("usb: gadget: add super speed support")
> ums was no more functional on platform which use dwc2_udc_otg driver.
> 
> This was due to a too restrictive test which checked that the gadget
> driver speed was either FS or HS.
> 
> So all gadget driver with max speed set to speed higher than
> HS (SS in case of composite gadget driver in our case) are not
> allowed, which is wrong.
> 
> Update the speed test in usb_gadget_register_driver() and in
> dwc2_gadget_start() to allow all gadget driver speed equal or higher
> than FS.
> 
> Tested on stm32mp157c-ev1 board.
> 
> Fixes: c791c8431c34 ("usb: dwc2: convert driver to DM_USB_GADGET")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> ---
> 
> Changes in v2:
>  - update gadget driver speed test in usb_gadget_register_driver()
>    and in dwc2_gadget_start() instead of removing it completely.
> 
>  drivers/usb/gadget/dwc2_udc_otg.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
> index ecac80fc11..2f31814442 100644
> --- a/drivers/usb/gadget/dwc2_udc_otg.c
> +++ b/drivers/usb/gadget/dwc2_udc_otg.c
> @@ -248,9 +248,7 @@ int usb_gadget_register_driver(struct usb_gadget_driver *driver)
>  
>  	debug_cond(DEBUG_SETUP != 0, "%s: %s\n", __func__, "no name");
>  
> -	if (!driver
> -	    || (driver->speed != USB_SPEED_FULL
> -		&& driver->speed != USB_SPEED_HIGH)
> +	if (!driver || driver->speed < USB_SPEED_FULL
>  	    || !driver->bind || !driver->disconnect || !driver->setup)
>  		return -EINVAL;
>  	if (!dev)
> @@ -320,9 +318,7 @@ static int dwc2_gadget_start(struct usb_gadget *g,
>  
>  	debug_cond(DEBUG_SETUP != 0, "%s: %s\n", __func__, "no name");
>  
> -	if (!driver ||
> -	    (driver->speed != USB_SPEED_FULL &&
> -	     driver->speed != USB_SPEED_HIGH) ||
> +	if (!driver || driver->speed < USB_SPEED_FULL ||
>  	    !driver->bind || !driver->disconnect || !driver->setup)
>  		return -EINVAL;
>  
> 

Thx for the fix !

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
