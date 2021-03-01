Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 615F3327E1A
	for <lists+uboot-stm32@lfdr.de>; Mon,  1 Mar 2021 13:18:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F5FBC56634;
	Mon,  1 Mar 2021 12:18:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 499E2C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Mar 2021 12:18:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 121C7fBi019232; Mon, 1 Mar 2021 13:18:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=L99EHEh3HRDG/8do0w1s5CKGcKiMEyUg595hmJvuKNs=;
 b=boE+U3EsbczJmqYenAQQUQkdasu4E7aS4eVw02APsnl2z14BOId6D1chSgBQCvSCU1Qt
 Ikps5cXuXsTCfR0gzhUZ1E/9Qv8SuIvzjllbTpdvobrpdh+7HQ76HTPyRSZSBCpgQJOp
 BTn6KtKu3b1oRZr3PXbnjj6ivSMETrIe3niBAY+SgUcHIHeYuCJdj5t2Z5jUtJKU4CeO
 qqXsgaYYibGahr5mo/KsNwCUx6xVnkx8/SPgzWcUEpAz98rIEFYyYOd0KMyGk3fvmg4r
 eb68ePtd2ipT+abA91rsunMqUknc+uaEvohFc/hp1juU02ByW7VwHIJZRF0ftaOfsPH0 ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yfc3ksed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 13:18:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E03B0100034;
 Mon,  1 Mar 2021 13:18:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C76CB235C7C;
 Mon,  1 Mar 2021 13:18:00 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 1 Mar 2021 13:18:00
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 1 Mar 2021 13:17:56 +0100
Message-ID: <20210301131752.1.I8cbd6f92056fa2d10bf3880746d89ee0779f8e27>@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-01_06:2021-03-01,
 2021-03-01 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] board: stm32mp1: use CONFIG_SYS_MMC_ENV_DEV
	when available
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

Check whether user has explicitly defined the mmc device to use
in mmc_get_env_dev() with CONFIG_SYS_MMC_ENV_DEV.

On STMicroelectronics boards the used mmc device for environment is
the instance of boot device provided by the ROM code; the mmc instance
is configured by alias in device tree. The used partition is defined in
device tree with u-boot,mmc-env-partition = "ssbl".

This patch allows to override this selection for the support of customer
boards without alias; for example when SDMMC1 is not used and ENV in
mmc0=SDMMC2, user can force the value: CONFIG_SYS_MMC_ENV_DEV = 0.

On STMicroelectronics boards, the current behavior is kept with
CONFIG_SYS_MMC_ENV_DEV = -1.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/st/stm32mp1/stm32mp1.c        | 8 +++++++-
 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index ab85d8ba68..759181fb5d 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -862,8 +862,14 @@ const char *env_ext4_get_dev_part(void)
 
 int mmc_get_env_dev(void)
 {
-	u32 bootmode = get_bootmode();
+	u32 bootmode;
+
+	if (CONFIG_SYS_MMC_ENV_DEV >= 0)
+		return CONFIG_SYS_MMC_ENV_DEV;
+
+	bootmode = get_bootmode();
 
+	/* use boot instance to select the correct mmc device identifier */
 	return (bootmode & TAMP_BOOT_INSTANCE_MASK) - 1;
 }
 
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 1c680984b8..a2f745099e 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -71,6 +71,7 @@ CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_SYS_MMC_ENV_DEV=-1
 # CONFIG_SPL_ENV_IS_NOWHERE is not set
 # CONFIG_SPL_ENV_IS_IN_SPI_FLASH is not set
 CONFIG_STM32_ADC=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 107041119f..f41aaa750f 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -52,6 +52,7 @@ CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_SYS_MMC_ENV_DEV=-1
 CONFIG_STM32_ADC=y
 CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
