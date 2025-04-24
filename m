Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961CA9A0F9
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Apr 2025 08:09:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DD6CC78F74;
	Thu, 24 Apr 2025 06:09:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C9B5C78F70
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 06:09:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NGWOJP009034;
 Thu, 24 Apr 2025 08:09:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 wZwi0MpIeKuQknrbFFAfCtsQFxnowCyhIpVYuul02ks=; b=cZjX/fW2gCIiKhSD
 5eBJjCNet+po9T0zlOo1+AqyRw7Zwmp0PESopcHqvRUjW7v8XZT96Z9y2AE0qCSQ
 J0zi/jkFlY8GW6he8/hvOkgTTchc+/mVfw4CvyP4XUcdN+F5PzUAZ97IML2w8PmC
 13THJ9Jthx+TpWzhWISXVx7jNv2DiO6bjrx1ert8YUXjF/aRn0PDrIeetMUGADlz
 ggDlgxB5EGr0LcjENd8qfEcSGkvABs1dQrh1KJ9zjTRZvVY+b07O734aw0KZL6d2
 5OV1MQR3WOtm1mFlzZKABEUt8iJd5J+MiAxg1ydGCoMfD+L7Q3G28C6dWkWcc8p9
 IsZtYw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjxdvth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 08:09:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 821F240060;
 Thu, 24 Apr 2025 08:08:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 447F6A46C94;
 Thu, 24 Apr 2025 08:07:45 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 08:07:44 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 24 Apr 2025 08:07:09 +0200
Message-ID: <20250424060723.2695014-8-patrice.chotard@foss.st.com>
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
Subject: [Uboot-stm32] [PATCH 07/21] board: st: stm32mp2: add led support
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

Add led support, force default state on U-Boot initialization and put on
the Linux heartbeat led = "blue-led" during U-Boot execution.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi |  1 +
 board/st/stm32mp2/stm32mp2.c             | 43 ++++++++++++++++++++++++
 configs/stm32mp25_defconfig              |  2 ++
 3 files changed, 46 insertions(+)

diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
index d4a75b2f03e..a9bd5e042fa 100644
--- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	config {
+		u-boot,boot-led = "led-blue";
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
 
diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
index 8446b8fd3d6..576a958c783 100644
--- a/board/st/stm32mp2/stm32mp2.c
+++ b/board/st/stm32mp2/stm32mp2.c
@@ -8,6 +8,7 @@
 #include <config.h>
 #include <env_internal.h>
 #include <fdt_support.h>
+#include <led.h>
 #include <log.h>
 #include <misc.h>
 #include <mmc.h>
@@ -54,9 +55,46 @@ int checkboard(void)
 	return 0;
 }
 
+static int get_led(struct udevice **dev, char *led_string)
+{
+	const char *led_name;
+	int ret;
+
+	led_name = ofnode_conf_read_str(led_string);
+	if (!led_name) {
+		log_debug("could not find %s config string\n", led_string);
+		return -ENOENT;
+	}
+	ret = led_get_by_label(led_name, dev);
+	if (ret) {
+		log_debug("get=%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int setup_led(enum led_state_t cmd)
+{
+	struct udevice *dev;
+	int ret;
+
+	if (!CONFIG_IS_ENABLED(LED))
+		return 0;
+
+	ret = get_led(&dev, "u-boot,boot-led");
+	if (ret)
+		return ret;
+
+	ret = led_set_state(dev, cmd);
+	return ret;
+}
+
 /* board dependent setup after realloc */
 int board_init(void)
 {
+	setup_led(LEDST_ON);
+
 	return 0;
 }
 
@@ -142,3 +180,8 @@ int board_late_init(void)
 
 	return 0;
 }
+
+void board_quiesce_devices(void)
+{
+	setup_led(LEDST_OFF);
+}
diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index fd5c36ec3e2..3d6665335f5 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -43,6 +43,8 @@ CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_LED=y
+CONFIG_LED_GPIO=y
 CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
 CONFIG_USE_SYS_MAX_FLASH_BANKS=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
