Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 409EB35965B
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 09:29:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AC05C56639;
	Fri,  9 Apr 2021 07:29:01 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC530C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 07:28:58 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id l76so3238393pga.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Apr 2021 00:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TdUcscY1Pkvyyi6Q4ieyt+lprcxusutD9081mc/brc8=;
 b=cP2Ml6XbBMsMXvrKhgn1l7zGLXZTbeNhWMACNLz4eZnmaT/ekvqZk4lcGezCbqQ6sB
 NeybfQ6PnTyS72ikrm9jzP1FOrX1yOSAVGmG5EOGCOhHDny0IHzFCJbiLt6yxxhter5b
 lYSTWp9I4Jbb65e5U1fyqxA9VyRMuYnks2Dyjgb953yevBf8e2CtLJkUuxvSuRWKVT5F
 OextWjWIVn3KicG14bs55rvWIYITICsW/vGbyyPW7yIm0UVZDgvEvOW3ADdM/V0vjxvI
 D7BLx0Q/aBq9inW7xyQQGAjG5BJ3/SAcFYADVULNwQxRlQYVqo5ygfbiJebfmnj0Ik0D
 su9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TdUcscY1Pkvyyi6Q4ieyt+lprcxusutD9081mc/brc8=;
 b=oO5hTL0kKazll3wLQDL1R0LyavlVHGvTEUFAhT7E33AVvkyHmHMHcH9pxd6VZdRDJU
 i7vWhe4SainrfQdLb40chSqxcFUa1UHKzJ7xyoLikk6/TXofylQjQlCtNWbT/ZB44YM0
 85ukmAp6fRlF0zxp1ELzVNnENfgafbz2Jv901OOhyUGNnJ+DF9x5TY15IDXKam1hgPGM
 knCOCrn5Xh5/2PxMizumlaJ880SU1bQ7Cxl4fq0YidTTcLwtpIK3onnj1MkO/oxO1RLb
 Tskn1mG2CpUjW2x57U20SmgXT+0AySk57NDn1iW198y/Mv8pCt/3m17JTM8KrvtIvbSA
 9RZQ==
X-Gm-Message-State: AOAM533v+qKDjviyNFOFfaQH/i5bBLAhFTm9rYWS085r+hwsT6pz4+Ab
 u4HNpk/vrB6Q8W+qxPv9OaM=
X-Google-Smtp-Source: ABdhPJwxnyu+8mxE6qNQh/K9srgshTY9d9qsSNiQvQvX1cvSIwZvmhcBJUZmIKelWRDPJpaz847t0g==
X-Received: by 2002:a63:3ecb:: with SMTP id
 l194mr11966098pga.146.1617953337437; 
 Fri, 09 Apr 2021 00:28:57 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id j3sm1344432pfc.49.2021.04.09.00.28.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Apr 2021 00:28:56 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 sjg@chromium.org
Date: Fri,  9 Apr 2021 15:28:40 +0800
Message-Id: <1617953326-3110-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617953326-3110-1-git-send-email-dillon.minfei@gmail.com>
References: <1617953326-3110-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v5 1/7] ARM: dts: stm32: split sdram pin &
	timing parameter into specific board dts
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

As different boards has their own sdram hw connection, mount different
sdram modules, so move sdram timing parameter and pin configuration
to their board device tree.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
v5: no changes

 arch/arm/dts/stm32h7-u-boot.dtsi          | 100 ++----------------------------
 arch/arm/dts/stm32h743i-disco-u-boot.dtsi |  98 +++++++++++++++++++++++++++++
 arch/arm/dts/stm32h743i-eval-u-boot.dtsi  |  98 +++++++++++++++++++++++++++++
 3 files changed, 201 insertions(+), 95 deletions(-)

