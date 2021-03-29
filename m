Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1CA34C219
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Mar 2021 05:05:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63004C5719D;
	Mon, 29 Mar 2021 03:05:05 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EBBDC5719D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 03:05:03 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id a12so77504pfc.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Mar 2021 20:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ingdbo9ihTSJeWVJUy7/jktVhdou1+tEhn3nO6lJd0U=;
 b=Oy6I8B3I8uCCOzvNPjJjht0PD4W2AHzK+nCKqu02zkDvfcby0NTCBAjwjYv8kyKg8c
 ZU93O98gqSMtmkjvifF/p6zQSo/5P+sfl/X+acubhedXsraANXhs74s46z0h5KL4avVG
 Nkgi90SyNj1anBnLGfPCVkNgPzsTEJQyzDc+dNPsGlw3ZDg4/CX+Bvo92Mpa0BQvAFB0
 NzAzv1wiYcU5W6JaAUHXknRVK1SvlL11EQI5jYK8jB2+2smEmjNEX/kR6+wIV1nvCca6
 teZq8RfFmz6ReIvevxuVCmHAJhxh/EAVuJqAWhAZ1yEVxdVVA5bqKUa4Sr3JqgSZkvIL
 K7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ingdbo9ihTSJeWVJUy7/jktVhdou1+tEhn3nO6lJd0U=;
 b=FqXwQ5fT5KmBCTzZo/C2Sc9+igCaPRU0/R1kGe0lKAk3p/U90SF20VgQoicWSqFzUe
 Dv1/CfCKlaA9dapbMja22xG0rZHWTVrGi6sWo/hiTQBpcDyit/zMmBbOIUYNgwMVxUXU
 hWXdCJAHTk/5NMFh31Q97m0uUdpAZYCb8jnlswTrI6rUqhJeE4EAltDz7mD2+4vhKiHw
 RElIasv8aovIPW8PT8RVONZI4Yt8+6OXaDM3BJstyvQCCHnHv7emw6Tt3odQCJdPWSPq
 JOTq6ovsfdwd87/Dv4rLHutAAkJRZWgBBE0K4V5CrLdNSZwHPXbEYhFcDbSydKpNedMW
 IGlg==
X-Gm-Message-State: AOAM531oXdj2kxK7K0i+MHhtJVhC8R4Q6beWHGVLUeXfNCLccvavfqvS
 4NqQ5SfoCW9jHu+RuM9wPNM=
X-Google-Smtp-Source: ABdhPJwo0Q9hrSC2xpCofw3hz3SgILxkZtDKu9jyPTA/Gnr3iDTLs+j1N/DCfbgbUBZUYV6fJ83f0g==
X-Received: by 2002:a63:4512:: with SMTP id s18mr1783572pga.275.1616987101989; 
 Sun, 28 Mar 2021 20:05:01 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id a204sm15331914pfd.106.2021.03.28.20.04.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Mar 2021 20:05:01 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Mon, 29 Mar 2021 11:04:46 +0800
Message-Id: <1616987091-3432-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
References: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 1/6] ARM: dts: stm32: split sdram pin &
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
v3: no changes

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
