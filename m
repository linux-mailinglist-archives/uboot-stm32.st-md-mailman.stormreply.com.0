Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D680F34A569
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Mar 2021 11:24:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18321C57B79;
	Fri, 26 Mar 2021 10:24:42 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0271CC57B60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 10:24:40 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso2248656pjb.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 03:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=O98zdgKi44KzEu06FY/m0mQxZJXeHVcSr89LmEkUQC8=;
 b=l6m8//7NiUKMqO8dTQG2b1LrmKxOQMFVpHipqezD2EAGjIbk1LmaLSr9UCn7z0HUEU
 1ES8crsUpM0Z2QP6dqDUYyj4msNEYD4Pa2On2FwTcr1+Kbxye1efOrRhuA9OSN8QP+n7
 QmR4jZnV5U24dX7obP+bzx54NSuJLmr1znf5qWS0JTHCXeOmHpFFHI/F1EFhtm9FaMTC
 Pf04fh5wY+wUjhWLYmQEN/LwCNhTI/Xgq1exQ5PwSBbIuAVX1uhSQEMln1kq7TEaDFlC
 VOxx6kCUO4piozgvzw+Ilr61GJya7UotkkhYk5D6CCZb8OOwIBJZyaDw2eoo2a/5me0T
 Ii3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=O98zdgKi44KzEu06FY/m0mQxZJXeHVcSr89LmEkUQC8=;
 b=cn7kDehcA0AUEUBGJu1Hq7mJTZFUXwED10fcy297C3afMq+pAAu1nXZ+9eVq7gQywJ
 aKp3Os9hCscM2z3b1BD2PRlTMdQcbEwSXJEtXtN9MyjtqSrXs/ZQ+ZEWPPnugcmv5WOr
 51+W8BZanOn0mPBF3IrGtzMRlbh9PKHBRLgwhd5OmJsQ1ENBevNHa+3jhZ/3+LS0NKdu
 7yZzdzawQLaid7sThbrx3zJn9181gsV5xuZeLSkj4qRZbXiH8DArWjU8DJENN3Uptjkc
 3qG59G1vm+h7XRGyq2LiOuBQeZefsht4NdZDHYCcVf9v7uvDMWWfttBX41jpQ4qG3mV+
 xobw==
X-Gm-Message-State: AOAM530RDGXgBU8bXNamo7Jo1kfUGSGeIn5sYk9sqPZHM9wjWFT0ruBV
 bD4p7iz+oixXaDplSjYR0jc=
X-Google-Smtp-Source: ABdhPJzWv4uhLc6aFXGVXprAbWR2HoMW19gGl9N4XYtSDlLpMvyI1LI5uaHnqBrbeIFEigscMulZ6Q==
X-Received: by 2002:a17:90b:100a:: with SMTP id
 gm10mr13016434pjb.0.1616754278486; 
 Fri, 26 Mar 2021 03:24:38 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id ds3sm8126595pjb.23.2021.03.26.03.24.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 03:24:37 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Fri, 26 Mar 2021 18:24:22 +0800
Message-Id: <1616754267-13845-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616754267-13845-1-git-send-email-dillon.minfei@gmail.com>
References: <1616754267-13845-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 1/6] ARM: dts: stm32: split sdram pin &
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

v2: add 'pinctrl0 = &pinctrl;' for configure fmc pins (after move gpio(a..k)
register defines to stm32h743.dtsi, need add this)

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