diff --git a/arch/arm/dts/stm32h7-u-boot.dtsi b/arch/arm/dts/stm32h7-u-boot.dtsi
index 54dd406..84dc765 100644
--- a/arch/arm/dts/stm32h7-u-boot.dtsi
+++ b/arch/arm/dts/stm32h7-u-boot.dtsi
@@ -20,6 +20,7 @@
 		gpio9 = &gpioj;
 		gpio10 = &gpiok;
 		mmc0 = &sdmmc1;
+		pinctrl0 = &pinctrl;
 	};
 
 	soc {
@@ -36,30 +37,6 @@
 			pinctrl-0 = <&fmc_pins>;
 			pinctrl-names = "default";
 			status = "okay";
-
-			/*
-			 * Memory configuration from sdram datasheet IS42S32800G-6BLI
-			 * first bank is bank@0
-			 * second bank is bank@1
-			 */
-			bank1: bank@1 {
-				st,sdram-control = /bits/ 8 <NO_COL_9
-							     NO_ROW_12
-							     MWIDTH_32
-							     BANKS_4
-							     CAS_2
-							     SDCLK_3
-							     RD_BURST_EN
-							     RD_PIPE_DL_0>;
-				st,sdram-timing = /bits/ 8 <TMRD_1
-							    TXSR_1
-							    TRAS_1
-							    TRC_6
-							    TRP_2
-							    TWR_1
-							    TRCD_1>;
-				st,sdram-refcount = <1539>;
-			};
 		};
 	};
 };
@@ -136,77 +113,6 @@
 	compatible = "st,stm32-gpio";
 };
 
-&pinctrl {
-	fmc_pins: fmc@0 {
-		pins {
-			pinmux = <STM32_PINMUX('D', 0, AF12)>,
-				 <STM32_PINMUX('D', 1, AF12)>,
-				 <STM32_PINMUX('D', 8, AF12)>,
-				 <STM32_PINMUX('D', 9, AF12)>,
-				 <STM32_PINMUX('D',10, AF12)>,
-				 <STM32_PINMUX('D',14, AF12)>,
-				 <STM32_PINMUX('D',15, AF12)>,
-
-				 <STM32_PINMUX('E', 0, AF12)>,
-				 <STM32_PINMUX('E', 1, AF12)>,
-				 <STM32_PINMUX('E', 7, AF12)>,
-				 <STM32_PINMUX('E', 8, AF12)>,
-				 <STM32_PINMUX('E', 9, AF12)>,
-				 <STM32_PINMUX('E',10, AF12)>,
-				 <STM32_PINMUX('E',11, AF12)>,
-				 <STM32_PINMUX('E',12, AF12)>,
-				 <STM32_PINMUX('E',13, AF12)>,
-				 <STM32_PINMUX('E',14, AF12)>,
-				 <STM32_PINMUX('E',15, AF12)>,
-
-				 <STM32_PINMUX('F', 0, AF12)>,
-				 <STM32_PINMUX('F', 1, AF12)>,
-				 <STM32_PINMUX('F', 2, AF12)>,
-				 <STM32_PINMUX('F', 3, AF12)>,
-				 <STM32_PINMUX('F', 4, AF12)>,
-				 <STM32_PINMUX('F', 5, AF12)>,
-				 <STM32_PINMUX('F',11, AF12)>,
-				 <STM32_PINMUX('F',12, AF12)>,
-				 <STM32_PINMUX('F',13, AF12)>,
-				 <STM32_PINMUX('F',14, AF12)>,
-				 <STM32_PINMUX('F',15, AF12)>,
-
-				 <STM32_PINMUX('G', 0, AF12)>,
-				 <STM32_PINMUX('G', 1, AF12)>,
-				 <STM32_PINMUX('G', 2, AF12)>,
-				 <STM32_PINMUX('G', 4, AF12)>,
-				 <STM32_PINMUX('G', 5, AF12)>,
-				 <STM32_PINMUX('G', 8, AF12)>,
-				 <STM32_PINMUX('G',15, AF12)>,
-
-				 <STM32_PINMUX('H', 5, AF12)>,
-				 <STM32_PINMUX('H', 6, AF12)>,
-				 <STM32_PINMUX('H', 7, AF12)>,
-				 <STM32_PINMUX('H', 8, AF12)>,
-				 <STM32_PINMUX('H', 9, AF12)>,
-				 <STM32_PINMUX('H',10, AF12)>,
-				 <STM32_PINMUX('H',11, AF12)>,
-				 <STM32_PINMUX('H',12, AF12)>,
-				 <STM32_PINMUX('H',13, AF12)>,
-				 <STM32_PINMUX('H',14, AF12)>,
-				 <STM32_PINMUX('H',15, AF12)>,
-
-				 <STM32_PINMUX('I', 0, AF12)>,
-				 <STM32_PINMUX('I', 1, AF12)>,
-				 <STM32_PINMUX('I', 2, AF12)>,
-				 <STM32_PINMUX('I', 3, AF12)>,
-				 <STM32_PINMUX('I', 4, AF12)>,
-				 <STM32_PINMUX('I', 5, AF12)>,
-				 <STM32_PINMUX('I', 6, AF12)>,
-				 <STM32_PINMUX('I', 7, AF12)>,
-				 <STM32_PINMUX('I', 9, AF12)>,
-				 <STM32_PINMUX('I',10, AF12)>;
-
-			slew-rate = <3>;
-		};
-	};
-};
-
 &pwrcfg {
 	u-boot,dm-pre-reloc;
 };
