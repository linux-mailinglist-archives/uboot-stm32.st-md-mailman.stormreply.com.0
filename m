Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A6A7AEF3A
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Sep 2023 17:09:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9E4AC6B47D;
	Tue, 26 Sep 2023 15:09:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F179C6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 15:09:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38QCYgB9023622; Tue, 26 Sep 2023 17:09:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=6K1XVhtrTPLCHo2FnpquHNDbuIhZhh9MyAhQOQpvtwo=; b=Te
 XHWkt0nZ9G3+2jOtqDIkO7FVu4BWAKXZYD/rwScl/Mj69l32o0TYSZtND0hkXDve
 l51jiWhBqtFi5X9HexELv6nDsIk2kE80x90aPUQIZJtoVwgJjwKapYcwZ7sKzgky
 gk5MssDAeGSwah2aAZ/SjHu7b8WXhIpNq/iR22/EEjjAvhz1Tjt7z1ZAEdkqQAwW
 XZbLYiivunuMPar06JZVqCVDe6k/1qoAUeVp3MQT3i9KJVwcfxu1zGlthjic1vL/
 ZaMNK7HczneZdFG56sTNrnsR68mTDsHetCm1Fo3aeTteRkYnTVQ29NyP0qPYEvaM
 ZgigPWgH+MN8M2cNBtfg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9n54duwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 17:09:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 614D710005C;
 Tue, 26 Sep 2023 17:09:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B08E2C41E8;
 Tue, 26 Sep 2023 17:09:31 +0200 (CEST)
Received: from localhost (10.201.20.38) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 17:09:31 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Sep 2023 17:09:21 +0200
Message-ID: <20230926150924.1150082-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926150924.1150082-1-patrice.chotard@foss.st.com>
References: <20230926150924.1150082-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_12,2023-09-26_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 4/6] configs: stm32mp13: activate command
	stm32prog
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

Activate the command stm32prog with CONFIG_CMD_STM32MPROG.
The CONFIG_SET_DFU_ALT_INFO is also activated to support
the required weak functions for the DFU virtual backen defined in
board/st/common/stm32mp_dfu.c.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32mp13_defconfig        | 2 ++
 include/configs/stm32mp13_common.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index f962d0eab97..2d87792a9cb 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -11,6 +11,7 @@ CONFIG_DDR_CACHEABLE_SIZE=0x8000000
 CONFIG_CMD_STM32KEY=y
 CONFIG_TARGET_ST_STM32MP13x=y
 CONFIG_ENV_OFFSET_REDUND=0x940000
+CONFIG_CMD_STM32PROG=y
 # CONFIG_ARMV7_NONSEC is not set
 CONFIG_SYS_LOAD_ADDR=0xc2000000
 CONFIG_SYS_MEMTEST_START=0xc0000000
@@ -51,6 +52,7 @@ CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_SYS_MMC_ENV_DEV=-1
 CONFIG_ENV_MMC_USE_DT=y
 CONFIG_CLK_SCMI=y
+CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
diff --git a/include/configs/stm32mp13_common.h b/include/configs/stm32mp13_common.h
index 7c59c69e0bd..d36fbf00548 100644
--- a/include/configs/stm32mp13_common.h
+++ b/include/configs/stm32mp13_common.h
@@ -41,10 +41,14 @@
 
 /*
  * default bootcmd for stm32mp13:
+ * for serial/usb: execute the stm32prog command
  * for mmc boot (eMMC, SD card), distro boot on the same mmc device
  */
 #define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
 	"echo \"Boot over ${boot_device}${boot_instance}!\";" \
+	"if test ${boot_device} = serial || test ${boot_device} = usb;" \
+	"then stm32prog ${boot_device} ${boot_instance}; " \
+	"else " \
 		"run env_check;" \
 		"if test ${boot_device} = mmc;" \
 		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
