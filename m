Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6826870791
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Mar 2024 17:51:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AD9FC6DD73;
	Mon,  4 Mar 2024 16:51:34 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55D70C6DD65
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 16:51:33 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-33e27940554so1592090f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 08:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709571093; x=1710175893;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hXCbUX1u+7XZRxeI4HTdb75qmHQZPv1hb24EF9Ptd1c=;
 b=Qlrc7QfWxzno9PdZWfEaIgONEhXzzLL2LvlEA3pHwcM7/tMnHkRMj4vRRoJqhjrqlD
 2xNYYMM3MC3xhWnXUFnA+ykHZ2fLfLUdEgqQrl0NBuObNwNcWiGwdfJUKsX5E1ircKjG
 /zvwGppUwSIrTg9b/8yQlpFWnXc1uUTy+U28RoOwjD7yRL1QD8Jsi71KhedafAY4qT0X
 a2Py/+pFbFfJIzmGYlPA4xEoqsrjxI3ortf76ztldkQrIp/+lDxkfjrRmaujNEsK5Mg+
 8j77Wg+BezUmRju24Bj3YwQovyqV3Pic7SD3NMc0tzMPsCZNHFtTxb4i4GHxoqzliJmV
 rZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571093; x=1710175893;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hXCbUX1u+7XZRxeI4HTdb75qmHQZPv1hb24EF9Ptd1c=;
 b=OkZzA/fYfdf0wTG5RPvjbF5qxLKX2hrqkHDS4dXbIxkKAC6EOvnqe9UrmTncDWk3p+
 Awuse+hvHnGzV559a9Rw8cB+sJRh+uLZJNTCSpoxLNXVeZTHt/O19HK/an/Cx4ElZOWs
 fr//mdLq50PvnS/i3ZOd4Lldd/rXuIOg/0EguyPDahIZKVjQ+h0Mva3qmUiuI6OlWgaH
 VoklXcOI+W1C3KtRnZzUj3R9pFWzk2SHKJG/+m96Cab2GA1jnY6wFU4q5WUx6tLfiaS9
 Ta6w2OpykRrMxB1iZ44gvl4K2YFwcJRvTIPv98Kh3bNX2lDQ+OAXHBdfM0UyiiDQ5uVQ
 tIgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9VSATnLml1RcyQ92OzqfLTWIOiS6UoOyzrp3aLiAfLgEUu/pGm8zocdb3MFffHPCdtlpyYYwgmuDRZkE+3sNwTtuPLKY1+xEWiRSBsdDJiIpiTmHzw9vz
X-Gm-Message-State: AOJu0Yz5gWbWna6mSDn1CVCyuGChiGx3dkY9hROBOBJ6XyxWh/b+EUn7
 DW/M8BOr64clnv98p93t10HvG1rvgY6zg22W3/VzdGrAGeubJ94nPEyQPLujX+U=
X-Google-Smtp-Source: AGHT+IFanaKs3POOg2bvnHRI5PJ9QUO9arbqYce37CrG8m3LmbHF7IgIxf2Bu+lvjnIMqkCNKU4vXw==
X-Received: by 2002:adf:9ccf:0:b0:33e:21b4:5a3a with SMTP id
 h15-20020adf9ccf000000b0033e21b45a3amr6266665wre.15.1709571092823; 
 Mon, 04 Mar 2024 08:51:32 -0800 (PST)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm10598517wmq.6.2024.03.04.08.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:51:32 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Mon, 04 Mar 2024 16:51:14 +0000
MIME-Version: 1.0
Message-Id: <20240304-b4-upstream-dt-headers-v1-6-b7ff41925f92@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=27445;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=nEpu0mlJHc4DgWPRaCxTBp5k44dcZHf0q7/u3eUFhKg=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtSnf9juz76kfCjLeNqzXo+788MPTIqyfLgr++yHDbVKc
 bfCHK0TO0pZGAQ5GGTFFFnETyyzbFp72V5j+4ILMHNYmUCGMHBxCsBEArIZ/kcta/L+fTOTY+nj
 gJUlDwUfRgj4vY5M556U1/bQwV5ZVJDhr9yN3n8rNl3cmvbrfM2/Bd58cbpvNrpGGNxifqTvazj
 PdhkA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH RFC 06/26] imx: drop dt-binding headers
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

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 include/dt-bindings/interconnect/fsl,imx8mp.h | 59 -----------------------
 include/dt-bindings/interconnect/imx8mm.h     | 50 --------------------
 include/dt-bindings/interconnect/imx8mn.h     | 41 ----------------
 include/dt-bindings/interconnect/imx8mq.h     | 48 -------------------
 include/dt-bindings/phy/phy-imx8-pcie.h       | 14 ------
 include/dt-bindings/power/fsl,imx93-power.h   | 15 ------
 include/dt-bindings/power/imx7-power.h        | 13 ------
 include/dt-bindings/power/imx8mm-power.h      | 31 -------------
 include/dt-bindings/power/imx8mn-power.h      | 20 --------
 include/dt-bindings/power/imx8mp-power.h      | 59 -----------------------
 include/dt-bindings/power/imx8mq-power.h      | 24 ----------
 include/dt-bindings/power/imx8ulp-power.h     | 26 -----------
 include/dt-bindings/reset/imx7-reset.h        | 52 ---------------------
 include/dt-bindings/reset/imx8mp-reset.h      | 50 --------------------
 include/dt-bindings/reset/imx8mq-reset.h      | 67 ---------------------------
 include/dt-bindings/reset/imx8ulp-pcc-reset.h | 59 -----------------------
 include/dt-bindings/sound/fsl-imx-audmux.h    | 64 -------------------------
 17 files changed, 692 deletions(-)

