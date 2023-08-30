Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A3278D7EB
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Aug 2023 20:05:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29E59C6A61A;
	Wed, 30 Aug 2023 18:05:42 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77286C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 18:05:40 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-34bbc5eb310so91705ab.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 11:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693418739; x=1694023539;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e5/LATKb1c6eCqcANfnLNloWEVSxBNfzCFMw6LVaYNc=;
 b=cKHFo5If0J5ppDpsJNaWvb4WRE71iFK0FokHeaNfvevaQm4AsEkDpNc1NE7Y3DDi7C
 CbVDhZPhm0S4LmGUgUcMJ1ujE8CFZbtDILCeUGGL7WQK6yIyhDWEypicWVKt+ktJ6o8Q
 jQU8a0ary9+5yXVqDRJSoFHTKw+kNDe/oDTss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693418739; x=1694023539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e5/LATKb1c6eCqcANfnLNloWEVSxBNfzCFMw6LVaYNc=;
 b=A2z0JQd5Sa1riUtlzFCGYyAKcf6/9qqCOe3WyZqi4BINgy0CPaTtDZ/XDcsM6ikDyE
 7MtmI4Z0wABDmvxKN5hk9A5kJwsadJ+QNHT655qlBpg+DrbCV9/AUBmMOiAeLAZ3gnso
 Jc00SULUVQzYa0xVSFYEdU+VeU/u30xN06TOXRblOORxkoG9bOYfRVdwDMQlLUwY2IMx
 dbb10+YObUBcYV8thvkK7ax2cOLuRYpsdn7e7Z6NA8saumX9U1iTEl14gdurIf7AqIdF
 8vzojdLs0bR78pEiRnbSNYH2coz0NqNzWlfqxqyu+VVGOXoNNaO6PPtQ0kGp4fEFkX/r
 U/MA==
X-Gm-Message-State: AOJu0YwvsumQhqUB4uOQdDyET+zaLnM61gT/8KdSqT0OyfRpACSv6reR
 qCO9KvtCltYzWpYCoCfuLjJdNw==
X-Google-Smtp-Source: AGHT+IGN4ZhyS798/EtPibARxboPkCbkst8FtioPktQv4Q5Nn5EJSk7TxuRfqPubJlMJSPDbN4QvcQ==
X-Received: by 2002:a92:cb0e:0:b0:346:8b4:34c with SMTP id
 s14-20020a92cb0e000000b0034608b4034cmr3667772ilo.16.1693418739229; 
 Wed, 30 Aug 2023 11:05:39 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:b147:266a:7359:2232])
 by smtp.gmail.com with ESMTPSA id
 dk54-20020a0566384bf600b0042bbd3e49b9sm4002224jab.24.2023.08.30.11.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 11:05:38 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Wed, 30 Aug 2023 12:04:34 -0600
Message-ID: <20230830180524.315916-4-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
In-Reply-To: <20230830180524.315916-1-sjg@chromium.org>
References: <20230830180524.315916-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Mario Kicherer <dev@kicherer.org>, Elena Popa <elena.popa@nxp.com>,
 =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Simone CIANNI <simone.cianni@bticino.it>,
 Jagan Teki <jagan@amarulasolutions.com>, Thomas Weber <weber@corscience.de>,
 Enric Balletbo i Serra <eballetbo@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Roger Quadros <rogerq@kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Raffaele RECALCATI <raffaele.recalcati@bticino.it>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Michal Simek <michal.simek@amd.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Vikas Manocha <vikas.manocha@st.com>, Adam Ford <aford173@gmail.com>,
 Nikhil M Jain <n-jain1@ti.com>, Tom McLeod <tom.mcleod@opalkelly.com>
Subject: [Uboot-stm32] [PATCH 03/32] spl: Rename SYS_SPL_ARGS_ADDR to
	SPL_SYS_ARGS_ADDR
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

