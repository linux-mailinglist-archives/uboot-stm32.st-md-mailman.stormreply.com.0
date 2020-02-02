Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6586214FE9E
	for <lists+uboot-stm32@lfdr.de>; Sun,  2 Feb 2020 18:28:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DCA3C36B0B
	for <lists+uboot-stm32@lfdr.de>; Sun,  2 Feb 2020 17:28:12 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F7B4C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Feb 2020 17:28:10 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 489dG173SWz1rY5Z;
 Sun,  2 Feb 2020 18:28:09 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 489dG16PJnz1qrmb;
 Sun,  2 Feb 2020 18:28:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id rtolPfOq036c; Sun,  2 Feb 2020 18:28:07 +0100 (CET)
X-Auth-Info: w2a4Qck5ZFwKVvri6d6ndZ7y0vVOeDUNFyotvtCxPqI=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun,  2 Feb 2020 18:28:07 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128101041.4.Ide537d091d8ee33f89ee50edad59ea237e517e42@changeid>
 <231eb0d9-9bf3-ac62-0177-f7ee6dfb644d@denx.de>
 <adb487b28fac45b6b147464b1bb53641@SFHDAG6NODE3.st.com>
 <a7dcac3d-beaa-b641-e4f0-ab75622e7edd@denx.de>
 <357d83958e34432bb052af1509bc2487@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <b2227c18-e343-4683-6def-47eb5ab82031@denx.de>
Date: Sun, 2 Feb 2020 18:28:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <357d83958e34432bb052af1509bc2487@SFHDAG6NODE3.st.com>
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

On 1/31/20 9:15 AM, Patrick DELAUNAY wrote:
> Hi Marek,

Hi,

>> From: Marek Vasut <marex@denx.de>
>> Sent: jeudi 30 janvier 2020 03:23
>>
>> On 1/29/20 5:51 PM, Patrick DELAUNAY wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>>> From: Marek Vasut <marex@denx.de>
>>>> Sent: mardi 28 janvier 2020 13:16
>>>>
>>>> On 1/28/20 10:11 AM, Patrick Delaunay wrote:
>>>>> From: Antonio Borneo <antonio.borneo@st.com>
>>>>>
>>>>> LTDC modifies the clock frequency to adapt it to the display. Such
>>>>> frequency change is not detected by the FDCAN driver that instead
>>>>> cache the value at probe and pretend to use it later.
>>>>>
>>>>> Keep the LTDC alone on PLL4_Q by moving the FDCAN to PLL4_R.
>>>>
>>>> Now this looks like a grisly workaround. Can you fix the LTDC driver
>>>> to do something sane on boards which didn't update bootloader yet ?
>>>
>>> In fact it more a issue in the initial clock-tree used when I upstream
>>> the ST board the first time... based on our delivery v1.0.0
>>>
>>> It is already corrected in downstream on v1.1.0:
>>> + For U-Boot =
>>> + https://github.com/STMicroelectronics/u-boot/commit/d62f14dece32e41c
>>> + 2854b9ff44aca7b8384aa8a0 For TF-A =
>>> + https://github.com/STMicroelectronics/arm-trusted-firmware/commit/9a
>>> + 24ceda6c3ba060d9acf2b26d069fedde9f0807
>>>
>>> The LTDC/DSI need to set the pixel clock according the panel configuration and
>> settings: it is normal and needed.
>>>
>>> But If the pixel clock is shared with FDCAN, which expects that its input clock is
>> fixed, an issue occur when the pixel clock change.
>>
>> I understand the problem you are trying to solve.
>>
>> What I think you are missing is that not everyone will update ATF/U-Boot/Linux in
>> lockstep. That is the problem you need to deal with here.
> 
> I understood the possible issue and I hope that I will be not the case
> (at least for the ST Microelectronics boards).

Do I understand it correctly that you expect the customers who buy the
ST chip to update bootloader in lockstep with the kernel in systems
which are deployed today ?

No, this does not work. If you have a working bootloader and your kernel
fails to start, that is something you can recover from, If your
bootloader fails to start and you need to dig an embedded system buried
who-knows-where or recall a lot of systems because of a failed
bootloader update, that would be a disaster.

> We are aware of the possible issue to fixe these clocks in first stage bootloader but after a long
> debate, we don't found a better solution, with the constraints:
> - M4 firmware require clock initialization before start and it can be loaded by U-Boot
> - clock tree is generated by CubeMX tools which generate device tree (for bootloaders and kernel)
> - "assigned-clock" management in Linux kernel could lead us to a race condition for shared clock
> 
> We spent a long time to found a clock tree which respect all the constraints of the SOC
> before to our first release v1.0 and before I upstream the stm32mp1 support in U-Boot.
> 
> Then I wait a year before to upstream the patches on clock tree initialization (and the second
> release v1.2) to avoid too many iteration.
>  And this patch on FDCAN is the only issue found on the initial clock tree.
> 
> Today I think (hope?) it will be the last patch on this part.

You will keep finding clock issues and no , this will not be the last
patch which fixes a clock issue.

So what solution is there for those who can only update the kernel ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
