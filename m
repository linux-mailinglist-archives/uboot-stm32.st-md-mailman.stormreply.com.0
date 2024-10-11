Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D221599A7EA
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2024 17:36:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 937FCC71290;
	Fri, 11 Oct 2024 15:36:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD126C7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2024 15:36:50 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BCcFeu028622;
 Fri, 11 Oct 2024 17:36:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 SO9EJTZ+0RaXCg2rIoYgyt6CQky21v3aID8/rKZhO+M=; b=6IoWP8eH0PjIjwQ/
 SpbWH3VcoBIOcf5GSI/Mp9UbDt5N/c7kHGv4fdk61x4arQKJwlUiK/SJ6qvlxTdI
 yhIUmgPjpUd1U/LYcA9DhZ1lcq0C9RL6DPWomwYOJ/r0TF2YSlM/++ulwbovTqaq
 JJTw5Htu5Zxhv4hZVF/Gg6gEsTfuLR8vCsM3fiYe4mP7VfkqbgI1MIk8ZofS6a/W
 nU/J7VZ3NOIOzP5GBmlBkEQOGh2Okw6SEzI6H1WE0nAcGby8GGYBD9G9CTt7+qwr
 TVsZEjSb9q/WbSUt0Ic+tUYIMH7EEbj0IHREkR5AT55h48Fd1g3Ig+GrDPRM/y7f
 vsnx+Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4263439sx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 17:36:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 848924004C;
 Fri, 11 Oct 2024 17:35:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CFEA28AF1F;
 Fri, 11 Oct 2024 17:32:26 +0200 (CEST)
Received: from localhost (10.48.86.243) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 11 Oct
 2024 17:32:26 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 11 Oct 2024 17:31:49 +0200
Message-ID: <20241011173140.2.I898b6c22e3abfc31ee4efa0ff426f77640768faa@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011153152.1637303-1-patrick.delaunay@foss.st.com>
References: <20241011153152.1637303-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/4] ARM: stm32mp: enable data cache after LMB
	configuration for STM32MP1
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

Move the stm32mp1 data cache reconfiguration after the lmb init call
board_r::initr_lmb to allow parsing of the reserved region with
no-map tag.

After this patch the DDR is not fully mapped up to arch_early_init_r()
call, only the relocation region is mapped, but it is enough for
the first board_r initialization phases; later, when arch_early_init_r()
is called, the LMB is already initialized and the function
lmb_is_reserved_flags() function is functional, this LMB function
is called in the weak function dram_bank_mmu_setup() when
dcache_enable() is executed.

Without this change, as LMB is not initialized when it is used in
dram_bank_mmu_setup, the OP-TEE region is mapped cache-able by U-Boot
and we have some firewall violation since "LMB memory map global and
persistent" series.

Fixes: ed17a33fed29 ("lmb: make LMB memory map persistent and global")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/Kconfig        | 2 ++
 arch/arm/mach-stm32mp/stm32mp1/cpu.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index d5934a927717..25663a99464d 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -39,6 +39,7 @@ choice
 
 config STM32MP13X
 	bool "Support STMicroelectronics STM32MP13x Soc"
+	select ARCH_EARLY_INIT_R
 	select ARM_SMCCC
 	select CPU_V7A
 	select CPU_V7_HAS_NONSEC
@@ -57,6 +58,7 @@ config STM32MP13X
 
 config STM32MP15X
 	bool "Support STMicroelectronics STM32MP15x Soc"
+	select ARCH_EARLY_INIT_R
 	select ARCH_SUPPORT_PSCI
 	select BINMAN
 	select CPU_V7A
diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
index 64480da9f8d8..0b60e27a804d 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
@@ -143,6 +143,11 @@ void enable_caches(void)
 {
 	/* I-cache is already enabled in start.S: icache_enable() not needed */
 
+	/* keep D-cache configuration done before relocation, wait arch_early_init_r*/
+}
+
+int arch_early_init_r(void)
+{
 	/* deactivate the data cache, early enabled in arch_cpu_init() */
 	dcache_disable();
 	/*
@@ -150,6 +155,8 @@ void enable_caches(void)
 	 * warning: the TLB location udpated in board_f.c::reserve_mmu
 	 */
 	dcache_enable();
+
+	return 0;
 }
 
 static void setup_boot_mode(void)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
