Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8803F2159
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 23:05:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A42A2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 22:05:03 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDB15C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 22:05:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 477gZ536fGz1qqxy;
 Wed,  6 Nov 2019 23:05:01 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 477gZ52vqSz1qqkB;
 Wed,  6 Nov 2019 23:05:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Od5459a1z0wI; Wed,  6 Nov 2019 23:05:00 +0100 (CET)
X-Auth-Info: Tg4L2m7IDx/qBEZd2Rpn40SmUT+S8LYidhGuCVpydq0=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  6 Nov 2019 23:05:00 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-4-patrick.delaunay@st.com>
 <d4a847ac-b675-6a85-4320-c4f3800c18b1@denx.de>
 <3e13407a0c24443fb5325318de75e357@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <5e90369b-c273-028e-ee27-bfd7249ae64e@denx.de>
Date: Wed, 6 Nov 2019 23:00:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3e13407a0c24443fb5325318de75e357@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>, Sven Schwermer <sven@svenschwermer.de>
Subject: Re: [Uboot-stm32] [RESEND PATCH 3/5] usb: host: dwc2: force reset
	assert
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

On 11/6/19 7:27 PM, Patrick DELAUNAY wrote:
> Hi,

Hi,

[...]

>>> diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c index
>>> 51023b0c2c..3086411fc4 100644
>>> --- a/drivers/usb/host/dwc2.c
>>> +++ b/drivers/usb/host/dwc2.c
>>> @@ -1149,6 +1149,8 @@ static int dwc2_reset(struct udevice *dev)
>>>  			return ret;
>>>  	}
>>>
>>> +	reset_assert_bulk(&priv->resets);
>>> +	udelay(2);
>>
>> Why is there a 2 uS delay ?
> 
> I think: no real reason to have 2 us....
> 
> It was jus a reasonable time to be sure that the device reset is correctly
> performed, the reset signal is propagated....
> 
> but perhaps that no delay is working...
> I can test without delay if you prefer...
> 
> PS: I use the same value than DWC2 gadget driver:
>        Added by my commit c2c74f97afff

Isn't there a way to poll the IP to determine whether the reset completed ?

[...]

-- 
Best regards,
Marek Vasut
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
