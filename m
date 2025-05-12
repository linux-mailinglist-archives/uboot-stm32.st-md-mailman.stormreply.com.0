Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CAAAB3EE6
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 May 2025 19:22:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9CBCC7A82D;
	Mon, 12 May 2025 17:22:26 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0365C7A82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 17:22:25 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Zx5yT3VPGz9stL;
 Mon, 12 May 2025 19:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEBCnKWMya6FW2bsjfAnOy7t/hQr8bDilgKI0CVR4nw=;
 b=Glh6mxRRYXaytX1iZEWq9xn56vgOEPtHaZfN03HfvB0SRa+PjoVlFrY/xoiiNxU5jMuMsh
 JnXN+PRFahwsekwlbxNbpMHEvDauLMkguLBEHE7rJuY9eUxfAUrFiv0EqYTquCfesSHDWW
 AQ6knYQx9BG9eIJ2OhHYzmA/4npEjdElUowBQiQY32DabCYUPY08EUgQE2S/rM/zYD9SXp
 HNNl/So/G7o/J6C78v5ZydTgbIO747GfexACU5mK90vEc2p3b7xMuhiEzpqSEnY+MoRSWS
 E/xP1U8ORCz/hWUFuIGY1EhEQDAWt0An8Xtw3/6Jfai60+eLSrz7HXtDKFZgqA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEBCnKWMya6FW2bsjfAnOy7t/hQr8bDilgKI0CVR4nw=;
 b=BeYWxh/NXVAqC9rM+1jj2MuyFIuGi1g5RnVuYN1vSrXhoqgDIi76tTXOXKVgXL+1J1knEA
 v5Y13OkCTw+OpnYesibVmcNbh9wvjjE8TsH52rkJHkTE3qYUrGRNG3CDYLrHsa+fvc/IoQ
 S4lvnlIpBEwgsB1Tf25fk+skVXl+UJgOMsKIrWVEoYE69ZBVoeNy+lNLSQiNby1kTfN/z6
 TgRgUlyY+3CcV0eX7HhTaR7Ly1rPlfDbcWd/FLiCXo813yKuzzNqfYKmPzayPEkovTA2h6
 KwDx+t1JJ5mXIfqaWD1aRiY5R6FriXEwAq6A4pvbcA1PjwhZd9HFoMlP/qwRoQ==
To: u-boot@lists.denx.de
Date: Mon, 12 May 2025 19:21:33 +0200
Message-ID: <20250512172149.150214-7-marek.vasut@mailbox.org>
In-Reply-To: <20250512172149.150214-1-marek.vasut@mailbox.org>
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: 4ab3mwacn6pyewi839qsayg3piyuwjkd
X-MBO-RS-ID: 29c7be93e5c737a09cb
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: [Uboot-stm32] [PATCH 06/10] ARM: dts: stm32: Add stm32mp13-ddr.dtsi
	template
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

Factor out common parts of STM32MP15xx DRAM controller configuration DT
description into stm32mp1-ddr.dtsi and introduce stm32mp13-ddr.dtsi which
describes STM32MP13xx DRAM controller configuration in DT.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Cheick Traore <cheick.traore@foss.st.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Lionel Debieve <lionel.debieve@foss.st.com>
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp1-ddr.dtsi  | 187 ++++++++++++++++++++++++++++++++
 arch/arm/dts/stm32mp13-ddr.dtsi |  49 +++++++++
 arch/arm/dts/stm32mp15-ddr.dtsi | 170 +----------------------------
 3 files changed, 237 insertions(+), 169 deletions(-)
 create mode 100644 arch/arm/dts/stm32mp1-ddr.dtsi
 create mode 100644 arch/arm/dts/stm32mp13-ddr.dtsi

