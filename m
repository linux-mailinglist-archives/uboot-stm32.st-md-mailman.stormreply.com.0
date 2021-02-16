Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5AF31CF17
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Feb 2021 18:32:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7357BC5718A;
	Tue, 16 Feb 2021 17:32:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97897C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Feb 2021 17:32:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11GGbtIR003657; Tue, 16 Feb 2021 18:32:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=JoJUIvIyAbjv4cDHLYyI43gylR6Pqmys30//jyxbX/8=;
 b=OfCgii0uWdPZ0vMAq50hlMVIlqcGiyyjcDH1AOrzAt4v6XbkpPfsAnQTH5es93XWXrI3
 obsZV7W6aP0/rXTtbHYQzirxbS+Mgm0uNBtdE8iNIRSrik4jlqnVNCimqN8KuJ8vrC69
 a9+1ZIY5XF1PLSv8NatbMBUkb3YyPLe3KvBtNJH6znijZ+v5/WAesucd68jfvxhuDwca
 L41R3anNfXPauIa8zB8avTtrPwK4bV4xA/XP9CNid4cMTvsFHqBXqAtZMPiz+5dR8TFU
 w8eAEo+kecdT9Pa3HX4Q0PaX7yrpgfLqvQ416ucbjcmhtqH1I65UXcGjyQQyKCQXTy1+ Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p547hck5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 18:32:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A86810002A;
 Tue, 16 Feb 2021 18:32:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5FBA212051;
 Tue, 16 Feb 2021 18:32:33 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Feb
 2021 18:32:33 +0100
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20210210141759.5641-1-patrice.chotard@foss.st.com>
 <ec67a889-1639-5652-2766-aeb0badb70d3@denx.de>
 <7b665909-b1d6-323c-f6a4-4221fca616c7@foss.st.com>
 <7b1e8706-8fa3-44e3-4bed-ff418e9d803d@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <457ca91c-8fd3-929c-be24-90b7d0d87670@foss.st.com>
Date: Tue, 16 Feb 2021 18:32:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7b1e8706-8fa3-44e3-4bed-ff418e9d803d@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-16_07:2021-02-16,
 2021-02-16 signatures=0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Marek

On 2/11/21 12:26 PM, Marek Vasut wrote:
> On 2/11/21 10:58 AM, Patrice CHOTARD wrote:
>> Hi Marek
>>
>> On 2/10/21 3:26 PM, Marek Vasut wrote:
>>> On 2/10/21 3:17 PM, Patrice Chotard wrote:
>>>> Since commit 8745b9ebccae ("usb: gadget: add super speed support")
>>>> ums was no more functional on platform which use dwc2_udc_otg driver.
>>>>
>>>> Remove the speed test in dwc2_gadget_start() to fix it.
>>>> Tested on stm32mp157c-ev1 board.
>>>
>>> Isn't the speed check correct though ?
>>
>> I am not sure this speed test is needed.
>>
>>>
>>> What is really going on when this fails ?
>>
>>
>> Since 8745b9ebccae ("usb: gadget: add super speed support"),
>> driver->speed is now set to USB_SPEED_SUPER in drivers/usb/gadget/composite.c
>>
>> and this forbids dwc2_udc_otg.c to be registered.
> 
> That sounds like a bug in the USB gadget/otg core , no ?

After analysis, if i correctly understood, the speed test done in both usb_gadget_register_driver() 
and in dwc2_gadget_start() in dwc2_udc_otg.c is too restrictive and accepts only gadget driver with 
max speed equal to USB_SPEED_FULL or USB_SPEED_HIGH.

So all gadget driver with max speed set to higher speed than USB_SPEED_HIGH (USB_SPEED_SUPER in case of 
composite gadget driver) are not allowed, which is wrong.

This test should check that the gadget driver max speed is higher or equal to the min speed supported by 
dwc2_udc_otg driver, ie USB_SPEED_FULL.

So the test should be :

@@ -247,12 +247,11 @@ int usb_gadget_register_driver(struct usb_gadget_driver *driver)
 	unsigned long flags = 0;
 
 	debug_cond(DEBUG_SETUP != 0, "%s: %s\n", __func__, "no name");
 
 	if (!driver
-	    || (driver->speed != USB_SPEED_FULL
-		&& driver->speed != USB_SPEED_HIGH)
+	    || driver->speed < USB_SPEED_FULL
 	    || !driver->bind || !driver->disconnect || !driver->setup)
 		return -EINVAL;
 	if (!dev)
 		return -ENODEV;
 	if (dev->driver)
@@ -319,12 +318,11 @@ static int dwc2_gadget_start(struct usb_gadget *g,
 	struct dwc2_udc *dev = the_controller;
 
 	debug_cond(DEBUG_SETUP != 0, "%s: %s\n", __func__, "no name");
 
 	if (!driver ||
-	    (driver->speed != USB_SPEED_FULL &&
-	     driver->speed != USB_SPEED_HIGH) ||
+	    driver->speed < USB_SPEED_FULL ||
 	    !driver->bind || !driver->disconnect || !driver->setup)
 		return -EINVAL;
 
 	if (!dev)

I you are agree, i will send a v2 with this.

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
