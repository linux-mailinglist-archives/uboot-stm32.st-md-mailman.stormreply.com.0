Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 011E61F931F
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 11:18:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB81BC36B23
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 09:18:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41A2CC36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 09:18:43 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F9Cn9t008509; Mon, 15 Jun 2020 11:18:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=iYysIjeKE9KkIwTsez4BMab+KQUMOqnzeLsEUATbxmg=;
 b=PhKmOzB0czehNEvZmJswL9B7lmMrmrKid3DhIJFoEj/wW73d3ipJd22UN3EbO4oWSwR5
 TJysd/aBv7smtUJi7btgCibGPRN3NGpx+2s0mwx9R7/eCir14C3eQIDCqy+oGNurwzym
 HHjU88i+xgXudWpeFtHbEOIoUMq54ZgiNvgNulOz8AKISV/gjKuBs4Bga9327yxB0J9k
 pOTSrwBu9gvOUy+/1MTWcPNRs6icsVY91SxpH3tP+p8YvQggeGbIlpVQ7n8+1HfDv+Ve
 GZcOZzQAjXsSBRZYiVSZ5vn3o25xJzEWdEHINs1jMhK543yYtXJIpetZIHWyePWyeY7A Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mmjvrrrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 11:18:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D259E10002A;
 Mon, 15 Jun 2020 11:18:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C94172C1E88;
 Mon, 15 Jun 2020 11:18:36 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 15 Jun 2020 11:18:36 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jun 2020 11:18:24 +0200
Message-ID: <20200615091824.3022-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615091824.3022-1-patrick.delaunay@st.com>
References: <20200615091824.3022-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-15,
 2020-06-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 3/3] configs:stm32mp1: activate env config
	in SPL
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

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

(no changes since v1)

 board/st/stm32mp1/stm32mp1.c      | 8 ++++----
 configs/stm32mp15_basic_defconfig | 3 +++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index b695e8bc6b..7abb90d1d4 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -833,22 +833,22 @@ enum env_location env_get_location(enum env_operation op, int prio)
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
 	case BOOT_FLASH_SPINAND:
 		return ENVL_UBI;
 #endif
-#ifdef CONFIG_ENV_IS_IN_SPI_FLASH
+#if CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH)
 	case BOOT_FLASH_NOR:
 		return ENVL_SPI_FLASH;
 #endif
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index acf9331b4b..31597dbc40 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -18,6 +18,7 @@ CONFIG_FIT=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
+CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MTD_SUPPORT=y
 CONFIG_SPL_POWER_SUPPORT=y
@@ -61,6 +62,8 @@ CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+# CONFIG_SPL_ENV_IS_NOWHERE is not set
+# CONFIG_SPL_ENV_IS_IN_SPI_FLASH is not set
 CONFIG_STM32_ADC=y
 CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
