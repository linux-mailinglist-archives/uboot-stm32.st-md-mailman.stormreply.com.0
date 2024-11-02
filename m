Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B68C9BA1D6
	for <lists+uboot-stm32@lfdr.de>; Sat,  2 Nov 2024 18:51:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A9B7C71292;
	Sat,  2 Nov 2024 17:51:22 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DFE0C6DD6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Nov 2024 17:51:14 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-71ec997ad06so2491767b3a.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 Nov 2024 10:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730569872; x=1731174672;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TSW1DsPKLDbX8i7LT2qQSX/Bg8Pk5VJtDQz9QH9XVbw=;
 b=KkwDpDIwJhYJ6OQa9eCDoBJugN7xmA3aYiSFX9LemXIgOIpkT/EHgXA75H6k6arlZ+
 sRjF8pUA9mYcBT7VopsqxTwzCG6HNEOjv8Tvv23jJ9mYyYprATdSPA/xr7LBHNV3+py5
 9yHsw2hm5GzpEJU15yWEE1kqn9qDCjqYqP7Sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730569872; x=1731174672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TSW1DsPKLDbX8i7LT2qQSX/Bg8Pk5VJtDQz9QH9XVbw=;
 b=N6qJRW2mqbJLQGeCLO6kWIxO4LvcBC/wG4wGaP++LETsDiPKi2qNHAflDy/icEibE8
 z3mx52T4Vx33usQ2ySIxdDX2Y1/frY6pGM9oXY/S6LzY7VhY/G7VdiLgAsbabSVeyjpR
 B/7aAGG+DDbktnz4Nq4WtErC810KkipHw5hLMW78sHxXIKiwmAW8r/qQvsCtnozlZzxF
 OaBWWwF4UwoQNGTGiz4i//9MvoZYwIE3DcBVmxDXBzcQW0qTeRfGY6l0CVlEDauyySt1
 SsmoytG6BVQpbf4c5Yxsi5MB/6TWbWDvscdeJoq6Hrij7XHoWRc5hiOxH4Bs3o2xaVxU
 xIXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzhWY7GyRCyS6Oaz3MznLIp4k4PmaKFTMn9nI1cUxlJYPf9qOZfrfmPtobK9qZgodfHnJQwogd7N6i1Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzSRZzcvSUhzAN/mdeG3v4CRE7rFJIpzV5q71VOurzFOukNu251
 5a2Zo9a5Zc1OWMTe3cny3YtLaEON1aTO5ubSJ9AZjp4I0pWBHZK2KaE41493UA==
X-Google-Smtp-Source: AGHT+IEDX7iP/Q8KyZQAEo8eSqThwl/l3OaPRXFXFS1oY3yqYC22tmxV/Vg7M9JWSrilWIcmjiWK1g==
X-Received: by 2002:a05:6a21:6f01:b0:1d9:985:ec1c with SMTP id
 adf61e73a8af0-1d9eecc3acfmr19876128637.24.1730569872361; 
 Sat, 02 Nov 2024 10:51:12 -0700 (PDT)
Received: from chromium.org ([205.220.129.22])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc1e5cbesm4402403b3a.61.2024.11.02.10.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 10:51:11 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sat,  2 Nov 2024 11:49:42 -0600
Message-ID: <20241102174944.412088-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241102174944.412088-1-sjg@chromium.org>
References: <20241102174944.412088-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: David Feng <fenghua@phytium.com.cn>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Rick Chen <rick@andestech.com>,
 H Bell <dmoo_dv@protonmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Peng Fan <peng.fan@nxp.com>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Janne Grunau <j@jannau.net>, Marek Vasut <marex@denx.de>,
 Randolph <randolph@andestech.com>, Mark Kettenis <kettenis@openbsd.org>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, E Shattow <lucent@gmail.com>,
 Jerry Van Baren <vanbaren@cideas.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Francois Berder <fberder@outlook.fr>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Day <me@samcday.com>,
 William Zhang <william.zhang@broadcom.com>,
 Matthias Brugger <mbrugger@suse.com>, Andre Przywara <andre.przywara@arm.com>,
 Tim Harvey <tharvey@gateworks.com>, u-boot-qcom@groups.io,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Green Wan <green.wan@sifive.com>, Minda Chen <minda.chen@starfivetech.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Atish Patra <atishp@atishpatra.org>,
 Peter Hoyes <Peter.Hoyes@arm.com>, Michal Simek <michal.simek@amd.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Eric Curtin <ecurtin@redhat.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>,
 Sumit Garg <sumit.garg@linaro.org>
