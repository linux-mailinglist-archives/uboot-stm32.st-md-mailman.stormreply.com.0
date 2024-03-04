Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19509870799
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Mar 2024 17:51:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D71C8C6DD69;
	Mon,  4 Mar 2024 16:51:46 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33C93C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 16:51:44 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-412e7fe4497so4791085e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 08:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709571104; x=1710175904;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uiRdn97K6xOZbr+D1s6wrAj84iwqttIRiCW8Yd/fxLA=;
 b=n1uC7TrfwzEKEI53CpcWl7InRf9lL9k62DuS8KTS4Uy1w3jEVTU6wWjT44DtvjIASa
 FMoaS51DnXCyBiOXAwigTQheVlP0umr+kJMpaBn+oJOMNBBcHKSnAIn5ta8UDILNxgri
 ZaXls+DCeqkQQQWozgO97MfNqnPUIn7pRZLCvDy1xwZaD4Jyy+rlU2t6P/euQ5YpR29T
 W6XUn9j3znp5y8mPoUq/SZnxs97spH+Xf7oQY1m8QbXXfkPJB43a3U91bNx4Knfo+GmF
 hkRGHKBMylONq+2oPEOCM66jpXj+nPy5dlPu9MKMoo+2VSfCP7tUz1rkzJjS4VPMhtOM
 08+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571104; x=1710175904;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uiRdn97K6xOZbr+D1s6wrAj84iwqttIRiCW8Yd/fxLA=;
 b=q7iF36riYzWa0PWNfeXDWAWmaN/i6Fg3n8MI60UJHuobwRa1JggAcKIi/j+c/NxJe5
 FiNIdltksVs0dDdP0KTTLAm40/BdlmbnjYSVRdSP7Y6w5Pgg9Bnnm/zOEJCXZlqdub3G
 m7qFPTtSDqqjviJQ7Y50z1wlzrhw3QOs+EBn8+NSYsmPc0pjRm4u8tiZ7YS/rjZs4RdQ
 29kq/nTV2ttpeoeuWY7+0GJEVZ0O0zptWtn7dg4xPPeQq9WAwqawo6/vzTcRfT20fYrM
 yv2AdRvGcNsJZCPIdNG/Tb2FDFo0JsVVV63Km55apDHWbYVmYUnOWmrRtZCD8ZXLL17S
 EPsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2uHSWTYnlA9AVxRWkdE0jG8Uo3F9OMNbKCH35rvDiTi0V70PLmMxgW9SHUskR+lJDp5p5FPbeEWbUIg8uHTswCAcgXJW/GgWuyjKD9362hf+P8OujAFfo
X-Gm-Message-State: AOJu0Yx7vk52l0jrrTPAZHcQbtzEnnY7Dfy9GRerrzchYRSYRKEa1FCw
 hjSTBtZFDprlR/ThDO1F5XRRHEif4Pmmunji/b1tBI2ZhA+gQi5sLyGFBv5R6ZQ=
X-Google-Smtp-Source: AGHT+IGRcyYJoIbF458ZeMJoCcWU7jjfXHBHGFnalG1R40e7oWXve4m0UCFndw47wuZwwE9Vw5ZTrQ==
X-Received: by 2002:a05:600c:5191:b0:412:e902:8795 with SMTP id
 fa17-20020a05600c519100b00412e9028795mr818947wmb.29.1709571103609; 
 Mon, 04 Mar 2024 08:51:43 -0800 (PST)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm10598517wmq.6.2024.03.04.08.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:51:43 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Mon, 04 Mar 2024 16:51:21 +0000
MIME-Version: 1.0
Message-Id: <20240304-b4-upstream-dt-headers-v1-13-b7ff41925f92@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=54928;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=mD2igxSwMWUw1prm5oiNBzGb5Gv9sgWgUUGdZqd4osA=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtSnf9h/WEkbON3mZvexTozV52HL419U6nWsZconnpnP2
 MM2tEd2lLIwCHIwyIopsoifWGbZtPayvcb2BRdg5rAygQxh4OIUgIlc3cXwP6PWjIvFOCtl/oz0
 kAJj57dfuaN2OPT8TAzTzzsZd/NAAMP/6s2sQe2ms1vuvF6kG2o8QyZM/kyGin51gMTP1aonljx
 /AwA=
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH RFC 13/26] ti: drop dt-binding headers
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

Drop in favour of dts/upstream

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/net/phy/dp83869.c                  |   2 +
 include/dt-bindings/bus/ti-sysc.h          |  28 ----
 include/dt-bindings/clk/ti-dra7-atl.h      |  40 -----
 include/dt-bindings/clock/am3.h            | 227 -----------------------------
 include/dt-bindings/clock/omap4.h          | 149 -------------------
 include/dt-bindings/clock/omap5.h          | 129 ----------------
 include/dt-bindings/media/omap3-isp.h      |  22 ---
 include/dt-bindings/mux/ti-serdes.h        | 190 ------------------------
 include/dt-bindings/net/ti-dp83867.h       |  53 -------
 include/dt-bindings/net/ti-dp83869.h       |  60 --------
 include/dt-bindings/phy/phy-ti.h           |  21 ---
 include/dt-bindings/pinctrl/am33xx.h       | 172 ----------------------
 include/dt-bindings/pinctrl/am43xx.h       |  39 -----
 include/dt-bindings/pinctrl/omap.h         |  91 ------------
 include/dt-bindings/reset/ti-syscon.h      |  38 -----
 include/dt-bindings/soc/ti,sci_pm_domain.h |   9 --
 16 files changed, 2 insertions(+), 1268 deletions(-)

diff --git a/drivers/net/phy/dp83869.c b/drivers/net/phy/dp83869.c
index f9d4782580e9..fa6be1f3ecde 100644
--- a/drivers/net/phy/dp83869.c
+++ b/drivers/net/phy/dp83869.c
@@ -105,8 +105,10 @@
 #define DP83869_IO_MUX_CFG_CLK_O_DISABLE	BIT(6)
 #define DP83869_IO_MUX_CFG_CLK_O_SEL_SHIFT	8
 #define DP83869_IO_MUX_CFG_CLK_O_SEL_MASK	\
 		GENMASK(0x1f, DP83869_IO_MUX_CFG_CLK_O_SEL_SHIFT)
+/* Special flag to indicate clock should be off */
+#define DP83869_CLK_O_SEL_OFF			0xFFFFFFFF
 
 /* CFG3 bits */
 #define DP83869_CFG3_PORT_MIRROR_EN		BIT(0)
 
