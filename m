Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 305E387079A
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Mar 2024 17:51:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBD1EC6DD6B;
	Mon,  4 Mar 2024 16:51:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDBBAC6DD6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 16:51:47 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-412e89372e1so3889475e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 08:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709571107; x=1710175907;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ak/ZQ98S2ABEr4WIk6RvxQYt7MJPloGnSTsOs5d5fXA=;
 b=S1PVc/Oo3Ce0xt6lzU42vPMRAPvU58UF8+iol/4KzTVLPfIRJV9QEJs3v4+QwIS1iw
 OItWweOsoVMGR7IBzAfmMADtCGhg+/5GY8KisN3NwDroucG4jwljD8amjz33tVY2r37F
 G+Qfb3wLNlvEND3ydZS4ooQ3FmCnEUOq8jN1UPZu39+677ko6sR7Mj3jRaQfGQdEfgAm
 4yk0wYa1YM+3VklojaoFvPAccTB/dUOQXt6ywV+FsYyTEXhNwW48LAqUK8cWYyRwOrAG
 AmaHLpkjecJFsxUS1wP2nZZ/Km0Yh9YiUql+mM0ctkvCfFu90StrwtkV7k/baK1MztnW
 ekTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571107; x=1710175907;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ak/ZQ98S2ABEr4WIk6RvxQYt7MJPloGnSTsOs5d5fXA=;
 b=bMCm6R0a4GGFVCnr8MnXVSbTOcKBabuGYThSbYFW2gJoXYZd2426k/9qMbmtpMs23g
 09P8w2FdZc/dTdYBCk/2419y0ZvDQsCcVP7CMwhruavZPR9i4aw0ZG43XFTXhdo9psO/
 nJXOoom3LocX3OwgB6KlAOkF70cjaaBsyaIZCPaKvkXnCm1cPS6DClbkMO53AWGz1WYZ
 VQ+CZy0w6qM0+XrGl4ODxImiQ1M2W8UqHnyXjtitj5MMiyRYsx2m/9ID44ZgclBg93K+
 biTDXrgv8bXpuvaLtWVxeskoXyxgCLvAT/2/Zq27qepmC5ZT96r8xiblIqWVHFP1Qk1m
 lXCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1M+SdYWGwT99cLo/Su/iXYlHjKhsS4y4Wy1A0XFD37HFbIyk4Sp9AEotzNith2h82iQBJN4Xjor8xaJ4rO5mu8WMYJhJc9yuT9LgmeFGn/ZownEMpQPLE
X-Gm-Message-State: AOJu0YxmjeBoi1ifXQ5cD0680tVB/s1+Pv8n6JZC8QK24EDMJovNnByF
 0rLd9wdLkvCyzvoUyq4Ty62iLksLpcDiS8fEnUuU+GlygkP9OSAmVeb+tP6SEso=
X-Google-Smtp-Source: AGHT+IHTQl1P7L2TuETtLWhOUs5G3cUj9TY1RP8i2YptPb10qDCNG809MKLHE4TzjXBGosAbNBQXnQ==
X-Received: by 2002:a05:600c:1d87:b0:412:e7d6:4464 with SMTP id
 p7-20020a05600c1d8700b00412e7d64464mr1119380wms.32.1709571107241; 
 Mon, 04 Mar 2024 08:51:47 -0800 (PST)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm10598517wmq.6.2024.03.04.08.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:51:46 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Mon, 04 Mar 2024 16:51:23 +0000
MIME-Version: 1.0
Message-Id: <20240304-b4-upstream-dt-headers-v1-15-b7ff41925f92@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=21499;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=mQ2O2EyLgWmNk7HU9Pv1IDhVFZQ7gkRM9CVO2LHEmgU=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtSnf9iX7166yTNzxwvLyuSVjT90+1X+HH+9903B/JPCE
 cfMP0Xd6ihhYRDkYJAVU2QRP7HMsmntZXuN7QsuwMxhZQIZwsDFKQAT2T+D4Z9VX13UMcsd9l+i
 XH4bbLe6Ou1XokfXjn/HBLINFTZpsXYy/Hg0q0vpUtEm7aLqBVKdGhket6Ov7ZRdedV52YSD8t/
 tvwEA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH RFC 15/26] tegra: drop dt-binding headers
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
 arch/arm/dts/tegra186.dtsi                       |   2 +-
 drivers/mailbox/tegra-hsp.c                      |   2 +-
 include/dt-bindings/gpio/tegra-gpio.h            |  51 ------
 include/dt-bindings/mailbox/tegra186-hsp.h       |  19 ---
 include/dt-bindings/memory/tegra114-mc.h         |  25 ---
 include/dt-bindings/memory/tegra124-mc.h         |  31 ----
 include/dt-bindings/memory/tegra210-mc.h         |  36 ----
 include/dt-bindings/memory/tegra30-mc.h          |  24 ---
 include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h |   7 -
 include/dt-bindings/pinctrl/pinctrl-tegra.h      |  37 ----
 include/dt-bindings/power/tegra186-powergate.h   |  28 ----
 include/dt-bindings/reset/tegra124-car.h         |  12 --
 include/dt-bindings/reset/tegra186-reset.h       | 205 -----------------------
 include/dt-bindings/thermal/tegra124-soctherm.h  |  14 --
 14 files changed, 2 insertions(+), 491 deletions(-)

