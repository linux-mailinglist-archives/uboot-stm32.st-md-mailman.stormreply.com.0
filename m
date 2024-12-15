Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE049F2770
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Dec 2024 00:32:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E887C69063;
	Sun, 15 Dec 2024 23:32:30 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D1DBC57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Dec 2024 23:32:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE3A71048AF66; Mon, 16 Dec 2024 00:32:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1734305542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mZ1TqDvY1cWuKJdV5IkGigloKzC2gc2iO83Z0FHST/8=;
 b=TtbR5V4wlmcedhu5gaC7DNEZCNFk7QfdzAJmegJPBGqgzhIN+3pD7j1ZPjZskAu3DlobMC
 JOOM3ZX7tJiE5rVKiy/PCdP+nC5UjlVk9FVfJh/fKQDUxUaYXQo6fz2OLDHyBz1RhIHH2u
 3Vr3VQ75J5yy+OhC7vx+jP5Mvtws3ZdVVldZpDDuIFwx0K4SAEzGxa9elDyQR37N+1VInp
 6lr2EJkltg2rQ5I8wossFKJFX7376t05Ds2TAk5G9IEIUDoCNK1dpTuOl4Ki88pmshj3AV
 q2CwOHUywZEVFgTCOI7p18T+XAhw/Cu2QfQmz3RAq44jVfQfWtOZvtBt/AYU2w==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 16 Dec 2024 00:31:38 +0100
Message-ID: <20241215233210.569642-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Reinstate missing root
	oscillators on STM32MP15xx
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
RCC driver does need this reference, reinstate it globally.

Signed-off-by: Marek Vasut <marex@denx.de>
---
NOTE: Would be good for 2025.01, but needs to be tested on other systems
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
 arch/arm/dts/stm32mp15-u-boot.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index 66d4c40c6a8..3f57bd5fe0f 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -186,6 +186,9 @@
 	bootph-all;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	clock-names = "hse", "hsi", "csi", "lse", "lsi";
+	clocks = <&clk_hse>, <&clk_hsi>, <&clk_csi>,
+		 <&clk_lse>, <&clk_lsi>;
 };
 
 &usart1 {
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
