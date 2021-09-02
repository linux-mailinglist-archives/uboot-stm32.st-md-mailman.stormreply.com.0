Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 815333FEBAC
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Sep 2021 11:57:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 486E9C597AC;
	Thu,  2 Sep 2021 09:57:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F277C0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Sep 2021 09:57:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1828TPWT006465;
 Thu, 2 Sep 2021 11:56:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=BXDEk18X+V65bJRx4P7iTinklk1IDr5LL915I2GN5iY=;
 b=HH9e7hCSq5cko6OVRvGp9d3wmvYRNS0KhKVfK1wrWKAWGPDHXa3+hHfYYMXYKFvaTzRC
 g7RDYdOn/iQNqLKXFmNJj/DdaPzw5vfaI0MAhmLRrHLKvGEUiCzXaNYtJGc4UxAMVWvL
 glFlP/ZzySd4g9P9tb2VPE3DE5xsMXwVU7Ol1ikeoTsBY6VqsJNz3SyJl8pnlkP4d3x9
 qx9c057eg1Z55t/Yko9xo57iffTV2V0amHvlgsMNrtsSvOrB9O4SzKKkHNN8EWP8pfvE
 ABam7umzpCDDJ8Rlqkwj71ZKOeMRAOOOKg4DxGyeQvlNVUMNE0PU8F9S9n+MXND/T56J Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3atu53rkdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 11:56:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2DD5310002A;
 Thu,  2 Sep 2021 11:56:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7C5F22D63F;
 Thu,  2 Sep 2021 11:56:25 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep 2021 11:56:25
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 2 Sep 2021 11:56:16 +0200
Message-ID: <20210902115512.1.I1c6536da7609f8240549cccae2708e075dc9fcf3@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-02_03,2021-09-01_01,2020-04-07_01
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <royger@FreeBSD.org>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Stefan Roese <sr@denx.de>,
 Samuel Holland <samuel@sholland.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 "Alex G ." <mr.nuke.me@gmail.com>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>, etienne.carriere@linaro.org,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Simon Glass <sjg@chromium.org>, Tero Kristo <t-kristo@ti.com>,
 Michael Walle <michael@walle.cc>, Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [Uboot-stm32] [PATCH 1/2] lib: optee: remove the duplicate
	CONFIG_OPTEE
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

The configuration CONFIG_OPTEE is defined 2 times:
1- in lib/optee/Kconfig for support of OPTEE images loaded by bootm command
2- in drivers/tee/optee/Kconfig for support of OP-TEE driver.

It is abnormal to have the same CONFIG define for 2 purpose;
and it is difficult to managed correctly their dependencies.

Moreover CONFIG_SPL_OPTEE is defined in common/spl/Kconfig
to manage OPTEE image load in SPL.

This definition causes an issue with the macro CONFIG_IS_ENABLED(OPTEE)
to test the availability of the OP-TEE driver.

This patch cleans the configuration dependency with:
- CONFIG_OPTEE_IMAGE (renamed) => support of OP-TEE image in U-Boot
- CONFIG_SPL_OPTEE_IMAGE (renamed) => support of OP-TEE image in SPL
- CONFIG_OPTEE (same) => support of OP-TEE driver in U-Boot
- CONFIG_OPTEE_LIB (new) => support of OP-TEE library

After this patch, the macro have the correct behavior:
- CONFIG_IS_ENABLED(OPTEE_IMAGE) => Load of OP-TEE image is supported
- CONFIG_IS_ENABLED(OPTEE) => OP-TEE driver is supported

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-rockchip/sdram.c |  2 +-
 common/spl/Kconfig             |  6 +++---
 common/spl/Makefile            |  2 +-
 common/spl/spl.c               |  2 +-
 configs/evb-rk3229_defconfig   |  2 +-
 configs/evb-rk3288_defconfig   |  2 +-
 configs/odroid-go2_defconfig   |  2 +-
 include/configs/mx7_common.h   |  2 +-
 include/tee/optee.h            |  6 +++---
 lib/Makefile                   |  2 +-
 lib/optee/Kconfig              | 24 ++++++++++++++----------
 lib/optee/Makefile             |  2 +-
 lib/optee/optee.c              |  2 ++
 13 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-rockchip/sdram.c b/arch/arm/mach-rockchip/sdram.c
