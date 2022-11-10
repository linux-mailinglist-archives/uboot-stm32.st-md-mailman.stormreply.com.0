Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCE0624043
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Nov 2022 11:49:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE186C6505A;
	Thu, 10 Nov 2022 10:49:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 577CCC65051
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 10:49:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AA9DrJg006458; Thu, 10 Nov 2022 11:49:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=hUaC6Grct8CuH9PI7AHz3uZpPBZ/3TJfg50HmA8iiZI=;
 b=a4jrU/c0LNakZGv9CrqJBu41tX9YnrKzQpdpuKwVoTBF8uOneihxXvm92fFhtUG73LPP
 vDC/Ogv8Fy1nUwczsMCx55PsdCjl7if1FF4PmFvT8+WNcRgAI9KJQrVSFGckTLRAcMw5
 rPVrx4/xoxJ/umwPXoPQ6QceMnfS8gAUxTzYstf4G15EL38GJqBO4XFUiUsF0VdE+GhH
 bmbrHu3YyFvF6QDMO9Z5O3LtWmut9PKzW06Ld2/3NqsY92JCdvvZKtQZZs7h6crlJFsu
 0YuQkbSFHcGePnCaxrP76g8pBnxHNXC2t5yMONLNRquDfb94ewlpHdfmKbkZ5NkLFKXM Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3krxfu8xcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 11:49:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4974610003E;
 Thu, 10 Nov 2022 11:49:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 430CF218622;
 Thu, 10 Nov 2022 11:49:17 +0100 (CET)
Received: from localhost (10.252.15.206) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 10 Nov
 2022 11:49:17 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 10 Nov 2022 11:49:01 +0100
Message-ID: <20221110114828.4.Iaf11290be4bdcf09642f485beb2a77fbde4eaa17@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
References: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.206]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_08,2022-11-09_01,2022-06-22_01
Cc: Peng Fan <peng.fan@nxp.com>, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 4/8] env: mmc: add CONFIG_ENV_MMC_USE_DT
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

Add a new config CONFIG_ENV_MMC_USE_DT to force configuration of the
U-Boot environment offset with device tree config node.

This patch avoids issues when several CONFIG_ENV_IS_IN_XXX are activated,
the defconfig file uses the same value for CONFIG_ENV_OFFSET or
CONFIG_ENV_OFFSET_REDUND for the several ENV backends (SPI_FLASH, EEPROM
NAND, SATA, MMC).

After this patch a bad offset value is not possible when the selected
partition in device tree is not found.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 env/Kconfig | 16 ++++++++++++++++
 env/mmc.c   |  7 +++++++
 2 files changed, 23 insertions(+)

diff --git a/env/Kconfig b/env/Kconfig
index 24111dfaf47b..f8ee99052b97 100644
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -242,6 +242,13 @@ config ENV_IS_IN_MMC
 	  This value is also in units of bytes, but must also be aligned to
 	  an MMC sector boundary.
 
+	  CONFIG_ENV_MMC_USE_DT (optional):
+
+	  These define forces the configuration by the config node in device
+	  tree with partition name: "u-boot,mmc-env-partition" or with
+	  offset: "u-boot,mmc-env-offset", "u-boot,mmc-env-offset-redundant".
+	  CONFIG_ENV_OFFSET and CONFIG_ENV_OFFSET_REDUND are not used.
+
 config ENV_IS_IN_NAND
 	bool "Environment in a NAND device"
 	depends on !CHAIN_OF_TRUST
@@ -650,6 +657,15 @@ config SYS_MMC_ENV_PART
 	  partition 0 or the first boot partition, which is 1 or some other defined
 	  partition.
 
+config ENV_MMC_USE_DT
+	bool "Read partition name and offset in DT"
+	depends on ENV_IS_IN_MMC && OF_CONTROL
+	help
+	  Only use the device tree to get the environment location in MMC
+	  device, with partition name or with offset.
+	  The 2 defines CONFIG_ENV_OFFSET, CONFIG_ENV_OFFSET_REDUND
+	  are not used as fallback.
+
 config USE_DEFAULT_ENV_FILE
 	bool "Create default environment from file"
 	help
diff --git a/env/mmc.c b/env/mmc.c
index 661a268ea07d..1894b6483220 100644
--- a/env/mmc.c
+++ b/env/mmc.c
@@ -26,6 +26,12 @@
 
 #define ENV_MMC_INVALID_OFFSET ((s64)-1)
 
+#if defined(CONFIG_ENV_MMC_USE_DT)
+/* ENV offset is invalid when not defined in Device Tree */
+#define ENV_MMC_OFFSET		ENV_MMC_INVALID_OFFSET
+#define ENV_MMC_OFFSET_REDUND	ENV_MMC_INVALID_OFFSET
+
+#else
 /* Default ENV offset when not defined in Device Tree */
 #define ENV_MMC_OFFSET		CONFIG_ENV_OFFSET
 
@@ -34,6 +40,7 @@
 #else
 #define ENV_MMC_OFFSET_REDUND	ENV_MMC_INVALID_OFFSET
 #endif
+#endif
 
 DECLARE_GLOBAL_DATA_PTR;
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