diff --git a/arch/arm/dts/stm32mp1-ddr.dtsi b/arch/arm/dts/stm32mp1-ddr.dtsi
new file mode 100644
index 00000000000..da9f9fac4b8
--- /dev/null
+++ b/arch/arm/dts/stm32mp1-ddr.dtsi
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright : STMicroelectronics 2018
+ */
+#include <linux/stringify.h>
+
+#ifdef CONFIG_SPL
+&ddr {
+	config-DDR_MEM_COMPATIBLE {
+		bootph-all;
+
+		compatible = __stringify(st,DDR_MEM_COMPATIBLE);
+
+		st,mem-name = DDR_MEM_NAME;
+		st,mem-speed = <DDR_MEM_SPEED>;
+		st,mem-size = <DDR_MEM_SIZE>;
+
+		st,ctl-reg = <
+			DDR_MSTR
+			DDR_MRCTRL0
+			DDR_MRCTRL1
+			DDR_DERATEEN
+			DDR_DERATEINT
+			DDR_PWRCTL
+			DDR_PWRTMG
+			DDR_HWLPCTL
+			DDR_RFSHCTL0
+			DDR_RFSHCTL3
+			DDR_CRCPARCTL0
+			DDR_ZQCTL0
+			DDR_DFITMG0
+			DDR_DFITMG1
+			DDR_DFILPCFG0
+			DDR_DFIUPD0
+			DDR_DFIUPD1
+			DDR_DFIUPD2
+			DDR_DFIPHYMSTR
+			DDR_ODTMAP
+			DDR_DBG0
+			DDR_DBG1
+			DDR_DBGCMD
+			DDR_POISONCFG
+			DDR_PCCFG
+		>;
+
+		st,ctl-timing = <
+			DDR_RFSHTMG
+			DDR_DRAMTMG0
+			DDR_DRAMTMG1
+			DDR_DRAMTMG2
+			DDR_DRAMTMG3
+			DDR_DRAMTMG4
+			DDR_DRAMTMG5
+			DDR_DRAMTMG6
+			DDR_DRAMTMG7
+			DDR_DRAMTMG8
+			DDR_DRAMTMG14
+			DDR_ODTCFG
+		>;
+
+		st,ctl-map = <
+			DDR_ADDRMAP1
+			DDR_ADDRMAP2
+			DDR_ADDRMAP3
+			DDR_ADDRMAP4
+			DDR_ADDRMAP5
+			DDR_ADDRMAP6
+			DDR_ADDRMAP9
+			DDR_ADDRMAP10
+			DDR_ADDRMAP11
+		>;
+
+
+		/*
+		 * Both st,ctl-perf and st,phy-reg differ
+		 * between STM32MP13xx and STM32MP15xx due
+		 * to 16bit and 32bit DRAM bus respectively
+		 * on these SoCs.
+		 */
+
+		st,phy-timing = <
+			DDR_PTR0
+			DDR_PTR1
+			DDR_PTR2
+			DDR_DTPR0
+			DDR_DTPR1
+			DDR_DTPR2
+			DDR_MR0
+			DDR_MR1
+			DDR_MR2
+			DDR_MR3
+		>;
+
+		status = "okay";
+	};
+};
+#endif
+
+#undef DDR_MEM_COMPATIBLE
+#undef DDR_MEM_NAME
+#undef DDR_MEM_SPEED
+#undef DDR_MEM_SIZE
+
+#undef DDR_MSTR
+#undef DDR_MRCTRL0
+#undef DDR_MRCTRL1
+#undef DDR_DERATEEN
+#undef DDR_DERATEINT
+#undef DDR_PWRCTL
+#undef DDR_PWRTMG
+#undef DDR_HWLPCTL
+#undef DDR_RFSHCTL0
+#undef DDR_RFSHCTL3
+#undef DDR_RFSHTMG
+#undef DDR_CRCPARCTL0
+#undef DDR_DRAMTMG0
+#undef DDR_DRAMTMG1
+#undef DDR_DRAMTMG2
+#undef DDR_DRAMTMG3
+#undef DDR_DRAMTMG4
+#undef DDR_DRAMTMG5
+#undef DDR_DRAMTMG6
+#undef DDR_DRAMTMG7
+#undef DDR_DRAMTMG8
+#undef DDR_DRAMTMG14
+#undef DDR_ZQCTL0
+#undef DDR_DFITMG0
+#undef DDR_DFITMG1
+#undef DDR_DFILPCFG0
+#undef DDR_DFIUPD0
+#undef DDR_DFIUPD1
+#undef DDR_DFIUPD2
+#undef DDR_DFIPHYMSTR
+#undef DDR_ADDRMAP1
+#undef DDR_ADDRMAP2
+#undef DDR_ADDRMAP3
+#undef DDR_ADDRMAP4
+#undef DDR_ADDRMAP5
+#undef DDR_ADDRMAP6
+#undef DDR_ADDRMAP9
+#undef DDR_ADDRMAP10
+#undef DDR_ADDRMAP11
+#undef DDR_ODTCFG
+#undef DDR_ODTMAP
+#undef DDR_SCHED
+#undef DDR_SCHED1
+#undef DDR_PERFHPR1
+#undef DDR_PERFLPR1
+#undef DDR_PERFWR1
+#undef DDR_DBG0
+#undef DDR_DBG1
+#undef DDR_DBGCMD
+#undef DDR_POISONCFG
+#undef DDR_PCCFG
+#undef DDR_PCFGR_0
+#undef DDR_PCFGW_0
+#undef DDR_PCFGQOS0_0
+#undef DDR_PCFGQOS1_0
+#undef DDR_PCFGWQOS0_0
+#undef DDR_PCFGWQOS1_0
+#undef DDR_PCFGR_1
+#undef DDR_PCFGW_1
+#undef DDR_PCFGQOS0_1
+#undef DDR_PCFGQOS1_1
+#undef DDR_PCFGWQOS0_1
+#undef DDR_PCFGWQOS1_1
+#undef DDR_PGCR
+#undef DDR_PTR0
+#undef DDR_PTR1
+#undef DDR_PTR2
+#undef DDR_ACIOCR
+#undef DDR_DXCCR
+#undef DDR_DSGCR
+#undef DDR_DCR
+#undef DDR_DTPR0
+#undef DDR_DTPR1
+#undef DDR_DTPR2
+#undef DDR_MR0
+#undef DDR_MR1
+#undef DDR_MR2
+#undef DDR_MR3
+#undef DDR_ODTCR
+#undef DDR_ZQ0CR1
+#undef DDR_DX0GCR
+#undef DDR_DX1GCR
+#undef DDR_DX2GCR
+#undef DDR_DX3GCR
diff --git a/arch/arm/dts/stm32mp13-ddr.dtsi b/arch/arm/dts/stm32mp13-ddr.dtsi
new file mode 100644
index 00000000000..30d8c5014e0
--- /dev/null
+++ b/arch/arm/dts/stm32mp13-ddr.dtsi
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright : STMicroelectronics 2018
+ */
+#ifdef CONFIG_SPL
+&ddr {
+	clocks = <&rcc AXIDCG>,
+		 <&rcc DDRC1>,
+		 <&rcc DDRPHYC>,
+		 <&rcc DDRCAPB>,
+		 <&rcc DDRPHYCAPB>;
+
+	clock-names = "axidcg",
+		      "ddrc1",
+		      "ddrphyc",
+		      "ddrcapb",
+		      "ddrphycapb";
+
+	config-DDR_MEM_COMPATIBLE {
+		st,ctl-perf = <
+			DDR_SCHED
+			DDR_SCHED1
+			DDR_PERFHPR1
+			DDR_PERFLPR1
+			DDR_PERFWR1
+			DDR_PCFGR_0
+			DDR_PCFGW_0
+			DDR_PCFGQOS0_0
+			DDR_PCFGQOS1_0
+			DDR_PCFGWQOS0_0
+			DDR_PCFGWQOS1_0
+		>;
+
+		st,phy-reg = <
+			DDR_PGCR
+			DDR_ACIOCR
+			DDR_DXCCR
+			DDR_DSGCR
+			DDR_DCR
+			DDR_ODTCR
+			DDR_ZQ0CR1
+			DDR_DX0GCR
+			DDR_DX1GCR
+		>;
+	};
+};
+#endif
+
+#include "stm32mp1-ddr.dtsi"
diff --git a/arch/arm/dts/stm32mp15-ddr.dtsi b/arch/arm/dts/stm32mp15-ddr.dtsi
index 48b0828828f..f18fdaeab68 100644
--- a/arch/arm/dts/stm32mp15-ddr.dtsi
+++ b/arch/arm/dts/stm32mp15-ddr.dtsi
@@ -2,8 +2,6 @@
 /*
  * Copyright : STMicroelectronics 2018
  */
