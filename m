Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA22942ECAA
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Oct 2021 10:42:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79F28C5C83F;
	Fri, 15 Oct 2021 08:42:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64FC1C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 08:42:49 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id m42so1853657wms.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 01:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5buIAUKlWCprToR4UAurd6c354CSwhhsrbb1JSDYxpU=;
 b=Id80ZW6aoS+Uof9OWWwPIfKsMdvEUp9NhBIJQucaMeJ5uN5d1HqsOKqPH1jHPyrl6k
 jbKrOvqgMpKtFxu1OHzGs0MIQ/52NImHOnz5a6AFhdYPR2Oby9cntPuf5SIBHg6izUeQ
 7CD0rRm4fsFqUr9gbNn4nEUGkM5em6DAcsIn9Y8sJw0OztJj6uNO4l0QslKFDlwud0YI
 JncVHFPIL5ZuJEqLP+ENiE2OryRERHtA7ZLU0DPgptBEetEVLzVeCaeJErV5as8xHA0l
 vjOg/dDfgJ1vwmdwpZlPCfGl2ykd6S9eeeyojI5FG5dayFyGZEnK97kGebNbjMYFEY6o
 JUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5buIAUKlWCprToR4UAurd6c354CSwhhsrbb1JSDYxpU=;
 b=J2Z5tVDndm3JiyILu1g/Puh+4BjPHPeOAQbNIjtISasPsh5XWfRThuS0jbRkaM1bJZ
 T3nxA/pSny0sx3CB/GpFOF6CJ0v0VxFJ+m3I0mnOuMKKhPDWpo4ww+UUWV3vMlIPb2yB
 r5AjLNrnz1kVwPL2snqzxAncRnIfsGNVf+z8nxtznVfJ4U13QB8KB/XiXO09Fs5YwUro
 ZMX42i7FN6jWvpXE/FJZDlZG90/Hal8/bOuvZAcwSl0VJacMaA/hEZrlUY3dHltSBJm9
 mi3MMgTuASOgweicbWnI5fUkJOO8gOmfhrniE/CrQnBgxC3C0yYAzvyGu/sNI2ZYm2Vw
 UfoA==
X-Gm-Message-State: AOAM531PnB8VPsQ15VvH9f/RLImceY4qYNl+OZocw7v/xaadlTyMqPlj
 KrbloJidMD7pghBrLMKxUs02qQ==
X-Google-Smtp-Source: ABdhPJwr17p+oxIwnYE6X6ZES2d7RMW8EAZ+TFFzfAGNjnp2uts0iXKbM/YRQkrq/+e754Tik8PwWQ==
X-Received: by 2002:a05:600c:2041:: with SMTP id
 p1mr11069434wmg.145.1634287368727; 
 Fri, 15 Oct 2021 01:42:48 -0700 (PDT)
Received: from apalos.home ([2a02:587:4682:26e0:2e56:dcff:fe9a:8f06])
 by smtp.gmail.com with ESMTPSA id o23sm4325898wms.18.2021.10.15.01.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 01:42:48 -0700 (PDT)
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: sjg@chromium.org
Date: Fri, 15 Oct 2021 11:42:40 +0300
Message-Id: <20211015084243.285423-1-ilias.apalodimas@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 Zong Li <zong.li@sifive.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Heiko Schocher <hs@denx.de>,
 Asherah Connor <ashe@kivikakk.ee>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ramon Fried <rfried.dev@gmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Wasim Khan <wasim.khan@nxp.com>,
 Harald Seiler <hws@denx.de>, Nandor Han <nandor.han@vaisala.com>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Green Wan <green.wan@sifive.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3] sandbox: Remove OF_HOSTFILE
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

OF_HOSTFILE is used on sandbox configs only.  Although it's pretty
unique and rarely causes confusion,  we are better of having simpler
config options for the DTB.