Subject: [Uboot-stm32] [PATCH v2 2/2] fdt: Swap the signature for
	board_fdt_blob_setup()
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

This returns a devicetree and updates a parameter with an error code.
Swap it, since this fits better with the way U-Boot normally works. It
also (more easily) allows leaving the existing pointer unchanged.

No yaks were harmed in this change, but there is a very small code-size
reduction.

For sifive, the OF_BOARD option must be set for the function to be
called, so there is no point in checking it again. Also OF_SEPARATE is
defined always.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Set up the existing FDT in case the board wants to check it
- Update snapdragon to return -EEXIST
- Set the existing FDT before calling board_fd_blob_setup()
- Update sandbox to return -EEXIST if an fdt comes from a bloblist
- Update do_go_uboot() to set the existing FDT
- Drop unnecessary setting of FDT in vexpress64
- Tidy up redundant RISC-V code

 arch/arm/mach-apple/board.c                   |  7 ++--
 arch/arm/mach-snapdragon/board.c              |  9 ++---
 arch/arm/mach-stm32mp/boot_params.c           | 19 ++++++-----
 arch/sandbox/cpu/cpu.c                        | 34 +++++++++----------
 board/Marvell/octeontx/board-fdt.c            | 12 +++----
 board/Marvell/octeontx2/board-fdt.c           | 12 +++----
 board/Marvell/octeontx2/board.c               |  3 +-
 board/andestech/ae350/ae350.c                 | 23 +++++++------
 board/armltd/vexpress64/vexpress64.c          | 33 ++++++++----------
 board/broadcom/bcmstb/bcmstb.c                |  7 ++--
 board/emulation/qemu-arm/qemu-arm.c           |  7 ++--
 board/emulation/qemu-ppce500/qemu-ppce500.c   | 12 +++----
 board/emulation/qemu-riscv/qemu-riscv.c       |  7 ++--
 board/highbank/highbank.c                     |  7 ++--
 board/raspberrypi/rpi/rpi.c                   | 13 ++++---
 board/sifive/unleashed/unleashed.c            | 12 +++----
 board/sifive/unmatched/unmatched.c            | 11 +++---
 .../visionfive2/starfive_visionfive2.c        | 11 +++---
 board/xen/xenguest_arm64/xenguest_arm64.c     | 14 ++++----
 board/xilinx/common/board.c                   | 26 ++++++++------
 include/fdtdec.h                              |  9 ++---
 lib/fdtdec.c                                  | 14 +++++---
 22 files changed, 152 insertions(+), 150 deletions(-)

diff --git a/arch/arm/mach-apple/board.c b/arch/arm/mach-apple/board.c
index 0b6d290b8ac..2644a04a622 100644
--- a/arch/arm/mach-apple/board.c
+++ b/arch/arm/mach-apple/board.c
@@ -691,11 +691,12 @@ int dram_init_banksize(void)
 
 extern long fw_dtb_pointer;
 
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
 	/* Return DTB pointer passed by m1n1 */
-	*err = 0;
-	return (void *)fw_dtb_pointer;
+	*fdtp = (void *)fw_dtb_pointer;
+
+	return 0;
 }
 
 void build_mem_map(void)