Rename this so that SPL is first, as per U-Boot convention.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/cpu/armv8/fsl-layerscape/doc/README.falcon |  2 +-
 common/spl/Kconfig                                  |  2 +-
 common/spl/spl.c                                    |  8 ++++----
 common/spl/spl_ext.c                                |  4 ++--
 common/spl/spl_fat.c                                |  4 ++--
 common/spl/spl_mmc.c                                |  2 +-
 common/spl/spl_nand.c                               | 10 +++++-----
 common/spl/spl_nor.c                                |  8 ++++----
 common/spl/spl_spi.c                                |  2 +-
 common/spl/spl_ubi.c                                |  2 +-
 common/spl/spl_xip.c                                |  2 +-
 configs/am3517_evm_defconfig                        |  2 +-
 configs/devkit8000_defconfig                        |  2 +-
 configs/display5_defconfig                          |  2 +-
 configs/display5_factory_defconfig                  |  2 +-
 configs/gwventana_emmc_defconfig                    |  2 +-
 configs/gwventana_nand_defconfig                    |  2 +-
 configs/igep00x0_defconfig                          |  2 +-
 configs/imx28_xea_defconfig                         |  2 +-
 configs/imx6dl_mamoj_defconfig                      |  2 +-
 configs/imx6q_logic_defconfig                       |  2 +-
 configs/imx6qdl_icore_mipi_defconfig                |  2 +-
 configs/imx6qdl_icore_mmc_defconfig                 |  2 +-
 configs/imx6qdl_icore_rqs_defconfig                 |  2 +-
 configs/ls1046ardb_qspi_spl_defconfig               |  2 +-
 configs/mccmon6_nor_defconfig                       |  2 +-
 configs/omap35_logic_defconfig                      |  2 +-
 configs/omap35_logic_somlv_defconfig                |  2 +-
 configs/omap3_logic_defconfig                       |  2 +-
 configs/omap3_logic_somlv_defconfig                 |  2 +-
 configs/riotboard_defconfig                         |  2 +-
 configs/stm32746g-eval_spl_defconfig                |  2 +-
 configs/stm32f746-disco_spl_defconfig               |  2 +-
 configs/stm32f769-disco_spl_defconfig               |  2 +-
 configs/syzygy_hub_defconfig                        |  2 +-
 configs/vyasa-rk3288_defconfig                      |  2 +-
 configs/xilinx_zynq_virt_defconfig                  |  2 +-
 configs/xilinx_zynqmp_virt_defconfig                |  2 +-
 doc/develop/falcon.rst                              |  2 +-
 39 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/arch/arm/cpu/armv8/fsl-layerscape/doc/README.falcon b/arch/arm/cpu/armv8/fsl-layerscape/doc/README.falcon
index b3c6693a42c..9380795455b 100644
--- a/arch/arm/cpu/armv8/fsl-layerscape/doc/README.falcon
+++ b/arch/arm/cpu/armv8/fsl-layerscape/doc/README.falcon
@@ -30,7 +30,7 @@ to understand the device tree in FIT image should be the one actually used, or
 leave it absent to favor the stored sectors. It is easier to deploy the FIT
 image with embedded static device tree to multiple boards.
 
-Macro CONFIG_SYS_SPL_ARGS_ADDR serves two purposes. One is the pointer to load
+Macro CONFIG_SPL_SYS_ARGS_ADDR serves two purposes. One is the pointer to load
 the stored sectors to. Normally this is the static device tree. The second
 purpose is the memory location of signature header for secure boot. After the
 FIT image is loaded into memory, it is validated against the signature header
diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index b9d96fbe135..c23a1f7750b 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -1063,7 +1063,7 @@ config SPL_OS_BOOT
 	  Enable booting directly to an OS from SPL.
 	  for more info read doc/README.falcon
 
-config SYS_SPL_ARGS_ADDR
+config SPL_SYS_ARGS_ADDR
 	hex "Address in memory to load 'args' file for Falcon Mode to"
 	depends on SPL_OS_BOOT
 	default 0x88000000 if ARCH_OMAP2PLUS
diff --git a/common/spl/spl.c b/common/spl/spl.c
index 1e50043cf77..27266b393ea 100644
--- a/common/spl/spl.c
+++ b/common/spl/spl.c
@@ -818,8 +818,8 @@ void board_init_r(gd_t *dummy1, ulong dummy2)
 	}
 
 	memset(&spl_image, '\0', sizeof(spl_image));