So let's replace that with the existing OF_BOARD.  U-Boot would then
have only three config options for the DTB origin.
- OF_SEPARATE, build separately from U-Boot
- OF_BOARD, board specific way of providing the DTB
- OF_EMBED embedded in the u-boot binary(should not be used in production)

Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
---
Note that this must be applied on top of
https://lore.kernel.org/u-boot/20211011210016.135929-1-ilias.apalodimas@linaro.org/
changes since v2:
- Rebased on top of the updated OF_BOARD patchset
Changes since v1:
- Added internal error value on board_fdt_blob_setup().  Arguably
  we can just check against NULL and simplify this even more if we
  don't care about the errno
- OF_BOARD is now default for sandbox builds
 Makefile                                    |  6 ++---
 arch/arm/mach-stm32mp/boot_params.c         |  3 ++-
 arch/sandbox/cpu/cpu.c                      | 27 +++++++++++++--------
 arch/sandbox/include/asm/u-boot-sandbox.h   |  8 ------
 board/AndesTech/ax25-ae350/ax25-ae350.c     |  2 ++
 board/Marvell/octeontx/board-fdt.c          |  3 ++-
 board/Marvell/octeontx2/board-fdt.c         |  3 ++-
 board/Marvell/octeontx2/board.c             |  3 ++-
 board/armltd/vexpress64/vexpress64.c        |  7 ++++--
 board/broadcom/bcmstb/bcmstb.c              |  3 ++-
 board/emulation/qemu-arm/qemu-arm.c         |  3 ++-
 board/emulation/qemu-ppce500/qemu-ppce500.c |  3 ++-
 board/emulation/qemu-riscv/qemu-riscv.c     |  3 ++-
 board/highbank/highbank.c                   |  3 ++-
 board/raspberrypi/rpi/rpi.c                 |  8 ++++--
 board/sifive/unleashed/unleashed.c          |  3 ++-
 board/sifive/unmatched/unmatched.c          |  3 ++-
 board/socrates/socrates.c                   |  4 ++-
 board/xen/xenguest_arm64/xenguest_arm64.c   |  7 ++++--
 board/xilinx/common/board.c                 |  3 ++-
 configs/sandbox64_defconfig                 |  1 -
 configs/sandbox_defconfig                   |  1 -
 configs/sandbox_flattree_defconfig          |  1 -
 configs/sandbox_noinst_defconfig            |  1 -
 configs/sandbox_spl_defconfig               |  1 -
 configs/tools-only_defconfig                |  1 -
 doc/develop/devicetree/control.rst          |  7 +++---
 dts/Kconfig                                 | 10 +-------
 include/fdtdec.h                            |  4 ++-
 lib/fdtdec.c                                | 14 +++++------
 scripts/Makefile.spl                        |  4 +--
 31 files changed, 81 insertions(+), 69 deletions(-)

diff --git a/Makefile b/Makefile
index 3014788e14e8..cf3d98d00a62 100644
--- a/Makefile
+++ b/Makefile
@@ -957,7 +957,7 @@ INPUTS-$(CONFIG_BINMAN_STANDALONE_FDT) += u-boot.dtb
 ifeq ($(CONFIG_SPL_FRAMEWORK),y)
 INPUTS-$(CONFIG_OF_SEPARATE) += u-boot-dtb.img
 endif
-INPUTS-$(CONFIG_OF_HOSTFILE) += u-boot.dtb
+INPUTS-$(CONFIG_SANDBOX) += u-boot.dtb
 ifneq ($(CONFIG_SPL_TARGET),)
 INPUTS-$(CONFIG_SPL) += $(CONFIG_SPL_TARGET:"%"=%)
 endif
@@ -1423,7 +1423,7 @@ u-boot-lzma.img: u-boot.bin.lzma FORCE
 
 u-boot-dtb.img u-boot.img u-boot.kwb u-boot.pbl u-boot-ivt.img: \
 		$(if $(CONFIG_SPL_LOAD_FIT),u-boot-nodtb.bin \
-			$(if $(CONFIG_OF_SEPARATE)$(CONFIG_OF_EMBED)$(CONFIG_OF_HOSTFILE)$(CONFIG_BINMAN_STANDALONE_FDT),dts/dt.dtb) \
+			$(if $(CONFIG_OF_SEPARATE)$(CONFIG_OF_EMBED)$(CONFIG_SANDBOX)$(CONFIG_BINMAN_STANDALONE_FDT),dts/dt.dtb) \
 		,$(UBOOT_BIN)) FORCE
 	$(call if_changed,mkimage)
 	$(BOARD_SIZE_CHECK)