index 28c379ef07..705ec7ba64 100644
--- a/arch/arm/mach-rockchip/sdram.c
+++ b/arch/arm/mach-rockchip/sdram.c
@@ -45,7 +45,7 @@ int dram_init_banksize(void)
 	gd->bd->bi_dram[0].start = 0x200000;
 	gd->bd->bi_dram[0].size = top - gd->bd->bi_dram[0].start;
 #else
-#ifdef CONFIG_SPL_OPTEE
+#ifdef CONFIG_SPL_OPTEE_IMAGE
 	struct tos_parameter_t *tos_parameter;
 
 	tos_parameter = (struct tos_parameter_t *)(CONFIG_SYS_SDRAM_BASE +
diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index c155a3b5fc..cbf32badd3 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -1333,11 +1333,11 @@ config SPL_AM33XX_ENABLE_RTC32K_OSC
 	  Enable access to the AM33xx RTC and select the external 32kHz clock
 	  source.
 
-config SPL_OPTEE
-	bool "Support OP-TEE Trusted OS"
+config SPL_OPTEE_IMAGE
+	bool "Support OP-TEE Trusted OS image in SPL"
 	depends on ARM
 	help
-	  OP-TEE is an open source Trusted OS  which is loaded by SPL.
+	  OP-TEE is an open source Trusted OS which is loaded by SPL.
 	  More detail at: https://github.com/OP-TEE/optee_os
 
 config SPL_OPENSBI
diff --git a/common/spl/Makefile b/common/spl/Makefile
index c576a78126..b20f6fbe1a 100644
--- a/common/spl/Makefile
+++ b/common/spl/Makefile
@@ -22,7 +22,7 @@ obj-$(CONFIG_$(SPL_TPL_)UBI) += spl_ubi.o
 obj-$(CONFIG_$(SPL_TPL_)NET_SUPPORT) += spl_net.o
 obj-$(CONFIG_$(SPL_TPL_)MMC_SUPPORT) += spl_mmc.o
 obj-$(CONFIG_$(SPL_TPL_)ATF) += spl_atf.o
-obj-$(CONFIG_$(SPL_TPL_)OPTEE) += spl_optee.o
+obj-$(CONFIG_$(SPL_TPL_)OPTEE_IMAGE) += spl_optee.o
 obj-$(CONFIG_$(SPL_TPL_)OPENSBI) += spl_opensbi.o
 obj-$(CONFIG_$(SPL_TPL_)USB_STORAGE) += spl_usb.o
 obj-$(CONFIG_$(SPL_TPL_)FS_FAT) += spl_fat.o
diff --git a/common/spl/spl.c b/common/spl/spl.c
index d55d3c2848..4439cde1ee 100644
--- a/common/spl/spl.c
+++ b/common/spl/spl.c
@@ -773,7 +773,7 @@ void board_init_r(gd_t *dummy1, ulong dummy2)
 		spl_invoke_atf(&spl_image);
 		break;
 #endif
-#if CONFIG_IS_ENABLED(OPTEE)
+#if CONFIG_IS_ENABLED(OPTEE_IMAGE)
 	case IH_OS_TEE:
 		debug("Jumping to U-Boot via OP-TEE\n");
 		spl_board_prepare_for_optee(spl_image.fdt_addr);
diff --git a/configs/evb-rk3229_defconfig b/configs/evb-rk3229_defconfig
index 02e19fa10c..f83041c768 100644
--- a/configs/evb-rk3229_defconfig
+++ b/configs/evb-rk3229_defconfig
@@ -24,7 +24,7 @@ CONFIG_DISPLAY_BOARDINFO_LATE=y
 # CONFIG_SPL_RAW_IMAGE_SUPPORT is not set
 CONFIG_SPL_STACK_R=y
 CONFIG_SPL_STACK_R_MALLOC_SIMPLE_LEN=0x2000
-CONFIG_SPL_OPTEE=y
+CONFIG_SPL_OPTEE_IMAGE=y
 CONFIG_CMD_GPT=y
 CONFIG_CMD_MMC=y
 CONFIG_CMD_USB_MASS_STORAGE=y
diff --git a/configs/evb-rk3288_defconfig b/configs/evb-rk3288_defconfig
index 658ddc9750..c4990a3070 100644
--- a/configs/evb-rk3288_defconfig
+++ b/configs/evb-rk3288_defconfig
@@ -22,7 +22,7 @@ CONFIG_SILENT_CONSOLE=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_SPL_STACK_R=y
 CONFIG_SPL_STACK_R_MALLOC_SIMPLE_LEN=0x10000
-CONFIG_SPL_OPTEE=y
+CONFIG_SPL_OPTEE_IMAGE=y
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_GPT=y
 CONFIG_CMD_I2C=y
diff --git a/configs/odroid-go2_defconfig b/configs/odroid-go2_defconfig
index aafec84f10..551f95f4f9 100644
--- a/configs/odroid-go2_defconfig
+++ b/configs/odroid-go2_defconfig
@@ -95,7 +95,7 @@ CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_SOUND=y
 CONFIG_SYSRESET=y
-CONFIG_OPTEE=y
+CONFIG_OPTEE_LIB=y
 CONFIG_DM_THERMAL=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/include/configs/mx7_common.h b/include/configs/mx7_common.h
index 3d87690382..629b2c7c52 100644
--- a/include/configs/mx7_common.h
+++ b/include/configs/mx7_common.h
@@ -50,7 +50,7 @@
  * initialization since it was already done by ATF or OPTEE
  */
 #if (CONFIG_OPTEE_TZDRAM_SIZE != 0)
-#ifndef CONFIG_OPTEE
+#ifndef CONFIG_OPTEE_IMAGE
 #define CONFIG_SKIP_LOWLEVEL_INIT
 #endif
 #endif
diff --git a/include/tee/optee.h b/include/tee/optee.h
index ebdfe5e98d..2928597b61 100644
--- a/include/tee/optee.h
+++ b/include/tee/optee.h
@@ -43,7 +43,7 @@ optee_image_get_load_addr(const struct image_header *hdr)
 	return optee_image_get_entry_point(hdr) - sizeof(struct optee_header);
 }
 
