Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF034271A1
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AFA8C597B9;
	Fri,  8 Oct 2021 19:57:06 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CD27C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:04 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id z11so15171743oih.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+vGwptDsFAJ50M1h09Rqx5UFopGW2nRwApiacb0IQ/M=;
 b=piYuaJAc84SEvygagV8XCrV+pDsQprt1+pcVk/S3XwB7g5VQeMwZLX9OsGm8EFmhla
 alzF1jTVYblkveRRLvfWxglDY5TzsTYBww8KMcV8pc6FHKGjOc11M8ZH0LjR9gfjyorX
 fJ4yALPQ4aC5ten9+GZXNo0PKwioeAu6jiKRkErE3eqVHu6J9zyesb3qPlh2sh21Y0Or
 WVs1BPe83TqTE2Ptuok8pmPVRsF+PBMj1w3QlFZ4eyWY+i0wknGvRrKkHv8+CYNbBubI
 C0pJvoZmOIK93hTwWPIK5929hLFnAR74Xl0IuayHBpE1U9KvQFtEE1frtDqZP4AIkvvQ
 a6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+vGwptDsFAJ50M1h09Rqx5UFopGW2nRwApiacb0IQ/M=;
 b=Y6UDFo7o5odgA6a3cQH8LM/A81nYkQ5ADa6QRKqITlxY5cXMUHr0W+uYtujrhGb229
 VAM8GzumrmImRiWSzuIUS0LdRE0PPDDv9VTL0rG2NXEj1nh8C4JhJXF+Eb8g7xROzgat
 /DCPngrwCNKH2+9ZsUf9TTjR/DmXKv6AzJs9GGbrStjbZNTUX7YrGeVpuW4DougSlYjT
 dlWv1rWHvMUn76whuVxr+BmmlbNai9qPO2MbO1PJOkLVzGk7NUMfoJs28Gj5X5+9IjOn
 OejxCxjj8w1O1Oy2x8Q+vHfdcdnfhwD5Gp5K11y5nhKOwof4LAvCSvtHZ3O33EaVCXGK
 xhnA==
X-Gm-Message-State: AOAM532PZthRNxtK7gJD3H1ZGgM2hQqDX185BTzX1powywDqdH5EtbxU
 uhAFU4GILlNziYUle5pw/BQ=
X-Google-Smtp-Source: ABdhPJyBm1WJPjVZrDF6h6R5dHUB4PSmKs8uFohEpqUrW9aC7b7MvfaaFWW5I0eRpbR27x54DMfYZA==
X-Received: by 2002:a05:6808:187:: with SMTP id
 w7mr9375129oic.140.1633723023454; 
 Fri, 08 Oct 2021 12:57:03 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:57:02 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:46 -0500
Message-Id: <20211008195655.46046-5-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008195655.46046-1-mr.nuke.me@gmail.com>
References: <20211008195655.46046-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 04/13] stm32mp1: Add support for falcon
	mode boot from SD card
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

Falcon mode requires a board-specific mechanism to select between
fast and normal boot. This is done via spl_start_uboot()

Use the USER2 button as the selection mechanism. This is connected to
GPIO PA13. This GPIO is already accessible via the "st,fastboot-gpios"
devicetree node, but is is also aliased as "u-boot,falcon-gpios". This
is the only button on DK2 which accessible simultaneously to the RESET
button. USER2 is too close, and I can't fit my fingers to press both.

The fact that USER2 is also used for android fastboot is of no
consequence. One can let go of USER2 after SPL but before being
sampled by u-boot. If that is missed, it's okay, u-boot tries to
initialize the ethernet, which can be stopped with a Ctr-C. This
conveniently opens up a u-boot shell.

Offsets for raw MMC loading are defined. These point to the partition
after "ssbl". Offsets for SPI are not defined, and thus SPL_LOAD_SPI
must be disabled to avoid a build failure. The only way to accommodate
this is to add a new defconfig, adventurously named stm32mp1_falcon.

The baudrate is set to 2 Mbaud, as the point of this config is to boot
fast. The default devicetree is set to -dk2. This is because EV1 does
not have a crypto-enabled CPU, and thus enabling ECDSA support would
have made far less sense. That and all the goodies with FIT in SPL
are enabled to give this config some continuous integration TLC.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi |   2 +
 board/st/stm32mp1/spl.c                  |  29 ++++
 configs/stm32mp15_falcon_defconfig       | 183 +++++++++++++++++++++++
 3 files changed, 214 insertions(+)
 create mode 100644 configs/stm32mp15_falcon_defconfig

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 15a04ae927..629451e731 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -16,6 +16,8 @@
 		u-boot,boot-led = "heartbeat";
 		u-boot,error-led = "error";
 		u-boot,mmc-env-partition = "fip";
