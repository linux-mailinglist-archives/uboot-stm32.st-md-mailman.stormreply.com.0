Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFF177A4FF
	for <lists+uboot-stm32@lfdr.de>; Sun, 13 Aug 2023 07:01:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41FA9C6B45B;
	Sun, 13 Aug 2023 05:01:27 +0000 (UTC)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB240C6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Aug 2023 05:01:25 +0000 (UTC)
Received: from LT2ubnt.. (ip-095-223-068-074.um35.pools.vodafone-ip.de
 [95.223.68.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 368413F161; 
 Sun, 13 Aug 2023 05:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1691902884;
 bh=c8fjyb+DhOqPQ3VPY+iEmEc6w/fWgWLGSdLBwSC10L8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=VwXOkVBkS5mNAlCpJDqJThZPynrj6MOjCduqoh6zanZBlwH5pZ4kB0I70EaCspM2P
 ClJra1eJeymRAmjtaL6CRkoWdWoWjWI3bskLM+gd3hwTFpcJv0b8nrMCW8u6FaZbL2
 YKbZW683oz+TRYAEAl62dCbbHtaZc+K8+oUBWLLzaC1jBzT2ME6RXlMMPI9MsTJzau
 iA5jUQU+YEQnmdYF2Wva18uWJ4ZsLqnh2kV8IHaIrI61w0j0mAmD9yBTCQICAWsSnC
 YgW4PVFSG/wbxKLGhcr8gJ3cKyl07q+L+2ALqt+BXsEXCqEWS5KSD4OirCF0nVqvMd
 1TZtTbvZI6WGg==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Tom Rini <trini@konsulko.com>
Date: Sun, 13 Aug 2023 07:00:11 +0200
Message-Id: <20230813050011.9345-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Kever Yang <kever.yang@rock-chips.com>, Fedor Ross <fedor.ross@ifm.com>,
 u-boot@lists.denx.de, "NXP i . MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Michal Simek <michal.simek@amd.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Michal Suchanek <msuchanek@suse.de>, Peter Robinson <pbrobinson@gmail.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>, Ovidiu Panait <ovpanait@gmail.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Rick Chen <rick@andestech.com>,
 Nikhil M Jain <n-jain1@ti.com>, Aswath Govindraju <a-govindraju@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Stefano Babic <sbabic@denx.de>,
 Olaf Mandel <o.mandel@menlosystems.com>, Matthias Brugger <mbrugger@suse.com>,
 Leo <ycliang@andestech.com>, Simon Glass <sjg@chromium.org>,
 Aaron Williams <awilliams@marvell.com>, Paul Burton <paul.burton@mips.com>,
 Tom Warren <twarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 1/1] common: return type
	board_get_usable_ram_top
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

board_get_usable_ram_top() returns a physical address that is stored in
gd->ram_top. The return type of the function should be phys_addr_t like the
current type of gd->ram_top.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/arm/mach-imx/imx8m/soc.c           | 2 +-
 arch/arm/mach-mvebu/arm64-common.c      | 2 +-
 arch/arm/mach-rockchip/sdram.c          | 2 +-
 arch/arm/mach-stm32mp/dram_init.c       | 2 +-
 arch/arm/mach-sunxi/board.c             | 2 +-
 arch/arm/mach-tegra/board2.c            | 2 +-
 arch/mips/mach-jz47xx/jz4780/jz4780.c   | 2 +-
 arch/mips/mach-octeon/dram.c            | 2 +-
 arch/riscv/cpu/fu540/dram.c             | 2 +-
 arch/riscv/cpu/fu740/dram.c             | 2 +-
 arch/riscv/cpu/generic/dram.c           | 2 +-
 arch/riscv/cpu/jh7110/dram.c            | 2 +-
 arch/x86/cpu/broadwell/sdram.c          | 2 +-
 arch/x86/cpu/coreboot/sdram.c           | 2 +-
 arch/x86/cpu/efi/payload.c              | 2 +-
 arch/x86/cpu/efi/sdram.c                | 2 +-
 arch/x86/cpu/ivybridge/sdram.c          | 2 +-
 arch/x86/cpu/qemu/dram.c                | 2 +-
 arch/x86/cpu/quark/dram.c               | 2 +-
 arch/x86/cpu/slimbootloader/sdram.c     | 2 +-
 arch/x86/cpu/tangier/sdram.c            | 2 +-
 arch/x86/include/asm/u-boot-x86.h       | 2 +-
 arch/x86/lib/fsp1/fsp_dram.c            | 2 +-
 arch/x86/lib/fsp2/fsp_dram.c            | 2 +-
 board/broadcom/bcmns3/ns3.c             | 2 +-
 board/imgtec/boston/ddr.c               | 2 +-
 board/menlo/m53menlo/m53menlo.c         | 2 +-
 board/raspberrypi/rpi/rpi.c             | 2 +-
 board/ti/am65x/evm.c                    | 2 +-
 board/ti/j721e/evm.c                    | 2 +-
 board/ti/j721s2/evm.c                   | 2 +-
 board/toradex/verdin-am62/verdin-am62.c | 2 +-
 board/xilinx/common/board.c             | 2 +-
 common/board_f.c                        | 2 +-
 include/init.h                          | 2 +-
 35 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/arch/arm/mach-imx/imx8m/soc.c b/arch/arm/mach-imx/imx8m/soc.c
index d5254886be..78b775f449 100644
--- a/arch/arm/mach-imx/imx8m/soc.c
+++ b/arch/arm/mach-imx/imx8m/soc.c
@@ -333,7 +333,7 @@ phys_size_t get_effective_memsize(void)
 	}
 }
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	ulong top_addr;
 