diff --git a/arch/arm/mach-snapdragon/board.c b/arch/arm/mach-snapdragon/board.c
index 2ab2ceb5138..cd49de540f0 100644
--- a/arch/arm/mach-snapdragon/board.c
+++ b/arch/arm/mach-snapdragon/board.c
@@ -147,12 +147,12 @@ static void show_psci_version(void)
  * or for supporting quirky devices where it's easier to leave the downstream DT in place
  * to improve ABL compatibility. Otherwise, we use the DT provided by ABL.
  */
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
 	struct fdt_header *fdt;
 	bool internal_valid, external_valid;
+	int ret = 0;
 
-	*err = 0;
 	fdt = (struct fdt_header *)get_prev_bl_fdt_addr();
 	external_valid = fdt && !fdt_check_header(fdt);
 	internal_valid = !fdt_check_header(gd->fdt_blob);
@@ -167,10 +167,11 @@ void *board_fdt_blob_setup(int *err)
 
 	if (internal_valid) {
 		debug("Using built in FDT\n");
+		ret = -EEXIST;
 	} else {
 		debug("Using external FDT\n");
 		/* So we can use it before returning */
-		gd->fdt_blob = fdt;
+		*fdtp = fdt;
 	}
 
 	/*
@@ -179,7 +180,7 @@ void *board_fdt_blob_setup(int *err)
 	 */
 	qcom_parse_memory();
 
-	return (void *)gd->fdt_blob;
+	return ret;
 }
 
 void reset_cpu(void)
diff --git a/arch/arm/mach-stm32mp/boot_params.c b/arch/arm/mach-stm32mp/boot_params.c
index ebddf6a7dbc..2d058edc419 100644
--- a/arch/arm/mach-stm32mp/boot_params.c
+++ b/arch/arm/mach-stm32mp/boot_params.c
@@ -6,6 +6,7 @@
 #define LOG_CATEGORY LOGC_ARCH
 
 #include <config.h>
+#include <errno.h>
 #include <log.h>
 #include <linux/libfdt.h>
 #include <asm/arch/sys_proto.h>
@@ -16,20 +17,22 @@
  * Use the saved FDT address provided by TF-A at boot time (NT_FW_CONFIG =
  * Non Trusted Firmware configuration file) when the pointer is valid
  */
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
 	unsigned long nt_fw_dtb = get_stm32mp_bl2_dtb();
 
 	log_debug("%s: nt_fw_dtb=%lx\n", __func__, nt_fw_dtb);
 
-	*err = 0;
 	/* use external device tree only if address is valid */
-	if (nt_fw_dtb >= STM32_DDR_BASE) {
-		if (fdt_magic(nt_fw_dtb) == FDT_MAGIC)
-			return (void *)nt_fw_dtb;
-		log_debug("%s: DTB not found.\n", __func__);
+	if (nt_fw_dtb < STM32_DDR_BASE ||
+	    fdt_magic(nt_fw_dtb) != FDT_MAGIC) {
+		log_debug("DTB not found.\n");
+		log_debug("fall back to builtin DTB, %p\n", _end);
+
+		return -EEXIST;
 	}
-	log_debug("%s: fall back to builtin DTB, %p\n", __func__, _end);
 
-	return (void *)_end;
+	*fdtp = (void *)nt_fw_dtb;
+
+	return 0;
 }
diff --git a/arch/sandbox/cpu/cpu.c b/arch/sandbox/cpu/cpu.c
index 06f8c13fab9..a1bcb26e25e 100644
--- a/arch/sandbox/cpu/cpu.c
+++ b/arch/sandbox/cpu/cpu.c
@@ -355,7 +355,7 @@ static int setup_auto_tree(void *blob)
 	return 0;
 }
 
