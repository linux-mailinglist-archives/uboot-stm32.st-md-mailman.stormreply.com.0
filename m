Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4871D2B9E
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 11:39:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E673C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 09:39:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56939C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 09:39:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04E9cQfq023695; Thu, 14 May 2020 11:39:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=MqYvN5QOgF8w575CIVu2/5fzku1obPUbUcoFPIGMebU=;
 b=Ys4TjobkvjFZRteLmwFvjvCCC1QUSj/RJaT2AId7jpdmMYrHfNQJAHLA8DJ1ntYphVqn
 3vlse2SpIXnvnfI3mxEC7gQqlP2ubATwpMD4h5fJVeEGcMJmf8IHYXvg4bmrrQtEMOSP
 gRfbT2dRilgW9pbRYNEVveO5MpkPWDSVG8pE3eejR64KXpObq0I4rn3o/66YDNTF9i2T
 QMmCUsuLrspZ64+gmokMMyI6yabKI7Bama5FYjpwCue5CcgkQegXsmYB0qUL4J0p8Rq5
 iLwxPKgv9oDgXv4DBJOIVYRUfQIwzrmlmG0ihN7cgA/ApH+5v+xHe1KE9bLxnkl9kqDD 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vpj9m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:39:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 63D17100034;
 Thu, 14 May 2020 11:39:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53B5A2AF977;
 Thu, 14 May 2020 11:39:35 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 May
 2020 11:39:34 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 14 May 2020 11:39:34 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v4 1/2] arm: stm32mp: activate data cache in SPL and
 before relocation
Thread-Index: AQHWHvviT0Zl/ajcMECAeq5/8+/HYKinaQIQ
Date: Thu, 14 May 2020 09:39:34 +0000
Message-ID: <588535cebe39467d82bab5ceebef1310@SFHDAG6NODE3.st.com>
References: <20200430143021.3636-1-patrick.delaunay@st.com>
 <20200430163010.v4.1.I2ff601b652f4995a3401dc67c2369a4187046ed8@changeid>
In-Reply-To: <20200430163010.v4.1.I2ff601b652f4995a3401dc67c2369a4187046ed8@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_02:2020-05-13,
 2020-05-14 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/2] arm: stm32mp: activate data cache
 in SPL and before relocation
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

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: jeudi 30 avril 2020 16:30
> 
> Activate the data cache in SPL and in U-Boot before relocation.
> 
> In arch_cpu_init(), the function early_enable_caches() sets the early TLB,
> early_tlb[] located .init section, and set cacheable:
> - for SPL, all the SYSRAM
> - for U-Boot, all the DDR
> 
> After relocation, the function enable_caches() (called by board_r) reconfigures the
> MMU with new TLB location (reserved in
> board_f.c::reserve_mmu) and re-enable the data cache.
> 
> This patch allows to reduce the execution time, particularly
> - for the device tree parsing in U-Boot pre-reloc stage
>   (dm_extended_scan_fd =>dm_scan_fdt)
> - in I2C timing computation in SPL (stm32_i2c_choose_solution())
> 
> For example, the result on STM32MP157C-DK2 board is:
>    1,6s gain for trusted boot chain with TF-A
>    2,2s gain for basic boot chain with SPL
> 
> For information, as TLB is added in .data section, the binary size increased and
> the SPL load time by ROM code increased (30ms on DK2).
> 
> But early malloc can't be used for TLB because arch_cpu_init() is executed before
> the early poll initialization done in spl_common_init() called by spl_early_init() So it
> too late for this use case.
> And if I initialize the MMU and the cache after this function it is too late, as
> dm_init_and_scan and fdt parsing is also called in spl_common_init().
> 
> And .BSS can be used in board_init_f(): only stack and global can use before BSS
> init done in board_init_r().
> 
> So .data is the better solution without hardcoded location but if you have size
> issue for SPL you can deactivate cache for SPL only (with
> CONFIG_SPL_SYS_DCACHE_OFF).
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v4:
> - fix commit message and comment and add Patrice Chotard reviewed-by
> 
> Changes in v3:
> - add Information in commit-message on early malloc and .BSS
> 
> Changes in v2:
> - create a new function early_enable_caches
> - use TLB in .init section
> - use the default weak dram_bank_mmu_setup() and
>   use mmu_set_region_dcache_behaviour() to setup
>   the early MMU configuration
> - enable data cache on DDR in SPL, after DDR controller initialization
> 
>  arch/arm/mach-stm32mp/cpu.c | 43
> ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