@@ -1437,7 +1437,7 @@ MKIMAGEFLAGS_u-boot.itb += -B 0x8
 
 ifdef U_BOOT_ITS
 u-boot.itb: u-boot-nodtb.bin \
-		$(if $(CONFIG_OF_SEPARATE)$(CONFIG_OF_EMBED)$(CONFIG_OF_HOSTFILE),dts/dt.dtb) \
+		$(if $(CONFIG_OF_SEPARATE)$(CONFIG_OF_EMBED)$(CONFIG_SANDBOX),dts/dt.dtb) \
 		$(U_BOOT_ITS) FORCE
 	$(call if_changed,mkfitimage)
 	$(BOARD_SIZE_CHECK)
diff --git a/arch/arm/mach-stm32mp/boot_params.c b/arch/arm/mach-stm32mp/boot_params.c
index 84647e70398b..e91ef1b2fc70 100644
--- a/arch/arm/mach-stm32mp/boot_params.c
+++ b/arch/arm/mach-stm32mp/boot_params.c
@@ -33,10 +33,11 @@ void save_boot_params(unsigned long r0, unsigned long r1, unsigned long r2,
  * Use the saved FDT address provided by TF-A at boot time (NT_FW_CONFIG =
  * Non Trusted Firmware configuration file) when the pointer is valid
  */
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
 	log_debug("%s: nt_fw_dtb=%lx\n", __func__, nt_fw_dtb);
 
+	*err = 0;
 	/* use external device tree only if address is valid */
 	if (nt_fw_dtb >= STM32_DDR_BASE) {
 		if (fdt_magic(nt_fw_dtb) == FDT_MAGIC)
diff --git a/arch/sandbox/cpu/cpu.c b/arch/sandbox/cpu/cpu.c
index 48636ab63919..9887d09272a3 100644
--- a/arch/sandbox/cpu/cpu.c
+++ b/arch/sandbox/cpu/cpu.c
@@ -291,44 +291,51 @@ void invalidate_dcache_range(unsigned long start, unsigned long stop)
 {
 }
 
-int sandbox_read_fdt_from_file(void)
+void *board_fdt_blob_setup(int *ret)
 {
 	struct sandbox_state *state = state_get_current();
 	const char *fname = state->fdt_fname;
-	void *blob;
+	void *blob = NULL;
 	loff_t size;
 	int err;
 	int fd;
 
 	blob = map_sysmem(CONFIG_SYS_FDT_LOAD_ADDR, 0);
+	*ret = 0;
 	if (!state->fdt_fname) {
 		err = fdt_create_empty_tree(blob, 256);
 		if (!err)
 			goto done;
 		printf("Unable to create empty FDT: %s\n", fdt_strerror(err));
-		return -EINVAL;
+		*ret = -EINVAL;
+		goto fail;
 	}
 
 	err = os_get_filesize(fname, &size);
 	if (err < 0) {
-		printf("Failed to file FDT file '%s'\n", fname);
-		return err;
+		printf("Failed to find FDT file '%s'\n", fname);
+		*ret = err;
+		goto fail;
 	}
 	fd = os_open(fname, OS_O_RDONLY);
 	if (fd < 0) {
 		printf("Failed to open FDT file '%s'\n", fname);
-		return -EACCES;
+		*ret = -EACCES;
+		goto fail;
 	}
+
 	if (os_read(fd, blob, size) != size) {
 		os_close(fd);
-		return -EIO;
+		printf("Failed to read FDT file '%s'\n", fname);
+		*ret =  -EIO;
+		goto fail;
 	}
 	os_close(fd);
 
 done:
-	gd->fdt_blob = blob;
-
-	return 0;
+	return blob;
+fail:
+	return NULL;
 }
 
 ulong timer_get_boot_us(void)
diff --git a/arch/sandbox/include/asm/u-boot-sandbox.h b/arch/sandbox/include/asm/u-boot-sandbox.h
index 73b1897191d5..56dc13c3eb11 100644
--- a/arch/sandbox/include/asm/u-boot-sandbox.h
+++ b/arch/sandbox/include/asm/u-boot-sandbox.h
@@ -76,14 +76,6 @@ int pci_unmap_physmem(const void *addr, unsigned long len,
  */
 void sandbox_set_enable_pci_map(int enable);
 
-/**
- * sandbox_read_fdt_from_file() - Read a device tree from a file
- *
- * Read a device tree file from a host file and set it up for use as the
- * control FDT.
- */
-int sandbox_read_fdt_from_file(void);
-
 /**
  * sandbox_reset() - reset sandbox
  *
diff --git a/board/AndesTech/ax25-ae350/ax25-ae350.c b/board/AndesTech/ax25-ae350/ax25-ae350.c
index b0b6e20e9f9d..6bcf3cb23ca2 100644
--- a/board/AndesTech/ax25-ae350/ax25-ae350.c
+++ b/board/AndesTech/ax25-ae350/ax25-ae350.c
@@ -56,11 +56,13 @@ ulong board_flash_get_legacy(ulong base, int banknum, flash_info_t *info)
 
 void *board_fdt_blob_setup(void)
 {
+	*err = 0;
 #if CONFIG_IS_ENABLED(OF_BOARD)
 	return (void *)(ulong)gd->arch.firmware_fdt_addr;
 #elif CONFIG_IS_ENABLED(OF_SEPARATE)
 	return (void *)CONFIG_SYS_FDT_BASE;
 #else
+	*err = -EINVAL;
 	return NULL;
 #endif
 }
diff --git a/board/Marvell/octeontx/board-fdt.c b/board/Marvell/octeontx/board-fdt.c
index 1db2a4a26750..e989c374f2b2 100644
--- a/board/Marvell/octeontx/board-fdt.c
+++ b/board/Marvell/octeontx/board-fdt.c
@@ -301,7 +301,8 @@ int ft_board_setup(void *blob, struct bd_info *bd)
  *
  * @return	FDT base address received from ATF in x1 register
  */
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
+	*err = 0;
 	return (void *)fdt_base_addr;
 }
diff --git a/board/Marvell/octeontx2/board-fdt.c b/board/Marvell/octeontx2/board-fdt.c
index a4771af4c1d8..e2cfe017e83c 100644
--- a/board/Marvell/octeontx2/board-fdt.c
+++ b/board/Marvell/octeontx2/board-fdt.c
@@ -215,7 +215,8 @@ int ft_board_setup(void *blob, struct bd_info *bd)
  *
  * @return	FDT base address received from ATF in x1 register
  */
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
+	*err = 0;
 	return (void *)fdt_base_addr;
 }
diff --git a/board/Marvell/octeontx2/board.c b/board/Marvell/octeontx2/board.c
index 4e8cb839f5ee..63aa2d613496 100644
--- a/board/Marvell/octeontx2/board.c
+++ b/board/Marvell/octeontx2/board.c
@@ -226,12 +226,13 @@ static int do_go_uboot(struct cmd_tbl *cmdtp, int flag, int argc,
 	uboot_entry_t entry;
 	ulong addr;
 	void *fdt;
+	int err;
 
 	if (argc < 2)
 		return CMD_RET_USAGE;
 
 	addr = hextoul(argv[1], NULL);
-	fdt = board_fdt_blob_setup();
+	fdt = board_fdt_blob_setup(&err);
 	entry = (uboot_entry_t)addr;
 	flush_cache((ulong)addr, 1 << 20);	/* 1MiB should be enough */
 	dcache_disable();
diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpress64/vexpress64.c
index 2e4260286b5a..d2f307cca5d2 100644
--- a/board/armltd/vexpress64/vexpress64.c
+++ b/board/armltd/vexpress64/vexpress64.c
@@ -131,12 +131,15 @@ static phys_addr_t find_dtb_in_nor_flash(const char *partname)
 	return ~0;
 }
 
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
 	phys_addr_t fdt_rom_addr = find_dtb_in_nor_flash(CONFIG_JUNO_DTB_PART);
 
-	if (fdt_rom_addr == ~0UL)
+	*err = 0;
+	if (fdt_rom_addr == ~0UL) {
+		*err = -ENXIO;
 		return NULL;
+	}
 
 	return (void *)fdt_rom_addr;
 }
