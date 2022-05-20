Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FCB52F0A1
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 18:27:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CA7CC5F1D5;
	Fri, 20 May 2022 16:27:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 174E3C5F1D3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 16:27:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KEtXVQ024416;
 Fri, 20 May 2022 18:27:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=MffSmF1B57DKjT/8hWq7+KSRbmWFN00ga+8p/AD0X+8=;
 b=OazxGnTE0hSy3vBMvL0A74BVIOxw+wffrDwehRoSud3I8rL0hs1l1IIAFaWYlFr5e3eW
 R8mUeoy5fLfzL01bv2ykgRIrJmPTRcRww9fXKsCDdiWzhDjLnG653ZRPG+Cmd77GXpSk
 1CCER+p/r/n1gW/ui6ZmWC0XabS14nh2r9dqIUHBmgKhjp7aTmCTPoNgKYGViYs045Hu
 K64YYSck7Og0RRmq9JBkdYCzokcDFZ4C5MplJcgfap5retBr/i9PIKHoorWVCfNhUfw+
 OwvxhN6D1fRWUW03h8YJCO14TLtUUpIAdECNeNS+QeyoxCAmPja4q+Il5OU3bbTHhDl+ 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23aj9apv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 18:27:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC09D10003D;
 Fri, 20 May 2022 18:27:48 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5490A25E51B;
 Fri, 20 May 2022 18:27:12 +0200 (CEST)
Received: from localhost (10.75.127.46) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 18:26:14 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 20 May 2022 18:24:44 +0200
Message-ID: <20220520182444.v2.6.I90e6955a55b1eea31e8a17d216eb9bdd76332f5d@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
References: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 06/16] arm: stm32mp: add sub config
	Kconfig.15x
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

Add sub Kconfig for each SOC in the STM32 CPU family.

It is a preliminary step to introduce a new SOC in the STM32MP family.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 arch/arm/mach-stm32mp/Kconfig       | 119 +---------------------------
 arch/arm/mach-stm32mp/Kconfig.15x   | 119 ++++++++++++++++++++++++++++
 configs/stm32mp15_basic_defconfig   |   2 +-
 configs/stm32mp15_defconfig         |   4 +-
 configs/stm32mp15_trusted_defconfig |   4 +-
 5 files changed, 125 insertions(+), 123 deletions(-)
 create mode 100644 arch/arm/mach-stm32mp/Kconfig.15x

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 446d3258c9..3b4936c326 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -60,93 +60,6 @@ config STM32MP15x
 		dual core A7 for STM32MP157/3, monocore for STM32MP151
 endchoice
 
-if STM32MP15x
-
-config STM32MP15x_STM32IMAGE
-	bool "Support STM32 image for generated U-Boot image"
-	depends on TFABOOT
-	help
-		Support of STM32 image generation for SOC STM32MP15x
-		for TF-A boot when FIP container is not used
-
-choice
-	prompt "STM32MP15x board select"
-	optional
-
-config TARGET_ST_STM32MP15x
-	bool "STMicroelectronics STM32MP15x boards"
-	imply BOOTSTAGE
-	imply CMD_BOOTSTAGE
-	imply CMD_CLS if CMD_BMP
-	imply DISABLE_CONSOLE
-	imply PRE_CONSOLE_BUFFER
-	imply SILENT_CONSOLE
-	help
-		target the STMicroelectronics board with SOC STM32MP15x
-		managed by board/st/stm32mp1:
-		Evalulation board (EV1) or Discovery board (DK1 and DK2).
-		The difference between board are managed with devicetree
-
-config TARGET_MICROGEA_STM32MP1
-	bool "Engicam MicroGEA STM32MP1 SOM"
-	imply BOOTSTAGE
-	imply CMD_BOOTSTAGE
-	imply CMD_CLS if CMD_BMP
-	imply DISABLE_CONSOLE
-	imply PRE_CONSOLE_BUFFER
-	imply SILENT_CONSOLE
-	help
-	  MicroGEA STM32MP1 is a STM32MP157A based Micro SOM.
-
-	  MicroGEA STM32MP1 MicroDev 2.0:
-	  * MicroDev 2.0 is a general purpose miniature carrier board with CAN,
-	    LTE and LVDS panel interfaces.
-	  * MicroGEA STM32MP1 needs to mount on top of this MicroDev 2.0 board
-	    for creating complete MicroGEA STM32MP1 MicroDev 2.0 Carrier board.
-
-	  MicroGEA STM32MP1 MicroDev 2.0 7" OF:
-	  * 7" OF is a capacitive touch 7" Open Frame panel solutions with LVDS
-	    panel and toucscreen.
-	  * MicroGEA STM32MP1 needs to mount on top of MicroDev 2.0 board with
-	    pluged 7" OF for creating complete MicroGEA STM32MP1 MicroDev 2.0 7"
-	    Open Frame Solution board.
-
-config TARGET_ICORE_STM32MP1
-	bool "Engicam i.Core STM32MP1 SOM"
-	imply BOOTSTAGE
-	imply CMD_BOOTSTAGE
-	imply CMD_CLS if CMD_BMP
-	imply DISABLE_CONSOLE
-	imply PRE_CONSOLE_BUFFER
-	imply SILENT_CONSOLE
-	help
-	  i.Core STM32MP1 is an EDIMM SOM based on STM32MP157A.
-
-	  i.Core STM32MP1 EDIMM2.2:
-	  * EDIMM2.2 is a Form Factor Capacitive Evaluation Board.
-	  * i.Core STM32MP1 needs to mount on top of EDIMM2.2 for
-	    creating complete i.Core STM32MP1 EDIMM2.2 Starter Kit.
-
-	  i.Core STM32MP1 C.TOUCH 2.0
-	  * C.TOUCH 2.0 is a general purpose Carrier board.
-	  * i.Core STM32MP1 needs to mount on top of this Carrier board
-	    for creating complete i.Core STM32MP1 C.TOUCH 2.0 board.
-
-config TARGET_DH_STM32MP1_PDK2
-	bool "DH STM32MP1 PDK2"
-	help
-		Target the DH PDK2 development kit with STM32MP15x SoM.
-
-endchoice
-
-source "board/st/stm32mp1/Kconfig"
-source "board/dhelectronics/dh_stm32mp1/Kconfig"
-source "board/engicam/stm32mp1/Kconfig"
-endif
-
-config SYS_TEXT_BASE
-	default 0xC0100000
-
 config NR_DRAM_BANKS
 	default 1
 
