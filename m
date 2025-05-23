Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EADAC2022
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 May 2025 11:48:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04489C7A834;
	Fri, 23 May 2025 09:48:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B075C7A830
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 09:48:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N822lG025877;
 Fri, 23 May 2025 11:48:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 of9NU7iJb8qxaybHu2b6UkdVZ7w/oJhPxVieRaNKE3o=; b=1p835buheM+mrbol
 FBqfAfTjXGcMvnA3Uyrkl1fXFnJ/aDomhDemmnYbzLSatQodjL1Fip9f2w7YCvvh
 Jr/xHE45wtyLxa3/ZKzlLzzupnLLXkAcEd1uYc3QvCVAxRP+q7BwQ/AwDGhF+e99
 immv+Mm/S5EEt/UUUV+Y36+YqUxhhsfT+37uIAKkT3JFM0O0ycSu63SPIdirpVM+
 0YmbYhu9jZiW+Owce158UErRoIok56bBmGQCQhBFbohm2BySTfxiSEsRWUNR3q8j
 9hp9RVlt5Z4BvGsrj88/3BTmB76TNpJ7sx5ush4B5Q1j7zuju++Cy8RuVsJvD+Y7
 XsXK2w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfcd7xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 11:48:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D0BB640051;
 Fri, 23 May 2025 11:47:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4843ADC0DA;
 Fri, 23 May 2025 11:47:13 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 11:47:13 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: <u-boot@lists.denx.de>, Stefan Roese <sr@denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 23 May 2025 11:46:58 +0200
Message-ID: <20250523094658.299730-5-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521122755.265760-1-antonio.borneo@foss.st.com>
References: <20250521122755.265760-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 4/4] watchdog: don't autostart watchdog on
	STM32MP architecture
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

On STM32MP reference boards, the watchdog is started by a previous
boot stage (e.g. bootrom or secure OS), so the config flag
WATCHDOG_AUTOSTART is not required.
It's preferable to rely on the DT properties "u-boot,autostart" or
"u-boot,noautostart", if needed.

For backward compatibility on defconfigs that are based on SPL,
thus cannot rely on a previous boot stage for starting the
watchdog, enable WATCHDOG_AUTOSTART in their respective defconfig.
The change in stm32mp15_dhsom.config is propagated to:
- configs/stm32mp15_dhcom_basic.config
- configs/stm32mp15_dhcor_basic.config
and then to:
- stm32mp15_dhcom_basic_defconfig
- stm32mp15_dhcom_drc02_basic_defconfig
- stm32mp15_dhcom_pdk2_basic_defconfig
- stm32mp15_dhcom_picoitx_basic_defconfig
- stm32mp15_dhcor_avenger96_basic_defconfig
- stm32mp15_dhcor_basic_defconfig
- stm32mp15_dhcor_drc_compact_basic_defconfig
- stm32mp15_dhcor_testbench_basic_defconfig

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig          | 1 +
 configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig         | 1 +
 configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig | 1 +
 configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig     | 1 +
 configs/stm32mp15_basic_defconfig                           | 1 +
 configs/stm32mp15_dhsom.config                              | 1 +
 drivers/watchdog/Kconfig                                    | 1 +
 7 files changed, 7 insertions(+)

diff --git a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
index fc095ac0de1..4c371c17334 100644
--- a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
+++ b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
@@ -88,6 +88,7 @@ CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
 CONFIG_SYSRESET_SYSCON=y
+CONFIG_WATCHDOG_AUTOSTART=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 # CONFIG_BINMAN_FDT is not set
diff --git a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
index b243c45d690..7463eb5c95d 100644
--- a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
+++ b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
@@ -88,6 +88,7 @@ CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
 CONFIG_SYSRESET_SYSCON=y
+CONFIG_WATCHDOG_AUTOSTART=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 # CONFIG_BINMAN_FDT is not set
diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
index e635c726459..e9f5bd32721 100644
--- a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
+++ b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
@@ -88,6 +88,7 @@ CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
 CONFIG_SYSRESET_SYSCON=y
+CONFIG_WATCHDOG_AUTOSTART=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 # CONFIG_BINMAN_FDT is not set
diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
index 9e7849ff8f0..aefb78935b0 100644
--- a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
+++ b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
@@ -88,6 +88,7 @@ CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
 CONFIG_SYSRESET_SYSCON=y
+CONFIG_WATCHDOG_AUTOSTART=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 # CONFIG_BINMAN_FDT is not set
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index e3090ec2a50..241c9402560 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -191,6 +191,7 @@ CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_BMP_16BPP=y
 CONFIG_BMP_24BPP=y
 CONFIG_BMP_32BPP=y
+CONFIG_WATCHDOG_AUTOSTART=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 # CONFIG_BINMAN_FDT is not set
diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
index c84116482f6..565b49584e3 100644
--- a/configs/stm32mp15_dhsom.config
+++ b/configs/stm32mp15_dhsom.config
@@ -76,3 +76,4 @@ CONFIG_PREBOOT="run dh_preboot"
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
 CONFIG_TARGET_DH_STM32MP1_PDK2=y
 CONFIG_USE_SERVERIP=y
+CONFIG_WATCHDOG_AUTOSTART=y
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 1bb67f50352..510330be8a5 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -15,6 +15,7 @@ config WATCHDOG_AUTOSTART
 	bool "Automatically start watchdog timer"
 	depends on WDT
 	default n if ARCH_SUNXI
+	default n if ARCH_STM32MP
 	default y
 	help
 	  Automatically start watchdog timer and start servicing it during
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