diff --git a/board/broadcom/bcmstb/bcmstb.c b/board/broadcom/bcmstb/bcmstb.c
index 40d9def24b7b..e27a86c7fc50 100644
--- a/board/broadcom/bcmstb/bcmstb.c
+++ b/board/broadcom/bcmstb/bcmstb.c
@@ -136,8 +136,9 @@ int board_late_init(void)
 	return 0;
 }
 
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
+	*err = 0;
 	/* Stored the DTB address there during our init */
 	return (void *)prior_stage_fdt_address;
 }
diff --git a/board/emulation/qemu-arm/qemu-arm.c b/board/emulation/qemu-arm/qemu-arm.c
index aa68bef469a6..16d5a97167a6 100644
--- a/board/emulation/qemu-arm/qemu-arm.c
+++ b/board/emulation/qemu-arm/qemu-arm.c
@@ -94,8 +94,9 @@ int dram_init_banksize(void)
 	return 0;
 }
 
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
+	*err = 0;
 	/* QEMU loads a generated DTB for us at the start of RAM. */
 	return (void *)CONFIG_SYS_SDRAM_BASE;
 }
diff --git a/board/emulation/qemu-ppce500/qemu-ppce500.c b/board/emulation/qemu-ppce500/qemu-ppce500.c
index 924cc02c4be8..7d8ba34b2588 100644
--- a/board/emulation/qemu-ppce500/qemu-ppce500.c
+++ b/board/emulation/qemu-ppce500/qemu-ppce500.c
@@ -333,8 +333,9 @@ u32 cpu_mask(void)
  *
  * @return virtual address of FDT received from QEMU in r3 register
  */
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
+	*err = 0;
 	return get_fdt_virt();
 }
 