-#include <linux/stringify.h>
-
 #ifdef CONFIG_SPL
 &ddr {
 	clocks = <&rcc AXIDCG>,
@@ -21,69 +19,6 @@
 		      "ddrphycapb";
 
 	config-DDR_MEM_COMPATIBLE {
-		bootph-all;
-
-		compatible = __stringify(st,DDR_MEM_COMPATIBLE);
-
-		st,mem-name = DDR_MEM_NAME;
-		st,mem-speed = <DDR_MEM_SPEED>;
-		st,mem-size = <DDR_MEM_SIZE>;
-
-		st,ctl-reg = <
-			DDR_MSTR
-			DDR_MRCTRL0
-			DDR_MRCTRL1
-			DDR_DERATEEN
-			DDR_DERATEINT
-			DDR_PWRCTL
-			DDR_PWRTMG
-			DDR_HWLPCTL
-			DDR_RFSHCTL0
-			DDR_RFSHCTL3
-			DDR_CRCPARCTL0
-			DDR_ZQCTL0
-			DDR_DFITMG0
-			DDR_DFITMG1
-			DDR_DFILPCFG0
-			DDR_DFIUPD0
-			DDR_DFIUPD1
-			DDR_DFIUPD2
-			DDR_DFIPHYMSTR
-			DDR_ODTMAP
-			DDR_DBG0
-			DDR_DBG1
-			DDR_DBGCMD
-			DDR_POISONCFG
-			DDR_PCCFG
-		>;
-
-		st,ctl-timing = <
-			DDR_RFSHTMG
-			DDR_DRAMTMG0
-			DDR_DRAMTMG1
-			DDR_DRAMTMG2
-			DDR_DRAMTMG3
-			DDR_DRAMTMG4
-			DDR_DRAMTMG5
-			DDR_DRAMTMG6
-			DDR_DRAMTMG7
-			DDR_DRAMTMG8
-			DDR_DRAMTMG14
-			DDR_ODTCFG
-		>;
-
-		st,ctl-map = <
-			DDR_ADDRMAP1
-			DDR_ADDRMAP2
-			DDR_ADDRMAP3
-			DDR_ADDRMAP4
-			DDR_ADDRMAP5
-			DDR_ADDRMAP6
-			DDR_ADDRMAP9
-			DDR_ADDRMAP10
-			DDR_ADDRMAP11
-		>;
-
 		st,ctl-perf = <
 			DDR_SCHED
 			DDR_SCHED1
@@ -117,111 +52,8 @@
 			DDR_DX2GCR
 			DDR_DX3GCR
 		>;
-
-		st,phy-timing = <
-			DDR_PTR0
-			DDR_PTR1
-			DDR_PTR2
-			DDR_DTPR0
-			DDR_DTPR1
-			DDR_DTPR2
-			DDR_MR0
-			DDR_MR1
-			DDR_MR2
-			DDR_MR3
-		>;
-
-		status = "okay";
 	};
 };
 #endif
 