-void *board_fdt_blob_setup(int *ret)
+int board_fdt_blob_setup(void **fdtp)
 {
 	struct sandbox_state *state = state_get_current();
 	const char *fname = state->fdt_fname;
@@ -365,43 +365,41 @@ void *board_fdt_blob_setup(int *ret)
 	int fd;
 
 	if (gd->fdt_blob)
-		return (void *)gd->fdt_blob;
+		return -EEXIST;
 	blob = map_sysmem(CONFIG_SYS_FDT_LOAD_ADDR, 0);
-	*ret = 0;
 	if (!state->fdt_fname) {
 		err = setup_auto_tree(blob);
-		if (!err)
-			goto done;
-		os_printf("Unable to create empty FDT: %s\n", fdt_strerror(err));
-		*ret = -EINVAL;
-		goto fail;
+		if (err) {
+			os_printf("Unable to create empty FDT: %s\n",
+				  fdt_strerror(err));
+			return -EINVAL;
+		}
+		*fdtp = blob;
+
+		return 0;
 	}
 
 	err = os_get_filesize(fname, &size);
 	if (err < 0) {
 		os_printf("Failed to find FDT file '%s'\n", fname);
-		*ret = err;
-		goto fail;
+		return err;
 	}
 	fd = os_open(fname, OS_O_RDONLY);
 	if (fd < 0) {
 		os_printf("Failed to open FDT file '%s'\n", fname);
-		*ret = -EACCES;
-		goto fail;
+		return -EACCES;
 	}
 
 	if (os_read(fd, blob, size) != size) {
 		os_close(fd);
 		os_printf("Failed to read FDT file '%s'\n", fname);
-		*ret =  -EIO;
-		goto fail;
+		return -EIO;
 	}
 	os_close(fd);
 
-done:
-	return blob;
-fail:
-	return NULL;
+	*fdtp = blob;
+
+	return 0;
 }
 
 ulong timer_get_boot_us(void)
diff --git a/board/Marvell/octeontx/board-fdt.c b/board/Marvell/octeontx/board-fdt.c
index 6642b167e19..9d913b959e0 100644
--- a/board/Marvell/octeontx/board-fdt.c
+++ b/board/Marvell/octeontx/board-fdt.c
@@ -296,13 +296,9 @@ int ft_board_setup(void *blob, struct bd_info *bd)
 	return 0;
 }
 
-/**
- * Return the FDT base address that was passed by ATF
- *
- * Return:	FDT base address received from ATF in x1 register
- */
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
-	*err = 0;
-	return (void *)fdt_base_addr;
+	*fdtp = (void *)fdt_base_addr;
+
+	return 0;
 }
diff --git a/board/Marvell/octeontx2/board-fdt.c b/board/Marvell/octeontx2/board-fdt.c
index 04be9fb0a9a..e5a4db00bb7 100644
--- a/board/Marvell/octeontx2/board-fdt.c
+++ b/board/Marvell/octeontx2/board-fdt.c
@@ -210,13 +210,9 @@ int ft_board_setup(void *blob, struct bd_info *bd)
 	return 0;
 }
 
-/**
- * Return the FDT base address that was passed by ATF
- *
- * Return:	FDT base address received from ATF in x1 register
- */
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
-	*err = 0;
-	return (void *)fdt_base_addr;
+	*fdtp = (void *)fdt_base_addr;
+
+	return 0;
 }
diff --git a/board/Marvell/octeontx2/board.c b/board/Marvell/octeontx2/board.c
index 974e9eb8200..01ba53cf68d 100644
--- a/board/Marvell/octeontx2/board.c
+++ b/board/Marvell/octeontx2/board.c
@@ -234,7 +234,8 @@ static int do_go_uboot(struct cmd_tbl *cmdtp, int flag, int argc,
 		return CMD_RET_USAGE;
 
 	addr = hextoul(argv[1], NULL);
-	fdt = board_fdt_blob_setup(&err);
+	fdt = (void *)gd->fdt_blob;
+	err = board_fdt_blob_setup(&fdt);
 	entry = (uboot_entry_t)addr;
 	flush_cache((ulong)addr, 1 << 20);	/* 1MiB should be enough */
 	dcache_disable();
diff --git a/board/andestech/ae350/ae350.c b/board/andestech/ae350/ae350.c
index 5ae5baed6ba..1d9d4a929c2 100644
--- a/board/andestech/ae350/ae350.c
+++ b/board/andestech/ae350/ae350.c
@@ -79,21 +79,24 @@ ulong board_flash_get_legacy(ulong base, int banknum, flash_info_t *info)
 }
 
 #define ANDES_HW_DTB_ADDRESS	0xF2000000
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
-	*err = 0;
-
 	if (IS_ENABLED(CONFIG_OF_SEPARATE) || IS_ENABLED(CONFIG_OF_BOARD)) {
-		if (fdt_magic((uintptr_t)gd->arch.firmware_fdt_addr) == FDT_MAGIC)
-			return (void *)(ulong)gd->arch.firmware_fdt_addr;
+		if (fdt_magic((uintptr_t)gd->arch.firmware_fdt_addr) ==
+			FDT_MAGIC) {
+			*fdtp = (void *)(ulong)gd->arch.firmware_fdt_addr;
+
+			return 0;
+		}
 	}
 
