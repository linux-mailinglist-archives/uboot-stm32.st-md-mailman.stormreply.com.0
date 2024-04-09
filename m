Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A47B089DDAB
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Apr 2024 17:04:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66F1FC7128C;
	Tue,  9 Apr 2024 15:04:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 241A5C7128B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 15:04:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 439BaOcU017772; Tue, 9 Apr 2024 17:03:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=DNiNhUs2Lb3tHGcAcqOh6HhW2TQMytSuZRxWnHZ7ohc=; b=z+
 ohSJego7xQdUNvnP7IZCsd1TB8q35E7VFiUwxQY4d1qaUsdGW4B+BwL1F5N8FpRM
 DzYDE7Vf60PcZAoh5SkpiUCxJ8zoUBvVSihuIy2Cqoqj8XgRBRKl0U8X2ZvGdRBL
 rNHqc0h/cRNvNttxW5O2+MSRw9o4KialDnhGRtu3v2oxrMvDz2+l0aHS1RN5VBNo
 WGc9fthgCYNVzXLKRhJ2fwBDjJNAZaRQfg4wL0ExH9eBxMdhxp3Hvuy92PgOBRYn
 G9Ut+p2j/bH+DGHsxTWx7O6EfDxX/VYhd29l0wW3KKd6srC/zvFyRnmIIE0k5ZNh
 t0j8oghaUHEcDDNmE9ZQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xauh53wfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Apr 2024 17:03:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 59AC240047;
 Tue,  9 Apr 2024 17:03:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 303792207AE;
 Tue,  9 Apr 2024 17:03:25 +0200 (CEST)
Received: from localhost (10.48.86.98) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 9 Apr
 2024 17:03:24 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Apr 2024 17:01:56 +0200
Message-ID: <20240409150215.2497778-7-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_10,2024-04-09_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Simon Glass <sjg@chromium.org>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 06/25] board: st: stmp32mp1: Use BUTTON
	UCLASS in board_key_check()
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

Instead of using gpio directly to detect key pressed on button
dedicated for fastboot and stm32mprog, make usage of BUTTON UCLASS.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 board/st/stm32mp1/stm32mp1.c | 68 +++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 28 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index a17c314daeb..82f7d4ff4ea 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -8,6 +8,7 @@
 #include <common.h>
 #include <adc.h>
 #include <bootm.h>
+#include <button.h>
 #include <clk.h>
 #include <config.h>
 #include <dm.h>
@@ -38,6 +39,7 @@
 #include <asm/gpio.h>
 #include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
+#include <dm/device-internal.h>
 #include <dm/ofnode.h>
 #include <jffs2/load_kernel.h>
 #include <linux/bitops.h>
@@ -150,45 +152,55 @@ int checkboard(void)
 
 static void board_key_check(void)
 {
-	ofnode node;
-	struct gpio_desc gpio;
+	struct udevice *button1 = NULL, *button2 = NULL;
 	enum forced_boot_mode boot_mode = BOOT_NORMAL;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_BUTTON))
+		return;
 
 	if (!IS_ENABLED(CONFIG_FASTBOOT) && !IS_ENABLED(CONFIG_CMD_STM32PROG))
 		return;
 
-	node = ofnode_path("/config");
-	if (!ofnode_valid(node)) {
-		log_debug("no /config node?\n");
+	if (IS_ENABLED(CONFIG_CMD_STM32PROG))
+		button_get_by_label("User-1", &button1);
+
+	if (IS_ENABLED(CONFIG_FASTBOOT))
+		button_get_by_label("User-2", &button2);
+
+	if (!button1 && !button2)
 		return;
-	}
-	if (IS_ENABLED(CONFIG_FASTBOOT)) {
-		if (gpio_request_by_name_nodev(node, "st,fastboot-gpios", 0,
-					       &gpio, GPIOD_IS_IN)) {
-			log_debug("could not find a /config/st,fastboot-gpios\n");
-		} else {
-			udelay(20);
-			if (dm_gpio_get_value(&gpio)) {
-				log_notice("Fastboot key pressed, ");
-				boot_mode = BOOT_FASTBOOT;
-			}
 
-			dm_gpio_free(NULL, &gpio);
+	if (button2) {
+		if (button_get_state(button2) == BUTTON_ON) {
+			log_notice("Fastboot key pressed, ");
+			boot_mode = BOOT_FASTBOOT;
 		}
+		/*
+		 * On some boards, same gpio is shared betwwen gpio-keys and
+		 * leds, remove the button device to free the gpio for led
+		 * usage
+		 */
+		ret = device_remove(button2, DM_REMOVE_NORMAL);
+		if (ret)
+			log_err("Can't remove button2 (%d)\n", ret);
 	}
-	if (IS_ENABLED(CONFIG_CMD_STM32PROG)) {
-		if (gpio_request_by_name_nodev(node, "st,stm32prog-gpios", 0,
-					       &gpio, GPIOD_IS_IN)) {
-			log_debug("could not find a /config/st,stm32prog-gpios\n");
-		} else {
-			udelay(20);
-			if (dm_gpio_get_value(&gpio)) {
-				log_notice("STM32Programmer key pressed, ");
-				boot_mode = BOOT_STM32PROG;
-			}
-			dm_gpio_free(NULL, &gpio);
+
+	if (button1) {
+		if (button_get_state(button1) == BUTTON_ON) {
+			log_notice("STM32Programmer key pressed, ");
+			boot_mode = BOOT_STM32PROG;
 		}
+		/*
+		 * On some boards, same gpio is shared betwwen gpio-keys and
+		 * leds, remove the button device to free the gpio for led
+		 * usage
+		 */
+		ret = device_remove(button1, DM_REMOVE_NORMAL);
+		if (ret)
+			log_err("Can't remove button1 (%d)\n", ret);
 	}
+
 	if (boot_mode != BOOT_NORMAL) {
 		log_notice("entering download mode...\n");
 		clrsetbits_le32(TAMP_BOOT_CONTEXT,
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
