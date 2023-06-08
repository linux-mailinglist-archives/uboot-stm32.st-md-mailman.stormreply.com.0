Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DF0728393
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jun 2023 17:19:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC477C6A5FA;
	Thu,  8 Jun 2023 15:19:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B85CDC6A5E7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 15:19:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358EAZhn030123; Thu, 8 Jun 2023 17:19:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=+zjFwBApUcDAT5AFDNCFO/pvfnozLbsOHk0NsKJF51Q=;
 b=36SM9uWyqsKq5a05yOF3Zov8K77OmIuYlF7Slb1s22EcTmrXrkKyiFyeJqPY7RvyU1hP
 yYzxfGMgvMAO1VTy2xYk0OaPAVngzHDecRqr8cT2X5CaRGrJ+J8uIVpUDN6kgRamIPz9
 9BjMeYdsgnkGQlrFVF3SFGBOoz+wp8YE/poLicSVCKf+m5ikkHJqeGZ0WaE0aXeg8nJG
 63MI9l1K8khTFSucUwD3CmsNvEWgpq8o9i3Z5f1b0ElKYob+3o8XfI9n7jVfg/DXbIlo
 I8ExOeNpU0d8KeEvjq8+y+SgnnjCghWmwSC0ayD0wGnrKjOE08M4cO8qMEvSscygz1gn nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3ggygedp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 17:19:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 160E810003A;
 Thu,  8 Jun 2023 17:19:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D5D321BF4D;
 Thu,  8 Jun 2023 17:19:03 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 17:19:02 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jun 2023 17:16:47 +0200
Message-ID: <20230608171614.11.I05a3701d3d8a274af29439ce26900177bfbd8767@changeid>
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
Subject: [Uboot-stm32] [PATCH 11/12] configs: stm32mp1: disable CMD_MTDPARTS
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

Disable CMD_MTDPARTS as it's no more needed and it is strongly
encouraged to avoid using this command anymore.
(see comments in ./cmd/Kconfig:2422).

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp13_defconfig         | 1 -
 configs/stm32mp15_basic_defconfig   | 1 -
 configs/stm32mp15_defconfig         | 1 -
 configs/stm32mp15_trusted_defconfig | 1 -
 4 files changed, 4 deletions(-)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index a9cc7e4d0353..5e9abc5e2625 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -39,7 +39,6 @@ CONFIG_CMD_RNG=y
 CONFIG_CMD_TIMER=y
 CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_EXT4_WRITE=y
-CONFIG_CMD_MTDPARTS=y
 CONFIG_CMD_LOG=y
 CONFIG_CMD_UBI=y
 CONFIG_OF_LIVE=y
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 7661159110e5..94f4dbd4c32b 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -75,7 +75,6 @@ CONFIG_CMD_TIMER=y
 CONFIG_CMD_PMIC=y
 CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_EXT4_WRITE=y
-CONFIG_CMD_MTDPARTS=y
 CONFIG_CMD_LOG=y
 CONFIG_CMD_UBI=y
 # CONFIG_SPL_DOS_PARTITION is not set
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 1ff9f73730d3..37b6d4a7b4ac 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -51,7 +51,6 @@ CONFIG_CMD_TIMER=y
 CONFIG_CMD_PMIC=y
 CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_EXT4_WRITE=y
-CONFIG_CMD_MTDPARTS=y
 CONFIG_CMD_LOG=y
 CONFIG_CMD_UBI=y
 CONFIG_OF_LIVE=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index e7bf2e171ace..9c5446d6d4a2 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -52,7 +52,6 @@ CONFIG_CMD_TIMER=y
 CONFIG_CMD_PMIC=y
 CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_EXT4_WRITE=y
-CONFIG_CMD_MTDPARTS=y
 CONFIG_CMD_LOG=y
 CONFIG_CMD_UBI=y
 CONFIG_OF_LIVE=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
