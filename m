Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2ED18B129
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 11:21:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5A69C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 10:21:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85C13C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 10:21:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02JA95gH028187; Thu, 19 Mar 2020 11:21:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=EJ380NBEK2vvbbm7BVFQ+q0x3W33fMvO6Lnbnw2D2Cs=;
 b=tCWBQjUgLsSqaz21RuKsFSF499cqpJNy420WIK+sUfGdeVimdJlaj2VRs4bIKZ4g9rq6
 YGKKTr+VnmIElZZNtmuVCDFf3UG2gXn+F7YTmzioTs7NKxyxWDHF54pFxLR/ztSDGkAi
 PTnAMOO7YeSDcJCg9vSGvXlyY3Et0F3s0KdpvZkahQOj+iYKubQJZ0GvcAYegdHf0due
 bbaIDd8ZWQ5c47xSuqdQPSyDGSEIx6MbGYIolxV1YNAAhn6/7YDfTvWpDUeZJP6U//wM
 dlOCZ555nl0/h8/b9SGtmTMjWiTvIQm7+bFMmTvrZljKZcdeLKZgGu71ArBd+ZgauMVI Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95ury3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 11:21:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 553E110003A;
 Thu, 19 Mar 2020 11:21:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4AFC82A5806;
 Thu, 19 Mar 2020 11:21:26 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 19 Mar 2020 11:21:25 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 Mar 2020 11:21:14 +0100
Message-ID: <20200319102114.8644-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319102114.8644-1-patrick.delaunay@st.com>
References: <20200319102114.8644-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_02:2020-03-18,
 2020-03-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/3] configs:stm32mp1: activate env config in
	SPL
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

Activate env config in SPL with CONFIG_SPL_ENV_SUPPORT
and use CONFIG_IS_ENABLED macro to test the activated
CONFIG_$(SPL_)ENV_IS_IN_... in env_get_location.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c      | 8 ++++----
 configs/stm32mp15_basic_defconfig | 3 +++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index effba41ad1..474033d640 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -785,21 +785,21 @@ enum env_location env_get_location(enum env_operation op, int prio)
 		return ENVL_UNKNOWN;
 
 	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
-#ifdef CONFIG_ENV_IS_IN_MMC
+#if CONFIG_IS_ENABLED(ENV_IS_IN_MMC)
 	case BOOT_FLASH_SD:
 	case BOOT_FLASH_EMMC:
 		return ENVL_MMC;
 #endif
-#ifdef CONFIG_ENV_IS_IN_EXT4
+#if CONFIG_IS_ENABLED(ENV_IS_IN_EXT4)
 	case BOOT_FLASH_SD:
 	case BOOT_FLASH_EMMC:
 		return ENVL_EXT4;
 #endif
-#ifdef CONFIG_ENV_IS_IN_UBI
+#if CONFIG_IS_ENABLED(ENV_IS_IN_UBI)
 	case BOOT_FLASH_NAND:
 		return ENVL_UBI;
 #endif
-#ifdef CONFIG_ENV_IS_IN_SPI_FLASH
+#if CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH)
 	case BOOT_FLASH_NOR:
 		return ENVL_SPI_FLASH;
 #endif
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index dd55a8b632..c63002628c 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -16,6 +16,7 @@ CONFIG_FIT=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
+CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MTD_SUPPORT=y
 CONFIG_SPL_POWER_SUPPORT=y
@@ -63,6 +64,8 @@ CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+# CONFIG_SPL_ENV_IS_NOWHERE is not set
+# CONFIG_SPL_ENV_IS_IN_SPI_FLASH is not set
 CONFIG_STM32_ADC=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