diff --git a/arch/arm/mach-mvebu/arm64-common.c b/arch/arm/mach-mvebu/arm64-common.c
index d3a95730be..4c67f1aba4 100644
--- a/arch/arm/mach-mvebu/arm64-common.c
+++ b/arch/arm/mach-mvebu/arm64-common.c
@@ -30,7 +30,7 @@ DECLARE_GLOBAL_DATA_PTR;
  */
 #define USABLE_RAM_SIZE		0x80000000ULL
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	unsigned long top = CFG_SYS_SDRAM_BASE + min(gd->ram_size, USABLE_RAM_SIZE);
 
diff --git a/arch/arm/mach-rockchip/sdram.c b/arch/arm/mach-rockchip/sdram.c
index 1d17a740ad..99ecbdc341 100644
--- a/arch/arm/mach-rockchip/sdram.c
+++ b/arch/arm/mach-rockchip/sdram.c
@@ -216,7 +216,7 @@ int dram_init(void)
 	return 0;
 }
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	unsigned long top = CFG_SYS_SDRAM_BASE + SDRAM_MAX_SIZE;
 
diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
index 80ba5c2774..7f37b0d2aa 100644
--- a/arch/arm/mach-stm32mp/dram_init.c
+++ b/arch/arm/mach-stm32mp/dram_init.c
@@ -40,7 +40,7 @@ int dram_init(void)
 	return 0;
 }
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	phys_size_t size;
 	phys_addr_t reg;
diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 391a65a549..78597ad932 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -64,7 +64,7 @@ static struct mm_region sunxi_mem_map[] = {
 };
 struct mm_region *mem_map = sunxi_mem_map;
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	/* Some devices (like the EMAC) have a 32-bit DMA limit. */
 	if (gd->ram_top > (1ULL << 32))
diff --git a/arch/arm/mach-tegra/board2.c b/arch/arm/mach-tegra/board2.c
index 0df18360ca..981768bb0e 100644
--- a/arch/arm/mach-tegra/board2.c
+++ b/arch/arm/mach-tegra/board2.c
@@ -403,7 +403,7 @@ int dram_init_banksize(void)
  * This function is called before dram_init_banksize(), so we can't simply
  * return gd->bd->bi_dram[1].start + gd->bd->bi_dram[1].size.
  */
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	ulong ram_top;
 
diff --git a/arch/mips/mach-jz47xx/jz4780/jz4780.c b/arch/mips/mach-jz47xx/jz4780/jz4780.c
index 15d1eff2ba..676c305fd3 100644
--- a/arch/mips/mach-jz47xx/jz4780/jz4780.c
+++ b/arch/mips/mach-jz47xx/jz4780/jz4780.c
@@ -76,7 +76,7 @@ void board_init_f(ulong dummy)
 }
 #endif /* CONFIG_SPL_BUILD */
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	return CFG_SYS_SDRAM_BASE + (256 * 1024 * 1024);
 }
