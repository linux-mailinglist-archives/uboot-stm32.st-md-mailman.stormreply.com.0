Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A32AF1A13C
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:20:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DF29CA8E5F
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:20:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B197BCA8E5C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:20:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6dFT020397; Fri, 10 May 2019 18:20:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=oH8jFyx+shAdiAns0lrX2Ofn/vByXtuG6ZQzM1GICu8=;
 b=VKlUE7ImaAnsUyPnZVrT7oKCk65YALm+U6EcVB6wwmZWXrq4QzPI7UCnsGB8GtsBvjsx
 exqG2FVs03n2mAw2VE/D4EejfAZdr6Fk6D1uVzwtqo0kiZtPF/b3Qs+p6itlFAFYu9cz
 x2eLpoDXtquTTFfx5SRibi+ZkFEjkT7Kl8Lh9lh+U+JPcc51oaenPtTBwzmfU4y4x41/
 r4IqEuel1mxr6JiUe2fgFb3eJGe+mk8rwFTQfgUpayHfGY8xDjsWBGhUMspkPqHvphZp
 NU9CckelGoxOhhdQ9NYjXMRssj54NaiLZQbqW1ZX/daPRdVxckIutL/N8PfOKYUu5H2N oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2scfv2sr2h-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:20:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B95E31;
 Fri, 10 May 2019 16:20:10 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3396D2C4D;
 Fri, 10 May 2019 16:20:10 +0000 (GMT)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:20:09 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:19:02 +0200
Message-ID: <1557505154-3856-2-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
References: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 01/13] stm32mp1: activate NAND and NOR support
	on EV1
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

From: Patrick Delaunay <patrick.delaunay@st.com>

Add the necessary configuration to have NAND and NOR support on ev1 board
for BASIC boot (with SPL) or for TRUSTED boot (with TF-A).

STM32MP> nand info

Device 0: nand0, sector size 256 KiB
  Page size       4096 b
  OOB size         224 b
  Erase size    262144 b
  subpagesize     4096 b
  options     0x00184200
  bbt options 0x00060000

STM32MP> sf probe
SF: Detected mx66l51235l with page size 256 Bytes, erase size 64 KiB, total 64 MiB

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 arch/arm/dts/stm32mp157-pinctrl.dtsi | 44 ++++++++++++++++++++++++++++++++++++
 arch/arm/dts/stm32mp157c-ev1.dts     | 16 +++++++++++++
 arch/arm/dts/stm32mp157c.dtsi        | 15 ++++++++++++
 configs/stm32mp15_basic_defconfig    | 17 ++++++++++++++
 configs/stm32mp15_trusted_defconfig  | 17 ++++++++++++++
 include/configs/stm32mp1.h           |  3 +++
 6 files changed, 112 insertions(+)

diff --git a/arch/arm/dts/stm32mp157-pinctrl.dtsi b/arch/arm/dts/stm32mp157-pinctrl.dtsi
index 0aae69b..9d1d386 100644
--- a/arch/arm/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp157-pinctrl.dtsi
@@ -210,6 +210,50 @@
 				};
 			};
 
+			fmc_pins_a: fmc-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
+						 <STM32_PINMUX('D', 5, AF12)>, /* FMC_NWE */
+						 <STM32_PINMUX('D', 11, AF12)>, /* FMC_A16_FMC_CLE */
+						 <STM32_PINMUX('D', 12, AF12)>, /* FMC_A17_FMC_ALE */
+						 <STM32_PINMUX('D', 14, AF12)>, /* FMC_D0 */
+						 <STM32_PINMUX('D', 15, AF12)>, /* FMC_D1 */
+						 <STM32_PINMUX('D', 0, AF12)>, /* FMC_D2 */
+						 <STM32_PINMUX('D', 1, AF12)>, /* FMC_D3 */
+						 <STM32_PINMUX('E', 7, AF12)>, /* FMC_D4 */
+						 <STM32_PINMUX('E', 8, AF12)>, /* FMC_D5 */
+						 <STM32_PINMUX('E', 9, AF12)>, /* FMC_D6 */
+						 <STM32_PINMUX('E', 10, AF12)>, /* FMC_D7 */
+						 <STM32_PINMUX('G', 9, AF12)>; /* FMC_NE2_FMC_NCE */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <1>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('D', 6, AF12)>; /* FMC_NWAIT */
+					bias-pull-up;
+				};
+			};
+
+			fmc_sleep_pins_a: fmc-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('D', 4, ANALOG)>, /* FMC_NOE */
+						 <STM32_PINMUX('D', 5, ANALOG)>, /* FMC_NWE */
+						 <STM32_PINMUX('D', 11, ANALOG)>, /* FMC_A16_FMC_CLE */
+						 <STM32_PINMUX('D', 12, ANALOG)>, /* FMC_A17_FMC_ALE */
+						 <STM32_PINMUX('D', 14, ANALOG)>, /* FMC_D0 */
+						 <STM32_PINMUX('D', 15, ANALOG)>, /* FMC_D1 */
+						 <STM32_PINMUX('D', 0, ANALOG)>, /* FMC_D2 */
+						 <STM32_PINMUX('D', 1, ANALOG)>, /* FMC_D3 */
+						 <STM32_PINMUX('E', 7, ANALOG)>, /* FMC_D4 */
+						 <STM32_PINMUX('E', 8, ANALOG)>, /* FMC_D5 */
+						 <STM32_PINMUX('E', 9, ANALOG)>, /* FMC_D6 */
+						 <STM32_PINMUX('E', 10, ANALOG)>, /* FMC_D7 */
+						 <STM32_PINMUX('D', 6, ANALOG)>, /* FMC_NWAIT */
+						 <STM32_PINMUX('G', 9, ANALOG)>; /* FMC_NE2_FMC_NCE */
+				};
+			};
+
 			i2c1_pins_a: i2c1-0 {
 				pins {
 					pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
index a6ee379..69980ca 100644
--- a/arch/arm/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/dts/stm32mp157c-ev1.dts
@@ -92,6 +92,22 @@
 	};
 };
 
