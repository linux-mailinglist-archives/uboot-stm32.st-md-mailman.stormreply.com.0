Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A39428827
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Oct 2021 09:53:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB82EC597B0;
	Mon, 11 Oct 2021 07:53:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA7AEC58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 07:53:16 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B7G2hb020087; 
 Mon, 11 Oct 2021 09:52:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=6giqjP5kWfsxux89LzNKWGQZFxpHbhI2meqntPmol9I=;
 b=MpWCngVJgPqj+MfZZNECFVFBerAt9jKmfTYBSqLOlrNYRXBlpXUCFbJoL3X7taU4d2b9
 CROn/M09CB9q/9Yx85KFB6/BylLuDOCsoRCY7+fdRKIuy3jhFSjfFgnhLaWsmn0dk0tu
 8T7Nu9DMr6LBi7cEO3EOl0OzgKZKRBVWfY42sj65ym7m6sa0xKTyB1vkWpzXjzos60+N
 7jNptwKYI8XsgfLJ2YjwoSD27oKqAztOTKSRxaZtf+nShGSiTiEM1OJjYW5CXdWSMrqq
 7XPIoZXJnTcyzxX+Sufcr/C+bWzjY9waxc6dFUehRFtA1zz/4bzuXQFfvfr3kZRORxVz 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bmgqu87bq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 09:52:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2865D100034;
 Mon, 11 Oct 2021 09:52:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 06AAE21513A;
 Mon, 11 Oct 2021 09:52:57 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 11 Oct 2021 09:52:56
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 11 Oct 2021 09:52:49 +0200
Message-ID: <20211011075244.2.Iceb3be142ba855190aaab771d6922f41ffcaccc3@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011075244.1.Icb805e47dd8102559236013264342b52c187813f@changeid>
References: <20211011075244.1.Icb805e47dd8102559236013264342b52c187813f@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_02,2021-10-07_02,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Rick Chen <rick@andestech.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 2/4] stm32mp15: remove configs dependency on
	CONFIG_TFABOOT
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

Remove the dependency on CONFIG_TFABOOT in stm32mp Kconfig
- always activate the ARCH config: CONFIG_ARCH_SUPPORT_PSCI
  and CONFIG_CPU_V7_HAS_NONSEC
- CONFIG_ARMV7_NONSEC is deactivated in trusted defconfig
- the correct sysreset driver is activated in each defconfig:
  CONFIG_SYSRESET_PSCI or SYSRESET_SYSCON

Reported-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/Kconfig                             | 8 ++------
 configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig        | 1 +
 configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig       | 1 +
 .../stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig   | 1 +
 configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig   | 1 +
 configs/stm32mp15_basic_defconfig                         | 1 +
 configs/stm32mp15_defconfig                               | 3 +++
 configs/stm32mp15_dhcom_basic_defconfig                   | 1 +
 configs/stm32mp15_dhcor_basic_defconfig                   | 1 +
 configs/stm32mp15_trusted_defconfig                       | 3 +++
 10 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 69d56c23e1..4ef0daeab2 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -35,10 +35,9 @@ config ENV_SIZE
 
 config STM32MP15x
 	bool "Support STMicroelectronics STM32MP15x Soc"
-	select ARCH_SUPPORT_PSCI if !TFABOOT
-	select ARM_SMCCC if TFABOOT
+	select ARCH_SUPPORT_PSCI
 	select CPU_V7A
-	select CPU_V7_HAS_NONSEC if !TFABOOT
+	select CPU_V7_HAS_NONSEC
 	select CPU_V7_HAS_VIRT
 	select OF_BOARD_SETUP
 	select PINCTRL_STM32
@@ -47,8 +46,6 @@ config STM32MP15x
 	select STM32_SERIAL
 	select SYS_ARCH_TIMER
 	imply CMD_NVEDIT_INFO
-	imply SYSRESET_PSCI if TFABOOT
-	imply SYSRESET_SYSCON if !TFABOOT
 	help
 		support of STMicroelectronics SOC STM32MP15x family
 		STM32MP157, STM32MP153 or STM32MP151
@@ -153,7 +150,6 @@ config NR_DRAM_BANKS
 
 config DDR_CACHEABLE_SIZE
 	hex "Size of the DDR marked cacheable in pre-reloc stage"
-	default 0x10000000 if TFABOOT
 	default 0x40000000
 	help
 		Define the size of the DDR marked as cacheable in U-Boot
diff --git a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
index 14bf6d1376..ecc5ec1ffe 100644
--- a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
+++ b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
@@ -73,6 +73,7 @@ CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_SYSRESET_SYSCON=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_LZO=y
diff --git a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
index 648ecbfc67..fc5b5f370b 100644
--- a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
+++ b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
@@ -73,6 +73,7 @@ CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_SYSRESET_SYSCON=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_LZO=y
diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
index f422ffbeda..4faa4e3ce4 100644
--- a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
+++ b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
@@ -73,6 +73,7 @@ CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_SYSRESET_SYSCON=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_LZO=y
diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
index 244d9ccf4e..bab81bfa92 100644
--- a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
+++ b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
@@ -73,6 +73,7 @@ CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_SYSRESET_SYSCON=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_LZO=y
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 77ed82c99f..6b3c2d6150 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -147,6 +147,7 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_STM32_SPI=y
+CONFIG_SYSRESET_SYSCON=y
 CONFIG_USB=y
 CONFIG_DM_USB_GADGET=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 701b1510c5..9d97301075 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -8,10 +8,12 @@ CONFIG_ENV_OFFSET=0x480000
 CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_DDR_CACHEABLE_SIZE=0x10000000
 CONFIG_CMD_STM32KEY=y
 CONFIG_CMD_STM32PROG=y
 CONFIG_ENV_OFFSET_REDUND=0x4C0000
 CONFIG_TYPEC_STUSB160X=y
+# CONFIG_ARMV7_NONSEC is not set
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_LOAD_ADDR=0xc2000000
 CONFIG_FIT=y
@@ -126,6 +128,7 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_STM32_SPI=y
+CONFIG_SYSRESET_PSCI=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 # CONFIG_OPTEE_TA_AVB is not set
diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index 5b85f6ad03..8da8f3fe2a 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -129,6 +129,7 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_STM32_SPI=y
+CONFIG_SYSRESET_SYSCON=y
 CONFIG_USB=y
 CONFIG_DM_USB_GADGET=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index 37dd2754c0..4315c4be3c 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -123,6 +123,7 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_STM32_SPI=y
+CONFIG_SYSRESET_SYSCON=y
 CONFIG_USB=y
 CONFIG_DM_USB_GADGET=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index b4ed090e3f..5e2ec49298 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -9,10 +9,12 @@ CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_STM32MP15x_STM32IMAGE=y
 CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_DDR_CACHEABLE_SIZE=0x10000000
 CONFIG_CMD_STM32KEY=y
 CONFIG_CMD_STM32PROG=y
 CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_TYPEC_STUSB160X=y
+# CONFIG_ARMV7_NONSEC is not set
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_LOAD_ADDR=0xc2000000
 CONFIG_FIT=y
@@ -127,6 +129,7 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_STM32_SPI=y
+CONFIG_SYSRESET_PSCI=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 # CONFIG_OPTEE_TA_AVB is not set
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
