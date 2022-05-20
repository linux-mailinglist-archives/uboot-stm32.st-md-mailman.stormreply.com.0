Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB252F0A3
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 18:27:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6035BC5F1FA;
	Fri, 20 May 2022 16:27:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F8C9C5F1D5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 16:27:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KAXfos014061;
 Fri, 20 May 2022 18:27:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=aHjkF8hVcItllZ7uhu0+6XzesXTlRb/B3DrQrwDMDT4=;
 b=sMlo864k54rqN83HjLaMVwhweHUPjP5vu5KQ2xL4+MbY2Td/y2teFpF0pOMOzv5Hncwd
 n7DeTn/YAZD3vs8W06jSxNaphDseQaD4q+F/E8i0ae9uM8LCLepdtJYBpJRjJrLGKM6t
 /ZCBoekglB4lv7/8a/8ReJ11dUiGdmAhlWZvs3VbEfr7ufIrRn46OUe9dzfPvUlsHQ+M
 GNVV3w8+a+1i8MrdsUNoZ2aKW+S2vjOAYXIxBEz3GS/LS47E43+zgDfmqhenU6Mt+Q7m
 O2RqSkniXIs1/xH4EpEPbBPuOeQbYoGKrhmkgHfY1C7HId+qBSy+MgVu/5SwP4u+w1tY Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23aj9apw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 18:27:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 04DCF100042;
 Fri, 20 May 2022 18:27:49 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DF9E26026A;
 Fri, 20 May 2022 18:27:12 +0200 (CEST)
Received: from localhost (10.75.127.46) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 18:26:14 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 20 May 2022 18:24:43 +0200
Message-ID: <20220520182444.v2.5.Id34b18d3ce5c7d33defb18c3c6e545f22190372d@changeid>
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
Subject: [Uboot-stm32] [PATCH v2 05/16] arm: stm32mp: add choice for STM32MP
	SOC family
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

Add mandatory choice for SOC support in ARCH_STM32MP.

This patch is a preliminary step for new SOC introduction
in STM32MP family.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 arch/arm/mach-stm32mp/Kconfig       | 23 +++++++++++++----------
 configs/stm32mp15_basic_defconfig   |  4 ++--
 configs/stm32mp15_defconfig         |  4 ++--
 configs/stm32mp15_trusted_defconfig |  4 ++--
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index be0d74b4ac..446d3258c9 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -33,6 +33,10 @@ config SYS_MALLOC_LEN
 config ENV_SIZE
 	default 0x2000
 
+choice
+	prompt "Select STMicroelectronics STM32MPxxx Soc"
+	default STM32MP15x
+
 config STM32MP15x
 	bool "Support STMicroelectronics STM32MP15x Soc"
 	select ARCH_SUPPORT_PSCI
@@ -54,11 +58,13 @@ config STM32MP15x
 		STM32MP157, STM32MP153 or STM32MP151
 		STMicroelectronics MPU with core ARMv7
 		dual core A7 for STM32MP157/3, monocore for STM32MP151
-		target all the STMicroelectronics board with SOC STM32MP1 family
+endchoice
+
+if STM32MP15x
 
 config STM32MP15x_STM32IMAGE
 	bool "Support STM32 image for generated U-Boot image"
-	depends on STM32MP15x && TFABOOT
+	depends on TFABOOT
 	help
 		Support of STM32 image generation for SOC STM32MP15x
 		for TF-A boot when FIP container is not used
@@ -69,7 +75,6 @@ choice
 
 config TARGET_ST_STM32MP15x
 	bool "STMicroelectronics STM32MP15x boards"
-	select STM32MP15x
 	imply BOOTSTAGE
 	imply CMD_BOOTSTAGE
 	imply CMD_CLS if CMD_BMP
@@ -84,7 +89,6 @@ config TARGET_ST_STM32MP15x
 
 config TARGET_MICROGEA_STM32MP1
 	bool "Engicam MicroGEA STM32MP1 SOM"
-	select STM32MP15x
 	imply BOOTSTAGE
 	imply CMD_BOOTSTAGE
 	imply CMD_CLS if CMD_BMP
@@ -109,7 +113,6 @@ config TARGET_MICROGEA_STM32MP1
 
 config TARGET_ICORE_STM32MP1
 	bool "Engicam i.Core STM32MP1 SOM"
-	select STM32MP15x
 	imply BOOTSTAGE
 	imply CMD_BOOTSTAGE
 	imply CMD_CLS if CMD_BMP
@@ -131,12 +134,16 @@ config TARGET_ICORE_STM32MP1
 
 config TARGET_DH_STM32MP1_PDK2
 	bool "DH STM32MP1 PDK2"
-	select STM32MP15x
 	help
 		Target the DH PDK2 development kit with STM32MP15x SoM.
 
 endchoice
 
+source "board/st/stm32mp1/Kconfig"
+source "board/dhelectronics/dh_stm32mp1/Kconfig"
+source "board/engicam/stm32mp1/Kconfig"
+endif
+
 config SYS_TEXT_BASE
 	default 0xC0100000
 
@@ -221,8 +228,4 @@ config DEBUG_UART_CLOCK
 endif
 
 source "arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig"
-source "board/dhelectronics/dh_stm32mp1/Kconfig"
-source "board/engicam/stm32mp1/Kconfig"
-source "board/st/stm32mp1/Kconfig"
-
 endif
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 1b1c255b98..2e2d127ab7 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -9,10 +9,10 @@ CONFIG_SPL_TEXT_BASE=0x2FFC2500
 CONFIG_SPL_MMC=y
 CONFIG_SPL=y
 CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_TYPEC_STUSB160X=y
+CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_CMD_STM32KEY=y
 CONFIG_CMD_STM32PROG=y
-CONFIG_ENV_OFFSET_REDUND=0x2C0000
-CONFIG_TYPEC_STUSB160X=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI=y
 # CONFIG_ARMV7_VIRT is not set
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 02b37e14ea..8853c72c37 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -6,11 +6,11 @@ CONFIG_ENV_OFFSET=0x480000
 CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_TYPEC_STUSB160X=y
+CONFIG_ENV_OFFSET_REDUND=0x4C0000
 CONFIG_DDR_CACHEABLE_SIZE=0x10000000
 CONFIG_CMD_STM32KEY=y
 CONFIG_CMD_STM32PROG=y
-CONFIG_ENV_OFFSET_REDUND=0x4C0000
-CONFIG_TYPEC_STUSB160X=y
 # CONFIG_ARMV7_NONSEC is not set
 CONFIG_SYS_LOAD_ADDR=0xc2000000
 CONFIG_SYS_MEMTEST_START=0xc0000000
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index df31c0fbb1..e880dd3fcb 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -7,11 +7,11 @@ CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_STM32MP15x_STM32IMAGE=y
 CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_TYPEC_STUSB160X=y
+CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_DDR_CACHEABLE_SIZE=0x10000000
 CONFIG_CMD_STM32KEY=y
 CONFIG_CMD_STM32PROG=y
-CONFIG_ENV_OFFSET_REDUND=0x2C0000
-CONFIG_TYPEC_STUSB160X=y
 # CONFIG_ARMV7_NONSEC is not set
 CONFIG_SYS_LOAD_ADDR=0xc2000000
 CONFIG_SYS_MEMTEST_START=0xc0000000
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