+&fmc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&fmc_pins_a>;
+	pinctrl-1 = <&fmc_sleep_pins_a>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nand: nand@0 {
+		reg = <0>;
+		nand-on-flash-bbt;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
 &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins_a>;
diff --git a/arch/arm/dts/stm32mp157c.dtsi b/arch/arm/dts/stm32mp157c.dtsi
index 9463433..dd0f4e8 100644
--- a/arch/arm/dts/stm32mp157c.dtsi
+++ b/arch/arm/dts/stm32mp157c.dtsi
@@ -1033,6 +1033,21 @@
 			dma-requests = <48>;
 		};
 
+		fmc: nand-controller@58002000 {
+			compatible = "st,stm32mp15-fmc2";
+			reg = <0x58002000 0x1000>,
+			      <0x80000000 0x1000>,
+			      <0x88010000 0x1000>,
+			      <0x88020000 0x1000>,
+			      <0x81000000 0x1000>,
+			      <0x89010000 0x1000>,
+			      <0x89020000 0x1000>;
+			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc FMC_K>;
+			resets = <&rcc FMC_R>;
+			stafmctus = "disabled";
+		};
+
 		qspi: spi@58003000 {
 			compatible = "st,stm32f469-qspi";
 			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index bd75df8..f5e13dd 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -29,6 +29,7 @@ CONFIG_CMD_GPIO=y
 CONFIG_CMD_GPT=y
 CONFIG_CMD_I2C=y
 CONFIG_CMD_MMC=y
+CONFIG_CMD_SF=y
 CONFIG_CMD_USB=y
 CONFIG_CMD_USB_MASS_STORAGE=y
 CONFIG_CMD_CACHE=y
@@ -37,6 +38,7 @@ CONFIG_CMD_TIMER=y
 CONFIG_CMD_PMIC=y
 CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_EXT4_WRITE=y
+CONFIG_CMD_MTDPARTS=y
 # CONFIG_SPL_DOS_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_STM32_ADC=y
@@ -54,6 +56,18 @@ CONFIG_LED=y
 CONFIG_LED_GPIO=y
 CONFIG_DM_MMC=y
 CONFIG_STM32_SDMMC2=y
+CONFIG_MTD=y
+CONFIG_NAND=y
+CONFIG_NAND_STM32_FMC2=y
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH=y
+CONFIG_SPI_FLASH_BAR=y
+CONFIG_SPI_FLASH_MACRONIX=y
+CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
+CONFIG_SPI_FLASH_WINBOND=y
+# CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
+CONFIG_SPI_FLASH_MTD=y
 CONFIG_PHY=y
 CONFIG_PHY_STM32_USBPHYC=y
 CONFIG_PINCONF=y
@@ -68,6 +82,9 @@ CONFIG_DM_REGULATOR_STM32_VREFBUF=y
 CONFIG_DM_REGULATOR_STPMIC1=y
 CONFIG_SERIAL_RX_BUFFER=y
 CONFIG_STM32_SERIAL=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_STM32_QSPI=y
 CONFIG_USB=y
 CONFIG_DM_USB=y
 CONFIG_DM_USB_GADGET=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index f82b770..cae3324 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -22,6 +22,7 @@ CONFIG_CMD_GPIO=y
 CONFIG_CMD_GPT=y
 CONFIG_CMD_I2C=y
 CONFIG_CMD_MMC=y
+CONFIG_CMD_SF=y
 CONFIG_CMD_USB=y
 CONFIG_CMD_USB_MASS_STORAGE=y
 CONFIG_CMD_CACHE=y
@@ -30,6 +31,7 @@ CONFIG_CMD_TIMER=y
 CONFIG_CMD_PMIC=y
 CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_EXT4_WRITE=y
+CONFIG_CMD_MTDPARTS=y
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_STM32_ADC=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
@@ -46,6 +48,18 @@ CONFIG_LED=y
 CONFIG_LED_GPIO=y
 CONFIG_DM_MMC=y
 CONFIG_STM32_SDMMC2=y
+CONFIG_MTD=y
+CONFIG_NAND=y
+CONFIG_NAND_STM32_FMC2=y
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH=y
+CONFIG_SPI_FLASH_BAR=y
+CONFIG_SPI_FLASH_MACRONIX=y
+CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
+CONFIG_SPI_FLASH_WINBOND=y
+# CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
+CONFIG_SPI_FLASH_MTD=y
 CONFIG_PHY=y
 CONFIG_PHY_STM32_USBPHYC=y
 CONFIG_PINCONF=y
@@ -58,6 +72,9 @@ CONFIG_DM_REGULATOR_STM32_VREFBUF=y
 CONFIG_DM_REGULATOR_STPMIC1=y
 CONFIG_SERIAL_RX_BUFFER=y
 CONFIG_STM32_SERIAL=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_STM32_QSPI=y
 CONFIG_USB=y
 CONFIG_DM_USB=y
 CONFIG_DM_USB_GADGET=y
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 3069373..a28b8b3 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -85,6 +85,9 @@
 
 #if !defined(CONFIG_SPL_BUILD)
 
+/* NAND support */
+#define CONFIG_SYS_NAND_ONFI_DETECTION
+#define CONFIG_SYS_MAX_NAND_DEVICE	1
 #define BOOT_TARGET_DEVICES(func) \
 	func(MMC, mmc, 1) \
 	func(MMC, mmc, 0) \
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
