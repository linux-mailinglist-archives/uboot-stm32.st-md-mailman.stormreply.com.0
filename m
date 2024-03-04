Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F98707A0
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Mar 2024 17:51:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42416C6DD6B;
	Mon,  4 Mar 2024 16:51:59 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FEE2C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 16:51:58 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-33e162b1b71so3682508f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 08:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709571117; x=1710175917;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H9z47gxslMXab03nJVN9Zel/hSMnSwz2OuvyhmVXZIg=;
 b=axEdI1CDkLh8HJjHFouZG8wQHTa0CAzqwZ2N2c9TAsLpF3QVqphMvkJtcKQKRgFnKI
 IIAx7otGb1B96/8HMivRVEkczyEPtDQ8i6SFJgXP2m/X9aqoRlNkmuGARHluu2KLZQwe
 gHMwhKcqEhxHycZnR/9ddS6m8FhxeaRA1g+YDYoGTwjg3OcVvTZp28552vsOzfF3iaDU
 N/sZGGIp5/lZqCoQPmWDhBzq8a7Kokz0EDcqAUnGg4qiGkLuyknHMCQMkqKuckkJlo3r
 QfWQrbuCz8h6aWPykKJjRSPqqJSPwlWTqjTfO6Tc39yCXzmsLFiY57uH4k8q+o6zepN8
 Bviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571117; x=1710175917;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H9z47gxslMXab03nJVN9Zel/hSMnSwz2OuvyhmVXZIg=;
 b=i+At0SNloYtFiJjCBpRGpOM3gKTZ/Hn4N/ML3BIHh+Ralm/mx++AnjYd+V17OMMdYI
 jw9BamZjF41NZOOkW4u+TybCt5iSXPN3sIWbi72pCoWycmxbtRSX1y69GhbMbpd+Jhdm
 YaFXKNz7fadAqQu7UgdBa1wo3ceRuHY1gCk2NNs57msNP54NucOjotIGUPYnDtgUzM+4
 oebMMIIX0GXG96RiadTs6lAzWurMhM31rwgHoQRweRmrgBYmqId0YdqksFyvpSpe4F0q
 oWBhVfYb0bOZRNpCUyoYyK/07CwDxkuDGUw9e6U0GuHaBYHfGzSn2onMPeuS27eBIHDD
 tkKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjphNHcEyoU2bGSmdU3PTeRZSGVLr9q8ni86Q4TQGwULvneQjWaVfohNRL8hbqDX9YBQ9jLNDZKD6of+jdJDQ0HkPBXBCuW4HF25MCc21IDQmg7Xk9mAiJ
X-Gm-Message-State: AOJu0YyQOZC3v7jYswgrg2hjhuoX4hDdhsqVnpZ5nCjD+KK//yobjhqf
 2XmhewsdF7qfDIKuDg0QLFZ/eHxgsGjj8AuxItKxeuizsg9+f0NurWaC9Qe9Krw=
X-Google-Smtp-Source: AGHT+IEgV0eXx1rWdGobjqTs8cv9MXDeBJ418kkGq4ZOdDFaewZBLYEyuSk433g0ESo8dYY65UgzuQ==
X-Received: by 2002:adf:f407:0:b0:33b:784c:276e with SMTP id
 g7-20020adff407000000b0033b784c276emr7710276wro.25.1709571117681; 
 Mon, 04 Mar 2024 08:51:57 -0800 (PST)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm10598517wmq.6.2024.03.04.08.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:51:57 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Mon, 04 Mar 2024 16:51:30 +0000
MIME-Version: 1.0
Message-Id: <20240304-b4-upstream-dt-headers-v1-22-b7ff41925f92@linaro.org>
References: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
In-Reply-To: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
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
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtSnf4Ai27acv2/IJfKdx9lh5g0dyXV5aznswi5aS69iX
 +K2OKGjlIVBkINBVkyRRfzEMsumtZftNbYvuAAzh5UJZAgDF6cATORhGCPDxCr+yfeZ3jYYS/bJ
 rJsxXzDbJPZvWqwF4znFHwdKnhx2ZfincdpGwVt69qeA3uDEa+YeO1qFuN4UXz5ak9vLFHfEYuV
 5AA==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH RFC 22/26] sifive: drop clock headers
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
