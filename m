Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 618FDA9A0F8
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Apr 2025 08:09:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25AF8C78F70;
	Thu, 24 Apr 2025 06:09:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFDB5C78F68
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 06:09:07 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O65kkK002455;
 Thu, 24 Apr 2025 08:09:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 MznMa3hog35GB+28W762LqUsdRokvhkwlhRsWf2y5Og=; b=p9Tbd8m7NEyixIKp
 PmHj1WCZh6sC4UbqAQTdAUKBicYpMWPurOJ90C+CywQ+UKsX4UOGCwGuK6Tug72U
 Mk3GU1iTofSnwY6PePpAqUW+6h6IIZ415BYxy+2Jmgy7/W5Rau2XH+c4KZlzpNhh
 kAAsd6joGVYJ1NDHoJaf0La+uXGJdKyCgiLRCiMvfiUAmvBVZ6XpQKYtPW0afk/r
 10i6XFpInqkadWZPPeDwRGnBozAKSmtZo1IOOH+e30e6q/iihCOtR5SCl9aQXXuh
 NY9PAGvKU/MB+A8jH+wcQKj5Vvfo2Jr+6C7lw7GZ/IolSi1KkpecbGwUAEAkwArA
 s2/YOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jk2e2xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 08:09:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7D71C4005F;
 Thu, 24 Apr 2025 08:08:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 50151A49BDE;
 Thu, 24 Apr 2025 08:07:43 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 08:07:43 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 24 Apr 2025 08:07:07 +0200
Message-ID: <20250424060723.2695014-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424060723.2695014-1-patrice.chotard@foss.st.com>
References: <20250424060723.2695014-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_02,2025-04-22_01,2025-02-21_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 05/21] board: st: stm32mp2: add
	mmc_get_env_dev()
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

Use the boot instance to select the correct mmc device identifier,
this patch only to save the environment on eMMC = MMC(1) on
STMicroelectronics boards.

Set the CONFIG_SYS_MMC_ENV_DEV to -1 to select the mmc boot instance
by default.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 board/st/stm32mp2/stm32mp2.c | 37 ++++++++++++++++++++++++++++++++++++
 configs/stm32mp25_defconfig  |  2 +-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
index c70ffaf5dbd..8446b8fd3d6 100644
--- a/board/st/stm32mp2/stm32mp2.c
+++ b/board/st/stm32mp2/stm32mp2.c
@@ -10,6 +10,7 @@
 #include <fdt_support.h>
 #include <log.h>
 #include <misc.h>
+#include <mmc.h>
 #include <asm/global_data.h>
 #include <asm/arch/sys_proto.h>
 #include <dm/device.h>
@@ -78,6 +79,42 @@ enum env_location env_get_location(enum env_operation op, int prio)
 	}
 }
 
+int mmc_get_boot(void)
+{
+	struct udevice *dev;
+	u32 boot_mode = get_bootmode();
+	unsigned int instance = (boot_mode & TAMP_BOOT_INSTANCE_MASK) - 1;
+	char cmd[20];
+	const u32 sdmmc_addr[] = {
+		STM32_SDMMC1_BASE,
+		STM32_SDMMC2_BASE,
+		STM32_SDMMC3_BASE
+	};
+
+	if (instance > ARRAY_SIZE(sdmmc_addr))
+		return 0;
+
+	/* search associated sdmmc node in devicetree */
+	snprintf(cmd, sizeof(cmd), "mmc@%x", sdmmc_addr[instance]);
+	if (uclass_get_device_by_name(UCLASS_MMC, cmd, &dev)) {
+		log_err("mmc%d = %s not found in device tree!\n", instance, cmd);
+		return 0;
+	}
+
+	return dev_seq(dev);
+};
+
+int mmc_get_env_dev(void)
+{
+	const int mmc_env_dev = CONFIG_IS_ENABLED(ENV_IS_IN_MMC, (CONFIG_SYS_MMC_ENV_DEV), (-1));
+
+	if (mmc_env_dev >= 0)
+		return mmc_env_dev;
+
+	/* use boot instance to select the correct mmc device identifier */
+	return mmc_get_boot();
+}
+
 int board_late_init(void)
 {
 	const void *fdt_compat;
diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index d11910f139f..fd5c36ec3e2 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -36,7 +36,7 @@ CONFIG_CMD_LOG=y
 CONFIG_OF_LIVE=y
 CONFIG_ENV_IS_NOWHERE=y
 CONFIG_ENV_IS_IN_MMC=y
-CONFIG_SYS_MMC_ENV_DEV=1
+CONFIG_SYS_MMC_ENV_DEV=-1
 CONFIG_NO_NET=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_GPIO_HOG=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