@@ -195,37 +108,7 @@ config CMD_STM32KEY
 		This command is used to evaluate the secure boot on stm32mp SOC,
 		it is deactivated by default in real products.
 
-config PRE_CON_BUF_ADDR
-	default 0xC02FF000
-
-config PRE_CON_BUF_SZ
-	default 4096
-
-config BOOTSTAGE_STASH_ADDR
-	default 0xC3000000
-
-if BOOTCOUNT_GENERIC
-config SYS_BOOTCOUNT_SINGLEWORD
-	default y
-
-# TAMP_BOOTCOUNT = TAMP_BACKUP_REGISTER(21)
-config SYS_BOOTCOUNT_ADDR
-	default 0x5C00A154
-endif
-
-if DEBUG_UART
-
-config DEBUG_UART_BOARD_INIT
-	default y
-
-# debug on UART4 by default
-config DEBUG_UART_BASE
-	default 0x40010000
-
-# clock source is HSI on reset
-config DEBUG_UART_CLOCK
-	default 64000000
-endif
+source "arch/arm/mach-stm32mp/Kconfig.15x"
 
 source "arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig"
 endif
diff --git a/arch/arm/mach-stm32mp/Kconfig.15x b/arch/arm/mach-stm32mp/Kconfig.15x
new file mode 100644
index 0000000000..19f161cf5c
--- /dev/null
+++ b/arch/arm/mach-stm32mp/Kconfig.15x
@@ -0,0 +1,119 @@
+if STM32MP15x
+
+config STM32MP15x_STM32IMAGE
+	bool "Support STM32 image for generated U-Boot image"
+	depends on TFABOOT
+	help
+		Support of STM32 image generation for SOC STM32MP15x
+		for TF-A boot when FIP container is not used
+
+choice
+	prompt "STM32MP15x board select"
+	optional
+
+config TARGET_ST_STM32MP15x
+	bool "STMicroelectronics STM32MP15x boards"
+	imply BOOTSTAGE
+	imply CMD_BOOTSTAGE
+	imply CMD_CLS if CMD_BMP
+	imply DISABLE_CONSOLE
+	imply PRE_CONSOLE_BUFFER
+	imply SILENT_CONSOLE
+	help
+		target the STMicroelectronics board with SOC STM32MP15x
+		managed by board/st/stm32mp1:
+		Evalulation board (EV1) or Discovery board (DK1 and DK2).
+		The difference between board are managed with devicetree
+
+config TARGET_DH_STM32MP1_PDK2
+	bool "DH STM32MP1 PDK2"
+	help
+		Target the DH PDK2 development kit with STM32MP15x SoM.
+
+config TARGET_MICROGEA_STM32MP1
+	bool "Engicam MicroGEA STM32MP1 SOM"
+	imply BOOTSTAGE
+	imply CMD_BOOTSTAGE
+	imply CMD_CLS if CMD_BMP
+	imply DISABLE_CONSOLE
+	imply PRE_CONSOLE_BUFFER
+	imply SILENT_CONSOLE
+	help
+	  MicroGEA STM32MP1 is a STM32MP157A based Micro SOM.
+
+	  MicroGEA STM32MP1 MicroDev 2.0:
+	  * MicroDev 2.0 is a general purpose miniature carrier board with CAN,
+	    LTE and LVDS panel interfaces.
+	  * MicroGEA STM32MP1 needs to mount on top of this MicroDev 2.0 board
+	    for creating complete MicroGEA STM32MP1 MicroDev 2.0 Carrier board.
+
+	  MicroGEA STM32MP1 MicroDev 2.0 7" OF:
+	  * 7" OF is a capacitive touch 7" Open Frame panel solutions with LVDS
+	    panel and toucscreen.
+	  * MicroGEA STM32MP1 needs to mount on top of MicroDev 2.0 board with
+	    pluged 7" OF for creating complete MicroGEA STM32MP1 MicroDev 2.0 7"
+	    Open Frame Solution board.
+
+config TARGET_ICORE_STM32MP1
+	bool "Engicam i.Core STM32MP1 SOM"
+	imply BOOTSTAGE
+	imply CMD_BOOTSTAGE
+	imply CMD_CLS if CMD_BMP
+	imply DISABLE_CONSOLE
+	imply PRE_CONSOLE_BUFFER
+	imply SILENT_CONSOLE
+	help
+	  i.Core STM32MP1 is an EDIMM SOM based on STM32MP157A.
+
+	  i.Core STM32MP1 EDIMM2.2:
+	  * EDIMM2.2 is a Form Factor Capacitive Evaluation Board.
+	  * i.Core STM32MP1 needs to mount on top of EDIMM2.2 for
+	    creating complete i.Core STM32MP1 EDIMM2.2 Starter Kit.
+
+	  i.Core STM32MP1 C.TOUCH 2.0
+	  * C.TOUCH 2.0 is a general purpose Carrier board.
+	  * i.Core STM32MP1 needs to mount on top of this Carrier board
+	    for creating complete i.Core STM32MP1 C.TOUCH 2.0 board.
+
+endchoice
+
+config SYS_TEXT_BASE
+	default 0xC0100000
+
+config PRE_CON_BUF_ADDR
+	default 0xC02FF000
+
+config PRE_CON_BUF_SZ
+	default 4096
+
+config BOOTSTAGE_STASH_ADDR
+	default 0xC3000000
+
+if BOOTCOUNT_GENERIC
+config SYS_BOOTCOUNT_SINGLEWORD
+	default y
+
+# TAMP_BOOTCOUNT = TAMP_BACKUP_REGISTER(21)
+config SYS_BOOTCOUNT_ADDR
+	default 0x5C00A154
+endif
+
+if DEBUG_UART
+
+config DEBUG_UART_BOARD_INIT
+	default y
+
+# debug on UART4 by default
+config DEBUG_UART_BASE
+	default 0x40010000
+
+# clock source is HSI on reset
+config DEBUG_UART_CLOCK
+	default 64000000
+endif
+
+source "board/st/stm32mp1/Kconfig"
+source "board/dhelectronics/dh_stm32mp1/Kconfig"
+source "board/engicam/stm32mp1/Kconfig"
+
+endif
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 2e2d127ab7..c325e9c55b 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -8,10 +8,10 @@ CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_SPL_TEXT_BASE=0x2FFC2500
 CONFIG_SPL_MMC=y
 CONFIG_SPL=y
