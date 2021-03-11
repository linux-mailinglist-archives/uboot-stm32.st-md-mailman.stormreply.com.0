Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEAE336C94
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Mar 2021 07:55:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A130C5718F;
	Thu, 11 Mar 2021 06:55:33 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C973BC5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 06:44:11 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so8575000pjq.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 22:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VOqaVuVtemOjSkglyDQstNBsg0PIr+Y4i4LQrcdG1No=;
 b=Js/QkpevgkIHIKQlGk74wUmpmf0PAAQgl9NYI/LcZWZ2h4OHAEvhsYz2Os7/qqGtGP
 BvptV9NcbxPfTAqsrPU2KhLWMvFLRS8+Wz/GW81TV/z5qtOSKdXKyZS+9GyZsDT4cezn
 cUx1I3SPuFc3w2szeQyt9M8q232rrSJP+1FKIlfkLwqRg1jftgzetDhY/pQXVZFeYntK
 VphYORLxfdWjaV7H3q38c6lEuH3bRbUWHEGM0QEPkVN+0SU5kFS+SaqpE7t8lZH4oHZu
 8CBvIzOqF2vY6EMkm9DT2bl410eLkkrak9EyIcEdedsS0Z/jmDRtr3qStGT2OAg2F/cP
 djBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VOqaVuVtemOjSkglyDQstNBsg0PIr+Y4i4LQrcdG1No=;
 b=jMg9OwpWa8fHKma52OZ39LwhY+UM//0VqCxijNwR/NbSzKZ8C7PMhgRpqbXvR+Y85n
 J947yVqxUbYQ8dzTfoODOtDbZSa6nKBHSybF+XQQ7q6NS8O0wjw5qxoSGjNgGK9+vySm
 1Or3UonvjWtG2jXFgtQtEmznEVY8HSWSF6XLwbkylZ/+HMVKx9YH1XNBZBELq/dwROgM
 /z2oUZt/R8moAwtRolWt4NjQ0NJ4nq6lU7tAaQu5FUTFMSk9h97gqNyZaCKqwak3VD0t
 rIPP/XoBHmdi0+Qaf1cYRcE/9f0FSx00/og9NLvMPu15Xd8FkTRyshh2uQE80u7NV15+
 zcjQ==
X-Gm-Message-State: AOAM533i93TV/zSS2eaUpgXFVuqt2MOAcrC0cbvJNjJPNTAy460EQKq3
 eZKuRedOaXbTurc/0dfayYA=
X-Google-Smtp-Source: ABdhPJx+jw2me3sqAFGneryDI8n+SuFXu+xuC5NlgzI1URtiXr9K3yw1tlv1XcC6XIbUgNtDiXe2uw==
X-Received: by 2002:a17:90b:4a46:: with SMTP id
 lb6mr7647810pjb.87.1615445050504; 
 Wed, 10 Mar 2021 22:44:10 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id i17sm1446652pfq.135.2021.03.10.22.44.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Mar 2021 22:44:10 -0800 (PST)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Thu, 11 Mar 2021 14:43:57 +0800
Message-Id: <1615445040-13757-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
References: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Thu, 11 Mar 2021 06:55:30 +0000
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH 1/4] ARM: dts: stm32: split sdram pin & timing
	parameter into specific board dts
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
---
 arch/arm/dts/stm32h7-u-boot.dtsi          | 95 ------------------------------
 arch/arm/dts/stm32h743i-disco-u-boot.dtsi | 98 +++++++++++++++++++++++++++++++
 arch/arm/dts/stm32h743i-eval-u-boot.dtsi  | 98 +++++++++++++++++++++++++++++++
 3 files changed, 196 insertions(+), 95 deletions(-)

diff --git a/arch/arm/dts/stm32h7-u-boot.dtsi b/arch/arm/dts/stm32h7-u-boot.dtsi
index 54dd406..e34d066 100644
--- a/arch/arm/dts/stm32h7-u-boot.dtsi
+++ b/arch/arm/dts/stm32h7-u-boot.dtsi
@@ -36,30 +36,6 @@
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
@@ -136,77 +112,6 @@
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
