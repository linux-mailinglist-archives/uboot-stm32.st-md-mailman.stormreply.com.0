Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0813937E
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 15:17:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4390C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 14:17:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AC44C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 14:17:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DECWPJ022444; Mon, 13 Jan 2020 15:17:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=62wuVguGEmr3Sa5ffyaLWGhM3sy+bG9A0dPk3F62zWA=;
 b=qHKcXSc7wJEnXqMdw7DwqHYh/9qsKF+z32Q3jFXerP1qONf5btYw3lbzR5nld14Gf5dn
 sHUbJgziY5u+EXn50E6E9cLAUU5XiBc2uPplOQUqja4SMDrQYdxRYZXZEIVn/OokdVPB
 2KyFuECuMdKdBCfcBJJE21CMBVixAtCOzBPxJ+s0QI21kat0lZAs6ihCYesAMfisNxyM
 tmTiz+kTyWk3sZ/fqZjQmtkAYDNLfi3VJZijoB6evo0DEOr7LH4BbOiRohzja5WhvtXS
 XAEoMKeAbvneOtMGGKpxhaG4H4nv33C2wVgzyJXwwJxiuNFKHFzlGwQKRASunYFze1yq Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf78s0ffy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 15:17:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED13310002A;
 Mon, 13 Jan 2020 15:17:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5D082BE22F;
 Mon, 13 Jan 2020 15:17:47 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 15:17:47 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 15:17:41 +0100
Message-ID: <20200113141742.28182-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113141742.28182-1-patrick.delaunay@st.com>
References: <20200113141742.28182-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_04:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/3] board: stm32mp1: move CONFIG_ENV_XXX in
	defconfig
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

Move CONFIG_ENV_SECT_SIZE and CONFIG_ENV_OFFSET in stm32mp15_*_defconfig
for ST board with NOR support (STM32MP15xx-EV1 boards)
- CONFIG_SECT_SIZE values = the max supported NOR erase size (256KB)
- CONFIG_ENV_OFFSET = offset for NOR (ENV_IS_IN_SPI_FLASH)

This Patch prepares the U-Boot support of boards with STM32MP15x SOC
not provided by STMicroelectronics.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/Kconfig           | 6 ------
 configs/stm32mp15_basic_defconfig   | 2 ++
 configs/stm32mp15_optee_defconfig   | 2 ++
 configs/stm32mp15_trusted_defconfig | 2 ++
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
index 9f985e5775..89fc562746 100644
--- a/board/st/stm32mp1/Kconfig
+++ b/board/st/stm32mp1/Kconfig
@@ -9,12 +9,6 @@ config SYS_VENDOR
 config SYS_CONFIG_NAME
 	default "stm32mp1"
 
-config ENV_SECT_SIZE
-	default 0x40000 if ENV_IS_IN_SPI_FLASH
-
-config ENV_OFFSET
-	default 0x280000 if ENV_IS_IN_SPI_FLASH
-
 config TARGET_STM32MP157C_DK2
 	bool "support of STMicroelectronics STM32MP157C-DK2 Discovery Board"
 	default y
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 713a7e6c57..8f0c7e9339 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_ARCH_STM32MP=y
 CONFIG_SYS_MALLOC_F_LEN=0x3000
+CONFIG_ENV_SECT_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x280000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_TARGET_STM32MP1=y
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
index f9161fd7d1..b036bb738b 100644
--- a/configs/stm32mp15_optee_defconfig
+++ b/configs/stm32mp15_optee_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_ARCH_STM32MP=y
 CONFIG_SYS_MALLOC_F_LEN=0x3000
+CONFIG_ENV_SECT_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x280000
 CONFIG_TARGET_STM32MP1=y
 CONFIG_STM32MP1_OPTEE=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index a5ea528ae3..956ba90153 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_ARCH_STM32MP=y
 CONFIG_SYS_MALLOC_F_LEN=0x3000
+CONFIG_ENV_SECT_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x280000
 CONFIG_TARGET_STM32MP1=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