-#if defined(CONFIG_OPTEE)
+#if defined(CONFIG_OPTEE_IMAGE)
 int optee_verify_image(struct optee_header *hdr, unsigned long tzdram_start,
 		       unsigned long tzdram_len, unsigned long image_len);
 #else
@@ -57,7 +57,7 @@ static inline int optee_verify_image(struct optee_header *hdr,
 
 #endif
 
-#if defined(CONFIG_OPTEE)
+#if defined(CONFIG_OPTEE_IMAGE)
 int optee_verify_bootm_image(unsigned long image_addr,
 			     unsigned long image_load_addr,
 			     unsigned long image_len);
@@ -70,7 +70,7 @@ static inline int optee_verify_bootm_image(unsigned long image_addr,
 }
 #endif
 
-#if defined(CONFIG_OPTEE) && defined(CONFIG_OF_LIBFDT)
+#if defined(CONFIG_OPTEE_LIB) && defined(CONFIG_OF_LIBFDT)
 int optee_copy_fdt_nodes(void *new_blob);
 #else
 static inline int optee_copy_fdt_nodes(void *new_blob)
diff --git a/lib/Makefile b/lib/Makefile
index 8ba745faa0..47c5ac19cb 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -16,7 +16,7 @@ obj-$(CONFIG_FIT) += libfdt/
 obj-$(CONFIG_OF_LIVE) += of_live.o
 obj-$(CONFIG_CMD_DHRYSTONE) += dhry/
 obj-$(CONFIG_ARCH_AT91) += at91/
-obj-$(CONFIG_OPTEE) += optee/
+obj-$(CONFIG_OPTEE_LIB) += optee/
 obj-$(CONFIG_ASN1_DECODER) += asn1_decoder.o
 obj-y += crypto/
 
diff --git a/lib/optee/Kconfig b/lib/optee/Kconfig
index c398f9b953..e2a0541537 100644
--- a/lib/optee/Kconfig
+++ b/lib/optee/Kconfig
@@ -1,23 +1,27 @@
-config OPTEE
+config OPTEE_LIB
+	bool "Support OPTEE library"
+	default y if OPTEE || OPTEE_IMAGE
+	help
+	  Selecting this option will enable the shared OPTEE library code.
+
+config OPTEE_IMAGE
 	bool "Support OPTEE images"
 	help
-	  U-Boot can be configured to boot OPTEE images.
-	  Selecting this option will enable shared OPTEE library code and
-          enable an OPTEE specific bootm command that will perform additional
-          OPTEE specific checks before booting an OPTEE image created with
-          mkimage.
+	  Selecting this option to boot OPTEE images.
+	  This option enable the OPTEE specific checks done before booting
+	  an OPTEE image created with mkimage
 
 config OPTEE_LOAD_ADDR
 	hex "OPTEE load address"
 	default 0x00000000
-	depends on OPTEE
+	depends on OPTEE_LIB
 	help
 	  The load address of the bootable OPTEE binary.
 
 config OPTEE_TZDRAM_SIZE
 	hex "Amount of Trust-Zone RAM for the OPTEE image"
 	default 0x0000000
-	depends on OPTEE
+	depends on OPTEE_LIB
 	help
 	  The size of pre-allocated Trust Zone DRAM to allocate for the OPTEE
 	  runtime.
@@ -25,7 +29,7 @@ config OPTEE_TZDRAM_SIZE
 config OPTEE_TZDRAM_BASE
 	hex "Base address of Trust-Zone RAM for the OPTEE image"
 	default 0x00000000
-	depends on OPTEE
+	depends on OPTEE_LIB
 	help
 	  The base address of pre-allocated Trust Zone DRAM for
 	  the OPTEE runtime.
@@ -33,7 +37,7 @@ config OPTEE_TZDRAM_BASE
 config BOOTM_OPTEE
 	bool "Support OPTEE bootm command"
 	select BOOTM_LINUX
-	depends on OPTEE
+	select OPTEE_IMAGE
 	default n
 	help
 	  Select this command to enable chain-loading of a Linux kernel
diff --git a/lib/optee/Makefile b/lib/optee/Makefile
index b692311864..9befe606d8 100644
--- a/lib/optee/Makefile
+++ b/lib/optee/Makefile
@@ -2,4 +2,4 @@
 #
 # (C) Copyright 2017 Linaro
 
-obj-$(CONFIG_OPTEE) += optee.o
+obj-y += optee.o
diff --git a/lib/optee/optee.c b/lib/optee/optee.c
index 672690dc53..5676785cb5 100644
--- a/lib/optee/optee.c
+++ b/lib/optee/optee.c
@@ -20,6 +20,7 @@
 	"\n\theader lo=0x%08x hi=0x%08x size=0x%08lx arch=0x%08x" \
 	"\n\tuimage params 0x%08lx-0x%08lx\n"
 
+#if defined(CONFIG_OPTEE_IMAGE)
 int optee_verify_image(struct optee_header *hdr, unsigned long tzdram_start,
 		       unsigned long tzdram_len, unsigned long image_len)
 {
@@ -70,6 +71,7 @@ error:
 
 	return ret;
 }
+#endif
 
 #if defined(CONFIG_OF_LIBFDT)
 static int optee_copy_firmware_node(ofnode node, void *fdt_blob)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