@@ -222,3 +128,7 @@
 &timer5 {
 	u-boot,dm-pre-reloc;
 };
+
+&pinctrl {
+	u-boot,dm-pre-reloc;
+};
diff --git a/arch/arm/dts/stm32h743i-disco-u-boot.dtsi b/arch/arm/dts/stm32h743i-disco-u-boot.dtsi
index 5965afc..02e28c6 100644
--- a/arch/arm/dts/stm32h743i-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32h743i-disco-u-boot.dtsi
@@ -1,3 +1,101 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <stm32h7-u-boot.dtsi>
+
+&fmc {
+
+	/*
+	 * Memory configuration from sdram datasheet IS42S32800G-6BLI
+	 * first bank is bank@0
+	 * second bank is bank@1
+	 */
+	bank1: bank@1 {
+		st,sdram-control = /bits/ 8 <NO_COL_9
+					     NO_ROW_12
+					     MWIDTH_32
+					     BANKS_4
+					     CAS_2
+					     SDCLK_3
+					     RD_BURST_EN
+					     RD_PIPE_DL_0>;
+		st,sdram-timing = /bits/ 8 <TMRD_1
+					    TXSR_1
+					    TRAS_1
+					    TRC_6
+					    TRP_2
+					    TWR_1
+					    TRCD_1>;
+		st,sdram-refcount = <1539>;
+	};
+};
+
+&pinctrl {
+	fmc_pins: fmc@0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 0, AF12)>,
+				 <STM32_PINMUX('D', 1, AF12)>,
+				 <STM32_PINMUX('D', 8, AF12)>,
+				 <STM32_PINMUX('D', 9, AF12)>,
+				 <STM32_PINMUX('D',10, AF12)>,
+				 <STM32_PINMUX('D',14, AF12)>,
+				 <STM32_PINMUX('D',15, AF12)>,
+
+				 <STM32_PINMUX('E', 0, AF12)>,
+				 <STM32_PINMUX('E', 1, AF12)>,
+				 <STM32_PINMUX('E', 7, AF12)>,
+				 <STM32_PINMUX('E', 8, AF12)>,
+				 <STM32_PINMUX('E', 9, AF12)>,
+				 <STM32_PINMUX('E',10, AF12)>,
+				 <STM32_PINMUX('E',11, AF12)>,
+				 <STM32_PINMUX('E',12, AF12)>,
+				 <STM32_PINMUX('E',13, AF12)>,
+				 <STM32_PINMUX('E',14, AF12)>,
+				 <STM32_PINMUX('E',15, AF12)>,
+
+				 <STM32_PINMUX('F', 0, AF12)>,
+				 <STM32_PINMUX('F', 1, AF12)>,
+				 <STM32_PINMUX('F', 2, AF12)>,
+				 <STM32_PINMUX('F', 3, AF12)>,
+				 <STM32_PINMUX('F', 4, AF12)>,
+				 <STM32_PINMUX('F', 5, AF12)>,
+				 <STM32_PINMUX('F',11, AF12)>,
+				 <STM32_PINMUX('F',12, AF12)>,
+				 <STM32_PINMUX('F',13, AF12)>,
+				 <STM32_PINMUX('F',14, AF12)>,
+				 <STM32_PINMUX('F',15, AF12)>,
+
+				 <STM32_PINMUX('G', 0, AF12)>,
+				 <STM32_PINMUX('G', 1, AF12)>,
+				 <STM32_PINMUX('G', 2, AF12)>,
+				 <STM32_PINMUX('G', 4, AF12)>,
+				 <STM32_PINMUX('G', 5, AF12)>,
+				 <STM32_PINMUX('G', 8, AF12)>,
+				 <STM32_PINMUX('G',15, AF12)>,
+
+				 <STM32_PINMUX('H', 5, AF12)>,
+				 <STM32_PINMUX('H', 6, AF12)>,
+				 <STM32_PINMUX('H', 7, AF12)>,
+				 <STM32_PINMUX('H', 8, AF12)>,
+				 <STM32_PINMUX('H', 9, AF12)>,
+				 <STM32_PINMUX('H',10, AF12)>,
+				 <STM32_PINMUX('H',11, AF12)>,
+				 <STM32_PINMUX('H',12, AF12)>,
+				 <STM32_PINMUX('H',13, AF12)>,
+				 <STM32_PINMUX('H',14, AF12)>,
+				 <STM32_PINMUX('H',15, AF12)>,
+
+				 <STM32_PINMUX('I', 0, AF12)>,
+				 <STM32_PINMUX('I', 1, AF12)>,
+				 <STM32_PINMUX('I', 2, AF12)>,
+				 <STM32_PINMUX('I', 3, AF12)>,
+				 <STM32_PINMUX('I', 4, AF12)>,
+				 <STM32_PINMUX('I', 5, AF12)>,
+				 <STM32_PINMUX('I', 6, AF12)>,
+				 <STM32_PINMUX('I', 7, AF12)>,
+				 <STM32_PINMUX('I', 9, AF12)>,
+				 <STM32_PINMUX('I',10, AF12)>;
+
+			slew-rate = <3>;
+		};
+	};
+};
diff --git a/arch/arm/dts/stm32h743i-eval-u-boot.dtsi b/arch/arm/dts/stm32h743i-eval-u-boot.dtsi
index 5965afc..02e28c6 100644
--- a/arch/arm/dts/stm32h743i-eval-u-boot.dtsi
+++ b/arch/arm/dts/stm32h743i-eval-u-boot.dtsi
@@ -1,3 +1,101 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <stm32h7-u-boot.dtsi>
+
+&fmc {
+
+	/*
+	 * Memory configuration from sdram datasheet IS42S32800G-6BLI
+	 * first bank is bank@0
+	 * second bank is bank@1
+	 */
+	bank1: bank@1 {
+		st,sdram-control = /bits/ 8 <NO_COL_9
+					     NO_ROW_12
+					     MWIDTH_32
+					     BANKS_4
+					     CAS_2
+					     SDCLK_3
+					     RD_BURST_EN
+					     RD_PIPE_DL_0>;
+		st,sdram-timing = /bits/ 8 <TMRD_1
+					    TXSR_1
+					    TRAS_1
+					    TRC_6
+					    TRP_2
+					    TWR_1
+					    TRCD_1>;
+		st,sdram-refcount = <1539>;
+	};
+};
+
+&pinctrl {
+	fmc_pins: fmc@0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 0, AF12)>,
+				 <STM32_PINMUX('D', 1, AF12)>,
+				 <STM32_PINMUX('D', 8, AF12)>,
+				 <STM32_PINMUX('D', 9, AF12)>,
+				 <STM32_PINMUX('D',10, AF12)>,
+				 <STM32_PINMUX('D',14, AF12)>,
+				 <STM32_PINMUX('D',15, AF12)>,
+
+				 <STM32_PINMUX('E', 0, AF12)>,
+				 <STM32_PINMUX('E', 1, AF12)>,
+				 <STM32_PINMUX('E', 7, AF12)>,
+				 <STM32_PINMUX('E', 8, AF12)>,
+				 <STM32_PINMUX('E', 9, AF12)>,
+				 <STM32_PINMUX('E',10, AF12)>,
+				 <STM32_PINMUX('E',11, AF12)>,
+				 <STM32_PINMUX('E',12, AF12)>,
+				 <STM32_PINMUX('E',13, AF12)>,
+				 <STM32_PINMUX('E',14, AF12)>,
+				 <STM32_PINMUX('E',15, AF12)>,
+
+				 <STM32_PINMUX('F', 0, AF12)>,
+				 <STM32_PINMUX('F', 1, AF12)>,
+				 <STM32_PINMUX('F', 2, AF12)>,
+				 <STM32_PINMUX('F', 3, AF12)>,
+				 <STM32_PINMUX('F', 4, AF12)>,
+				 <STM32_PINMUX('F', 5, AF12)>,
+				 <STM32_PINMUX('F',11, AF12)>,
+				 <STM32_PINMUX('F',12, AF12)>,
+				 <STM32_PINMUX('F',13, AF12)>,
+				 <STM32_PINMUX('F',14, AF12)>,
+				 <STM32_PINMUX('F',15, AF12)>,
+
+				 <STM32_PINMUX('G', 0, AF12)>,
+				 <STM32_PINMUX('G', 1, AF12)>,
+				 <STM32_PINMUX('G', 2, AF12)>,
+				 <STM32_PINMUX('G', 4, AF12)>,
+				 <STM32_PINMUX('G', 5, AF12)>,
+				 <STM32_PINMUX('G', 8, AF12)>,
+				 <STM32_PINMUX('G',15, AF12)>,
+
+				 <STM32_PINMUX('H', 5, AF12)>,
+				 <STM32_PINMUX('H', 6, AF12)>,
+				 <STM32_PINMUX('H', 7, AF12)>,
+				 <STM32_PINMUX('H', 8, AF12)>,
+				 <STM32_PINMUX('H', 9, AF12)>,
+				 <STM32_PINMUX('H',10, AF12)>,
+				 <STM32_PINMUX('H',11, AF12)>,
+				 <STM32_PINMUX('H',12, AF12)>,
+				 <STM32_PINMUX('H',13, AF12)>,
+				 <STM32_PINMUX('H',14, AF12)>,
+				 <STM32_PINMUX('H',15, AF12)>,
+
+				 <STM32_PINMUX('I', 0, AF12)>,
+				 <STM32_PINMUX('I', 1, AF12)>,
+				 <STM32_PINMUX('I', 2, AF12)>,
+				 <STM32_PINMUX('I', 3, AF12)>,
+				 <STM32_PINMUX('I', 4, AF12)>,
+				 <STM32_PINMUX('I', 5, AF12)>,
+				 <STM32_PINMUX('I', 6, AF12)>,
+				 <STM32_PINMUX('I', 7, AF12)>,
+				 <STM32_PINMUX('I', 9, AF12)>,
+				 <STM32_PINMUX('I',10, AF12)>;
+
+			slew-rate = <3>;
+		};
+	};
+};
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
