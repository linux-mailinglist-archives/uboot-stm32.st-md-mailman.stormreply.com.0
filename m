Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBB0886237
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Mar 2024 22:04:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41B59C6DD69;
	Thu, 21 Mar 2024 21:04:37 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 102FEC6DD75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 21:04:36 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-414618e6820so11273825e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 14:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711055075; x=1711659875;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H9z47gxslMXab03nJVN9Zel/hSMnSwz2OuvyhmVXZIg=;
 b=TBOXcAgy+3Fc9QVGqXJzstFePerkmkR9FrHSOAbZ5YwSO89HUeLHm1KrrcZ4O27h7t
 cWHcVGCA3E5q8ZQZp/bGK34ZZpYI89RO14wu/lTZWYvF4HP/cWj/ki/XtTJdtodta76Q
 /LU88Rid/mheqFhOhuYMORdHdYYJ1XJLYgkFin/I/Yo+bEGfFAImeQU/oupheKiDlcfW
 2Smt+Oj3j8EBLGPQXh3TMKV9zcFUV8ou3oGivQX1FFY2+gYWu9/n1qrq0YPDmT2dtHK3
 pdnbBIASdgDWZepktCKr+cWDJMQnQOAjQtxAphWuYNogLlHoRnP+Lrrlb9TG6zYlRIhX
 Mcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711055075; x=1711659875;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H9z47gxslMXab03nJVN9Zel/hSMnSwz2OuvyhmVXZIg=;
 b=DzOAcryB7Y58HOB2o87s2nVghV0BOMM6+v+lQJkwJV6xaq2c+wrpHTWKJT4hs+3i8I
 flfCy7SXKL/6kG8M6Sw62GTGoHQiRlMcqFP6d1iLQnr2o6/XICxReA0DilGkLx8vegrt
 cFnkPFcEyiy70F2aI6EVs2GdQaBOfqOpDm6ttoXgQn7SAF1Dr0SX1CKlDPm2vyO7onjF
 lVC09LwNgR43QvPi4w3O9K7C+NUECcyXaob8YpBhG+mzvfgBJNWouIRT/pgd+BtE42WB
 JFFJ4y4TaTMq12UJ+j62vK4rUL9WzLTIWY6Ugs2trrX1Agk40dipg0ECKdwP+9cAVSCF
 f2oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEow7IkaI1yTkU6bRtGkrTutbosq79nh4S1O2bpkBswqkljQu5VFWOF5pmO4eeNHA4sMhFTwDCJvoip4TKunje9vQ+ddjL16TjAL4UFSFsKW1RI4NqKCGZ
X-Gm-Message-State: AOJu0YyB14n3+YrC5XfJwusRLcA5Ol7F0hOotEGq+MbCkVuzq7osgvax
 0klUnc4ICuJMZ0YHtgJAS9W6kZRgYxFBCdPoXkXD9fn/K7m/e1An21kYozHZ6YI=
X-Google-Smtp-Source: AGHT+IHGF9T7yrijm/584t3scgEZ6HnMs/+RrCeeLb6GPjdcZ3J6sfDmRL3vibK1zQMrc+LOwrpS3w==
X-Received: by 2002:a05:600c:1908:b0:414:c63:b9de with SMTP id
 j8-20020a05600c190800b004140c63b9demr223868wmq.14.1711055075661; 
 Thu, 21 Mar 2024 14:04:35 -0700 (PDT)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b004146f728906sm925462wmb.7.2024.03.21.14.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 14:04:35 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Thu, 21 Mar 2024 21:04:03 +0000
MIME-Version: 1.0
Message-Id: <20240321-b4-upstream-dt-headers-v2-20-1eac0df875fe@linaro.org>
References: <20240321-b4-upstream-dt-headers-v2-0-1eac0df875fe@linaro.org>
In-Reply-To: <20240321-b4-upstream-dt-headers-v2-0-1eac0df875fe@linaro.org>
To: Tom Rini <trini@konsulko.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sumit Garg <sumit.garg@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>, 
 Sean Anderson <seanga2@gmail.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Matthias Brugger <mbrugger@suse.com>, Peter Robinson <pbrobinson@gmail.com>, 
 Joe Hershberger <joe.hershberger@ni.com>, 
 Ramon Fried <rfried.dev@gmail.com>, Thierry Reding <treding@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, Michal Simek <michal.simek@amd.com>, 
 Paul Barker <paul.barker.ct@bp.renesas.com>, 
 Weijie Gao <weijie.gao@mediatek.com>, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Eugen Hristev <eugen.hristev@collabora.com>, Rick Chen <rick@andestech.com>, 
 Leo <ycliang@andestech.com>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, 
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Dai Okamura <okamura.dai@socionext.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6003;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=5lyJpN4afSur7zKXA+gv+xmN5RUoVNSeg8I0uwN7L3A=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtQ/C/aqzol53nf08O35Pj66byaWsDD6Zt489kflHlOR8
 Yqctm+cHaUsDIIcDLJiiiziJ5ZZNq29bK+xfcEFmDmsTCBDGLg4BWAi0hKMDA0pTMbvEq+GT193
 I62mpVcksOJpcRLfh3f3VUJc3AJ/KDMyzJbjUVH3Cima0x2odDl4689PEwq4JV9wi5qyPrFsya6
 fCgA=
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 20/24] sifive: drop clock headers
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

