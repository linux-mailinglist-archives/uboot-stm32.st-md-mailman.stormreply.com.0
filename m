Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7F78AC209
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Apr 2024 01:19:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76222C71290;
	Sun, 21 Apr 2024 23:19:11 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C51C5C6DD9A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Apr 2024 23:19:09 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3A48388317;
 Mon, 22 Apr 2024 01:19:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713741549;
 bh=0ty7NCmqc2BPJFeBGg6+tuBDdKGKmnR9Cv2jaqhym/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VeF9x8b5AMCvpGdkKJYKRF9HeSwtIagp/fZ0TiWMP2jn0rSgb69TL5196XPesyuFa
 aybPkwGw529ifmo5v0caAXthElGgPFoSHs1noQzbGVFq8pqGZMeqAds2FS5NbguL/7
 FEzi5tsi13sW2CxSVwL5e/GSj8gqtZ+fXnDlvcZrOqRozSE4u7JA04OkZRk8JmOg5Y
 lSRCg08q+fEl9Gh8mKQtx2oh18bfb1swTW14QJdh+BGlVDD5B9avEoelSu+bjDzpQi
 LUmlrPyGVQioBW4i6nFXUESbKCp9dyL0DypWDlFPZbkMWMaawe+BJByV8noiOA5yXj
 l2b5zU86MbL1g==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 22 Apr 2024 01:16:53 +0200
Message-ID: <20240421231849.194648-7-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240421231849.194648-1-marex@denx.de>
References: <20240421231849.194648-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH 07/19] ARM: dts: stm32: Add alternate pinmux
	for MP13 MCAN2 pins
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

Add another mux option for MCAN2 pins, this is used on
DH electronics STM32MP13xx DHCOR DHSBC board.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp13-pinctrl.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
index b38174504ff..b58bf6c0024 100644
--- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
@@ -188,6 +188,26 @@
 		};
 	};
 
+	m_can2_pins_a: m-can2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 0, AF9)>; /* CAN2_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 0, AF9)>; /* CAN2_RX */
+			bias-disable;
+		};
+	};
+
+	m_can2_sleep_pins_a: m_can2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 0, ANALOG)>, /* CAN2_TX */
+				 <STM32_PINMUX('E', 0, ANALOG)>; /* CAN2_RX */
+		};
+	};
+
 	mcp23017_pins_a: mcp23017-0 {
 		pins {
 			pinmux = <STM32_PINMUX('G', 12, GPIO)>;
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