-	if (fdt_magic(CONFIG_SYS_FDT_BASE) == FDT_MAGIC)
-		return (void *)CONFIG_SYS_FDT_BASE;
-	return (void *)ANDES_HW_DTB_ADDRESS;
+	if (fdt_magic(CONFIG_SYS_FDT_BASE) == FDT_MAGIC) {
+		*fdtp = (void *)CONFIG_SYS_FDT_BASE;
+
+		return 0;
+	}
 
-	*err = -EINVAL;
-	return NULL;
+	return -EINVAL;
 }
 
 #ifdef CONFIG_SPL_BOARD_INIT
diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpress64/vexpress64.c
index 0119f54f0df..b5ede58757d 100644
--- a/board/armltd/vexpress64/vexpress64.c
+++ b/board/armltd/vexpress64/vexpress64.c
@@ -168,42 +168,37 @@ static bool is_valid_dtb(uintptr_t dtb_ptr)
 	return fdt_subnode_offset((void *)dtb_ptr, 0, "memory") >= 0;
 }
 
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
 #ifdef CONFIG_TARGET_VEXPRESS64_JUNO
 	phys_addr_t fdt_rom_addr = find_dtb_in_nor_flash(CONFIG_JUNO_DTB_PART);
 
-	*err = 0;
-	if (fdt_rom_addr == ~0UL) {
-		*err = -ENXIO;
-		return NULL;
-	}
+	if (fdt_rom_addr == ~0UL)
+		return -ENXIO;
 
-	return (void *)fdt_rom_addr;
+	*fdtp = (void *)fdt_rom_addr;
+	return 0;
 #endif
 
 #ifdef VEXPRESS_FDT_ADDR
 	if (fdt_magic(VEXPRESS_FDT_ADDR) == FDT_MAGIC) {
-		*err = 0;
-		return (void *)VEXPRESS_FDT_ADDR;
+		*fdtp = (void *)VEXPRESS_FDT_ADDR;
+		return 0;
 	}
 #endif
 
 	if (is_valid_dtb(prior_stage_fdt_address[1])) {
-		*err = 0;
-		return (void *)prior_stage_fdt_address[1];
+		*fdtp = (void *)prior_stage_fdt_address[1];
+		return 0;
 	} else if (is_valid_dtb(prior_stage_fdt_address[0])) {
-		*err = 0;
-		return (void *)prior_stage_fdt_address[0];
+		*fdtp = (void *)prior_stage_fdt_address[0];
+		return 0;
 	}
 
-	if (fdt_magic(gd->fdt_blob) == FDT_MAGIC) {
-		*err = 0;
-		return (void *)gd->fdt_blob;
-	}
+	if (fdt_magic(*fdtp) == FDT_MAGIC)
+		return 0;
 
-	*err = -ENXIO;
-	return NULL;
+	return -ENXIO;
 }
 #endif
 
diff --git a/board/broadcom/bcmstb/bcmstb.c b/board/broadcom/bcmstb/bcmstb.c
index bc05aecc446..e655f610c84 100644
--- a/board/broadcom/bcmstb/bcmstb.c
+++ b/board/broadcom/bcmstb/bcmstb.c
@@ -130,9 +130,10 @@ int board_late_init(void)
 	return 0;
 }
 
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
-	*err = 0;
 	/* Stored the DTB address there during our init */
