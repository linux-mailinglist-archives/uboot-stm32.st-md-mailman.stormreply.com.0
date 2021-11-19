Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A16F456C20
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Nov 2021 10:08:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2633DC5E2CC;
	Fri, 19 Nov 2021 09:08:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2C35C5C82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 09:08:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJ97MDC009674;
 Fri, 19 Nov 2021 10:07:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=7H9Y2oD9czWzDgs1B259HT3oDSMNGwRA7cHo6Wx81KU=;
 b=Bu3LuW0Kcq+ZMMu00uk0B0z5U5ucWlyEqo7Hx1ZaRtEz1EvVvmSm+1qJ1ZwI6v5a9tKR
 QFiFIRq1DCdn+2Z2ZRHbkNwSnNvAs08tX2bkDD2zv6deY9wCTACSyQoOWlQ+1440gyfa
 d4Z62Tmf51+qMqPXGr5vArk3oh44rsLE++8FVLFEVTUu43YjlCS06aRztQy1IGMqX8bZ
 YMi1gpmDg1HrJ/KpnlZEV50uYdQoc64FnB+uH7Y428Vz/Rkor5uHy/3TWNbx3gKEtiHJ
 XR4fzS5h5LVreoZuvxi1Mz1rhmnEtk30VZjBHj+0ltPHze/mHSz/MoXIsS/1rXBiGoaP vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ce910r036-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 10:07:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DAF5F10002A;
 Fri, 19 Nov 2021 10:07:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE2DB21BF53;
 Fri, 19 Nov 2021 10:07:40 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 19 Nov 2021 10:07:40
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Nov 2021 10:07:32 +0100
Message-ID: <20211119100728.1.I8482c13fb850207cc6b028072073f7f84ce1488c@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_08,2021-11-17_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, u-boot@dh-electronics.com,
 Matteo Lisi <matteo.lisi@engicam.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp15: deactivate the
	CONFIG_STM32_IPCC
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

The IPCC mailbox is only used for communication with M4 firmware but
it is not used in the stm32 remoteproc driver; it was planed but the
support of this mailbox in remoteproc for STM32MP15x is dropped.

So the associated drivers and config CONFIG_STM32_IPCC can be
deactivated to reduce the U-Boot size; the CONFIG_DM_MAILBOX can be
also deactivated as the mailbox UCLASS is no more used.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig          | 2 --
 configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig         | 2 --
 configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig | 2 --
 configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig     | 2 --
 configs/stm32mp15_basic_defconfig                           | 2 --
 configs/stm32mp15_defconfig                                 | 2 --
 configs/stm32mp15_dhcom_basic_defconfig                     | 2 --
 configs/stm32mp15_dhcor_basic_defconfig                     | 2 --
 configs/stm32mp15_trusted_defconfig                         | 2 --
 9 files changed, 18 deletions(-)

diff --git a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
index adb8f10b17..11a2885a5c 100644
--- a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
+++ b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
@@ -51,8 +51,6 @@ CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
-CONFIG_DM_MAILBOX=y
-CONFIG_STM32_IPCC=y
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
diff --git a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
index dca35db014..7973e0f46f 100644
--- a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
+++ b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
@@ -51,8 +51,6 @@ CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
-CONFIG_DM_MAILBOX=y
-CONFIG_STM32_IPCC=y
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
index aa6a28e6a7..5eadd63100 100644
--- a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
+++ b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
@@ -51,8 +51,6 @@ CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
-CONFIG_DM_MAILBOX=y
-CONFIG_STM32_IPCC=y
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
index 9abd1a100c..1dde46a0ce 100644
--- a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
+++ b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
@@ -51,8 +51,6 @@ CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
-CONFIG_DM_MAILBOX=y
-CONFIG_STM32_IPCC=y
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 2cc26d4066..055336c266 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -102,8 +102,6 @@ CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
-CONFIG_DM_MAILBOX=y
-CONFIG_STM32_IPCC=y
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 4c6a52fc54..d5bb4b27c2 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -84,8 +84,6 @@ CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
-CONFIG_DM_MAILBOX=y
-CONFIG_STM32_IPCC=y
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index 84375589c5..8fbcef2699 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -96,8 +96,6 @@ CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
-CONFIG_DM_MAILBOX=y
-CONFIG_STM32_IPCC=y
 CONFIG_I2C_EEPROM=y
 CONFIG_SYS_I2C_EEPROM_ADDR=0x50
 CONFIG_SUPPORT_EMMC_BOOT=y
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index aa000effc4..c551a4c411 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -92,8 +92,6 @@ CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
-CONFIG_DM_MAILBOX=y
-CONFIG_STM32_IPCC=y
 CONFIG_I2C_EEPROM=y
 CONFIG_SYS_I2C_EEPROM_ADDR=0x53
 CONFIG_SUPPORT_EMMC_BOOT=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index feca26e973..c0ac1ef319 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -85,8 +85,6 @@ CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
-CONFIG_DM_MAILBOX=y
-CONFIG_STM32_IPCC=y
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