+		/* This is the same as fastboot-gpios. This is on purpose */
+		u-boot,falcon-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
 		st,fastboot-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
index 8e4549a1b3..ea2f809245 100644
--- a/board/st/stm32mp1/spl.c
+++ b/board/st/stm32mp1/spl.c
@@ -8,6 +8,7 @@
 #include <init.h>
 #include <asm/io.h>
 #include <asm/arch/sys_proto.h>
+#include <asm/gpio.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include "../common/stpmic1.h"
@@ -29,6 +30,34 @@ int board_early_init_f(void)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SPL_OS_BOOT)
+int spl_start_uboot(void)
+{
+	ofnode node;
+	struct gpio_desc gpio;
+	int boot_uboot = 1;
+
+	node = ofnode_path("/config");
+	if (!ofnode_valid(node)) {
+		pr_warn("%s: no /config node?\n", __func__);
+		return 0;
+	}
+
+	if (gpio_request_by_name_nodev(node, "u-boot,falcon-gpios", 0, &gpio,
+				       GPIOD_IS_IN)) {
+		pr_warn("%s: could not find a /config/u-boot,falcon-gpios\n",
+			__func__);
+		return 1;
+	}
+
+	boot_uboot = dm_gpio_get_value(&gpio);
+	dm_gpio_free(NULL, &gpio);
+
+	return boot_uboot;
+}
+
+#endif /* CONFIG_SPL_OS_BOOT */
+
 #ifdef CONFIG_DEBUG_UART_BOARD_INIT
 void board_debug_uart_init(void)
 {
diff --git a/configs/stm32mp15_falcon_defconfig b/configs/stm32mp15_falcon_defconfig
new file mode 100644
index 0000000000..c5683616cc
--- /dev/null
+++ b/configs/stm32mp15_falcon_defconfig
@@ -0,0 +1,183 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32MP=y
+CONFIG_SYS_MALLOC_F_LEN=0x3000
+CONFIG_SYS_MEMTEST_START=0xc0000000
+CONFIG_SYS_MEMTEST_END=0xc4000000
+CONFIG_ENV_OFFSET=0x280000
+CONFIG_ENV_SECT_SIZE=0x40000
+CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-dk2"
+CONFIG_SPL_TEXT_BASE=0x2FFC2500
+CONFIG_SPL_MMC=y
+CONFIG_SPL=y
+CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_CMD_STM32KEY=y
+CONFIG_CMD_STM32PROG=y
+CONFIG_ENV_OFFSET_REDUND=0x2C0000
+CONFIG_TYPEC_STUSB160X=y
+# CONFIG_ARMV7_VIRT is not set
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_SYS_LOAD_ADDR=0xc2000000
+CONFIG_FIT=y
+CONFIG_SPL_LOAD_FIT=y
+CONFIG_SPL_LOAD_FIT_APPLY_OVERLAY=y
+# CONFIG_USE_SPL_FIT_GENERATOR is not set
+CONFIG_BOOTDELAY=1
+CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
+CONFIG_SPL_LOG=y
+CONFIG_BOARD_EARLY_INIT_F=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
+CONFIG_SPL_ENV_SUPPORT=y
+CONFIG_SPL_I2C=y
+CONFIG_SPL_MTD_SUPPORT=y
+CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1422
+CONFIG_SPL_POWER=y
+CONFIG_SPL_OPTEE_IMAGE=y
+CONFIG_SYS_PROMPT="STM32MP> "
+CONFIG_CMD_ADTIMG=y
+CONFIG_CMD_ERASEENV=y
+CONFIG_CMD_NVEDIT_EFI=y
+CONFIG_CMD_MEMINFO=y
+CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_UNZIP=y
+CONFIG_CMD_ADC=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_DFU=y
+CONFIG_CMD_FUSE=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_I2C=y
+CONFIG_CMD_MMC=y
+CONFIG_CMD_REMOTEPROC=y
+CONFIG_CMD_SPI=y
+CONFIG_CMD_USB=y
+CONFIG_CMD_USB_MASS_STORAGE=y
+CONFIG_CMD_BMP=y
+CONFIG_CMD_CACHE=y
+CONFIG_CMD_EFIDEBUG=y
+CONFIG_CMD_TIME=y
+CONFIG_CMD_RNG=y
+CONFIG_CMD_TIMER=y
+CONFIG_CMD_PMIC=y
+CONFIG_CMD_REGULATOR=y
+CONFIG_CMD_EXT4_WRITE=y
+CONFIG_CMD_MTDPARTS=y
+CONFIG_CMD_LOG=y
+CONFIG_CMD_UBI=y
+# CONFIG_SPL_DOS_PARTITION is not set
+CONFIG_OF_LIVE=y
+CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_IS_IN_UBI=y
+CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_UBI_PART="UBI"
+CONFIG_ENV_UBI_VOLUME="uboot_config"
+CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_SYS_MMC_ENV_DEV=-1
+# CONFIG_SPL_ENV_IS_NOWHERE is not set
+# CONFIG_SPL_ENV_IS_IN_SPI_FLASH is not set
+CONFIG_STM32_ADC=y
+CONFIG_SET_DFU_ALT_INFO=y
+CONFIG_USB_FUNCTION_FASTBOOT=y
+CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
+CONFIG_FASTBOOT_BUF_SIZE=0x02000000
+CONFIG_FASTBOOT_USB_DEV=1
+CONFIG_FASTBOOT_FLASH=y
+CONFIG_FASTBOOT_FLASH_MMC_DEV=1
+CONFIG_FASTBOOT_MMC_BOOT_SUPPORT=y
+CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
+CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
+CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
+CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
+CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
+CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
+CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
+CONFIG_GPIO_HOG=y
+CONFIG_DM_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_STM32F7=y
+CONFIG_LED=y
+CONFIG_LED_GPIO=y
+CONFIG_DM_MAILBOX=y
+CONFIG_STM32_IPCC=y
+CONFIG_STM32_FMC2_EBI=y
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_STM32_SDMMC2=y
+CONFIG_MTD=y
+CONFIG_DM_MTD=y
+CONFIG_SYS_MTDPARTS_RUNTIME=y
+CONFIG_MTD_RAW_NAND=y
+CONFIG_NAND_STM32_FMC2=y
+CONFIG_MTD_SPI_NAND=y
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH_MACRONIX=y
+CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
+CONFIG_SPI_FLASH_WINBOND=y
+# CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
+CONFIG_SPI_FLASH_MTD=y
+CONFIG_PHY_REALTEK=y
+CONFIG_DM_ETH=y
+CONFIG_DWC_ETH_QOS=y
+CONFIG_PHY=y
+CONFIG_PHY_STM32_USBPHYC=y
+CONFIG_PINCONF=y
+# CONFIG_SPL_PINCTRL_FULL is not set
+CONFIG_PINCTRL_STMFX=y
+CONFIG_DM_PMIC=y
+# CONFIG_SPL_PMIC_CHILDREN is not set
+CONFIG_PMIC_STPMIC1=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_REGULATOR_GPIO=y
+CONFIG_DM_REGULATOR_STM32_VREFBUF=y
+CONFIG_DM_REGULATOR_STPMIC1=y
+CONFIG_REMOTEPROC_STM32_COPRO=y
+CONFIG_DM_RNG=y
+CONFIG_RNG_STM32MP1=y
+CONFIG_DM_RTC=y
+CONFIG_RTC_STM32=y
+CONFIG_BAUDRATE=2000000
+CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_STM32_QSPI=y
+CONFIG_STM32_SPI=y
+CONFIG_SYSRESET_CMD_POWEROFF=y
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+CONFIG_USB=y
+CONFIG_DM_USB_GADGET=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_GENERIC=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
+CONFIG_USB_GADGET_VENDOR_NUM=0x0483
+CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
+CONFIG_USB_GADGET_DWC2_OTG=y
+CONFIG_DM_VIDEO=y
+CONFIG_BACKLIGHT_GPIO=y
+CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
+CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
+CONFIG_VIDEO_STM32=y
+CONFIG_VIDEO_STM32_DSI=y
+CONFIG_VIDEO_STM32_MAX_XRES=1280
+CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
+CONFIG_WDT=y
+CONFIG_WDT_STM32MP=y
+CONFIG_ECDSA=y
+CONFIG_SPL_ECDSA_VERIFY=y
+CONFIG_ERRNO_STR=y
+CONFIG_FDT_FIXUP_PARTITIONS=y
+# CONFIG_LMB_USE_MAX_REGIONS is not set
+CONFIG_LMB_MEMORY_REGIONS=2
+CONFIG_LMB_RESERVED_REGIONS=16
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