-	return (void *)prior_stage_fdt_address;
+	*fdtp = (void *)prior_stage_fdt_address;
+
+	return 0;
 }
diff --git a/board/emulation/qemu-arm/qemu-arm.c b/board/emulation/qemu-arm/qemu-arm.c
index 6095cb02b23..8476796f1c3 100644
--- a/board/emulation/qemu-arm/qemu-arm.c
+++ b/board/emulation/qemu-arm/qemu-arm.c
@@ -149,11 +149,12 @@ int dram_init_banksize(void)
 	return 0;
 }
 
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
-	*err = 0;
 	/* QEMU loads a generated DTB for us at the start of RAM. */
-	return (void *)CFG_SYS_SDRAM_BASE;
+	*fdtp = (void *)CFG_SYS_SDRAM_BASE;
+
+	return 0;
 }
 
 void enable_caches(void)
diff --git a/board/emulation/qemu-ppce500/qemu-ppce500.c b/board/emulation/qemu-ppce500/qemu-ppce500.c
index 58e5d5eb942..40d295dbf06 100644
--- a/board/emulation/qemu-ppce500/qemu-ppce500.c
+++ b/board/emulation/qemu-ppce500/qemu-ppce500.c
@@ -334,15 +334,11 @@ u32 cpu_mask(void)
 	return (1 << cpu_numcores()) - 1;
 }
 
-/**
- * Return the virtual address of FDT that was passed by QEMU
- *
- * Return: virtual address of FDT received from QEMU in r3 register
- */
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
-	*err = 0;
-	return get_fdt_virt();
+	*fdtp = get_fdt_virt();
+
+	return 0;
 }
 
 /* See CFG_SYS_NS16550_CLK in arch/powerpc/include/asm/config.h */
diff --git a/board/emulation/qemu-riscv/qemu-riscv.c b/board/emulation/qemu-riscv/qemu-riscv.c
index e5193e31e37..a90222ea6a4 100644
--- a/board/emulation/qemu-riscv/qemu-riscv.c
+++ b/board/emulation/qemu-riscv/qemu-riscv.c
@@ -64,9 +64,10 @@ int board_fit_config_name_match(const char *name)
 }
 #endif
 
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
-	*err = 0;
 	/* Stored the DTB address there during our init */
-	return (void *)(ulong)gd->arch.firmware_fdt_addr;
+	*fdtp = (void *)(ulong)gd->arch.firmware_fdt_addr;
+
+	return 0;
 }
diff --git a/board/highbank/highbank.c b/board/highbank/highbank.c
index f3df83ed6c9..0ec88447384 100644
--- a/board/highbank/highbank.c
+++ b/board/highbank/highbank.c
@@ -97,15 +97,16 @@ int ft_board_setup(void *fdt, struct bd_info *bd)
 }
 #endif
 
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
-	*err = 0;
 	/*
 	 * The ECME management processor loads the DTB from NOR flash
 	 * into DRAM (at 4KB), where it gets patched to contain the
 	 * detected memory size.
 	 */
-	return (void *)0x1000;
+	*fdtp = (void *)0x1000;
+
+	return 0;
 }
 
 static int is_highbank(void)
diff --git a/board/raspberrypi/rpi/rpi.c b/board/raspberrypi/rpi/rpi.c
index 9122f33d88d..c46fe4b2350 100644
--- a/board/raspberrypi/rpi/rpi.c
+++ b/board/raspberrypi/rpi/rpi.c
@@ -508,15 +508,14 @@ int board_init(void)
 /*
  * If the firmware passed a device tree use it for U-Boot.
  */
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
-	*err = 0;
-	if (fdt_magic(fw_dtb_pointer) != FDT_MAGIC) {
-		*err = -ENXIO;
-		return NULL;
-	}
+	if (fdt_magic(fw_dtb_pointer) != FDT_MAGIC)
+		return -ENXIO;
 
-	return (void *)fw_dtb_pointer;
+	*fdtp = (void *)fw_dtb_pointer;
+
+	return 0;
 }
 
 int copy_property(void *dst, void *src, char *path, char *property)
