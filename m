Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C14748A3
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Dec 2021 17:57:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 018E0C5E2C1;
	Tue, 14 Dec 2021 16:57:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C7F2C597BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 16:57:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BEFQHGw018611;
 Tue, 14 Dec 2021 17:57:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=zQh/EN0K8TGepKyIkcD6L+R3bFIgBGampCM88tlqzyI=;
 b=qc/xMSR+XerKZbXlelXtrUSKlsxNOyXbArZ30JFKhQR++egNBmgLvqtMLCibh9w830Ut
 /EQ2G4I3H9pRTERpf2xjCU5W2OYCOc0kI2AiQGq6c+CQhXKzrmGhcGQdhMdtIAEMrTJO
 nofurDJGu+VaHyHiE9650eHY/HUYjdcvkUdD4vkzVsbiQAes7YYbY9sPyLKm8/DeOUs4
 H+IZTVXSNwyN/jRecr0X4vqIZwtjpenQBWKjIRbGlbqKP0EyJK1Xcekq09yNntGuaYum
 4SGKDjjEPV7/ttyBImBdVqpGd83t5eSKQbmlYbbAm1hVJxqM+7E/ldhhb/osoAjsVn8x xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cxk4hnbn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 17:57:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6453610003B;
 Tue, 14 Dec 2021 17:57:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5828620A08B;
 Tue, 14 Dec 2021 17:57:11 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 14 Dec 2021 17:57:10
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 14 Dec 2021 17:57:04 +0100
Message-ID: <20211214175652.RFC.5.I5fc8065d06afb12c358588f9078ba15b1cbbe94c@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
References: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_07,2021-12-14_01,2021-12-02_01
Cc: Marek Vasut <marex@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 egnite GmbH <info@egnite.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [RFC PATCH 5/5] Convert CONFIG_AT91_EFLASH to Kconfig
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

This converts the following to Kconfig:
   CONFIG_AT91_EFLASH

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-at91/Kconfig   | 8 ++++++++
 configs/ethernut5_defconfig  | 2 +-
 include/configs/ethernut5.h  | 1 -
 scripts/config_whitelist.txt | 1 -
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 4448ca1592..5267a7d15d 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -302,6 +302,14 @@ config ATMEL_SFR
 config SYS_SOC
 	default "at91"
 
+config AT91_EFLASH
+	bool "Support AT91 flash driver"
+	depends on AT91SAM9XE
+	select USE_SYS_MAX_FLASH_BANKS
+	help
+	  Enable the driver for the enhanced embedded flash in the Atmel
+	  AT91SAM9XE devices.
+
 source "board/atmel/at91sam9260ek/Kconfig"
 source "board/atmel/at91sam9261ek/Kconfig"
 source "board/atmel/at91sam9263ek/Kconfig"
diff --git a/configs/ethernut5_defconfig b/configs/ethernut5_defconfig
index 0da0b8b844..71e11af6f9 100644
--- a/configs/ethernut5_defconfig
+++ b/configs/ethernut5_defconfig
@@ -4,6 +4,7 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_ARCH_AT91=y
 CONFIG_SYS_TEXT_BASE=0x27000000
 CONFIG_SYS_MALLOC_LEN=0x121000
+CONFIG_AT91_EFLASH=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_ETHERNUT5=y
 CONFIG_NR_DRAM_BANKS=1
@@ -64,7 +65,6 @@ CONFIG_SYS_I2C_SOFT=y
 CONFIG_SYS_I2C_SOFT_SLAVE=0
 CONFIG_MTD=y
 CONFIG_MTD_NOR_FLASH=y
-CONFIG_USE_SYS_MAX_FLASH_BANKS=y
 CONFIG_MTD_RAW_NAND=y
 # CONFIG_SYS_NAND_USE_FLASH_BBT is not set
 CONFIG_NAND_ATMEL=y
diff --git a/include/configs/ethernut5.h b/include/configs/ethernut5.h
index 91b2599851..86bd0c576b 100644
--- a/include/configs/ethernut5.h
+++ b/include/configs/ethernut5.h
@@ -33,7 +33,6 @@
 
 /* 512kB on-chip NOR flash */
 # define CONFIG_SYS_FLASH_BASE		0x00200000 /* AT91SAM9XE_FLASH_BASE */
-# define CONFIG_AT91_EFLASH
 # define CONFIG_SYS_MAX_FLASH_SECT	32
 # define CONFIG_EFLASH_PROTSECTORS	1
 
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index c9877b16ca..ea0bd39f41 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -37,7 +37,6 @@ CONFIG_AT91SAM9G45EKES
 CONFIG_AT91SAM9G45_LCD_BASE
 CONFIG_AT91SAM9M10G45EK
 CONFIG_AT91_CAN
-CONFIG_AT91_EFLASH
 CONFIG_AT91_GPIO_PULLUP
 CONFIG_AT91_LED
 CONFIG_AT91_WANTS_COMMON_PHY
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
