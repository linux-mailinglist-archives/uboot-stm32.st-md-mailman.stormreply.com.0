Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBA61B4521
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 14:29:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEB0AC36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 12:29:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2755C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:29:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MCCE3I031096; Wed, 22 Apr 2020 14:29:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=YAj5LtQo+7CDnDC8p4vmwoNfiwvs/G6x73YNYkQw1+0=;
 b=BTnXOf9K0ArIPa4ivpBL+0Iem8jqg6xs16NDOIs7gEASv3RyumMRhHeDRhKgojyH9+o1
 jVRQuR+9nimTiJYs72fY2vqrpx3f0Bdro+0GL0Gb212lo8gDgt1YGQxbfeRmTkfa0eqA
 1JUGXaKfGsM+2S2hO/DD7IOcUGYzIJLSJY51OiyB4iVXNHXWu7tERqxX4bOAYcSMsvhQ
 BOlA4KoLI9LEbjHZ+fbdjiBvxXpDaQrHBQcewwLj2oBkz9FiEXTQeDUVkvOS6z0/Bgjq
 kJK0HtzNke8gWQhIbUl5yC/A1v6/0Q1IJT65CuZfkgE3PNpeU4u3+Xffoa4TXYN7T7qC WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fpp8xpx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:29:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BF9210002A;
 Wed, 22 Apr 2020 14:29:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 01BFE2AE6C5;
 Wed, 22 Apr 2020 14:29:25 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 22 Apr 2020 14:29:24 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Apr 2020 14:29:12 +0200
Message-ID: <20200422142834.v2.4.I15cb0a6245fb4cd5d23371683c2697f794adf306@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422122920.19340-1-patrick.delaunay@st.com>
References: <20200422122920.19340-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 04/12] board: stm32mp1: update management
	of boot-led
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

Force boot-led ON and no more rely on default-state.
This patch avoid device-tree modification for U-Boot.


Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- use CONFIG_IS_ENABLED(LED) everywhere

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi |  4 ---
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi |  4 ---
 board/st/stm32mp1/stm32mp1.c             | 33 ++++++++++++------------
 3 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 5844d41c53..c52abeb1e7 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -27,10 +27,6 @@
 			default-state = "off";
 			status = "okay";
 		};
-
-		blue {
-			default-state = "on";
-		};
 	};
 };
 
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index ed2f024be9..84af7fa47b 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -28,10 +28,6 @@
 			default-state = "off";
 			status = "okay";
 		};
-
-		blue {
-			default-state = "on";
-		};
 	};
 };
 
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index d85a57cee2..6a3e2e64bf 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -260,7 +260,6 @@ int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char *name)
 
 #endif /* CONFIG_USB_GADGET */
 
-#ifdef CONFIG_LED
 static int get_led(struct udevice **dev, char *led_string)
 {
 	char *led_name;
@@ -286,6 +285,9 @@ static int setup_led(enum led_state_t cmd)
 	struct udevice *dev;
 	int ret;
 
+	if (!CONFIG_IS_ENABLED(LED))
+		return 0;
+
 	ret = get_led(&dev, "u-boot,boot-led");
 	if (ret)
 		return ret;
@@ -293,32 +295,29 @@ static int setup_led(enum led_state_t cmd)
 	ret = led_set_state(dev, cmd);
 	return ret;
 }
-#endif
 
 static void __maybe_unused led_error_blink(u32 nb_blink)
 {
-#ifdef CONFIG_LED
 	int ret;
 	struct udevice *led;
 	u32 i;
-#endif
 
 	if (!nb_blink)
 		return;
 
-#ifdef CONFIG_LED
-	ret = get_led(&led, "u-boot,error-led");
-	if (!ret) {
-		/* make u-boot,error-led blinking */
-		/* if U32_MAX and 125ms interval, for 17.02 years */
-		for (i = 0; i < 2 * nb_blink; i++) {
-			led_set_state(led, LEDST_TOGGLE);
-			mdelay(125);
-			WATCHDOG_RESET();
+	if (CONFIG_IS_ENABLED(LED)) {
+		ret = get_led(&led, "u-boot,error-led");
+		if (!ret) {
+			/* make u-boot,error-led blinking */
+			/* if U32_MAX and 125ms interval, for 17.02 years */
+			for (i = 0; i < 2 * nb_blink; i++) {
+				led_set_state(led, LEDST_TOGGLE);
+				mdelay(125);
+				WATCHDOG_RESET();
+			}
+			led_set_state(led, LEDST_ON);
 		}
-		led_set_state(led, LEDST_ON);
 	}
-#endif
 
 	/* infinite: the boot process must be stopped */
 	if (nb_blink == U32_MAX)
@@ -651,6 +650,8 @@ int board_init(void)
 	if (CONFIG_IS_ENABLED(LED))
 		led_default_state();
 
+	setup_led(LEDST_ON);
+
 	return 0;
 }
 
@@ -705,9 +706,7 @@ int board_late_init(void)
 
 void board_quiesce_devices(void)
 {
-#ifdef CONFIG_LED
 	setup_led(LEDST_OFF);
-#endif
 }
 
 /* eth init function : weak called in eqos driver */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
