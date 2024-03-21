Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 804BC886238
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Mar 2024 22:04:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49208C6DD69;
	Thu, 21 Mar 2024 21:04:39 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7C46C6DD73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 21:04:37 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4146d750dcdso8898655e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 14:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711055077; x=1711659877;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+qt/RcMB5yiruKVKK3aDkffOMjOMvkXVyvq4zEq9UFo=;
 b=e7RYzf3Lt0lECLgsn3qN+wLiiM/7DKf9+KG8DiqDp+DdffZd++1AuNuMIKja/ptrUE
 xMdpwcxLBlIxqxyGujlkXcj4c6gZBX6GG203/g89iRC3jbhcJ1VoQZ4ZaZ745QNXG4NU
 DRiVq4ad7MxDXX/ktIEAzYFee8ANysBZU7cKs+nNR52JfibN+Qbo+GpPqZzDhNDAz/dP
 WpOCXncA9xrc9GeCYi/hWZ9ymnxJM1YGeUAoCz8R0ajliOsBH/P1EvALGMUm2ripdOqc
 bVueN1xBjCLHx6CCaLFG6htAagL4Q13I0phiwOTkuOX5HUKYViVVKDzOrEOWm+IpDOeH
 n0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711055077; x=1711659877;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qt/RcMB5yiruKVKK3aDkffOMjOMvkXVyvq4zEq9UFo=;
 b=fnYX2XaBC0nPPUnTUOEZ8Pp8cmgp8L+VcexYK86HDWVWOuuf+FNN2lLQwoXs+KSai6
 eHE0Q5YrzCcX3591AnOWhgBpJeR5CNOAH0X1F5nvvdK6BIs2Pj1F/KtJOwEKbJkP/4Nw
 rCmUmB0gbyPpiTfV8PUVNEjzgXpef2CIJHWB81G6NcgE4AJAQDr01RIJO376PzNY5rC+
 Oa6ii2fZn8lL4KsrzPSFXaxQYE9lHvuuVlV0gN7JURXVsiPbD2jWm4ZkVS1YY8PU/qas
 IaQPfx5WuXdyS0zJF6p2RdSAjMv9KvL4rkn6nt1uPLVDk4av50hspdoiSGTqH4Em4d9d
 Q+WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX4+Bf8SnInKki8na7EPbsc+m77y8Zq3VTgsoKS5YKQfyVy0w3o1fY5OZjaByykLWLeT8eBghBEYRFREo1m63TvX1jMaimIe01VFXaqqko0SsK+rEFHnHN
X-Gm-Message-State: AOJu0YwNBh0OuZyEeYCY++lCE8U20IqBHKTIYgrm/DuvEfCX8/77Fabo
 ohv2HdbVQz3mxz1LJKJFaLRopas96kqz0xQvSpzY7csQvegQR1MQcRRZLr/ZRRc=
X-Google-Smtp-Source: AGHT+IFeRV9/fpBGbR+lcg1O2Zxgsg6VdBUfpBr8NgHoIglNRMGJxoSHaTjixeDtQoWnCpXS9P6p3g==
X-Received: by 2002:a05:600c:3507:b0:414:76df:41d6 with SMTP id
 h7-20020a05600c350700b0041476df41d6mr116893wmq.13.1711055077148; 
 Thu, 21 Mar 2024 14:04:37 -0700 (PDT)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b004146f728906sm925462wmb.7.2024.03.21.14.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 14:04:36 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Thu, 21 Mar 2024 21:04:04 +0000
MIME-Version: 1.0
Message-Id: <20240321-b4-upstream-dt-headers-v2-21-1eac0df875fe@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=32234;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=GOKKtfmk/clTTPS9jBfJhgfHHUKr1+IMOy/PwOizL18=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtQ/C/a+sk7sqyitcVM9dVP2Edct1+iZTBN+SUUm3lngE
 mF8aIVxRykLgyAHg6yYIov4iWWWTWsv22tsX3ABZg4rE8gQBi5OAZjIyc+MDKsXXuzWcpju/9f8
 R5cRo32U/I3N4s5bXxb9tgl8q3l4virD/7D4uduuVZt90fsrlp5yIUZT4KbP03MhDO5lLJW2p/Z
 dDgIA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 21/24] dt-bindings: drop clock headers
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

Clock headers for remaining smaller vendors that are compatible with
dts/upstream.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 include/dt-bindings/clock/actions,s700-cmu.h      | 118 -------
 include/dt-bindings/clock/actions,s900-cmu.h      | 129 --------
 include/dt-bindings/clock/agilex-clock.h          |  71 -----
 include/dt-bindings/clock/boston-clock.h          |  12 -
 include/dt-bindings/clock/fsl,qoriq-clockgen.h    |  15 -
 include/dt-bindings/clock/lpc32xx-clock.h         |  58 ----
 include/dt-bindings/clock/maxim,max77802.h        |  22 --
 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h |  46 ---
 include/dt-bindings/clock/rv1108-cru.h            | 356 ----------------------
 include/dt-bindings/clock/versaclock.h            |  13 -
 include/dt-bindings/clock/vf610-clock.h           | 202 ------------
 11 files changed, 1042 deletions(-)