diff --git a/include/dt-bindings/interconnect/fsl,imx8mp.h b/include/dt-bindings/interconnect/fsl,imx8mp.h
deleted file mode 100644
index 7357d417529a..000000000000
--- a/include/dt-bindings/interconnect/fsl,imx8mp.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR MIT */
-/*
- * Interconnect framework driver for i.MX SoC
- *
- * Copyright 2022 NXP
- * Peng Fan <peng.fan@nxp.com>
- */
-
-#ifndef __DT_BINDINGS_INTERCONNECT_IMX8MP_H
-#define __DT_BINDINGS_INTERCONNECT_IMX8MP_H
-
-#define IMX8MP_ICN_NOC		0
-#define IMX8MP_ICN_MAIN		1
-#define IMX8MP_ICS_DRAM		2
-#define IMX8MP_ICS_OCRAM	3
-#define IMX8MP_ICM_A53		4
-#define IMX8MP_ICM_SUPERMIX	5
-#define IMX8MP_ICM_GIC		6
-#define IMX8MP_ICM_MLMIX	7
-
-#define IMX8MP_ICN_AUDIO	8
-#define IMX8MP_ICM_DSP		9
-#define IMX8MP_ICM_SDMA2PER	10
-#define IMX8MP_ICM_SDMA2BURST	11
-#define IMX8MP_ICM_SDMA3PER	12
-#define IMX8MP_ICM_SDMA3BURST	13
-#define IMX8MP_ICM_EDMA		14
-
-#define IMX8MP_ICN_GPU		15
-#define IMX8MP_ICM_GPU2D	16
-#define IMX8MP_ICM_GPU3D	17
-
-#define IMX8MP_ICN_HDMI		18
-#define IMX8MP_ICM_HRV		19
-#define IMX8MP_ICM_LCDIF_HDMI	20
-#define IMX8MP_ICM_HDCP		21
-
-#define IMX8MP_ICN_HSIO		22
-#define IMX8MP_ICM_NOC_PCIE	23
-#define IMX8MP_ICM_USB1		24
-#define IMX8MP_ICM_USB2		25
-#define IMX8MP_ICM_PCIE		26
-
-#define IMX8MP_ICN_MEDIA	27
-#define IMX8MP_ICM_LCDIF_RD	28
-#define IMX8MP_ICM_LCDIF_WR	29
-#define IMX8MP_ICM_ISI0		30
-#define IMX8MP_ICM_ISI1		31
-#define IMX8MP_ICM_ISI2		32
-#define IMX8MP_ICM_ISP0		33
-#define IMX8MP_ICM_ISP1		34
-#define IMX8MP_ICM_DWE		35
-
-#define IMX8MP_ICN_VIDEO	36
-#define IMX8MP_ICM_VPU_G1	37
-#define IMX8MP_ICM_VPU_G2	38
-#define IMX8MP_ICM_VPU_H1	39
-
-#endif /* __DT_BINDINGS_INTERCONNECT_IMX8MP_H */
diff --git a/include/dt-bindings/interconnect/imx8mm.h b/include/dt-bindings/interconnect/imx8mm.h
deleted file mode 100644
index 8f10bb06cb59..000000000000
--- a/include/dt-bindings/interconnect/imx8mm.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Interconnect framework driver for i.MX SoC
- *
- * Copyright (c) 2019, BayLibre
- * Copyright (c) 2019-2020, NXP
- * Author: Alexandre Bailon <abailon@baylibre.com>
- */
-
-#ifndef __DT_BINDINGS_INTERCONNECT_IMX8MM_H
-#define __DT_BINDINGS_INTERCONNECT_IMX8MM_H
-
-#define IMX8MM_ICN_NOC		1
-#define IMX8MM_ICS_DRAM		2
-#define IMX8MM_ICS_OCRAM	3
-#define IMX8MM_ICM_A53		4
-
-#define IMX8MM_ICM_VPU_H1	5
-#define IMX8MM_ICM_VPU_G1	6
-#define IMX8MM_ICM_VPU_G2	7
-#define IMX8MM_ICN_VIDEO	8
-
-#define IMX8MM_ICM_GPU2D	9
-#define IMX8MM_ICM_GPU3D	10
-#define IMX8MM_ICN_GPU		11
-
-#define IMX8MM_ICM_CSI		12
-#define IMX8MM_ICM_LCDIF	13
-#define IMX8MM_ICN_MIPI		14
-
-#define IMX8MM_ICM_USB1		15
-#define IMX8MM_ICM_USB2		16
-#define IMX8MM_ICM_PCIE		17
-#define IMX8MM_ICN_HSIO		18
-
-#define IMX8MM_ICM_SDMA2	19
-#define IMX8MM_ICM_SDMA3	20
-#define IMX8MM_ICN_AUDIO	21
-
-#define IMX8MM_ICN_ENET		22
-#define IMX8MM_ICM_ENET		23
-
-#define IMX8MM_ICN_MAIN		24
-#define IMX8MM_ICM_NAND		25
-#define IMX8MM_ICM_SDMA1	26
-#define IMX8MM_ICM_USDHC1	27
-#define IMX8MM_ICM_USDHC2	28
-#define IMX8MM_ICM_USDHC3	29
-
-#endif /* __DT_BINDINGS_INTERCONNECT_IMX8MM_H */
diff --git a/include/dt-bindings/interconnect/imx8mn.h b/include/dt-bindings/interconnect/imx8mn.h
deleted file mode 100644
index 307b977100b6..000000000000
--- a/include/dt-bindings/interconnect/imx8mn.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Interconnect framework driver for i.MX SoC
- *
- * Copyright (c) 2019-2020, NXP
- */
-
-#ifndef __DT_BINDINGS_INTERCONNECT_IMX8MN_H
-#define __DT_BINDINGS_INTERCONNECT_IMX8MN_H
-
-#define IMX8MN_ICN_NOC		1
-#define IMX8MN_ICS_DRAM		2
-#define IMX8MN_ICS_OCRAM	3
-#define IMX8MN_ICM_A53		4
-
-#define IMX8MN_ICM_GPU		5
-#define IMX8MN_ICN_GPU		6
-
-#define IMX8MN_ICM_CSI1		7
-#define IMX8MN_ICM_CSI2		8
-#define IMX8MN_ICM_ISI		9
-#define IMX8MN_ICM_LCDIF	10
-#define IMX8MN_ICN_MIPI		11
-
-#define IMX8MN_ICM_USB		12
-
-#define IMX8MN_ICM_SDMA2	13
-#define IMX8MN_ICM_SDMA3	14
-#define IMX8MN_ICN_AUDIO	15
-
-#define IMX8MN_ICN_ENET		16
-#define IMX8MN_ICM_ENET		17
-
-#define IMX8MN_ICM_NAND		18
-#define IMX8MN_ICM_SDMA1	19
-#define IMX8MN_ICM_USDHC1	20
-#define IMX8MN_ICM_USDHC2	21
-#define IMX8MN_ICM_USDHC3	22
-#define IMX8MN_ICN_MAIN		23
-
-#endif /* __DT_BINDINGS_INTERCONNECT_IMX8MN_H */
diff --git a/include/dt-bindings/interconnect/imx8mq.h b/include/dt-bindings/interconnect/imx8mq.h
deleted file mode 100644
index 1a4cae7f8be2..000000000000
--- a/include/dt-bindings/interconnect/imx8mq.h
+++ /dev/null
@@ -1,48 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Interconnect framework driver for i.MX SoC
- *
- * Copyright (c) 2019-2020, NXP
- */
-
-#ifndef __DT_BINDINGS_INTERCONNECT_IMX8MQ_H
-#define __DT_BINDINGS_INTERCONNECT_IMX8MQ_H
-
-#define IMX8MQ_ICN_NOC		1
-#define IMX8MQ_ICS_DRAM		2
-#define IMX8MQ_ICS_OCRAM	3
-#define IMX8MQ_ICM_A53		4
-
-#define IMX8MQ_ICM_VPU		5
-#define IMX8MQ_ICN_VIDEO	6
-
-#define IMX8MQ_ICM_GPU		7
-#define IMX8MQ_ICN_GPU		8
-
-#define IMX8MQ_ICM_DCSS		9
-#define IMX8MQ_ICN_DCSS		10
-
-#define IMX8MQ_ICM_USB1		11
-#define IMX8MQ_ICM_USB2		12
-#define IMX8MQ_ICN_USB		13
-
-#define IMX8MQ_ICM_CSI1		14
-#define IMX8MQ_ICM_CSI2		15
-#define IMX8MQ_ICM_LCDIF	16
-#define IMX8MQ_ICN_DISPLAY	17
-
-#define IMX8MQ_ICM_SDMA2	18
-#define IMX8MQ_ICN_AUDIO	19
-
-#define IMX8MQ_ICN_ENET		20
-#define IMX8MQ_ICM_ENET		21
-
-#define IMX8MQ_ICM_SDMA1	22
-#define IMX8MQ_ICM_NAND		23
-#define IMX8MQ_ICM_USDHC1	24
-#define IMX8MQ_ICM_USDHC2	25
-#define IMX8MQ_ICM_PCIE1	26
-#define IMX8MQ_ICM_PCIE2	27
-#define IMX8MQ_ICN_MAIN		28
-
-#endif /* __DT_BINDINGS_INTERCONNECT_IMX8MQ_H */
diff --git a/include/dt-bindings/phy/phy-imx8-pcie.h b/include/dt-bindings/phy/phy-imx8-pcie.h
deleted file mode 100644
index 8bbe2d6538d8..000000000000
--- a/include/dt-bindings/phy/phy-imx8-pcie.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * This header provides constants for i.MX8 PCIe.
- */
-
-#ifndef _DT_BINDINGS_IMX8_PCIE_H
-#define _DT_BINDINGS_IMX8_PCIE_H
-
-/* Reference clock PAD mode */
-#define IMX8_PCIE_REFCLK_PAD_UNUSED	0
-#define IMX8_PCIE_REFCLK_PAD_INPUT	1
-#define IMX8_PCIE_REFCLK_PAD_OUTPUT	2
-
-#endif /* _DT_BINDINGS_IMX8_PCIE_H */
diff --git a/include/dt-bindings/power/fsl,imx93-power.h b/include/dt-bindings/power/fsl,imx93-power.h
deleted file mode 100644
index 17f9f015bf7d..000000000000
--- a/include/dt-bindings/power/fsl,imx93-power.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
-/*
- *  Copyright 2022 NXP
- */
-
-#ifndef __DT_BINDINGS_IMX93_POWER_H__
-#define __DT_BINDINGS_IMX93_POWER_H__
-
-#define IMX93_MEDIABLK_PD_MIPI_DSI		0
-#define IMX93_MEDIABLK_PD_MIPI_CSI		1
-#define IMX93_MEDIABLK_PD_PXP			2
-#define IMX93_MEDIABLK_PD_LCDIF			3
-#define IMX93_MEDIABLK_PD_ISI			4
-
-#endif
diff --git a/include/dt-bindings/power/imx7-power.h b/include/dt-bindings/power/imx7-power.h
deleted file mode 100644
index 597c1aa06ae5..000000000000
--- a/include/dt-bindings/power/imx7-power.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- *  Copyright (C) 2017 Impinj
- */
-
-#ifndef __DT_BINDINGS_IMX7_POWER_H__
-#define __DT_BINDINGS_IMX7_POWER_H__
-
-#define IMX7_POWER_DOMAIN_MIPI_PHY		0
-#define IMX7_POWER_DOMAIN_PCIE_PHY		1
-#define IMX7_POWER_DOMAIN_USB_HSIC_PHY		2
-
-#endif
diff --git a/include/dt-bindings/power/imx8mm-power.h b/include/dt-bindings/power/imx8mm-power.h
deleted file mode 100644
index 648938f24c8e..000000000000
--- a/include/dt-bindings/power/imx8mm-power.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
-/*
- *  Copyright (C) 2020 Pengutronix, Lucas Stach <kernel@pengutronix.de>
- */
-
-#ifndef __DT_BINDINGS_IMX8MM_POWER_H__
-#define __DT_BINDINGS_IMX8MM_POWER_H__
-
-#define IMX8MM_POWER_DOMAIN_HSIOMIX	0
-#define IMX8MM_POWER_DOMAIN_PCIE	1
-#define IMX8MM_POWER_DOMAIN_OTG1	2
-#define IMX8MM_POWER_DOMAIN_OTG2	3
-#define IMX8MM_POWER_DOMAIN_GPUMIX	4
-#define IMX8MM_POWER_DOMAIN_GPU		5
-#define IMX8MM_POWER_DOMAIN_VPUMIX	6
-#define IMX8MM_POWER_DOMAIN_VPUG1	7
-#define IMX8MM_POWER_DOMAIN_VPUG2	8
-#define IMX8MM_POWER_DOMAIN_VPUH1	9
-#define IMX8MM_POWER_DOMAIN_DISPMIX	10
-#define IMX8MM_POWER_DOMAIN_MIPI	11
-
-#define IMX8MM_VPUBLK_PD_G1		0
-#define IMX8MM_VPUBLK_PD_G2		1
-#define IMX8MM_VPUBLK_PD_H1		2
-
-#define IMX8MM_DISPBLK_PD_CSI_BRIDGE	0
-#define IMX8MM_DISPBLK_PD_LCDIF		1
-#define IMX8MM_DISPBLK_PD_MIPI_DSI	2
-#define IMX8MM_DISPBLK_PD_MIPI_CSI	3
-
-#endif
diff --git a/include/dt-bindings/power/imx8mn-power.h b/include/dt-bindings/power/imx8mn-power.h
deleted file mode 100644
index eedd0e581939..000000000000
--- a/include/dt-bindings/power/imx8mn-power.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
-/*
- *  Copyright (C) 2020 Compass Electronics Group, LLC
- */
-
-#ifndef __DT_BINDINGS_IMX8MN_POWER_H__
-#define __DT_BINDINGS_IMX8MN_POWER_H__
-
-#define IMX8MN_POWER_DOMAIN_HSIOMIX	0
-#define IMX8MN_POWER_DOMAIN_OTG1	1
-#define IMX8MN_POWER_DOMAIN_GPUMIX	2
-#define IMX8MN_POWER_DOMAIN_DISPMIX	3
-#define IMX8MN_POWER_DOMAIN_MIPI	4
-
-#define IMX8MN_DISPBLK_PD_MIPI_DSI	0
-#define IMX8MN_DISPBLK_PD_MIPI_CSI	1
-#define IMX8MN_DISPBLK_PD_LCDIF	2
-#define IMX8MN_DISPBLK_PD_ISI	3
-
-#endif
diff --git a/include/dt-bindings/power/imx8mp-power.h b/include/dt-bindings/power/imx8mp-power.h
deleted file mode 100644
index 2fe3c2abad13..000000000000
--- a/include/dt-bindings/power/imx8mp-power.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
-/*
- *  Copyright (C) 2020 Pengutronix, Sascha Hauer <kernel@pengutronix.de>
- */
-
-#ifndef __DT_BINDINGS_IMX8MP_POWER_DOMAIN_POWER_H__
-#define __DT_BINDINGS_IMX8MP_POWER_DOMAIN_POWER_H__
-
-#define IMX8MP_POWER_DOMAIN_MIPI_PHY1			0
-#define IMX8MP_POWER_DOMAIN_PCIE_PHY			1
-#define IMX8MP_POWER_DOMAIN_USB1_PHY			2
-#define IMX8MP_POWER_DOMAIN_USB2_PHY			3
-#define IMX8MP_POWER_DOMAIN_MLMIX			4
-#define IMX8MP_POWER_DOMAIN_AUDIOMIX			5
-#define IMX8MP_POWER_DOMAIN_GPU2D			6
-#define IMX8MP_POWER_DOMAIN_GPUMIX			7
-#define IMX8MP_POWER_DOMAIN_VPUMIX			8
-#define IMX8MP_POWER_DOMAIN_GPU3D			9
-#define IMX8MP_POWER_DOMAIN_MEDIAMIX			10
-#define IMX8MP_POWER_DOMAIN_VPU_G1			11
-#define IMX8MP_POWER_DOMAIN_VPU_G2			12
-#define IMX8MP_POWER_DOMAIN_VPU_VC8000E			13
-#define IMX8MP_POWER_DOMAIN_HDMIMIX			14
-#define IMX8MP_POWER_DOMAIN_HDMI_PHY			15
-#define IMX8MP_POWER_DOMAIN_MIPI_PHY2			16
-#define IMX8MP_POWER_DOMAIN_HSIOMIX			17
-#define IMX8MP_POWER_DOMAIN_MEDIAMIX_ISPDWP		18
-
-#define IMX8MP_HSIOBLK_PD_USB				0
-#define IMX8MP_HSIOBLK_PD_USB_PHY1			1
-#define IMX8MP_HSIOBLK_PD_USB_PHY2			2
-#define IMX8MP_HSIOBLK_PD_PCIE				3
-#define IMX8MP_HSIOBLK_PD_PCIE_PHY			4
-
-#define IMX8MP_MEDIABLK_PD_MIPI_DSI_1			0
-#define IMX8MP_MEDIABLK_PD_MIPI_CSI2_1			1
-#define IMX8MP_MEDIABLK_PD_LCDIF_1			2
-#define IMX8MP_MEDIABLK_PD_ISI				3
-#define IMX8MP_MEDIABLK_PD_MIPI_CSI2_2			4
-#define IMX8MP_MEDIABLK_PD_LCDIF_2			5
-#define IMX8MP_MEDIABLK_PD_ISP				6
-#define IMX8MP_MEDIABLK_PD_DWE				7
-#define IMX8MP_MEDIABLK_PD_MIPI_DSI_2			8
-
-#define IMX8MP_HDMIBLK_PD_IRQSTEER			0
-#define IMX8MP_HDMIBLK_PD_LCDIF				1
-#define IMX8MP_HDMIBLK_PD_PAI				2
-#define IMX8MP_HDMIBLK_PD_PVI				3
-#define IMX8MP_HDMIBLK_PD_TRNG				4
-#define IMX8MP_HDMIBLK_PD_HDMI_TX			5
-#define IMX8MP_HDMIBLK_PD_HDMI_TX_PHY			6
-#define IMX8MP_HDMIBLK_PD_HDCP				7
-#define IMX8MP_HDMIBLK_PD_HRV				8
-
-#define IMX8MP_VPUBLK_PD_G1				0
-#define IMX8MP_VPUBLK_PD_G2				1
-#define IMX8MP_VPUBLK_PD_VC8000E			2
-
-#endif
diff --git a/include/dt-bindings/power/imx8mq-power.h b/include/dt-bindings/power/imx8mq-power.h
deleted file mode 100755
index 9f7d0f1e7c32..000000000000
--- a/include/dt-bindings/power/imx8mq-power.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
-/*
- *  Copyright (C) 2018 Pengutronix, Lucas Stach <kernel@pengutronix.de>
- */
-
-#ifndef __DT_BINDINGS_IMX8MQ_POWER_H__
-#define __DT_BINDINGS_IMX8MQ_POWER_H__
-
-#define IMX8M_POWER_DOMAIN_MIPI		0
-#define IMX8M_POWER_DOMAIN_PCIE1	1
-#define IMX8M_POWER_DOMAIN_USB_OTG1	2
-#define IMX8M_POWER_DOMAIN_USB_OTG2	3
-#define IMX8M_POWER_DOMAIN_DDR1		4
-#define IMX8M_POWER_DOMAIN_GPU		5
-#define IMX8M_POWER_DOMAIN_VPU		6
-#define IMX8M_POWER_DOMAIN_DISP		7
-#define IMX8M_POWER_DOMAIN_MIPI_CSI1	8
-#define IMX8M_POWER_DOMAIN_MIPI_CSI2	9
-#define IMX8M_POWER_DOMAIN_PCIE2	10
-
-#define IMX8MQ_VPUBLK_PD_G1		0
-#define IMX8MQ_VPUBLK_PD_G2		1
-
-#endif
diff --git a/include/dt-bindings/power/imx8ulp-power.h b/include/dt-bindings/power/imx8ulp-power.h
deleted file mode 100644
index a556b2e96df1..000000000000
--- a/include/dt-bindings/power/imx8ulp-power.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
-/*
- *  Copyright 2021 NXP
- */
-
-#ifndef __DT_BINDINGS_IMX8ULP_POWER_H__
-#define __DT_BINDINGS_IMX8ULP_POWER_H__
-
-#define IMX8ULP_PD_DMA1		0
-#define IMX8ULP_PD_FLEXSPI2	1
-#define IMX8ULP_PD_USB0		2
-#define IMX8ULP_PD_USDHC0	3
-#define IMX8ULP_PD_USDHC1	4
-#define IMX8ULP_PD_USDHC2_USB1	5
-#define IMX8ULP_PD_DCNANO	6
-#define IMX8ULP_PD_EPDC		7
-#define IMX8ULP_PD_DMA2		8
-#define IMX8ULP_PD_GPU2D	9
-#define IMX8ULP_PD_GPU3D	10
-#define IMX8ULP_PD_HIFI4	11
-#define IMX8ULP_PD_ISI		12
-#define IMX8ULP_PD_MIPI_CSI	13
-#define IMX8ULP_PD_MIPI_DSI	14
-#define IMX8ULP_PD_PXP		15
-
-#endif
diff --git a/include/dt-bindings/reset/imx7-reset.h b/include/dt-bindings/reset/imx7-reset.h
deleted file mode 100644
index bb92452ffb8b..000000000000
--- a/include/dt-bindings/reset/imx7-reset.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2017 Impinj, Inc.
- *
- * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
- */
-
-#ifndef DT_BINDING_RESET_IMX7_H
-#define DT_BINDING_RESET_IMX7_H
-
-#define IMX7_RESET_A7_CORE_POR_RESET0	0
-#define IMX7_RESET_A7_CORE_POR_RESET1	1
-#define IMX7_RESET_A7_CORE_RESET0	2
-#define IMX7_RESET_A7_CORE_RESET1	3
-#define IMX7_RESET_A7_DBG_RESET0	4
-#define IMX7_RESET_A7_DBG_RESET1	5
-#define IMX7_RESET_A7_ETM_RESET0	6
-#define IMX7_RESET_A7_ETM_RESET1	7
-#define IMX7_RESET_A7_SOC_DBG_RESET	8
-#define IMX7_RESET_A7_L2RESET		9
-#define IMX7_RESET_SW_M4C_RST		10
-#define IMX7_RESET_SW_M4P_RST		11
-#define IMX7_RESET_EIM_RST		12
-#define IMX7_RESET_HSICPHY_PORT_RST	13
-#define IMX7_RESET_USBPHY1_POR		14
-#define IMX7_RESET_USBPHY1_PORT_RST	15
-#define IMX7_RESET_USBPHY2_POR		16
-#define IMX7_RESET_USBPHY2_PORT_RST	17
-#define IMX7_RESET_MIPI_PHY_MRST	18
-#define IMX7_RESET_MIPI_PHY_SRST	19
-
-/*
- * IMX7_RESET_PCIEPHY is a logical reset line combining PCIEPHY_BTN
- * and PCIEPHY_G_RST
- */
-#define IMX7_RESET_PCIEPHY		20
-#define IMX7_RESET_PCIEPHY_PERST	21
-
-/*
- * IMX7_RESET_PCIE_CTRL_APPS_EN is not strictly a reset line, but it
- * can be used to inhibit PCIe LTTSM, so, in a way, it can be thoguht
- * of as one
- */
-#define IMX7_RESET_PCIE_CTRL_APPS_EN	22
-#define IMX7_RESET_DDRC_PRST		23
-#define IMX7_RESET_DDRC_CORE_RST	24
-
-#define IMX7_RESET_PCIE_CTRL_APPS_TURNOFF 25
-
-#define IMX7_RESET_NUM			26
-
-#endif
diff --git a/include/dt-bindings/reset/imx8mp-reset.h b/include/dt-bindings/reset/imx8mp-reset.h
deleted file mode 100644
index 2e8c9104b666..000000000000
--- a/include/dt-bindings/reset/imx8mp-reset.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright 2020 NXP
- */
-
-#ifndef DT_BINDING_RESET_IMX8MP_H
-#define DT_BINDING_RESET_IMX8MP_H
-
-#define IMX8MP_RESET_A53_CORE_POR_RESET0	0
-#define IMX8MP_RESET_A53_CORE_POR_RESET1	1
-#define IMX8MP_RESET_A53_CORE_POR_RESET2	2
-#define IMX8MP_RESET_A53_CORE_POR_RESET3	3
-#define IMX8MP_RESET_A53_CORE_RESET0		4
-#define IMX8MP_RESET_A53_CORE_RESET1		5
-#define IMX8MP_RESET_A53_CORE_RESET2		6
-#define IMX8MP_RESET_A53_CORE_RESET3		7
-#define IMX8MP_RESET_A53_DBG_RESET0		8
-#define IMX8MP_RESET_A53_DBG_RESET1		9
-#define IMX8MP_RESET_A53_DBG_RESET2		10
-#define IMX8MP_RESET_A53_DBG_RESET3		11
-#define IMX8MP_RESET_A53_ETM_RESET0		12
-#define IMX8MP_RESET_A53_ETM_RESET1		13
-#define IMX8MP_RESET_A53_ETM_RESET2		14
-#define IMX8MP_RESET_A53_ETM_RESET3		15
-#define IMX8MP_RESET_A53_SOC_DBG_RESET		16
-#define IMX8MP_RESET_A53_L2RESET		17
-#define IMX8MP_RESET_SW_NON_SCLR_M7C_RST	18
-#define IMX8MP_RESET_OTG1_PHY_RESET		19
-#define IMX8MP_RESET_OTG2_PHY_RESET		20
-#define IMX8MP_RESET_SUPERMIX_RESET		21
-#define IMX8MP_RESET_AUDIOMIX_RESET		22
-#define IMX8MP_RESET_MLMIX_RESET		23
-#define IMX8MP_RESET_PCIEPHY			24
-#define IMX8MP_RESET_PCIEPHY_PERST		25
-#define IMX8MP_RESET_PCIE_CTRL_APPS_EN		26
-#define IMX8MP_RESET_PCIE_CTRL_APPS_TURNOFF	27
-#define IMX8MP_RESET_HDMI_PHY_APB_RESET		28
-#define IMX8MP_RESET_MEDIA_RESET		29
-#define IMX8MP_RESET_GPU2D_RESET		30
-#define IMX8MP_RESET_GPU3D_RESET		31
-#define IMX8MP_RESET_GPU_RESET			32
-#define IMX8MP_RESET_VPU_RESET			33
-#define IMX8MP_RESET_VPU_G1_RESET		34
-#define IMX8MP_RESET_VPU_G2_RESET		35
-#define IMX8MP_RESET_VPUVC8KE_RESET		36
-#define IMX8MP_RESET_NOC_RESET			37
-
-#define IMX8MP_RESET_NUM			38
-
-#endif
diff --git a/include/dt-bindings/reset/imx8mq-reset.h b/include/dt-bindings/reset/imx8mq-reset.h
deleted file mode 100755
index 705870693ec2..000000000000
--- a/include/dt-bindings/reset/imx8mq-reset.h
+++ /dev/null
@@ -1,67 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2018 Zodiac Inflight Innovations
- *
- * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
- */
-
-#ifndef DT_BINDING_RESET_IMX8MQ_H
-#define DT_BINDING_RESET_IMX8MQ_H
-
-#define IMX8MQ_RESET_A53_CORE_POR_RESET0	0
-#define IMX8MQ_RESET_A53_CORE_POR_RESET1	1
-#define IMX8MQ_RESET_A53_CORE_POR_RESET2	2
-#define IMX8MQ_RESET_A53_CORE_POR_RESET3	3
-#define IMX8MQ_RESET_A53_CORE_RESET0		4
-#define IMX8MQ_RESET_A53_CORE_RESET1		5
-#define IMX8MQ_RESET_A53_CORE_RESET2		6
-#define IMX8MQ_RESET_A53_CORE_RESET3		7
-#define IMX8MQ_RESET_A53_DBG_RESET0		8
-#define IMX8MQ_RESET_A53_DBG_RESET1		9
-#define IMX8MQ_RESET_A53_DBG_RESET2		10
-#define IMX8MQ_RESET_A53_DBG_RESET3		11
-#define IMX8MQ_RESET_A53_ETM_RESET0		12
-#define IMX8MQ_RESET_A53_ETM_RESET1		13
-#define IMX8MQ_RESET_A53_ETM_RESET2		14
-#define IMX8MQ_RESET_A53_ETM_RESET3		15
-#define IMX8MQ_RESET_A53_SOC_DBG_RESET		16
-#define IMX8MQ_RESET_A53_L2RESET		17
-#define IMX8MQ_RESET_SW_NON_SCLR_M4C_RST	18
-#define IMX8MQ_RESET_OTG1_PHY_RESET		19
-#define IMX8MQ_RESET_OTG2_PHY_RESET		20	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_DSI_RESET_BYTE_N	21	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_DSI_RESET_N		22	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_DSI_DPI_RESET_N	23	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_DSI_ESC_RESET_N	24	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_DSI_PCLK_RESET_N	25	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_PCIEPHY			26	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_PCIEPHY_PERST		27	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_PCIE_CTRL_APPS_EN		28	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_PCIE_CTRL_APPS_TURNOFF	29	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_HDMI_PHY_APB_RESET		30	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_DISP_RESET			31
-#define IMX8MQ_RESET_GPU_RESET			32
-#define IMX8MQ_RESET_VPU_RESET			33	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_PCIEPHY2			34	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_PCIEPHY2_PERST		35	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_PCIE2_CTRL_APPS_EN		36	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF	37	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_CSI1_CORE_RESET	38	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET	39	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_CSI1_ESC_RESET	40	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_CSI2_CORE_RESET	41	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET	42	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_CSI2_ESC_RESET	43	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_DDRC1_PRST			44	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_DDRC1_CORE_RESET		45	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_DDRC1_PHY_RESET		46	/* i.MX8MN does NOT support */
-#define IMX8MQ_RESET_DDRC2_PRST			47	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_DDRC2_CORE_RESET		48	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_DDRC2_PHY_RESET		49	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_SW_M4C_RST			50
-#define IMX8MQ_RESET_SW_M4P_RST			51
-#define IMX8MQ_RESET_M4_ENABLE			52
-
-#define IMX8MQ_RESET_NUM			53
-
-#endif
diff --git a/include/dt-bindings/reset/imx8ulp-pcc-reset.h b/include/dt-bindings/reset/imx8ulp-pcc-reset.h
deleted file mode 100644
index e99a4735c3c4..000000000000
--- a/include/dt-bindings/reset/imx8ulp-pcc-reset.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright 2021 NXP
- */
-
-#ifndef DT_BINDING_PCC_RESET_IMX8ULP_H
-#define DT_BINDING_PCC_RESET_IMX8ULP_H
-
-/* PCC3 */
-#define PCC3_WDOG3_SWRST	0
-#define PCC3_WDOG4_SWRST	1
-#define PCC3_LPIT1_SWRST	2
-#define PCC3_TPM4_SWRST		3
-#define PCC3_TPM5_SWRST		4
-#define PCC3_FLEXIO1_SWRST	5
-#define PCC3_I3C2_SWRST		6
-#define PCC3_LPI2C4_SWRST	7
-#define PCC3_LPI2C5_SWRST	8
-#define PCC3_LPUART4_SWRST	9
-#define PCC3_LPUART5_SWRST	10
-#define PCC3_LPSPI4_SWRST	11
-#define PCC3_LPSPI5_SWRST	12
-
-/* PCC4 */
-#define PCC4_FLEXSPI2_SWRST	0
-#define PCC4_TPM6_SWRST		1
-#define PCC4_TPM7_SWRST		2
-#define PCC4_LPI2C6_SWRST	3
-#define PCC4_LPI2C7_SWRST	4
-#define PCC4_LPUART6_SWRST	5
-#define PCC4_LPUART7_SWRST	6
-#define PCC4_SAI4_SWRST		7
-#define PCC4_SAI5_SWRST		8
-#define PCC4_USDHC0_SWRST	9
-#define PCC4_USDHC1_SWRST	10
-#define PCC4_USDHC2_SWRST	11
-#define PCC4_USB0_SWRST		12
-#define PCC4_USB0_PHY_SWRST	13
-#define PCC4_USB1_SWRST		14
-#define PCC4_USB1_PHY_SWRST	15
-#define PCC4_ENET_SWRST		16
-
-/* PCC5 */
-#define PCC5_TPM8_SWRST		0
-#define PCC5_SAI6_SWRST		1
-#define PCC5_SAI7_SWRST		2
-#define PCC5_SPDIF_SWRST	3
-#define PCC5_ISI_SWRST		4
-#define PCC5_CSI_REGS_SWRST	5
-#define PCC5_CSI_SWRST		6
-#define PCC5_DSI_SWRST		7
-#define PCC5_WDOG5_SWRST	8
-#define PCC5_EPDC_SWRST		9
-#define PCC5_PXP_SWRST		10
-#define PCC5_GPU2D_SWRST	11
-#define PCC5_GPU3D_SWRST	12
-#define PCC5_DC_NANO_SWRST	13
-
-#endif /*DT_BINDING_RESET_IMX8ULP_H */
diff --git a/include/dt-bindings/sound/fsl-imx-audmux.h b/include/dt-bindings/sound/fsl-imx-audmux.h
deleted file mode 100644
index 15f138bebe16..000000000000
--- a/include/dt-bindings/sound/fsl-imx-audmux.h
+++ /dev/null
@@ -1,64 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_FSL_IMX_AUDMUX_H
-#define __DT_FSL_IMX_AUDMUX_H
-
-#define MX27_AUDMUX_HPCR1_SSI0		0
-#define MX27_AUDMUX_HPCR2_SSI1		1
-#define MX27_AUDMUX_HPCR3_SSI_PINS_4	2
-#define MX27_AUDMUX_PPCR1_SSI_PINS_1	3
-#define MX27_AUDMUX_PPCR2_SSI_PINS_2	4
-#define MX27_AUDMUX_PPCR3_SSI_PINS_3	5
-
-#define MX31_AUDMUX_PORT1_SSI0		0
-#define MX31_AUDMUX_PORT2_SSI1		1
-#define MX31_AUDMUX_PORT3_SSI_PINS_3	2
-#define MX31_AUDMUX_PORT4_SSI_PINS_4	3
-#define MX31_AUDMUX_PORT5_SSI_PINS_5	4
-#define MX31_AUDMUX_PORT6_SSI_PINS_6	5
-#define MX31_AUDMUX_PORT7_SSI_PINS_7	6
-
-#define MX51_AUDMUX_PORT1_SSI0		0
-#define MX51_AUDMUX_PORT2_SSI1		1
-#define MX51_AUDMUX_PORT3		2
-#define MX51_AUDMUX_PORT4		3
-#define MX51_AUDMUX_PORT5		4
-#define MX51_AUDMUX_PORT6		5
-#define MX51_AUDMUX_PORT7		6
-
-/*
- * TFCSEL/RFCSEL (i.MX27) or TFSEL/TCSEL/RFSEL/RCSEL (i.MX31/51/53/6Q)
- * can be sourced from Rx/Tx.
- */
-#define IMX_AUDMUX_RXFS			0x8
-#define IMX_AUDMUX_RXCLK		0x8
-
-/* Register definitions for the i.MX21/27 Digital Audio Multiplexer */
-#define IMX_AUDMUX_V1_PCR_INMMASK(x)	((x) & 0xff)
-#define IMX_AUDMUX_V1_PCR_INMEN		(1 << 8)
-#define IMX_AUDMUX_V1_PCR_TXRXEN	(1 << 10)
-#define IMX_AUDMUX_V1_PCR_SYN		(1 << 12)
-#define IMX_AUDMUX_V1_PCR_RXDSEL(x)	(((x) & 0x7) << 13)
-#define IMX_AUDMUX_V1_PCR_RFCSEL(x)	(((x) & 0xf) << 20)
-#define IMX_AUDMUX_V1_PCR_RCLKDIR	(1 << 24)
-#define IMX_AUDMUX_V1_PCR_RFSDIR	(1 << 25)
-#define IMX_AUDMUX_V1_PCR_TFCSEL(x)	(((x) & 0xf) << 26)
-#define IMX_AUDMUX_V1_PCR_TCLKDIR	(1 << 30)
-#define IMX_AUDMUX_V1_PCR_TFSDIR	(1 << 31)
-
-/* Register definitions for the i.MX25/31/35/51 Digital Audio Multiplexer */
-#define IMX_AUDMUX_V2_PTCR_TFSDIR	(1 << 31)
-#define IMX_AUDMUX_V2_PTCR_TFSEL(x)	(((x) & 0xf) << 27)
-#define IMX_AUDMUX_V2_PTCR_TCLKDIR	(1 << 26)
-#define IMX_AUDMUX_V2_PTCR_TCSEL(x)	(((x) & 0xf) << 22)
-#define IMX_AUDMUX_V2_PTCR_RFSDIR	(1 << 21)
-#define IMX_AUDMUX_V2_PTCR_RFSEL(x)	(((x) & 0xf) << 17)
-#define IMX_AUDMUX_V2_PTCR_RCLKDIR	(1 << 16)
-#define IMX_AUDMUX_V2_PTCR_RCSEL(x)	(((x) & 0xf) << 12)
-#define IMX_AUDMUX_V2_PTCR_SYN		(1 << 11)
-
-#define IMX_AUDMUX_V2_PDCR_RXDSEL(x)	(((x) & 0x7) << 13)
-#define IMX_AUDMUX_V2_PDCR_TXRXEN	(1 << 12)
-#define IMX_AUDMUX_V2_PDCR_MODE(x)	(((x) & 0x3) << 8)
-#define IMX_AUDMUX_V2_PDCR_INMMASK(x)	((x) & 0xff)
-
-#endif /* __DT_FSL_IMX_AUDMUX_H */

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
