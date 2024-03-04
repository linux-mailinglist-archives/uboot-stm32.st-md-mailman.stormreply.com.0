Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CE2870796
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Mar 2024 17:51:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9BD9C6DD6E;
	Mon,  4 Mar 2024 16:51:40 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDFC8C6DD75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 16:51:39 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-412e84e87e6so4233995e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 08:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709571099; x=1710175899;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FdYU3I6aO53xlP7kaqKlhah/nKKW7LW6cbfvvrEdx7A=;
 b=R4nTHqA064A6APTjPwt4EqY/aU48uURneTiceWBscIcUK5VyY3sDT8HndXJyM28hrP
 XscVECuA//h+6IabLPiHUxNig//+GtBgGNZW0UgnGV1BpPV9I8RQn33TmJnXENlRHmf8
 Zrh4JMPecCAyLRfX+K/ypixkOOit3lhZ9whAC6Z3hkevGUBRMEe1Vj7GsJmGTt0eleZf
 HSpVY1mnpHN5MmiDZWdxYd/DsnoJEMl47BG8Sg22mRTl1x5TYXOd1Gh8nv8K2RB1zSdD
 6AEoeKqs4dxTLC6ZHthN+ay0dkqSANMmzCIqnT0KplN4jnfai7OK6pWtwzkiFzx3k52O
 dRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571099; x=1710175899;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FdYU3I6aO53xlP7kaqKlhah/nKKW7LW6cbfvvrEdx7A=;
 b=OYEe5pMIf3hhB2U7GuyTNY4d3zn+BQdSuJd+AQgzKI8FO/vKeQJLlShQAuUogsyOD7
 LUcrRJ3KWheumTGeY8GSxrVOvGidLA80vVYNzxKY08nS4+IHkRDfs8PDRkHkJ/wGayaC
 rREE3KUNpyFjLucXdsoYjwfaHHTu4/mDSr1O7CC8mSLLTgm802CDdEb31FRzSC9vdQR2
 TlguX4USxa72qlXJyyY7IeEyyQv2tBELJLpdqrc5FXBtTfVwPM0mN/hrn5qbgDmySsnR
 Trx+CfgZme+Y/8yEZGJ7eGIFLsLlQxbq10snbbwQktJPsBDUfcRP0gq4tHyA2grizu4y
 aN4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDo6EIQf14UbXhekdTIUa2HCGienrr1BBwQL7kb863mthu0LpM4T+9Q3MjG1e/ie82NHAO3unky+HVFobk+GKapEgzVAIJuZsqqwG/Gm/bI8ry2QE9hjRe
X-Gm-Message-State: AOJu0YzX4ZmfAGEJBCREBO6m3HtoSvZKqMA1o7lfMZ4sFyFn4QszCwYv
 bZ3x4OQ+obrOeGuc0IhC3gfDmi0Rgevfg+4QzD7FzWwMFBSDUUzpRoBMqfqcoqM=
X-Google-Smtp-Source: AGHT+IHg2ePdWo6ln6QOKwd/7MkUCLuot/arcaGo5tBtYVzULytIzBIbhGutMZpWQgGsfkVtr+Afvw==
X-Received: by 2002:a05:600c:1d87:b0:412:e7d6:4464 with SMTP id
 p7-20020a05600c1d8700b00412e7d64464mr1119159wms.32.1709571099196; 
 Mon, 04 Mar 2024 08:51:39 -0800 (PST)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm10598517wmq.6.2024.03.04.08.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:51:38 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Mon, 04 Mar 2024 16:51:18 +0000
MIME-Version: 1.0
Message-Id: <20240304-b4-upstream-dt-headers-v1-10-b7ff41925f92@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=37484;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=/zN5JHDnNCnlNMgrceeC/PnkKzNjQqD8fiQdso0NdZY=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtSnf9j1fxRxtb/o7Jr+WOzxB/vVT1YWOeX51Qr/2ilh6
 jrVRm1zRykLgyAHg6yYIov4iWWWTWsv22tsX3ABZg4rE8gQBi5OAZhIiz7Df9fkJ/kffi2fkzf5
 dG3R1Qsvar3mmj55/lxnTcElBe7ui68Y/qmdEjj1zDa7KbLVOUt/URM7Z5NIW/bV+ENP5dQD1kf
 +bgYA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH RFC 10/26] rockchip: drop remaining dt-binding
	headers
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

Small driver adjustment to fix compatibility.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/pinctrl/rockchip/pinctrl-rk3568.c         |  15 +
 include/dt-bindings/pinctrl/rockchip.h            |  60 --
 include/dt-bindings/power/px30-power.h            |  27 -
 include/dt-bindings/power/rk3066-power.h          |  22 -
 include/dt-bindings/power/rk3188-power.h          |  24 -
 include/dt-bindings/power/rk3228-power.h          |  21 -
 include/dt-bindings/power/rk3288-power.h          |  32 -
 include/dt-bindings/power/rk3328-power.h          |  19 -
 include/dt-bindings/power/rk3399-power.h          |  53 --
 include/dt-bindings/power/rk3568-power.h          |  32 -
 include/dt-bindings/power/rk3588-power.h          |  69 --
 include/dt-bindings/power/rockchip,rv1126-power.h |  35 -
 include/dt-bindings/reset/rockchip,rk3588-cru.h   | 754 ----------------------
 include/dt-bindings/soc/rockchip,boot-mode.h      |  16 -
 include/dt-bindings/soc/rockchip,vop2.h           |  18 -
 15 files changed, 15 insertions(+), 1182 deletions(-)

diff --git a/drivers/pinctrl/rockchip/pinctrl-rk3568.c b/drivers/pinctrl/rockchip/pinctrl-rk3568.c
index 1d4391982605..35a69c2a1a28 100644
--- a/drivers/pinctrl/rockchip/pinctrl-rk3568.c
+++ b/drivers/pinctrl/rockchip/pinctrl-rk3568.c
@@ -11,8 +11,23 @@
 #include <dt-bindings/pinctrl/rockchip.h>
 
 #include "pinctrl-rockchip.h"
 