-#undef DDR_MEM_COMPATIBLE
-#undef DDR_MEM_NAME
-#undef DDR_MEM_SPEED
-#undef DDR_MEM_SIZE
-
-#undef DDR_MSTR
-#undef DDR_MRCTRL0
-#undef DDR_MRCTRL1
-#undef DDR_DERATEEN
-#undef DDR_DERATEINT
-#undef DDR_PWRCTL
-#undef DDR_PWRTMG
-#undef DDR_HWLPCTL
-#undef DDR_RFSHCTL0
-#undef DDR_RFSHCTL3
-#undef DDR_RFSHTMG
-#undef DDR_CRCPARCTL0
-#undef DDR_DRAMTMG0
-#undef DDR_DRAMTMG1
-#undef DDR_DRAMTMG2
-#undef DDR_DRAMTMG3
-#undef DDR_DRAMTMG4
-#undef DDR_DRAMTMG5
-#undef DDR_DRAMTMG6
-#undef DDR_DRAMTMG7
-#undef DDR_DRAMTMG8
-#undef DDR_DRAMTMG14
-#undef DDR_ZQCTL0
-#undef DDR_DFITMG0
-#undef DDR_DFITMG1
-#undef DDR_DFILPCFG0
-#undef DDR_DFIUPD0
-#undef DDR_DFIUPD1
-#undef DDR_DFIUPD2
-#undef DDR_DFIPHYMSTR
-#undef DDR_ADDRMAP1
-#undef DDR_ADDRMAP2
-#undef DDR_ADDRMAP3
-#undef DDR_ADDRMAP4
-#undef DDR_ADDRMAP5
-#undef DDR_ADDRMAP6
-#undef DDR_ADDRMAP9
-#undef DDR_ADDRMAP10
-#undef DDR_ADDRMAP11
-#undef DDR_ODTCFG
-#undef DDR_ODTMAP
-#undef DDR_SCHED
-#undef DDR_SCHED1
-#undef DDR_PERFHPR1
-#undef DDR_PERFLPR1
-#undef DDR_PERFWR1
-#undef DDR_DBG0
-#undef DDR_DBG1
-#undef DDR_DBGCMD
-#undef DDR_POISONCFG
-#undef DDR_PCCFG
-#undef DDR_PCFGR_0
-#undef DDR_PCFGW_0
-#undef DDR_PCFGQOS0_0
-#undef DDR_PCFGQOS1_0
-#undef DDR_PCFGWQOS0_0
-#undef DDR_PCFGWQOS1_0
-#undef DDR_PCFGR_1
-#undef DDR_PCFGW_1
-#undef DDR_PCFGQOS0_1
-#undef DDR_PCFGQOS1_1
-#undef DDR_PCFGWQOS0_1
-#undef DDR_PCFGWQOS1_1
-#undef DDR_PGCR
-#undef DDR_PTR0
-#undef DDR_PTR1
-#undef DDR_PTR2
-#undef DDR_ACIOCR
-#undef DDR_DXCCR
-#undef DDR_DSGCR
-#undef DDR_DCR
-#undef DDR_DTPR0
-#undef DDR_DTPR1
-#undef DDR_DTPR2
-#undef DDR_MR0
-#undef DDR_MR1
-#undef DDR_MR2
-#undef DDR_MR3
-#undef DDR_ODTCR
-#undef DDR_ZQ0CR1
-#undef DDR_DX0GCR
-#undef DDR_DX1GCR
-#undef DDR_DX2GCR
-#undef DDR_DX3GCR
+#include "stm32mp1-ddr.dtsi"
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