diff --git a/arch/mips/mach-octeon/dram.c b/arch/mips/mach-octeon/dram.c
index 85cb084c13..5b1311d8b5 100644
--- a/arch/mips/mach-octeon/dram.c
+++ b/arch/mips/mach-octeon/dram.c
@@ -77,7 +77,7 @@ phys_size_t get_effective_memsize(void)
 	return UBOOT_RAM_SIZE_MAX;
 }
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	if (IS_ENABLED(CONFIG_RAM_OCTEON)) {
 		/* Map a maximum of 256MiB - return not size but address */
diff --git a/arch/riscv/cpu/fu540/dram.c b/arch/riscv/cpu/fu540/dram.c
index 44e11bd56c..94d8018407 100644
--- a/arch/riscv/cpu/fu540/dram.c
+++ b/arch/riscv/cpu/fu540/dram.c
@@ -21,7 +21,7 @@ int dram_init_banksize(void)
 	return fdtdec_setup_memory_banksize();
 }
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	/*
 	 * Ensure that we run from first 4GB so that all
diff --git a/arch/riscv/cpu/fu740/dram.c b/arch/riscv/cpu/fu740/dram.c
index d6d4a41d25..8657fcd165 100644
--- a/arch/riscv/cpu/fu740/dram.c
+++ b/arch/riscv/cpu/fu740/dram.c
@@ -20,7 +20,7 @@ int dram_init_banksize(void)
 	return fdtdec_setup_memory_banksize();
 }
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 #ifdef CONFIG_64BIT
 	/*
diff --git a/arch/riscv/cpu/generic/dram.c b/arch/riscv/cpu/generic/dram.c
index 44e11bd56c..94d8018407 100644
--- a/arch/riscv/cpu/generic/dram.c
+++ b/arch/riscv/cpu/generic/dram.c
@@ -21,7 +21,7 @@ int dram_init_banksize(void)
 	return fdtdec_setup_memory_banksize();
 }
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	/*
 	 * Ensure that we run from first 4GB so that all
diff --git a/arch/riscv/cpu/jh7110/dram.c b/arch/riscv/cpu/jh7110/dram.c
index 2ad3f2044a..1a9fa46d14 100644
--- a/arch/riscv/cpu/jh7110/dram.c
+++ b/arch/riscv/cpu/jh7110/dram.c
@@ -21,7 +21,7 @@ int dram_init_banksize(void)
 	return fdtdec_setup_memory_banksize();
 }
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	/*
 	 * Ensure that we run from first 4GB so that all
diff --git a/arch/x86/cpu/broadwell/sdram.c b/arch/x86/cpu/broadwell/sdram.c
index 1295121ae5..f477d513ef 100644
--- a/arch/x86/cpu/broadwell/sdram.c
+++ b/arch/x86/cpu/broadwell/sdram.c
@@ -25,7 +25,7 @@
 #include <asm/arch/pei_data.h>
 #include <asm/arch/pm.h>
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	return mrc_common_board_get_usable_ram_top(total_size);
 }
diff --git a/arch/x86/cpu/coreboot/sdram.c b/arch/x86/cpu/coreboot/sdram.c
index f4ee4cdf5d..26352df421 100644
--- a/arch/x86/cpu/coreboot/sdram.c
+++ b/arch/x86/cpu/coreboot/sdram.c
@@ -27,7 +27,7 @@ unsigned int install_e820_map(unsigned int max_entries,
  * address, and how far U-Boot is moved by relocation are set in the global
  * data structure.
  */
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	uintptr_t dest_addr = 0;
 	int i;
diff --git a/arch/x86/cpu/efi/payload.c b/arch/x86/cpu/efi/payload.c
index 19a25dd640..d8920effd3 100644
--- a/arch/x86/cpu/efi/payload.c
+++ b/arch/x86/cpu/efi/payload.c
@@ -27,7 +27,7 @@ DECLARE_GLOBAL_DATA_PTR;
  * the relocation address, and how far U-Boot is moved by relocation are
  * set in the global data structure.
  */
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	struct efi_mem_desc *desc, *end;
 	struct efi_entry_memmap *map;
diff --git a/arch/x86/cpu/efi/sdram.c b/arch/x86/cpu/efi/sdram.c
index f3086db42c..56f3326146 100644
--- a/arch/x86/cpu/efi/sdram.c
+++ b/arch/x86/cpu/efi/sdram.c
@@ -11,7 +11,7 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	return (ulong)efi_get_ram_base() + gd->ram_size;
 }
diff --git a/arch/x86/cpu/ivybridge/sdram.c b/arch/x86/cpu/ivybridge/sdram.c
index 0718aefbb1..95a826da71 100644
--- a/arch/x86/cpu/ivybridge/sdram.c
+++ b/arch/x86/cpu/ivybridge/sdram.c
@@ -46,7 +46,7 @@ DECLARE_GLOBAL_DATA_PTR;
 #define CMOS_OFFSET_MRC_SEED_S3		156
 #define CMOS_OFFSET_MRC_SEED_CHK	160
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	return mrc_common_board_get_usable_ram_top(total_size);
 }