-#ifdef CONFIG_SYS_SPL_ARGS_ADDR
-	spl_image.arg = (void *)CONFIG_SYS_SPL_ARGS_ADDR;
+#ifdef CONFIG_SPL_SYS_ARGS_ADDR
+	spl_image.arg = (void *)CONFIG_SPL_SYS_ARGS_ADDR;
 #endif
 	spl_image.boot_device = BOOT_DEVICE_NONE;
 	board_boot_order(spl_boot_list);
@@ -877,8 +877,8 @@ void board_init_r(gd_t *dummy1, ulong dummy2)
 #if CONFIG_IS_ENABLED(OS_BOOT)
 	case IH_OS_LINUX:
 		debug("Jumping to Linux\n");
-#if defined(CONFIG_SYS_SPL_ARGS_ADDR)
-		spl_fixup_fdt((void *)CONFIG_SYS_SPL_ARGS_ADDR);
+#if defined(CONFIG_SPL_SYS_ARGS_ADDR)
+		spl_fixup_fdt((void *)CONFIG_SPL_SYS_ARGS_ADDR);
 #endif
 		spl_board_prepare_for_linux();
 		jump_to_image_linux(&spl_image);
diff --git a/common/spl/spl_ext.c b/common/spl/spl_ext.c
index 2bf34344391..98fc790fc64 100644
--- a/common/spl/spl_ext.c
+++ b/common/spl/spl_ext.c
@@ -97,7 +97,7 @@ int spl_load_image_ext_os(struct spl_image_info *spl_image,
 			puts("spl: ext4fs_open failed\n");
 			goto defaults;
 		}
