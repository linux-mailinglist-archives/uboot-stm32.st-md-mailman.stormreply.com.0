Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A93167AF92
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75B48C35E03
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F048DC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHG4uf012688; Tue, 30 Jul 2019 19:17:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=48/VZqZD2zeW3ZS9OC3hwh4YBS5t2jGVxR8j35+2cCY=;
 b=pogjoS6uSSAuVVEObn5E+GxKuWlNYnwannGZStk7empgu2023r1F/38oO1sTg0SFoTCX
 AaEjpMFDdAQ9M4RqeROeIokmvmiU9s7HkVtHRffLPrcZVicCOl9i1MTzytXAx5Bx6kz3
 LXY6aHNUFcke2pn+JwLcwH4A4k5cTNexybO0w1ZC7BW6wySuWZzinUH3gZH7umxw23hF
 CEalbnVA7/UrwvrzueENSszCZbnAgHlJFZ9TBTcqPnqPoKEZt8ZWGrClSNZ7HAjw/icu
 +Yf3MI2lYVeM5zhZNo9JKFyqsjrR4TArOSfwvoTHySUu83oBM0C4EpoUCafNF1LQx2KI 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0c2ybj4a-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 52E1334;
 Tue, 30 Jul 2019 17:17:36 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B38ECEA01;
 Tue, 30 Jul 2019 19:17:36 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:36 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:35
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:39 +0200
Message-ID: <1564507016-16570-32-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 31/48] stm32mp1: board: support of error led
	on ed1/ev1 board
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

Create a function led_error_blink and add node in device
tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 21 ++++----------
 board/st/stm32mp1/stm32mp1.c             | 48 ++++++++++++++++++++++----------
 2 files changed, 39 insertions(+), 30 deletions(-)

diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index 21c89c1..4953a0d 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -15,31 +15,22 @@
 	};
 
 	config {
+		u-boot,boot-led = "heartbeat";
+		u-boot,error-led = "error";
 		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
 	};
 
 	led {
-		compatible = "gpio-leds";
-
 		red {
-			label = "stm32mp:red:status";
+			label = "error";
 			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 			default-state = "off";
+			status = "okay";
 		};
-		green {
-			label = "stm32mp:green:user";
-			gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
-			default-state = "on";
-		};
-		orange {
-			label = "stm32mp:orange:status";
-			gpios = <&gpioh 7 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
-		};
+
 		blue {
-			label = "stm32mp:blue:user";
-			gpios = <&gpiod 11 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
 		};
 	};
 };
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 2837e9a..61a4253 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -20,6 +20,7 @@
 #include <reset.h>
 #include <syscon.h>
 #include <usb.h>
+#include <watchdog.h>
 #include <asm/io.h>
 #include <asm/gpio.h>
 #include <asm/arch/stm32.h>
@@ -231,6 +232,7 @@ int g_dnl_board_usb_cable_connected(void)
 }
 #endif /* CONFIG_USB_GADGET */
 
+#ifdef CONFIG_LED
 static int get_led(struct udevice **dev, char *led_string)
 {
 	char *led_name;
@@ -263,12 +265,41 @@ static int setup_led(enum led_state_t cmd)
 	ret = led_set_state(dev, cmd);
 	return ret;
 }
+#endif
+
+static void __maybe_unused led_error_blink(u32 nb_blink)
+{
+#ifdef CONFIG_LED
+	int ret;
+	struct udevice *led;
+	u32 i;
+#endif
+
+	if (!nb_blink)
+		return;
+
+#ifdef CONFIG_LED
+	ret = get_led(&led, "u-boot,error-led");
+	if (!ret) {
+		/* make u-boot,error-led blinking */
+		/* if U32_MAX and 125ms interval, for 17.02 years */
+		for (i = 0; i < 2 * nb_blink; i++) {
+			led_set_state(led, LEDST_TOGGLE);
+			mdelay(125);
+			WATCHDOG_RESET();
+		}
+	}
+#endif
+
+	/* infinite: the boot process must be stopped */
+	if (nb_blink == U32_MAX)
+		hang();
+}
 
 static int board_check_usb_power(void)
 {
 	struct ofnode_phandle_args adc_args;
 	struct udevice *adc;
-	struct udevice *led;
 	ofnode node;
 	unsigned int raw;
 	int max_uV = 0;
@@ -394,20 +425,7 @@ static int board_check_usb_power(void)
 		pr_err("****************************************************\n\n");
 	}
 
-	ret = get_led(&led, "u-boot,error-led");
-	if (ret) {
-		/* in unattached case, the boot process must be stopped */
-		if (nb_blink == U32_MAX)
-			hang();
-		return ret;
-	}
-
-	/* make u-boot,error-led blinking */
-	for (i = 0; i < nb_blink * 2; i++) {
-		led_set_state(led, LEDST_TOGGLE);
-		mdelay(125);
-	}
-	led_set_state(led, LEDST_ON);
+	led_error_blink(nb_blink);
 
 	return 0;
 }
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