diff --git a/arch/x86/cpu/qemu/dram.c b/arch/x86/cpu/qemu/dram.c
index 1a52d1dc52..d83abf0052 100644
--- a/arch/x86/cpu/qemu/dram.c
+++ b/arch/x86/cpu/qemu/dram.c
@@ -72,7 +72,7 @@ int dram_init_banksize(void)
  * the relocation address, and how far U-Boot is moved by relocation are
  * set in the global data structure.
  */
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	return qemu_get_low_memory_size();
 }
diff --git a/arch/x86/cpu/quark/dram.c b/arch/x86/cpu/quark/dram.c
index 8b1ee2d5ae..ad98f3e07b 100644
--- a/arch/x86/cpu/quark/dram.c
+++ b/arch/x86/cpu/quark/dram.c
@@ -184,7 +184,7 @@ int dram_init_banksize(void)
  * the relocation address, and how far U-Boot is moved by relocation are
  * set in the global data structure.
  */
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	return gd->ram_size;
 }
diff --git a/arch/x86/cpu/slimbootloader/sdram.c b/arch/x86/cpu/slimbootloader/sdram.c
index d748d5c7d4..fbb33b246e 100644
--- a/arch/x86/cpu/slimbootloader/sdram.c
+++ b/arch/x86/cpu/slimbootloader/sdram.c
@@ -48,7 +48,7 @@ static struct sbl_memory_map_info *get_memory_map_info(void)
  * @total_size: The memory size that u-boot occupies
  * Return:    : The top available memory address lower than 4GB
  */
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	struct sbl_memory_map_info *data;
 	int i;
diff --git a/arch/x86/cpu/tangier/sdram.c b/arch/x86/cpu/tangier/sdram.c
index 8a4b1c5d2d..ee74a1f043 100644
--- a/arch/x86/cpu/tangier/sdram.c
+++ b/arch/x86/cpu/tangier/sdram.c
@@ -204,7 +204,7 @@ unsigned int install_e820_map(unsigned int max_entries,
  * address, and how far U-Boot is moved by relocation are set in the global
  * data structure.
  */
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	struct sfi_table_simple *sb;
 	struct sfi_mem_entry *mentry;
diff --git a/arch/x86/include/asm/u-boot-x86.h b/arch/x86/include/asm/u-boot-x86.h
index 02a8b0f152..3acc58ad74 100644
--- a/arch/x86/include/asm/u-boot-x86.h
+++ b/arch/x86/include/asm/u-boot-x86.h
@@ -77,7 +77,7 @@ int x86_cleanup_before_linux(void);
 void x86_enable_caches(void);
 void x86_disable_caches(void);
 int x86_init_cache(void);
-phys_size_t board_get_usable_ram_top(phys_size_t total_size);
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size);
 int default_print_cpuinfo(void);
 
 /* Set up a UART which can be used with printch(), printhex8(), etc. */
diff --git a/arch/x86/lib/fsp1/fsp_dram.c b/arch/x86/lib/fsp1/fsp_dram.c
index 5825221d1e..eee9ce54b1 100644
--- a/arch/x86/lib/fsp1/fsp_dram.c
+++ b/arch/x86/lib/fsp1/fsp_dram.c
@@ -34,7 +34,7 @@ int dram_init(void)
  * the relocation address, and how far U-Boot is moved by relocation are
  * set in the global data structure.
  */
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	return fsp_get_usable_lowmem_top(gd->arch.hob_list);
 }
diff --git a/arch/x86/lib/fsp2/fsp_dram.c b/arch/x86/lib/fsp2/fsp_dram.c
index f9ea1ab3ba..a1432239cf 100644
--- a/arch/x86/lib/fsp2/fsp_dram.c
+++ b/arch/x86/lib/fsp2/fsp_dram.c
@@ -77,7 +77,7 @@ int dram_init(void)
 	return 0;
 }
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	if (!ll_boot_init())
 		return gd->ram_size;
diff --git a/board/broadcom/bcmns3/ns3.c b/board/broadcom/bcmns3/ns3.c
index 2a78df670c..7ae6742c4b 100644
--- a/board/broadcom/bcmns3/ns3.c
+++ b/board/broadcom/bcmns3/ns3.c
@@ -183,7 +183,7 @@ int dram_init_banksize(void)
 }
 
 /* Limit RAM used by U-Boot to the DDR first bank End region */
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	return BCM_NS3_MEM_END;
 }
