Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB4955140C
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jun 2022 11:18:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04DB6C5EC76;
	Mon, 20 Jun 2022 09:18:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F3A0C5EC56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 09:18:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K8cKif006942;
 Mon, 20 Jun 2022 11:18:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=3YlObci6ZCe35jsKLko7ruJ3JR4ZA1XgR8oUoTzyusI=;
 b=oloDhUa0MTcYF2HjEtwegeDTJA1/saLK+sh/TgQX9ZyfyKYFikvAQaDXTY8tIR/ufIxq
 k9ubCBC64xPB5BIgqsdN3e+gYBByjEW2mvsut2/3RCrJtD5sNj40vx2ihS8RnTKdC2Vv
 HEgtVr8Bx/l4ZLhSX9TSZ4lv8ZhBhpkAbnL2fFgBqaSmyHhdVd6GMSyjVubj+IKnw1Qj
 st52BAwvP7dGr1odvhIhczeMOD2gBii/fVulGdPSi5uSSTM2PXZ7IwMtySFKn29avrgM
 GNYPv+XnBxJCQolKpbh+BFSHafoNM1uXQgQU40Ik/Wc1N6YKNzZo/D4ZH0sWXONgCyqs Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gtnj9rpk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 11:18:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 22EBF10002A;
 Mon, 20 Jun 2022 11:18:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1EB232171FB;
 Mon, 20 Jun 2022 11:18:32 +0200 (CEST)
Received: from localhost (10.75.127.116) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 11:18:31 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Jun 2022 11:17:13 +0200
Message-ID: <20220620111707.10.Ib030c4ab9d5c65698a8194766fb53406e909122e@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620111707.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
References: <20220620111707.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 10/10] configs: stm32mp13: activate some
	command
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

Activate useful commands in STM32MP13x config, already activated in
stm32mp15_defconfig.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp13_defconfig | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index f58c73b7c79..f94798a9ff8 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -20,17 +20,25 @@ CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_SYS_PROMPT="STM32MP> "
 CONFIG_CMD_ADTIMG=y
 CONFIG_CMD_ERASEENV=y
+CONFIG_CMD_NVEDIT_EFI=y
 CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_UNZIP=y
 CONFIG_CMD_CLK=y
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
+CONFIG_CMD_LSBLK=y
 CONFIG_CMD_MMC=y
 CONFIG_CMD_CACHE=y
+CONFIG_CMD_EFIDEBUG=y
 CONFIG_CMD_TIME=y
 CONFIG_CMD_RNG=y
 CONFIG_CMD_TIMER=y
+CONFIG_CMD_REGULATOR=y
+CONFIG_CMD_EXT4_WRITE=y
+CONFIG_CMD_MTDPARTS=y
 CONFIG_CMD_LOG=y
+CONFIG_CMD_UBI=y
 CONFIG_OF_LIVE=y
 CONFIG_ENV_IS_NOWHERE=y
 CONFIG_ENV_IS_IN_MMC=y
@@ -38,9 +46,16 @@ CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_SYS_MMC_ENV_DEV=-1
 CONFIG_CLK_SCMI=y
+CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
+CONFIG_LED=y
+CONFIG_LED_GPIO=y
+CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
+CONFIG_MTD=y
+CONFIG_DM_MTD=y
+CONFIG_SYS_MTDPARTS_RUNTIME=y
 CONFIG_DM_ETH=y
 CONFIG_PINCONF=y
 CONFIG_DM_REGULATOR=y
@@ -58,6 +73,7 @@ CONFIG_TEE=y
 CONFIG_OPTEE=y
 # CONFIG_OPTEE_TA_AVB is not set
 CONFIG_ERRNO_STR=y
+CONFIG_FDT_FIXUP_PARTITIONS=y
 # CONFIG_LMB_USE_MAX_REGIONS is not set
 CONFIG_LMB_MEMORY_REGIONS=2
 CONFIG_LMB_RESERVED_REGIONS=16
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