diff --git a/board/sifive/unleashed/unleashed.c b/board/sifive/unleashed/unleashed.c
index 3c5dd50c369..c1c374610c3 100644
--- a/board/sifive/unleashed/unleashed.c
+++ b/board/sifive/unleashed/unleashed.c
@@ -114,15 +114,15 @@ int misc_init_r(void)
 
 #endif
 
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
-	*err = 0;
-	if (IS_ENABLED(CONFIG_OF_SEPARATE) || IS_ENABLED(CONFIG_OF_BOARD)) {
-		if (gd->arch.firmware_fdt_addr)
-			return (ulong *)(uintptr_t)gd->arch.firmware_fdt_addr;
+	if (gd->arch.firmware_fdt_addr) {
+		*fdtp = (ulong *)(uintptr_t)gd->arch.firmware_fdt_addr;
+
+		return 0;
 	}
 
-	return (ulong *)_end;
+	return -EEXIST;
 }
 
 int board_init(void)
diff --git a/board/sifive/unmatched/unmatched.c b/board/sifive/unmatched/unmatched.c
index c8696270ba2..23e03e145ee 100644
--- a/board/sifive/unmatched/unmatched.c
+++ b/board/sifive/unmatched/unmatched.c
@@ -10,15 +10,14 @@
 #include <dm.h>
 #include <asm/sections.h>
 
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
-	*err = 0;
-	if (IS_ENABLED(CONFIG_OF_SEPARATE) || IS_ENABLED(CONFIG_OF_BOARD)) {
-		if (gd->arch.firmware_fdt_addr)
-			return (ulong *)(uintptr_t)gd->arch.firmware_fdt_addr;
+	if (gd->arch.firmware_fdt_addr) {
+		*fdtp = (ulong *)(uintptr_t)gd->arch.firmware_fdt_addr;
+		return 0;
 	}
 
-	return (ulong *)_end;
+	return -EEXIST;
 }
 
 int board_init(void)
diff --git a/board/starfive/visionfive2/starfive_visionfive2.c b/board/starfive/visionfive2/starfive_visionfive2.c
index f6114602f88..3940d45b13f 100644
--- a/board/starfive/visionfive2/starfive_visionfive2.c
+++ b/board/starfive/visionfive2/starfive_visionfive2.c
@@ -115,15 +115,14 @@ int board_late_init(void)
 	return 0;
 }
 
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
-	*err = 0;
-	if (IS_ENABLED(CONFIG_OF_SEPARATE) || IS_ENABLED(CONFIG_OF_BOARD)) {
-		if (gd->arch.firmware_fdt_addr)
-			return (ulong *)(uintptr_t)gd->arch.firmware_fdt_addr;
+	if (gd->arch.firmware_fdt_addr) {
+		*fdtp = (ulong *)(uintptr_t)gd->arch.firmware_fdt_addr;
+		return 0;
 	}
 
-	return (ulong *)_end;
+	return -EEXIST;
 }
 
 int ft_board_setup(void *blob, struct bd_info *bd)
