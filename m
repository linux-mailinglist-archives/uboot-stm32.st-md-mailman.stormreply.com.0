Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7194A9C9F2
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Apr 2025 15:16:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6826C78F90;
	Fri, 25 Apr 2025 13:16:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ED78C78F8B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 13:16:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P7RvvK005396;
 Fri, 25 Apr 2025 15:16:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 HX+F2WM/uioM8KSgUU8Wf9GC956adXFWy39AjkYtzFc=; b=C1tftokKNhaDjRhE
 IThVRKXWp0/3CIZOmI9scF36nKXul749MIcn0HEjden69F1U8pd9aOpFZhD7ch6u
 AX5/Z8/5I/xAsfnHvcz757qvITxraXBdxGDMAu9CVBoiSpo8h3AY7HTOexXPrwR6
 zohCPf2envB1eW79cOjv8MaodkEDZNaLWS3GuRxmMWHdyHc2rHiJmEaWFcTSrNy+
 iR1XCNjlxVYbbW9kwLSHNw99mvlpKDXmxY8xJbrvnii6mlIHkwkqlR9EwKoBL0Sx
 psVx2HdH9T1ihnI9kLR6AIg4XiqIdxKhuBrk6tnFPLoF/NwSx11+r5/KkzwVQ9kZ
 R7xR+Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jk3mny1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 15:16:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C5E4340054;
 Fri, 25 Apr 2025 15:16:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 187D68A147C;
 Fri, 25 Apr 2025 15:15:37 +0200 (CEST)
Received: from localhost (10.252.18.92) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 15:15:36 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 25 Apr 2025 15:15:12 +0200
Message-ID: <20250425131533.392747-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425131533.392747-1-patrice.chotard@foss.st.com>
References: <20250425131533.392747-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.18.92]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 01/22] configs: stm32mp25: add MMC support
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

Enable MMC related flags support for stm32mp25

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 configs/stm32mp25_defconfig | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index 2f8d34d15ff..717724ff672 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32MP=y
 CONFIG_SYS_MALLOC_F_LEN=0x400000
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x90000000
+CONFIG_ENV_OFFSET=0x900000
 CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp257f-ev1"
 CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SYS_LOAD_ADDR=0x84000000
@@ -10,9 +11,10 @@ CONFIG_DDR_CACHEABLE_SIZE=0x10000000
 CONFIG_TARGET_ST_STM32MP25X=y
 CONFIG_SYS_MEMTEST_START=0x84000000
 CONFIG_SYS_MEMTEST_END=0x88000000
+CONFIG_API=y
+CONFIG_SYS_MMC_MAX_DEVICE=3
 CONFIG_FIT=y
 CONFIG_BOOTDELAY=1
-CONFIG_LAST_STAGE_INIT=y
 CONFIG_SYS_PROMPT="STM32MP> "
 # CONFIG_CMD_BDI is not set
 CONFIG_CMD_BOOTZ=y
@@ -24,6 +26,7 @@ CONFIG_CMD_CLK=y
 CONFIG_CMD_FUSE=y
 CONFIG_CMD_GPIO=y
 # CONFIG_CMD_LOADB is not set
+CONFIG_CMD_MMC=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_TIME=y
 CONFIG_CMD_RNG=y
@@ -31,12 +34,16 @@ CONFIG_CMD_TIMER=y
 CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_LOG=y
 CONFIG_OF_LIVE=y
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SYS_MMC_ENV_DEV=1
 CONFIG_NO_NET=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
-# CONFIG_MMC is not set
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_STM32_SDMMC2=y
 CONFIG_PINCONF=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