diff --git a/board/emulation/qemu-riscv/qemu-riscv.c b/board/emulation/qemu-riscv/qemu-riscv.c
index 2a26e265ffb9..b0d9dd59b12f 100644
--- a/board/emulation/qemu-riscv/qemu-riscv.c
+++ b/board/emulation/qemu-riscv/qemu-riscv.c
@@ -72,8 +72,9 @@ int board_fit_config_name_match(const char *name)
 }
 #endif
 
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
+	*err = 0;
 	/* Stored the DTB address there during our init */
 	return (void *)(ulong)gd->arch.firmware_fdt_addr;
 }
diff --git a/board/highbank/highbank.c b/board/highbank/highbank.c
index ffb6fd922daf..b5fa5101e881 100644
--- a/board/highbank/highbank.c
+++ b/board/highbank/highbank.c
@@ -111,8 +111,9 @@ int ft_board_setup(void *fdt, struct bd_info *bd)
 }
 #endif
 
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
+	*err = 0;
 	/*
 	 * The ECME management processor loads the DTB from NOR flash
 	 * into DRAM (at 4KB), where it gets patched to contain the
diff --git a/board/raspberrypi/rpi/rpi.c b/board/raspberrypi/rpi/rpi.c
index 372b26b6f2c0..d64aa933b804 100644
--- a/board/raspberrypi/rpi/rpi.c
+++ b/board/raspberrypi/rpi/rpi.c
@@ -488,10 +488,14 @@ int board_init(void)
 /*
  * If the firmware passed a device tree use it for U-Boot.
  */
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
-	if (fdt_magic(fw_dtb_pointer) != FDT_MAGIC)
+	*err = 0;
+	if (fdt_magic(fw_dtb_pointer) != FDT_MAGIC) {
+		*err = -ENXIO;
 		return NULL;
+	}
+
 	return (void *)fw_dtb_pointer;
 }
 