diff --git a/board/xen/xenguest_arm64/xenguest_arm64.c b/board/xen/xenguest_arm64/xenguest_arm64.c
index 4c3b9c9e278..216a022aa15 100644
--- a/board/xen/xenguest_arm64/xenguest_arm64.c
+++ b/board/xen/xenguest_arm64/xenguest_arm64.c
@@ -44,14 +44,14 @@ int board_init(void)
  * x0 is the physical address of the device tree blob (dtb) in system RAM.
  * This is stored in rom_pointer during low level init.
  */
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
-	*err = 0;
-	if (fdt_magic(rom_pointer[0]) != FDT_MAGIC) {
-		*err = -ENXIO;
-		return NULL;
-	}
-	return (void *)rom_pointer[0];
+	if (fdt_magic(rom_pointer[0]) != FDT_MAGIC)
+		return -ENXIO;
+
+	*fdtp = (void *)rom_pointer[0];
+
+	return 0;
 }
 
 /*
diff --git a/board/xilinx/common/board.c b/board/xilinx/common/board.c
index 38dd80533fa..f9421b9a988 100644
--- a/board/xilinx/common/board.c
+++ b/board/xilinx/common/board.c
@@ -357,17 +357,17 @@ __maybe_unused int xilinx_read_eeprom(void)
 }
 
 #if defined(CONFIG_OF_BOARD)
-void *board_fdt_blob_setup(int *err)
+int board_fdt_blob_setup(void **fdtp)
 {
 	void *fdt_blob;
 
-	*err = 0;
-
 	if (IS_ENABLED(CONFIG_TARGET_XILINX_MBV)) {
 		fdt_blob = (void *)CONFIG_XILINX_OF_BOARD_DTB_ADDR;
 
-		if (fdt_magic(fdt_blob) == FDT_MAGIC)
-			return fdt_blob;
+		if (fdt_magic(fdt_blob) == FDT_MAGIC) {
+			*fdtp = fdt_blob;
+			return 0;
+		}
 	}
 
 	if (!IS_ENABLED(CONFIG_XPL_BUILD) &&
@@ -375,8 +375,10 @@ void *board_fdt_blob_setup(int *err)
 	    !IS_ENABLED(CONFIG_ZYNQMP_NO_DDR)) {
 		fdt_blob = (void *)CONFIG_XILINX_OF_BOARD_DTB_ADDR;
 
-		if (fdt_magic(fdt_blob) == FDT_MAGIC)
-			return fdt_blob;
+		if (fdt_magic(fdt_blob) == FDT_MAGIC) {
+			*fdtp = fdt_blob;
+			return 0;
+		}
 
 		debug("DTB is not passed via %p\n", fdt_blob);
 	}
@@ -395,13 +397,15 @@ void *board_fdt_blob_setup(int *err)
 		fdt_blob = (ulong *)_end;
 	}
 
-	if (fdt_magic(fdt_blob) == FDT_MAGIC)
-		return fdt_blob;
+	if (fdt_magic(fdt_blob) == FDT_MAGIC) {
+		*fdtp = fdt_blob;
+
+		return 0;
+	}
 
 	debug("DTB is also not passed via %p\n", fdt_blob);
 
-	*err = -EINVAL;
-	return NULL;
+	return -EINVAL;
 }
 #endif
 
diff --git a/include/fdtdec.h b/include/fdtdec.h
index 555c9520379..58bbd8f392e 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -1191,11 +1191,12 @@ int fdtdec_resetup(int *rescan);
  *
  * The existing devicetree is available at gd->fdt_blob
  *
- * @err: 0 on success, -EEXIST if the devicetree is already correct, or other
- * internal error code if we fail to setup a DTB
- * @returns new devicetree blob pointer
+ * @fdtp: Existing devicetree blob pointer; update this and return 0 if a
+ * different devicetree should be used
+ * Return: 0 on success, -EEXIST if the existing FDT is OK, -ve error code if we
+ * fail to setup a DTB
  */
-void *board_fdt_blob_setup(int *err);
+int board_fdt_blob_setup(void **fdtp);
 
 /*
  * Decode the size of memory
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 60e28173c03..c5d29d4385a 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -1706,11 +1706,17 @@ int fdtdec_setup(void)
 
 	/* Allow the board to override the fdt address. */
 	if (IS_ENABLED(CONFIG_OF_BOARD)) {
-		gd->fdt_blob = board_fdt_blob_setup(&ret);
-		if (!ret)
+		void *blob;
+
+		blob = (void *)gd->fdt_blob;
+		ret = board_fdt_blob_setup(&blob);
+		if (ret) {
+			if (ret != -EEXIST)
+				return ret;
+		} else {
 			gd->fdt_src = FDTSRC_BOARD;
-		else if (ret != -EEXIST)
-			return ret;
+			gd->fdt_blob = blob;
+		}
 	}
 
 	/* Allow the early environment to override the fdt address */
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
