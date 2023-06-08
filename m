Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C10AC728386
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jun 2023 17:18:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BB85C6A5FA;
	Thu,  8 Jun 2023 15:18:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF963C65E70
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 15:18:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358Dj5L6007671; Thu, 8 Jun 2023 17:18:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=olUVwsnPsno49W65CpWTMgTE93iQ31OBghm6c27gucA=;
 b=Pma9GFiEgDU1hQ3vNHyjlp4vI7khqq/sQ0GBQ8HwTqLvrAaki7NIjDhcjcQWexOL2Dlj
 n+zK1LF5J6zB81egwwc6vcTmVTKNuskCiM4U5JRqBrUkVHSVQH2lz1g3FVaeHxTYi0Wj
 voYAZ1LhmicSnWeR+ZWWRnZI+k9mFcTFKwidibSnNC+V5n2yWcm29TZEjp32MbnKdhMp
 c2jlOuC99CniH2PaeMyFlxqMhCJ0j8UnAwsfe094pWN0+mXHH3q0srl+ElU23Z3EjLrn
 fdQIzXScq/nc5gdmGNeZnaFjqv9LYSL4kYaTe2P0TDVfv3vP/kxPYIhVXK5Q1VnzuUHT rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3cax2aut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 17:18:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53CCC10002A;
 Thu,  8 Jun 2023 17:17:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E13121B507;
 Thu,  8 Jun 2023 17:17:59 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 17:17:59 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jun 2023 17:16:43 +0200
Message-ID: <20230608171614.7.I26c6ed678ca158380032e3a31fc6b3a77ef6a33f@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_11,2023-06-08_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 07/12] configs: stm32mp: Disable
	SYS_MTDPARTS_RUNTIME for stm32mp15 and stm32mp13
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

As we don't use anymore MTDPARTS_xx Kconfig variables
(MTDPARTS_NAND0_BOOT, MTDPARTS_NOR0_BOOT...),
disable SYS_MTDPARTS_RUNTIME.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp13_defconfig         | 1 -
 configs/stm32mp15_basic_defconfig   | 1 -
 configs/stm32mp15_defconfig         | 1 -
 configs/stm32mp15_trusted_defconfig | 1 -
 4 files changed, 4 deletions(-)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index b076573c450f..02a29cd9f03a 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -59,7 +59,6 @@ CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
 CONFIG_DM_MTD=y
-CONFIG_SYS_MTDPARTS_RUNTIME=y
 CONFIG_PINCONF=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 13355ebb4692..273b72fdaf0a 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -125,7 +125,6 @@ CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
 CONFIG_DM_MTD=y
-CONFIG_SYS_MTDPARTS_RUNTIME=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_STM32_FMC2=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index bad5c32ef808..b1f0f2f7c784 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -98,7 +98,6 @@ CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
 CONFIG_DM_MTD=y
-CONFIG_SYS_MTDPARTS_RUNTIME=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_STM32_FMC2=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 5f0fb4565105..bcfd60e5a85a 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -99,7 +99,6 @@ CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
 CONFIG_DM_MTD=y
-CONFIG_SYS_MTDPARTS_RUNTIME=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_STM32_FMC2=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
