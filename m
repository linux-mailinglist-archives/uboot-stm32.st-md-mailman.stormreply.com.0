Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 954169F276D
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Dec 2024 00:30:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41CB3C71292;
	Sun, 15 Dec 2024 23:30:50 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA6C3C69063
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Dec 2024 23:30:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9F9A71048B8CC; Mon, 16 Dec 2024 00:30:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1734305441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fbxqsGpQ52zL7e/JI6Kh5yJz3imCihdPuGVdQch2H8Y=;
 b=Lyckr3WahWKaCI9kb3HBEu+x0+LogclqMqE1kR2FDJaY8e3bNaiLqT+2S0gj751lF6XVXO
 kjTeW8XKB+J1qg8TbqlNBLGEt4FYLNekw/ZihOHfuHXMmYndlkG9BZwNfXCBglrw+Yk2+v
 xNRaEl+FYynM6eoo6UfCs+If+C4nFocuWIJwisEK0gyXnETV0+6km4cGWcCsMI7Ot0s8JB
 tYqbYRixp5BYwE1CqtoCp3meEc2Vq164mGBdwxymZVOwWtaYt18tfSq40Knx24ApQK63HU
 HxvyIHG+I8XwjEG1+RSDmc3feRLW1apgdQfO/XScfIp1nk7hlz7eiOXGD4Ywvg==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 16 Dec 2024 00:29:12 +0100
Message-ID: <20241215233011.569287-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: [Uboot-stm32] [PATCH 1/4] ARM: dts: stm32: Reinstate missing root
	oscillators on DH STM32MP15xx DHCOR
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

The root oscillators reference used to be in rcc node since
3d15245502c4 ("ARM: dts: stm32mp1: explicit clock reference needed by RCC clock driver")
however this is not part of upstream stm32mp151.dtsi . The
RCC driver does need this reference, reinstate it locally.

Signed-off-by: Marek Vasut <marex@denx.de>
---
NOTE: For 2025.01
---
Cc: Igor Opaniuk <igor.opaniuk@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
index 08439342cb2..ab162f39473 100644
--- a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
@@ -112,6 +112,10 @@
 };
 
 &rcc {
+	clock-names = "hse", "hsi", "csi", "lse", "lsi";
+	clocks = <&clk_hse>, <&clk_hsi>, <&clk_csi>,
+		 <&clk_lse>, <&clk_lsi>;
+
 	st,clksrc = <
 		CLK_MPU_PLL1P
 		CLK_AXI_PLL2P
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
