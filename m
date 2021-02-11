Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CED31895E
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Feb 2021 12:26:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 979BBC57B52;
	Thu, 11 Feb 2021 11:26:44 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFFD0C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Feb 2021 11:26:40 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DbvTq4RXNz1ryp6;
 Thu, 11 Feb 2021 12:26:39 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DbvTq3x1rz1qqkn;
 Thu, 11 Feb 2021 12:26:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 8TQlOTTtX4bM; Thu, 11 Feb 2021 12:26:38 +0100 (CET)
X-Auth-Info: iOlj7qPL/MhfoX0mXoBd/BUjWFKpZcjpAsfk7TDH1Xo=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 11 Feb 2021 12:26:38 +0100 (CET)
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20210210141759.5641-1-patrice.chotard@foss.st.com>
 <ec67a889-1639-5652-2766-aeb0badb70d3@denx.de>
 <7b665909-b1d6-323c-f6a4-4221fca616c7@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <7b1e8706-8fa3-44e3-4bed-ff418e9d803d@denx.de>
Date: Thu, 11 Feb 2021 12:26:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7b665909-b1d6-323c-f6a4-4221fca616c7@foss.st.com>
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

On 2/11/21 10:58 AM, Patrice CHOTARD wrote:
> Hi Marek
> 
> On 2/10/21 3:26 PM, Marek Vasut wrote:
>> On 2/10/21 3:17 PM, Patrice Chotard wrote:
>>> Since commit 8745b9ebccae ("usb: gadget: add super speed support")
>>> ums was no more functional on platform which use dwc2_udc_otg driver.
>>>
>>> Remove the speed test in dwc2_gadget_start() to fix it.
>>> Tested on stm32mp157c-ev1 board.
>>
>> Isn't the speed check correct though ?
> 
> I am not sure this speed test is needed.
> 
>>
>> What is really going on when this fails ?
> 
> 
> Since 8745b9ebccae ("usb: gadget: add super speed support"),
> driver->speed is now set to USB_SPEED_SUPER in drivers/usb/gadget/composite.c
> 
> and this forbids dwc2_udc_otg.c to be registered.

That sounds like a bug in the USB gadget/otg core , no ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
