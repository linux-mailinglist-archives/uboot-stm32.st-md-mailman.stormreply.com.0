Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FFDA9A100
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Apr 2025 08:09:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63F5BC78F74;
	Thu, 24 Apr 2025 06:09:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F8BEC78F70
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 06:09:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NGWOJS009034;
 Thu, 24 Apr 2025 08:09:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 yIIeIrYa1dW3olACCBn0zf7MztblVkLB/673ubNnfDk=; b=WuvSYKlnK+ByaVcF
 OUnWJTVO7zSgqpj6QfvGI9ZErjetpLchyj7UTabft+hA2yuYk4SHK4glMLKZ2en0
 0blRNiThkRCIVfH/zD093OYHVJMqZjpc8ha0sJQVBXbGuuFTyrqDMMQrUGTIthWl
 6nxpOaApqXkCIryVUNq5AN9O8PENNyBBMwOE/MYUZTiFhoGzSlmH8IXihua02yUe
 D+Cq3C9xMl8caCsJMBEdyc065hbDU5U8fBgp7mPm1Salq+SbcXo4fG+CaUaLVA3M
 tBb5EI1t7Kv+6dHyhhYBb38vxEtin+lfiybCUaTt0F9bC0aKlQvY0zJJ2H3XtcYW
 aW2pAQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjxdvu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 08:09:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 97A3A40049;
 Thu, 24 Apr 2025 08:08:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 434D0A4C074;
 Thu, 24 Apr 2025 08:07:46 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 08:07:45 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 24 Apr 2025 08:07:10 +0200
Message-ID: <20250424060723.2695014-9-patrice.chotard@foss.st.com>
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
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 08/21] board: st: stm32mp2: add user button
	support
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

Handle user button 2 to force boot with STM32CubeProgrammer.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 board/st/stm32mp2/stm32mp2.c | 26 ++++++++++++++++++++++++++
 configs/stm32mp25_defconfig  |  4 +++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
index 576a958c783..6e4f19b1664 100644
--- a/board/st/stm32mp2/stm32mp2.c
+++ b/board/st/stm32mp2/stm32mp2.c
@@ -5,6 +5,7 @@
 
 #define LOG_CATEGORY LOGC_BOARD
 
+#include <button.h>
 #include <config.h>
 #include <env_internal.h>
 #include <fdt_support.h>
@@ -13,10 +14,12 @@
 #include <misc.h>
 #include <mmc.h>
 #include <asm/global_data.h>
+#include <asm/io.h>
 #include <asm/arch/sys_proto.h>
 #include <dm/device.h>
 #include <dm/ofnode.h>
 #include <dm/uclass.h>
+#include <linux/delay.h>
 
 /*
  * Get a global data pointer
@@ -90,10 +93,33 @@ static int setup_led(enum led_state_t cmd)
 	return ret;
 }
 
+static void check_user_button(void)
+{
+	struct udevice *button;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_CMD_STM32PROG) || !IS_ENABLED(CONFIG_BUTTON))
+		return;
+
+	if (button_get_by_label("User-2", &button))
+		return;
+
+	for (i = 0; i < 21; ++i) {
+		if (button_get_state(button) != BUTTON_ON)
+			return;
+		if (i < 20)
+			mdelay(50);
+	}
+
+	log_notice("entering download mode...\n");
+	clrsetbits_le32(TAMP_BOOT_CONTEXT, TAMP_BOOT_FORCED_MASK, BOOT_STM32PROG);
+}
+
 /* board dependent setup after realloc */
 int board_init(void)
 {
 	setup_led(LEDST_ON);
+	check_user_button();
 
 	return 0;
 }
diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index 3d6665335f5..3f765346904 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -39,12 +39,14 @@ CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_MMC_ENV_DEV=-1
 CONFIG_NO_NET=y
 CONFIG_SYS_64BIT_LBA=y
+CONFIG_BUTTON=y
+CONFIG_BUTTON_GPIO=y
 CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
-CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
+CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
 CONFIG_USE_SYS_MAX_FLASH_BANKS=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