+#define RK_GPIO0	0
+#define RK_GPIO1	1
+#define RK_GPIO2	2
+#define RK_GPIO3	3
+#define RK_GPIO4	4
+#define RK_GPIO6	6
+
+#define RK_FUNC_GPIO	0
+#define RK_FUNC_1	1
+#define RK_FUNC_2	2
+#define RK_FUNC_3	3
+#define RK_FUNC_4	4
+#define RK_FUNC_5	5
+#define RK_FUNC_6	6
+
 static struct rockchip_mux_route_data rk3568_mux_route_data[] = {
 	MR_PMUGRF(RK_GPIO0, RK_PB7, RK_FUNC_1, 0x0110, RK_GENMASK_VAL(1, 0, 0)), /* PWM0 IO mux selection M0 */
 	MR_PMUGRF(RK_GPIO0, RK_PC7, RK_FUNC_2, 0x0110, RK_GENMASK_VAL(1, 0, 1)), /* PWM0 IO mux selection M1 */
 	MR_PMUGRF(RK_GPIO0, RK_PC0, RK_FUNC_1, 0x0110, RK_GENMASK_VAL(3, 2, 0)), /* PWM1 IO mux selection M0 */
diff --git a/include/dt-bindings/pinctrl/rockchip.h b/include/dt-bindings/pinctrl/rockchip.h
deleted file mode 100644
index 1c28d6cb1fad..000000000000
--- a/include/dt-bindings/pinctrl/rockchip.h
+++ /dev/null
@@ -1,60 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Header providing constants for Rockchip pinctrl bindings.
- *
- * Copyright (c) 2013 MundoReader S.L.
- * Author: Heiko Stuebner <heiko@sntech.de>
- */
-
-#ifndef __DT_BINDINGS_ROCKCHIP_PINCTRL_H__
-#define __DT_BINDINGS_ROCKCHIP_PINCTRL_H__
-
-#define RK_GPIO0	0
-#define RK_GPIO1	1
-#define RK_GPIO2	2
-#define RK_GPIO3	3
-#define RK_GPIO4	4
-#define RK_GPIO6	6
-
-#define RK_PA0		0
-#define RK_PA1		1
-#define RK_PA2		2
-#define RK_PA3		3
-#define RK_PA4		4
-#define RK_PA5		5
-#define RK_PA6		6
-#define RK_PA7		7
-#define RK_PB0		8
-#define RK_PB1		9
-#define RK_PB2		10
-#define RK_PB3		11
-#define RK_PB4		12
-#define RK_PB5		13
-#define RK_PB6		14
-#define RK_PB7		15
-#define RK_PC0		16
-#define RK_PC1		17
-#define RK_PC2		18
-#define RK_PC3		19
-#define RK_PC4		20
-#define RK_PC5		21
-#define RK_PC6		22
-#define RK_PC7		23
-#define RK_PD0		24
-#define RK_PD1		25
-#define RK_PD2		26
-#define RK_PD3		27
-#define RK_PD4		28
-#define RK_PD5		29
-#define RK_PD6		30
-#define RK_PD7		31
-
-#define RK_FUNC_GPIO	0
-#define RK_FUNC_1	1
-#define RK_FUNC_2	2
-#define RK_FUNC_3	3
-#define RK_FUNC_4	4
-#define RK_FUNC_5	5
-#define RK_FUNC_6	6
-
-#endif
diff --git a/include/dt-bindings/power/px30-power.h b/include/dt-bindings/power/px30-power.h
deleted file mode 100644
index 30917a99ad20..000000000000
--- a/include/dt-bindings/power/px30-power.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_BINDINGS_POWER_PX30_POWER_H__
-#define __DT_BINDINGS_POWER_PX30_POWER_H__
-
-/* VD_CORE */
-#define PX30_PD_A35_0		0
-#define PX30_PD_A35_1		1
-#define PX30_PD_A35_2		2
-#define PX30_PD_A35_3		3
-#define PX30_PD_SCU		4
-
-/* VD_LOGIC */
-#define PX30_PD_USB		5
-#define PX30_PD_DDR		6
-#define PX30_PD_SDCARD		7
-#define PX30_PD_CRYPTO		8
-#define PX30_PD_GMAC		9
-#define PX30_PD_MMC_NAND	10
-#define PX30_PD_VPU		11
-#define PX30_PD_VO		12
-#define PX30_PD_VI		13
-#define PX30_PD_GPU		14
-
-/* VD_PMU */
-#define PX30_PD_PMU		15
-
-#endif
diff --git a/include/dt-bindings/power/rk3066-power.h b/include/dt-bindings/power/rk3066-power.h
deleted file mode 100644
index acf9f310ac53..000000000000
--- a/include/dt-bindings/power/rk3066-power.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_BINDINGS_POWER_RK3066_POWER_H__
-#define __DT_BINDINGS_POWER_RK3066_POWER_H__
-
-/* VD_CORE */
-#define RK3066_PD_A9_0		0
-#define RK3066_PD_A9_1		1
-#define RK3066_PD_DBG		4
-#define RK3066_PD_SCU		5
-
-/* VD_LOGIC */
-#define RK3066_PD_VIDEO		6
-#define RK3066_PD_VIO		7
-#define RK3066_PD_GPU		8
-#define RK3066_PD_PERI		9
-#define RK3066_PD_CPU		10
-#define RK3066_PD_ALIVE		11
-
-/* VD_PMU */
-#define RK3066_PD_RTC		12
-
-#endif
diff --git a/include/dt-bindings/power/rk3188-power.h b/include/dt-bindings/power/rk3188-power.h
deleted file mode 100644
index 93d23dfba33f..000000000000
--- a/include/dt-bindings/power/rk3188-power.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_BINDINGS_POWER_RK3188_POWER_H__
-#define __DT_BINDINGS_POWER_RK3188_POWER_H__
-
-/* VD_CORE */
-#define RK3188_PD_A9_0		0
-#define RK3188_PD_A9_1		1
-#define RK3188_PD_A9_2		2
-#define RK3188_PD_A9_3		3
-#define RK3188_PD_DBG		4
-#define RK3188_PD_SCU		5
-
-/* VD_LOGIC */
-#define RK3188_PD_VIDEO		6
-#define RK3188_PD_VIO		7
-#define RK3188_PD_GPU		8
-#define RK3188_PD_PERI		9
-#define RK3188_PD_CPU		10
-#define RK3188_PD_ALIVE		11
-
-/* VD_PMU */
-#define RK3188_PD_RTC		12
-
-#endif
diff --git a/include/dt-bindings/power/rk3228-power.h b/include/dt-bindings/power/rk3228-power.h
deleted file mode 100644
index 6a8dc1bf76ce..000000000000
--- a/include/dt-bindings/power/rk3228-power.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_BINDINGS_POWER_RK3228_POWER_H__
-#define __DT_BINDINGS_POWER_RK3228_POWER_H__
-
-/**
- * RK3228 idle id Summary.
- */
-
-#define RK3228_PD_CORE		0
-#define RK3228_PD_MSCH		1
-#define RK3228_PD_BUS		2
-#define RK3228_PD_SYS		3
-#define RK3228_PD_VIO		4
-#define RK3228_PD_VOP		5
-#define RK3228_PD_VPU		6
-#define RK3228_PD_RKVDEC	7
-#define RK3228_PD_GPU		8
-#define RK3228_PD_PERI		9
-#define RK3228_PD_GMAC		10
-
-#endif
diff --git a/include/dt-bindings/power/rk3288-power.h b/include/dt-bindings/power/rk3288-power.h
deleted file mode 100644
index f710b56ccd81..000000000000
--- a/include/dt-bindings/power/rk3288-power.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_BINDINGS_POWER_RK3288_POWER_H__
-#define __DT_BINDINGS_POWER_RK3288_POWER_H__
-
-/**
- * RK3288 Power Domain and Voltage Domain Summary.
- */
-
-/* VD_CORE */
-#define RK3288_PD_A17_0		0
-#define RK3288_PD_A17_1		1
-#define RK3288_PD_A17_2		2
-#define RK3288_PD_A17_3		3
-#define RK3288_PD_SCU		4
-#define RK3288_PD_DEBUG		5
-#define RK3288_PD_MEM		6
-
-/* VD_LOGIC */
-#define RK3288_PD_BUS		7
-#define RK3288_PD_PERI		8
-#define RK3288_PD_VIO		9
-#define RK3288_PD_ALIVE		10
-#define RK3288_PD_HEVC		11
-#define RK3288_PD_VIDEO		12
-
-/* VD_GPU */
-#define RK3288_PD_GPU		13
-
-/* VD_PMU */
-#define RK3288_PD_PMU		14
-
-#endif
diff --git a/include/dt-bindings/power/rk3328-power.h b/include/dt-bindings/power/rk3328-power.h
deleted file mode 100644
index 02e3d7fc1cce..000000000000
--- a/include/dt-bindings/power/rk3328-power.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_BINDINGS_POWER_RK3328_POWER_H__
-#define __DT_BINDINGS_POWER_RK3328_POWER_H__
-
-/**
- * RK3328 idle id Summary.
- */
-#define RK3328_PD_CORE		0
-#define RK3328_PD_GPU		1
-#define RK3328_PD_BUS		2
-#define RK3328_PD_MSCH		3
-#define RK3328_PD_PERI		4
-#define RK3328_PD_VIDEO		5
-#define RK3328_PD_HEVC		6
-#define RK3328_PD_SYS		7
-#define RK3328_PD_VPU		8
-#define RK3328_PD_VIO		9
-
-#endif
diff --git a/include/dt-bindings/power/rk3399-power.h b/include/dt-bindings/power/rk3399-power.h
deleted file mode 100644
index 168b3bfbd6f5..000000000000
--- a/include/dt-bindings/power/rk3399-power.h
+++ /dev/null
@@ -1,53 +0,0 @@
-#ifndef __DT_BINDINGS_POWER_RK3399_POWER_H__
-#define __DT_BINDINGS_POWER_RK3399_POWER_H__
-
-/* VD_CORE_L */
-#define RK3399_PD_A53_L0	0
-#define RK3399_PD_A53_L1	1
-#define RK3399_PD_A53_L2	2
-#define RK3399_PD_A53_L3	3
-#define RK3399_PD_SCU_L		4
-
-/* VD_CORE_B */
-#define RK3399_PD_A72_B0	5
-#define RK3399_PD_A72_B1	6
-#define RK3399_PD_SCU_B		7
-
-/* VD_LOGIC */
-#define RK3399_PD_TCPD0		8
-#define RK3399_PD_TCPD1		9
-#define RK3399_PD_CCI		10
-#define RK3399_PD_CCI0		11
-#define RK3399_PD_CCI1		12
-#define RK3399_PD_PERILP	13
-#define RK3399_PD_PERIHP	14
-#define RK3399_PD_VIO		15
-#define RK3399_PD_VO		16
-#define RK3399_PD_VOPB		17
-#define RK3399_PD_VOPL		18
-#define RK3399_PD_ISP0		19
-#define RK3399_PD_ISP1		20
-#define RK3399_PD_HDCP		21
-#define RK3399_PD_GMAC		22
-#define RK3399_PD_EMMC		23
-#define RK3399_PD_USB3		24
-#define RK3399_PD_EDP		25
-#define RK3399_PD_GIC		26
-#define RK3399_PD_SD		27
-#define RK3399_PD_SDIOAUDIO	28
-#define RK3399_PD_ALIVE		29
-
-/* VD_CENTER */
-#define RK3399_PD_CENTER	30
-#define RK3399_PD_VCODEC	31
-#define RK3399_PD_VDU		32
-#define RK3399_PD_RGA		33
-#define RK3399_PD_IEP		34
-
-/* VD_GPU */
-#define RK3399_PD_GPU		35
-
-/* VD_PMU */
-#define RK3399_PD_PMU		36
-
-#endif
diff --git a/include/dt-bindings/power/rk3568-power.h b/include/dt-bindings/power/rk3568-power.h
deleted file mode 100644
index 6cc1af1a9d26..000000000000
--- a/include/dt-bindings/power/rk3568-power.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_BINDINGS_POWER_RK3568_POWER_H__
-#define __DT_BINDINGS_POWER_RK3568_POWER_H__
-
-/* VD_CORE */
-#define RK3568_PD_CPU_0		0
-#define RK3568_PD_CPU_1		1
-#define RK3568_PD_CPU_2		2
-#define RK3568_PD_CPU_3		3
-#define RK3568_PD_CORE_ALIVE	4
-
-/* VD_PMU */
-#define RK3568_PD_PMU		5
-
-/* VD_NPU */
-#define RK3568_PD_NPU		6
-
-/* VD_GPU */
-#define RK3568_PD_GPU		7
-
-/* VD_LOGIC */
-#define RK3568_PD_VI		8
-#define RK3568_PD_VO		9
-#define RK3568_PD_RGA		10
-#define RK3568_PD_VPU		11
-#define RK3568_PD_CENTER	12
-#define RK3568_PD_RKVDEC	13
-#define RK3568_PD_RKVENC	14
-#define RK3568_PD_PIPE		15
-#define RK3568_PD_LOGIC_ALIVE	16
-
-#endif
diff --git a/include/dt-bindings/power/rk3588-power.h b/include/dt-bindings/power/rk3588-power.h
deleted file mode 100644
index 1b92fec013cb..000000000000
--- a/include/dt-bindings/power/rk3588-power.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
-#ifndef __DT_BINDINGS_POWER_RK3588_POWER_H__
-#define __DT_BINDINGS_POWER_RK3588_POWER_H__
-
-/* VD_LITDSU */
-#define RK3588_PD_CPU_0		0
-#define RK3588_PD_CPU_1		1
-#define RK3588_PD_CPU_2		2
-#define RK3588_PD_CPU_3		3
-
-/* VD_BIGCORE0 */
-#define RK3588_PD_CPU_4		4
-#define RK3588_PD_CPU_5		5
-
-/* VD_BIGCORE1 */
-#define RK3588_PD_CPU_6		6
-#define RK3588_PD_CPU_7		7
-
-/* VD_NPU */
-#define RK3588_PD_NPU		8
-#define RK3588_PD_NPUTOP	9
-#define RK3588_PD_NPU1		10
-#define RK3588_PD_NPU2		11
-
-/* VD_GPU */
-#define RK3588_PD_GPU		12
-
-/* VD_VCODEC */
-#define RK3588_PD_VCODEC	13
-#define RK3588_PD_RKVDEC0	14
-#define RK3588_PD_RKVDEC1	15
-#define RK3588_PD_VENC0		16
-#define RK3588_PD_VENC1		17
-
-/* VD_DD01 */
-#define RK3588_PD_DDR01		18
-
-/* VD_DD23 */
-#define RK3588_PD_DDR23		19
-
-/* VD_LOGIC */
-#define RK3588_PD_CENTER	20
-#define RK3588_PD_VDPU		21
-#define RK3588_PD_RGA30		22
-#define RK3588_PD_AV1		23
-#define RK3588_PD_VOP		24
-#define RK3588_PD_VO0		25
-#define RK3588_PD_VO1		26
-#define RK3588_PD_VI		27
-#define RK3588_PD_ISP1		28
-#define RK3588_PD_FEC		29
-#define RK3588_PD_RGA31		30
-#define RK3588_PD_USB		31
-#define RK3588_PD_PHP		32
-#define RK3588_PD_GMAC		33
-#define RK3588_PD_PCIE		34
-#define RK3588_PD_NVM		35
-#define RK3588_PD_NVM0		36
-#define RK3588_PD_SDIO		37
-#define RK3588_PD_AUDIO		38
-#define RK3588_PD_SECURE	39
-#define RK3588_PD_SDMMC		40
-#define RK3588_PD_CRYPTO	41
-#define RK3588_PD_BUS		42
-
-/* VD_PMU */
-#define RK3588_PD_PMU1		43
-
-#endif
diff --git a/include/dt-bindings/power/rockchip,rv1126-power.h b/include/dt-bindings/power/rockchip,rv1126-power.h
deleted file mode 100644
index 38a68e000d38..000000000000
--- a/include/dt-bindings/power/rockchip,rv1126-power.h
+++ /dev/null
@@ -1,35 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __DT_BINDINGS_POWER_RV1126_POWER_H__
-#define __DT_BINDINGS_POWER_RV1126_POWER_H__
-
-/* VD_CORE */
-#define RV1126_PD_CPU_0		0
-#define RV1126_PD_CPU_1		1
-#define RV1126_PD_CPU_2		2
-#define RV1126_PD_CPU_3		3
-#define RV1126_PD_CORE_ALIVE	4
-
-/* VD_PMU */
-#define RV1126_PD_PMU		5
-#define RV1126_PD_PMU_ALIVE	6
-
-/* VD_NPU */
-#define RV1126_PD_NPU		7
-
-/* VD_VEPU */
-#define RV1126_PD_VEPU		8
-
-/* VD_LOGIC */
-#define RV1126_PD_VI		9
-#define RV1126_PD_VO		10
-#define RV1126_PD_ISPP		11
-#define RV1126_PD_VDPU		12
-#define RV1126_PD_CRYPTO	13
-#define RV1126_PD_DDR		14
-#define RV1126_PD_NVM		15
-#define RV1126_PD_SDIO		16
-#define RV1126_PD_USB		17
-#define RV1126_PD_LOGIC_ALIVE	18
-
-#endif
diff --git a/include/dt-bindings/reset/rockchip,rk3588-cru.h b/include/dt-bindings/reset/rockchip,rk3588-cru.h
deleted file mode 100644
index 738e56aead93..000000000000
--- a/include/dt-bindings/reset/rockchip,rk3588-cru.h
+++ /dev/null
@@ -1,754 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
-/*
- * Copyright (c) 2021 Rockchip Electronics Co. Ltd.
- * Copyright (c) 2022 Collabora Ltd.
- *
- * Author: Elaine Zhang <zhangqing@rock-chips.com>
- * Author: Sebastian Reichel <sebastian.reichel@collabora.com>
- */
-
-#ifndef _DT_BINDINGS_RESET_ROCKCHIP_RK3588_H
-#define _DT_BINDINGS_RESET_ROCKCHIP_RK3588_H
-
-#define SRST_A_TOP_BIU			0
-#define SRST_P_TOP_BIU			1
-#define SRST_P_CSIPHY0			2
-#define SRST_CSIPHY0			3
-#define SRST_P_CSIPHY1			4
-#define SRST_CSIPHY1			5
-#define SRST_A_TOP_M500_BIU		6
-
-#define SRST_A_TOP_M400_BIU		7
-#define SRST_A_TOP_S200_BIU		8
-#define SRST_A_TOP_S400_BIU		9
-#define SRST_A_TOP_M300_BIU		10
-#define SRST_USBDP_COMBO_PHY0_INIT	11
-#define SRST_USBDP_COMBO_PHY0_CMN	12
-#define SRST_USBDP_COMBO_PHY0_LANE	13
-#define SRST_USBDP_COMBO_PHY0_PCS	14
-#define SRST_USBDP_COMBO_PHY1_INIT	15
-
-#define SRST_USBDP_COMBO_PHY1_CMN	16
-#define SRST_USBDP_COMBO_PHY1_LANE	17
-#define SRST_USBDP_COMBO_PHY1_PCS	18
-#define SRST_DCPHY0			19
-#define SRST_P_MIPI_DCPHY0		20
-#define SRST_P_MIPI_DCPHY0_GRF		21
-
-#define SRST_DCPHY1			22
-#define SRST_P_MIPI_DCPHY1		23
-#define SRST_P_MIPI_DCPHY1_GRF		24
-#define SRST_P_APB2ASB_SLV_CDPHY	25
-#define SRST_P_APB2ASB_SLV_CSIPHY	26
-#define SRST_P_APB2ASB_SLV_VCCIO3_5	27
-#define SRST_P_APB2ASB_SLV_VCCIO6	28
-#define SRST_P_APB2ASB_SLV_EMMCIO	29
-#define SRST_P_APB2ASB_SLV_IOC_TOP	30
-#define SRST_P_APB2ASB_SLV_IOC_RIGHT	31
-
-#define SRST_P_CRU			32
-#define SRST_A_CHANNEL_SECURE2VO1USB	33
-#define SRST_A_CHANNEL_SECURE2CENTER	34
-#define SRST_H_CHANNEL_SECURE2VO1USB	35
-#define SRST_H_CHANNEL_SECURE2CENTER	36
-
-#define SRST_P_CHANNEL_SECURE2VO1USB	37
-#define SRST_P_CHANNEL_SECURE2CENTER	38
-
-#define SRST_H_AUDIO_BIU		39
-#define SRST_P_AUDIO_BIU		40
-#define SRST_H_I2S0_8CH			41
-#define SRST_M_I2S0_8CH_TX		42
-#define SRST_M_I2S0_8CH_RX		43
-#define SRST_P_ACDCDIG			44
-#define SRST_H_I2S2_2CH			45
-#define SRST_H_I2S3_2CH			46
-
-#define SRST_M_I2S2_2CH			47
-#define SRST_M_I2S3_2CH			48
-#define SRST_DAC_ACDCDIG		49
-#define SRST_H_SPDIF0			50
-
-#define SRST_M_SPDIF0			51
-#define SRST_H_SPDIF1			52
-#define SRST_M_SPDIF1			53
-#define SRST_H_PDM1			54
-#define SRST_PDM1			55
-
-#define SRST_A_BUS_BIU			56
-#define SRST_P_BUS_BIU			57
-#define SRST_A_GIC			58
-#define SRST_A_GIC_DBG			59
-#define SRST_A_DMAC0			60
-#define SRST_A_DMAC1			61
-#define SRST_A_DMAC2			62
-#define SRST_P_I2C1			63
-#define SRST_P_I2C2			64
-#define SRST_P_I2C3			65
-#define SRST_P_I2C4			66
-#define SRST_P_I2C5			67
-#define SRST_P_I2C6			68
-#define SRST_P_I2C7			69
-#define SRST_P_I2C8			70
-
-#define SRST_I2C1			71
-#define SRST_I2C2			72
-#define SRST_I2C3			73
-#define SRST_I2C4			74
-#define SRST_I2C5			75
-#define SRST_I2C6			76
-#define SRST_I2C7			77
-#define SRST_I2C8			78
-#define SRST_P_CAN0			79
-#define SRST_CAN0			80
-#define SRST_P_CAN1			81
-#define SRST_CAN1			82
-#define SRST_P_CAN2			83
-#define SRST_CAN2			84
-#define SRST_P_SARADC			85
-
-#define SRST_P_TSADC			86
-#define SRST_TSADC			87
-#define SRST_P_UART1			88
-#define SRST_P_UART2			89
-#define SRST_P_UART3			90
-#define SRST_P_UART4			91
-#define SRST_P_UART5			92
-#define SRST_P_UART6			93
-#define SRST_P_UART7			94
-#define SRST_P_UART8			95
-#define SRST_P_UART9			96
-#define SRST_S_UART1			97
-
-#define SRST_S_UART2			98
-#define SRST_S_UART3			99
-#define SRST_S_UART4			100
-#define SRST_S_UART5			101
-#define SRST_S_UART6			102
-#define SRST_S_UART7			103
-
-#define SRST_S_UART8			104
-#define SRST_S_UART9			105
-#define SRST_P_SPI0			106
-#define SRST_P_SPI1			107
-#define SRST_P_SPI2			108
-#define SRST_P_SPI3			109
-#define SRST_P_SPI4			110
-#define SRST_SPI0			111
-#define SRST_SPI1			112
-#define SRST_SPI2			113
-#define SRST_SPI3			114
-#define SRST_SPI4			115
-
-#define SRST_P_WDT0			116
-#define SRST_T_WDT0			117
-#define SRST_P_SYS_GRF			118
-#define SRST_P_PWM1			119
-#define SRST_PWM1			120
-#define SRST_P_PWM2			121
-#define SRST_PWM2			122
-#define SRST_P_PWM3			123
-#define SRST_PWM3			124
-#define SRST_P_BUSTIMER0		125
-#define SRST_P_BUSTIMER1		126
-#define SRST_BUSTIMER0			127
-
-#define SRST_BUSTIMER1			128
-#define SRST_BUSTIMER2			129
-#define SRST_BUSTIMER3			130
-#define SRST_BUSTIMER4			131
-#define SRST_BUSTIMER5			132
-#define SRST_BUSTIMER6			133
-#define SRST_BUSTIMER7			134
-#define SRST_BUSTIMER8			135
-#define SRST_BUSTIMER9			136
-#define SRST_BUSTIMER10			137
-#define SRST_BUSTIMER11			138
-#define SRST_P_MAILBOX0			139
-#define SRST_P_MAILBOX1			140
-#define SRST_P_MAILBOX2			141
-#define SRST_P_GPIO1			142
-#define SRST_GPIO1			143
-
-#define SRST_P_GPIO2			144
-#define SRST_GPIO2			145
-#define SRST_P_GPIO3			146
-#define SRST_GPIO3			147
-#define SRST_P_GPIO4			148
-#define SRST_GPIO4			149
-#define SRST_A_DECOM			150
-#define SRST_P_DECOM			151
-#define SRST_D_DECOM			152
-#define SRST_P_TOP			153
-#define SRST_A_GICADB_GIC2CORE_BUS	154
-#define SRST_P_DFT2APB			155
-#define SRST_P_APB2ASB_MST_TOP		156
-#define SRST_P_APB2ASB_MST_CDPHY	157
-#define SRST_P_APB2ASB_MST_BOT_RIGHT	158
-
-#define SRST_P_APB2ASB_MST_IOC_TOP	159
-#define SRST_P_APB2ASB_MST_IOC_RIGHT	160
-#define SRST_P_APB2ASB_MST_CSIPHY	161
-#define SRST_P_APB2ASB_MST_VCCIO3_5	162
-#define SRST_P_APB2ASB_MST_VCCIO6	163
-#define SRST_P_APB2ASB_MST_EMMCIO	164
-#define SRST_A_SPINLOCK			165
-#define SRST_P_OTPC_NS			166
-#define SRST_OTPC_NS			167
-#define SRST_OTPC_ARB			168
-
-#define SRST_P_BUSIOC			169
-#define SRST_P_PMUCM0_INTMUX		170
-#define SRST_P_DDRCM0_INTMUX		171
-
-#define SRST_P_DDR_DFICTL_CH0		172
-#define SRST_P_DDR_MON_CH0		173
-#define SRST_P_DDR_STANDBY_CH0		174
-#define SRST_P_DDR_UPCTL_CH0		175
-#define SRST_TM_DDR_MON_CH0		176
-#define SRST_P_DDR_GRF_CH01		177
-#define SRST_DFI_CH0			178
-#define SRST_SBR_CH0			179
-#define SRST_DDR_UPCTL_CH0		180
-#define SRST_DDR_DFICTL_CH0		181
-#define SRST_DDR_MON_CH0		182
-#define SRST_DDR_STANDBY_CH0		183
-#define SRST_A_DDR_UPCTL_CH0		184
-#define SRST_P_DDR_DFICTL_CH1		185
-#define SRST_P_DDR_MON_CH1		186
-#define SRST_P_DDR_STANDBY_CH1		187
-
-#define SRST_P_DDR_UPCTL_CH1		188
-#define SRST_TM_DDR_MON_CH1		189
-#define SRST_DFI_CH1			190
-#define SRST_SBR_CH1			191
-#define SRST_DDR_UPCTL_CH1		192
-#define SRST_DDR_DFICTL_CH1		193
-#define SRST_DDR_MON_CH1		194
-#define SRST_DDR_STANDBY_CH1		195
-#define SRST_A_DDR_UPCTL_CH1		196
-#define SRST_A_DDR01_MSCH0		197
-#define SRST_A_DDR01_RS_MSCH0		198
-#define SRST_A_DDR01_FRS_MSCH0		199
-
-#define SRST_A_DDR01_SCRAMBLE0		200
-#define SRST_A_DDR01_FRS_SCRAMBLE0	201
-#define SRST_A_DDR01_MSCH1		202
-#define SRST_A_DDR01_RS_MSCH1		203
-#define SRST_A_DDR01_FRS_MSCH1		204
-#define SRST_A_DDR01_SCRAMBLE1		205
-#define SRST_A_DDR01_FRS_SCRAMBLE1	206
-#define SRST_P_DDR01_MSCH0		207
-#define SRST_P_DDR01_MSCH1		208
-
-#define SRST_P_DDR_DFICTL_CH2		209
-#define SRST_P_DDR_MON_CH2		210
-#define SRST_P_DDR_STANDBY_CH2		211
-#define SRST_P_DDR_UPCTL_CH2		212
-#define SRST_TM_DDR_MON_CH2		213
-#define SRST_P_DDR_GRF_CH23		214
-#define SRST_DFI_CH2			215
-#define SRST_SBR_CH2			216
-#define SRST_DDR_UPCTL_CH2		217
-#define SRST_DDR_DFICTL_CH2		218
-#define SRST_DDR_MON_CH2		219
-#define SRST_DDR_STANDBY_CH2		220
-#define SRST_A_DDR_UPCTL_CH2		221
-#define SRST_P_DDR_DFICTL_CH3		222
-#define SRST_P_DDR_MON_CH3		223
-#define SRST_P_DDR_STANDBY_CH3		224
-
-#define SRST_P_DDR_UPCTL_CH3		225
-#define SRST_TM_DDR_MON_CH3		226
-#define SRST_DFI_CH3			227
-#define SRST_SBR_CH3			228
-#define SRST_DDR_UPCTL_CH3		229
-#define SRST_DDR_DFICTL_CH3		230
-#define SRST_DDR_MON_CH3		231
-#define SRST_DDR_STANDBY_CH3		232
-#define SRST_A_DDR_UPCTL_CH3		233
-#define SRST_A_DDR23_MSCH2		234
-#define SRST_A_DDR23_RS_MSCH2		235
-#define SRST_A_DDR23_FRS_MSCH2		236
-
-#define SRST_A_DDR23_SCRAMBLE2		237
-#define SRST_A_DDR23_FRS_SCRAMBLE2	238
-#define SRST_A_DDR23_MSCH3		239
-#define SRST_A_DDR23_RS_MSCH3		240
-#define SRST_A_DDR23_FRS_MSCH3		241
-#define SRST_A_DDR23_SCRAMBLE3		242
-#define SRST_A_DDR23_FRS_SCRAMBLE3	243
-#define SRST_P_DDR23_MSCH2		244
-#define SRST_P_DDR23_MSCH3		245
-
-#define SRST_ISP1			246
-#define SRST_ISP1_VICAP			247
-#define SRST_A_ISP1_BIU			248
-#define SRST_H_ISP1_BIU			249
-
-#define SRST_A_RKNN1			250
-#define SRST_A_RKNN1_BIU		251
-#define SRST_H_RKNN1			252
-#define SRST_H_RKNN1_BIU		253
-
-#define SRST_A_RKNN2			254
-#define SRST_A_RKNN2_BIU		255
-#define SRST_H_RKNN2			256
-#define SRST_H_RKNN2_BIU		257
-
-#define SRST_A_RKNN_DSU0		258
-#define SRST_P_NPUTOP_BIU		259
-#define SRST_P_NPU_TIMER		260
-#define SRST_NPUTIMER0			261
-#define SRST_NPUTIMER1			262
-#define SRST_P_NPU_WDT			263
-#define SRST_T_NPU_WDT			264
-#define SRST_P_NPU_PVTM			265
-#define SRST_P_NPU_GRF			266
-#define SRST_NPU_PVTM			267
-
-#define SRST_NPU_PVTPLL			268
-#define SRST_H_NPU_CM0_BIU		269
-#define SRST_F_NPU_CM0_CORE		270
-#define SRST_T_NPU_CM0_JTAG		271
-#define SRST_A_RKNN0			272
-#define SRST_A_RKNN0_BIU		273
-#define SRST_H_RKNN0			274
-#define SRST_H_RKNN0_BIU		275
-
-#define SRST_H_NVM_BIU			276
-#define SRST_A_NVM_BIU			277
-#define SRST_H_EMMC			278
-#define SRST_A_EMMC			279
-#define SRST_C_EMMC			280
-#define SRST_B_EMMC			281
-#define SRST_T_EMMC			282
-#define SRST_S_SFC			283
-#define SRST_H_SFC			284
-#define SRST_H_SFC_XIP			285
-
-#define SRST_P_GRF			286
-#define SRST_P_DEC_BIU			287
-#define SRST_P_PHP_BIU			288
-#define SRST_A_PCIE_GRIDGE		289
-#define SRST_A_PHP_BIU			290
-#define SRST_A_GMAC0			291
-#define SRST_A_GMAC1			292
-#define SRST_A_PCIE_BIU			293
-#define SRST_PCIE0_POWER_UP		294
-#define SRST_PCIE1_POWER_UP		295
-#define SRST_PCIE2_POWER_UP		296
-
-#define SRST_PCIE3_POWER_UP		297
-#define SRST_PCIE4_POWER_UP		298
-#define SRST_P_PCIE0			299
-#define SRST_P_PCIE1			300
-#define SRST_P_PCIE2			301
-#define SRST_P_PCIE3			302
-
-#define SRST_P_PCIE4			303
-#define SRST_A_PHP_GIC_ITS		304
-#define SRST_A_MMU_PCIE			305
-#define SRST_A_MMU_PHP			306
-#define SRST_A_MMU_BIU			307
-
-#define SRST_A_USB3OTG2			308
-
-#define SRST_PMALIVE0			309
-#define SRST_PMALIVE1			310
-#define SRST_PMALIVE2			311
-#define SRST_A_SATA0			312
-#define SRST_A_SATA1			313
-#define SRST_A_SATA2			314
-#define SRST_RXOOB0			315
-#define SRST_RXOOB1			316
-#define SRST_RXOOB2			317
-#define SRST_ASIC0			318
-#define SRST_ASIC1			319
-#define SRST_ASIC2			320
-
-#define SRST_A_RKVDEC_CCU		321
-#define SRST_H_RKVDEC0			322
-#define SRST_A_RKVDEC0			323
-#define SRST_H_RKVDEC0_BIU		324
-#define SRST_A_RKVDEC0_BIU		325
-#define SRST_RKVDEC0_CA			326
-#define SRST_RKVDEC0_HEVC_CA		327
-#define SRST_RKVDEC0_CORE		328
-
-#define SRST_H_RKVDEC1			329
-#define SRST_A_RKVDEC1			330
-#define SRST_H_RKVDEC1_BIU		331
-#define SRST_A_RKVDEC1_BIU		332
-#define SRST_RKVDEC1_CA			333
-#define SRST_RKVDEC1_HEVC_CA		334
-#define SRST_RKVDEC1_CORE		335
-
-#define SRST_A_USB_BIU			336
-#define SRST_H_USB_BIU			337
-#define SRST_A_USB3OTG0			338
-#define SRST_A_USB3OTG1			339
-#define SRST_H_HOST0			340
-#define SRST_H_HOST_ARB0		341
-#define SRST_H_HOST1			342
-#define SRST_H_HOST_ARB1		343
-#define SRST_A_USB_GRF			344
-#define SRST_C_USB2P0_HOST0		345
-
-#define SRST_C_USB2P0_HOST1		346
-#define SRST_HOST_UTMI0			347
-#define SRST_HOST_UTMI1			348
-
-#define SRST_A_VDPU_BIU			349
-#define SRST_A_VDPU_LOW_BIU		350
-#define SRST_H_VDPU_BIU			351
-#define SRST_A_JPEG_DECODER_BIU		352
-#define SRST_A_VPU			353
-#define SRST_H_VPU			354
-#define SRST_A_JPEG_ENCODER0		355
-#define SRST_H_JPEG_ENCODER0		356
-#define SRST_A_JPEG_ENCODER1		357
-#define SRST_H_JPEG_ENCODER1		358
-#define SRST_A_JPEG_ENCODER2		359
-#define SRST_H_JPEG_ENCODER2		360
-
-#define SRST_A_JPEG_ENCODER3		361
-#define SRST_H_JPEG_ENCODER3		362
-#define SRST_A_JPEG_DECODER		363
-#define SRST_H_JPEG_DECODER		364
-#define SRST_H_IEP2P0			365
-#define SRST_A_IEP2P0			366
-#define SRST_IEP2P0_CORE		367
-#define SRST_H_RGA2			368
-#define SRST_A_RGA2			369
-#define SRST_RGA2_CORE			370
-#define SRST_H_RGA3_0			371
-#define SRST_A_RGA3_0			372
-#define SRST_RGA3_0_CORE		373
-
-#define SRST_H_RKVENC0_BIU		374
-#define SRST_A_RKVENC0_BIU		375
-#define SRST_H_RKVENC0			376
-#define SRST_A_RKVENC0			377
-#define SRST_RKVENC0_CORE		378
-
-#define SRST_H_RKVENC1_BIU		379
-#define SRST_A_RKVENC1_BIU		380
-#define SRST_H_RKVENC1			381
-#define SRST_A_RKVENC1			382
-#define SRST_RKVENC1_CORE		383
-
-#define SRST_A_VI_BIU			384
-#define SRST_H_VI_BIU			385
-#define SRST_P_VI_BIU			386
-#define SRST_D_VICAP			387
-#define SRST_A_VICAP			388
-#define SRST_H_VICAP			389
-#define SRST_ISP0			390
-#define SRST_ISP0_VICAP			391
-
-#define SRST_FISHEYE0			392
-#define SRST_FISHEYE1			393
-#define SRST_P_CSI_HOST_0		394
-#define SRST_P_CSI_HOST_1		395
-#define SRST_P_CSI_HOST_2		396
-#define SRST_P_CSI_HOST_3		397
-#define SRST_P_CSI_HOST_4		398
-#define SRST_P_CSI_HOST_5		399
-
-#define SRST_CSIHOST0_VICAP		400
-#define SRST_CSIHOST1_VICAP		401
-#define SRST_CSIHOST2_VICAP		402
-#define SRST_CSIHOST3_VICAP		403
-#define SRST_CSIHOST4_VICAP		404
-#define SRST_CSIHOST5_VICAP		405
-#define SRST_CIFIN			406
-
-#define SRST_A_VOP_BIU			407
-#define SRST_A_VOP_LOW_BIU		408
-#define SRST_H_VOP_BIU			409
-#define SRST_P_VOP_BIU			410
-#define SRST_H_VOP			411
-#define SRST_A_VOP			412
-#define SRST_D_VOP0			413
-#define SRST_D_VOP2HDMI_BRIDGE0		414
-#define SRST_D_VOP2HDMI_BRIDGE1		415
-
-#define SRST_D_VOP1			416
-#define SRST_D_VOP2			417
-#define SRST_D_VOP3			418
-#define SRST_P_VOPGRF			419
-#define SRST_P_DSIHOST0			420
-#define SRST_P_DSIHOST1			421
-#define SRST_DSIHOST0			422
-#define SRST_DSIHOST1			423
-#define SRST_VOP_PMU			424
-#define SRST_P_VOP_CHANNEL_BIU		425
-
-#define SRST_H_VO0_BIU			426
-#define SRST_H_VO0_S_BIU		427
-#define SRST_P_VO0_BIU			428
-#define SRST_P_VO0_S_BIU		429
-#define SRST_A_HDCP0_BIU		430
-#define SRST_P_VO0GRF			431
-#define SRST_H_HDCP_KEY0		432
-#define SRST_A_HDCP0			433
-#define SRST_H_HDCP0			434
-#define SRST_HDCP0			435
-
-#define SRST_P_TRNG0			436
-#define SRST_DP0			437
-#define SRST_DP1			438
-#define SRST_H_I2S4_8CH			439
-#define SRST_M_I2S4_8CH_TX		440
-#define SRST_H_I2S8_8CH			441
-
-#define SRST_M_I2S8_8CH_TX		442
-#define SRST_H_SPDIF2_DP0		443
-#define SRST_M_SPDIF2_DP0		444
-#define SRST_H_SPDIF5_DP1		445
-#define SRST_M_SPDIF5_DP1		446
-
-#define SRST_A_HDCP1_BIU		447
-#define SRST_A_VO1_BIU			448
-#define SRST_H_VOP1_BIU			449
-#define SRST_H_VOP1_S_BIU		450
-#define SRST_P_VOP1_BIU			451
-#define SRST_P_VO1GRF			452
-#define SRST_P_VO1_S_BIU		453
-
-#define SRST_H_I2S7_8CH			454
-#define SRST_M_I2S7_8CH_RX		455
-#define SRST_H_HDCP_KEY1		456
-#define SRST_A_HDCP1			457
-#define SRST_H_HDCP1			458
-#define SRST_HDCP1			459
-#define SRST_P_TRNG1			460
-#define SRST_P_HDMITX0			461
-
-#define SRST_HDMITX0_REF		462
-#define SRST_P_HDMITX1			463
-#define SRST_HDMITX1_REF		464
-#define SRST_A_HDMIRX			465
-#define SRST_P_HDMIRX			466
-#define SRST_HDMIRX_REF			467
-
-#define SRST_P_EDP0			468
-#define SRST_EDP0_24M			469
-#define SRST_P_EDP1			470
-#define SRST_EDP1_24M			471
-#define SRST_M_I2S5_8CH_TX		472
-#define SRST_H_I2S5_8CH			473
-#define SRST_M_I2S6_8CH_TX		474
-
-#define SRST_M_I2S6_8CH_RX		475
-#define SRST_H_I2S6_8CH			476
-#define SRST_H_SPDIF3			477
-#define SRST_M_SPDIF3			478
-#define SRST_H_SPDIF4			479
-#define SRST_M_SPDIF4			480
-#define SRST_H_SPDIFRX0			481
-#define SRST_M_SPDIFRX0			482
-#define SRST_H_SPDIFRX1			483
-#define SRST_M_SPDIFRX1			484
-
-#define SRST_H_SPDIFRX2			485
-#define SRST_M_SPDIFRX2			486
-#define SRST_LINKSYM_HDMITXPHY0		487
-#define SRST_LINKSYM_HDMITXPHY1		488
-#define SRST_VO1_BRIDGE0		489
-#define SRST_VO1_BRIDGE1		490
-
-#define SRST_H_I2S9_8CH			491
-#define SRST_M_I2S9_8CH_RX		492
-#define SRST_H_I2S10_8CH		493
-#define SRST_M_I2S10_8CH_RX		494
-#define SRST_P_S_HDMIRX			495
-
-#define SRST_GPU			496
-#define SRST_SYS_GPU			497
-#define SRST_A_S_GPU_BIU		498
-#define SRST_A_M0_GPU_BIU		499
-#define SRST_A_M1_GPU_BIU		500
-#define SRST_A_M2_GPU_BIU		501
-#define SRST_A_M3_GPU_BIU		502
-#define SRST_P_GPU_BIU			503
-#define SRST_P_GPU_PVTM			504
-
-#define SRST_GPU_PVTM			505
-#define SRST_P_GPU_GRF			506
-#define SRST_GPU_PVTPLL			507
-#define SRST_GPU_JTAG			508
-
-#define SRST_A_AV1_BIU			509
-#define SRST_A_AV1			510
-#define SRST_P_AV1_BIU			511
-#define SRST_P_AV1			512
-
-#define SRST_A_DDR_BIU			513
-#define SRST_A_DMA2DDR			514
-#define SRST_A_DDR_SHAREMEM		515
-#define SRST_A_DDR_SHAREMEM_BIU		516
-#define SRST_A_CENTER_S200_BIU		517
-#define SRST_A_CENTER_S400_BIU		518
-#define SRST_H_AHB2APB			519
-#define SRST_H_CENTER_BIU		520
-#define SRST_F_DDR_CM0_CORE		521
-
-#define SRST_DDR_TIMER0			522
-#define SRST_DDR_TIMER1			523
-#define SRST_T_WDT_DDR			524
-#define SRST_T_DDR_CM0_JTAG		525
-#define SRST_P_CENTER_GRF		526
-#define SRST_P_AHB2APB			527
-#define SRST_P_WDT			528
-#define SRST_P_TIMER			529
-#define SRST_P_DMA2DDR			530
-#define SRST_P_SHAREMEM			531
-#define SRST_P_CENTER_BIU		532
-#define SRST_P_CENTER_CHANNEL_BIU	533
-
-#define SRST_P_USBDPGRF0		534
-#define SRST_P_USBDPPHY0		535
-#define SRST_P_USBDPGRF1		536
-#define SRST_P_USBDPPHY1		537
-#define SRST_P_HDPTX0			538
-#define SRST_P_HDPTX1			539
-#define SRST_P_APB2ASB_SLV_BOT_RIGHT	540
-#define SRST_P_USB2PHY_U3_0_GRF0	541
-#define SRST_P_USB2PHY_U3_1_GRF0	542
-#define SRST_P_USB2PHY_U2_0_GRF0	543
-#define SRST_P_USB2PHY_U2_1_GRF0	544
-#define SRST_HDPTX0_ROPLL		545
-#define SRST_HDPTX0_LCPLL		546
-#define SRST_HDPTX0			547
-#define SRST_HDPTX1_ROPLL		548
-
-#define SRST_HDPTX1_LCPLL		549
-#define SRST_HDPTX1			550
-#define SRST_HDPTX0_HDMIRXPHY_SET	551
-#define SRST_USBDP_COMBO_PHY0		552
-#define SRST_USBDP_COMBO_PHY0_LCPLL	553
-#define SRST_USBDP_COMBO_PHY0_ROPLL	554
-#define SRST_USBDP_COMBO_PHY0_PCS_HS	555
-#define SRST_USBDP_COMBO_PHY1		556
-#define SRST_USBDP_COMBO_PHY1_LCPLL	557
-#define SRST_USBDP_COMBO_PHY1_ROPLL	558
-#define SRST_USBDP_COMBO_PHY1_PCS_HS	559
-#define SRST_HDMIHDP0			560
-#define SRST_HDMIHDP1			561
-
-#define SRST_A_VO1USB_TOP_BIU		562
-#define SRST_H_VO1USB_TOP_BIU		563
-
-#define SRST_H_SDIO_BIU			564
-#define SRST_H_SDIO			565
-#define SRST_SDIO			566
-
-#define SRST_H_RGA3_BIU			567
-#define SRST_A_RGA3_BIU			568
-#define SRST_H_RGA3_1			569
-#define SRST_A_RGA3_1			570
-#define SRST_RGA3_1_CORE		571
-
-#define SRST_REF_PIPE_PHY0		572
-#define SRST_REF_PIPE_PHY1		573
-#define SRST_REF_PIPE_PHY2		574
-
-#define SRST_P_PHPTOP_CRU		575
-#define SRST_P_PCIE2_GRF0		576
-#define SRST_P_PCIE2_GRF1		577
-#define SRST_P_PCIE2_GRF2		578
-#define SRST_P_PCIE2_PHY0		579
-#define SRST_P_PCIE2_PHY1		580
-#define SRST_P_PCIE2_PHY2		581
-#define SRST_P_PCIE3_PHY		582
-#define SRST_P_APB2ASB_SLV_CHIP_TOP	583
-#define SRST_PCIE30_PHY			584
-
-#define SRST_H_PMU1_BIU			585
-#define SRST_P_PMU1_BIU			586
-#define SRST_H_PMU_CM0_BIU		587
-#define SRST_F_PMU_CM0_CORE		588
-#define SRST_T_PMU1_CM0_JTAG		589
-
-#define SRST_DDR_FAIL_SAFE		590
-#define SRST_P_CRU_PMU1			591
-#define SRST_P_PMU1_GRF			592
-#define SRST_P_PMU1_IOC			593
-#define SRST_P_PMU1WDT			594
-#define SRST_T_PMU1WDT			595
-#define SRST_P_PMU1TIMER		596
-#define SRST_PMU1TIMER0			597
-#define SRST_PMU1TIMER1			598
-#define SRST_P_PMU1PWM			599
-#define SRST_PMU1PWM			600
-
-#define SRST_P_I2C0			601
-#define SRST_I2C0			602
-#define SRST_S_UART0			603
-#define SRST_P_UART0			604
-#define SRST_H_I2S1_8CH			605
-#define SRST_M_I2S1_8CH_TX		606
-#define SRST_M_I2S1_8CH_RX		607
-#define SRST_H_PDM0			608
-#define SRST_PDM0			609
-
-#define SRST_H_VAD			610
-#define SRST_HDPTX0_INIT		611
-#define SRST_HDPTX0_CMN			612
-#define SRST_HDPTX0_LANE		613
-#define SRST_HDPTX1_INIT		614
-
-#define SRST_HDPTX1_CMN			615
-#define SRST_HDPTX1_LANE		616
-#define SRST_M_MIPI_DCPHY0		617
-#define SRST_S_MIPI_DCPHY0		618
-#define SRST_M_MIPI_DCPHY1		619
-#define SRST_S_MIPI_DCPHY1		620
-#define SRST_OTGPHY_U3_0		621
-#define SRST_OTGPHY_U3_1		622
-#define SRST_OTGPHY_U2_0		623
-#define SRST_OTGPHY_U2_1		624
-
-#define SRST_P_PMU0GRF			625
-#define SRST_P_PMU0IOC			626
-#define SRST_P_GPIO0			627
-#define SRST_GPIO0			628
-
-#define SRST_A_SECURE_NS_BIU		629
-#define SRST_H_SECURE_NS_BIU		630
-#define SRST_A_SECURE_S_BIU		631
-#define SRST_H_SECURE_S_BIU		632
-#define SRST_P_SECURE_S_BIU		633
-#define SRST_CRYPTO_CORE		634
-
-#define SRST_CRYPTO_PKA			635
-#define SRST_CRYPTO_RNG			636
-#define SRST_A_CRYPTO			637
-#define SRST_H_CRYPTO			638
-#define SRST_KEYLADDER_CORE		639
-#define SRST_KEYLADDER_RNG		640
-#define SRST_A_KEYLADDER		641
-#define SRST_H_KEYLADDER		642
-#define SRST_P_OTPC_S			643
-#define SRST_OTPC_S			644
-#define SRST_WDT_S			645
-
-#define SRST_T_WDT_S			646
-#define SRST_H_BOOTROM			647
-#define SRST_A_DCF			648
-#define SRST_P_DCF			649
-#define SRST_H_BOOTROM_NS		650
-#define SRST_P_KEYLADDER		651
-#define SRST_H_TRNG_S			652
-
-#define SRST_H_TRNG_NS			653
-#define SRST_D_SDMMC_BUFFER		654
-#define SRST_H_SDMMC			655
-#define SRST_H_SDMMC_BUFFER		656
-#define SRST_SDMMC			657
-#define SRST_P_TRNG_CHK			658
-#define SRST_TRNG_S			659
-
-#endif
diff --git a/include/dt-bindings/soc/rockchip,boot-mode.h b/include/dt-bindings/soc/rockchip,boot-mode.h
deleted file mode 100644
index 4b0914c0989d..000000000000
--- a/include/dt-bindings/soc/rockchip,boot-mode.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ROCKCHIP_BOOT_MODE_H
-#define __ROCKCHIP_BOOT_MODE_H
-
-/*high 24 bits is tag, low 8 bits is type*/
-#define REBOOT_FLAG		0x5242C300
-/* normal boot */
-#define BOOT_NORMAL		(REBOOT_FLAG + 0)
-/* enter bootloader rockusb mode */
-#define BOOT_BL_DOWNLOAD	(REBOOT_FLAG + 1)
-/* enter recovery */
-#define BOOT_RECOVERY		(REBOOT_FLAG + 3)
- /* enter fastboot mode */
-#define BOOT_FASTBOOT		(REBOOT_FLAG + 9)
-
-#endif
diff --git a/include/dt-bindings/soc/rockchip,vop2.h b/include/dt-bindings/soc/rockchip,vop2.h
deleted file mode 100644
index 668f199df9f0..000000000000
--- a/include/dt-bindings/soc/rockchip,vop2.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
-
-#ifndef __DT_BINDINGS_ROCKCHIP_VOP2_H
-#define __DT_BINDINGS_ROCKCHIP_VOP2_H
-
-#define ROCKCHIP_VOP2_EP_RGB0	1
-#define ROCKCHIP_VOP2_EP_HDMI0	2
-#define ROCKCHIP_VOP2_EP_EDP0	3
-#define ROCKCHIP_VOP2_EP_MIPI0	4
-#define ROCKCHIP_VOP2_EP_LVDS0	5
-#define ROCKCHIP_VOP2_EP_MIPI1	6
-#define ROCKCHIP_VOP2_EP_LVDS1	7
-#define ROCKCHIP_VOP2_EP_HDMI1	8
-#define ROCKCHIP_VOP2_EP_EDP1	9
-#define ROCKCHIP_VOP2_EP_DP0	10
-#define ROCKCHIP_VOP2_EP_DP1	11
-
-#endif /* __DT_BINDINGS_ROCKCHIP_VOP2_H */

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
