Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6F169FBE8
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Feb 2023 20:20:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35AF8C65E58;
	Wed, 22 Feb 2023 19:20:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C869C65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 19:20:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31MFjGnd006481; Wed, 22 Feb 2023 20:20:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=6TbJbmvEB+ba3lmvxEgkOTlw6qQ+dhu/3GtH1aA1Efk=;
 b=0ZRllHeifHKkurnFZTxT5NIXzZnfrYJzX/whpo39raSst7WJgVkoXPBACQ3PtosZHB27
 ignn+taMkxhsMhd8Va+fgQcPdsBOFJyPGbH/0t19RZkfEGANqElw6CNPb8guJ5cxZITv
 6eb93ByhEOYArXRGsHHcyKjCNL5IibW4ypf3hOkLiYISTDikglfIMvcUT13gYS7ChtTC
 wkEHXF+gIZ5GE0b/cl1rCsdxsqStA40ZTJY3yg5r8ucVQD7h9e/7Q43V4OEC4EgCfySg
 9k2eimw4FmDeg+t1YRYBYc6q/qvf0cbmLj07yLJlPazSFxcuufth6wDqzDsqts4bYYyT BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nwhq2jqw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Feb 2023 20:20:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA8CA100034;
 Wed, 22 Feb 2023 20:20:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2E4C22A6F8;
 Wed, 22 Feb 2023 20:20:11 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 22 Feb
 2023 20:20:10 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Feb 2023 20:19:59 +0100
Message-ID: <20230222201943.2.I26822655244f3aba21fc3a62832a901a9445a8be@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230222201943.1.I901beb8819b481b6a9b55b2c00768225e5e12649@changeid>
References: <20230222201943.1.I901beb8819b481b6a9b55b2c00768225e5e12649@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_08,2023-02-22_02,2023-02-09_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/2] mmc: remove SDHCI SPEAR
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

As the file spear_sdhci.c file is already removed, delete the associated
configuration CONFIG_MMC_SDHCI_SPEAR.

Fixes: c942fc925e7dab ("mmc: spear: remove the entire spear_sdhci.c file")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/mmc/Kconfig  | 12 ------------
 drivers/mmc/Makefile |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/mmc/Kconfig b/drivers/mmc/Kconfig
index 878f867c627b..80641e139305 100644
--- a/drivers/mmc/Kconfig
+++ b/drivers/mmc/Kconfig
@@ -667,18 +667,6 @@ config MMC_SDHCI_S5P
 
 	  If unsure, say N.
 
-config MMC_SDHCI_SPEAR
-	bool "SDHCI support on ST SPEAr platform"
-	depends on MMC_SDHCI
-	help
-	  This selects the Secure Digital Host Controller Interface (SDHCI)
-	  often referrered to as the HSMMC block in some of the ST SPEAR range
-	  of SoC
-
-	  If you have a controller with this interface, say Y here.
-
-	  If unsure, say N.
-
 config MMC_SDHCI_STI
 	bool "SDHCI support for STMicroelectronics SoC"
 	depends on MMC_SDHCI && OF_CONTROL
diff --git a/drivers/mmc/Makefile b/drivers/mmc/Makefile
index 3dc757108d5a..2c65c4765ab2 100644
--- a/drivers/mmc/Makefile
+++ b/drivers/mmc/Makefile
@@ -70,7 +70,6 @@ obj-$(CONFIG_MMC_SDHCI_NPCM)            += npcm_sdhci.o
 obj-$(CONFIG_MMC_SDHCI_PIC32)		+= pic32_sdhci.o
 obj-$(CONFIG_MMC_SDHCI_ROCKCHIP)	+= rockchip_sdhci.o
 obj-$(CONFIG_MMC_SDHCI_S5P)		+= s5p_sdhci.o
-obj-$(CONFIG_MMC_SDHCI_SPEAR)		+= spear_sdhci.o
 obj-$(CONFIG_MMC_SDHCI_STI)		+= sti_sdhci.o
 obj-$(CONFIG_MMC_SDHCI_TANGIER)		+= tangier_sdhci.o
 obj-$(CONFIG_MMC_SDHCI_TEGRA)		+= tegra_mmc.o
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