Drop in favour of dts/upstream.

Small driver/dts change to fix compatibility.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/riscv/dts/fu540-c000-u-boot.dtsi         | 26 +++++++++++++-------------
 drivers/clk/sifive/fu540-prci.c               |  8 ++++----
 include/dt-bindings/clock/sifive-fu540-prci.h | 18 ------------------
 include/dt-bindings/clock/sifive-fu740-prci.h | 24 ------------------------
 4 files changed, 17 insertions(+), 59 deletions(-)

diff --git a/arch/riscv/dts/fu540-c000-u-boot.dtsi b/arch/riscv/dts/fu540-c000-u-boot.dtsi
index 360679a1781a..0f8181436410 100644
--- a/arch/riscv/dts/fu540-c000-u-boot.dtsi
+++ b/arch/riscv/dts/fu540-c000-u-boot.dtsi
@@ -6,42 +6,42 @@
 #include <dt-bindings/reset/sifive-fu540-prci.h>
 
 / {
 	cpus {
-		assigned-clocks = <&prci PRCI_CLK_COREPLL>;
+		assigned-clocks = <&prci FU540_PRCI_CLK_COREPLL>;
 		assigned-clock-rates = <1000000000>;
 		bootph-pre-ram;
 		cpu0: cpu@0 {
-			clocks = <&prci PRCI_CLK_COREPLL>;
+			clocks = <&prci FU540_PRCI_CLK_COREPLL>;
 			bootph-pre-ram;
 			status = "okay";
 			cpu0_intc: interrupt-controller {
 				bootph-pre-ram;
 			};
 		};
 		cpu1: cpu@1 {
-			clocks = <&prci PRCI_CLK_COREPLL>;
+			clocks = <&prci FU540_PRCI_CLK_COREPLL>;
 			bootph-pre-ram;
 			cpu1_intc: interrupt-controller {
 				bootph-pre-ram;
 			};
 		};
 		cpu2: cpu@2 {
-			clocks = <&prci PRCI_CLK_COREPLL>;
+			clocks = <&prci FU540_PRCI_CLK_COREPLL>;
 			bootph-pre-ram;
 			cpu2_intc: interrupt-controller {
 				bootph-pre-ram;
 			};
 		};
 		cpu3: cpu@3 {
-			clocks = <&prci PRCI_CLK_COREPLL>;
+			clocks = <&prci FU540_PRCI_CLK_COREPLL>;
 			bootph-pre-ram;
 			cpu3_intc: interrupt-controller {
 				bootph-pre-ram;
 			};
 		};
 		cpu4: cpu@4 {
-			clocks = <&prci PRCI_CLK_COREPLL>;
+			clocks = <&prci FU540_PRCI_CLK_COREPLL>;
 			bootph-pre-ram;
 			cpu4_intc: interrupt-controller {
 				bootph-pre-ram;
 			};
@@ -66,22 +66,22 @@
 			bootph-pre-ram;
 		};
 		prci: clock-controller@10000000 {
 			#reset-cells = <1>;
-			resets = <&prci PRCI_RST_DDR_CTRL_N>,
-				 <&prci PRCI_RST_DDR_AXI_N>,
-				 <&prci PRCI_RST_DDR_AHB_N>,
-				 <&prci PRCI_RST_DDR_PHY_N>,
-				 <&prci PRCI_RST_GEMGXL_N>;
+			resets = <&prci FU540_PRCI_RST_DDR_CTRL_N>,
+				 <&prci FU540_PRCI_RST_DDR_AXI_N>,
+				 <&prci FU540_PRCI_RST_DDR_AHB_N>,
+				 <&prci FU540_PRCI_RST_DDR_PHY_N>,
+				 <&prci FU540_PRCI_RST_GEMGXL_N>;
 			reset-names = "ddr_ctrl", "ddr_axi", "ddr_ahb",
 					"ddr_phy", "gemgxl_reset";
 		};
 		dmc: dmc@100b0000 {
 			compatible = "sifive,fu540-c000-ddr";
 			reg = <0x0 0x100b0000 0x0 0x0800
 			       0x0 0x100b2000 0x0 0x2000
 			       0x0 0x100b8000 0x0 0x1000>;
-			clocks = <&prci PRCI_CLK_DDRPLL>;
+			clocks = <&prci FU540_PRCI_CLK_DDRPLL>;
 			clock-frequency = <933333324>;
 			bootph-pre-ram;
 		};
 	};
@@ -99,9 +99,9 @@
 	bootph-pre-ram;
 };
 
 &eth0 {
-	assigned-clocks = <&prci PRCI_CLK_GEMGXLPLL>;
+	assigned-clocks = <&prci FU540_PRCI_CLK_GEMGXLPLL>;
 	assigned-clock-rates = <125000000>;
 };
 
 &l2cache {
diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
index ceb2c6fab0da..b019f682ac49 100644
--- a/drivers/clk/sifive/fu540-prci.c
+++ b/drivers/clk/sifive/fu540-prci.c
@@ -58,27 +58,27 @@ static const struct __prci_clock_ops sifive_fu540_prci_tlclksel_clk_ops = {
 };
 
 /* List of clock controls provided by the PRCI */
 struct __prci_clock __prci_init_clocks_fu540[] = {
-	[PRCI_CLK_COREPLL] = {
+	[FU540_PRCI_CLK_COREPLL] = {
 		.name = "corepll",
 		.parent_name = "hfclk",
 		.ops = &sifive_fu540_prci_wrpll_clk_ops,
 		.pwd = &__prci_corepll_data,
 	},
-	[PRCI_CLK_DDRPLL] = {
+	[FU540_PRCI_CLK_DDRPLL] = {
 		.name = "ddrpll",
 		.parent_name = "hfclk",
 		.ops = &sifive_fu540_prci_wrpll_clk_ops,
 		.pwd = &__prci_ddrpll_data,
 	},
-	[PRCI_CLK_GEMGXLPLL] = {
+	[FU540_PRCI_CLK_GEMGXLPLL] = {
 		.name = "gemgxlpll",
 		.parent_name = "hfclk",
 		.ops = &sifive_fu540_prci_wrpll_clk_ops,
 		.pwd = &__prci_gemgxlpll_data,
 	},
-	[PRCI_CLK_TLCLK] = {
+	[FU540_PRCI_CLK_TLCLK] = {
 		.name = "tlclk",
 		.parent_name = "corepll",
 		.ops = &sifive_fu540_prci_tlclksel_clk_ops,
 	},
diff --git a/include/dt-bindings/clock/sifive-fu540-prci.h b/include/dt-bindings/clock/sifive-fu540-prci.h
deleted file mode 100644
index 6a0b70a37d78..000000000000
--- a/include/dt-bindings/clock/sifive-fu540-prci.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2018-2019 SiFive, Inc.
- * Wesley Terpstra
- * Paul Walmsley
- */
-
-#ifndef __DT_BINDINGS_CLOCK_SIFIVE_FU540_PRCI_H
-#define __DT_BINDINGS_CLOCK_SIFIVE_FU540_PRCI_H
-
-/* Clock indexes for use by Device Tree data and the PRCI driver */
-
-#define PRCI_CLK_COREPLL	       0
-#define PRCI_CLK_DDRPLL		       1
-#define PRCI_CLK_GEMGXLPLL	       2
-#define PRCI_CLK_TLCLK		       3
-
-#endif
diff --git a/include/dt-bindings/clock/sifive-fu740-prci.h b/include/dt-bindings/clock/sifive-fu740-prci.h
deleted file mode 100644
index 672bdadbf6c0..000000000000
--- a/include/dt-bindings/clock/sifive-fu740-prci.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
-/*
- * Copyright (C) 2019 SiFive, Inc.
- * Wesley Terpstra
- * Paul Walmsley
- * Zong Li
- */
-
-#ifndef __DT_BINDINGS_CLOCK_SIFIVE_FU740_PRCI_H
-#define __DT_BINDINGS_CLOCK_SIFIVE_FU740_PRCI_H
-
-/* Clock indexes for use by Device Tree data and the PRCI driver */
-
-#define FU740_PRCI_CLK_COREPLL		0
-#define FU740_PRCI_CLK_DDRPLL		1
-#define FU740_PRCI_CLK_GEMGXLPLL	2
-#define FU740_PRCI_CLK_DVFSCOREPLL	3
-#define FU740_PRCI_CLK_HFPCLKPLL	4
-#define FU740_PRCI_CLK_CLTXPLL		5
-#define FU740_PRCI_CLK_TLCLK		6
-#define FU740_PRCI_CLK_PCLK		7
-#define FU740_PRCI_CLK_PCIE_AUX		8
-
-#endif	/* __DT_BINDINGS_CLOCK_SIFIVE_FU740_PRCI_H */

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
