Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB687079E
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Mar 2024 17:51:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28DC1C6DD6B;
	Mon,  4 Mar 2024 16:51:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 527DFC6DD6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 16:51:55 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-412e7fe422fso4924025e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 08:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709571115; x=1710175915;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lx/w0WddKpWINiCDSDlootkf6yoW+r1Y29SUE9OJeYs=;
 b=M2poUYcsw5ozUOz/di3irN3LOOA1FUTOe0EE2+SkfxgylrnX5/x+VwfWYbLn8apVd4
 8l0DkQectJDHqA5Pc7IG/U7ooeV8snwfTZbpgmjgW87neJMzALk9Ykl/I0U4jPeJSdLQ
 kLdZzr2mjTHdJUshCKpn6biMsmdASEy6YD482X5x991oxQqb4AwkawecJRwoam9Tin1E
 7w2KpID9s4+wUQL9qISMl4XduFjpNUTdZDFiEYkq7BVDPtXmfADSzqA7oYyNGJ5OJKKy
 Lk2aLDw5wOfSdsLX7jh4usgqL41eJXv4oGxsxYI6lCIdX7Eafy4zI0Mh7htWng76n8uj
 hKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571115; x=1710175915;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lx/w0WddKpWINiCDSDlootkf6yoW+r1Y29SUE9OJeYs=;
 b=obnHDT1mUjRSXynzPiSgBNkhpLlsNDv7dkG+fp3mv/Aj2HP8JcUhjcvSUu9Ijz/SOh
 xJs8XlKk+Xo4tHY6iu7PuXjnvcX0OV05FN8oi0/GX0OXtBlcNjSvZfTo9OdfGiZhn581
 OSRXEy+iTix+uVMDGGyi9y+HhdoLmSYYa7gbxgbaEeYYmrzr9JyWW7y+clsh48aC7ZJq
 cIlz43v+irSvZLE5sTFFyTHYc9JbJ10302v+T8WwjNG/fdaej73OdjtWa0/aCkNMnbm4
 qw5r6zvStRbnIKkyrQaHQq1TQhp1r/uYTLMHLqKgMDfhq9+TtuxOLjOWsBOQbCxfaxh5
 bYOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPC38m6eDsLPxlvfOwofbsMvXvHWXNISVjywqTZNl+bDaHiMG72mrbexJtIUnDRKRB6y43YexTFLtTtWogM/wz6q+MipNWJdCc0UkS4sWjbf4bDSonJtSB
X-Gm-Message-State: AOJu0YzoHqbFlcJmDlP/2CW3G5KBs22QtJXfpW6W7mdEL9/9yxrSMWXh
 z0B6iykbqUVapoSxn3mQGIFiv4X9lpbnyqbIrsJCfy92IE7xL0lceTznJmvhk68=
X-Google-Smtp-Source: AGHT+IHmGBnX4D0DHUy7J9WsHA+ioX7Jh0dIjgN7lovbgEEcZ3XaPwfDGzZcYAMW4FudEP9lA1lPIg==
X-Received: by 2002:a05:600c:3591:b0:412:37f4:4a3b with SMTP id
 p17-20020a05600c359100b0041237f44a3bmr6594576wmq.34.1709571114908; 
 Mon, 04 Mar 2024 08:51:54 -0800 (PST)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm10598517wmq.6.2024.03.04.08.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:51:54 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Mon, 04 Mar 2024 16:51:28 +0000
MIME-Version: 1.0
Message-Id: <20240304-b4-upstream-dt-headers-v1-20-b7ff41925f92@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9919;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=1dhvFRR1JMPW9pajMQcQiy65b+r5wgrZKz0z+w6cM88=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtSnfzgyWs/Xb/3wddM0r8nbBTlCEjWKsn/qe/4V0vbZm
 3uN7X5ARykLgyAHg6yYIov4iWWWTWsv22tsX3ABZg4rE8gQBi5OAZjIFXeGv9Le/w+1S36Nvub9
 4XH75/xfPOY339jkGmhntDIrvHQKcWdk6DzTVLvhYtqabUe0omqY/qnOePlfqnfJpp+BGvfvR0+
 97g0A
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH RFC 20/26] microchip: drop dt-binding headers
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
 include/dt-bindings/clock/at91.h                 | 23 --------
 include/dt-bindings/clock/microchip-mpfs-clock.h | 71 ------------------------
 include/dt-bindings/dma/at91.h                   | 52 -----------------
 include/dt-bindings/mfd/at91-usart.h             | 17 ------
 include/dt-bindings/net/microchip-lan78xx.h      | 21 -------
 include/dt-bindings/pinctrl/at91.h               | 49 ----------------
 include/dt-bindings/sound/microchip,pdmc.h       | 13 -----
 7 files changed, 246 deletions(-)

diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
deleted file mode 100644
index ab3ee241d10c..000000000000
--- a/include/dt-bindings/clock/at91.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/*
- * This header provides constants for AT91 pmc status.
- *
- * The constants defined in this header are being used in dts.
- *
- * Licensed under GPLv2 or later.
- */
-
-#ifndef _DT_BINDINGS_CLK_AT91_H
-#define _DT_BINDINGS_CLK_AT91_H
-
-#define AT91_PMC_MOSCS		0		/* MOSCS Flag */
-#define AT91_PMC_LOCKA		1		/* PLLA Lock */
-#define AT91_PMC_LOCKB		2		/* PLLB Lock */
-#define AT91_PMC_MCKRDY		3		/* Master Clock */
-#define AT91_PMC_LOCKU		6		/* UPLL Lock */
-#define AT91_PMC_PCKRDY(id)	(8 + (id))	/* Programmable Clock */
-#define AT91_PMC_MOSCSELS	16		/* Main Oscillator Selection */
-#define AT91_PMC_MOSCRCS	17		/* Main On-Chip RC */
-#define AT91_PMC_CFDEV		18		/* Clock Failure Detector Event */
-#define AT91_PMC_GCKRDY		24		/* Generated Clocks */
-
-#endif
diff --git a/include/dt-bindings/clock/microchip-mpfs-clock.h b/include/dt-bindings/clock/microchip-mpfs-clock.h
deleted file mode 100644
index 79775a5134ca..000000000000
--- a/include/dt-bindings/clock/microchip-mpfs-clock.h
+++ /dev/null
@@ -1,71 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
-/*
- * Daire McNamara,<daire.mcnamara@microchip.com>
- * Copyright (C) 2020-2022 Microchip Technology Inc.  All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
-#define _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
-
-#define CLK_CPU		0
-#define CLK_AXI		1
-#define CLK_AHB		2
-
-#define CLK_ENVM	3
-#define CLK_MAC0	4
-#define CLK_MAC1	5
-#define CLK_MMC		6
-#define CLK_TIMER	7
-#define CLK_MMUART0	8
-#define CLK_MMUART1	9
-#define CLK_MMUART2	10
-#define CLK_MMUART3	11
-#define CLK_MMUART4	12
-#define CLK_SPI0	13
-#define CLK_SPI1	14
-#define CLK_I2C0	15
-#define CLK_I2C1	16
-#define CLK_CAN0	17
-#define CLK_CAN1	18
-#define CLK_USB		19
-#define CLK_RESERVED	20
-#define CLK_RTC		21
-#define CLK_QSPI	22
-#define CLK_GPIO0	23
-#define CLK_GPIO1	24
-#define CLK_GPIO2	25
-#define CLK_DDRC	26
-#define CLK_FIC0	27
-#define CLK_FIC1	28
-#define CLK_FIC2	29
-#define CLK_FIC3	30
-#define CLK_ATHENA	31
-#define CLK_CFM		32
-
-#define CLK_RTCREF	33
-#define CLK_MSSPLL	34
-
-/* Clock Conditioning Circuitry Clock IDs */
-
-#define CLK_CCC_PLL0		0
-#define CLK_CCC_PLL1		1
-#define CLK_CCC_DLL0		2
-#define CLK_CCC_DLL1		3
-
-#define CLK_CCC_PLL0_OUT0	4
-#define CLK_CCC_PLL0_OUT1	5
-#define CLK_CCC_PLL0_OUT2	6
-#define CLK_CCC_PLL0_OUT3	7
-
-#define CLK_CCC_PLL1_OUT0	8
-#define CLK_CCC_PLL1_OUT1	9
-#define CLK_CCC_PLL1_OUT2	10
-#define CLK_CCC_PLL1_OUT3	11
-
-#define CLK_CCC_DLL0_OUT0	12
-#define CLK_CCC_DLL0_OUT1	13
-
-#define CLK_CCC_DLL1_OUT0	14
-#define CLK_CCC_DLL1_OUT1	15
-
-#endif	/* _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_ */
diff --git a/include/dt-bindings/dma/at91.h b/include/dt-bindings/dma/at91.h
deleted file mode 100644
index ab6cbba45401..000000000000
--- a/include/dt-bindings/dma/at91.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/*
- * This header provides macros for at91 dma bindings.
- *
- * Copyright (C) 2013 Ludovic Desroches <ludovic.desroches@atmel.com>
- *
- * GPLv2 only
- */
-
-#ifndef __DT_BINDINGS_AT91_DMA_H__
-#define __DT_BINDINGS_AT91_DMA_H__
-
-/* ---------- HDMAC ---------- */
-
-/*
- * Source and/or destination peripheral ID
- */
-#define AT91_DMA_CFG_PER_ID_MASK	(0xff)
-#define AT91_DMA_CFG_PER_ID(id)		(id & AT91_DMA_CFG_PER_ID_MASK)
-
-/*
- * FIFO configuration: it defines when a request is serviced.
- */
-#define AT91_DMA_CFG_FIFOCFG_OFFSET	(8)
-#define AT91_DMA_CFG_FIFOCFG_MASK	(0xf << AT91_DMA_CFG_FIFOCFG_OFFSET)
-#define AT91_DMA_CFG_FIFOCFG_HALF	(0x0 << AT91_DMA_CFG_FIFOCFG_OFFSET)	/* half FIFO (default behavior) */
-#define AT91_DMA_CFG_FIFOCFG_ALAP	(0x1 << AT91_DMA_CFG_FIFOCFG_OFFSET)	/* largest defined AHB burst */
-#define AT91_DMA_CFG_FIFOCFG_ASAP	(0x2 << AT91_DMA_CFG_FIFOCFG_OFFSET)	/* single AHB access */
-
-
-/* ---------- XDMAC ---------- */
-#define AT91_XDMAC_DT_MEM_IF_MASK	(0x1)
-#define AT91_XDMAC_DT_MEM_IF_OFFSET	(13)
-#define AT91_XDMAC_DT_MEM_IF(mem_if)	(((mem_if) & AT91_XDMAC_DT_MEM_IF_MASK) \
-					<< AT91_XDMAC_DT_MEM_IF_OFFSET)
-#define AT91_XDMAC_DT_GET_MEM_IF(cfg)	(((cfg) >> AT91_XDMAC_DT_MEM_IF_OFFSET) \
-					& AT91_XDMAC_DT_MEM_IF_MASK)
-
-#define AT91_XDMAC_DT_PER_IF_MASK	(0x1)
-#define AT91_XDMAC_DT_PER_IF_OFFSET	(14)
-#define AT91_XDMAC_DT_PER_IF(per_if)	(((per_if) & AT91_XDMAC_DT_PER_IF_MASK) \
-					<< AT91_XDMAC_DT_PER_IF_OFFSET)
-#define AT91_XDMAC_DT_GET_PER_IF(cfg)	(((cfg) >> AT91_XDMAC_DT_PER_IF_OFFSET) \
-					& AT91_XDMAC_DT_PER_IF_MASK)
-
-#define AT91_XDMAC_DT_PERID_MASK	(0x7f)
-#define AT91_XDMAC_DT_PERID_OFFSET	(24)
-#define AT91_XDMAC_DT_PERID(perid)	(((perid) & AT91_XDMAC_DT_PERID_MASK) \
-					<< AT91_XDMAC_DT_PERID_OFFSET)
-#define AT91_XDMAC_DT_GET_PERID(cfg)	(((cfg) >> AT91_XDMAC_DT_PERID_OFFSET) \
-					& AT91_XDMAC_DT_PERID_MASK)
-
-#endif /* __DT_BINDINGS_AT91_DMA_H__ */
diff --git a/include/dt-bindings/mfd/at91-usart.h b/include/dt-bindings/mfd/at91-usart.h
deleted file mode 100644
index 2de5bc312e1e..000000000000
--- a/include/dt-bindings/mfd/at91-usart.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides macros for AT91 USART DT bindings.
- *
- * Copyright (C) 2018 Microchip Technology
- *
- * Author: Radu Pirea <radu.pirea@microchip.com>
- *
- */
-
-#ifndef __DT_BINDINGS_AT91_USART_H__
-#define __DT_BINDINGS_AT91_USART_H__
-
-#define AT91_USART_MODE_SERIAL	0
-#define AT91_USART_MODE_SPI	1
-
-#endif /* __DT_BINDINGS_AT91_USART_H__ */
diff --git a/include/dt-bindings/net/microchip-lan78xx.h b/include/dt-bindings/net/microchip-lan78xx.h
deleted file mode 100644
index 0742ff075307..000000000000
--- a/include/dt-bindings/net/microchip-lan78xx.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _DT_BINDINGS_MICROCHIP_LAN78XX_H
-#define _DT_BINDINGS_MICROCHIP_LAN78XX_H
-
-/* LED modes for LAN7800/LAN7850 embedded PHY */
-
-#define LAN78XX_LINK_ACTIVITY           0
-#define LAN78XX_LINK_1000_ACTIVITY      1
-#define LAN78XX_LINK_100_ACTIVITY       2
-#define LAN78XX_LINK_10_ACTIVITY        3
-#define LAN78XX_LINK_100_1000_ACTIVITY  4
-#define LAN78XX_LINK_10_1000_ACTIVITY   5
-#define LAN78XX_LINK_10_100_ACTIVITY    6
-#define LAN78XX_DUPLEX_COLLISION        8
-#define LAN78XX_COLLISION               9
-#define LAN78XX_ACTIVITY                10
-#define LAN78XX_AUTONEG_FAULT           12
-#define LAN78XX_FORCE_LED_OFF           14
-#define LAN78XX_FORCE_LED_ON            15
-
-#endif
diff --git a/include/dt-bindings/pinctrl/at91.h b/include/dt-bindings/pinctrl/at91.h
deleted file mode 100644
index 3831f91fb3ba..000000000000
--- a/include/dt-bindings/pinctrl/at91.h
+++ /dev/null
@@ -1,49 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * This header provides constants for most at91 pinctrl bindings.
- *
- * Copyright (C) 2013 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
- */
-
-#ifndef __DT_BINDINGS_AT91_PINCTRL_H__
-#define __DT_BINDINGS_AT91_PINCTRL_H__
-
-#define AT91_PINCTRL_NONE		(0 << 0)
-#define AT91_PINCTRL_PULL_UP		(1 << 0)
-#define AT91_PINCTRL_MULTI_DRIVE	(1 << 1)
-#define AT91_PINCTRL_DEGLITCH		(1 << 2)
-#define AT91_PINCTRL_PULL_DOWN		(1 << 3)
-#define AT91_PINCTRL_DIS_SCHMIT		(1 << 4)
-#define AT91_PINCTRL_OUTPUT		(1 << 7)
-#define AT91_PINCTRL_OUTPUT_VAL(x)	((x & 0x1) << 8)
-#define AT91_PINCTRL_SLEWRATE		(1 << 9)
-#define AT91_PINCTRL_DEBOUNCE		(1 << 16)
-#define AT91_PINCTRL_DEBOUNCE_VAL(x)	(x << 17)
-
-#define AT91_PINCTRL_PULL_UP_DEGLITCH	(AT91_PINCTRL_PULL_UP | AT91_PINCTRL_DEGLITCH)
-
-#define AT91_PINCTRL_DRIVE_STRENGTH_DEFAULT		(0x0 << 5)
-#define AT91_PINCTRL_DRIVE_STRENGTH_LOW			(0x1 << 5)
-#define AT91_PINCTRL_DRIVE_STRENGTH_MED			(0x2 << 5)
-#define AT91_PINCTRL_DRIVE_STRENGTH_HI			(0x3 << 5)
-
-#define AT91_PINCTRL_SLEWRATE_DIS	(0x0 << 9)
-#define AT91_PINCTRL_SLEWRATE_ENA	(0x1 << 9)
-
-#define AT91_PIOA	0
-#define AT91_PIOB	1
-#define AT91_PIOC	2
-#define AT91_PIOD	3
-#define AT91_PIOE	4
-
-#define AT91_PERIPH_GPIO	0
-#define AT91_PERIPH_A		1
-#define AT91_PERIPH_B		2
-#define AT91_PERIPH_C		3
-#define AT91_PERIPH_D		4
-
-#define ATMEL_PIO_DRVSTR_LO	1
-#define ATMEL_PIO_DRVSTR_ME	2
-#define ATMEL_PIO_DRVSTR_HI	3
-
-#endif /* __DT_BINDINGS_AT91_PINCTRL_H__ */
diff --git a/include/dt-bindings/sound/microchip,pdmc.h b/include/dt-bindings/sound/microchip,pdmc.h
deleted file mode 100644
index 96cde94ce74f..000000000000
--- a/include/dt-bindings/sound/microchip,pdmc.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_BINDINGS_MICROCHIP_PDMC_H__
-#define __DT_BINDINGS_MICROCHIP_PDMC_H__
-
-/* PDM microphone's pin placement */
-#define MCHP_PDMC_DS0 0
-#define MCHP_PDMC_DS1 1
-
-/* PDM microphone clock edge sampling */
-#define MCHP_PDMC_CLK_POSITIVE 0
-#define MCHP_PDMC_CLK_NEGATIVE 1
-
-#endif /* __DT_BINDINGS_MICROCHIP_PDMC_H__ */

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
