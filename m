Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B37AF2157
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 23:05:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48037C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 22:05:00 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB649C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 22:04:58 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 477gZ218pjz1qqxw;
 Wed,  6 Nov 2019 23:04:58 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 477gZ20kCJz1qqkB;
 Wed,  6 Nov 2019 23:04:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 5cKLKVN2aIj7; Wed,  6 Nov 2019 23:04:57 +0100 (CET)
X-Auth-Info: 7FiTAg8kSuq4WC9OZsiqMFKXORGD+6wgZDA43Vy5zOo=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  6 Nov 2019 23:04:57 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-2-patrick.delaunay@st.com>
 <67fe66ee-4ee9-ceb4-c303-801605764bdb@denx.de>
 <899e7f46951f4a52a9e2a6453363f210@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <06128aa3-a114-fb20-73c6-7a16980c8dce@denx.de>
Date: Wed, 6 Nov 2019 22:55:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <899e7f46951f4a52a9e2a6453363f210@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>, Sven Schwermer <sven@svenschwermer.de>
Subject: Re: [Uboot-stm32] [RESEND PATCH 1/5] usb: host: dwc2: add phy
	support
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

On 11/6/19 6:40 PM, Patrick DELAUNAY wrote:
> Hi Marek,

Hi,

[...]

>>> +static int dwc2_shutdown_phy(struct udevice *dev) {
>>> +	struct dwc2_priv *priv = dev_get_priv(dev);
>>> +	int ret;
>>> +
>>> +	if (!generic_phy_valid(&priv->phy))
>>> +		return 0;
>>> +
>>> +	ret = generic_phy_power_off(&priv->phy);
>>> +	if (ret) {
>>> +		dev_err(dev, "failed to power off usb phy\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = generic_phy_exit(&priv->phy);
>>> +	if (ret) {
>>> +		dev_err(dev, "failed to power off usb phy\n");
>>
>> Shouldn't all those error prints be produced by the PHY subsystem ?
> 
> Perhaps... but it is not done today in phy u-class (only call ops).
> 
> I make the same level of trace than ./drivers/usb/dwc3/core.c
> as copy initially the phy support from this driver.

So this starts the duplication. Can you move it to the PHY subsystem
instead ?

>>> +		return ret;
>>
>> [...]
>>
>>> @@ -1339,6 +1398,8 @@ static int dwc2_usb_remove(struct udevice *dev)
>>>  	if (ret)
>>>  		return ret;
>>>
>>> +	dwc2_shutdown_phy(dev);
>>
>> This function returns a return value, but it's ignored here ?
> 
> Yes, even if the shutdown of the USB PHY failed, the USB dwc2
>  driver continues the procedure to release other ressources...

How can you safely release the rest of the resources if the PHY driver
didn't shut down? I suspect this might lead to some resource corruption, no?

> And the driver expects that the USB PHY will be available for next
> request/probe (recovery with phy reset for example).
> 
> I use the same logic than dwc3 driver in :
> source/drivers/usb/dwc3/dwc3-generic.c::dwc3_generic_remove()
> drivers/usb/host/xhci-dwc3.c::xhci_dwc3_remove()

dwc3_shutdown_phy() only ever returns 0 though.

-- 
Best regards,
Marek Vasut
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