diff --git a/board/imgtec/boston/ddr.c b/board/imgtec/boston/ddr.c
index 8532225dc0..cecf454011 100644
--- a/board/imgtec/boston/ddr.c
+++ b/board/imgtec/boston/ddr.c
@@ -23,7 +23,7 @@ int dram_init(void)
 	return 0;
 }
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	DECLARE_GLOBAL_DATA_PTR;
 
diff --git a/board/menlo/m53menlo/m53menlo.c b/board/menlo/m53menlo/m53menlo.c
index ca3b81c57f..b8dffb0e48 100644
--- a/board/menlo/m53menlo/m53menlo.c
+++ b/board/menlo/m53menlo/m53menlo.c
@@ -42,7 +42,7 @@ DECLARE_GLOBAL_DATA_PTR;
 
 static u32 mx53_dram_size[2];
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	/*
 	 * WARNING: We must override get_effective_memsize() function here
diff --git a/board/raspberrypi/rpi/rpi.c b/board/raspberrypi/rpi/rpi.c
index 1057ebb994..2b5f5d68db 100644
--- a/board/raspberrypi/rpi/rpi.c
+++ b/board/raspberrypi/rpi/rpi.c
@@ -334,7 +334,7 @@ static void set_fdt_addr(void)
 /*
  * Prevent relocation from stomping on a firmware provided FDT blob.
  */
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	if ((gd->ram_top - fw_dtb_pointer) > SZ_64M)
 		return gd->ram_top;
diff --git a/board/ti/am65x/evm.c b/board/ti/am65x/evm.c
index 706b219818..d52ac332f8 100644
--- a/board/ti/am65x/evm.c
+++ b/board/ti/am65x/evm.c
@@ -59,7 +59,7 @@ int dram_init(void)
 	return 0;
 }
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 #ifdef CONFIG_PHYS_64BIT
 	/* Limit RAM used by U-Boot to the DDR low region */
diff --git a/board/ti/j721e/evm.c b/board/ti/j721e/evm.c
index 2398bead78..38fe447d8f 100644
--- a/board/ti/j721e/evm.c
+++ b/board/ti/j721e/evm.c
@@ -55,7 +55,7 @@ int dram_init(void)
 	return 0;
 }
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 #ifdef CONFIG_PHYS_64BIT
 	/* Limit RAM used by U-Boot to the DDR low region */
diff --git a/board/ti/j721s2/evm.c b/board/ti/j721s2/evm.c
index 8eaca9d5af..7795300abc 100644
--- a/board/ti/j721s2/evm.c
+++ b/board/ti/j721s2/evm.c
@@ -43,7 +43,7 @@ int dram_init(void)
 	return 0;
 }
 
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 #ifdef CONFIG_PHYS_64BIT
 	/* Limit RAM used by U-Boot to the DDR low region */
diff --git a/board/toradex/verdin-am62/verdin-am62.c b/board/toradex/verdin-am62/verdin-am62.c
index 5b166b14ca..a3d1d07a0c 100644
--- a/board/toradex/verdin-am62/verdin-am62.c
+++ b/board/toradex/verdin-am62/verdin-am62.c
@@ -37,7 +37,7 @@ int dram_init(void)
 /*
  * Avoid relocated U-Boot clash with Linux reserved-memory on 512 MB SoM
  */
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	return 0x9C000000;
 }
diff --git a/board/xilinx/common/board.c b/board/xilinx/common/board.c
index 0328d68e75..906d5e3c2d 100644
--- a/board/xilinx/common/board.c
+++ b/board/xilinx/common/board.c
@@ -627,7 +627,7 @@ int embedded_dtb_select(void)
 #endif
 
 #if defined(CONFIG_LMB)
-phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 	phys_size_t size;
 	phys_addr_t reg;
diff --git a/common/board_f.c b/common/board_f.c
index 791c1e601c..e9f4edb93d 100644
--- a/common/board_f.c
+++ b/common/board_f.c
@@ -330,7 +330,7 @@ __weak int mach_cpu_init(void)
 }
 
 /* Get the top of usable RAM */
-__weak phys_size_t board_get_usable_ram_top(phys_size_t total_size)
+__weak phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 #if defined(CFG_SYS_SDRAM_BASE) && CFG_SYS_SDRAM_BASE > 0
 	/*
diff --git a/include/init.h b/include/init.h
index 8873081685..b1e1451166 100644
--- a/include/init.h
+++ b/include/init.h
@@ -304,7 +304,7 @@ int show_board_info(void);
  *
  * @param total_size	Size of U-Boot (unused?)
  */
-phys_size_t board_get_usable_ram_top(phys_size_t total_size);
+phys_addr_t board_get_usable_ram_top(phys_size_t total_size);
 
 int board_early_init_f(void);
 
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