+CONFIG_CMD_STM32KEY=y
 CONFIG_TARGET_ST_STM32MP15x=y
 CONFIG_TYPEC_STUSB160X=y
 CONFIG_ENV_OFFSET_REDUND=0x2C0000
-CONFIG_CMD_STM32KEY=y
 CONFIG_CMD_STM32PROG=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI=y
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 8853c72c37..b25cb2725b 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -5,11 +5,11 @@ CONFIG_SYS_MALLOC_F_LEN=0x3000
 CONFIG_ENV_OFFSET=0x480000
 CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
+CONFIG_DDR_CACHEABLE_SIZE=0x10000000
+CONFIG_CMD_STM32KEY=y
 CONFIG_TARGET_ST_STM32MP15x=y
 CONFIG_TYPEC_STUSB160X=y
 CONFIG_ENV_OFFSET_REDUND=0x4C0000
-CONFIG_DDR_CACHEABLE_SIZE=0x10000000
-CONFIG_CMD_STM32KEY=y
 CONFIG_CMD_STM32PROG=y
 # CONFIG_ARMV7_NONSEC is not set
 CONFIG_SYS_LOAD_ADDR=0xc2000000
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index e880dd3fcb..89e1b8ad86 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -5,12 +5,12 @@ CONFIG_SYS_MALLOC_F_LEN=0x3000
 CONFIG_ENV_OFFSET=0x280000
 CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
+CONFIG_DDR_CACHEABLE_SIZE=0x10000000
+CONFIG_CMD_STM32KEY=y
 CONFIG_STM32MP15x_STM32IMAGE=y
 CONFIG_TARGET_ST_STM32MP15x=y
 CONFIG_TYPEC_STUSB160X=y
 CONFIG_ENV_OFFSET_REDUND=0x2C0000
-CONFIG_DDR_CACHEABLE_SIZE=0x10000000
-CONFIG_CMD_STM32KEY=y
 CONFIG_CMD_STM32PROG=y
 # CONFIG_ARMV7_NONSEC is not set
 CONFIG_SYS_LOAD_ADDR=0xc2000000
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
