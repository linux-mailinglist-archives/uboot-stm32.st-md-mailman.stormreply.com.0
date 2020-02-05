Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 558FB152531
	for <lists+uboot-stm32@lfdr.de>; Wed,  5 Feb 2020 04:17:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7C1CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  5 Feb 2020 03:17:20 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B693EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2020 03:17:19 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48C6Dt1jQJz1qqlD;
 Wed,  5 Feb 2020 04:17:18 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48C6Dt1759z1qxyp;
 Wed,  5 Feb 2020 04:17:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id l_1cIBcDYFtg; Wed,  5 Feb 2020 04:17:16 +0100 (CET)
X-Auth-Info: +VpaffhL7f/fPlnVF9A5MZLbxghyHT7USAhOh8wu/dY=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  5 Feb 2020 04:17:16 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128101041.4.Ide537d091d8ee33f89ee50edad59ea237e517e42@changeid>
 <231eb0d9-9bf3-ac62-0177-f7ee6dfb644d@denx.de>
 <adb487b28fac45b6b147464b1bb53641@SFHDAG6NODE3.st.com>
 <a7dcac3d-beaa-b641-e4f0-ab75622e7edd@denx.de>
 <357d83958e34432bb052af1509bc2487@SFHDAG6NODE3.st.com>
 <b2227c18-e343-4683-6def-47eb5ab82031@denx.de>
 <64487d994ae046898418881ad86b1039@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <d3651bdd-be44-51f1-6a91-707695491209@denx.de>
Date: Wed, 5 Feb 2020 03:23:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <64487d994ae046898418881ad86b1039@SFHDAG6NODE3.st.com>
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

On 2/4/20 2:16 PM, Patrick DELAUNAY wrote:
> Hi Marek

Hello Patrick,

[...]

>>>> What I think you are missing is that not everyone will update
>>>> ATF/U-Boot/Linux in lockstep. That is the problem you need to deal with here.
>>>
>>> I understood the possible issue and I hope that I will be not the case
>>> (at least for the ST Microelectronics boards).
>>
>> Do I understand it correctly that you expect the customers who buy the ST chip to
>> update bootloader in lockstep with the kernel in systems which are deployed today
>> ?
>>
>> No, this does not work. If you have a working bootloader and your kernel fails to
>> start, that is something you can recover from, If your bootloader fails to start and
>> you need to dig an embedded system buried who-knows-where or recall a lot of
>> systems because of a failed bootloader update, that would be a disaster.
> 
> No, we don't expect a bootloader updater for all the current customers.
>  
> We found this weakness in the clock tree configuration used in ST board 
> after our first delivery and we have already provide the patch (in downstream)
> to clients. So we hope they already use this correction in the  bootloaders
> used in current products.

Since it's not in mainline, they do not. Unless you expect that users of
the STM32MP1 will use some random downstream fork of vendoruboot.

> However this clock issue only occur for few case, when FDCAN and LTDC are 
> used in parallel on the boards and only if LTDC change the pixel clock.
> 
> So it should be occurs only for few customer and the issue is not blocking for
> most of the cases.
> 
>>> We are aware of the possible issue to fixe these clocks in first stage
>>> bootloader but after a long debate, we don't found a better solution, with the
>> constraints:
>>> - M4 firmware require clock initialization before start and it can be
>>> loaded by U-Boot
>>> - clock tree is generated by CubeMX tools which generate device tree
>>> (for bootloaders and kernel)
>>> - "assigned-clock" management in Linux kernel could lead us to a race
>>> condition for shared clock
>>>
>>> We spent a long time to found a clock tree which respect all the
>>> constraints of the SOC before to our first release v1.0 and before I upstream the
>> stm32mp1 support in U-Boot.
>>>
>>> Then I wait a year before to upstream the patches on clock tree
>>> initialization (and the second release v1.2) to avoid too many iteration.
>>>  And this patch on FDCAN is the only issue found on the initial clock tree.
>>>
>>> Today I think (hope?) it will be the last patch on this part.
>>
>> You will keep finding clock issues and no , this will not be the last patch which
>> fixes a clock issue.
>>
>> So what solution is there for those who can only update the kernel ?
> 
> Yes, this issue can also solved by a patch in Linux DT to change the clock tree:
> 
> &m_can1 {
> 	assigned-clocks = <&rcc FDCAN_K >;
> 	assigned-clock-parents = <&rcc PLL4_R>;
>  };
> 
> It is the solution recommended for any customer which can't/wan't update the bootloaders.

But this should be part of mainline Linux either way and possibly Linux
should print a BIG WARNING if such "weakness" is detected and fix it up,
otherwise some systems will become dependent on bootloader behavior and
once the behaviors diverge sufficiently, you will end up with a platform
which fails to boot.

If you want a physically embedded system to be deployed for 10+ years
somewhere and you want to keep updating it with latest kernel versions
(because security fixes and so on), then you can be sure a bootloader
update is not an option, because if the system stops working after such
an update, someone will have to go there and physically retrieve the
device and fix it, and that might be very expensive or impossible. If
you only update the kernel, then the bootloader can still be used to
recover even a failed kernel update.

> And I agree that this issue also highlight a issue in the FDCAN driver, which should use
> the API 'clk_rate_exclusive_get(clk)' to prevent modification by LTDC clock.
> 
> The current patch is only to provide a better "official" clock tree in U-Boot upstream, 
> as we known the ST board is used as reference by many client and also to align the clocks 
> used in downstream (https://github.com/STMicroelectronics/u-boot) and in upstream.

I am _NOT_ opposed to this patch.

My problem is with the bootloader-Linux clock tree dependency. That
dependency should not exist or be minimized, otherwise you end up with a
very poor long-term experience, see above. And if you want for this
platform to be successful in the industrial/automotive deployments, then
you want to make sure the long-term experience is a good one.

> But if you prefer kept the current clock tree for DH PKD2 board (with potential issue on FDCAN), 
> I can revert my modification on stm32mp15xx-dhcom-pdk2-u-boot.dtsi.

This has nothing to do with this board, or any other board, see above.
Patching this board is fine.

> I propose this modification only because it seems you have the same clock-tree than ST boards
>  (except CLK_ETH_PLL4P vs  CLK_ETH_DISABLED but is is probably linked to the ethernet
> PHY configuration)

No, keep the clock trees in sync as much as possible.

[...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