diff --git a/include/dt-bindings/bus/ti-sysc.h b/include/dt-bindings/bus/ti-sysc.h
deleted file mode 100644
index eae427454374..000000000000
--- a/include/dt-bindings/bus/ti-sysc.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* TI sysc interconnect target module defines */
-
-/* Generic sysc found on omap2 and later, also known as type1 */
-#define SYSC_OMAP2_CLOCKACTIVITY	(3 << 8)
-#define SYSC_OMAP2_EMUFREE		(1 << 5)
-#define SYSC_OMAP2_ENAWAKEUP		(1 << 2)
-#define SYSC_OMAP2_SOFTRESET		(1 << 1)
-#define SYSC_OMAP2_AUTOIDLE		(1 << 0)
-
-/* Generic sysc found on omap4 and later, also known as type2 */
-#define SYSC_OMAP4_DMADISABLE		(1 << 16)
-#define SYSC_OMAP4_FREEEMU		(1 << 1)	/* Also known as EMUFREE */
-#define SYSC_OMAP4_SOFTRESET		(1 << 0)
-
-/* SmartReflex sysc found on 36xx and later */
-#define SYSC_OMAP3_SR_ENAWAKEUP		(1 << 26)
-
-#define SYSC_DRA7_MCAN_ENAWAKEUP	(1 << 4)
-
-/* PRUSS sysc found on AM33xx/AM43xx/AM57xx */
-#define SYSC_PRUSS_SUB_MWAIT		(1 << 5)
-#define SYSC_PRUSS_STANDBY_INIT		(1 << 4)
-
-/* SYSCONFIG STANDBYMODE/MIDLEMODE/SIDLEMODE supported by hardware */
-#define SYSC_IDLE_FORCE			0
-#define SYSC_IDLE_NO			1
-#define SYSC_IDLE_SMART			2
-#define SYSC_IDLE_SMART_WKUP		3
diff --git a/include/dt-bindings/clk/ti-dra7-atl.h b/include/dt-bindings/clk/ti-dra7-atl.h
deleted file mode 100644
index 42dd4164f6f4..000000000000
--- a/include/dt-bindings/clk/ti-dra7-atl.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/*
- * This header provides constants for DRA7 ATL (Audio Tracking Logic)
- *
- * The constants defined in this header are used in dts files
- *
- * Copyright (C) 2013 Texas Instruments, Inc.
- *
- * Peter Ujfalusi <peter.ujfalusi@ti.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef _DT_BINDINGS_CLK_DRA7_ATL_H
-#define _DT_BINDINGS_CLK_DRA7_ATL_H
-
-#define DRA7_ATL_WS_MCASP1_FSR		0
-#define DRA7_ATL_WS_MCASP1_FSX		1
-#define DRA7_ATL_WS_MCASP2_FSR		2
-#define DRA7_ATL_WS_MCASP2_FSX		3
-#define DRA7_ATL_WS_MCASP3_FSX		4
-#define DRA7_ATL_WS_MCASP4_FSX		5
-#define DRA7_ATL_WS_MCASP5_FSX		6
-#define DRA7_ATL_WS_MCASP6_FSX		7
-#define DRA7_ATL_WS_MCASP7_FSX		8
-#define DRA7_ATL_WS_MCASP8_FSX		9
-#define DRA7_ATL_WS_MCASP8_AHCLKX	10
-#define DRA7_ATL_WS_XREF_CLK3		11
-#define DRA7_ATL_WS_XREF_CLK0		12
-#define DRA7_ATL_WS_XREF_CLK1		13
-#define DRA7_ATL_WS_XREF_CLK2		14
-#define DRA7_ATL_WS_OSC1_X1		15
-
-#endif
diff --git a/include/dt-bindings/clock/am3.h b/include/dt-bindings/clock/am3.h
deleted file mode 100644
index 86a8806e2140..000000000000
--- a/include/dt-bindings/clock/am3.h
+++ /dev/null
@@ -1,227 +0,0 @@
-/*
- * Copyright 2017 Texas Instruments, Inc.
- *
- * This software is licensed under the terms of the GNU General Public
- * License version 2, as published by the Free Software Foundation, and
- * may be copied, distributed, and modified under those terms.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-#ifndef __DT_BINDINGS_CLK_AM3_H
-#define __DT_BINDINGS_CLK_AM3_H
-
-#define AM3_CLKCTRL_OFFSET	0x0
-#define AM3_CLKCTRL_INDEX(offset)	((offset) - AM3_CLKCTRL_OFFSET)
-
-/* XXX: Compatibility part begin, remove this once compatibility support is no longer needed */
-
-/* l4_per clocks */
-#define AM3_L4_PER_CLKCTRL_OFFSET	0x14
-#define AM3_L4_PER_CLKCTRL_INDEX(offset)	((offset) - AM3_L4_PER_CLKCTRL_OFFSET)
-#define AM3_CPGMAC0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x14)
-#define AM3_LCDC_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x18)
-#define AM3_USB_OTG_HS_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x1c)
-#define AM3_TPTC0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x24)
-#define AM3_EMIF_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x28)
-#define AM3_OCMCRAM_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x2c)
-#define AM3_GPMC_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x30)
-#define AM3_MCASP0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x34)
-#define AM3_UART6_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x38)
-#define AM3_MMC1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x3c)
-#define AM3_ELM_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x40)
-#define AM3_I2C3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x44)
-#define AM3_I2C2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x48)
-#define AM3_SPI0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x4c)
-#define AM3_SPI1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x50)
-#define AM3_L4_LS_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x60)
-#define AM3_MCASP1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x68)
-#define AM3_UART2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x6c)
-#define AM3_UART3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x70)
-#define AM3_UART4_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x74)
-#define AM3_UART5_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x78)
-#define AM3_TIMER7_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x7c)
-#define AM3_TIMER2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x80)
-#define AM3_TIMER3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x84)
-#define AM3_TIMER4_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x88)
-#define AM3_RNG_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x90)
-#define AM3_AES_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x94)
-#define AM3_SHAM_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xa0)
-#define AM3_GPIO2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xac)
-#define AM3_GPIO3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb0)
-#define AM3_GPIO4_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb4)
-#define AM3_TPCC_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xbc)
-#define AM3_D_CAN0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xc0)
-#define AM3_D_CAN1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xc4)
-#define AM3_EPWMSS1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xcc)
-#define AM3_EPWMSS0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xd4)
-#define AM3_EPWMSS2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xd8)
-#define AM3_L3_INSTR_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xdc)
-#define AM3_L3_MAIN_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xe0)
-#define AM3_PRUSS_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xe8)
-#define AM3_TIMER5_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xec)
-#define AM3_TIMER6_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xf0)
-#define AM3_MMC2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xf4)
-#define AM3_MMC3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xf8)
-#define AM3_TPTC1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xfc)
-#define AM3_TPTC2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x100)
-#define AM3_SPINLOCK_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x10c)
-#define AM3_MAILBOX_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x110)
-#define AM3_L4_HS_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x120)
-#define AM3_OCPWP_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x130)
-#define AM3_CLKDIV32K_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x14c)
-
-/* l4_wkup clocks */
-#define AM3_L4_WKUP_CLKCTRL_OFFSET	0x4
-#define AM3_L4_WKUP_CLKCTRL_INDEX(offset)	((offset) - AM3_L4_WKUP_CLKCTRL_OFFSET)
-#define AM3_CONTROL_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x4)
-#define AM3_GPIO1_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x8)
-#define AM3_L4_WKUP_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xc)
-#define AM3_DEBUGSS_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x14)
-#define AM3_WKUP_M3_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xb0)
-#define AM3_UART1_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xb4)
-#define AM3_I2C1_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xb8)
-#define AM3_ADC_TSC_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xbc)
-#define AM3_SMARTREFLEX0_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xc0)
-#define AM3_TIMER1_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xc4)
-#define AM3_SMARTREFLEX1_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xc8)
-#define AM3_WD_TIMER2_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xd4)
-
-/* mpu clocks */
-#define AM3_MPU_CLKCTRL_OFFSET	0x4
-#define AM3_MPU_CLKCTRL_INDEX(offset)	((offset) - AM3_MPU_CLKCTRL_OFFSET)
-#define AM3_MPU_CLKCTRL	AM3_MPU_CLKCTRL_INDEX(0x4)
-
-/* l4_rtc clocks */
-#define AM3_RTC_CLKCTRL	AM3_CLKCTRL_INDEX(0x0)
-
-/* gfx_l3 clocks */
-#define AM3_GFX_L3_CLKCTRL_OFFSET	0x4
-#define AM3_GFX_L3_CLKCTRL_INDEX(offset)	((offset) - AM3_GFX_L3_CLKCTRL_OFFSET)
-#define AM3_GFX_CLKCTRL	AM3_GFX_L3_CLKCTRL_INDEX(0x4)
-
-/* l4_cefuse clocks */
-#define AM3_L4_CEFUSE_CLKCTRL_OFFSET	0x20
-#define AM3_L4_CEFUSE_CLKCTRL_INDEX(offset)	((offset) - AM3_L4_CEFUSE_CLKCTRL_OFFSET)
-#define AM3_CEFUSE_CLKCTRL	AM3_L4_CEFUSE_CLKCTRL_INDEX(0x20)
-
-/* XXX: Compatibility part end */
-
-/* l4ls clocks */
-#define AM3_L4LS_CLKCTRL_OFFSET	0x38
-#define AM3_L4LS_CLKCTRL_INDEX(offset)	((offset) - AM3_L4LS_CLKCTRL_OFFSET)
-#define AM3_L4LS_UART6_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x38)
-#define AM3_L4LS_MMC1_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x3c)
-#define AM3_L4LS_ELM_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x40)
-#define AM3_L4LS_I2C3_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x44)
-#define AM3_L4LS_I2C2_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x48)
-#define AM3_L4LS_SPI0_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x4c)
-#define AM3_L4LS_SPI1_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x50)
-#define AM3_L4LS_L4_LS_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x60)
-#define AM3_L4LS_UART2_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x6c)
-#define AM3_L4LS_UART3_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x70)
-#define AM3_L4LS_UART4_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x74)
-#define AM3_L4LS_UART5_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x78)
-#define AM3_L4LS_TIMER7_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x7c)
-#define AM3_L4LS_TIMER2_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x80)
-#define AM3_L4LS_TIMER3_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x84)
-#define AM3_L4LS_TIMER4_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x88)
-#define AM3_L4LS_RNG_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x90)
-#define AM3_L4LS_GPIO2_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xac)
-#define AM3_L4LS_GPIO3_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb0)
-#define AM3_L4LS_GPIO4_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb4)
-#define AM3_L4LS_D_CAN0_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xc0)
-#define AM3_L4LS_D_CAN1_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xc4)
-#define AM3_L4LS_EPWMSS1_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xcc)
-#define AM3_L4LS_EPWMSS0_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xd4)
-#define AM3_L4LS_EPWMSS2_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xd8)
-#define AM3_L4LS_TIMER5_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xec)
-#define AM3_L4LS_TIMER6_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xf0)
-#define AM3_L4LS_MMC2_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xf4)
-#define AM3_L4LS_SPINLOCK_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x10c)
-#define AM3_L4LS_MAILBOX_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x110)
-#define AM3_L4LS_OCPWP_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x130)
-
-/* l3s clocks */
-#define AM3_L3S_CLKCTRL_OFFSET	0x1c
-#define AM3_L3S_CLKCTRL_INDEX(offset)	((offset) - AM3_L3S_CLKCTRL_OFFSET)
-#define AM3_L3S_USB_OTG_HS_CLKCTRL	AM3_L3S_CLKCTRL_INDEX(0x1c)
-#define AM3_L3S_GPMC_CLKCTRL	AM3_L3S_CLKCTRL_INDEX(0x30)
-#define AM3_L3S_MCASP0_CLKCTRL	AM3_L3S_CLKCTRL_INDEX(0x34)
-#define AM3_L3S_MCASP1_CLKCTRL	AM3_L3S_CLKCTRL_INDEX(0x68)
-#define AM3_L3S_MMC3_CLKCTRL	AM3_L3S_CLKCTRL_INDEX(0xf8)
-
-/* l3 clocks */
-#define AM3_L3_CLKCTRL_OFFSET	0x24
-#define AM3_L3_CLKCTRL_INDEX(offset)	((offset) - AM3_L3_CLKCTRL_OFFSET)
-#define AM3_L3_TPTC0_CLKCTRL	AM3_L3_CLKCTRL_INDEX(0x24)
-#define AM3_L3_EMIF_CLKCTRL	AM3_L3_CLKCTRL_INDEX(0x28)
-#define AM3_L3_OCMCRAM_CLKCTRL	AM3_L3_CLKCTRL_INDEX(0x2c)
-#define AM3_L3_AES_CLKCTRL	AM3_L3_CLKCTRL_INDEX(0x94)
-#define AM3_L3_SHAM_CLKCTRL	AM3_L3_CLKCTRL_INDEX(0xa0)
-#define AM3_L3_TPCC_CLKCTRL	AM3_L3_CLKCTRL_INDEX(0xbc)
-#define AM3_L3_L3_INSTR_CLKCTRL	AM3_L3_CLKCTRL_INDEX(0xdc)
-#define AM3_L3_L3_MAIN_CLKCTRL	AM3_L3_CLKCTRL_INDEX(0xe0)
-#define AM3_L3_TPTC1_CLKCTRL	AM3_L3_CLKCTRL_INDEX(0xfc)
-#define AM3_L3_TPTC2_CLKCTRL	AM3_L3_CLKCTRL_INDEX(0x100)
-
-/* l4hs clocks */
-#define AM3_L4HS_CLKCTRL_OFFSET	0x120
-#define AM3_L4HS_CLKCTRL_INDEX(offset)	((offset) - AM3_L4HS_CLKCTRL_OFFSET)
-#define AM3_L4HS_L4_HS_CLKCTRL	AM3_L4HS_CLKCTRL_INDEX(0x120)
-
-/* pruss_ocp clocks */
-#define AM3_PRUSS_OCP_CLKCTRL_OFFSET	0xe8
-#define AM3_PRUSS_OCP_CLKCTRL_INDEX(offset)	((offset) - AM3_PRUSS_OCP_CLKCTRL_OFFSET)
-#define AM3_PRUSS_OCP_PRUSS_CLKCTRL	AM3_PRUSS_OCP_CLKCTRL_INDEX(0xe8)
-
-/* cpsw_125mhz clocks */
-#define AM3_CPSW_125MHZ_CPGMAC0_CLKCTRL	AM3_CLKCTRL_INDEX(0x14)
-
-/* lcdc clocks */
-#define AM3_LCDC_CLKCTRL_OFFSET	0x18
-#define AM3_LCDC_CLKCTRL_INDEX(offset)	((offset) - AM3_LCDC_CLKCTRL_OFFSET)
-#define AM3_LCDC_LCDC_CLKCTRL	AM3_LCDC_CLKCTRL_INDEX(0x18)
-
-/* clk_24mhz clocks */
-#define AM3_CLK_24MHZ_CLKCTRL_OFFSET	0x14c
-#define AM3_CLK_24MHZ_CLKCTRL_INDEX(offset)	((offset) - AM3_CLK_24MHZ_CLKCTRL_OFFSET)
-#define AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL	AM3_CLK_24MHZ_CLKCTRL_INDEX(0x14c)
-
-/* l4_wkup clocks */
-#define AM3_L4_WKUP_CONTROL_CLKCTRL	AM3_CLKCTRL_INDEX(0x4)
-#define AM3_L4_WKUP_GPIO1_CLKCTRL	AM3_CLKCTRL_INDEX(0x8)
-#define AM3_L4_WKUP_L4_WKUP_CLKCTRL	AM3_CLKCTRL_INDEX(0xc)
-#define AM3_L4_WKUP_UART1_CLKCTRL	AM3_CLKCTRL_INDEX(0xb4)
-#define AM3_L4_WKUP_I2C1_CLKCTRL	AM3_CLKCTRL_INDEX(0xb8)
-#define AM3_L4_WKUP_ADC_TSC_CLKCTRL	AM3_CLKCTRL_INDEX(0xbc)
-#define AM3_L4_WKUP_SMARTREFLEX0_CLKCTRL	AM3_CLKCTRL_INDEX(0xc0)
-#define AM3_L4_WKUP_TIMER1_CLKCTRL	AM3_CLKCTRL_INDEX(0xc4)
-#define AM3_L4_WKUP_SMARTREFLEX1_CLKCTRL	AM3_CLKCTRL_INDEX(0xc8)
-#define AM3_L4_WKUP_WD_TIMER2_CLKCTRL	AM3_CLKCTRL_INDEX(0xd4)
-
-/* l3_aon clocks */
-#define AM3_L3_AON_CLKCTRL_OFFSET	0x14
-#define AM3_L3_AON_CLKCTRL_INDEX(offset)	((offset) - AM3_L3_AON_CLKCTRL_OFFSET)
-#define AM3_L3_AON_DEBUGSS_CLKCTRL	AM3_L3_AON_CLKCTRL_INDEX(0x14)
-
-/* l4_wkup_aon clocks */
-#define AM3_L4_WKUP_AON_CLKCTRL_OFFSET	0xb0
-#define AM3_L4_WKUP_AON_CLKCTRL_INDEX(offset)	((offset) - AM3_L4_WKUP_AON_CLKCTRL_OFFSET)
-#define AM3_L4_WKUP_AON_WKUP_M3_CLKCTRL	AM3_L4_WKUP_AON_CLKCTRL_INDEX(0xb0)
-
-/* mpu clocks */
-#define AM3_MPU_MPU_CLKCTRL	AM3_CLKCTRL_INDEX(0x4)
-
-/* l4_rtc clocks */
-#define AM3_L4_RTC_RTC_CLKCTRL	AM3_CLKCTRL_INDEX(0x0)
-
-/* gfx_l3 clocks */
-#define AM3_GFX_L3_GFX_CLKCTRL	AM3_CLKCTRL_INDEX(0x4)
-
-/* l4_cefuse clocks */
-#define AM3_L4_CEFUSE_CEFUSE_CLKCTRL	AM3_CLKCTRL_INDEX(0x20)
-
-#endif
diff --git a/include/dt-bindings/clock/omap4.h b/include/dt-bindings/clock/omap4.h
deleted file mode 100644
index 88d73be84b94..000000000000
--- a/include/dt-bindings/clock/omap4.h
+++ /dev/null
@@ -1,149 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright 2017 Texas Instruments, Inc.
- */
-#ifndef __DT_BINDINGS_CLK_OMAP4_H
-#define __DT_BINDINGS_CLK_OMAP4_H
-
-#define OMAP4_CLKCTRL_OFFSET	0x20
-#define OMAP4_CLKCTRL_INDEX(offset)	((offset) - OMAP4_CLKCTRL_OFFSET)
-
-/* mpuss clocks */
-#define OMAP4_MPU_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-
-/* tesla clocks */
-#define OMAP4_DSP_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-
-/* abe clocks */
-#define OMAP4_L4_ABE_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-#define OMAP4_AESS_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x28)
-#define OMAP4_MCPDM_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x30)
-#define OMAP4_DMIC_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x38)
-#define OMAP4_MCASP_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x40)
-#define OMAP4_MCBSP1_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x48)
-#define OMAP4_MCBSP2_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x50)
-#define OMAP4_MCBSP3_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x58)
-#define OMAP4_SLIMBUS1_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x60)
-#define OMAP4_TIMER5_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x68)
-#define OMAP4_TIMER6_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x70)
-#define OMAP4_TIMER7_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x78)
-#define OMAP4_TIMER8_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x80)
-#define OMAP4_WD_TIMER3_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x88)
-
-/* l4_ao clocks */
-#define OMAP4_SMARTREFLEX_MPU_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x28)
-#define OMAP4_SMARTREFLEX_IVA_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x30)
-#define OMAP4_SMARTREFLEX_CORE_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x38)
-
-/* l3_1 clocks */
-#define OMAP4_L3_MAIN_1_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-
-/* l3_2 clocks */
-#define OMAP4_L3_MAIN_2_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-#define OMAP4_GPMC_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x28)
-#define OMAP4_OCMC_RAM_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x30)
-
-/* ducati clocks */
-#define OMAP4_IPU_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-
-/* l3_dma clocks */
-#define OMAP4_DMA_SYSTEM_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-
-/* l3_emif clocks */
-#define OMAP4_DMM_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-#define OMAP4_EMIF1_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x30)
-#define OMAP4_EMIF2_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x38)
-
-/* d2d clocks */
-#define OMAP4_C2C_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-
-/* l4_cfg clocks */
-#define OMAP4_L4_CFG_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-#define OMAP4_SPINLOCK_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x28)
-#define OMAP4_MAILBOX_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x30)
-
-/* l3_instr clocks */
-#define OMAP4_L3_MAIN_3_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-#define OMAP4_L3_INSTR_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x28)
-#define OMAP4_OCP_WP_NOC_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x40)
-
-/* ivahd clocks */
-#define OMAP4_IVA_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-#define OMAP4_SL2IF_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x28)
-
-/* iss clocks */
-#define OMAP4_ISS_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-#define OMAP4_FDIF_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x28)
-
-/* l3_dss clocks */
-#define OMAP4_DSS_CORE_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-
-/* l3_gfx clocks */
-#define OMAP4_GPU_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-
-/* l3_init clocks */
-#define OMAP4_MMC1_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x28)
-#define OMAP4_MMC2_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x30)
-#define OMAP4_HSI_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x38)
-#define OMAP4_USB_HOST_HS_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x58)
-#define OMAP4_USB_OTG_HS_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x60)
-#define OMAP4_USB_TLL_HS_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x68)
-#define OMAP4_USB_HOST_FS_CLKCTRL	OMAP4_CLKCTRL_INDEX(0xd0)
-#define OMAP4_OCP2SCP_USB_PHY_CLKCTRL	OMAP4_CLKCTRL_INDEX(0xe0)
-
-/* l4_per clocks */
-#define OMAP4_TIMER10_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x28)
-#define OMAP4_TIMER11_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x30)
-#define OMAP4_TIMER2_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x38)
-#define OMAP4_TIMER3_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x40)
-#define OMAP4_TIMER4_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x48)
-#define OMAP4_TIMER9_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x50)
-#define OMAP4_ELM_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x58)
-#define OMAP4_GPIO2_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x60)
-#define OMAP4_GPIO3_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x68)
-#define OMAP4_GPIO4_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x70)
-#define OMAP4_GPIO5_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x78)
-#define OMAP4_GPIO6_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x80)
-#define OMAP4_HDQ1W_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x88)
-#define OMAP4_I2C1_CLKCTRL	OMAP4_CLKCTRL_INDEX(0xa0)
-#define OMAP4_I2C2_CLKCTRL	OMAP4_CLKCTRL_INDEX(0xa8)
-#define OMAP4_I2C3_CLKCTRL	OMAP4_CLKCTRL_INDEX(0xb0)
-#define OMAP4_I2C4_CLKCTRL	OMAP4_CLKCTRL_INDEX(0xb8)
-#define OMAP4_L4_PER_CLKCTRL	OMAP4_CLKCTRL_INDEX(0xc0)
-#define OMAP4_MCBSP4_CLKCTRL	OMAP4_CLKCTRL_INDEX(0xe0)
-#define OMAP4_MCSPI1_CLKCTRL	OMAP4_CLKCTRL_INDEX(0xf0)
-#define OMAP4_MCSPI2_CLKCTRL	OMAP4_CLKCTRL_INDEX(0xf8)
-#define OMAP4_MCSPI3_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x100)
-#define OMAP4_MCSPI4_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x108)
-#define OMAP4_MMC3_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x120)
-#define OMAP4_MMC4_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x128)
-#define OMAP4_SLIMBUS2_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x138)
-#define OMAP4_UART1_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x140)
-#define OMAP4_UART2_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x148)
-#define OMAP4_UART3_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x150)
-#define OMAP4_UART4_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x158)
-#define OMAP4_MMC5_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x160)
-
-/* l4_secure clocks */
-#define OMAP4_L4_SECURE_CLKCTRL_OFFSET	0x1a0
-#define OMAP4_L4_SECURE_CLKCTRL_INDEX(offset)	((offset) - OMAP4_L4_SECURE_CLKCTRL_OFFSET)
-#define OMAP4_AES1_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1a0)
-#define OMAP4_AES2_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1a8)
-#define OMAP4_DES3DES_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1b0)
-#define OMAP4_PKA_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1b8)
-#define OMAP4_RNG_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1c0)
-#define OMAP4_SHA2MD5_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1c8)
-#define OMAP4_CRYPTODMA_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1d8)
-
-/* l4_wkup clocks */
-#define OMAP4_L4_WKUP_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-#define OMAP4_WD_TIMER2_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x30)
-#define OMAP4_GPIO1_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x38)
-#define OMAP4_TIMER1_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x40)
-#define OMAP4_COUNTER_32K_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x50)
-#define OMAP4_KBD_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x78)
-
-/* emu_sys clocks */
-#define OMAP4_DEBUGSS_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
-
-#endif
diff --git a/include/dt-bindings/clock/omap5.h b/include/dt-bindings/clock/omap5.h
deleted file mode 100644
index 41775272fd27..000000000000
--- a/include/dt-bindings/clock/omap5.h
+++ /dev/null
@@ -1,129 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright 2017 Texas Instruments, Inc.
- */
-#ifndef __DT_BINDINGS_CLK_OMAP5_H
-#define __DT_BINDINGS_CLK_OMAP5_H
-
-#define OMAP5_CLKCTRL_OFFSET	0x20
-#define OMAP5_CLKCTRL_INDEX(offset)	((offset) - OMAP5_CLKCTRL_OFFSET)
-
-/* mpu clocks */
-#define OMAP5_MPU_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-
-/* dsp clocks */
-#define OMAP5_MMU_DSP_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-
-/* abe clocks */
-#define OMAP5_L4_ABE_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-#define OMAP5_AESS_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x28)
-#define OMAP5_MCPDM_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x30)
-#define OMAP5_DMIC_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x38)
-#define OMAP5_MCBSP1_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x48)
-#define OMAP5_MCBSP2_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x50)
-#define OMAP5_MCBSP3_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x58)
-#define OMAP5_TIMER5_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x68)
-#define OMAP5_TIMER6_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x70)
-#define OMAP5_TIMER7_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x78)
-#define OMAP5_TIMER8_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x80)
-
-/* l3main1 clocks */
-#define OMAP5_L3_MAIN_1_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-
-/* l3main2 clocks */
-#define OMAP5_L3_MAIN_2_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-
-/* ipu clocks */
-#define OMAP5_MMU_IPU_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-
-/* dma clocks */
-#define OMAP5_DMA_SYSTEM_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-
-/* emif clocks */
-#define OMAP5_DMM_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-#define OMAP5_EMIF1_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x30)
-#define OMAP5_EMIF2_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x38)
-
-/* l4cfg clocks */
-#define OMAP5_L4_CFG_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-#define OMAP5_SPINLOCK_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x28)
-#define OMAP5_MAILBOX_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x30)
-
-/* l3instr clocks */
-#define OMAP5_L3_MAIN_3_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-#define OMAP5_L3_INSTR_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x28)
-
-/* l4per clocks */
-#define OMAP5_TIMER10_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x28)
-#define OMAP5_TIMER11_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x30)
-#define OMAP5_TIMER2_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x38)
-#define OMAP5_TIMER3_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x40)
-#define OMAP5_TIMER4_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x48)
-#define OMAP5_TIMER9_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x50)
-#define OMAP5_GPIO2_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x60)
-#define OMAP5_GPIO3_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x68)
-#define OMAP5_GPIO4_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x70)
-#define OMAP5_GPIO5_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x78)
-#define OMAP5_GPIO6_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x80)
-#define OMAP5_I2C1_CLKCTRL	OMAP5_CLKCTRL_INDEX(0xa0)
-#define OMAP5_I2C2_CLKCTRL	OMAP5_CLKCTRL_INDEX(0xa8)
-#define OMAP5_I2C3_CLKCTRL	OMAP5_CLKCTRL_INDEX(0xb0)
-#define OMAP5_I2C4_CLKCTRL	OMAP5_CLKCTRL_INDEX(0xb8)
-#define OMAP5_L4_PER_CLKCTRL	OMAP5_CLKCTRL_INDEX(0xc0)
-#define OMAP5_MCSPI1_CLKCTRL	OMAP5_CLKCTRL_INDEX(0xf0)
-#define OMAP5_MCSPI2_CLKCTRL	OMAP5_CLKCTRL_INDEX(0xf8)
-#define OMAP5_MCSPI3_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x100)
-#define OMAP5_MCSPI4_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x108)
-#define OMAP5_GPIO7_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x110)
-#define OMAP5_GPIO8_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x118)
-#define OMAP5_MMC3_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x120)
-#define OMAP5_MMC4_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x128)
-#define OMAP5_UART1_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x140)
-#define OMAP5_UART2_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x148)
-#define OMAP5_UART3_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x150)
-#define OMAP5_UART4_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x158)
-#define OMAP5_MMC5_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x160)
-#define OMAP5_I2C5_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x168)
-#define OMAP5_UART5_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x170)
-#define OMAP5_UART6_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x178)
-
-/* l4_secure clocks */
-#define OMAP5_L4_SECURE_CLKCTRL_OFFSET	0x1a0
-#define OMAP5_L4_SECURE_CLKCTRL_INDEX(offset)	((offset) - OMAP5_L4_SECURE_CLKCTRL_OFFSET)
-#define OMAP5_AES1_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1a0)
-#define OMAP5_AES2_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1a8)
-#define OMAP5_DES3DES_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1b0)
-#define OMAP5_FPKA_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1b8)
-#define OMAP5_RNG_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1c0)
-#define OMAP5_SHA2MD5_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1c8)
-#define OMAP5_DMA_CRYPTO_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1d8)
-
-/* iva clocks */
-#define OMAP5_IVA_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-#define OMAP5_SL2IF_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x28)
-
-/* dss clocks */
-#define OMAP5_DSS_CORE_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-
-/* gpu clocks */
-#define OMAP5_GPU_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-
-/* l3init clocks */
-#define OMAP5_MMC1_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x28)
-#define OMAP5_MMC2_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x30)
-#define OMAP5_USB_HOST_HS_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x58)
-#define OMAP5_USB_TLL_HS_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x68)
-#define OMAP5_SATA_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x88)
-#define OMAP5_OCP2SCP1_CLKCTRL	OMAP5_CLKCTRL_INDEX(0xe0)
-#define OMAP5_OCP2SCP3_CLKCTRL	OMAP5_CLKCTRL_INDEX(0xe8)
-#define OMAP5_USB_OTG_SS_CLKCTRL	OMAP5_CLKCTRL_INDEX(0xf0)
-
-/* wkupaon clocks */
-#define OMAP5_L4_WKUP_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-#define OMAP5_WD_TIMER2_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x30)
-#define OMAP5_GPIO1_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x38)
-#define OMAP5_TIMER1_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x40)
-#define OMAP5_COUNTER_32K_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x50)
-#define OMAP5_KBD_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x78)
-
-#endif
diff --git a/include/dt-bindings/media/omap3-isp.h b/include/dt-bindings/media/omap3-isp.h
deleted file mode 100644
index 4e4208462142..000000000000
--- a/include/dt-bindings/media/omap3-isp.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * include/dt-bindings/media/omap3-isp.h
- *
- * Copyright (C) 2015 Sakari Ailus
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- */
-
-#ifndef __DT_BINDINGS_OMAP3_ISP_H__
-#define __DT_BINDINGS_OMAP3_ISP_H__
-
-#define OMAP3ISP_PHY_TYPE_COMPLEX_IO   0
-#define OMAP3ISP_PHY_TYPE_CSIPHY       1
-
-#endif /* __DT_BINDINGS_OMAP3_ISP_H__ */
diff --git a/include/dt-bindings/mux/ti-serdes.h b/include/dt-bindings/mux/ti-serdes.h
deleted file mode 100644
index b0b1091aad6d..000000000000
--- a/include/dt-bindings/mux/ti-serdes.h
+++ /dev/null
@@ -1,190 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants for SERDES MUX for TI SoCs
- */
-
-#ifndef _DT_BINDINGS_MUX_TI_SERDES
-#define _DT_BINDINGS_MUX_TI_SERDES
-
-/*
- * These bindings are deprecated, because they do not match the actual
- * concept of bindings but rather contain pure constants values used only
- * in DTS board files.
- * Instead include the header in the DTS source directory.
- */
-#warning "These bindings are deprecated. Instead, use the header in the DTS source directory."
-
-/* J721E */
-
-#define J721E_SERDES0_LANE0_QSGMII_LANE1	0x0
-#define J721E_SERDES0_LANE0_PCIE0_LANE0		0x1
-#define J721E_SERDES0_LANE0_USB3_0_SWAP		0x2
-#define J721E_SERDES0_LANE0_IP4_UNUSED		0x3
-
-#define J721E_SERDES0_LANE1_QSGMII_LANE2	0x0
-#define J721E_SERDES0_LANE1_PCIE0_LANE1		0x1
-#define J721E_SERDES0_LANE1_USB3_0		0x2
-#define J721E_SERDES0_LANE1_IP4_UNUSED		0x3
-
-#define J721E_SERDES1_LANE0_QSGMII_LANE3	0x0
-#define J721E_SERDES1_LANE0_PCIE1_LANE0		0x1
-#define J721E_SERDES1_LANE0_USB3_1_SWAP		0x2
-#define J721E_SERDES1_LANE0_SGMII_LANE0		0x3
-
-#define J721E_SERDES1_LANE1_QSGMII_LANE4	0x0
-#define J721E_SERDES1_LANE1_PCIE1_LANE1		0x1
-#define J721E_SERDES1_LANE1_USB3_1		0x2
-#define J721E_SERDES1_LANE1_SGMII_LANE1		0x3
-
-#define J721E_SERDES2_LANE0_IP1_UNUSED		0x0
-#define J721E_SERDES2_LANE0_PCIE2_LANE0		0x1
-#define J721E_SERDES2_LANE0_USB3_1_SWAP		0x2
-#define J721E_SERDES2_LANE0_SGMII_LANE0		0x3
-
-#define J721E_SERDES2_LANE1_IP1_UNUSED		0x0
-#define J721E_SERDES2_LANE1_PCIE2_LANE1		0x1
-#define J721E_SERDES2_LANE1_USB3_1		0x2
-#define J721E_SERDES2_LANE1_SGMII_LANE1		0x3
-
-#define J721E_SERDES3_LANE0_IP1_UNUSED		0x0
-#define J721E_SERDES3_LANE0_PCIE3_LANE0		0x1
-#define J721E_SERDES3_LANE0_USB3_0_SWAP		0x2
-#define J721E_SERDES3_LANE0_IP4_UNUSED		0x3
-
-#define J721E_SERDES3_LANE1_IP1_UNUSED		0x0
-#define J721E_SERDES3_LANE1_PCIE3_LANE1		0x1
-#define J721E_SERDES3_LANE1_USB3_0		0x2
-#define J721E_SERDES3_LANE1_IP4_UNUSED		0x3
-
-#define J721E_SERDES4_LANE0_EDP_LANE0		0x0
-#define J721E_SERDES4_LANE0_IP2_UNUSED		0x1
-#define J721E_SERDES4_LANE0_QSGMII_LANE5	0x2
-#define J721E_SERDES4_LANE0_IP4_UNUSED		0x3
-
-#define J721E_SERDES4_LANE1_EDP_LANE1		0x0
-#define J721E_SERDES4_LANE1_IP2_UNUSED		0x1
-#define J721E_SERDES4_LANE1_QSGMII_LANE6	0x2
-#define J721E_SERDES4_LANE1_IP4_UNUSED		0x3
-
-#define J721E_SERDES4_LANE2_EDP_LANE2		0x0
-#define J721E_SERDES4_LANE2_IP2_UNUSED		0x1
-#define J721E_SERDES4_LANE2_QSGMII_LANE7	0x2
-#define J721E_SERDES4_LANE2_IP4_UNUSED		0x3
-
-#define J721E_SERDES4_LANE3_EDP_LANE3		0x0
-#define J721E_SERDES4_LANE3_IP2_UNUSED		0x1
-#define J721E_SERDES4_LANE3_QSGMII_LANE8	0x2
-#define J721E_SERDES4_LANE3_IP4_UNUSED		0x3
-
-/* J7200 */
-
-#define J7200_SERDES0_LANE0_QSGMII_LANE3	0x0
-#define J7200_SERDES0_LANE0_PCIE1_LANE0		0x1
-#define J7200_SERDES0_LANE0_IP3_UNUSED		0x2
-#define J7200_SERDES0_LANE0_IP4_UNUSED		0x3
-
-#define J7200_SERDES0_LANE1_QSGMII_LANE4	0x0
-#define J7200_SERDES0_LANE1_PCIE1_LANE1		0x1
-#define J7200_SERDES0_LANE1_IP3_UNUSED		0x2
-#define J7200_SERDES0_LANE1_IP4_UNUSED		0x3
-
-#define J7200_SERDES0_LANE2_QSGMII_LANE1	0x0
-#define J7200_SERDES0_LANE2_PCIE1_LANE2		0x1
-#define J7200_SERDES0_LANE2_IP3_UNUSED		0x2
-#define J7200_SERDES0_LANE2_IP4_UNUSED		0x3
-
-#define J7200_SERDES0_LANE3_QSGMII_LANE2	0x0
-#define J7200_SERDES0_LANE3_PCIE1_LANE3		0x1
-#define J7200_SERDES0_LANE3_USB			0x2
-#define J7200_SERDES0_LANE3_IP4_UNUSED		0x3
-
-/* AM64 */
-
-#define AM64_SERDES0_LANE0_PCIE0		0x0
-#define AM64_SERDES0_LANE0_USB			0x1
-
-/* J721S2 */
-
-#define J721S2_SERDES0_LANE0_EDP_LANE0		0x0
-#define J721S2_SERDES0_LANE0_PCIE1_LANE0	0x1
-#define J721S2_SERDES0_LANE0_IP3_UNUSED		0x2
-#define J721S2_SERDES0_LANE0_IP4_UNUSED		0x3
-
-#define J721S2_SERDES0_LANE1_EDP_LANE1		0x0
-#define J721S2_SERDES0_LANE1_PCIE1_LANE1	0x1
-#define J721S2_SERDES0_LANE1_USB		0x2
-#define J721S2_SERDES0_LANE1_IP4_UNUSED		0x3
-
-#define J721S2_SERDES0_LANE2_EDP_LANE2		0x0
-#define J721S2_SERDES0_LANE2_PCIE1_LANE2	0x1
-#define J721S2_SERDES0_LANE2_IP3_UNUSED		0x2
-#define J721S2_SERDES0_LANE2_IP4_UNUSED		0x3
-
-#define J721S2_SERDES0_LANE3_EDP_LANE3		0x0
-#define J721S2_SERDES0_LANE3_PCIE1_LANE3	0x1
-#define J721S2_SERDES0_LANE3_USB		0x2
-#define J721S2_SERDES0_LANE3_IP4_UNUSED		0x3
-
-/* J784S4 */
-
-#define J784S4_SERDES0_LANE0_IP1_UNUSED		0x0
-#define J784S4_SERDES0_LANE0_PCIE1_LANE0	0x1
-#define J784S4_SERDES0_LANE0_IP3_UNUSED		0x2
-#define J784S4_SERDES0_LANE0_IP4_UNUSED		0x3
-
-#define J784S4_SERDES0_LANE1_IP1_UNUSED		0x0
-#define J784S4_SERDES0_LANE1_PCIE1_LANE1	0x1
-#define J784S4_SERDES0_LANE1_IP3_UNUSED		0x2
-#define J784S4_SERDES0_LANE1_IP4_UNUSED		0x3
-
-#define J784S4_SERDES0_LANE2_PCIE3_LANE0	0x0
-#define J784S4_SERDES0_LANE2_PCIE1_LANE2	0x1
-#define J784S4_SERDES0_LANE2_IP3_UNUSED		0x2
-#define J784S4_SERDES0_LANE2_IP4_UNUSED		0x3
-
-#define J784S4_SERDES0_LANE3_PCIE3_LANE1	0x0
-#define J784S4_SERDES0_LANE3_PCIE1_LANE3	0x1
-#define J784S4_SERDES0_LANE3_USB		0x2
-#define J784S4_SERDES0_LANE3_IP4_UNUSED		0x3
-
-#define J784S4_SERDES1_LANE0_QSGMII_LANE3	0x0
-#define J784S4_SERDES1_LANE0_PCIE0_LANE0	0x1
-#define J784S4_SERDES1_LANE0_IP3_UNUSED		0x2
-#define J784S4_SERDES1_LANE0_IP4_UNUSED		0x3
-
-#define J784S4_SERDES1_LANE1_QSGMII_LANE4	0x0
-#define J784S4_SERDES1_LANE1_PCIE0_LANE1	0x1
-#define J784S4_SERDES1_LANE1_IP3_UNUSED		0x2
-#define J784S4_SERDES1_LANE1_IP4_UNUSED		0x3
-
-#define J784S4_SERDES1_LANE2_QSGMII_LANE1	0x0
-#define J784S4_SERDES1_LANE2_PCIE0_LANE2	0x1
-#define J784S4_SERDES1_LANE2_PCIE2_LANE0	0x2
-#define J784S4_SERDES1_LANE2_IP4_UNUSED		0x3
-
-#define J784S4_SERDES1_LANE3_QSGMII_LANE2	0x0
-#define J784S4_SERDES1_LANE3_PCIE0_LANE3	0x1
-#define J784S4_SERDES1_LANE3_PCIE2_LANE1	0x2
-#define J784S4_SERDES1_LANE3_IP4_UNUSED		0x3
-
-#define J784S4_SERDES2_LANE0_QSGMII_LANE5	0x0
-#define J784S4_SERDES2_LANE0_IP2_UNUSED		0x1
-#define J784S4_SERDES2_LANE0_IP3_UNUSED		0x2
-#define J784S4_SERDES2_LANE0_IP4_UNUSED		0x3
-
-#define J784S4_SERDES2_LANE1_QSGMII_LANE6	0x0
-#define J784S4_SERDES2_LANE1_IP2_UNUSED		0x1
-#define J784S4_SERDES2_LANE1_IP3_UNUSED		0x2
-#define J784S4_SERDES2_LANE1_IP4_UNUSED		0x3
-
-#define J784S4_SERDES2_LANE2_QSGMII_LANE7	0x0
-#define J784S4_SERDES2_LANE2_QSGMII_LANE1	0x1
-#define J784S4_SERDES2_LANE2_IP3_UNUSED		0x2
-#define J784S4_SERDES2_LANE2_IP4_UNUSED		0x3
-
-#define J784S4_SERDES2_LANE3_QSGMII_LANE8	0x0
-#define J784S4_SERDES2_LANE3_QSGMII_LANE2	0x1
-#define J784S4_SERDES2_LANE3_IP3_UNUSED		0x2
-#define J784S4_SERDES2_LANE3_IP4_UNUSED		0x3
-
-#endif /* _DT_BINDINGS_MUX_TI_SERDES */
diff --git a/include/dt-bindings/net/ti-dp83867.h b/include/dt-bindings/net/ti-dp83867.h
deleted file mode 100644
index 6fc4b445d3a1..000000000000
--- a/include/dt-bindings/net/ti-dp83867.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Device Tree constants for the Texas Instruments DP83867 PHY
- *
- * Author: Dan Murphy <dmurphy@ti.com>
- *
- * Copyright:   (C) 2015 Texas Instruments, Inc.
- */
-
-#ifndef _DT_BINDINGS_TI_DP83867_H
-#define _DT_BINDINGS_TI_DP83867_H
-
-/* PHY CTRL bits */
-#define DP83867_PHYCR_FIFO_DEPTH_3_B_NIB	0x00
-#define DP83867_PHYCR_FIFO_DEPTH_4_B_NIB	0x01
-#define DP83867_PHYCR_FIFO_DEPTH_6_B_NIB	0x02
-#define DP83867_PHYCR_FIFO_DEPTH_8_B_NIB	0x03
-
-/* RGMIIDCTL internal delay for rx and tx */
-#define	DP83867_RGMIIDCTL_250_PS	0x0
-#define	DP83867_RGMIIDCTL_500_PS	0x1
-#define	DP83867_RGMIIDCTL_750_PS	0x2
-#define	DP83867_RGMIIDCTL_1_NS		0x3
-#define	DP83867_RGMIIDCTL_1_25_NS	0x4
-#define	DP83867_RGMIIDCTL_1_50_NS	0x5
-#define	DP83867_RGMIIDCTL_1_75_NS	0x6
-#define	DP83867_RGMIIDCTL_2_00_NS	0x7
-#define	DP83867_RGMIIDCTL_2_25_NS	0x8
-#define	DP83867_RGMIIDCTL_2_50_NS	0x9
-#define	DP83867_RGMIIDCTL_2_75_NS	0xa
-#define	DP83867_RGMIIDCTL_3_00_NS	0xb
-#define	DP83867_RGMIIDCTL_3_25_NS	0xc
-#define	DP83867_RGMIIDCTL_3_50_NS	0xd
-#define	DP83867_RGMIIDCTL_3_75_NS	0xe
-#define	DP83867_RGMIIDCTL_4_00_NS	0xf
-
-/* IO_MUX_CFG - Clock output selection */
-#define DP83867_CLK_O_SEL_CHN_A_RCLK		0x0
-#define DP83867_CLK_O_SEL_CHN_B_RCLK		0x1
-#define DP83867_CLK_O_SEL_CHN_C_RCLK		0x2
-#define DP83867_CLK_O_SEL_CHN_D_RCLK		0x3
-#define DP83867_CLK_O_SEL_CHN_A_RCLK_DIV5	0x4
-#define DP83867_CLK_O_SEL_CHN_B_RCLK_DIV5	0x5
-#define DP83867_CLK_O_SEL_CHN_C_RCLK_DIV5	0x6
-#define DP83867_CLK_O_SEL_CHN_D_RCLK_DIV5	0x7
-#define DP83867_CLK_O_SEL_CHN_A_TCLK		0x8
-#define DP83867_CLK_O_SEL_CHN_B_TCLK		0x9
-#define DP83867_CLK_O_SEL_CHN_C_TCLK		0xA
-#define DP83867_CLK_O_SEL_CHN_D_TCLK		0xB
-#define DP83867_CLK_O_SEL_REF_CLK		0xC
-/* Special flag to indicate clock should be off */
-#define DP83867_CLK_O_SEL_OFF			0xFFFFFFFF
-#endif
diff --git a/include/dt-bindings/net/ti-dp83869.h b/include/dt-bindings/net/ti-dp83869.h
deleted file mode 100644
index b3a5ac4a17b3..000000000000
--- a/include/dt-bindings/net/ti-dp83869.h
+++ /dev/null
@@ -1,60 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * TI DP83869 PHY drivers
- *
- */
-
-#ifndef _DT_BINDINGS_TI_DP83869_H
-#define _DT_BINDINGS_TI_DP83869_H
-
-/* PHY CTRL bits */
-#define DP83869_PHYCR_FIFO_DEPTH_3_B_NIB	0x00
-#define DP83869_PHYCR_FIFO_DEPTH_4_B_NIB	0x01
-#define DP83869_PHYCR_FIFO_DEPTH_6_B_NIB	0x02
-#define DP83869_PHYCR_FIFO_DEPTH_8_B_NIB	0x03
-
-/* RGMIIDCTL internal delay for rx and tx */
-#define DP83869_RGMIIDCTL_250_PS	0x0
-#define DP83869_RGMIIDCTL_500_PS	0x1
-#define DP83869_RGMIIDCTL_750_PS	0x2
-#define DP83869_RGMIIDCTL_1_NS		0x3
-#define DP83869_RGMIIDCTL_1_25_NS	0x4
-#define DP83869_RGMIIDCTL_1_50_NS	0x5
-#define DP83869_RGMIIDCTL_1_75_NS	0x6
-#define DP83869_RGMIIDCTL_2_00_NS	0x7
-#define DP83869_RGMIIDCTL_2_25_NS	0x8
-#define DP83869_RGMIIDCTL_2_50_NS	0x9
-#define DP83869_RGMIIDCTL_2_75_NS	0xa
-#define DP83869_RGMIIDCTL_3_00_NS	0xb
-#define DP83869_RGMIIDCTL_3_25_NS	0xc
-#define DP83869_RGMIIDCTL_3_50_NS	0xd
-#define DP83869_RGMIIDCTL_3_75_NS	0xe
-#define DP83869_RGMIIDCTL_4_00_NS	0xf
-
-/* IO_MUX_CFG - Clock output selection */
-#define DP83869_CLK_O_SEL_CHN_A_RCLK		0x0
-#define DP83869_CLK_O_SEL_CHN_B_RCLK		0x1
-#define DP83869_CLK_O_SEL_CHN_C_RCLK		0x2
-#define DP83869_CLK_O_SEL_CHN_D_RCLK		0x3
-#define DP83869_CLK_O_SEL_CHN_A_RCLK_DIV5	0x4
-#define DP83869_CLK_O_SEL_CHN_B_RCLK_DIV5	0x5
-#define DP83869_CLK_O_SEL_CHN_C_RCLK_DIV5	0x6
-#define DP83869_CLK_O_SEL_CHN_D_RCLK_DIV5	0x7
-#define DP83869_CLK_O_SEL_CHN_A_TCLK		0x8
-#define DP83869_CLK_O_SEL_CHN_B_TCLK		0x9
-#define DP83869_CLK_O_SEL_CHN_C_TCLK		0xA
-#define DP83869_CLK_O_SEL_CHN_D_TCLK		0xB
-#define DP83869_CLK_O_SEL_REF_CLK		0xC
-/* Special flag to indicate clock should be off */
-#define DP83869_CLK_O_SEL_OFF			0xFFFFFFFF
-
-/* OPMODE - Operation mode */
-#define DP83869_RGMII_COPPER_ETHERNET		0x00
-#define DP83869_RGMII_1000_BASE			0x01
-#define DP83869_RGMII_100_BASE			0x02
-#define DP83869_RGMII_SGMII_BRIDGE		0x03
-#define DP83869_1000M_MEDIA_CONVERT		0x04
-#define DP83869_100M_MEDIA_CONVERT		0x05
-#define DP83869_SGMII_COPPER_ETHERNET		0x06
-
-#endif
diff --git a/include/dt-bindings/phy/phy-ti.h b/include/dt-bindings/phy/phy-ti.h
deleted file mode 100644
index ad955d3a56b4..000000000000
--- a/include/dt-bindings/phy/phy-ti.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants for TI SERDES.
- */
-
-#ifndef _DT_BINDINGS_TI_SERDES
-#define _DT_BINDINGS_TI_SERDES
-
-/* Clock index for output clocks from WIZ */
-
-/* MUX Clocks */
-#define TI_WIZ_PLL0_REFCLK	0
-#define TI_WIZ_PLL1_REFCLK	1
-#define TI_WIZ_REFCLK_DIG	2
-
-/* Reserve index here for future additions */
-
-/* MISC Clocks */
-#define TI_WIZ_PHY_EN_REFCLK	16
-
-#endif /* _DT_BINDINGS_TI_SERDES */
diff --git a/include/dt-bindings/pinctrl/am33xx.h b/include/dt-bindings/pinctrl/am33xx.h
deleted file mode 100644
index 17877e85980b..000000000000
--- a/include/dt-bindings/pinctrl/am33xx.h
+++ /dev/null
@@ -1,172 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants specific to AM33XX pinctrl bindings.
- */
-
-#ifndef _DT_BINDINGS_PINCTRL_AM33XX_H
-#define _DT_BINDINGS_PINCTRL_AM33XX_H
-
-#include <dt-bindings/pinctrl/omap.h>
-
-/* am33xx specific mux bit defines */
-#undef PULL_ENA
-#undef INPUT_EN
-
-#define PULL_DISABLE		(1 << 3)
-#define INPUT_EN		(1 << 5)
-#define SLEWCTRL_SLOW		(1 << 6)
-#define SLEWCTRL_FAST		0
-
-/* update macro depending on INPUT_EN and PULL_ENA */
-#undef PIN_OUTPUT
-#undef PIN_OUTPUT_PULLUP
-#undef PIN_OUTPUT_PULLDOWN
-#undef PIN_INPUT
-#undef PIN_INPUT_PULLUP
-#undef PIN_INPUT_PULLDOWN
-
-#define PIN_OUTPUT		(PULL_DISABLE)
-#define PIN_OUTPUT_PULLUP	(PULL_UP)
-#define PIN_OUTPUT_PULLDOWN	0
-#define PIN_INPUT		(INPUT_EN | PULL_DISABLE)
-#define PIN_INPUT_PULLUP	(INPUT_EN | PULL_UP)
-#define PIN_INPUT_PULLDOWN	(INPUT_EN)
-
-/* undef non-existing modes */
-#undef PIN_OFF_NONE
-#undef PIN_OFF_OUTPUT_HIGH
-#undef PIN_OFF_OUTPUT_LOW
-#undef PIN_OFF_INPUT_PULLUP
-#undef PIN_OFF_INPUT_PULLDOWN
-#undef PIN_OFF_WAKEUPENABLE
-
-#define AM335X_PIN_OFFSET_MIN			0x0800U
-
-#define AM335X_PIN_GPMC_AD0			0x800
-#define AM335X_PIN_GPMC_AD1			0x804
-#define AM335X_PIN_GPMC_AD2			0x808
-#define AM335X_PIN_GPMC_AD3			0x80c
-#define AM335X_PIN_GPMC_AD4			0x810
-#define AM335X_PIN_GPMC_AD5			0x814
-#define AM335X_PIN_GPMC_AD6			0x818
-#define AM335X_PIN_GPMC_AD7			0x81c
-#define AM335X_PIN_GPMC_AD8			0x820
-#define AM335X_PIN_GPMC_AD9			0x824
-#define AM335X_PIN_GPMC_AD10			0x828
-#define AM335X_PIN_GPMC_AD11			0x82c
-#define AM335X_PIN_GPMC_AD12			0x830
-#define AM335X_PIN_GPMC_AD13			0x834
-#define AM335X_PIN_GPMC_AD14			0x838
-#define AM335X_PIN_GPMC_AD15			0x83c
-#define AM335X_PIN_GPMC_A0			0x840
-#define AM335X_PIN_GPMC_A1			0x844
-#define AM335X_PIN_GPMC_A2			0x848
-#define AM335X_PIN_GPMC_A3			0x84c
-#define AM335X_PIN_GPMC_A4			0x850
-#define AM335X_PIN_GPMC_A5			0x854
-#define AM335X_PIN_GPMC_A6			0x858
-#define AM335X_PIN_GPMC_A7			0x85c
-#define AM335X_PIN_GPMC_A8			0x860
-#define AM335X_PIN_GPMC_A9			0x864
-#define AM335X_PIN_GPMC_A10			0x868
-#define AM335X_PIN_GPMC_A11			0x86c
-#define AM335X_PIN_GPMC_WAIT0			0x870
-#define AM335X_PIN_GPMC_WPN			0x874
-#define AM335X_PIN_GPMC_BEN1			0x878
-#define AM335X_PIN_GPMC_CSN0			0x87c
-#define AM335X_PIN_GPMC_CSN1			0x880
-#define AM335X_PIN_GPMC_CSN2			0x884
-#define AM335X_PIN_GPMC_CSN3			0x888
-#define AM335X_PIN_GPMC_CLK			0x88c
-#define AM335X_PIN_GPMC_ADVN_ALE		0x890
-#define AM335X_PIN_GPMC_OEN_REN			0x894
-#define AM335X_PIN_GPMC_WEN			0x898
-#define AM335X_PIN_GPMC_BEN0_CLE		0x89c
-#define AM335X_PIN_LCD_DATA0			0x8a0
-#define AM335X_PIN_LCD_DATA1			0x8a4
-#define AM335X_PIN_LCD_DATA2			0x8a8
-#define AM335X_PIN_LCD_DATA3			0x8ac
-#define AM335X_PIN_LCD_DATA4			0x8b0
-#define AM335X_PIN_LCD_DATA5			0x8b4
-#define AM335X_PIN_LCD_DATA6			0x8b8
-#define AM335X_PIN_LCD_DATA7			0x8bc
-#define AM335X_PIN_LCD_DATA8			0x8c0
-#define AM335X_PIN_LCD_DATA9			0x8c4
-#define AM335X_PIN_LCD_DATA10			0x8c8
-#define AM335X_PIN_LCD_DATA11			0x8cc
-#define AM335X_PIN_LCD_DATA12			0x8d0
-#define AM335X_PIN_LCD_DATA13			0x8d4
-#define AM335X_PIN_LCD_DATA14			0x8d8
-#define AM335X_PIN_LCD_DATA15			0x8dc
-#define AM335X_PIN_LCD_VSYNC			0x8e0
-#define AM335X_PIN_LCD_HSYNC			0x8e4
-#define AM335X_PIN_LCD_PCLK			0x8e8
-#define AM335X_PIN_LCD_AC_BIAS_EN		0x8ec
-#define AM335X_PIN_MMC0_DAT3			0x8f0
-#define AM335X_PIN_MMC0_DAT2			0x8f4
-#define AM335X_PIN_MMC0_DAT1			0x8f8
-#define AM335X_PIN_MMC0_DAT0			0x8fc
-#define AM335X_PIN_MMC0_CLK			0x900
-#define AM335X_PIN_MMC0_CMD			0x904
-#define AM335X_PIN_MII1_COL			0x908
-#define AM335X_PIN_MII1_CRS			0x90c
-#define AM335X_PIN_MII1_RX_ER			0x910
-#define AM335X_PIN_MII1_TX_EN			0x914
-#define AM335X_PIN_MII1_RX_DV			0x918
-#define AM335X_PIN_MII1_TXD3			0x91c
-#define AM335X_PIN_MII1_TXD2			0x920
-#define AM335X_PIN_MII1_TXD1			0x924
-#define AM335X_PIN_MII1_TXD0			0x928
-#define AM335X_PIN_MII1_TX_CLK			0x92c
-#define AM335X_PIN_MII1_RX_CLK			0x930
-#define AM335X_PIN_MII1_RXD3			0x934
-#define AM335X_PIN_MII1_RXD2			0x938
-#define AM335X_PIN_MII1_RXD1			0x93c
-#define AM335X_PIN_MII1_RXD0			0x940
-#define AM335X_PIN_RMII1_REF_CLK		0x944
-#define AM335X_PIN_MDIO				0x948
-#define AM335X_PIN_MDC				0x94c
-#define AM335X_PIN_SPI0_SCLK			0x950
-#define AM335X_PIN_SPI0_D0			0x954
-#define AM335X_PIN_SPI0_D1			0x958
-#define AM335X_PIN_SPI0_CS0			0x95c
-#define AM335X_PIN_SPI0_CS1			0x960
-#define AM335X_PIN_ECAP0_IN_PWM0_OUT		0x964
-#define AM335X_PIN_UART0_CTSN			0x968
-#define AM335X_PIN_UART0_RTSN			0x96c
-#define AM335X_PIN_UART0_RXD			0x970
-#define AM335X_PIN_UART0_TXD			0x974
-#define AM335X_PIN_UART1_CTSN			0x978
-#define AM335X_PIN_UART1_RTSN			0x97c
-#define AM335X_PIN_UART1_RXD			0x980
-#define AM335X_PIN_UART1_TXD			0x984
-#define AM335X_PIN_I2C0_SDA			0x988
-#define AM335X_PIN_I2C0_SCL			0x98c
-#define AM335X_PIN_MCASP0_ACLKX			0x990
-#define AM335X_PIN_MCASP0_FSX			0x994
-#define AM335X_PIN_MCASP0_AXR0			0x998
-#define AM335X_PIN_MCASP0_AHCLKR		0x99c
-#define AM335X_PIN_MCASP0_ACLKR			0x9a0
-#define AM335X_PIN_MCASP0_FSR			0x9a4
-#define AM335X_PIN_MCASP0_AXR1			0x9a8
-#define AM335X_PIN_MCASP0_AHCLKX		0x9ac
-#define AM335X_PIN_XDMA_EVENT_INTR0		0x9b0
-#define AM335X_PIN_XDMA_EVENT_INTR1		0x9b4
-#define AM335X_PIN_WARMRSTN			0x9b8
-#define AM335X_PIN_NNMI				0x9c0
-#define AM335X_PIN_TMS				0x9d0
-#define AM335X_PIN_TDI				0x9d4
-#define AM335X_PIN_TDO				0x9d8
-#define AM335X_PIN_TCK				0x9dc
-#define AM335X_PIN_TRSTN			0x9e0
-#define AM335X_PIN_EMU0				0x9e4
-#define AM335X_PIN_EMU1				0x9e8
-#define AM335X_PIN_RTC_PWRONRSTN		0x9f8
-#define AM335X_PIN_PMIC_POWER_EN		0x9fc
-#define AM335X_PIN_EXT_WAKEUP			0xa00
-#define AM335X_PIN_USB0_DRVVBUS			0xa1c
-#define AM335X_PIN_USB1_DRVVBUS			0xa34
-
-#define AM335X_PIN_OFFSET_MAX			0x0a34U
-
-#endif
diff --git a/include/dt-bindings/pinctrl/am43xx.h b/include/dt-bindings/pinctrl/am43xx.h
deleted file mode 100644
index 292c2ebf58dd..000000000000
--- a/include/dt-bindings/pinctrl/am43xx.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/*
- * This header provides constants specific to AM43XX pinctrl bindings.
- */
-
-#ifndef _DT_BINDINGS_PINCTRL_AM43XX_H
-#define _DT_BINDINGS_PINCTRL_AM43XX_H
-
-#define MUX_MODE0	0
-#define MUX_MODE1	1
-#define MUX_MODE2	2
-#define MUX_MODE3	3
-#define MUX_MODE4	4
-#define MUX_MODE5	5
-#define MUX_MODE6	6
-#define MUX_MODE7	7
-#define MUX_MODE8	8
-
-#define PULL_DISABLE		(1 << 16)
-#define PULL_UP			(1 << 17)
-#define INPUT_EN		(1 << 18)
-#define SLEWCTRL_SLOW		(1 << 19)
-#define SLEWCTRL_FAST		0
-#define DS0_PULL_UP_DOWN_EN	(1 << 27)
-#define WAKEUP_ENABLE		(1 << 29)
-
-#define PIN_OUTPUT		(PULL_DISABLE)
-#define PIN_OUTPUT_PULLUP	(PULL_UP)
-#define PIN_OUTPUT_PULLDOWN	0
-#define PIN_INPUT		(INPUT_EN | PULL_DISABLE)
-#define PIN_INPUT_PULLUP	(INPUT_EN | PULL_UP)
-#define PIN_INPUT_PULLDOWN	(INPUT_EN)
-
-/*
- * Macro to allow using the absolute physical address instead of the
- * padconf registers instead of the offset from padconf base.
- */
-#define AM4372_IOPAD(pa, val)	(((pa) & 0xffff) - 0x0800) (val)
-
-#endif
diff --git a/include/dt-bindings/pinctrl/omap.h b/include/dt-bindings/pinctrl/omap.h
deleted file mode 100644
index 4c060ee0e0ad..000000000000
--- a/include/dt-bindings/pinctrl/omap.h
+++ /dev/null
@@ -1,91 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants for OMAP pinctrl bindings.
- *
- * Copyright (C) 2009 Nokia
- * Copyright (C) 2009-2010 Texas Instruments
- */
-
-#ifndef _DT_BINDINGS_PINCTRL_OMAP_H
-#define _DT_BINDINGS_PINCTRL_OMAP_H
-
-/* 34xx mux mode options for each pin. See TRM for options */
-#define MUX_MODE0	0
-#define MUX_MODE1	1
-#define MUX_MODE2	2
-#define MUX_MODE3	3
-#define MUX_MODE4	4
-#define MUX_MODE5	5
-#define MUX_MODE6	6
-#define MUX_MODE7	7
-
-/* 24xx/34xx mux bit defines */
-#define PULL_ENA		(1 << 3)
-#define PULL_UP			(1 << 4)
-#define ALTELECTRICALSEL	(1 << 5)
-
-/* omap3/4/5 specific mux bit defines */
-#define INPUT_EN		(1 << 8)
-#define OFF_EN			(1 << 9)
-#define OFFOUT_EN		(1 << 10)
-#define OFFOUT_VAL		(1 << 11)
-#define OFF_PULL_EN		(1 << 12)
-#define OFF_PULL_UP		(1 << 13)
-#define WAKEUP_EN		(1 << 14)
-#define WAKEUP_EVENT		(1 << 15)
-
-/* Active pin states */
-#define PIN_OUTPUT		0
-#define PIN_OUTPUT_PULLUP	(PIN_OUTPUT | PULL_ENA | PULL_UP)
-#define PIN_OUTPUT_PULLDOWN	(PIN_OUTPUT | PULL_ENA)
-#define PIN_INPUT		INPUT_EN
-#define PIN_INPUT_PULLUP	(PULL_ENA | INPUT_EN | PULL_UP)
-#define PIN_INPUT_PULLDOWN	(PULL_ENA | INPUT_EN)
-
-/* Off mode states */
-#define PIN_OFF_NONE		0
-#define PIN_OFF_OUTPUT_HIGH	(OFF_EN | OFFOUT_EN | OFFOUT_VAL)
-#define PIN_OFF_OUTPUT_LOW	(OFF_EN | OFFOUT_EN)
-#define PIN_OFF_INPUT_PULLUP	(OFF_EN | OFFOUT_EN | OFF_PULL_EN | OFF_PULL_UP)
-#define PIN_OFF_INPUT_PULLDOWN	(OFF_EN | OFFOUT_EN | OFF_PULL_EN)
-#define PIN_OFF_WAKEUPENABLE	WAKEUP_EN
-
-/*
- * Macros to allow using the absolute physical address instead of the
- * padconf registers instead of the offset from padconf base.
- */
-#define OMAP_IOPAD_OFFSET(pa, offset)	(((pa) & 0xffff) - (offset))
-
-#define OMAP2420_CORE_IOPAD(pa, val)	OMAP_IOPAD_OFFSET((pa), 0x0030) (val)
-#define OMAP2430_CORE_IOPAD(pa, val)	OMAP_IOPAD_OFFSET((pa), 0x2030) (val)
-#define OMAP3_CORE1_IOPAD(pa, val)	OMAP_IOPAD_OFFSET((pa), 0x2030) (val)
-#define OMAP3430_CORE2_IOPAD(pa, val)	OMAP_IOPAD_OFFSET((pa), 0x25d8) (val)
-#define OMAP3630_CORE2_IOPAD(pa, val)	OMAP_IOPAD_OFFSET((pa), 0x25a0) (val)
-#define OMAP3_WKUP_IOPAD(pa, val)	OMAP_IOPAD_OFFSET((pa), 0x2a00) (val)
-#define DM814X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
-#define DM816X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
-#define AM33XX_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val) (0)
-#define AM33XX_PADCONF(pa, conf, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) (conf) (mux)
-
-/*
- * Macros to allow using the offset from the padconf physical address
- * instead  of the offset from padconf base.
- */
-#define OMAP_PADCONF_OFFSET(offset, base_offset)	((offset) - (base_offset))
-
-#define OMAP4_IOPAD(offset, val)	OMAP_PADCONF_OFFSET((offset), 0x0040) (val)
-#define OMAP5_IOPAD(offset, val)	OMAP_PADCONF_OFFSET((offset), 0x0040) (val)
-
-/*
- * Define some commonly used pins configured by the boards.
- * Note that some boards use alternative pins, so check
- * the schematics before using these.
- */
-#define OMAP3_UART1_RX		0x152
-#define OMAP3_UART2_RX		0x14a
-#define OMAP3_UART3_RX		0x16e
-#define OMAP4_UART2_RX		0xdc
-#define OMAP4_UART3_RX		0x104
-#define OMAP4_UART4_RX		0x11c
-
-#endif
diff --git a/include/dt-bindings/reset/ti-syscon.h b/include/dt-bindings/reset/ti-syscon.h
deleted file mode 100644
index 1427ff140f11..000000000000
--- a/include/dt-bindings/reset/ti-syscon.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * TI Syscon Reset definitions
- *
- * Copyright (C) 2015-2016 Texas Instruments Incorporated - https://www.ti.com/
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef __DT_BINDINGS_RESET_TI_SYSCON_H__
-#define __DT_BINDINGS_RESET_TI_SYSCON_H__
-
-/*
- * The reset does not support the feature and corresponding
- * values are not valid
- */
-#define ASSERT_NONE	(1 << 0)
-#define DEASSERT_NONE	(1 << 1)
-#define STATUS_NONE	(1 << 2)
-
-/* When set this function is activated by setting(vs clearing) this bit */
-#define ASSERT_SET	(1 << 3)
-#define DEASSERT_SET	(1 << 4)
-#define STATUS_SET	(1 << 5)
-
-/* The following are the inverse of the above and are added for consistency */
-#define ASSERT_CLEAR	(0 << 3)
-#define DEASSERT_CLEAR	(0 << 4)
-#define STATUS_CLEAR	(0 << 5)
-
-#endif
diff --git a/include/dt-bindings/soc/ti,sci_pm_domain.h b/include/dt-bindings/soc/ti,sci_pm_domain.h
deleted file mode 100644
index 8f2a7360b65e..000000000000
--- a/include/dt-bindings/soc/ti,sci_pm_domain.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __DT_BINDINGS_TI_SCI_PM_DOMAIN_H
-#define __DT_BINDINGS_TI_SCI_PM_DOMAIN_H
-
-#define TI_SCI_PD_EXCLUSIVE	1
-#define TI_SCI_PD_SHARED	0
-
-#endif /* __DT_BINDINGS_TI_SCI_PM_DOMAIN_H */

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
