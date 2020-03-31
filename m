Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B33C199AD0
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:05:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7A84C36B11
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:05:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E39DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:05:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VG3EHj025802; Tue, 31 Mar 2020 18:05:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=j69TaDKSc26NsLbVzvHD15rPUQCHcg60rCnrfOQI8l0=;
 b=ki6pxrvpNdn6CtMdQAL3NOy5jSdoB/alxSOiID9F96lwMEld0t/reVvJd7zQUhSeRthF
 +DIbv5N4AEAiCXPc/2yt3aKc5Folvf0XsfIXIxFts5kVttXPaI2xbHXfV1z0+r2+0HVv
 BGeO5v0qw0en/GwnVYwmPXyOqCBUQcOTqa895nLXx4uz5XLj5TNlCbJPRFrhoUr6XVhA
 m+VC0culWRZAkSVti8W6qlE0KWr5PZLckxv15wzoSy3IufO0rzO4wsl6Dc+kZbqwk8T6
 lvaxBouh+xLuoQ2Rk5ul86HsgELZu1uTX8SZl575RiyKqg9u+KbQKxV1bVu2eD7fdJPz 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301vkdrd4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 18:05:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8BFC7100034;
 Tue, 31 Mar 2020 18:05:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 853702BEC6D;
 Tue, 31 Mar 2020 18:05:00 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 31 Mar 2020 18:05:00 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 31 Mar 2020 18:04:25 +0200
Message-ID: <20200331180330.8.I15cb0a6245fb4cd5d23371683c2697f794adf306@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_05:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 08/16] board: stm32mp1: update management of
	boot-led
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

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi |  4 ----
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi |  4 ----
 board/st/stm32mp1/stm32mp1.c             | 10 ++++++++--
 3 files changed, 8 insertions(+), 10 deletions(-)

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
index 8ed09ae24a..6ca47509b3 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -280,9 +280,11 @@ static int get_led(struct udevice **dev, char *led_string)
 
 	return 0;
 }
+#endif
 
 static int setup_led(enum led_state_t cmd)
 {
+#ifdef CONFIG_LED
 	struct udevice *dev;
 	int ret;
 
@@ -292,8 +294,10 @@ static int setup_led(enum led_state_t cmd)
 
 	ret = led_set_state(dev, cmd);
 	return ret;
-}
+#else
+	return 0;
 #endif
+}
 
 static void __maybe_unused led_error_blink(u32 nb_blink)
 {
@@ -648,8 +652,10 @@ int board_init(void)
 
 	sysconf_init();
 
-	if (CONFIG_IS_ENABLED(CONFIG_LED))
+	if (CONFIG_IS_ENABLED(CONFIG_LED)) {
 		led_default_state();
+		setup_led(LEDST_ON);
+	}
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
