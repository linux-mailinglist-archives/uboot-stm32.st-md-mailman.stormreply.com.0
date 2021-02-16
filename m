Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E9A31D1E4
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Feb 2021 22:15:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 568AAC5718A;
	Tue, 16 Feb 2021 21:15:20 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F47AC32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Feb 2021 21:15:17 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DgDJh2LjSz1rtZ9;
 Tue, 16 Feb 2021 22:15:16 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DgDJh1n0Yz1qqkk;
 Tue, 16 Feb 2021 22:15:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id RcjbhJGX19Xl; Tue, 16 Feb 2021 22:15:15 +0100 (CET)
X-Auth-Info: yXoKb64yi1/0oTS8r1PEhchg+4t9byKctDHhw2x7Ylo=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 16 Feb 2021 22:15:14 +0100 (CET)
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20210210141759.5641-1-patrice.chotard@foss.st.com>
 <ec67a889-1639-5652-2766-aeb0badb70d3@denx.de>
 <7b665909-b1d6-323c-f6a4-4221fca616c7@foss.st.com>
 <7b1e8706-8fa3-44e3-4bed-ff418e9d803d@denx.de>
 <457ca91c-8fd3-929c-be24-90b7d0d87670@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <df8a5842-0f25-35b2-c7fc-a767e9f493d8@denx.de>
Date: Tue, 16 Feb 2021 22:15:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <457ca91c-8fd3-929c-be24-90b7d0d87670@foss.st.com>
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

On 2/16/21 6:32 PM, Patrice CHOTARD wrote:
> Hi Marek

Hi,

> On 2/11/21 12:26 PM, Marek Vasut wrote:
>> On 2/11/21 10:58 AM, Patrice CHOTARD wrote:
>>> Hi Marek
>>>
>>> On 2/10/21 3:26 PM, Marek Vasut wrote:
>>>> On 2/10/21 3:17 PM, Patrice Chotard wrote:
>>>>> Since commit 8745b9ebccae ("usb: gadget: add super speed support")
>>>>> ums was no more functional on platform which use dwc2_udc_otg driver.
>>>>>
>>>>> Remove the speed test in dwc2_gadget_start() to fix it.
>>>>> Tested on stm32mp157c-ev1 board.
>>>>
>>>> Isn't the speed check correct though ?
>>>
>>> I am not sure this speed test is needed.
>>>
>>>>
>>>> What is really going on when this fails ?
>>>
>>>
>>> Since 8745b9ebccae ("usb: gadget: add super speed support"),
>>> driver->speed is now set to USB_SPEED_SUPER in drivers/usb/gadget/composite.c
>>>
>>> and this forbids dwc2_udc_otg.c to be registered.
>>
>> That sounds like a bug in the USB gadget/otg core , no ?
> 
> After analysis, if i correctly understood, the speed test done in both usb_gadget_register_driver()
> and in dwc2_gadget_start() in dwc2_udc_otg.c is too restrictive and accepts only gadget driver with
> max speed equal to USB_SPEED_FULL or USB_SPEED_HIGH.

That should be fine for the DWC2 IP, which is LS/FS/HS.

> So all gadget driver with max speed set to higher speed than USB_SPEED_HIGH (USB_SPEED_SUPER in case of
> composite gadget driver) are not allowed, which is wrong.
> 
> This test should check that the gadget driver max speed is higher or equal to the min speed supported by
> dwc2_udc_otg driver, ie USB_SPEED_FULL.
> 
> So the test should be :
> 
> @@ -247,12 +247,11 @@ int usb_gadget_register_driver(struct usb_gadget_driver *driver)
>   	unsigned long flags = 0;
>   
>   	debug_cond(DEBUG_SETUP != 0, "%s: %s\n", __func__, "no name");
>   
>   	if (!driver
> -	    || (driver->speed != USB_SPEED_FULL
> -		&& driver->speed != USB_SPEED_HIGH)
> +	    || driver->speed < USB_SPEED_FULL
>   	    || !driver->bind || !driver->disconnect || !driver->setup)
>   		return -EINVAL;
>   	if (!dev)
>   		return -ENODEV;
>   	if (dev->driver)
> @@ -319,12 +318,11 @@ static int dwc2_gadget_start(struct usb_gadget *g,
>   	struct dwc2_udc *dev = the_controller;
>   
>   	debug_cond(DEBUG_SETUP != 0, "%s: %s\n", __func__, "no name");
>   
>   	if (!driver ||
> -	    (driver->speed != USB_SPEED_FULL &&
> -	     driver->speed != USB_SPEED_HIGH) ||
> +	    driver->speed < USB_SPEED_FULL ||

The DWC2 can't operate in LS gadget mode , i.e. emulate some old 
keyboard ? Maybe what you want is driver->speed > USB_SPEED_HIGH instead ?

>   	    !driver->bind || !driver->disconnect || !driver->setup)
>   		return -EINVAL;
>   
>   	if (!dev)
> 
> I you are agree, i will send a v2 with this.

Yes please. But you really want to get AB/RB from Lukasz, since he does 
the gadget stuff.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