diff --git a/arch/arm/dts/tegra186.dtsi b/arch/arm/dts/tegra186.dtsi
index edcb7aacb8ee..58dadc944888 100644
--- a/arch/arm/dts/tegra186.dtsi
+++ b/arch/arm/dts/tegra186.dtsi
@@ -313,9 +313,9 @@
 	};
 
 	bpmp: bpmp {
 		compatible = "nvidia,tegra186-bpmp";
-		mboxes = <&hsp HSP_MBOX_TYPE_DB HSP_DB_MASTER_BPMP>;
+		mboxes = <&hsp TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
 		/*
 		 * In theory, these references, and the configuration in the
 		 * node these reference point at, are board-specific, since
 		 * they depend on the BCT's memory carve-out setup, the
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 08c51c40f141..e5a3d8243780 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -62,9 +62,9 @@ static void tegra_hsp_writel(struct tegra_hsp *thsp, uint32_t val,
 
 static int tegra_hsp_db_id(ulong chan_id)
 {
 	switch (chan_id) {
-	case (HSP_MBOX_TYPE_DB << 16) | HSP_DB_MASTER_BPMP:
+	case (TEGRA_HSP_MBOX_TYPE_DB << 16) | TEGRA_HSP_DB_MASTER_BPMP:
 		return TEGRA_HSP_DB_ID_BPMP;
 	default:
 		debug("Invalid channel ID\n");
 		return -EINVAL;
diff --git a/include/dt-bindings/gpio/tegra-gpio.h b/include/dt-bindings/gpio/tegra-gpio.h
deleted file mode 100644
index a1c09e88e80b..000000000000
--- a/include/dt-bindings/gpio/tegra-gpio.h
+++ /dev/null
@@ -1,51 +0,0 @@
-/*
- * This header provides constants for binding nvidia,tegra*-gpio.
- *
- * The first cell in Tegra's GPIO specifier is the GPIO ID. The macros below
- * provide names for this.
- *
- * The second cell contains standard flag values specified in gpio.h.
- */
-
-#ifndef _DT_BINDINGS_GPIO_TEGRA_GPIO_H
-#define _DT_BINDINGS_GPIO_TEGRA_GPIO_H
-
-#include <dt-bindings/gpio/gpio.h>
-
-#define TEGRA_GPIO_PORT_A 0
-#define TEGRA_GPIO_PORT_B 1
-#define TEGRA_GPIO_PORT_C 2
-#define TEGRA_GPIO_PORT_D 3
-#define TEGRA_GPIO_PORT_E 4
-#define TEGRA_GPIO_PORT_F 5
-#define TEGRA_GPIO_PORT_G 6
-#define TEGRA_GPIO_PORT_H 7
-#define TEGRA_GPIO_PORT_I 8
-#define TEGRA_GPIO_PORT_J 9
-#define TEGRA_GPIO_PORT_K 10
-#define TEGRA_GPIO_PORT_L 11
-#define TEGRA_GPIO_PORT_M 12
-#define TEGRA_GPIO_PORT_N 13
-#define TEGRA_GPIO_PORT_O 14
-#define TEGRA_GPIO_PORT_P 15
-#define TEGRA_GPIO_PORT_Q 16
-#define TEGRA_GPIO_PORT_R 17
-#define TEGRA_GPIO_PORT_S 18
-#define TEGRA_GPIO_PORT_T 19
-#define TEGRA_GPIO_PORT_U 20
-#define TEGRA_GPIO_PORT_V 21
-#define TEGRA_GPIO_PORT_W 22
-#define TEGRA_GPIO_PORT_X 23
-#define TEGRA_GPIO_PORT_Y 24
-#define TEGRA_GPIO_PORT_Z 25
-#define TEGRA_GPIO_PORT_AA 26
-#define TEGRA_GPIO_PORT_BB 27
-#define TEGRA_GPIO_PORT_CC 28
-#define TEGRA_GPIO_PORT_DD 29
-#define TEGRA_GPIO_PORT_EE 30
-#define TEGRA_GPIO_PORT_FF 31
-
-#define TEGRA_GPIO(port, offset) \
-	((TEGRA_GPIO_PORT_##port * 8) + offset)
-
-#endif
diff --git a/include/dt-bindings/mailbox/tegra186-hsp.h b/include/dt-bindings/mailbox/tegra186-hsp.h
deleted file mode 100644
index b4864325d74b..000000000000
--- a/include/dt-bindings/mailbox/tegra186-hsp.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/*
- * This header provides constants for binding nvidia,tegra186-hsp.
- *
- * The number with HSP_DB_MASTER prefix indicates the bit that is
- * associated with a master ID in the doorbell registers.
- */
-
-#ifndef _DT_BINDINGS_MAILBOX_TEGRA186_HSP_H
-#define _DT_BINDINGS_MAILBOX_TEGRA186_HSP_H
-
-#define HSP_MBOX_TYPE_DB 0x0
-#define HSP_MBOX_TYPE_SM 0x1
-#define HSP_MBOX_TYPE_SS 0x2
-#define HSP_MBOX_TYPE_AS 0x3
-
-#define HSP_DB_MASTER_CCPLEX 17
-#define HSP_DB_MASTER_BPMP 19
-
-#endif
diff --git a/include/dt-bindings/memory/tegra114-mc.h b/include/dt-bindings/memory/tegra114-mc.h
deleted file mode 100644
index 8f48985a3139..000000000000
--- a/include/dt-bindings/memory/tegra114-mc.h
+++ /dev/null
@@ -1,25 +0,0 @@
-#ifndef DT_BINDINGS_MEMORY_TEGRA114_MC_H
-#define DT_BINDINGS_MEMORY_TEGRA114_MC_H
-
-#define TEGRA_SWGROUP_PTC	0
-#define TEGRA_SWGROUP_DC	1
-#define TEGRA_SWGROUP_DCB	2
-#define TEGRA_SWGROUP_EPP	3
-#define TEGRA_SWGROUP_G2	4
-#define TEGRA_SWGROUP_AVPC	5
-#define TEGRA_SWGROUP_NV	6
-#define TEGRA_SWGROUP_HDA	7
-#define TEGRA_SWGROUP_HC	8
-#define TEGRA_SWGROUP_MSENC	9
-#define TEGRA_SWGROUP_PPCS	10
-#define TEGRA_SWGROUP_VDE	11
-#define TEGRA_SWGROUP_MPCORELP	12
-#define TEGRA_SWGROUP_MPCORE	13
-#define TEGRA_SWGROUP_VI	14
-#define TEGRA_SWGROUP_ISP	15
-#define TEGRA_SWGROUP_XUSB_HOST	16
-#define TEGRA_SWGROUP_XUSB_DEV	17
-#define TEGRA_SWGROUP_EMUCIF	18
-#define TEGRA_SWGROUP_TSEC	19
-
-#endif
diff --git a/include/dt-bindings/memory/tegra124-mc.h b/include/dt-bindings/memory/tegra124-mc.h
deleted file mode 100644
index 7d8ee798f34e..000000000000
--- a/include/dt-bindings/memory/tegra124-mc.h
+++ /dev/null
@@ -1,31 +0,0 @@
-#ifndef DT_BINDINGS_MEMORY_TEGRA124_MC_H
-#define DT_BINDINGS_MEMORY_TEGRA124_MC_H
-
-#define TEGRA_SWGROUP_PTC	0
-#define TEGRA_SWGROUP_DC	1
-#define TEGRA_SWGROUP_DCB	2
-#define TEGRA_SWGROUP_AFI	3
-#define TEGRA_SWGROUP_AVPC	4
-#define TEGRA_SWGROUP_HDA	5
-#define TEGRA_SWGROUP_HC	6
-#define TEGRA_SWGROUP_MSENC	7
-#define TEGRA_SWGROUP_PPCS	8
-#define TEGRA_SWGROUP_SATA	9
-#define TEGRA_SWGROUP_VDE	10
-#define TEGRA_SWGROUP_MPCORELP	11
-#define TEGRA_SWGROUP_MPCORE	12
-#define TEGRA_SWGROUP_ISP2	13
-#define TEGRA_SWGROUP_XUSB_HOST	14
-#define TEGRA_SWGROUP_XUSB_DEV	15
-#define TEGRA_SWGROUP_ISP2B	16
-#define TEGRA_SWGROUP_TSEC	17
-#define TEGRA_SWGROUP_A9AVP	18
-#define TEGRA_SWGROUP_GPU	19
-#define TEGRA_SWGROUP_SDMMC1A	20
-#define TEGRA_SWGROUP_SDMMC2A	21
-#define TEGRA_SWGROUP_SDMMC3A	22
-#define TEGRA_SWGROUP_SDMMC4A	23
-#define TEGRA_SWGROUP_VIC	24
-#define TEGRA_SWGROUP_VI	25
-
-#endif
diff --git a/include/dt-bindings/memory/tegra210-mc.h b/include/dt-bindings/memory/tegra210-mc.h
deleted file mode 100644
index d1731bc14dbc..000000000000
--- a/include/dt-bindings/memory/tegra210-mc.h
+++ /dev/null
@@ -1,36 +0,0 @@
-#ifndef DT_BINDINGS_MEMORY_TEGRA210_MC_H
-#define DT_BINDINGS_MEMORY_TEGRA210_MC_H
-
-#define TEGRA_SWGROUP_PTC	0
-#define TEGRA_SWGROUP_DC	1
-#define TEGRA_SWGROUP_DCB	2
-#define TEGRA_SWGROUP_AFI	3
-#define TEGRA_SWGROUP_AVPC	4
-#define TEGRA_SWGROUP_HDA	5
-#define TEGRA_SWGROUP_HC	6
-#define TEGRA_SWGROUP_NVENC	7
-#define TEGRA_SWGROUP_PPCS	8
-#define TEGRA_SWGROUP_SATA	9
-#define TEGRA_SWGROUP_MPCORE	10
-#define TEGRA_SWGROUP_ISP2	11
-#define TEGRA_SWGROUP_XUSB_HOST	12
-#define TEGRA_SWGROUP_XUSB_DEV	13
-#define TEGRA_SWGROUP_ISP2B	14
-#define TEGRA_SWGROUP_TSEC	15
-#define TEGRA_SWGROUP_A9AVP	16
-#define TEGRA_SWGROUP_GPU	17
-#define TEGRA_SWGROUP_SDMMC1A	18
-#define TEGRA_SWGROUP_SDMMC2A	19
-#define TEGRA_SWGROUP_SDMMC3A	20
-#define TEGRA_SWGROUP_SDMMC4A	21
-#define TEGRA_SWGROUP_VIC	22
-#define TEGRA_SWGROUP_VI	23
-#define TEGRA_SWGROUP_NVDEC	24
-#define TEGRA_SWGROUP_APE	25
-#define TEGRA_SWGROUP_NVJPG	26
-#define TEGRA_SWGROUP_SE	27
-#define TEGRA_SWGROUP_AXIAP	28
-#define TEGRA_SWGROUP_ETR	29
-#define TEGRA_SWGROUP_TSECB	30
-
-#endif
diff --git a/include/dt-bindings/memory/tegra30-mc.h b/include/dt-bindings/memory/tegra30-mc.h
deleted file mode 100644
index 502beb03d777..000000000000
--- a/include/dt-bindings/memory/tegra30-mc.h
+++ /dev/null
@@ -1,24 +0,0 @@
-#ifndef DT_BINDINGS_MEMORY_TEGRA30_MC_H
-#define DT_BINDINGS_MEMORY_TEGRA30_MC_H
-
-#define TEGRA_SWGROUP_PTC	0
-#define TEGRA_SWGROUP_DC	1
-#define TEGRA_SWGROUP_DCB	2
-#define TEGRA_SWGROUP_EPP	3
-#define TEGRA_SWGROUP_G2	4
-#define TEGRA_SWGROUP_MPE	5
-#define TEGRA_SWGROUP_VI	6
-#define TEGRA_SWGROUP_AFI	7
-#define TEGRA_SWGROUP_AVPC	8
-#define TEGRA_SWGROUP_NV	9
-#define TEGRA_SWGROUP_NV2	10
-#define TEGRA_SWGROUP_HDA	11
-#define TEGRA_SWGROUP_HC	12
-#define TEGRA_SWGROUP_PPCS	13
-#define TEGRA_SWGROUP_SATA	14
-#define TEGRA_SWGROUP_VDE	15
-#define TEGRA_SWGROUP_MPCORELP	16
-#define TEGRA_SWGROUP_MPCORE	17
-#define TEGRA_SWGROUP_ISP	18
-
-#endif
diff --git a/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h b/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
deleted file mode 100644
index 914d56da9324..000000000000
--- a/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
+++ /dev/null
@@ -1,7 +0,0 @@
-#ifndef _DT_BINDINGS_PINCTRL_TEGRA_XUSB_H
-#define _DT_BINDINGS_PINCTRL_TEGRA_XUSB_H 1
-
-#define TEGRA_XUSB_PADCTL_PCIE 0
-#define TEGRA_XUSB_PADCTL_SATA 1
-
-#endif /* _DT_BINDINGS_PINCTRL_TEGRA_XUSB_H */
diff --git a/include/dt-bindings/pinctrl/pinctrl-tegra.h b/include/dt-bindings/pinctrl/pinctrl-tegra.h
deleted file mode 100644
index c9b57408de68..000000000000
--- a/include/dt-bindings/pinctrl/pinctrl-tegra.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants for Tegra pinctrl bindings.
- *
- * Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
- *
- * Author: Laxman Dewangan <ldewangan@nvidia.com>
- */
-
-#ifndef _DT_BINDINGS_PINCTRL_TEGRA_H
-#define _DT_BINDINGS_PINCTRL_TEGRA_H
-
-/*
- * Enable/disable for diffeent dt properties. This is applicable for
- * properties nvidia,enable-input, nvidia,tristate, nvidia,open-drain,
- * nvidia,lock, nvidia,rcv-sel, nvidia,high-speed-mode, nvidia,schmitt.
- */
-#define TEGRA_PIN_DISABLE				0
-#define TEGRA_PIN_ENABLE				1
-
-#define TEGRA_PIN_PULL_NONE				0
-#define TEGRA_PIN_PULL_DOWN				1
-#define TEGRA_PIN_PULL_UP				2
-
-/* Low power mode driver */
-#define TEGRA_PIN_LP_DRIVE_DIV_8			0
-#define TEGRA_PIN_LP_DRIVE_DIV_4			1
-#define TEGRA_PIN_LP_DRIVE_DIV_2			2
-#define TEGRA_PIN_LP_DRIVE_DIV_1			3
-
-/* Rising/Falling slew rate */
-#define TEGRA_PIN_SLEW_RATE_FASTEST			0
-#define TEGRA_PIN_SLEW_RATE_FAST			1
-#define TEGRA_PIN_SLEW_RATE_SLOW			2
-#define TEGRA_PIN_SLEW_RATE_SLOWEST			3
-
-#endif
diff --git a/include/dt-bindings/power/tegra186-powergate.h b/include/dt-bindings/power/tegra186-powergate.h
deleted file mode 100644
index 17e75498563c..000000000000
--- a/include/dt-bindings/power/tegra186-powergate.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2015-2016, NVIDIA CORPORATION.
- */
-
-#ifndef _DT_BINDINGS_POWER_TEGRA186_POWERGATE_H
-#define _DT_BINDINGS_POWER_TEGRA186_POWERGATE_H
-
-#define TEGRA186_POWER_DOMAIN_AUD	0
-#define TEGRA186_POWER_DOMAIN_DFD	1
-#define TEGRA186_POWER_DOMAIN_DISP	2
-#define TEGRA186_POWER_DOMAIN_DISPB	3
-#define TEGRA186_POWER_DOMAIN_DISPC	4
-#define TEGRA186_POWER_DOMAIN_ISPA	5
-#define TEGRA186_POWER_DOMAIN_NVDEC	6
-#define TEGRA186_POWER_DOMAIN_NVJPG	7
-#define TEGRA186_POWER_DOMAIN_MPE	8
-#define TEGRA186_POWER_DOMAIN_PCX	9
-#define TEGRA186_POWER_DOMAIN_SAX	10
-#define TEGRA186_POWER_DOMAIN_VE	11
-#define TEGRA186_POWER_DOMAIN_VIC	12
-#define TEGRA186_POWER_DOMAIN_XUSBA	13
-#define TEGRA186_POWER_DOMAIN_XUSBB	14
-#define TEGRA186_POWER_DOMAIN_XUSBC	15
-#define TEGRA186_POWER_DOMAIN_GPU	43
-#define TEGRA186_POWER_DOMAIN_MAX	44
-
-#endif
diff --git a/include/dt-bindings/reset/tegra124-car.h b/include/dt-bindings/reset/tegra124-car.h
deleted file mode 100644
index 070e4f6e7486..000000000000
--- a/include/dt-bindings/reset/tegra124-car.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/*
- * This header provides Tegra124-specific constants for binding
- * nvidia,tegra124-car.
- */
-
-#ifndef _DT_BINDINGS_RESET_TEGRA124_CAR_H
-#define _DT_BINDINGS_RESET_TEGRA124_CAR_H
-
-#define TEGRA124_RESET(x)		(6 * 32 + (x))
-#define TEGRA124_RST_DFLL_DVCO		TEGRA124_RESET(0)
-
-#endif	/* _DT_BINDINGS_RESET_TEGRA124_CAR_H */
diff --git a/include/dt-bindings/reset/tegra186-reset.h b/include/dt-bindings/reset/tegra186-reset.h
deleted file mode 100644
index 7efec9200532..000000000000
--- a/include/dt-bindings/reset/tegra186-reset.h
+++ /dev/null
@@ -1,205 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2015, NVIDIA CORPORATION.
- */
-
-#ifndef _ABI_MACH_T186_RESET_T186_H_
-#define _ABI_MACH_T186_RESET_T186_H_
-
-#define TEGRA186_RESET_ACTMON			0
-#define TEGRA186_RESET_AFI			1
-#define TEGRA186_RESET_CEC			2
-#define TEGRA186_RESET_CSITE			3
-#define TEGRA186_RESET_DP2			4
-#define TEGRA186_RESET_DPAUX			5
-#define TEGRA186_RESET_DSI			6
-#define TEGRA186_RESET_DSIB			7
-#define TEGRA186_RESET_DTV			8
-#define TEGRA186_RESET_DVFS			9
-#define TEGRA186_RESET_ENTROPY			10
-#define TEGRA186_RESET_EXTPERIPH1		11
-#define TEGRA186_RESET_EXTPERIPH2		12
-#define TEGRA186_RESET_EXTPERIPH3		13
-#define TEGRA186_RESET_GPU			14
-#define TEGRA186_RESET_HDA			15
-#define TEGRA186_RESET_HDA2CODEC_2X		16
-#define TEGRA186_RESET_HDA2HDMICODEC		17
-#define TEGRA186_RESET_HOST1X			18
-#define TEGRA186_RESET_I2C1			19
-#define TEGRA186_RESET_I2C2			20
-#define TEGRA186_RESET_I2C3			21
-#define TEGRA186_RESET_I2C4			22
-#define TEGRA186_RESET_I2C5			23
-#define TEGRA186_RESET_I2C6			24
-#define TEGRA186_RESET_ISP			25
-#define TEGRA186_RESET_KFUSE			26
-#define TEGRA186_RESET_LA			27
-#define TEGRA186_RESET_MIPI_CAL			28
-#define TEGRA186_RESET_PCIE			29
-#define TEGRA186_RESET_PCIEXCLK			30
-#define TEGRA186_RESET_SATA			31
-#define TEGRA186_RESET_SATACOLD			32
-#define TEGRA186_RESET_SDMMC1			33
-#define TEGRA186_RESET_SDMMC2			34
-#define TEGRA186_RESET_SDMMC3			35
-#define TEGRA186_RESET_SDMMC4			36
-#define TEGRA186_RESET_SE			37
-#define TEGRA186_RESET_SOC_THERM		38
-#define TEGRA186_RESET_SOR0			39
-#define TEGRA186_RESET_SPI1			40
-#define TEGRA186_RESET_SPI2			41
-#define TEGRA186_RESET_SPI3			42
-#define TEGRA186_RESET_SPI4			43
-#define TEGRA186_RESET_TMR			44
-#define TEGRA186_RESET_TRIG_SYS			45
-#define TEGRA186_RESET_TSEC			46
-#define TEGRA186_RESET_UARTA			47
-#define TEGRA186_RESET_UARTB			48
-#define TEGRA186_RESET_UARTC			49
-#define TEGRA186_RESET_UARTD			50
-#define TEGRA186_RESET_VI			51
-#define TEGRA186_RESET_VIC			52
-#define TEGRA186_RESET_XUSB_DEV			53
-#define TEGRA186_RESET_XUSB_HOST		54
-#define TEGRA186_RESET_XUSB_PADCTL		55
-#define TEGRA186_RESET_XUSB_SS			56
-#define TEGRA186_RESET_AON_APB			57
-#define TEGRA186_RESET_AXI_CBB			58
-#define TEGRA186_RESET_BPMP_APB			59
-#define TEGRA186_RESET_CAN1			60
-#define TEGRA186_RESET_CAN2			61
-#define TEGRA186_RESET_DMIC5			62
-#define TEGRA186_RESET_DSIC			63
-#define TEGRA186_RESET_DSID			64
-#define TEGRA186_RESET_EMC_EMC			65
-#define TEGRA186_RESET_EMC_MEM			66
-#define TEGRA186_RESET_EMCSB_EMC		67
-#define TEGRA186_RESET_EMCSB_MEM		68
-#define TEGRA186_RESET_EQOS			69
-#define TEGRA186_RESET_GPCDMA			70
-#define TEGRA186_RESET_GPIO_CTL0		71
-#define TEGRA186_RESET_GPIO_CTL1		72
-#define TEGRA186_RESET_GPIO_CTL2		73
-#define TEGRA186_RESET_GPIO_CTL3		74
-#define TEGRA186_RESET_GPIO_CTL4		75
-#define TEGRA186_RESET_GPIO_CTL5		76
-#define TEGRA186_RESET_I2C10			77
-#define TEGRA186_RESET_I2C12			78
-#define TEGRA186_RESET_I2C13			79
-#define TEGRA186_RESET_I2C14			80
-#define TEGRA186_RESET_I2C7			81
-#define TEGRA186_RESET_I2C8			82
-#define TEGRA186_RESET_I2C9			83
-#define TEGRA186_RESET_JTAG2AXI			84
-#define TEGRA186_RESET_MPHY_IOBIST		85
-#define TEGRA186_RESET_MPHY_L0_RX		86
-#define TEGRA186_RESET_MPHY_L0_TX		87
-#define TEGRA186_RESET_NVCSI			88
-#define TEGRA186_RESET_NVDISPLAY0_HEAD0		89
-#define TEGRA186_RESET_NVDISPLAY0_HEAD1		90
-#define TEGRA186_RESET_NVDISPLAY0_HEAD2		91
-#define TEGRA186_RESET_NVDISPLAY0_MISC		92
-#define TEGRA186_RESET_NVDISPLAY0_WGRP0		93
-#define TEGRA186_RESET_NVDISPLAY0_WGRP1		94
-#define TEGRA186_RESET_NVDISPLAY0_WGRP2		95
-#define TEGRA186_RESET_NVDISPLAY0_WGRP3		96
-#define TEGRA186_RESET_NVDISPLAY0_WGRP4		97
-#define TEGRA186_RESET_NVDISPLAY0_WGRP5		98
-#define TEGRA186_RESET_PWM1			99
-#define TEGRA186_RESET_PWM2			100
-#define TEGRA186_RESET_PWM3			101
-#define TEGRA186_RESET_PWM4			102
-#define TEGRA186_RESET_PWM5			103
-#define TEGRA186_RESET_PWM6			104
-#define TEGRA186_RESET_PWM7			105
-#define TEGRA186_RESET_PWM8			106
-#define TEGRA186_RESET_SCE_APB			107
-#define TEGRA186_RESET_SOR1			108
-#define TEGRA186_RESET_TACH			109
-#define TEGRA186_RESET_TSC			110
-#define TEGRA186_RESET_UARTF			111
-#define TEGRA186_RESET_UARTG			112
-#define TEGRA186_RESET_UFSHC			113
-#define TEGRA186_RESET_UFSHC_AXI_M		114
-#define TEGRA186_RESET_UPHY			115
-#define TEGRA186_RESET_ADSP			116
-#define TEGRA186_RESET_ADSPDBG			117
-#define TEGRA186_RESET_ADSPINTF			118
-#define TEGRA186_RESET_ADSPNEON			119
-#define TEGRA186_RESET_ADSPPERIPH		120
-#define TEGRA186_RESET_ADSPSCU			121
-#define TEGRA186_RESET_ADSPWDT			122
-#define TEGRA186_RESET_APE			123
-#define TEGRA186_RESET_DPAUX1			124
-#define TEGRA186_RESET_NVDEC			125
-#define TEGRA186_RESET_NVENC			126
-#define TEGRA186_RESET_NVJPG			127
-#define TEGRA186_RESET_PEX_USB_UPHY		128
-#define TEGRA186_RESET_QSPI			129
-#define TEGRA186_RESET_TSECB			130
-#define TEGRA186_RESET_VI_I2C			131
-#define TEGRA186_RESET_UARTE			132
-#define TEGRA186_RESET_TOP_GTE			133
-#define TEGRA186_RESET_SHSP			134
-#define TEGRA186_RESET_PEX_USB_UPHY_L5		135
-#define TEGRA186_RESET_PEX_USB_UPHY_L4		136
-#define TEGRA186_RESET_PEX_USB_UPHY_L3		137
-#define TEGRA186_RESET_PEX_USB_UPHY_L2		138
-#define TEGRA186_RESET_PEX_USB_UPHY_L1		139
-#define TEGRA186_RESET_PEX_USB_UPHY_L0		140
-#define TEGRA186_RESET_PEX_USB_UPHY_PLL1	141
-#define TEGRA186_RESET_PEX_USB_UPHY_PLL0	142
-#define TEGRA186_RESET_TSCTNVI			143
-#define TEGRA186_RESET_EXTPERIPH4		144
-#define TEGRA186_RESET_DSIPADCTL		145
-#define TEGRA186_RESET_AUD_MCLK			146
-#define TEGRA186_RESET_MPHY_CLK_CTL		147
-#define TEGRA186_RESET_MPHY_L1_RX		148
-#define TEGRA186_RESET_MPHY_L1_TX		149
-#define TEGRA186_RESET_UFSHC_LP			150
-#define TEGRA186_RESET_BPMP_NIC			151
-#define TEGRA186_RESET_BPMP_NSYSPORESET		152
-#define TEGRA186_RESET_BPMP_NRESET		153
-#define TEGRA186_RESET_BPMP_DBGRESETN		154
-#define TEGRA186_RESET_BPMP_PRESETDBGN		155
-#define TEGRA186_RESET_BPMP_PM			156
-#define TEGRA186_RESET_BPMP_CVC			157
-#define TEGRA186_RESET_BPMP_DMA			158
-#define TEGRA186_RESET_BPMP_HSP			159
-#define TEGRA186_RESET_TSCTNBPMP		160
-#define TEGRA186_RESET_BPMP_TKE			161
-#define TEGRA186_RESET_BPMP_GTE			162
-#define TEGRA186_RESET_BPMP_PM_ACTMON		163
-#define TEGRA186_RESET_AON_NIC			164
-#define TEGRA186_RESET_AON_NSYSPORESET		165
-#define TEGRA186_RESET_AON_NRESET		166
-#define TEGRA186_RESET_AON_DBGRESETN		167
-#define TEGRA186_RESET_AON_PRESETDBGN		168
-#define TEGRA186_RESET_AON_ACTMON		169
-#define TEGRA186_RESET_AOPM			170
-#define TEGRA186_RESET_AOVC			171
-#define TEGRA186_RESET_AON_DMA			172
-#define TEGRA186_RESET_AON_GPIO			173
-#define TEGRA186_RESET_AON_HSP			174
-#define TEGRA186_RESET_TSCTNAON			175
-#define TEGRA186_RESET_AON_TKE			176
-#define TEGRA186_RESET_AON_GTE			177
-#define TEGRA186_RESET_SCE_NIC			178
-#define TEGRA186_RESET_SCE_NSYSPORESET		179
-#define TEGRA186_RESET_SCE_NRESET		180
-#define TEGRA186_RESET_SCE_DBGRESETN		181
-#define TEGRA186_RESET_SCE_PRESETDBGN		182
-#define TEGRA186_RESET_SCE_ACTMON		183
-#define TEGRA186_RESET_SCE_PM			184
-#define TEGRA186_RESET_SCE_DMA			185
-#define TEGRA186_RESET_SCE_HSP			186
-#define TEGRA186_RESET_TSCTNSCE			187
-#define TEGRA186_RESET_SCE_TKE			188
-#define TEGRA186_RESET_SCE_GTE			189
-#define TEGRA186_RESET_SCE_CFG			190
-#define TEGRA186_RESET_ADSP_ALL			191
-/** @brief controls the power up/down sequence of UFSHC PSW partition. Controls LP_PWR_READY, LP_ISOL_EN, and LP_RESET_N signals */
-#define TEGRA186_RESET_UFSHC_LP_SEQ		192
-#define TEGRA186_RESET_SIZE			193
-
-#endif
diff --git a/include/dt-bindings/thermal/tegra124-soctherm.h b/include/dt-bindings/thermal/tegra124-soctherm.h
deleted file mode 100644
index 729ab9fc325e..000000000000
--- a/include/dt-bindings/thermal/tegra124-soctherm.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/*
- * This header provides constants for binding nvidia,tegra124-soctherm.
- */
-
-#ifndef _DT_BINDINGS_THERMAL_TEGRA124_SOCTHERM_H
-#define _DT_BINDINGS_THERMAL_TEGRA124_SOCTHERM_H
-
-#define TEGRA124_SOCTHERM_SENSOR_CPU 0
-#define TEGRA124_SOCTHERM_SENSOR_MEM 1
-#define TEGRA124_SOCTHERM_SENSOR_GPU 2
-#define TEGRA124_SOCTHERM_SENSOR_PLLX 3
-#define TEGRA124_SOCTHERM_SENSOR_NUM 4
-
-#endif

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
