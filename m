Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F94886230
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Mar 2024 22:04:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8ADEC6DD75;
	Thu, 21 Mar 2024 21:04:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B1C0C6DD79
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 21:04:21 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-414787c73c7so2279905e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 14:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711055060; x=1711659860;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ho6DUKv8w+2gxCeqMOmcdtjUHQaZUNjWHJh8sb5SGhU=;
 b=zF+xyQk9komzjb8FCiN7nhQ7w/OqCC4NQrF3Ac3BTp5mrwSwu1+Tk/wf9vR9u/FMDL
 CDWwn/eBqClDyWD7CwrLOU0HWVzWcPrsqUTtIoeypqMiq2Z3CRSN0n46x/U7e1VzsaDB
 ak7yKhmCNTnTmaaxk9zYuFz8bkTS1QaeMs9vA33M8l/KeYRKTQf6Xnvp2RiG9NJFDugI
 HxGJlBzMO8kfxnHWkuKYMh2jpQ4+oJhuqM8TqzOVy1JiPy9b9t8oMhwXrM/rSxE238US
 bU+ax1unGHshIhlrLnFBr9Hb62pZLaosmus0D+mf3MtZxuJPNfkxmAadQ1etLIYy6lOh
 9/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711055060; x=1711659860;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ho6DUKv8w+2gxCeqMOmcdtjUHQaZUNjWHJh8sb5SGhU=;
 b=xGZMy5eSh7Apfu3r3XlwqlayZa6r+MzsoUJTG6+zYuKDuqBh0Ws0P4iK2CkSkWaI3j
 lP9DyAYQm9/mKQdCRQ9Lsa6ls3zLpjRg7OUXL8OY/RU8mHjdwVazUKCC0pG+GErh9TIK
 iBvHNa96ao2pGd1S6yuu6NN9+JF3usourq9zzHLoYMAJ/b1waHhySU9fAZSXdCULPbFb
 ea6cgX92TilSR01Xe6u5Nc1sH1QFyvvAQ/ryb0kicN/DihFex/phMOdrUi9L2ZjJvZ4J
 rlPUephIh/CblktVkUctx3Z3RDqRylmUqHabkBr5++SDsKi/ZLpHJQA+VS8LC6FbYEHv
 kgrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsLbXiun7IPWWQ+GlLbMZiOWjOtb8qcS1ufd5UF0IOuJUgNTJlFFUBDTUHOTmdWnr1RJv3NtEYHI+Ea8qQIiKTrBe/o0hiF7Pxl//fo8bnwvi8BqcV3/cq
X-Gm-Message-State: AOJu0YxtCdWJn8KmSzzfv/Y4ZZL13M79O9ZO38yBo45Avm/1Vv55EEt+
 0zxTQIXUg6z7UTlT8wkuT7ZQle5+KRZJ5pf1onXDAc1TLpvTb+XiikOLx7Klquk=
X-Google-Smtp-Source: AGHT+IHvdPEVXMdf/SMP09I+/XbSi7MSWe2e7HSSBD/vZLB51IzCNyIJg1teEwC6ldXHa0E8TdweZA==
X-Received: by 2002:a05:600c:5494:b0:413:f2c6:df3d with SMTP id
 iv20-20020a05600c549400b00413f2c6df3dmr229977wmb.13.1711055060566; 
 Thu, 21 Mar 2024 14:04:20 -0700 (PDT)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b004146f728906sm925462wmb.7.2024.03.21.14.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 14:04:19 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Thu, 21 Mar 2024 21:03:54 +0000
MIME-Version: 1.0
Message-Id: <20240321-b4-upstream-dt-headers-v2-11-1eac0df875fe@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19475;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=kZLqLmWc/ez1mBweoulX7ov9ivbShWuGmqjIVl+U5Tg=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtQ/C/ZMnFJ/b83V1OCFHDMbJC20n1gca7zs9/iBSEv0/
 j2GLO4pHaUsDIIcDLJiiiziJ5ZZNq29bK+xfcEFmDmsTCBDGLg4BWAiUvcY/ulFSXzeY8M0KXbX
 6r9Tvjc1iWxmetFUzJap9/jsS9+lX18w/FPy+xKrdOB6hvYV/uDX7A8+3lbKvXnX5uNvliUh5/5
 d9jkGAA==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 11/24] exynos: drop dt-binding headers
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

