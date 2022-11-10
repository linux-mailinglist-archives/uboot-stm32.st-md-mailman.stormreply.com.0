Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A6B62404F
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Nov 2022 11:50:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E43DBC65055;
	Thu, 10 Nov 2022 10:50:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCF99C65051
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 10:50:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AAAlnit004944; Thu, 10 Nov 2022 11:50:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=TqDzaiSwXv8hFenkgFs6aGNZWYr9xNeg+H93/Ez0wog=;
 b=v/D9sOf62P9ppZSpYRz8TAiCRGVknkWC6DmZjnr7rM1ZCRUSzSafNiXzMdcVL8nhno5c
 gJHYJjjLvOFPXL50iBHkdj7gwA7QRkJ3Zc3+n7qBVvy+HCcrWjKmskvk4UiXL9rquv/L
 tcVoukKH6xl4EnK3TuSySmhplwlb8bu9iM2GU45vKzmwTiENQ1ez5dXoD+Jdg4neTJMX
 uWFlmBnrzRxR5/60dPIIIpX9JY1VzvNKMwojOq2vPf8X66RLL7NHRvTtN5J8QsY+0dGu
 mqTmhoxpTkZh/rbTVAVjEczVjSK3Tnk1BLKyQYE5GQD5+OvIvy43EI08OaF4xQ9GsJsV YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kryv4g0pa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 11:50:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5CFC10003E;
 Thu, 10 Nov 2022 11:50:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0D82218625;
 Thu, 10 Nov 2022 11:50:20 +0100 (CET)
Received: from localhost (10.252.15.206) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 10 Nov
 2022 11:50:17 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 10 Nov 2022 11:49:02 +0100
Message-ID: <20221110114828.5.Ic76d234844d7f990415f7286b9b971c59ec8b35a@changeid>
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
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 5/8] configs: stm32mp: activate
	CONFIG_ENV_MMC_USE_DT
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

Activate by default CONFIG_ENV_MMC_USE_DT as "u-boot,mmc-env-partition"
should be always use in STMicroelectronics boards device tree to locate
the environment for mmc backend. The 2 defines:
  CONFIG_ENV_OFFSET=0x280000
  CONFIG_ENV_OFFSET_REDUND=0x2C0000
are only valid for spi-nor and not for SD-Card or eMMC.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp13_defconfig         | 1 +
 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_defconfig         | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index af6b1839d039..4cab07647349 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -46,6 +46,7 @@ CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_SYS_MMC_ENV_DEV=-1
+CONFIG_ENV_MMC_USE_DT=y
 CONFIG_CLK_SCMI=y
 CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 86ebbef0a6c8..4a96ad22bcc8 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -91,6 +91,7 @@ CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_SYS_MMC_ENV_DEV=-1
+CONFIG_ENV_MMC_USE_DT=y
 # CONFIG_SPL_ENV_IS_NOWHERE is not set
 # CONFIG_SPL_ENV_IS_IN_SPI_FLASH is not set
 CONFIG_TFTP_TSIZE=y
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index caa79e68834f..151981849de9 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -65,6 +65,7 @@ CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_SYS_MMC_ENV_DEV=-1
+CONFIG_ENV_MMC_USE_DT=y
 CONFIG_TFTP_TSIZE=y
 CONFIG_STM32_ADC=y
 CONFIG_CLK_SCMI=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 3309c2e79246..098eedc9b727 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -66,6 +66,7 @@ CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_SYS_MMC_ENV_DEV=-1
+CONFIG_ENV_MMC_USE_DT=y
 CONFIG_TFTP_TSIZE=y
 CONFIG_STM32_ADC=y
 CONFIG_CLK_SCMI=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
