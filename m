Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED83714D537
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:23:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5496C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:23:28 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F931C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:23:27 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 487PKV0zhPz1rY5L;
 Thu, 30 Jan 2020 03:23:26 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 487PKV0L9vz1qsnd;
 Thu, 30 Jan 2020 03:23:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id u-DEkKii6JHD; Thu, 30 Jan 2020 03:23:24 +0100 (CET)
X-Auth-Info: BDU/LflNVk3UPIjEALyst2bXONSkBP/dW0N2QSTBbJs=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 30 Jan 2020 03:23:24 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128101041.4.Ide537d091d8ee33f89ee50edad59ea237e517e42@changeid>
 <231eb0d9-9bf3-ac62-0177-f7ee6dfb644d@denx.de>
 <adb487b28fac45b6b147464b1bb53641@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <a7dcac3d-beaa-b641-e4f0-ab75622e7edd@denx.de>
Date: Thu, 30 Jan 2020 03:23:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <adb487b28fac45b6b147464b1bb53641@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: Antonio BORNEO <antonio.borneo@st.com>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gerald BAEZA <gerald.baeza@st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/9] ARM: dts: stm32mp1: move FDCAN to
	PLL4_R
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

On 1/29/20 5:51 PM, Patrick DELAUNAY wrote:
> Hi Marek,

Hi,

>> From: Marek Vasut <marex@denx.de>
>> Sent: mardi 28 janvier 2020 13:16
>>
>> On 1/28/20 10:11 AM, Patrick Delaunay wrote:
>>> From: Antonio Borneo <antonio.borneo@st.com>
>>>
>>> LTDC modifies the clock frequency to adapt it to the display. Such
>>> frequency change is not detected by the FDCAN driver that instead
>>> cache the value at probe and pretend to use it later.
>>>
>>> Keep the LTDC alone on PLL4_Q by moving the FDCAN to PLL4_R.
>>
>> Now this looks like a grisly workaround. Can you fix the LTDC driver to do
>> something sane on boards which didn't update bootloader yet ?
> 
> In fact it more a issue in the initial clock-tree used when I upstream the ST board the first time... based on our delivery v1.0.0
> 
> It is already corrected in downstream on v1.1.0:
> + For U-Boot = https://github.com/STMicroelectronics/u-boot/commit/d62f14dece32e41c2854b9ff44aca7b8384aa8a0
> + For TF-A = https://github.com/STMicroelectronics/arm-trusted-firmware/commit/9a24ceda6c3ba060d9acf2b26d069fedde9f0807
> 
> The LTDC/DSI need to set the pixel clock according the panel configuration and settings: it is normal and needed.
> 
> But If the pixel clock is shared with FDCAN, which expects that its input clock is fixed, an issue occur when the pixel clock change.

I understand the problem you are trying to solve.

What I think you are missing is that not everyone will update
ATF/U-Boot/Linux in lockstep. That is the problem you need to deal with
here.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
