Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E77F2158
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 23:05:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F48AC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 22:05:01 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 460A4C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 22:05:00 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 477gZ36bQ2z1qqxn;
 Wed,  6 Nov 2019 23:04:59 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 477gZ35VVnz1qqkB;
 Wed,  6 Nov 2019 23:04:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id GvQPfMy8Sg1U; Wed,  6 Nov 2019 23:04:58 +0100 (CET)
X-Auth-Info: wvd8gSx+Lg1U+XGsy3gHYdm2d+wilx4mnL9q0qZWmCI=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  6 Nov 2019 23:04:58 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-3-patrick.delaunay@st.com>
 <77804378-5ea1-4b37-cb54-8fce77351d9b@denx.de>
 <fd4aa0d388ed49269628a7f8cc9a75d0@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <821d870a-c2ab-7a3a-72a7-83832b35b8ab@denx.de>
Date: Wed, 6 Nov 2019 22:59:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fd4aa0d388ed49269628a7f8cc9a75d0@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>,
 "simon.k.r.goldschmidt@gmail.com" <simon.k.r.goldschmidt@gmail.com>,
 Sven Schwermer <sven@svenschwermer.de>, Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [RESEND PATCH 2/5] usb: host: dwc2: add support
	for clk
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

On 11/6/19 7:03 PM, Patrick DELAUNAY wrote:
> Hi Marek,

Hi,

[...]

>> Same question as with the PHY -- is there now a mandatory dependency on the
>> DM CLK ?
> 
> No I don't think.
> 
> Because the clk function are also stubbed in ./include/clk.h
> CONFIG_IS_ENABLED(CLK)
> 
> But I don't 100% sure as I don't tested it on one platform without DM_CLK...

SoCFPGA is one of those, so +CC Simon.

>> [...]
>>
>>> @@ -1403,6 +1429,7 @@ static int dwc2_usb_remove(struct udevice *dev)
>>>  	dwc2_uninit_common(priv->regs);
>>>
>>>  	reset_release_bulk(&priv->resets);
>>> +	clk_release_bulk(&priv->clks);
>>
>> Shouldn't there be some clk_...disable() here ?
> 
> I don't like make clk_....disable() in U-Boot remove function because the clock
> u-class don't managed a counter for each clock user (as it is done in kernel).
> 
> We have always a risk to deactivate a clock needed by a several device:
> each driver (A&B) enable a common clock with U-Boot clock function, 
> but the first clock disable (A) really deactivate the clock even it is still needed
> by the other driver (B)

But if you don't disable the clock in .remove callback, the clock are
left running and that might cause other problems.

Are there such systems which share single clock enable bit between
multiple DWC2 IPs ?

> I use the same logical than dwc3 driver: clk_disable_bulk is not called.

I suspect that driver might need fixing.

[...]

-- 
Best regards,
Marek Vasut
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
