Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EC0764241
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Jul 2023 00:45:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2107C6B45B;
	Wed, 26 Jul 2023 22:45:55 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21F65C6B45A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 22:45:55 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5655386768;
 Thu, 27 Jul 2023 00:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1690411554;
 bh=AdnUEnQ0F1VFoiqkUkI9crOgM8z7gdXNgQFhskce9SM=;
 h=From:To:Cc:Subject:Date:From;
 b=KopHuhxpBJ5s+mKIPajWwAZCeiN4iLhdwDTEMkcnBMyh2AWcWebizy/LOI5s7tcj/
 m05TL72/7H860gDrfW48nW823ldbB0PexNadRu0qairH82wAXkHdOzDEQWzpBbE+zw
 pD4vmSxbvFmmj8Gnuxxilp21Ydxth10/E5UntsPPYPvP5duEpSC7/uuNFL4t3VQky6
 btxFQq/HK2DqtX+JRmzjAwW77U3fw0j30jMfqjV3sBN7bCPDBFktobLodLFqAh++Sd
 QFu0KstfSMPp9TItwFvmxSsmQiKBl5cERMchsDRKW6ndKdzoXpYzWPaGDL1Nh2T29J
 apF776X3S8ToA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Thu, 27 Jul 2023 00:45:37 +0200
Message-Id: <20230726224537.360161-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Switch DWMAC RMII clock to
	MCO2 on DHCOM
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

The DHCOM SoM has two options for supplying ETHRX clock to the DWMAC
block and PHY. Either (1) ETHCK_K generates 50 MHz clock on ETH_CLK
pad for the PHY and the same 50 MHz clock are fed back to ETHRX via
internal eth_clk_fb clock connection OR (2) ETH_CLK is not used at
all, MCO2 generates 50 MHz clock on MCO2 output pad for the PHY and
the same MCO2 clock are fed back into ETHRX via ETH_RX_CLK input pad
using external pad-to-pad connection.

Option (1) has two downsides. ETHCK_K is supplied directly from either
PLL3_Q or PLL4_P, hence the PLL output is limited to exactly 50 MHz and
since the same PLL output is also used to supply SDMMC blocks, the
performance of SD and eMMC access is affected. The second downside is
that using this option, the EMI of the SoM is higher.

Option (2) solves both of those problems, so implement it here. In this
case, the PLL4_P is no longer limited and can be operated faster, at
100 MHz, which improves SDMMC performance (read performance is improved
from ~41 MiB/s to ~57 MiB/s with dd if=/dev/mmcblk1 of=/dev/null bs=64M
count=1). The EMI interference also decreases.

Ported from Linux kernel commit
73ab99aad50cd ("ARM: dts: stm32: Switch DWMAC RMII clock to MCO2 on DHCOM")

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp15xx-dhcom-som.dtsi | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
index 83e2c87713f..238a611192e 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
@@ -118,13 +118,12 @@
 
 &ethernet0 {
 	status = "okay";
-	pinctrl-0 = <&ethernet0_rmii_pins_a>;
-	pinctrl-1 = <&ethernet0_rmii_sleep_pins_a>;
+	pinctrl-0 = <&ethernet0_rmii_pins_c &mco2_pins_a>;
+	pinctrl-1 = <&ethernet0_rmii_sleep_pins_c &mco2_sleep_pins_a>;
 	pinctrl-names = "default", "sleep";
 	phy-mode = "rmii";
 	max-speed = <100>;
 	phy-handle = <&phy0>;
-	st,eth-ref-clk-sel;
 
 	mdio0 {
 		#address-cells = <1>;
@@ -136,7 +135,7 @@
 			/* LAN8710Ai */
 			compatible = "ethernet-phy-id0007.c0f0",
 				     "ethernet-phy-ieee802.3-c22";
-			clocks = <&rcc ETHCK_K>;
+			clocks = <&rcc CK_MCO2>;
 			reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <500>;
 			reset-deassert-us = <500>;
@@ -446,6 +445,21 @@
 	};
 };
 
+&rcc {
+	/* Connect MCO2 output to ETH_RX_CLK input via pad-pad connection */
+	clocks = <&rcc CK_MCO2>;
+	clock-names = "ETH_RX_CLK/ETH_REF_CLK";
+
+	/*
+	 * Set PLL4P output to 100 MHz to supply SDMMC with faster clock,
+	 * set MCO2 output to 50 MHz to supply ETHRX clock with PLL4P/2,
+	 * so that MCO2 behaves as a divider for the ETHRX clock here.
+	 */
+	assigned-clocks = <&rcc CK_MCO2>, <&rcc PLL4_P>;
+	assigned-clock-parents = <&rcc PLL4_P>;
+	assigned-clock-rates = <50000000>, <100000000>;
+};
+
 &rng1 {
 	status = "okay";
 };
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
