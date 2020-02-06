Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C711540E7
	for <lists+uboot-stm32@lfdr.de>; Thu,  6 Feb 2020 10:10:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9030FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  6 Feb 2020 09:10:48 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EEACC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2020 09:10:46 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48Ct2F11Zhz1qrV5;
 Thu,  6 Feb 2020 10:10:45 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48Ct2F00wQz1rPD4;
 Thu,  6 Feb 2020 10:10:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id nLUtw_bWeutY; Thu,  6 Feb 2020 10:10:43 +0100 (CET)
X-Auth-Info: jPfP3QooFvwEhKFvOOOWtG1gUnjshtGEe1eXWB4mhX8=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  6 Feb 2020 10:10:43 +0100 (CET)
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
 <d3651bdd-be44-51f1-6a91-707695491209@denx.de>
 <ab592bb4ff9c4a8ba6bfb45a91418b57@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <193d31b4-7916-459f-6f79-fc7e17c0a1d0@denx.de>
Date: Thu, 6 Feb 2020 10:10:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ab592bb4ff9c4a8ba6bfb45a91418b57@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: Tom Rini <trini@konsulko.com>, Antonio BORNEO <antonio.borneo@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gerald BAEZA <gerald.baeza@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>
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

On 2/6/20 9:59 AM, Patrick DELAUNAY wrote:
> Hi Marek,

Hello Patrick

[...]

>> My problem is with the bootloader-Linux clock tree dependency. That dependency
>> should not exist or be minimized, otherwise you end up with a very poor long-term
>> experience, see above. And if you want for this platform to be successful in the
>> industrial/automotive deployments, then you want to make sure the long-term
>> experience is a good one.
> 
> With STM32MP15x SOC and RCC, very few clocks need to be fixed by bootloaders
> (in fact more or less the root clocks of the system = frequency of PLL1 to PLL4, 
> common for many device or protected  by security feature), I think it is the case for
> any platform.
> 
> All the other clocks have a initial value / source provided by bootloaders but they can 
> also be modified at runtime (by device tree assigned-clock-parents for not secure clocks
> and with SMC call to TF-A secure monitor for "secure" clock).
> 
> For ST boards, we are trying to don't modify the initial clock tree-source only to prove
> that this clock tree is functional / correct for most of case.
> 
> But for client and after first deployment, clock tree modification must be done in Linux kernel
> without any Bootloader update (and avoid all known issue for OTA).
> 
> I shared your concerns with my team and we are completely agree with you.

So, shall we expect a proper fix for the Linux kernel too ?

[...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