diff --git a/board/sifive/unleashed/unleashed.c b/board/sifive/unleashed/unleashed.c
index 8cd514df3005..8f57ca9b9da6 100644
--- a/board/sifive/unleashed/unleashed.c
+++ b/board/sifive/unleashed/unleashed.c
@@ -114,8 +114,9 @@ int misc_init_r(void)
 
 #endif
 
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
+	*err = 0;
 	if (IS_ENABLED(CONFIG_OF_SEPARATE)) {
 		if (gd->arch.firmware_fdt_addr)
 			return (ulong *)gd->arch.firmware_fdt_addr;
diff --git a/board/sifive/unmatched/unmatched.c b/board/sifive/unmatched/unmatched.c
index d90b252baef7..549f9f8f5aa3 100644
--- a/board/sifive/unmatched/unmatched.c
+++ b/board/sifive/unmatched/unmatched.c
@@ -11,8 +11,9 @@
 #include <dm.h>
 #include <asm/sections.h>
 
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
+	*err = 0;
 	if (IS_ENABLED(CONFIG_OF_SEPARATE)) {
 		if (gd->arch.firmware_fdt_addr)
 			return (ulong *)gd->arch.firmware_fdt_addr;
diff --git a/board/socrates/socrates.c b/board/socrates/socrates.c
index 3ba2fbbd5604..a81cb7b2ba66 100644
--- a/board/socrates/socrates.c
+++ b/board/socrates/socrates.c
@@ -220,13 +220,15 @@ int ft_board_setup(void *blob, struct bd_info *bd)
 #endif /* CONFIG_OF_BOARD_SETUP */
 
 #if defined(CONFIG_OF_SEPARATE)
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
 	void *fw_dtb;
 
+	*err = 0;
 	fw_dtb = (void *)(CONFIG_SYS_TEXT_BASE - CONFIG_ENV_SECT_SIZE);
 	if (fdt_magic(fw_dtb) != FDT_MAGIC) {
 		printf("DTB is not passed via %x\n", (u32)fw_dtb);
+		*err = -ENXIO;
 		return NULL;
 	}
 
diff --git a/board/xen/xenguest_arm64/xenguest_arm64.c b/board/xen/xenguest_arm64/xenguest_arm64.c
index 21363d878f75..6aa432d847f9 100644
--- a/board/xen/xenguest_arm64/xenguest_arm64.c
+++ b/board/xen/xenguest_arm64/xenguest_arm64.c
@@ -39,10 +39,13 @@ int board_init(void)
  * x0 is the physical address of the device tree blob (dtb) in system RAM.
  * This is stored in rom_pointer during low level init.
  */
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
-	if (fdt_magic(rom_pointer[0]) != FDT_MAGIC)
+	*err = 0;
+	if (fdt_magic(rom_pointer[0]) != FDT_MAGIC) {
+		*err = -ENXIO;
 		return NULL;
+	}
 	return (void *)rom_pointer[0];
 }
 
diff --git a/board/xilinx/common/board.c b/board/xilinx/common/board.c
index 9006bd3b4d2e..c577fc313037 100644
--- a/board/xilinx/common/board.c
+++ b/board/xilinx/common/board.c
@@ -320,7 +320,7 @@ __maybe_unused int xilinx_read_eeprom(void)
 }
 
 #if defined(CONFIG_OF_BOARD) || defined(CONFIG_OF_SEPARATE)
-void *board_fdt_blob_setup(void)
+void *board_fdt_blob_setup(int *err)
 {
 	void *fdt_blob;
 
@@ -353,6 +353,7 @@ void *board_fdt_blob_setup(void)
 		return fdt_blob;
 
 	debug("DTB is also not passed via %p\n", fdt_blob);
+	*err = -ENXIO;
 
 	return NULL;
 }
diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index f7098b496983..6ceffa7d7cae 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -86,7 +86,6 @@ CONFIG_MAC_PARTITION=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_OF_CONTROL=y
 CONFIG_OF_LIVE=y