Small driver and DTS adjustments to use upstream headers.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm/dts/exynos7420.dtsi                 |   2 +-
 drivers/clk/exynos/clk-exynos7420.c          |   2 +-
 include/dt-bindings/clock/exynos7420-clk.h   | 207 ----------------
 include/dt-bindings/clock/exynos850.h        | 337 ---------------------------
 include/dt-bindings/soc/samsung,exynos-usi.h |  17 --
 5 files changed, 2 insertions(+), 563 deletions(-)

diff --git a/arch/arm/dts/exynos7420.dtsi b/arch/arm/dts/exynos7420.dtsi
index 373f48cf2eca..ba9666f3de01 100644
--- a/arch/arm/dts/exynos7420.dtsi
+++ b/arch/arm/dts/exynos7420.dtsi
@@ -7,9 +7,9 @@
  */
 
 /dts-v1/;
 #include "skeleton.dtsi"
-#include <dt-bindings/clock/exynos7420-clk.h>
+#include <dt-bindings/clock/exynos7-clk.h>
 / {
 	compatible = "samsung,exynos7420";
 
 	fin_pll: xxti {
diff --git a/drivers/clk/exynos/clk-exynos7420.c b/drivers/clk/exynos/clk-exynos7420.c
index 9caa932e12fb..cd6d67a0752b 100644
--- a/drivers/clk/exynos/clk-exynos7420.c
+++ b/drivers/clk/exynos/clk-exynos7420.c
@@ -10,9 +10,9 @@
 #include <errno.h>
 #include <clk-uclass.h>
 #include <asm/io.h>
 #include <div64.h>
-#include <dt-bindings/clock/exynos7420-clk.h>
+#include <dt-bindings/clock/exynos7-clk.h>
 
 #define PLL145X_MDIV_SHIFT	16
 #define PLL145X_MDIV_MASK	0x3ff
 #define PLL145X_PDIV_SHIFT	8
diff --git a/include/dt-bindings/clock/exynos7420-clk.h b/include/dt-bindings/clock/exynos7420-clk.h
deleted file mode 100644
index 10c558611085..000000000000
--- a/include/dt-bindings/clock/exynos7420-clk.h
+++ /dev/null
@@ -1,207 +0,0 @@
-/*
- * Copyright (c) 2014 Samsung Electronics Co., Ltd.
- * Author: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef _DT_BINDINGS_CLOCK_EXYNOS7_H
-#define _DT_BINDINGS_CLOCK_EXYNOS7_H
-
-/* TOPC */
-#define DOUT_ACLK_PERIS			1
-#define DOUT_SCLK_BUS0_PLL		2
-#define DOUT_SCLK_BUS1_PLL		3
-#define DOUT_SCLK_CC_PLL		4
-#define DOUT_SCLK_MFC_PLL		5
-#define DOUT_ACLK_CCORE_133		6
-#define DOUT_ACLK_MSCL_532		7
-#define ACLK_MSCL_532			8
-#define DOUT_SCLK_AUD_PLL		9
-#define FOUT_AUD_PLL			10
-#define SCLK_AUD_PLL			11
-#define SCLK_MFC_PLL_B			12
-#define SCLK_MFC_PLL_A			13
-#define SCLK_BUS1_PLL_B			14
-#define SCLK_BUS1_PLL_A			15
-#define SCLK_BUS0_PLL_B			16
-#define SCLK_BUS0_PLL_A			17
-#define SCLK_CC_PLL_B			18
-#define SCLK_CC_PLL_A			19
-#define ACLK_CCORE_133			20
-#define ACLK_PERIS_66			21
-#define TOPC_NR_CLK			22
-
-/* TOP0 */
-#define DOUT_ACLK_PERIC1		1
-#define DOUT_ACLK_PERIC0		2
-#define CLK_SCLK_UART0			3
-#define CLK_SCLK_UART1			4
-#define CLK_SCLK_UART2			5
-#define CLK_SCLK_UART3			6
-#define CLK_SCLK_SPI0			7
-#define CLK_SCLK_SPI1			8
-#define CLK_SCLK_SPI2			9
-#define CLK_SCLK_SPI3			10
-#define CLK_SCLK_SPI4			11
-#define CLK_SCLK_SPDIF			12
-#define CLK_SCLK_PCM1			13
-#define CLK_SCLK_I2S1			14
-#define CLK_ACLK_PERIC0_66		15
-#define CLK_ACLK_PERIC1_66		16
-#define TOP0_NR_CLK			17
-
-/* TOP1 */
-#define DOUT_ACLK_FSYS1_200		1
-#define DOUT_ACLK_FSYS0_200		2
-#define DOUT_SCLK_MMC2			3
-#define DOUT_SCLK_MMC1			4
-#define DOUT_SCLK_MMC0			5
-#define CLK_SCLK_MMC2			6
-#define CLK_SCLK_MMC1			7
-#define CLK_SCLK_MMC0			8
-#define CLK_ACLK_FSYS0_200		9
-#define CLK_ACLK_FSYS1_200		10
-#define CLK_SCLK_PHY_FSYS1		11
-#define CLK_SCLK_PHY_FSYS1_26M		12
-#define MOUT_SCLK_UFSUNIPRO20		13
-#define DOUT_SCLK_UFSUNIPRO20		14
-#define CLK_SCLK_UFSUNIPRO20		15
-#define DOUT_SCLK_PHY_FSYS1		16
-#define DOUT_SCLK_PHY_FSYS1_26M		17
-#define TOP1_NR_CLK			18
-
-/* CCORE */
-#define PCLK_RTC			1
-#define CCORE_NR_CLK			2
-
-/* PERIC0 */
-#define PCLK_UART0			1
-#define SCLK_UART0			2
-#define PCLK_HSI2C0			3
-#define PCLK_HSI2C1			4
-#define PCLK_HSI2C4			5
-#define PCLK_HSI2C5			6
-#define PCLK_HSI2C9			7
-#define PCLK_HSI2C10			8
-#define PCLK_HSI2C11			9
-#define PCLK_PWM			10
-#define SCLK_PWM			11
-#define PCLK_ADCIF			12
-#define PERIC0_NR_CLK			13
-
-/* PERIC1 */
-#define PCLK_UART1			1
-#define PCLK_UART2			2
-#define PCLK_UART3			3
-#define SCLK_UART1			4
-#define SCLK_UART2			5
-#define SCLK_UART3			6
-#define PCLK_HSI2C2			7
-#define PCLK_HSI2C3			8
-#define PCLK_HSI2C6			9
-#define PCLK_HSI2C7			10
-#define PCLK_HSI2C8			11
-#define PCLK_SPI0			12
-#define PCLK_SPI1			13
-#define PCLK_SPI2			14
-#define PCLK_SPI3			15
-#define PCLK_SPI4			16
-#define SCLK_SPI0			17
-#define SCLK_SPI1			18
-#define SCLK_SPI2			19
-#define SCLK_SPI3			20
-#define SCLK_SPI4			21
-#define PCLK_I2S1			22
-#define PCLK_PCM1			23
-#define PCLK_SPDIF			24
-#define SCLK_I2S1			25
-#define SCLK_PCM1			26
-#define SCLK_SPDIF			27
-#define PERIC1_NR_CLK			28
-
-/* PERIS */
-#define PCLK_CHIPID			1
-#define SCLK_CHIPID			2
-#define PCLK_WDT			3
-#define PCLK_TMU			4
-#define SCLK_TMU			5
-#define PERIS_NR_CLK			6
-
-/* FSYS0 */
-#define ACLK_MMC2			1
-#define ACLK_AXIUS_USBDRD30X_FSYS0X	2
-#define ACLK_USBDRD300			3
-#define SCLK_USBDRD300_SUSPENDCLK	4
-#define SCLK_USBDRD300_REFCLK		5
-#define PHYCLK_USBDRD300_UDRD30_PIPE_PCLK_USER		6
-#define PHYCLK_USBDRD300_UDRD30_PHYCLK_USER		7
-#define OSCCLK_PHY_CLKOUT_USB30_PHY		8
-#define ACLK_PDMA0			9
-#define ACLK_PDMA1			10
-#define FSYS0_NR_CLK			11
-
-/* FSYS1 */
-#define ACLK_MMC1			1
-#define ACLK_MMC0			2
-#define PHYCLK_UFS20_TX0_SYMBOL		3
-#define PHYCLK_UFS20_RX0_SYMBOL		4
-#define PHYCLK_UFS20_RX1_SYMBOL		5
-#define ACLK_UFS20_LINK			6
-#define SCLK_UFSUNIPRO20_USER		7
-#define PHYCLK_UFS20_RX1_SYMBOL_USER	8
-#define PHYCLK_UFS20_RX0_SYMBOL_USER	9
-#define PHYCLK_UFS20_TX0_SYMBOL_USER	10
-#define OSCCLK_PHY_CLKOUT_EMBEDDED_COMBO_PHY	11
-#define SCLK_COMBO_PHY_EMBEDDED_26M	12
-#define DOUT_PCLK_FSYS1			13
-#define PCLK_GPIO_FSYS1			14
-#define MOUT_FSYS1_PHYCLK_SEL1		15
-#define FSYS1_NR_CLK			16
-
-/* MSCL */
-#define USERMUX_ACLK_MSCL_532		1
-#define DOUT_PCLK_MSCL			2
-#define ACLK_MSCL_0			3
-#define ACLK_MSCL_1			4
-#define ACLK_JPEG			5
-#define ACLK_G2D			6
-#define ACLK_LH_ASYNC_SI_MSCL_0		7
-#define ACLK_LH_ASYNC_SI_MSCL_1		8
-#define ACLK_AXI2ACEL_BRIDGE		9
-#define ACLK_XIU_MSCLX_0		10
-#define ACLK_XIU_MSCLX_1		11
-#define ACLK_QE_MSCL_0			12
-#define ACLK_QE_MSCL_1			13
-#define ACLK_QE_JPEG			14
-#define ACLK_QE_G2D			15
-#define ACLK_PPMU_MSCL_0		16
-#define ACLK_PPMU_MSCL_1		17
-#define ACLK_MSCLNP_133			18
-#define ACLK_AHB2APB_MSCL0P		19
-#define ACLK_AHB2APB_MSCL1P		20
-
-#define PCLK_MSCL_0			21
-#define PCLK_MSCL_1			22
-#define PCLK_JPEG			23
-#define PCLK_G2D			24
-#define PCLK_QE_MSCL_0			25
-#define PCLK_QE_MSCL_1			26
-#define PCLK_QE_JPEG			27
-#define PCLK_QE_G2D			28
-#define PCLK_PPMU_MSCL_0		29
-#define PCLK_PPMU_MSCL_1		30
-#define PCLK_AXI2ACEL_BRIDGE		31
-#define PCLK_PMU_MSCL			32
-#define MSCL_NR_CLK			33
-
-/* AUD */
-#define SCLK_I2S			1
-#define SCLK_PCM			2
-#define PCLK_I2S			3
-#define PCLK_PCM			4
-#define ACLK_ADMA			5
-#define AUD_NR_CLK			6
-#endif /* _DT_BINDINGS_CLOCK_EXYNOS7_H */
diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
deleted file mode 100644
index 3090e09c9a55..000000000000
--- a/include/dt-bindings/clock/exynos850.h
+++ /dev/null
@@ -1,337 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
-/*
- * Copyright (C) 2021 Linaro Ltd.
- * Author: Sam Protsenko <semen.protsenko@linaro.org>
- *
- * Device Tree binding constants for Exynos850 clock controller.
- */
-
-#ifndef _DT_BINDINGS_CLOCK_EXYNOS_850_H
-#define _DT_BINDINGS_CLOCK_EXYNOS_850_H
-
-/* CMU_TOP */
-#define CLK_FOUT_SHARED0_PLL		1
-#define CLK_FOUT_SHARED1_PLL		2
-#define CLK_FOUT_MMC_PLL		3
-#define CLK_MOUT_SHARED0_PLL		4
-#define CLK_MOUT_SHARED1_PLL		5
-#define CLK_MOUT_MMC_PLL		6
-#define CLK_MOUT_CORE_BUS		7
-#define CLK_MOUT_CORE_CCI		8
-#define CLK_MOUT_CORE_MMC_EMBD		9
-#define CLK_MOUT_CORE_SSS		10
-#define CLK_MOUT_DPU			11
-#define CLK_MOUT_HSI_BUS		12
-#define CLK_MOUT_HSI_MMC_CARD		13
-#define CLK_MOUT_HSI_USB20DRD		14
-#define CLK_MOUT_PERI_BUS		15
-#define CLK_MOUT_PERI_UART		16
-#define CLK_MOUT_PERI_IP		17
-#define CLK_DOUT_SHARED0_DIV3		18
-#define CLK_DOUT_SHARED0_DIV2		19
-#define CLK_DOUT_SHARED1_DIV3		20
-#define CLK_DOUT_SHARED1_DIV2		21
-#define CLK_DOUT_SHARED0_DIV4		22
-#define CLK_DOUT_SHARED1_DIV4		23
-#define CLK_DOUT_CORE_BUS		24
-#define CLK_DOUT_CORE_CCI		25
-#define CLK_DOUT_CORE_MMC_EMBD		26
-#define CLK_DOUT_CORE_SSS		27
-#define CLK_DOUT_DPU			28
-#define CLK_DOUT_HSI_BUS		29
-#define CLK_DOUT_HSI_MMC_CARD		30
-#define CLK_DOUT_HSI_USB20DRD		31
-#define CLK_DOUT_PERI_BUS		32
-#define CLK_DOUT_PERI_UART		33
-#define CLK_DOUT_PERI_IP		34
-#define CLK_GOUT_CORE_BUS		35
-#define CLK_GOUT_CORE_CCI		36
-#define CLK_GOUT_CORE_MMC_EMBD		37
-#define CLK_GOUT_CORE_SSS		38
-#define CLK_GOUT_DPU			39
-#define CLK_GOUT_HSI_BUS		40
-#define CLK_GOUT_HSI_MMC_CARD		41
-#define CLK_GOUT_HSI_USB20DRD		42
-#define CLK_GOUT_PERI_BUS		43
-#define CLK_GOUT_PERI_UART		44
-#define CLK_GOUT_PERI_IP		45
-#define CLK_MOUT_CLKCMU_APM_BUS		46
-#define CLK_DOUT_CLKCMU_APM_BUS		47
-#define CLK_GOUT_CLKCMU_APM_BUS		48
-#define CLK_MOUT_AUD			49
-#define CLK_GOUT_AUD			50
-#define CLK_DOUT_AUD			51
-#define CLK_MOUT_IS_BUS			52
-#define CLK_MOUT_IS_ITP			53
-#define CLK_MOUT_IS_VRA			54
-#define CLK_MOUT_IS_GDC			55
-#define CLK_GOUT_IS_BUS			56
-#define CLK_GOUT_IS_ITP			57
-#define CLK_GOUT_IS_VRA			58
-#define CLK_GOUT_IS_GDC			59
-#define CLK_DOUT_IS_BUS			60
-#define CLK_DOUT_IS_ITP			61
-#define CLK_DOUT_IS_VRA			62
-#define CLK_DOUT_IS_GDC			63
-#define CLK_MOUT_MFCMSCL_MFC		64
-#define CLK_MOUT_MFCMSCL_M2M		65
-#define CLK_MOUT_MFCMSCL_MCSC		66
-#define CLK_MOUT_MFCMSCL_JPEG		67
-#define CLK_GOUT_MFCMSCL_MFC		68
-#define CLK_GOUT_MFCMSCL_M2M		69
-#define CLK_GOUT_MFCMSCL_MCSC		70
-#define CLK_GOUT_MFCMSCL_JPEG		71
-#define CLK_DOUT_MFCMSCL_MFC		72
-#define CLK_DOUT_MFCMSCL_M2M		73
-#define CLK_DOUT_MFCMSCL_MCSC		74
-#define CLK_DOUT_MFCMSCL_JPEG		75
-#define CLK_MOUT_G3D_SWITCH		76
-#define CLK_GOUT_G3D_SWITCH		77
-#define CLK_DOUT_G3D_SWITCH		78
-
-/* CMU_APM */
-#define CLK_RCO_I3C_PMIC		1
-#define OSCCLK_RCO_APM			2
-#define CLK_RCO_APM__ALV		3
-#define CLK_DLL_DCO			4
-#define CLK_MOUT_APM_BUS_USER		5
-#define CLK_MOUT_RCO_APM_I3C_USER	6
-#define CLK_MOUT_RCO_APM_USER		7
-#define CLK_MOUT_DLL_USER		8
-#define CLK_MOUT_CLKCMU_CHUB_BUS	9
-#define CLK_MOUT_APM_BUS		10
-#define CLK_MOUT_APM_I3C		11
-#define CLK_DOUT_CLKCMU_CHUB_BUS	12
-#define CLK_DOUT_APM_BUS		13
-#define CLK_DOUT_APM_I3C		14
-#define CLK_GOUT_CLKCMU_CMGP_BUS	15
-#define CLK_GOUT_CLKCMU_CHUB_BUS	16
-#define CLK_GOUT_RTC_PCLK		17
-#define CLK_GOUT_TOP_RTC_PCLK		18
-#define CLK_GOUT_I3C_PCLK		19
-#define CLK_GOUT_I3C_SCLK		20
-#define CLK_GOUT_SPEEDY_PCLK		21
-#define CLK_GOUT_GPIO_ALIVE_PCLK	22
-#define CLK_GOUT_PMU_ALIVE_PCLK		23
-#define CLK_GOUT_SYSREG_APM_PCLK	24
-
-/* CMU_AUD */
-#define CLK_DOUT_AUD_AUDIF		1
-#define CLK_DOUT_AUD_BUSD		2
-#define CLK_DOUT_AUD_BUSP		3
-#define CLK_DOUT_AUD_CNT		4
-#define CLK_DOUT_AUD_CPU		5
-#define CLK_DOUT_AUD_CPU_ACLK		6
-#define CLK_DOUT_AUD_CPU_PCLKDBG	7
-#define CLK_DOUT_AUD_FM			8
-#define CLK_DOUT_AUD_FM_SPDY		9
-#define CLK_DOUT_AUD_MCLK		10
-#define CLK_DOUT_AUD_UAIF0		11
-#define CLK_DOUT_AUD_UAIF1		12
-#define CLK_DOUT_AUD_UAIF2		13
-#define CLK_DOUT_AUD_UAIF3		14
-#define CLK_DOUT_AUD_UAIF4		15
-#define CLK_DOUT_AUD_UAIF5		16
-#define CLK_DOUT_AUD_UAIF6		17
-#define CLK_FOUT_AUD_PLL		18
-#define CLK_GOUT_AUD_ABOX_ACLK		19
-#define CLK_GOUT_AUD_ASB_CCLK		20
-#define CLK_GOUT_AUD_CA32_CCLK		21
-#define CLK_GOUT_AUD_CNT_BCLK		22
-#define CLK_GOUT_AUD_CODEC_MCLK		23
-#define CLK_GOUT_AUD_DAP_CCLK		24
-#define CLK_GOUT_AUD_GPIO_PCLK		25
-#define CLK_GOUT_AUD_PPMU_ACLK		26
-#define CLK_GOUT_AUD_PPMU_PCLK		27
-#define CLK_GOUT_AUD_SPDY_BCLK		28
-#define CLK_GOUT_AUD_SYSMMU_CLK		29
-#define CLK_GOUT_AUD_SYSREG_PCLK	30
-#define CLK_GOUT_AUD_TZPC_PCLK		31
-#define CLK_GOUT_AUD_UAIF0_BCLK		32
-#define CLK_GOUT_AUD_UAIF1_BCLK		33
-#define CLK_GOUT_AUD_UAIF2_BCLK		34
-#define CLK_GOUT_AUD_UAIF3_BCLK		35
-#define CLK_GOUT_AUD_UAIF4_BCLK		36
-#define CLK_GOUT_AUD_UAIF5_BCLK		37
-#define CLK_GOUT_AUD_UAIF6_BCLK		38
-#define CLK_GOUT_AUD_WDT_PCLK		39
-#define CLK_MOUT_AUD_CPU		40
-#define CLK_MOUT_AUD_CPU_HCH		41
-#define CLK_MOUT_AUD_CPU_USER		42
-#define CLK_MOUT_AUD_FM			43
-#define CLK_MOUT_AUD_PLL		44
-#define CLK_MOUT_AUD_TICK_USB_USER	45
-#define CLK_MOUT_AUD_UAIF0		46
-#define CLK_MOUT_AUD_UAIF1		47
-#define CLK_MOUT_AUD_UAIF2		48
-#define CLK_MOUT_AUD_UAIF3		49
-#define CLK_MOUT_AUD_UAIF4		50
-#define CLK_MOUT_AUD_UAIF5		51
-#define CLK_MOUT_AUD_UAIF6		52
-#define IOCLK_AUDIOCDCLK0		53
-#define IOCLK_AUDIOCDCLK1		54
-#define IOCLK_AUDIOCDCLK2		55
-#define IOCLK_AUDIOCDCLK3		56
-#define IOCLK_AUDIOCDCLK4		57
-#define IOCLK_AUDIOCDCLK5		58
-#define IOCLK_AUDIOCDCLK6		59
-#define TICK_USB			60
-#define CLK_GOUT_AUD_CMU_AUD_PCLK	61
-
-/* CMU_CMGP */
-#define CLK_RCO_CMGP			1
-#define CLK_MOUT_CMGP_ADC		2
-#define CLK_MOUT_CMGP_USI0		3
-#define CLK_MOUT_CMGP_USI1		4
-#define CLK_DOUT_CMGP_ADC		5
-#define CLK_DOUT_CMGP_USI0		6
-#define CLK_DOUT_CMGP_USI1		7
-#define CLK_GOUT_CMGP_ADC_S0_PCLK	8
-#define CLK_GOUT_CMGP_ADC_S1_PCLK	9
-#define CLK_GOUT_CMGP_GPIO_PCLK		10
-#define CLK_GOUT_CMGP_USI0_IPCLK	11
-#define CLK_GOUT_CMGP_USI0_PCLK		12
-#define CLK_GOUT_CMGP_USI1_IPCLK	13
-#define CLK_GOUT_CMGP_USI1_PCLK		14
-#define CLK_GOUT_SYSREG_CMGP_PCLK	15
-
-/* CMU_G3D */
-#define CLK_FOUT_G3D_PLL		1
-#define CLK_MOUT_G3D_PLL		2
-#define CLK_MOUT_G3D_SWITCH_USER	3
-#define CLK_MOUT_G3D_BUSD		4
-#define CLK_DOUT_G3D_BUSP		5
-#define CLK_GOUT_G3D_CMU_G3D_PCLK	6
-#define CLK_GOUT_G3D_GPU_CLK		7
-#define CLK_GOUT_G3D_TZPC_PCLK		8
-#define CLK_GOUT_G3D_GRAY2BIN_CLK	9
-#define CLK_GOUT_G3D_BUSD_CLK		10
-#define CLK_GOUT_G3D_BUSP_CLK		11
-#define CLK_GOUT_G3D_SYSREG_PCLK	12
-
-/* CMU_HSI */
-#define CLK_MOUT_HSI_BUS_USER		1
-#define CLK_MOUT_HSI_MMC_CARD_USER	2
-#define CLK_MOUT_HSI_USB20DRD_USER	3
-#define CLK_MOUT_HSI_RTC		4
-#define CLK_GOUT_USB_RTC_CLK		5
-#define CLK_GOUT_USB_REF_CLK		6
-#define CLK_GOUT_USB_PHY_REF_CLK	7
-#define CLK_GOUT_USB_PHY_ACLK		8
-#define CLK_GOUT_USB_BUS_EARLY_CLK	9
-#define CLK_GOUT_GPIO_HSI_PCLK		10
-#define CLK_GOUT_MMC_CARD_ACLK		11
-#define CLK_GOUT_MMC_CARD_SDCLKIN	12
-#define CLK_GOUT_SYSREG_HSI_PCLK	13
-#define CLK_GOUT_HSI_PPMU_ACLK		14
-#define CLK_GOUT_HSI_PPMU_PCLK		15
-#define CLK_GOUT_HSI_CMU_HSI_PCLK	16
-
-/* CMU_IS */
-#define CLK_MOUT_IS_BUS_USER		1
-#define CLK_MOUT_IS_ITP_USER		2
-#define CLK_MOUT_IS_VRA_USER		3
-#define CLK_MOUT_IS_GDC_USER		4
-#define CLK_DOUT_IS_BUSP		5
-#define CLK_GOUT_IS_CMU_IS_PCLK		6
-#define CLK_GOUT_IS_CSIS0_ACLK		7
-#define CLK_GOUT_IS_CSIS1_ACLK		8
-#define CLK_GOUT_IS_CSIS2_ACLK		9
-#define CLK_GOUT_IS_TZPC_PCLK		10
-#define CLK_GOUT_IS_CSIS_DMA_CLK	11
-#define CLK_GOUT_IS_GDC_CLK		12
-#define CLK_GOUT_IS_IPP_CLK		13
-#define CLK_GOUT_IS_ITP_CLK		14
-#define CLK_GOUT_IS_MCSC_CLK		15
-#define CLK_GOUT_IS_VRA_CLK		16
-#define CLK_GOUT_IS_PPMU_IS0_ACLK	17
-#define CLK_GOUT_IS_PPMU_IS0_PCLK	18
-#define CLK_GOUT_IS_PPMU_IS1_ACLK	19
-#define CLK_GOUT_IS_PPMU_IS1_PCLK	20
-#define CLK_GOUT_IS_SYSMMU_IS0_CLK	21
-#define CLK_GOUT_IS_SYSMMU_IS1_CLK	22
-#define CLK_GOUT_IS_SYSREG_PCLK		23
-
-/* CMU_MFCMSCL */
-#define CLK_MOUT_MFCMSCL_MFC_USER		1
-#define CLK_MOUT_MFCMSCL_M2M_USER		2
-#define CLK_MOUT_MFCMSCL_MCSC_USER		3
-#define CLK_MOUT_MFCMSCL_JPEG_USER		4
-#define CLK_DOUT_MFCMSCL_BUSP			5
-#define CLK_GOUT_MFCMSCL_CMU_MFCMSCL_PCLK	6
-#define CLK_GOUT_MFCMSCL_TZPC_PCLK		7
-#define CLK_GOUT_MFCMSCL_JPEG_ACLK		8
-#define CLK_GOUT_MFCMSCL_M2M_ACLK		9
-#define CLK_GOUT_MFCMSCL_MCSC_CLK		10
-#define CLK_GOUT_MFCMSCL_MFC_ACLK		11
-#define CLK_GOUT_MFCMSCL_PPMU_ACLK		12
-#define CLK_GOUT_MFCMSCL_PPMU_PCLK		13
-#define CLK_GOUT_MFCMSCL_SYSMMU_CLK		14
-#define CLK_GOUT_MFCMSCL_SYSREG_PCLK		15
-
-/* CMU_PERI */
-#define CLK_MOUT_PERI_BUS_USER		1
-#define CLK_MOUT_PERI_UART_USER		2
-#define CLK_MOUT_PERI_HSI2C_USER	3
-#define CLK_MOUT_PERI_SPI_USER		4
-#define CLK_DOUT_PERI_HSI2C0		5
-#define CLK_DOUT_PERI_HSI2C1		6
-#define CLK_DOUT_PERI_HSI2C2		7
-#define CLK_DOUT_PERI_SPI0		8
-#define CLK_GOUT_PERI_HSI2C0		9
-#define CLK_GOUT_PERI_HSI2C1		10
-#define CLK_GOUT_PERI_HSI2C2		11
-#define CLK_GOUT_GPIO_PERI_PCLK		12
-#define CLK_GOUT_HSI2C0_IPCLK		13
-#define CLK_GOUT_HSI2C0_PCLK		14
-#define CLK_GOUT_HSI2C1_IPCLK		15
-#define CLK_GOUT_HSI2C1_PCLK		16
-#define CLK_GOUT_HSI2C2_IPCLK		17
-#define CLK_GOUT_HSI2C2_PCLK		18
-#define CLK_GOUT_I2C0_PCLK		19
-#define CLK_GOUT_I2C1_PCLK		20
-#define CLK_GOUT_I2C2_PCLK		21
-#define CLK_GOUT_I2C3_PCLK		22
-#define CLK_GOUT_I2C4_PCLK		23
-#define CLK_GOUT_I2C5_PCLK		24
-#define CLK_GOUT_I2C6_PCLK		25
-#define CLK_GOUT_MCT_PCLK		26
-#define CLK_GOUT_PWM_MOTOR_PCLK		27
-#define CLK_GOUT_SPI0_IPCLK		28
-#define CLK_GOUT_SPI0_PCLK		29
-#define CLK_GOUT_SYSREG_PERI_PCLK	30
-#define CLK_GOUT_UART_IPCLK		31
-#define CLK_GOUT_UART_PCLK		32
-#define CLK_GOUT_WDT0_PCLK		33
-#define CLK_GOUT_WDT1_PCLK		34
-
-/* CMU_CORE */
-#define CLK_MOUT_CORE_BUS_USER		1
-#define CLK_MOUT_CORE_CCI_USER		2
-#define CLK_MOUT_CORE_MMC_EMBD_USER	3
-#define CLK_MOUT_CORE_SSS_USER		4
-#define CLK_MOUT_CORE_GIC		5
-#define CLK_DOUT_CORE_BUSP		6
-#define CLK_GOUT_CCI_ACLK		7
-#define CLK_GOUT_GIC_CLK		8
-#define CLK_GOUT_MMC_EMBD_ACLK		9
-#define CLK_GOUT_MMC_EMBD_SDCLKIN	10
-#define CLK_GOUT_SSS_ACLK		11
-#define CLK_GOUT_SSS_PCLK		12
-#define CLK_GOUT_GPIO_CORE_PCLK		13
-#define CLK_GOUT_SYSREG_CORE_PCLK	14
-
-/* CMU_DPU */
-#define CLK_MOUT_DPU_USER		1
-#define CLK_DOUT_DPU_BUSP		2
-#define CLK_GOUT_DPU_CMU_DPU_PCLK	3
-#define CLK_GOUT_DPU_DECON0_ACLK	4
-#define CLK_GOUT_DPU_DMA_ACLK		5
-#define CLK_GOUT_DPU_DPP_ACLK		6
-#define CLK_GOUT_DPU_PPMU_ACLK		7
-#define CLK_GOUT_DPU_PPMU_PCLK		8
-#define CLK_GOUT_DPU_SMMU_CLK		9
-#define CLK_GOUT_DPU_SYSREG_PCLK	10
-#define DPU_NR_CLK			11
-
-#endif /* _DT_BINDINGS_CLOCK_EXYNOS_850_H */
diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
deleted file mode 100644
index a01af169d249..000000000000
--- a/include/dt-bindings/soc/samsung,exynos-usi.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
-/*
- * Copyright (c) 2021 Linaro Ltd.
- * Author: Sam Protsenko <semen.protsenko@linaro.org>
- *
- * Device Tree bindings for Samsung Exynos USI (Universal Serial Interface).
- */
-
-#ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
-#define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
-
-#define USI_V2_NONE		0
-#define USI_V2_UART		1
-#define USI_V2_SPI		2
-#define USI_V2_I2C		3
-
-#endif /* __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H */

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