diff --git a/include/dt-bindings/clock/actions,s700-cmu.h b/include/dt-bindings/clock/actions,s700-cmu.h
deleted file mode 100644
index 3e1942996724..000000000000
--- a/include/dt-bindings/clock/actions,s700-cmu.h
+++ /dev/null
@@ -1,118 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- * Device Tree binding constants for Actions Semi S700 Clock Management Unit
- *
- * Copyright (c) 2014 Actions Semi Inc.
- * Author: David Liu <liuwei@actions-semi.com>
- *
- * Author: Pathiban Nallathambi <pn@denx.de>
- * Author: Saravanan Sekar <sravanhome@gmail.com>
- */
-
-#ifndef __DT_BINDINGS_CLOCK_S700_H
-#define __DT_BINDINGS_CLOCK_S700_H
-
-#define CLK_NONE			0
-
-/* pll clocks */
-#define CLK_CORE_PLL			1
-#define CLK_DEV_PLL			2
-#define CLK_DDR_PLL			3
-#define CLK_NAND_PLL			4
-#define CLK_DISPLAY_PLL			5
-#define CLK_TVOUT_PLL			6
-#define CLK_CVBS_PLL			7
-#define CLK_AUDIO_PLL			8
-#define CLK_ETHERNET_PLL		9
-
-/* system clock */
-#define CLK_CPU				10
-#define CLK_DEV				11
-#define CLK_AHB				12
-#define CLK_APB				13
-#define CLK_DMAC			14
-#define CLK_NOC0_CLK_MUX		15
-#define CLK_NOC1_CLK_MUX		16
-#define CLK_HP_CLK_MUX			17
-#define CLK_HP_CLK_DIV			18
-#define CLK_NOC1_CLK_DIV		19
-#define CLK_NOC0			20
-#define CLK_NOC1			21
-#define CLK_SENOR_SRC			22
-
-/* peripheral device clock */
-#define CLK_GPIO			23
-#define CLK_TIMER			24
-#define CLK_DSI				25
-#define CLK_CSI				26
-#define CLK_SI				27
-#define CLK_DE				28
-#define CLK_HDE				29
-#define CLK_VDE				30
-#define CLK_VCE				31
-#define CLK_NAND			32
-#define CLK_SD0				33
-#define CLK_SD1				34
-#define CLK_SD2				35
-
-#define CLK_UART0			36
-#define CLK_UART1			37
-#define CLK_UART2			38
-#define CLK_UART3			39
-#define CLK_UART4			40
-#define CLK_UART5			41
-#define CLK_UART6			42
-
-#define CLK_PWM0			43
-#define CLK_PWM1			44
-#define CLK_PWM2			45
-#define CLK_PWM3			46
-#define CLK_PWM4			47
-#define CLK_PWM5			48
-#define CLK_GPU3D			49
-
-#define CLK_I2C0			50
-#define CLK_I2C1			51
-#define CLK_I2C2			52
-#define CLK_I2C3			53
-
-#define CLK_SPI0			54
-#define CLK_SPI1			55
-#define CLK_SPI2			56
-#define CLK_SPI3			57
-
-#define CLK_USB3_480MPLL0		58
-#define CLK_USB3_480MPHY0		59
-#define CLK_USB3_5GPHY			60
-#define CLK_USB3_CCE			61
-#define CLK_USB3_MAC			62
-
-#define CLK_LCD				63
-#define CLK_HDMI_AUDIO			64
-#define CLK_I2SRX			65
-#define CLK_I2STX			66
-
-#define CLK_SENSOR0			67
-#define CLK_SENSOR1			68
-
-#define CLK_HDMI_DEV			69
-
-#define CLK_ETHERNET			70
-#define CLK_RMII_REF			71
-
-#define CLK_USB2H0_PLLEN		72
-#define CLK_USB2H0_PHY			73
-#define CLK_USB2H0_CCE			74
-#define CLK_USB2H1_PLLEN		75
-#define CLK_USB2H1_PHY			76
-#define CLK_USB2H1_CCE			77
-
-#define CLK_TVOUT			78
-
-#define CLK_THERMAL_SENSOR		79
-
-#define CLK_IRC_SWITCH			80
-#define CLK_PCM1			81
-#define CLK_NR_CLKS			(CLK_PCM1 + 1)
-
-#endif /* __DT_BINDINGS_CLOCK_S700_H */
diff --git a/include/dt-bindings/clock/actions,s900-cmu.h b/include/dt-bindings/clock/actions,s900-cmu.h
deleted file mode 100644
index 7c1251565f43..000000000000
--- a/include/dt-bindings/clock/actions,s900-cmu.h
+++ /dev/null
@@ -1,129 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-//
-// Device Tree binding constants for Actions Semi S900 Clock Management Unit
-//
-// Copyright (c) 2014 Actions Semi Inc.
-// Copyright (c) 2018 Linaro Ltd.
-
-#ifndef __DT_BINDINGS_CLOCK_S900_CMU_H
-#define __DT_BINDINGS_CLOCK_S900_CMU_H
-
-#define CLK_NONE			0
-
-/* fixed rate clocks */
-#define CLK_LOSC			1
-#define CLK_HOSC			2
-
-/* pll clocks */
-#define CLK_CORE_PLL			3
-#define CLK_DEV_PLL			4
-#define CLK_DDR_PLL			5
-#define CLK_NAND_PLL			6
-#define CLK_DISPLAY_PLL			7
-#define CLK_DSI_PLL			8
-#define CLK_ASSIST_PLL			9
-#define CLK_AUDIO_PLL			10
-
-/* system clock */
-#define CLK_CPU				15
-#define CLK_DEV				16
-#define CLK_NOC				17
-#define CLK_NOC_MUX			18
-#define CLK_NOC_DIV			19
-#define CLK_AHB				20
-#define CLK_APB				21
-#define CLK_DMAC			22
-
-/* peripheral device clock */
-#define CLK_GPIO			23
-
-#define CLK_BISP			24
-#define CLK_CSI0			25
-#define CLK_CSI1			26
-
-#define CLK_DE0				27
-#define CLK_DE1				28
-#define CLK_DE2				29
-#define CLK_DE3				30
-#define CLK_DSI				32
-
-#define CLK_GPU				33
-#define CLK_GPU_CORE			34
-#define CLK_GPU_MEM			35
-#define CLK_GPU_SYS			36
-
-#define CLK_HDE				37
-#define CLK_I2C0			38
-#define CLK_I2C1			39
-#define CLK_I2C2			40
-#define CLK_I2C3			41
-#define CLK_I2C4			42
-#define CLK_I2C5			43
-#define CLK_I2SRX			44
-#define CLK_I2STX			45
-#define CLK_IMX				46
-#define CLK_LCD				47
-#define CLK_NAND0			48
-#define CLK_NAND1			49
-#define CLK_PWM0			50
-#define CLK_PWM1			51
-#define CLK_PWM2			52
-#define CLK_PWM3			53
-#define CLK_PWM4			54
-#define CLK_PWM5			55
-#define CLK_SD0				56
-#define CLK_SD1				57
-#define CLK_SD2				58
-#define CLK_SD3				59
-#define CLK_SENSOR			60
-#define CLK_SPEED_SENSOR		61
-#define CLK_SPI0			62
-#define CLK_SPI1			63
-#define CLK_SPI2			64
-#define CLK_SPI3			65
-#define CLK_THERMAL_SENSOR		66
-#define CLK_UART0			67
-#define CLK_UART1			68
-#define CLK_UART2			69
-#define CLK_UART3			70
-#define CLK_UART4			71
-#define CLK_UART5			72
-#define CLK_UART6			73
-#define CLK_VCE				74
-#define CLK_VDE				75
-
-#define CLK_USB3_480MPLL0		76
-#define CLK_USB3_480MPHY0		77
-#define CLK_USB3_5GPHY			78
-#define CLK_USB3_CCE			79
-#define CLK_USB3_MAC			80
-
-#define CLK_TIMER			83
-
-#define CLK_HDMI_AUDIO			84
-
-#define CLK_24M				85
-
-#define CLK_EDP				86
-
-#define CLK_24M_EDP			87
-#define CLK_EDP_PLL			88
-#define CLK_EDP_LINK			89
-
-#define CLK_USB2H0_PLLEN		90
-#define CLK_USB2H0_PHY			91
-#define CLK_USB2H0_CCE			92
-#define CLK_USB2H1_PLLEN		93
-#define CLK_USB2H1_PHY			94
-#define CLK_USB2H1_CCE			95
-
-#define CLK_DDR0			96
-#define CLK_DDR1			97
-#define CLK_DMM				98
-
-#define CLK_ETH_MAC			99
-#define CLK_RMII_REF			100
-
-#define CLK_NR_CLKS			(CLK_RMII_REF + 1)
-
-#endif /* __DT_BINDINGS_CLOCK_S900_CMU_H */
diff --git a/include/dt-bindings/clock/agilex-clock.h b/include/dt-bindings/clock/agilex-clock.h
deleted file mode 100644
index f751aad4dafc..000000000000
--- a/include/dt-bindings/clock/agilex-clock.h
+++ /dev/null
@@ -1,71 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2019, Intel Corporation
- */
-
-#ifndef __AGILEX_CLOCK_H
-#define __AGILEX_CLOCK_H
-
-/* fixed rate clocks */
-#define AGILEX_OSC1			0
-#define AGILEX_CB_INTOSC_HS_DIV2_CLK	1
-#define AGILEX_CB_INTOSC_LS_CLK		2
-#define AGILEX_L4_SYS_FREE_CLK		3
-#define AGILEX_F2S_FREE_CLK		4
-
-/* PLL clocks */
-#define AGILEX_MAIN_PLL_CLK		5
-#define AGILEX_MAIN_PLL_C0_CLK		6
-#define AGILEX_MAIN_PLL_C1_CLK		7
-#define AGILEX_MAIN_PLL_C2_CLK		8
-#define AGILEX_MAIN_PLL_C3_CLK		9
-#define AGILEX_PERIPH_PLL_CLK		10
-#define AGILEX_PERIPH_PLL_C0_CLK	11
-#define AGILEX_PERIPH_PLL_C1_CLK	12
-#define AGILEX_PERIPH_PLL_C2_CLK	13
-#define AGILEX_PERIPH_PLL_C3_CLK	14
-#define AGILEX_MPU_FREE_CLK		15
-#define AGILEX_MPU_CCU_CLK		16
-#define AGILEX_BOOT_CLK			17
-
-/* fixed factor clocks */
-#define AGILEX_L3_MAIN_FREE_CLK		18
-#define AGILEX_NOC_FREE_CLK		19
-#define AGILEX_S2F_USR0_CLK		20
-#define AGILEX_NOC_CLK			21
-#define AGILEX_EMAC_A_FREE_CLK		22
-#define AGILEX_EMAC_B_FREE_CLK		23
-#define AGILEX_EMAC_PTP_FREE_CLK	24
-#define AGILEX_GPIO_DB_FREE_CLK		25
-#define AGILEX_SDMMC_FREE_CLK		26
-#define AGILEX_S2F_USER0_FREE_CLK	27
-#define AGILEX_S2F_USER1_FREE_CLK	28
-#define AGILEX_PSI_REF_FREE_CLK		29
-
-/* Gate clocks */
-#define AGILEX_MPU_CLK			30
-#define AGILEX_MPU_PERIPH_CLK		31
-#define AGILEX_L4_MAIN_CLK		32
-#define AGILEX_L4_MP_CLK		33
-#define AGILEX_L4_SP_CLK		34
-#define AGILEX_CS_AT_CLK		35
-#define AGILEX_CS_TRACE_CLK		36
-#define AGILEX_CS_PDBG_CLK		37
-#define AGILEX_CS_TIMER_CLK		38
-#define AGILEX_S2F_USER0_CLK		39
-#define AGILEX_EMAC0_CLK		40
-#define AGILEX_EMAC1_CLK		41
-#define AGILEX_EMAC2_CLK		42
-#define AGILEX_EMAC_PTP_CLK		43
-#define AGILEX_GPIO_DB_CLK		44
-#define AGILEX_NAND_CLK			45
-#define AGILEX_PSI_REF_CLK		46
-#define AGILEX_S2F_USER1_CLK		47
-#define AGILEX_SDMMC_CLK		48
-#define AGILEX_SPI_M_CLK		49
-#define AGILEX_USB_CLK			50
-#define AGILEX_NAND_X_CLK		51
-#define AGILEX_NAND_ECC_CLK		52
-#define AGILEX_NUM_CLKS			53
-
-#endif	/* __AGILEX_CLOCK_H */
diff --git a/include/dt-bindings/clock/boston-clock.h b/include/dt-bindings/clock/boston-clock.h
deleted file mode 100644
index 0b3906247c8b..000000000000
--- a/include/dt-bindings/clock/boston-clock.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2016 Imagination Technologies
- */
-
-#ifndef __DT_BINDINGS_CLOCK_BOSTON_CLOCK_H__
-#define __DT_BINDINGS_CLOCK_BOSTON_CLOCK_H__
-
-#define BOSTON_CLK_SYS 0
-#define BOSTON_CLK_CPU 1
-
-#endif /* __DT_BINDINGS_CLOCK_BOSTON_CLOCK_H__ */
diff --git a/include/dt-bindings/clock/fsl,qoriq-clockgen.h b/include/dt-bindings/clock/fsl,qoriq-clockgen.h
deleted file mode 100644
index ddec7d0bdc7f..000000000000
--- a/include/dt-bindings/clock/fsl,qoriq-clockgen.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#ifndef DT_CLOCK_FSL_QORIQ_CLOCKGEN_H
-#define DT_CLOCK_FSL_QORIQ_CLOCKGEN_H
-
-#define QORIQ_CLK_SYSCLK	0
-#define QORIQ_CLK_CMUX		1
-#define QORIQ_CLK_HWACCEL	2
-#define QORIQ_CLK_FMAN		3
-#define QORIQ_CLK_PLATFORM_PLL	4
-#define QORIQ_CLK_CORECLK	5
-
-#define QORIQ_CLK_PLL_DIV(x)	((x) - 1)
-
-#endif /* DT_CLOCK_FSL_QORIQ_CLOCKGEN_H */
diff --git a/include/dt-bindings/clock/lpc32xx-clock.h b/include/dt-bindings/clock/lpc32xx-clock.h
deleted file mode 100644
index e624d3a52798..000000000000
--- a/include/dt-bindings/clock/lpc32xx-clock.h
+++ /dev/null
@@ -1,58 +0,0 @@
-/*
- * Copyright (c) 2015 Vladimir Zapolskiy <vz@mleia.com>
- *
- * This code is released using a dual license strategy: BSD/GPL
- * You can choose the licence that better fits your requirements.
- *
- * Released under the terms of 3-clause BSD License
- * Released under the terms of GNU General Public License Version 2.0
- *
- */
-
-#ifndef __DT_BINDINGS_LPC32XX_CLOCK_H
-#define __DT_BINDINGS_LPC32XX_CLOCK_H
-
-/* LPC32XX System Control Block clocks */
-#define LPC32XX_CLK_RTC		1
-#define LPC32XX_CLK_DMA		2
-#define LPC32XX_CLK_MLC		3
-#define LPC32XX_CLK_SLC		4
-#define LPC32XX_CLK_LCD		5
-#define LPC32XX_CLK_MAC		6
-#define LPC32XX_CLK_SD		7
-#define LPC32XX_CLK_DDRAM	8
-#define LPC32XX_CLK_SSP0	9
-#define LPC32XX_CLK_SSP1	10
-#define LPC32XX_CLK_UART3	11
-#define LPC32XX_CLK_UART4	12
-#define LPC32XX_CLK_UART5	13
-#define LPC32XX_CLK_UART6	14
-#define LPC32XX_CLK_IRDA	15
-#define LPC32XX_CLK_I2C1	16
-#define LPC32XX_CLK_I2C2	17
-#define LPC32XX_CLK_TIMER0	18
-#define LPC32XX_CLK_TIMER1	19
-#define LPC32XX_CLK_TIMER2	20
-#define LPC32XX_CLK_TIMER3	21
-#define LPC32XX_CLK_TIMER4	22
-#define LPC32XX_CLK_TIMER5	23
-#define LPC32XX_CLK_WDOG	24
-#define LPC32XX_CLK_I2S0	25
-#define LPC32XX_CLK_I2S1	26
-#define LPC32XX_CLK_SPI1	27
-#define LPC32XX_CLK_SPI2	28
-#define LPC32XX_CLK_MCPWM	29
-#define LPC32XX_CLK_HSTIMER	30
-#define LPC32XX_CLK_KEY		31
-#define LPC32XX_CLK_PWM1	32
-#define LPC32XX_CLK_PWM2	33
-#define LPC32XX_CLK_ADC		34
-#define LPC32XX_CLK_HCLK_PLL	35
-#define LPC32XX_CLK_PERIPH	36
-
-/* LPC32XX USB clocks */
-#define LPC32XX_USB_CLK_I2C	1
-#define LPC32XX_USB_CLK_DEVICE	2
-#define LPC32XX_USB_CLK_HOST	3
-
-#endif /* __DT_BINDINGS_LPC32XX_CLOCK_H */
diff --git a/include/dt-bindings/clock/maxim,max77802.h b/include/dt-bindings/clock/maxim,max77802.h
deleted file mode 100644
index 997312edcbb5..000000000000
--- a/include/dt-bindings/clock/maxim,max77802.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * Copyright (C) 2014 Google, Inc
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * Device Tree binding constants clocks for the Maxim 77802 PMIC.
- */
-
-#ifndef _DT_BINDINGS_CLOCK_MAXIM_MAX77802_CLOCK_H
-#define _DT_BINDINGS_CLOCK_MAXIM_MAX77802_CLOCK_H
-
-/* Fixed rate clocks. */
-
-#define MAX77802_CLK_32K_AP		0
-#define MAX77802_CLK_32K_CP		1
-
-/* Total number of clocks. */
-#define MAX77802_CLKS_NUM		(MAX77802_CLK_32K_CP + 1)
-
-#endif /* _DT_BINDINGS_CLOCK_MAXIM_MAX77802_CLOCK_H */
diff --git a/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h b/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
deleted file mode 100644
index 65e6bc4eeea0..000000000000
--- a/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
+++ /dev/null
@@ -1,46 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Nuvoton NPCM7xx Clock Generator binding
- * clock binding number for all clocks supportted by nuvoton,npcm7xx-clk
- *
- * Copyright (C) 2018 Nuvoton Technologies tali.perry@nuvoton.com
- *
- */
-
-#ifndef __DT_BINDINGS_CLOCK_NPCM7XX_H
-#define __DT_BINDINGS_CLOCK_NPCM7XX_H
-
-#define NPCM7XX_CLK_CPU		0
-#define NPCM7XX_CLK_GFX_PIXEL	1
-#define NPCM7XX_CLK_MC		2
-#define NPCM7XX_CLK_ADC		3
-#define NPCM7XX_CLK_AHB		4
-#define NPCM7XX_CLK_TIMER	5
-#define NPCM7XX_CLK_UART	6
-#define NPCM7XX_CLK_MMC		7
-#define NPCM7XX_CLK_SPI3	8
-#define NPCM7XX_CLK_PCI		9
-#define NPCM7XX_CLK_AXI		10
-#define NPCM7XX_CLK_APB4	11
-#define NPCM7XX_CLK_APB3	12
-#define NPCM7XX_CLK_APB2	13
-#define NPCM7XX_CLK_APB1	14
-#define NPCM7XX_CLK_APB5	15
-#define NPCM7XX_CLK_CLKOUT	16
-#define NPCM7XX_CLK_GFX		17
-#define NPCM7XX_CLK_SU		18
-#define NPCM7XX_CLK_SU48	19
-#define NPCM7XX_CLK_SDHC	20
-#define NPCM7XX_CLK_SPI0	21
-#define NPCM7XX_CLK_SPIX	22
-#define NPCM7XX_CLK_REFCLK	23
-#define NPCM7XX_CLK_SYSBYPCK	24
-#define NPCM7XX_CLK_MCBYPCK	25
-#define NPCM7XX_CLK_PLL0	26
-#define NPCM7XX_CLK_PLL1	27
-#define NPCM7XX_CLK_PLL2	28
-#define NPCM7XX_CLK_PLL2DIV2	29
-#define NPCM7XX_NUM_CLOCKS	(NPCM7XX_CLK_PLL2DIV2 + 1)
-
-#endif
-
diff --git a/include/dt-bindings/clock/rv1108-cru.h b/include/dt-bindings/clock/rv1108-cru.h
deleted file mode 100644
index 10ed9d140f4b..000000000000
--- a/include/dt-bindings/clock/rv1108-cru.h
+++ /dev/null
@@ -1,356 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Copyright (c) 2017 Rockchip Electronics Co. Ltd.
- * Author: Shawn Lin <shawn.lin@rock-chips.com>
- */
-
-#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RV1108_H
-#define _DT_BINDINGS_CLK_ROCKCHIP_RV1108_H
-
-/* pll id */
-#define PLL_APLL			0
-#define PLL_DPLL			1
-#define PLL_GPLL			2
-#define ARMCLK				3
-
-/* sclk gates (special clocks) */
-#define SCLK_SPI0			65
-#define SCLK_NANDC			67
-#define SCLK_SDMMC			68
-#define SCLK_SDIO			69
-#define SCLK_EMMC			71
-#define SCLK_UART0			72
-#define SCLK_UART1			73
-#define SCLK_UART2			74
-#define SCLK_I2S0			75
-#define SCLK_I2S1			76
-#define SCLK_I2S2			77
-#define SCLK_TIMER0			78
-#define SCLK_TIMER1			79
-#define SCLK_SFC			80
-#define SCLK_SDMMC_DRV			81
-#define SCLK_SDIO_DRV			82
-#define SCLK_EMMC_DRV			83
-#define SCLK_SDMMC_SAMPLE		84
-#define SCLK_SDIO_SAMPLE		85
-#define SCLK_EMMC_SAMPLE		86
-#define SCLK_VENC_CORE			87
-#define SCLK_HEVC_CORE			88
-#define SCLK_HEVC_CABAC			89
-#define SCLK_PWM0_PMU			90
-#define SCLK_I2C0_PMU			91
-#define SCLK_WIFI			92
-#define SCLK_CIFOUT			93
-#define SCLK_MIPI_CSI_OUT		94
-#define SCLK_CIF0			95
-#define SCLK_CIF1			96
-#define SCLK_CIF2			97
-#define SCLK_CIF3			98
-#define SCLK_DSP			99
-#define SCLK_DSP_IOP			100
-#define SCLK_DSP_EPP			101
-#define SCLK_DSP_EDP			102
-#define SCLK_DSP_EDAP			103
-#define SCLK_CVBS_HOST			104
-#define SCLK_HDMI_SFR			105
-#define SCLK_HDMI_CEC			106
-#define SCLK_CRYPTO			107
-#define SCLK_SPI			108
-#define SCLK_SARADC			109
-#define SCLK_TSADC			110
-#define SCLK_MAC_PRE			111
-#define SCLK_MAC			112
-#define SCLK_MAC_RX			113
-#define SCLK_MAC_REF			114
-#define SCLK_MAC_REFOUT			115
-#define SCLK_DSP_PFM			116
-#define SCLK_RGA			117
-#define SCLK_I2C1			118
-#define SCLK_I2C2			119
-#define SCLK_I2C3			120
-#define SCLK_PWM			121
-#define SCLK_ISP			122
-#define SCLK_USBPHY			123
-#define SCLK_I2S0_SRC			124
-#define SCLK_I2S1_SRC			125
-#define SCLK_I2S2_SRC			126
-#define SCLK_UART0_SRC			127
-#define SCLK_UART1_SRC			128
-#define SCLK_UART2_SRC			129
-#define SCLK_MAC_TX			130
-#define SCLK_MACREF			131
-#define SCLK_MACREF_OUT			132
-
-#define DCLK_VOP_SRC			185
-#define DCLK_HDMIPHY			186
-#define DCLK_VOP			187
-
-/* aclk gates */
-#define ACLK_DMAC			192
-#define ACLK_PRE			193
-#define ACLK_CORE			194
-#define ACLK_ENMCORE			195
-#define ACLK_RKVENC			196
-#define ACLK_RKVDEC			197
-#define ACLK_VPU			198
-#define ACLK_CIF0			199
-#define ACLK_VIO0			200
-#define ACLK_VIO1			201
-#define ACLK_VOP			202
-#define ACLK_IEP			203
-#define ACLK_RGA			204
-#define ACLK_ISP			205
-#define ACLK_CIF1			206
-#define ACLK_CIF2			207
-#define ACLK_CIF3			208
-#define ACLK_PERI			209
-#define ACLK_GMAC			210
-
-/* pclk gates */
-#define PCLK_GPIO1			256
-#define PCLK_GPIO2			257
-#define PCLK_GPIO3			258
-#define PCLK_GRF			259
-#define PCLK_I2C1			260
-#define PCLK_I2C2			261
-#define PCLK_I2C3			262
-#define PCLK_SPI			263
-#define PCLK_SFC			264
-#define PCLK_UART0			265
-#define PCLK_UART1			266
-#define PCLK_UART2			267
-#define PCLK_TSADC			268
-#define PCLK_PWM			269
-#define PCLK_TIMER			270
-#define PCLK_PERI			271
-#define PCLK_GPIO0_PMU			272
-#define PCLK_I2C0_PMU			273
-#define PCLK_PWM0_PMU			274
-#define PCLK_ISP			275
-#define PCLK_VIO			276
-#define PCLK_MIPI_DSI			277
-#define PCLK_HDMI_CTRL			278
-#define PCLK_SARADC			279
-#define PCLK_DSP_CFG			280
-#define PCLK_BUS			281
-#define PCLK_EFUSE0			282
-#define PCLK_EFUSE1			283
-#define PCLK_WDT			284
-#define PCLK_GMAC			285
-
-/* hclk gates */
-#define HCLK_I2S0_8CH			320
-#define HCLK_I2S1_2CH			321
-#define HCLK_I2S2_2CH			322
-#define HCLK_NANDC			323
-#define HCLK_SDMMC			324
-#define HCLK_SDIO			325
-#define HCLK_EMMC			326
-#define HCLK_PERI			327
-#define HCLK_SFC			328
-#define HCLK_RKVENC			329
-#define HCLK_RKVDEC			330
-#define HCLK_CIF0			331
-#define HCLK_VIO			332
-#define HCLK_VOP			333
-#define HCLK_IEP			334
-#define HCLK_RGA			335
-#define HCLK_ISP			336
-#define HCLK_CRYPTO_MST			337
-#define HCLK_CRYPTO_SLV			338
-#define HCLK_HOST0			339
-#define HCLK_OTG			340
-#define HCLK_CIF1			341
-#define HCLK_CIF2			342
-#define HCLK_CIF3			343
-#define HCLK_BUS			344
-#define HCLK_VPU			345
-
-#define CLK_NR_CLKS			(HCLK_VPU + 1)
-
-/* reset id */
-#define SRST_CORE_PO_AD			0
-#define SRST_CORE_AD			1
-#define SRST_L2_AD			2
-#define SRST_CPU_NIU_AD			3
-#define SRST_CORE_PO			4
-#define SRST_CORE			5
-#define SRST_L2				6
-#define SRST_CORE_DBG			8
-#define PRST_DBG			9
-#define RST_DAP				10
-#define PRST_DBG_NIU			11
-#define ARST_STRC_SYS_AD		15
-
-#define SRST_DDRPHY_CLKDIV		16
-#define SRST_DDRPHY			17
-#define PRST_DDRPHY			18
-#define PRST_HDMIPHY			19
-#define PRST_VDACPHY			20
-#define PRST_VADCPHY			21
-#define PRST_MIPI_CSI_PHY		22
-#define PRST_MIPI_DSI_PHY		23
-#define PRST_ACODEC			24
-#define ARST_BUS_NIU			25
-#define PRST_TOP_NIU			26
-#define ARST_INTMEM			27
-#define HRST_ROM			28
-#define ARST_DMAC			29
-#define SRST_MSCH_NIU			30
-#define PRST_MSCH_NIU			31
-
-#define PRST_DDRUPCTL			32
-#define NRST_DDRUPCTL			33
-#define PRST_DDRMON			34
-#define HRST_I2S0_8CH			35
-#define MRST_I2S0_8CH			36
-#define HRST_I2S1_2CH			37
-#define MRST_IS21_2CH			38
-#define HRST_I2S2_2CH			39
-#define MRST_I2S2_2CH			40
-#define HRST_CRYPTO			41
-#define SRST_CRYPTO			42
-#define PRST_SPI			43
-#define SRST_SPI			44
-#define PRST_UART0			45
-#define PRST_UART1			46
-#define PRST_UART2			47
-
-#define SRST_UART0			48
-#define SRST_UART1			49
-#define SRST_UART2			50
-#define PRST_I2C1			51
-#define PRST_I2C2			52
-#define PRST_I2C3			53
-#define SRST_I2C1			54
-#define SRST_I2C2			55
-#define SRST_I2C3			56
-#define PRST_PWM1			58
-#define SRST_PWM1			60
-#define PRST_WDT			61
-#define PRST_GPIO1			62
-#define PRST_GPIO2			63
-
-#define PRST_GPIO3			64
-#define PRST_GRF			65
-#define PRST_EFUSE			66
-#define PRST_EFUSE512			67
-#define PRST_TIMER0			68
-#define SRST_TIMER0			69
-#define SRST_TIMER1			70
-#define PRST_TSADC			71
-#define SRST_TSADC			72
-#define PRST_SARADC			73
-#define SRST_SARADC			74
-#define HRST_SYSBUS			75
-#define PRST_USBGRF			76
-
-#define ARST_PERIPH_NIU			80
-#define HRST_PERIPH_NIU			81
-#define PRST_PERIPH_NIU			82
-#define HRST_PERIPH			83
-#define HRST_SDMMC			84
-#define HRST_SDIO			85
-#define HRST_EMMC			86
-#define HRST_NANDC			87
-#define NRST_NANDC			88
-#define HRST_SFC			89
-#define SRST_SFC			90
-#define ARST_GMAC			91
-#define HRST_OTG			92
-#define SRST_OTG			93
-#define SRST_OTG_ADP			94
-#define HRST_HOST0			95
-
-#define HRST_HOST0_AUX			96
-#define HRST_HOST0_ARB			97
-#define SRST_HOST0_EHCIPHY		98
-#define SRST_HOST0_UTMI			99
-#define SRST_USBPOR			100
-#define SRST_UTMI0			101
-#define SRST_UTMI1			102
-
-#define ARST_VIO0_NIU			102
-#define ARST_VIO1_NIU			103
-#define HRST_VIO_NIU			104
-#define PRST_VIO_NIU			105
-#define ARST_VOP			106
-#define HRST_VOP			107
-#define DRST_VOP			108
-#define ARST_IEP			109
-#define HRST_IEP			110
-#define ARST_RGA			111
-#define HRST_RGA			112
-#define SRST_RGA			113
-#define PRST_CVBS			114
-#define PRST_HDMI			115
-#define SRST_HDMI			116
-#define PRST_MIPI_DSI			117
-
-#define ARST_ISP_NIU			118
-#define HRST_ISP_NIU			119
-#define HRST_ISP			120
-#define SRST_ISP			121
-#define ARST_VIP0			122
-#define HRST_VIP0			123
-#define PRST_VIP0			124
-#define ARST_VIP1			125
-#define HRST_VIP1			126
-#define PRST_VIP1			127
-#define ARST_VIP2			128
-#define HRST_VIP2			129
-#define PRST_VIP2			120
-#define ARST_VIP3			121
-#define HRST_VIP3			122
-#define PRST_VIP4			123
-
-#define PRST_CIF1TO4			124
-#define SRST_CVBS_CLK			125
-#define HRST_CVBS			126
-
-#define ARST_VPU_NIU			140
-#define HRST_VPU_NIU			141
-#define ARST_VPU			142
-#define HRST_VPU			143
-#define ARST_RKVDEC_NIU			144
-#define HRST_RKVDEC_NIU			145
-#define ARST_RKVDEC			146
-#define HRST_RKVDEC			147
-#define SRST_RKVDEC_CABAC		148
-#define SRST_RKVDEC_CORE		149
-#define ARST_RKVENC_NIU			150
-#define HRST_RKVENC_NIU			151
-#define ARST_RKVENC			152
-#define HRST_RKVENC			153
-#define SRST_RKVENC_CORE		154
-
-#define SRST_DSP_CORE			156
-#define SRST_DSP_SYS			157
-#define SRST_DSP_GLOBAL			158
-#define SRST_DSP_OECM			159
-#define PRST_DSP_IOP_NIU		160
-#define ARST_DSP_EPP_NIU		161
-#define ARST_DSP_EDP_NIU		162
-#define PRST_DSP_DBG_NIU		163
-#define PRST_DSP_CFG_NIU		164
-#define PRST_DSP_GRF			165
-#define PRST_DSP_MAILBOX		166
-#define PRST_DSP_INTC			167
-#define PRST_DSP_PFM_MON		169
-#define SRST_DSP_PFM_MON		170
-#define ARST_DSP_EDAP_NIU		171
-
-#define SRST_PMU			172
-#define SRST_PMU_I2C0			173
-#define PRST_PMU_I2C0			174
-#define PRST_PMU_GPIO0			175
-#define PRST_PMU_INTMEM			176
-#define PRST_PMU_PWM0			177
-#define SRST_PMU_PWM0			178
-#define PRST_PMU_GRF			179
-#define SRST_PMU_NIU			180
-#define SRST_PMU_PVTM			181
-#define ARST_DSP_EDP_PERF		184
-#define ARST_DSP_EPP_PERF		185
-
-#endif /* _DT_BINDINGS_CLK_ROCKCHIP_RV1108_H */
diff --git a/include/dt-bindings/clock/versaclock.h b/include/dt-bindings/clock/versaclock.h
deleted file mode 100644
index c6a6a0946564..000000000000
--- a/include/dt-bindings/clock/versaclock.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-/* This file defines field values used by the versaclock 6 family
- * for defining output type
- */
-
-#define VC5_LVPECL	0
-#define VC5_CMOS	1
-#define VC5_HCSL33	2
-#define VC5_LVDS	3
-#define VC5_CMOS2	4
-#define VC5_CMOSD	5
-#define VC5_HCSL25	6
diff --git a/include/dt-bindings/clock/vf610-clock.h b/include/dt-bindings/clock/vf610-clock.h
deleted file mode 100644
index 373644e46747..000000000000
--- a/include/dt-bindings/clock/vf610-clock.h
+++ /dev/null
@@ -1,202 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright 2013 Freescale Semiconductor, Inc.
- */
-
-#ifndef __DT_BINDINGS_CLOCK_VF610_H
-#define __DT_BINDINGS_CLOCK_VF610_H
-
-#define VF610_CLK_DUMMY			0
-#define VF610_CLK_SIRC_128K		1
-#define VF610_CLK_SIRC_32K		2
-#define VF610_CLK_FIRC			3
-#define VF610_CLK_SXOSC			4
-#define VF610_CLK_FXOSC			5
-#define VF610_CLK_FXOSC_HALF		6
-#define VF610_CLK_SLOW_CLK_SEL		7
-#define VF610_CLK_FASK_CLK_SEL		8
-#define VF610_CLK_AUDIO_EXT		9
-#define VF610_CLK_ENET_EXT		10
-#define VF610_CLK_PLL1_SYS		11
-#define VF610_CLK_PLL1_PFD1		12
-#define VF610_CLK_PLL1_PFD2		13
-#define VF610_CLK_PLL1_PFD3		14
-#define VF610_CLK_PLL1_PFD4		15
-#define VF610_CLK_PLL2_BUS		16
-#define VF610_CLK_PLL2_PFD1		17
-#define VF610_CLK_PLL2_PFD2		18
-#define VF610_CLK_PLL2_PFD3		19
-#define VF610_CLK_PLL2_PFD4		20
-#define VF610_CLK_PLL3_USB_OTG		21
-#define VF610_CLK_PLL3_PFD1		22
-#define VF610_CLK_PLL3_PFD2		23
-#define VF610_CLK_PLL3_PFD3		24
-#define VF610_CLK_PLL3_PFD4		25
-#define VF610_CLK_PLL4_AUDIO		26
-#define VF610_CLK_PLL5_ENET		27
-#define VF610_CLK_PLL6_VIDEO		28
-#define VF610_CLK_PLL3_MAIN_DIV		29
-#define VF610_CLK_PLL4_MAIN_DIV		30
-#define VF610_CLK_PLL6_MAIN_DIV		31
-#define VF610_CLK_PLL1_PFD_SEL		32
-#define VF610_CLK_PLL2_PFD_SEL		33
-#define VF610_CLK_SYS_SEL		34
-#define VF610_CLK_DDR_SEL		35
-#define VF610_CLK_SYS_BUS		36
-#define VF610_CLK_PLATFORM_BUS		37
-#define VF610_CLK_IPG_BUS		38
-#define VF610_CLK_UART0			39
-#define VF610_CLK_UART1			40
-#define VF610_CLK_UART2			41
-#define VF610_CLK_UART3			42
-#define VF610_CLK_UART4			43
-#define VF610_CLK_UART5			44
-#define VF610_CLK_PIT			45
-#define VF610_CLK_I2C0			46
-#define VF610_CLK_I2C1			47
-#define VF610_CLK_I2C2			48
-#define VF610_CLK_I2C3			49
-#define VF610_CLK_FTM0_EXT_SEL		50
-#define VF610_CLK_FTM0_FIX_SEL		51
-#define VF610_CLK_FTM0_EXT_FIX_EN	52
-#define VF610_CLK_FTM1_EXT_SEL		53
-#define VF610_CLK_FTM1_FIX_SEL		54
-#define VF610_CLK_FTM1_EXT_FIX_EN	55
-#define VF610_CLK_FTM2_EXT_SEL		56
-#define VF610_CLK_FTM2_FIX_SEL		57
-#define VF610_CLK_FTM2_EXT_FIX_EN	58
-#define VF610_CLK_FTM3_EXT_SEL		59
-#define VF610_CLK_FTM3_FIX_SEL		60
-#define VF610_CLK_FTM3_EXT_FIX_EN	61
-#define VF610_CLK_FTM0			62
-#define VF610_CLK_FTM1			63
-#define VF610_CLK_FTM2			64
-#define VF610_CLK_FTM3			65
-#define VF610_CLK_ENET_50M		66
-#define VF610_CLK_ENET_25M		67
-#define VF610_CLK_ENET_SEL		68
-#define VF610_CLK_ENET			69
-#define VF610_CLK_ENET_TS_SEL		70
-#define VF610_CLK_ENET_TS		71
-#define VF610_CLK_DSPI0			72
-#define VF610_CLK_DSPI1			73
-#define VF610_CLK_DSPI2			74
-#define VF610_CLK_DSPI3			75
-#define VF610_CLK_WDT			76
-#define VF610_CLK_ESDHC0_SEL		77
-#define VF610_CLK_ESDHC0_EN		78
-#define VF610_CLK_ESDHC0_DIV		79
-#define VF610_CLK_ESDHC0		80
-#define VF610_CLK_ESDHC1_SEL		81
-#define VF610_CLK_ESDHC1_EN		82
-#define VF610_CLK_ESDHC1_DIV		83
-#define VF610_CLK_ESDHC1		84
-#define VF610_CLK_DCU0_SEL		85
-#define VF610_CLK_DCU0_EN		86
-#define VF610_CLK_DCU0_DIV		87
-#define VF610_CLK_DCU0			88
-#define VF610_CLK_DCU1_SEL		89
-#define VF610_CLK_DCU1_EN		90
-#define VF610_CLK_DCU1_DIV		91
-#define VF610_CLK_DCU1			92
-#define VF610_CLK_ESAI_SEL		93
-#define VF610_CLK_ESAI_EN		94
-#define VF610_CLK_ESAI_DIV		95
-#define VF610_CLK_ESAI			96
-#define VF610_CLK_SAI0_SEL		97
-#define VF610_CLK_SAI0_EN		98
-#define VF610_CLK_SAI0_DIV		99
-#define VF610_CLK_SAI0			100
-#define VF610_CLK_SAI1_SEL		101
-#define VF610_CLK_SAI1_EN		102
-#define VF610_CLK_SAI1_DIV		103
-#define VF610_CLK_SAI1			104
-#define VF610_CLK_SAI2_SEL		105
-#define VF610_CLK_SAI2_EN		106
-#define VF610_CLK_SAI2_DIV		107
-#define VF610_CLK_SAI2			108
-#define VF610_CLK_SAI3_SEL		109
-#define VF610_CLK_SAI3_EN		110
-#define VF610_CLK_SAI3_DIV		111
-#define VF610_CLK_SAI3			112
-#define VF610_CLK_USBC0			113
-#define VF610_CLK_USBC1			114
-#define VF610_CLK_QSPI0_SEL		115
-#define VF610_CLK_QSPI0_EN		116
-#define VF610_CLK_QSPI0_X4_DIV		117
-#define VF610_CLK_QSPI0_X2_DIV		118
-#define VF610_CLK_QSPI0_X1_DIV		119
-#define VF610_CLK_QSPI1_SEL		120
-#define VF610_CLK_QSPI1_EN		121
-#define VF610_CLK_QSPI1_X4_DIV		122
-#define VF610_CLK_QSPI1_X2_DIV		123
-#define VF610_CLK_QSPI1_X1_DIV		124
-#define VF610_CLK_QSPI0			125
-#define VF610_CLK_QSPI1			126
-#define VF610_CLK_NFC_SEL		127
-#define VF610_CLK_NFC_EN		128
-#define VF610_CLK_NFC_PRE_DIV		129
-#define VF610_CLK_NFC_FRAC_DIV		130
-#define VF610_CLK_NFC_INV		131
-#define VF610_CLK_NFC			132
-#define VF610_CLK_VADC_SEL		133
-#define VF610_CLK_VADC_EN		134
-#define VF610_CLK_VADC_DIV		135
-#define VF610_CLK_VADC_DIV_HALF		136
-#define VF610_CLK_VADC			137
-#define VF610_CLK_ADC0			138
-#define VF610_CLK_ADC1			139
-#define VF610_CLK_DAC0			140
-#define VF610_CLK_DAC1			141
-#define VF610_CLK_FLEXCAN0		142
-#define VF610_CLK_FLEXCAN1		143
-#define VF610_CLK_ASRC			144
-#define VF610_CLK_GPU_SEL		145
-#define VF610_CLK_GPU_EN		146
-#define VF610_CLK_GPU2D			147
-#define VF610_CLK_ENET0			148
-#define VF610_CLK_ENET1			149
-#define VF610_CLK_DMAMUX0		150
-#define VF610_CLK_DMAMUX1		151
-#define VF610_CLK_DMAMUX2		152
-#define VF610_CLK_DMAMUX3		153
-#define VF610_CLK_FLEXCAN0_EN		154
-#define VF610_CLK_FLEXCAN1_EN		155
-#define VF610_CLK_PLL7_USB_HOST		156
-#define VF610_CLK_USBPHY0		157
-#define VF610_CLK_USBPHY1		158
-#define VF610_CLK_LVDS1_IN		159
-#define VF610_CLK_ANACLK1		160
-#define VF610_CLK_PLL1_BYPASS_SRC	161
-#define VF610_CLK_PLL2_BYPASS_SRC	162
-#define VF610_CLK_PLL3_BYPASS_SRC	163
-#define VF610_CLK_PLL4_BYPASS_SRC	164
-#define VF610_CLK_PLL5_BYPASS_SRC	165
-#define VF610_CLK_PLL6_BYPASS_SRC	166
-#define VF610_CLK_PLL7_BYPASS_SRC	167
-#define VF610_CLK_PLL1			168
-#define VF610_CLK_PLL2			169
-#define VF610_CLK_PLL3			170
-#define VF610_CLK_PLL4			171
-#define VF610_CLK_PLL5			172
-#define VF610_CLK_PLL6			173
-#define VF610_CLK_PLL7			174
-#define VF610_PLL1_BYPASS		175
-#define VF610_PLL2_BYPASS		176
-#define VF610_PLL3_BYPASS		177
-#define VF610_PLL4_BYPASS		178
-#define VF610_PLL5_BYPASS		179
-#define VF610_PLL6_BYPASS		180
-#define VF610_PLL7_BYPASS		181
-#define VF610_CLK_SNVS			182
-#define VF610_CLK_DAP			183
-#define VF610_CLK_OCOTP			184
-#define VF610_CLK_DDRMC			185
-#define VF610_CLK_WKPU			186
-#define VF610_CLK_TCON0			187
-#define VF610_CLK_TCON1			188
-#define VF610_CLK_CAAM			189
-#define VF610_CLK_CRC			190
-#define VF610_CLK_END			191
-
-#endif /* __DT_BINDINGS_CLOCK_VF610_H */

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