-CONFIG_OF_HOSTFILE=y
 CONFIG_ENV_IS_NOWHERE=y
 CONFIG_ENV_IS_IN_EXT4=y
 CONFIG_ENV_EXT4_INTERFACE="host"
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index ea08a9e5bd18..17974b05999f 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -110,7 +110,6 @@ CONFIG_MAC_PARTITION=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_OF_CONTROL=y
 CONFIG_OF_LIVE=y
-CONFIG_OF_HOSTFILE=y
 CONFIG_ENV_IS_NOWHERE=y
 CONFIG_ENV_IS_IN_EXT4=y
 CONFIG_ENV_EXT4_INTERFACE="host"
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index a6e2544dc138..8f50410bb052 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -67,7 +67,6 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_MAC_PARTITION=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_OF_CONTROL=y
-CONFIG_OF_HOSTFILE=y
 CONFIG_ENV_IS_NOWHERE=y
 CONFIG_ENV_IS_IN_EXT4=y
 CONFIG_ENV_EXT4_INTERFACE="host"
diff --git a/configs/sandbox_noinst_defconfig b/configs/sandbox_noinst_defconfig
index 88443f5ab274..f1098987fe17 100644
--- a/configs/sandbox_noinst_defconfig
+++ b/configs/sandbox_noinst_defconfig
@@ -85,7 +85,6 @@ CONFIG_MAC_PARTITION=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_OF_CONTROL=y
 CONFIG_SPL_OF_CONTROL=y
-CONFIG_OF_HOSTFILE=y
 CONFIG_SPL_OF_PLATDATA=y
 CONFIG_ENV_IS_NOWHERE=y
 CONFIG_ENV_IS_IN_EXT4=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index 77dd83cf6fdd..454bf4d166a0 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -86,7 +86,6 @@ CONFIG_MAC_PARTITION=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_OF_CONTROL=y
 CONFIG_SPL_OF_CONTROL=y
-CONFIG_OF_HOSTFILE=y
 CONFIG_SPL_OF_PLATDATA=y
 CONFIG_SPL_OF_PLATDATA_INST=y
 CONFIG_ENV_IS_NOWHERE=y
diff --git a/configs/tools-only_defconfig b/configs/tools-only_defconfig
index f54bc1802ca7..e0866c11c47b 100644
--- a/configs/tools-only_defconfig
+++ b/configs/tools-only_defconfig
@@ -12,7 +12,6 @@ CONFIG_MISC_INIT_F=y
 CONFIG_BOOTP_DNS2=y
 # CONFIG_CMD_DATE is not set
 CONFIG_OF_CONTROL=y
-CONFIG_OF_HOSTFILE=y
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTP_SEND_HOSTNAME=y
 CONFIG_IP_DEFRAG=y
diff --git a/doc/develop/devicetree/control.rst b/doc/develop/devicetree/control.rst
index e84dfb6677a6..0e6f85d5af11 100644
--- a/doc/develop/devicetree/control.rst
+++ b/doc/develop/devicetree/control.rst
@@ -108,10 +108,9 @@ If CONFIG_OF_BOARD is defined, a board-specific routine will provide the
 devicetree at runtime, for example if an earlier bootloader stage creates
 it and passes it to U-Boot.
 
-If CONFIG_OF_HOSTFILE is defined, then it will be read from a file on
-startup. This is only useful for sandbox. Use the -d flag to U-Boot to
-specify the file to read, -D for the default and -T for the test devicetree,
-used to run sandbox unit tests.
+If CONFIG_SANDBOX is defined, then it will be read from a file on
+startup. Use the -d flag to U-Boot to specify the file to read, -D for the
+default and -T for the test devicetree, used to run sandbox unit tests.
 
 You cannot use more than one of these options at the same time.
 
diff --git a/dts/Kconfig b/dts/Kconfig
index 100769017e12..4728e7f39374 100644
--- a/dts/Kconfig
+++ b/dts/Kconfig
@@ -90,6 +90,7 @@ config OF_LIVE
 choice
 	prompt "Provider of DTB for DT control"
 	depends on OF_CONTROL