-		err = ext4fs_read((void *)CONFIG_SYS_SPL_ARGS_ADDR, 0, filelen, &actlen);
+		err = ext4fs_read((void *)CONFIG_SPL_SYS_ARGS_ADDR, 0, filelen, &actlen);
 		if (err < 0) {
 			printf("spl: error reading image %s, err - %d, falling back to default\n",
 			       file, err);
@@ -127,7 +127,7 @@ defaults:
 	if (err < 0)
 		puts("spl: ext4fs_open failed\n");
 
-	err = ext4fs_read((void *)CONFIG_SYS_SPL_ARGS_ADDR, 0, filelen, &actlen);
+	err = ext4fs_read((void *)CONFIG_SPL_SYS_ARGS_ADDR, 0, filelen, &actlen);
 	if (err < 0) {
 #ifdef CONFIG_SPL_LIBCOMMON_SUPPORT
 		printf("%s: error reading image %s, err - %d\n",
diff --git a/common/spl/spl_fat.c b/common/spl/spl_fat.c
index f8a5b80a3bd..60187e340de 100644
--- a/common/spl/spl_fat.c
+++ b/common/spl/spl_fat.c
@@ -128,7 +128,7 @@ int spl_load_image_fat_os(struct spl_image_info *spl_image,
 #if defined(CONFIG_SPL_ENV_SUPPORT) && defined(CONFIG_SPL_OS_BOOT)
 	file = env_get("falcon_args_file");
 	if (file) {
-		err = file_fat_read(file, (void *)CONFIG_SYS_SPL_ARGS_ADDR, 0);
+		err = file_fat_read(file, (void *)CONFIG_SPL_SYS_ARGS_ADDR, 0);
 		if (err <= 0) {
 			printf("spl: error reading image %s, err - %d, falling back to default\n",
 			       file, err);
@@ -153,7 +153,7 @@ defaults:
 #endif
 
 	err = file_fat_read(CONFIG_SPL_FS_LOAD_ARGS_NAME,
-			    (void *)CONFIG_SYS_SPL_ARGS_ADDR, 0);
+			    (void *)CONFIG_SPL_SYS_ARGS_ADDR, 0);
 	if (err <= 0) {
 #ifdef CONFIG_SPL_LIBCOMMON_SUPPORT
 		printf("%s: error reading image %s, err - %d\n",
diff --git a/common/spl/spl_mmc.c b/common/spl/spl_mmc.c
index 20f687e1389..689b33af72c 100644
--- a/common/spl/spl_mmc.c
+++ b/common/spl/spl_mmc.c
@@ -235,7 +235,7 @@ static int mmc_load_image_raw_os(struct spl_image_info *spl_image,
 	count = blk_dread(mmc_get_blk_desc(mmc),
 		CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR,
 		CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS,
-		(void *) CONFIG_SYS_SPL_ARGS_ADDR);
+		(void *)CONFIG_SPL_SYS_ARGS_ADDR);
 	if (count != CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS) {
 #ifdef CONFIG_SPL_LIBCOMMON_SUPPORT
 		puts("mmc_load_image_raw_os: mmc block read error\n");
diff --git a/common/spl/spl_nand.c b/common/spl/spl_nand.c
index dc45204fc0e..7687a27a3c7 100644
--- a/common/spl/spl_nand.c
+++ b/common/spl/spl_nand.c
@@ -159,11 +159,11 @@ static int spl_nand_load_image(struct spl_image_info *spl_image,
 			CONFIG_CMD_SPL_WRITE_SIZE,
 			(void *)CONFIG_TEXT_BASE);
 		/* copy to destintion */
-		for (dst = (int *)CONFIG_SYS_SPL_ARGS_ADDR,
-				src = (int *)CONFIG_TEXT_BASE;
-				src < (int *)(CONFIG_TEXT_BASE +
-				CONFIG_CMD_SPL_WRITE_SIZE);
-				src++, dst++) {
+		for (dst = (int *)CONFIG_SPL_SYS_ARGS_ADDR,
+		     src = (int *)CONFIG_TEXT_BASE;
+			src < (int *)(CONFIG_TEXT_BASE +
+				      CONFIG_CMD_SPL_WRITE_SIZE);
+		     src++, dst++) {
 			writel(readl(src), dst);
 		}
 
diff --git a/common/spl/spl_nor.c b/common/spl/spl_nor.c
index 5b65b96a77d..3a0e88a2a59 100644
--- a/common/spl/spl_nor.c
+++ b/common/spl/spl_nor.c
@@ -54,8 +54,8 @@ static int spl_nor_load_image(struct spl_image_info *spl_image,
 						  CONFIG_SYS_OS_BASE,
 						  (void *)header);
 
-#if defined CONFIG_SYS_SPL_ARGS_ADDR && defined CONFIG_CMD_SPL_NOR_OFS
-			memcpy((void *)CONFIG_SYS_SPL_ARGS_ADDR,
+#if defined CONFIG_SPL_SYS_ARGS_ADDR && defined CONFIG_CMD_SPL_NOR_OFS
+			memcpy((void *)CONFIG_SPL_SYS_ARGS_ADDR,
 			       (void *)CONFIG_CMD_SPL_NOR_OFS,
 			       CONFIG_CMD_SPL_WRITE_SIZE);
 #endif
@@ -74,8 +74,8 @@ static int spl_nor_load_image(struct spl_image_info *spl_image,
 			       (void *)(CONFIG_SYS_OS_BASE +
 					sizeof(struct legacy_img_hdr)),
 			       spl_image->size);
-#ifdef CONFIG_SYS_SPL_ARGS_ADDR
-			spl_image->arg = (void *)CONFIG_SYS_SPL_ARGS_ADDR;
+#ifdef CONFIG_SPL_SYS_ARGS_ADDR
+			spl_image->arg = (void *)CONFIG_SPL_SYS_ARGS_ADDR;
 #endif
 
 			return 0;
diff --git a/common/spl/spl_spi.c b/common/spl/spl_spi.c
index 2aff025f76e..7a6861f0661 100644
--- a/common/spl/spl_spi.c
+++ b/common/spl/spl_spi.c
@@ -47,7 +47,7 @@ static int spi_load_image_os(struct spl_image_info *spl_image,
 	/* Read device tree. */
 	spi_flash_read(flash, CFG_SYS_SPI_ARGS_OFFS,
 		       CFG_SYS_SPI_ARGS_SIZE,
-		       (void *)CONFIG_SYS_SPL_ARGS_ADDR);
+		       (void *)CONFIG_SPL_SYS_ARGS_ADDR);
 
 	return 0;
 }
diff --git a/common/spl/spl_ubi.c b/common/spl/spl_ubi.c
index bcac25cd021..b8dcf766636 100644
--- a/common/spl/spl_ubi.c
+++ b/common/spl/spl_ubi.c
@@ -50,7 +50,7 @@ int spl_ubi_load_image(struct spl_image_info *spl_image,
 		volumes[0].vol_id = CONFIG_SPL_UBI_LOAD_KERNEL_ID;
 		volumes[0].load_addr = (void *)CONFIG_SYS_LOAD_ADDR;
 		volumes[1].vol_id = CONFIG_SPL_UBI_LOAD_ARGS_ID;
-		volumes[1].load_addr = (void *)CONFIG_SYS_SPL_ARGS_ADDR;
+		volumes[1].load_addr = (void *)CONFIG_SPL_SYS_ARGS_ADDR;
 
 		ret = ubispl_load_volumes(&info, volumes, 2);
 		if (!ret) {
diff --git a/common/spl/spl_xip.c b/common/spl/spl_xip.c
index 77c23ba0597..2882b97fec5 100644
--- a/common/spl/spl_xip.c
+++ b/common/spl/spl_xip.c
@@ -14,7 +14,7 @@ static int spl_xip(struct spl_image_info *spl_image,
 {
 #if CONFIG_IS_ENABLED(OS_BOOT)
 	if (!spl_start_uboot()) {
-		spl_image->arg = (void *)CONFIG_SYS_SPL_ARGS_ADDR;
+		spl_image->arg = (void *)CONFIG_SPL_SYS_ARGS_ADDR;
 		spl_image->name = "Linux";
 		spl_image->os = IH_OS_LINUX;
 		spl_image->load_addr = CONFIG_SYS_LOAD_ADDR;
diff --git a/configs/am3517_evm_defconfig b/configs/am3517_evm_defconfig
index dda23549278..5286706fea2 100644
--- a/configs/am3517_evm_defconfig
+++ b/configs/am3517_evm_defconfig
@@ -33,7 +33,7 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x84000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x84000000
 CONFIG_SYS_NAND_SPL_KERNEL_OFFS=0x2a0000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
diff --git a/configs/devkit8000_defconfig b/configs/devkit8000_defconfig
index 1431e54dc95..a4813c6462e 100644
--- a/configs/devkit8000_defconfig
+++ b/configs/devkit8000_defconfig
@@ -28,7 +28,7 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x80000100
+CONFIG_SPL_SYS_ARGS_ADDR=0x80000100
 CONFIG_SYS_NAND_SPL_KERNEL_OFFS=0x280000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x500
diff --git a/configs/display5_defconfig b/configs/display5_defconfig
index 9c4334af15c..13afe1e2d5c 100644
--- a/configs/display5_defconfig
+++ b/configs/display5_defconfig
@@ -46,7 +46,7 @@ CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_SAVEENV=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x18000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x18000000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x100
 CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR=0x3F00
diff --git a/configs/display5_factory_defconfig b/configs/display5_factory_defconfig
index 67ba7658861..78ceecf1c1c 100644
--- a/configs/display5_factory_defconfig
+++ b/configs/display5_factory_defconfig
@@ -41,7 +41,7 @@ CONFIG_SPL_SYS_MALLOC=y
 CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x18000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x18000000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x100
 CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR=0x3F00
diff --git a/configs/gwventana_emmc_defconfig b/configs/gwventana_emmc_defconfig
index eb29268c6fa..445e03d818b 100644
--- a/configs/gwventana_emmc_defconfig
+++ b/configs/gwventana_emmc_defconfig
@@ -49,7 +49,7 @@ CONFIG_SPL_FIT_IMAGE_TINY=y
 CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x18000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x18000000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR=0x800
diff --git a/configs/gwventana_nand_defconfig b/configs/gwventana_nand_defconfig
index 17a86d6447d..1bf9ed4bbca 100644
--- a/configs/gwventana_nand_defconfig
+++ b/configs/gwventana_nand_defconfig
@@ -50,7 +50,7 @@ CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x18000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x18000000
 CONFIG_SYS_NAND_SPL_KERNEL_OFFS=0x1200000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
diff --git a/configs/igep00x0_defconfig b/configs/igep00x0_defconfig
index e0cc3995966..b8aa1abe093 100644
--- a/configs/igep00x0_defconfig
+++ b/configs/igep00x0_defconfig
@@ -42,7 +42,7 @@ CONFIG_SPL_UBI_LOAD_KERNEL_ID=3
 CONFIG_SPL_UBI_LOAD_ARGS_ID=4
 CONFIG_SPL_ONENAND_SUPPORT=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x84000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x84000000
 CONFIG_SYS_NAND_SPL_KERNEL_OFFS=0x280000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
diff --git a/configs/imx28_xea_defconfig b/configs/imx28_xea_defconfig
index 96d15e89af8..ba071f2293c 100644
--- a/configs/imx28_xea_defconfig
+++ b/configs/imx28_xea_defconfig
@@ -51,7 +51,7 @@ CONFIG_SPL_DMA=y
 CONFIG_SPL_MMC_TINY=y
 CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x44000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x44000000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x800
 CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR=0x400
diff --git a/configs/imx6dl_mamoj_defconfig b/configs/imx6dl_mamoj_defconfig
index 933a9d83f34..fdc4bfbe107 100644
--- a/configs/imx6dl_mamoj_defconfig
+++ b/configs/imx6dl_mamoj_defconfig
@@ -20,7 +20,7 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=3
 CONFIG_SPL_SYS_MALLOC=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x13000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x13000000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR=0x800
diff --git a/configs/imx6q_logic_defconfig b/configs/imx6q_logic_defconfig
index b307fea5f25..a75e8a5eb73 100644
--- a/configs/imx6q_logic_defconfig
+++ b/configs/imx6q_logic_defconfig
@@ -36,7 +36,7 @@ CONFIG_SPL_FS_LOAD_PAYLOAD_NAME="u-boot-dtb.img"
 CONFIG_SPL_I2C=y
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x18000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x18000000
 CONFIG_SYS_NAND_SPL_KERNEL_OFFS=0x500000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
diff --git a/configs/imx6qdl_icore_mipi_defconfig b/configs/imx6qdl_icore_mipi_defconfig
index ecb8fb2ba57..256cd5ba244 100644
--- a/configs/imx6qdl_icore_mipi_defconfig
+++ b/configs/imx6qdl_icore_mipi_defconfig
@@ -36,7 +36,7 @@ CONFIG_BOOTCOMMAND="run $modeboot"
 CONFIG_SPL_RAW_IMAGE_SUPPORT=y
 CONFIG_SPL_SYS_MALLOC=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x18000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x18000000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR=0x800
diff --git a/configs/imx6qdl_icore_mmc_defconfig b/configs/imx6qdl_icore_mmc_defconfig
index 42889188cc3..f65f648a834 100644
--- a/configs/imx6qdl_icore_mmc_defconfig
+++ b/configs/imx6qdl_icore_mmc_defconfig
@@ -39,7 +39,7 @@ CONFIG_BOOTCOMMAND="run $modeboot"
 CONFIG_SPL_RAW_IMAGE_SUPPORT=y
 CONFIG_SPL_SYS_MALLOC=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x18000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x18000000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR=0x800
diff --git a/configs/imx6qdl_icore_rqs_defconfig b/configs/imx6qdl_icore_rqs_defconfig
index 2ab42979fa6..06438b44649 100644
--- a/configs/imx6qdl_icore_rqs_defconfig
+++ b/configs/imx6qdl_icore_rqs_defconfig
@@ -33,7 +33,7 @@ CONFIG_BOOTCOMMAND="run $modeboot"
 CONFIG_SPL_RAW_IMAGE_SUPPORT=y
 CONFIG_SPL_SYS_MALLOC=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x18000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x18000000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR=0x800
diff --git a/configs/ls1046ardb_qspi_spl_defconfig b/configs/ls1046ardb_qspi_spl_defconfig
index e11a90f09b2..25efda7d0d1 100644
--- a/configs/ls1046ardb_qspi_spl_defconfig
+++ b/configs/ls1046ardb_qspi_spl_defconfig
@@ -61,7 +61,7 @@ CONFIG_SPL_I2C=y
 CONFIG_SPL_MPC8XXX_INIT_DDR=y
 CONFIG_SPL_NOR_SUPPORT=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x90000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x90000000
 CONFIG_SYS_OS_BASE=0x40980000
 CONFIG_SPL_WATCHDOG=y
 CONFIG_SPL_TARGET="spl/u-boot-spl.pbl"
diff --git a/configs/mccmon6_nor_defconfig b/configs/mccmon6_nor_defconfig
index 88a72b39299..aa30bf63a81 100644
--- a/configs/mccmon6_nor_defconfig
+++ b/configs/mccmon6_nor_defconfig
@@ -29,7 +29,7 @@ CONFIG_SPL_FIT_IMAGE_TINY=y
 CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_NOR_SUPPORT=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x18000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x18000000
 CONFIG_SYS_OS_BASE=0x8180000
 CONFIG_SYS_MAXARGS=32
 CONFIG_SYS_PBSIZE=532
diff --git a/configs/omap35_logic_defconfig b/configs/omap35_logic_defconfig
index 3534753dd3e..62ff875b6a8 100644
--- a/configs/omap35_logic_defconfig
+++ b/configs/omap35_logic_defconfig
@@ -37,7 +37,7 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x84000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x84000000
 CONFIG_SYS_NAND_SPL_KERNEL_OFFS=0x280000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
diff --git a/configs/omap35_logic_somlv_defconfig b/configs/omap35_logic_somlv_defconfig
index 835252acc9b..556664aa08b 100644
--- a/configs/omap35_logic_somlv_defconfig
+++ b/configs/omap35_logic_somlv_defconfig
@@ -38,7 +38,7 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x84000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x84000000
 CONFIG_SYS_NAND_SPL_KERNEL_OFFS=0x280000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
diff --git a/configs/omap3_logic_defconfig b/configs/omap3_logic_defconfig
index e747a0c1e93..6b3771803b9 100644
--- a/configs/omap3_logic_defconfig
+++ b/configs/omap3_logic_defconfig
@@ -36,7 +36,7 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x84000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x84000000
 CONFIG_SYS_NAND_SPL_KERNEL_OFFS=0x280000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
diff --git a/configs/omap3_logic_somlv_defconfig b/configs/omap3_logic_somlv_defconfig
index b9d6284faad..c3c0cde8d16 100644
--- a/configs/omap3_logic_somlv_defconfig
+++ b/configs/omap3_logic_somlv_defconfig
@@ -38,7 +38,7 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x84000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x84000000
 CONFIG_SYS_NAND_SPL_KERNEL_OFFS=0x280000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index f8bc8c63969..a8959ce9d7b 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -35,7 +35,7 @@ CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_FS_LOAD_PAYLOAD_NAME="u-boot-dtb.img"
 CONFIG_SPL_FS_LOAD_ARGS_NAME="imx6dl-riotboard.dtb"
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x13000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x13000000
 CONFIG_SYS_MAXARGS=32
 CONFIG_SYS_PBSIZE=532
 CONFIG_CMD_GPIO=y
diff --git a/configs/stm32746g-eval_spl_defconfig b/configs/stm32746g-eval_spl_defconfig
index 03e123e44a2..1d7b8266939 100644
--- a/configs/stm32746g-eval_spl_defconfig
+++ b/configs/stm32746g-eval_spl_defconfig
@@ -37,7 +37,7 @@ CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
 CONFIG_SPL_MTD_SUPPORT=y
 CONFIG_SPL_XIP_SUPPORT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x80c0000
+CONFIG_SPL_SYS_ARGS_ADDR=0x80c0000
 CONFIG_SPL_DM_RESET=y
 CONFIG_SYS_PBSIZE=1050
 CONFIG_CMD_GPT=y
diff --git a/configs/stm32f746-disco_spl_defconfig b/configs/stm32f746-disco_spl_defconfig
index 84aaec1e339..30357ed282a 100644
--- a/configs/stm32f746-disco_spl_defconfig
+++ b/configs/stm32f746-disco_spl_defconfig
@@ -37,7 +37,7 @@ CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
 CONFIG_SPL_MTD_SUPPORT=y
 CONFIG_SPL_XIP_SUPPORT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x80c0000
+CONFIG_SPL_SYS_ARGS_ADDR=0x80c0000
 CONFIG_SPL_DM_RESET=y
 CONFIG_SYS_PBSIZE=1050
 CONFIG_CMD_GPT=y
diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
index dd17cad7362..755478800be 100644
--- a/configs/stm32f769-disco_spl_defconfig
+++ b/configs/stm32f769-disco_spl_defconfig
@@ -36,7 +36,7 @@ CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
 CONFIG_SPL_MTD_SUPPORT=y
 CONFIG_SPL_XIP_SUPPORT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x81c0000
+CONFIG_SPL_SYS_ARGS_ADDR=0x81c0000
 CONFIG_SPL_DM_RESET=y
 CONFIG_SYS_PBSIZE=1050
 CONFIG_CMD_GPT=y
diff --git a/configs/syzygy_hub_defconfig b/configs/syzygy_hub_defconfig
index 7bcb3191000..a88568f1c38 100644
--- a/configs/syzygy_hub_defconfig
+++ b/configs/syzygy_hub_defconfig
@@ -32,7 +32,7 @@ CONFIG_SPL_SYS_MALLOC=y
 CONFIG_SPL_SYS_MALLOC_SIZE=0x2000000
 CONFIG_SPL_FS_LOAD_ARGS_NAME="system.dtb"
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x10000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x10000000
 CONFIG_SYS_MAXARGS=32
 CONFIG_SYS_PBSIZE=2071
 CONFIG_SYS_BOOTM_LEN=0x3c00000
diff --git a/configs/vyasa-rk3288_defconfig b/configs/vyasa-rk3288_defconfig
index 9bca6fe2eea..5e7fd2a7ef2 100644
--- a/configs/vyasa-rk3288_defconfig
+++ b/configs/vyasa-rk3288_defconfig
@@ -32,7 +32,7 @@ CONFIG_SPL_NO_BSS_LIMIT=y
 CONFIG_SPL_STACK_R=y
 CONFIG_SPL_STACK_R_MALLOC_SIMPLE_LEN=0x2000
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0xffe5000
+CONFIG_SPL_SYS_ARGS_ADDR=0xffe5000
 CONFIG_SPL_FALCON_BOOT_MMCSD=y
 CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x8800
 CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR=0x8000
diff --git a/configs/xilinx_zynq_virt_defconfig b/configs/xilinx_zynq_virt_defconfig
index 4ea5caff547..8fa8eb3b83e 100644
--- a/configs/xilinx_zynq_virt_defconfig
+++ b/configs/xilinx_zynq_virt_defconfig
@@ -43,7 +43,7 @@ CONFIG_SPL_FS_LOAD_PAYLOAD_NAME="u-boot.img"
 CONFIG_SPL_FS_LOAD_ARGS_NAME="system.dtb"
 CONFIG_SPL_FPGA=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x10000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x10000000
 CONFIG_SPL_SPI_LOAD=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x100000
 CONFIG_SYS_MAXARGS=32
diff --git a/configs/xilinx_zynqmp_virt_defconfig b/configs/xilinx_zynqmp_virt_defconfig
index 59be5f42493..bef59376a37 100644
--- a/configs/xilinx_zynqmp_virt_defconfig
+++ b/configs/xilinx_zynqmp_virt_defconfig
@@ -44,7 +44,7 @@ CONFIG_SPL_FS_LOAD_KERNEL_NAME="atf-uboot.ub"
 CONFIG_SPL_FS_LOAD_ARGS_NAME="u-boot.bin"
 CONFIG_SPL_FPGA=y
 CONFIG_SPL_OS_BOOT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x8000000
+CONFIG_SPL_SYS_ARGS_ADDR=0x8000000
 CONFIG_SPL_RAM_SUPPORT=y
 CONFIG_SPL_RAM_DEVICE=y
 CONFIG_SPL_SPI_LOAD=y
diff --git a/doc/develop/falcon.rst b/doc/develop/falcon.rst
index a569d1a2951..fbf8c10e47e 100644
--- a/doc/develop/falcon.rst
+++ b/doc/develop/falcon.rst
@@ -63,7 +63,7 @@ CONFIG_CMD_SPL
     Enable the "spl export" command.
     The command "spl export" is then available in U-Boot mode.
 
-CONFIG_SYS_SPL_ARGS_ADDR
+CONFIG_SPL_SYS_ARGS_ADDR
     Address in RAM where the parameters must be copied by SPL.
     In most cases, it is <start_of_ram> + 0x100.
 
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
