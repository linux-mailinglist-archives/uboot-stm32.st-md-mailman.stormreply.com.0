Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1491BFE45
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 16:30:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5100CC36B0D
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 14:30:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08FFAC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 14:30:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03UESVmc021801; Thu, 30 Apr 2020 16:30:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=rvV1tiSfbFJAg1vl5aMzxgpZqCwij18uaKgBM2WGJdQ=;
 b=XhtoX6+pcF2MR6rRfGbyokhFtsldaUAbaWrZqDWb5AKomOArghN47cvBdWQsviGpuY4t
 thO+n+vGh5kjpTpHhpnhTwThakVvcekxdFga5H1S5Ms5p/weEQmVjFxeqsgfGZwFovLN
 T1OcgpdK0EtVYXWMwfqK/lxnpmVr6NJ+0lgRj8iec56PCQuM4gj/khIdzmPXbizsMKQY
 +T7oHbLYwzvEoT3DQZXa1QdTdJj75ybvz+ePOTUnlWPbwlgx6nPZwbKkmw2rJqOhTHYF
 LXZRO4w9DVPu+UcbsQrWLpcEB4KkMMen0H3JaxY8lbJb4n4KovUdpAJZyQjQciKGmlHX ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhq6cy6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 16:30:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A772A100034;
 Thu, 30 Apr 2020 16:30:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 999AD21FE98;
 Thu, 30 Apr 2020 16:30:24 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 30 Apr 2020 16:30:24 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Apr 2020 16:30:20 +0200
Message-ID: <20200430163010.v4.1.I2ff601b652f4995a3401dc67c2369a4187046ed8@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430143021.3636-1-patrick.delaunay@st.com>
References: <20200430143021.3636-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_09:2020-04-30,
 2020-04-30 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v4 1/2] arm: stm32mp: activate data cache in
	SPL and before relocation
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

Activate the data cache in SPL and in U-Boot before relocation.

In arch_cpu_init(), the function early_enable_caches() sets the early
TLB, early_tlb[] located .init section, and set cacheable:
- for SPL, all the SYSRAM
- for U-Boot, all the DDR

After relocation, the function enable_caches() (called by board_r)
reconfigures the MMU with new TLB location (reserved in
board_f.c::reserve_mmu) and re-enable the data cache.

This patch allows to reduce the execution time, particularly
- for the device tree parsing in U-Boot pre-reloc stage
  (dm_extended_scan_fd =>dm_scan_fdt)
- in I2C timing computation in SPL (stm32_i2c_choose_solution())

For example, the result on STM32MP157C-DK2 board is:
   1,6s gain for trusted boot chain with TF-A
   2,2s gain for basic boot chain with SPL

For information, as TLB is added in .data section, the binary size
increased and the SPL load time by ROM code increased (30ms on DK2).

But early malloc can't be used for TLB because arch_cpu_init()
is executed before the early poll initialization done in spl_common_init()
called by spl_early_init() So it too late for this use case.
And if I initialize the MMU and the cache after this function it is
too late, as dm_init_and_scan and fdt parsing is also called in
spl_common_init().

And .BSS can be used in board_init_f(): only stack and global can use
before BSS init done in board_init_r().

So .data is the better solution without hardcoded location but if you
have size issue for SPL you can deactivate cache for SPL only
(with CONFIG_SPL_SYS_DCACHE_OFF).

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v4:
- fix commit message and comment and add Patrice Chotard reviewed-by

Changes in v3:
- add Information in commit-message on early malloc and .BSS

Changes in v2:
- create a new function early_enable_caches
- use TLB in .init section
- use the default weak dram_bank_mmu_setup() and
  use mmu_set_region_dcache_behaviour() to setup
  the early MMU configuration
- enable data cache on DDR in SPL, after DDR controller initialization

 arch/arm/mach-stm32mp/cpu.c | 43 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 74d03fa7dd..bbffa3b9ff 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -75,6 +75,12 @@
 #define PKG_SHIFT	27
 #define PKG_MASK	GENMASK(2, 0)
 
+/*
+ * early TLB into the .data section so that it not get cleared
+ * with 16kB allignment (see TTBR0_BASE_ADDR_MASK)
+ */
+u8 early_tlb[PGTABLE_SIZE] __section(".data") __aligned(0x4000);
+
 #if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
 #ifndef CONFIG_TFABOOT
 static void security_init(void)
@@ -186,6 +192,32 @@ u32 get_bootmode(void)
 		    TAMP_BOOT_MODE_SHIFT;
 }
 
+/*
+ * initialize the MMU and activate cache in SPL or in U-Boot pre-reloc stage
+ * MMU/TLB is updated in enable_caches() for U-Boot after relocation
+ * or is deactivated in U-Boot entry function start.S::cpu_init_cp15
+ */
+static void early_enable_caches(void)
+{
+	/* I-cache is already enabled in start.S: cpu_init_cp15 */
+
+	if (CONFIG_IS_ENABLED(SYS_DCACHE_OFF))
+		return;
+
+	gd->arch.tlb_size = PGTABLE_SIZE;
+	gd->arch.tlb_addr = (unsigned long)&early_tlb;
+
+	dcache_enable();
+
+	if (IS_ENABLED(CONFIG_SPL_BUILD))
+		mmu_set_region_dcache_behaviour(STM32_SYSRAM_BASE,
+						STM32_SYSRAM_SIZE,
+						DCACHE_DEFAULT_OPTION);
+	else
+		mmu_set_region_dcache_behaviour(STM32_DDR_BASE, STM32_DDR_SIZE,
+						DCACHE_DEFAULT_OPTION);
+}
+
 /*
  * Early system init
  */
@@ -193,6 +225,8 @@ int arch_cpu_init(void)
 {
 	u32 boot_mode;
 
+	early_enable_caches();
+
 	/* early armv7 timer init: needed for polling */
 	timer_init();
 
@@ -225,7 +259,14 @@ int arch_cpu_init(void)
 
 void enable_caches(void)
 {
-	/* Enable D-cache. I-cache is already enabled in start.S */
+	/* I-cache is already enabled in start.S: icache_enable() not needed */
+
+	/* deactivate the data cache, early enabled in arch_cpu_init() */
+	dcache_disable();
+	/*
+	 * update MMU after relocation and enable the data cache
+	 * warning: the TLB location udpated in board_f.c::reserve_mmu
+	 */
 	dcache_enable();
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