+	default OF_BOARD if SANDBOX
 
 config OF_SEPARATE
 	bool "Separate DTB for DT control"
@@ -108,20 +109,11 @@ config OF_EMBED
 
 config OF_BOARD
 	bool "Provided by the board (e.g a previous loader) at runtime"
-	depends on !SANDBOX
 	help
 	  If this option is enabled, the device tree will be provided by
 	  the board at runtime if the board supports it, instead of being
 	  bundled with the image.
 
-config OF_HOSTFILE
-	bool "Host filed DTB for DT control"
-	depends on SANDBOX
-	help
-	  If this option is enabled, DTB will be read from a file on startup.
-	  This is only useful for Sandbox.  Use the -d flag to U-Boot to
-	  specify the file to read.
-
 endchoice
 
 config DEFAULT_DEVICE_TREE
diff --git a/include/fdtdec.h b/include/fdtdec.h
index d0e13fc18313..a7e68d47097a 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -1172,8 +1172,10 @@ int fdtdec_resetup(int *rescan);
  * Board-specific FDT initialization. Returns the address to a device tree blob.
  * Called when CONFIG_OF_BOARD is defined, or if CONFIG_OF_SEPARATE is defined
  * and the board implements it.
+ *
+ * @err internal error code if we fail to setup a DTB
  */
-void *board_fdt_blob_setup(void);
+void *board_fdt_blob_setup(int *err);
 
 /*
  * Decode the size of memory
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 7b379564600d..25c176126ae4 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -1257,9 +1257,11 @@ static int uncompress_blob(const void *src, ulong sz_src, void **dstp)
  * For CONFIG_OF_SEPARATE, the board may optionally implement this to
  * provide and/or fixup the fdt.
  */
-__weak void *board_fdt_blob_setup(void)
+__weak void *board_fdt_blob_setup(int *err)
 {
 	void *fdt_blob = NULL;
+
+	*err = 0;
 #ifdef CONFIG_SPL_BUILD
 	/* FDT is at end of BSS unless it is in a different memory region */
 	if (IS_ENABLED(CONFIG_SPL_SEPARATE_BSS))
@@ -1270,6 +1272,7 @@ __weak void *board_fdt_blob_setup(void)
 	/* FDT is at end of image */
 	fdt_blob = (ulong *)&_end;
 #endif
+
 	return fdt_blob;
 }
 #endif
@@ -1574,12 +1577,9 @@ int fdtdec_setup(void)
 #  endif
 # elif defined(CONFIG_OF_BOARD) || defined(CONFIG_OF_SEPARATE)
 	/* Allow the board to override the fdt address. */
-	gd->fdt_blob = board_fdt_blob_setup();
-# elif defined(CONFIG_OF_HOSTFILE)
-	if (sandbox_read_fdt_from_file()) {
-		puts("Failed to read control FDT\n");
-		return -1;
-	}
+	gd->fdt_blob = board_fdt_blob_setup(&ret);
+	if (ret)
+		return ret;
 # endif
 # ifndef CONFIG_SPL_BUILD
 	/* Allow the early environment to override the fdt address */
diff --git a/scripts/Makefile.spl b/scripts/Makefile.spl
index 25a3e7fa52e9..307eff76ad07 100644
--- a/scripts/Makefile.spl
+++ b/scripts/Makefile.spl
@@ -298,11 +298,11 @@ endif
 # Build the .dtb file if:
 #   - we are not using OF_PLATDATA
 #   - we are using OF_CONTROL
-#   - we have either OF_SEPARATE or OF_HOSTFILE
+#   - we have either OF_SEPARATE or SANDBOX
 build_dtb :=
 ifeq ($(CONFIG_$(SPL_TPL_)OF_PLATDATA),)
 ifneq ($(CONFIG_$(SPL_TPL_)OF_CONTROL),)
-ifeq ($(CONFIG_OF_SEPARATE)$(CONFIG_OF_HOSTFILE),y)
+ifeq ($(CONFIG_OF_SEPARATE)$(CONFIG_SANDBOX),y)
 build_dtb := y
 endif
 endif
-- 
2.33.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
