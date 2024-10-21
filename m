Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7B49A9014
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2024 21:45:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC071C78012;
	Mon, 21 Oct 2024 19:45:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0616C6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 19:45:09 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id ABB1A8897F;
 Mon, 21 Oct 2024 21:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729539908;
 bh=bJ8wWiirR0r6Ln9cAcVXgU7ictH2UzfTFqgiQUIyfUc=;
 h=From:To:Cc:Subject:Date:From;
 b=XdRmYwyUfwaU8fWoxTHuMxoZwzphj8ZI+GBLOH8FsG5kDwVeYLzl8/mhVIdGkXEyP
 4mA4NiSgbFRraABdf35G3hRvZvs0aI5QrFQk/S/xFASomm3Q8bvsLORX2x3H0P8iRg
 WUhl4iYp+O+gDEMg5PZpOlDp/OoNKAQue1ksGb2aeejR1KIkBwfUlp5CwPm95p8mIQ
 kKJg3/7eMpquX/2B3fpP+kD9c8b88VmUrtKPhT9kFRKiYLiWgwGGTgKj7NAAy9bdbU
 1jdblL8WPIlfXi22H2FbnFwZjl+m77GFhDE1ZrN4G0J/NZn9/u0eG83DAxsz2V9PX/
 Wc5fJesCUmcYg==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 21 Oct 2024 21:44:26 +0200
Message-ID: <20241021194451.202977-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Drop duplicate pinmux on DH
	STM32 DHCOM
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

The ethernet0_rmii_pins_a pinmux change has no effect on any
DHSOM based hardware. The mco2_pins_a and mco2_sleep_pins_a
are both part of stm32mp15-pinctrl.dtsi . Drop both pinmux
changes.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi | 28 ----------------------
 1 file changed, 28 deletions(-)

diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
index dd67e960a64..0d9b2201e90 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
@@ -36,17 +36,6 @@
 	/delete-property/ st,eth-ref-clk-sel;
 };
 
-&ethernet0_rmii_pins_a {
-	pins1 {
-		pinmux = <STM32_PINMUX('G', 13, AF11)>, /* ETH1_RMII_TXD0 */
-			 <STM32_PINMUX('G', 14, AF11)>, /* ETH1_RMII_TXD1 */
-			 <STM32_PINMUX('B', 11, AF11)>, /* ETH1_RMII_TX_EN */
-			 <STM32_PINMUX('A', 1, AF11)>,  /* ETH1_RMII_REF_CLK */
-			 <STM32_PINMUX('A', 2, AF11)>,  /* ETH1_MDIO */
-			 <STM32_PINMUX('C', 1, AF11)>;  /* ETH1_MDC */
-	};
-};
-
 &i2c4 {
 	bootph-all;
 	bootph-pre-ram;
@@ -66,23 +55,6 @@
 	/delete-property/ reset-gpios;
 };
 
-&pinctrl {
-	mco2_pins_a: mco2-0 {
-		pins {
-			pinmux = <STM32_PINMUX('G', 2, AF1)>; /* MCO2 */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <2>;
-		};
-	};
-
-	mco2_sleep_pins_a: mco2-sleep-0 {
-		pins {
-			pinmux = <STM32_PINMUX('G', 2, ANALOG)>; /* MCO2 */
-		};
-	};
-};
-
 &pmic {
 	bootph-all;
 	bootph-pre-ram;
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
