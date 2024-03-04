Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14481871899
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Mar 2024 09:51:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3526C6DD6B;
	Tue,  5 Mar 2024 08:51:46 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 361A3C6DD6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 16:51:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-412e6bdd454so5618655e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 08:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709571089; x=1710175889;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tkvabzrOo3HALcndOtfv6lyTl/sy+4d96fF0aB5O7Xk=;
 b=U8Nk4ufYghOwX9U0b1xpVN6pDLybFSBqAt5Hg0pZZL3OmToU10sQ+G/Rfl9/yZ2PzZ
 +B0W0kMYO77BeFjqX09DuRMCa4ezaM5FVfz5bfFV3MXID7uJocPK2GEWC6SpyMc4NZq6
 cFcpiAb7rMziOjQQrHsgcLBpy+kPALVdgmUIeEO8eq6VFNMN9iqdK1EflPxQDpZH/tA2
 pwMSSi1CYv32WyiKY8okNUJWH2C944jdb4/LazVYgOmPYq9+8k/BWTAgXHkrRCc4p6+E
 u/vsnOMcskfOTEFEsRUjUSvglZD+rnHhXSUNxYf4Vay1KHI/8+ywqf1l6dU8yR1seos9
 vJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571089; x=1710175889;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tkvabzrOo3HALcndOtfv6lyTl/sy+4d96fF0aB5O7Xk=;
 b=ubXrXSf+Caix9pTzrRNGSLjSvp+HLWQYkAGzjQnZ2uxFJ8AckLwlDCoQ/l6jEHRTUP
 r/v1tpU2N+wvy4UvlvWZI7Ha4dmCX5BORb02tjfPeEaOESFDBAjwzuCKE11amKHjeFSb
 IzsUdjOpZUGDZGP8JnBNqJkjCwgJk4i1XsYqYeaUDbLyxiJ86cc3iT4O78vKdhrIVvQh
 5lnJ1W+yTbzI894CZcBwhyummmE3GQR2CpSWnoWR6lAn0NDLBQcjBywKqwzVrRV4OVl/
 CiPFTioYflNmGh0kSh/9YjVz4dR3/2la2MwETmRveqiHKMH7diw5rFQIyWfUShUfeUJ3
 lLqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu3pjIkedajmp9XcabyniOxfLLO2KewPcEQ+FsDUTbP8gkcn/n/op6yeYDAMwEtGVKhOr9Z3GTH6SyWNPw3+ioLYCx7MiXgXZfqFEBi8ImIuFb/4WLwt3m
X-Gm-Message-State: AOJu0Yyno0WyMTHoxGDZVGPDsECe1veFtOcXeX5LD2BFrNlNqGJnfYZo
 50XwmGfoQBg+gB04pFa44tptHSYjBIVj2nk0TX1jQjDwyGiAOPrGvKGJ1sjJ458=
X-Google-Smtp-Source: AGHT+IFZT+mma64qkhMLZlqQNo+v7hQWe7o3Dlf0306JN2RxqQccKmy59bv+8jf3dtf3SdcJH6VB2Q==
X-Received: by 2002:a05:600c:19d4:b0:412:b7a6:72bf with SMTP id
 u20-20020a05600c19d400b00412b7a672bfmr7836993wmq.3.1709571087898; 
 Mon, 04 Mar 2024 08:51:27 -0800 (PST)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm10598517wmq.6.2024.03.04.08.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:51:27 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Mon, 04 Mar 2024 16:51:11 +0000
MIME-Version: 1.0
Message-Id: <20240304-b4-upstream-dt-headers-v1-3-b7ff41925f92@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=82352;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=SozRX0oNkjcJ3cjGZ6WF9HFZRzjrmczHegHNJNuDK98=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtSnf9hCHxV/6ZGqPb/86MVkBz67P4WSWddjEkuMhSY8v
 hK3Iimto5SFQZCDQVZMkUX8xDLLprWX7TW2L7gAM4eVCWQIAxenAExkVRrD/9CT65KWJPDcnaCv
 wJWs94Dfe93nZI1t30uyLwatb3t+S5jhD/cldU/m1odV85ZH5eWdeCGxhVtlUV3q+wXFeXvVGzV
 X+AMA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Mailman-Approved-At: Tue, 05 Mar 2024 08:51:45 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH RFC 03/26] sunxi: drop clock dt-binding headers
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
 include/dt-bindings/clock/sun20i-d1-ccu.h     | 158 --------------------
 include/dt-bindings/clock/sun20i-d1-r-ccu.h   |  19 ---
 include/dt-bindings/clock/sun4i-a10-ccu.h     | 202 --------------------------
 include/dt-bindings/clock/sun4i-a10-pll2.h    |  53 -------
 include/dt-bindings/clock/sun50i-a64-ccu.h    | 138 ------------------
 include/dt-bindings/clock/sun50i-h6-ccu.h     | 125 ----------------
 include/dt-bindings/clock/sun50i-h6-r-ccu.h   |  27 ----
 include/dt-bindings/clock/sun50i-h616-ccu.h   | 116 ---------------
 include/dt-bindings/clock/sun5i-ccu.h         |  97 -------------
 include/dt-bindings/clock/sun6i-a31-ccu.h     | 193 ------------------------
 include/dt-bindings/clock/sun6i-rtc.h         |  10 --
 include/dt-bindings/clock/sun7i-a20-ccu.h     |  53 -------
 include/dt-bindings/clock/sun8i-a23-a33-ccu.h | 129 ----------------
 include/dt-bindings/clock/sun8i-a83t-ccu.h    | 140 ------------------
 include/dt-bindings/clock/sun8i-de2.h         |  21 ---
 include/dt-bindings/clock/sun8i-h3-ccu.h      | 152 -------------------
 include/dt-bindings/clock/sun8i-r-ccu.h       |  59 --------
 include/dt-bindings/clock/sun8i-r40-ccu.h     | 191 ------------------------
 include/dt-bindings/clock/sun8i-tcon-top.h    |  11 --
 include/dt-bindings/clock/sun8i-v3s-ccu.h     | 111 --------------
 include/dt-bindings/clock/sun9i-a80-ccu.h     | 162 ---------------------
 include/dt-bindings/clock/sun9i-a80-de.h      |  80 ----------
 include/dt-bindings/clock/sun9i-a80-usb.h     |  59 --------
 include/dt-bindings/clock/suniv-ccu-f1c100s.h |  72 ---------
 24 files changed, 2378 deletions(-)

diff --git a/include/dt-bindings/clock/sun20i-d1-ccu.h b/include/dt-bindings/clock/sun20i-d1-ccu.h
deleted file mode 100644
index fdbfb404f92a..000000000000
--- a/include/dt-bindings/clock/sun20i-d1-ccu.h
+++ /dev/null
@@ -1,158 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (C) 2020 huangzhenwei@allwinnertech.com
- * Copyright (C) 2021 Samuel Holland <samuel@sholland.org>
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN20I_D1_CCU_H_
-#define _DT_BINDINGS_CLK_SUN20I_D1_CCU_H_
-
-#define CLK_PLL_CPUX		0
-#define CLK_PLL_DDR0		1
-#define CLK_PLL_PERIPH0_4X	2
-#define CLK_PLL_PERIPH0_2X	3
-#define CLK_PLL_PERIPH0_800M	4
-#define CLK_PLL_PERIPH0		5
-#define CLK_PLL_PERIPH0_DIV3	6
-#define CLK_PLL_VIDEO0_4X	7
-#define CLK_PLL_VIDEO0_2X	8
-#define CLK_PLL_VIDEO0		9
-#define CLK_PLL_VIDEO1_4X	10
-#define CLK_PLL_VIDEO1_2X	11
-#define CLK_PLL_VIDEO1		12
-#define CLK_PLL_VE		13
-#define CLK_PLL_AUDIO0_4X	14
-#define CLK_PLL_AUDIO0_2X	15
-#define CLK_PLL_AUDIO0		16
-#define CLK_PLL_AUDIO1		17
-#define CLK_PLL_AUDIO1_DIV2	18
-#define CLK_PLL_AUDIO1_DIV5	19
-#define CLK_CPUX		20
-#define CLK_CPUX_AXI		21
-#define CLK_CPUX_APB		22
-#define CLK_PSI_AHB		23
-#define CLK_APB0		24
-#define CLK_APB1		25
-#define CLK_MBUS		26
-#define CLK_DE			27
-#define CLK_BUS_DE		28
-#define CLK_DI			29
-#define CLK_BUS_DI		30
-#define CLK_G2D			31
-#define CLK_BUS_G2D		32
-#define CLK_CE			33
-#define CLK_BUS_CE		34
-#define CLK_VE			35
-#define CLK_BUS_VE		36
-#define CLK_BUS_DMA		37
-#define CLK_BUS_MSGBOX0		38
-#define CLK_BUS_MSGBOX1		39
-#define CLK_BUS_MSGBOX2		40
-#define CLK_BUS_SPINLOCK	41
-#define CLK_BUS_HSTIMER		42
-#define CLK_AVS			43
-#define CLK_BUS_DBG		44
-#define CLK_BUS_PWM		45
-#define CLK_BUS_IOMMU		46
-#define CLK_DRAM		47
-#define CLK_MBUS_DMA		48
-#define CLK_MBUS_VE		49
-#define CLK_MBUS_CE		50
-#define CLK_MBUS_TVIN		51
-#define CLK_MBUS_CSI		52
-#define CLK_MBUS_G2D		53
-#define CLK_MBUS_RISCV		54
-#define CLK_BUS_DRAM		55
-#define CLK_MMC0		56
-#define CLK_MMC1		57
-#define CLK_MMC2		58
-#define CLK_BUS_MMC0		59
-#define CLK_BUS_MMC1		60
-#define CLK_BUS_MMC2		61
-#define CLK_BUS_UART0		62
-#define CLK_BUS_UART1		63
-#define CLK_BUS_UART2		64
-#define CLK_BUS_UART3		65
-#define CLK_BUS_UART4		66
-#define CLK_BUS_UART5		67
-#define CLK_BUS_I2C0		68
-#define CLK_BUS_I2C1		69
-#define CLK_BUS_I2C2		70
-#define CLK_BUS_I2C3		71
-#define CLK_SPI0		72
-#define CLK_SPI1		73
-#define CLK_BUS_SPI0		74
-#define CLK_BUS_SPI1		75
-#define CLK_EMAC_25M		76
-#define CLK_BUS_EMAC		77
-#define CLK_IR_TX		78
-#define CLK_BUS_IR_TX		79
-#define CLK_BUS_GPADC		80
-#define CLK_BUS_THS		81
-#define CLK_I2S0		82
-#define CLK_I2S1		83
-#define CLK_I2S2		84
-#define CLK_I2S2_ASRC		85
-#define CLK_BUS_I2S0		86
-#define CLK_BUS_I2S1		87
-#define CLK_BUS_I2S2		88
-#define CLK_SPDIF_TX		89
-#define CLK_SPDIF_RX		90
-#define CLK_BUS_SPDIF		91
-#define CLK_DMIC		92
-#define CLK_BUS_DMIC		93
-#define CLK_AUDIO_DAC		94
-#define CLK_AUDIO_ADC		95
-#define CLK_BUS_AUDIO		96
-#define CLK_USB_OHCI0		97
-#define CLK_USB_OHCI1		98
-#define CLK_BUS_OHCI0		99
-#define CLK_BUS_OHCI1		100
-#define CLK_BUS_EHCI0		101
-#define CLK_BUS_EHCI1		102
-#define CLK_BUS_OTG		103
-#define CLK_BUS_LRADC		104
-#define CLK_BUS_DPSS_TOP	105
-#define CLK_HDMI_24M		106
-#define CLK_HDMI_CEC_32K	107
-#define CLK_HDMI_CEC		108
-#define CLK_BUS_HDMI		109
-#define CLK_MIPI_DSI		110
-#define CLK_BUS_MIPI_DSI	111
-#define CLK_TCON_LCD0		112
-#define CLK_BUS_TCON_LCD0	113
-#define CLK_TCON_TV		114
-#define CLK_BUS_TCON_TV		115
-#define CLK_TVE			116
-#define CLK_BUS_TVE_TOP		117
-#define CLK_BUS_TVE		118
-#define CLK_TVD			119
-#define CLK_BUS_TVD_TOP		120
-#define CLK_BUS_TVD		121
-#define CLK_LEDC		122
-#define CLK_BUS_LEDC		123
-#define CLK_CSI_TOP		124
-#define CLK_CSI_MCLK		125
-#define CLK_BUS_CSI		126
-#define CLK_TPADC		127
-#define CLK_BUS_TPADC		128
-#define CLK_BUS_TZMA		129
-#define CLK_DSP			130
-#define CLK_BUS_DSP_CFG		131
-#define CLK_RISCV		132
-#define CLK_RISCV_AXI		133
-#define CLK_BUS_RISCV_CFG	134
-#define CLK_FANOUT_24M		135
-#define CLK_FANOUT_12M		136
-#define CLK_FANOUT_16M		137
-#define CLK_FANOUT_25M		138
-#define CLK_FANOUT_32K		139
-#define CLK_FANOUT_27M		140
-#define CLK_FANOUT_PCLK		141
-#define CLK_FANOUT0		142
-#define CLK_FANOUT1		143
-#define CLK_FANOUT2		144
-#define CLK_BUS_CAN0		145
-#define CLK_BUS_CAN1		146
-
-#endif /* _DT_BINDINGS_CLK_SUN20I_D1_CCU_H_ */
diff --git a/include/dt-bindings/clock/sun20i-d1-r-ccu.h b/include/dt-bindings/clock/sun20i-d1-r-ccu.h
deleted file mode 100644
index f95c170711e5..000000000000
--- a/include/dt-bindings/clock/sun20i-d1-r-ccu.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (C) 2021 Samuel Holland <samuel@sholland.org>
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN20I_D1_R_CCU_H_
-#define _DT_BINDINGS_CLK_SUN20I_D1_R_CCU_H_
-
-#define CLK_R_AHB		0
-
-#define CLK_BUS_R_TIMER		2
-#define CLK_BUS_R_TWD		3
-#define CLK_BUS_R_PPU		4
-#define CLK_R_IR_RX		5
-#define CLK_BUS_R_IR_RX		6
-#define CLK_BUS_R_RTC		7
-#define CLK_BUS_R_CPUCFG	8
-
-#endif /* _DT_BINDINGS_CLK_SUN20I_D1_R_CCU_H_ */
diff --git a/include/dt-bindings/clock/sun4i-a10-ccu.h b/include/dt-bindings/clock/sun4i-a10-ccu.h
deleted file mode 100644
index e4fa61be5c75..000000000000
--- a/include/dt-bindings/clock/sun4i-a10-ccu.h
+++ /dev/null
@@ -1,202 +0,0 @@
-/*
- * Copyright (C) 2017 Priit Laes <plaes@plaes.org>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN4I_A10_H_
-#define _DT_BINDINGS_CLK_SUN4I_A10_H_
-
-#define CLK_HOSC		1
-#define CLK_PLL_VIDEO0_2X	9
-#define CLK_PLL_VIDEO1_2X	18
-#define CLK_CPU			20
-
-/* AHB Gates */
-#define CLK_AHB_OTG		26
-#define CLK_AHB_EHCI0		27
-#define CLK_AHB_OHCI0		28
-#define CLK_AHB_EHCI1		29
-#define CLK_AHB_OHCI1		30
-#define CLK_AHB_SS		31
-#define CLK_AHB_DMA		32
-#define CLK_AHB_BIST		33
-#define CLK_AHB_MMC0		34
-#define CLK_AHB_MMC1		35
-#define CLK_AHB_MMC2		36
-#define CLK_AHB_MMC3		37
-#define CLK_AHB_MS		38
-#define CLK_AHB_NAND		39
-#define CLK_AHB_SDRAM		40
-#define CLK_AHB_ACE		41
-#define CLK_AHB_EMAC		42
-#define CLK_AHB_TS		43
-#define CLK_AHB_SPI0		44
-#define CLK_AHB_SPI1		45
-#define CLK_AHB_SPI2		46
-#define CLK_AHB_SPI3		47
-#define CLK_AHB_PATA		48
-#define CLK_AHB_SATA		49
-#define CLK_AHB_GPS		50
-#define CLK_AHB_HSTIMER		51
-#define CLK_AHB_VE		52
-#define CLK_AHB_TVD		53
-#define CLK_AHB_TVE0		54
-#define CLK_AHB_TVE1		55
-#define CLK_AHB_LCD0		56
-#define CLK_AHB_LCD1		57
-#define CLK_AHB_CSI0		58
-#define CLK_AHB_CSI1		59
-#define CLK_AHB_HDMI0		60
-#define CLK_AHB_HDMI1		61
-#define CLK_AHB_DE_BE0		62
-#define CLK_AHB_DE_BE1		63
-#define CLK_AHB_DE_FE0		64
-#define CLK_AHB_DE_FE1		65
-#define CLK_AHB_GMAC		66
-#define CLK_AHB_MP		67
-#define CLK_AHB_GPU		68
-
-/* APB0 Gates */
-#define CLK_APB0_CODEC		69
-#define CLK_APB0_SPDIF		70
-#define CLK_APB0_I2S0		71
-#define CLK_APB0_AC97		72
-#define CLK_APB0_I2S1		73
-#define CLK_APB0_PIO		74
-#define CLK_APB0_IR0		75
-#define CLK_APB0_IR1		76
-#define CLK_APB0_I2S2		77
-#define CLK_APB0_KEYPAD		78
-
-/* APB1 Gates */
-#define CLK_APB1_I2C0		79
-#define CLK_APB1_I2C1		80
-#define CLK_APB1_I2C2		81
-#define CLK_APB1_I2C3		82
-#define CLK_APB1_CAN		83
-#define CLK_APB1_SCR		84
-#define CLK_APB1_PS20		85
-#define CLK_APB1_PS21		86
-#define CLK_APB1_I2C4		87
-#define CLK_APB1_UART0		88
-#define CLK_APB1_UART1		89
-#define CLK_APB1_UART2		90
-#define CLK_APB1_UART3		91
-#define CLK_APB1_UART4		92
-#define CLK_APB1_UART5		93
-#define CLK_APB1_UART6		94
-#define CLK_APB1_UART7		95
-
-/* IP clocks */
-#define CLK_NAND		96
-#define CLK_MS			97
-#define CLK_MMC0		98
-#define CLK_MMC0_OUTPUT		99
-#define CLK_MMC0_SAMPLE		100
-#define CLK_MMC1		101
-#define CLK_MMC1_OUTPUT		102
-#define CLK_MMC1_SAMPLE		103
-#define CLK_MMC2		104
-#define CLK_MMC2_OUTPUT		105
-#define CLK_MMC2_SAMPLE		106
-#define CLK_MMC3		107
-#define CLK_MMC3_OUTPUT		108
-#define CLK_MMC3_SAMPLE		109
-#define CLK_TS			110
-#define CLK_SS			111
-#define CLK_SPI0		112
-#define CLK_SPI1		113
-#define CLK_SPI2		114
-#define CLK_PATA		115
-#define CLK_IR0			116
-#define CLK_IR1			117
-#define CLK_I2S0		118
-#define CLK_AC97		119
-#define CLK_SPDIF		120
-#define CLK_KEYPAD		121
-#define CLK_SATA		122
-#define CLK_USB_OHCI0		123
-#define CLK_USB_OHCI1		124
-#define CLK_USB_PHY		125
-#define CLK_GPS			126
-#define CLK_SPI3		127
-#define CLK_I2S1		128
-#define CLK_I2S2		129
-
-/* DRAM Gates */
-#define CLK_DRAM_VE		130
-#define CLK_DRAM_CSI0		131
-#define CLK_DRAM_CSI1		132
-#define CLK_DRAM_TS		133
-#define CLK_DRAM_TVD		134
-#define CLK_DRAM_TVE0		135
-#define CLK_DRAM_TVE1		136
-#define CLK_DRAM_OUT		137
-#define CLK_DRAM_DE_FE1		138
-#define CLK_DRAM_DE_FE0		139
-#define CLK_DRAM_DE_BE0		140
-#define CLK_DRAM_DE_BE1		141
-#define CLK_DRAM_MP		142
-#define CLK_DRAM_ACE		143
-
-/* Display Engine Clocks */
-#define CLK_DE_BE0		144
-#define CLK_DE_BE1		145
-#define CLK_DE_FE0		146
-#define CLK_DE_FE1		147
-#define CLK_DE_MP		148
-#define CLK_TCON0_CH0		149
-#define CLK_TCON1_CH0		150
-#define CLK_CSI_SCLK		151
-#define CLK_TVD_SCLK2		152
-#define CLK_TVD			153
-#define CLK_TCON0_CH1_SCLK2	154
-#define CLK_TCON0_CH1		155
-#define CLK_TCON1_CH1_SCLK2	156
-#define CLK_TCON1_CH1		157
-#define CLK_CSI0		158
-#define CLK_CSI1		159
-#define CLK_CODEC		160
-#define CLK_VE			161
-#define CLK_AVS			162
-#define CLK_ACE			163
-#define CLK_HDMI		164
-#define CLK_GPU			165
-
-#endif /* _DT_BINDINGS_CLK_SUN4I_A10_H_ */
diff --git a/include/dt-bindings/clock/sun4i-a10-pll2.h b/include/dt-bindings/clock/sun4i-a10-pll2.h
deleted file mode 100644
index 071c8112d531..000000000000
--- a/include/dt-bindings/clock/sun4i-a10-pll2.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/*
- * Copyright 2015 Maxime Ripard
- *
- * Maxime Ripard <maxime.ripard@free-electrons.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef __DT_BINDINGS_CLOCK_SUN4I_A10_PLL2_H_
-#define __DT_BINDINGS_CLOCK_SUN4I_A10_PLL2_H_
-
-#define SUN4I_A10_PLL2_1X	0
-#define SUN4I_A10_PLL2_2X	1
-#define SUN4I_A10_PLL2_4X	2
-#define SUN4I_A10_PLL2_8X	3
-
-#endif /* __DT_BINDINGS_CLOCK_SUN4I_A10_PLL2_H_ */
diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bindings/clock/sun50i-a64-ccu.h
deleted file mode 100644
index 175892189e9d..000000000000
--- a/include/dt-bindings/clock/sun50i-a64-ccu.h
+++ /dev/null
@@ -1,138 +0,0 @@
-/*
- * Copyright (C) 2016 Maxime Ripard <maxime.ripard@free-electrons.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN50I_A64_H_
-#define _DT_BINDINGS_CLK_SUN50I_A64_H_
-
-#define CLK_PLL_VIDEO0		7
-#define CLK_PLL_PERIPH0		11
-
-#define CLK_CPUX		21
-#define CLK_BUS_MIPI_DSI	28
-#define CLK_BUS_CE		29
-#define CLK_BUS_DMA		30
-#define CLK_BUS_MMC0		31
-#define CLK_BUS_MMC1		32
-#define CLK_BUS_MMC2		33
-#define CLK_BUS_NAND		34
-#define CLK_BUS_DRAM		35
-#define CLK_BUS_EMAC		36
-#define CLK_BUS_TS		37
-#define CLK_BUS_HSTIMER		38
-#define CLK_BUS_SPI0		39
-#define CLK_BUS_SPI1		40
-#define CLK_BUS_OTG		41
-#define CLK_BUS_EHCI0		42
-#define CLK_BUS_EHCI1		43
-#define CLK_BUS_OHCI0		44
-#define CLK_BUS_OHCI1		45
-#define CLK_BUS_VE		46
-#define CLK_BUS_TCON0		47
-#define CLK_BUS_TCON1		48
-#define CLK_BUS_DEINTERLACE	49
-#define CLK_BUS_CSI		50
-#define CLK_BUS_HDMI		51
-#define CLK_BUS_DE		52
-#define CLK_BUS_GPU		53
-#define CLK_BUS_MSGBOX		54
-#define CLK_BUS_SPINLOCK	55
-#define CLK_BUS_CODEC		56
-#define CLK_BUS_SPDIF		57
-#define CLK_BUS_PIO		58
-#define CLK_BUS_THS		59
-#define CLK_BUS_I2S0		60
-#define CLK_BUS_I2S1		61
-#define CLK_BUS_I2S2		62
-#define CLK_BUS_I2C0		63
-#define CLK_BUS_I2C1		64
-#define CLK_BUS_I2C2		65
-#define CLK_BUS_SCR		66
-#define CLK_BUS_UART0		67
-#define CLK_BUS_UART1		68
-#define CLK_BUS_UART2		69
-#define CLK_BUS_UART3		70
-#define CLK_BUS_UART4		71
-#define CLK_BUS_DBG		72
-#define CLK_THS			73
-#define CLK_NAND		74
-#define CLK_MMC0		75
-#define CLK_MMC1		76
-#define CLK_MMC2		77
-#define CLK_TS			78
-#define CLK_CE			79
-#define CLK_SPI0		80
-#define CLK_SPI1		81
-#define CLK_I2S0		82
-#define CLK_I2S1		83
-#define CLK_I2S2		84
-#define CLK_SPDIF		85
-#define CLK_USB_PHY0		86
-#define CLK_USB_PHY1		87
-#define CLK_USB_HSIC		88
-#define CLK_USB_HSIC_12M	89
-
-#define CLK_USB_OHCI0		91
-
-#define CLK_USB_OHCI1		93
-#define CLK_DRAM		94
-#define CLK_DRAM_VE		95
-#define CLK_DRAM_CSI		96
-#define CLK_DRAM_DEINTERLACE	97
-#define CLK_DRAM_TS		98
-#define CLK_DE			99
-#define CLK_TCON0		100
-#define CLK_TCON1		101
-#define CLK_DEINTERLACE		102
-#define CLK_CSI_MISC		103
-#define CLK_CSI_SCLK		104
-#define CLK_CSI_MCLK		105
-#define CLK_VE			106
-#define CLK_AC_DIG		107
-#define CLK_AC_DIG_4X		108
-#define CLK_AVS			109
-#define CLK_HDMI		110
-#define CLK_HDMI_DDC		111
-#define CLK_MBUS		112
-#define CLK_DSI_DPHY		113
-#define CLK_GPU			114
-
-#endif /* _DT_BINDINGS_CLK_SUN50I_H_ */
diff --git a/include/dt-bindings/clock/sun50i-h6-ccu.h b/include/dt-bindings/clock/sun50i-h6-ccu.h
deleted file mode 100644
index ef9123d81937..000000000000
--- a/include/dt-bindings/clock/sun50i-h6-ccu.h
+++ /dev/null
@@ -1,125 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN50I_H6_H_
-#define _DT_BINDINGS_CLK_SUN50I_H6_H_
-
-#define CLK_PLL_PERIPH0		3
-
-#define CLK_CPUX		21
-
-#define CLK_APB1		26
-
-#define CLK_DE			29
-#define CLK_BUS_DE		30
-#define CLK_DEINTERLACE		31
-#define CLK_BUS_DEINTERLACE	32
-#define CLK_GPU			33
-#define CLK_BUS_GPU		34
-#define CLK_CE			35
-#define CLK_BUS_CE		36
-#define CLK_VE			37
-#define CLK_BUS_VE		38
-#define CLK_EMCE		39
-#define CLK_BUS_EMCE		40
-#define CLK_VP9			41
-#define CLK_BUS_VP9		42
-#define CLK_BUS_DMA		43
-#define CLK_BUS_MSGBOX		44
-#define CLK_BUS_SPINLOCK	45
-#define CLK_BUS_HSTIMER		46
-#define CLK_AVS			47
-#define CLK_BUS_DBG		48
-#define CLK_BUS_PSI		49
-#define CLK_BUS_PWM		50
-#define CLK_BUS_IOMMU		51
-
-#define CLK_MBUS_DMA		53
-#define CLK_MBUS_VE		54
-#define CLK_MBUS_CE		55
-#define CLK_MBUS_TS		56
-#define CLK_MBUS_NAND		57
-#define CLK_MBUS_CSI		58
-#define CLK_MBUS_DEINTERLACE	59
-
-#define CLK_NAND0		61
-#define CLK_NAND1		62
-#define CLK_BUS_NAND		63
-#define CLK_MMC0		64
-#define CLK_MMC1		65
-#define CLK_MMC2		66
-#define CLK_BUS_MMC0		67
-#define CLK_BUS_MMC1		68
-#define CLK_BUS_MMC2		69
-#define CLK_BUS_UART0		70
-#define CLK_BUS_UART1		71
-#define CLK_BUS_UART2		72
-#define CLK_BUS_UART3		73
-#define CLK_BUS_I2C0		74
-#define CLK_BUS_I2C1		75
-#define CLK_BUS_I2C2		76
-#define CLK_BUS_I2C3		77
-#define CLK_BUS_SCR0		78
-#define CLK_BUS_SCR1		79
-#define CLK_SPI0		80
-#define CLK_SPI1		81
-#define CLK_BUS_SPI0		82
-#define CLK_BUS_SPI1		83
-#define CLK_BUS_EMAC		84
-#define CLK_TS			85
-#define CLK_BUS_TS		86
-#define CLK_IR_TX		87
-#define CLK_BUS_IR_TX		88
-#define CLK_BUS_THS		89
-#define CLK_I2S3		90
-#define CLK_I2S0		91
-#define CLK_I2S1		92
-#define CLK_I2S2		93
-#define CLK_BUS_I2S0		94
-#define CLK_BUS_I2S1		95
-#define CLK_BUS_I2S2		96
-#define CLK_BUS_I2S3		97
-#define CLK_SPDIF		98
-#define CLK_BUS_SPDIF		99
-#define CLK_DMIC		100
-#define CLK_BUS_DMIC		101
-#define CLK_AUDIO_HUB		102
-#define CLK_BUS_AUDIO_HUB	103
-#define CLK_USB_OHCI0		104
-#define CLK_USB_PHY0		105
-#define CLK_USB_PHY1		106
-#define CLK_USB_OHCI3		107
-#define CLK_USB_PHY3		108
-#define CLK_USB_HSIC_12M	109
-#define CLK_USB_HSIC		110
-#define CLK_BUS_OHCI0		111
-#define CLK_BUS_OHCI3		112
-#define CLK_BUS_EHCI0		113
-#define CLK_BUS_XHCI		114
-#define CLK_BUS_EHCI3		115
-#define CLK_BUS_OTG		116
-#define CLK_PCIE_REF_100M	117
-#define CLK_PCIE_REF		118
-#define CLK_PCIE_REF_OUT	119
-#define CLK_PCIE_MAXI		120
-#define CLK_PCIE_AUX		121
-#define CLK_BUS_PCIE		122
-#define CLK_HDMI		123
-#define CLK_HDMI_SLOW		124
-#define CLK_HDMI_CEC		125
-#define CLK_BUS_HDMI		126
-#define CLK_BUS_TCON_TOP	127
-#define CLK_TCON_LCD0		128
-#define CLK_BUS_TCON_LCD0	129
-#define CLK_TCON_TV0		130
-#define CLK_BUS_TCON_TV0	131
-#define CLK_CSI_CCI		132
-#define CLK_CSI_TOP		133
-#define CLK_CSI_MCLK		134
-#define CLK_BUS_CSI		135
-#define CLK_HDCP		136
-#define CLK_BUS_HDCP		137
-
-#endif /* _DT_BINDINGS_CLK_SUN50I_H6_H_ */
diff --git a/include/dt-bindings/clock/sun50i-h6-r-ccu.h b/include/dt-bindings/clock/sun50i-h6-r-ccu.h
deleted file mode 100644
index a96087abc86f..000000000000
--- a/include/dt-bindings/clock/sun50i-h6-r-ccu.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2017 Icenowy Zheng <icenowy@aosc.xyz>
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN50I_H6_R_CCU_H_
-#define _DT_BINDINGS_CLK_SUN50I_H6_R_CCU_H_
-
-#define CLK_AR100		0
-
-#define CLK_R_APB1		2
-
-#define CLK_R_APB1_TIMER	4
-#define CLK_R_APB1_TWD		5
-#define CLK_R_APB1_PWM		6
-#define CLK_R_APB2_UART		7
-#define CLK_R_APB2_I2C		8
-#define CLK_R_APB1_IR		9
-#define CLK_R_APB1_W1		10
-
-#define CLK_IR			11
-#define CLK_W1			12
-
-#define CLK_R_APB2_RSB		13
-#define CLK_R_APB1_RTC		14
-
-#endif /* _DT_BINDINGS_CLK_SUN50I_H6_R_CCU_H_ */
diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bindings/clock/sun50i-h616-ccu.h
deleted file mode 100644
index 6f8f01e67628..000000000000
--- a/include/dt-bindings/clock/sun50i-h616-ccu.h
+++ /dev/null
@@ -1,116 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (C) 2020 Arm Ltd.
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN50I_H616_H_
-#define _DT_BINDINGS_CLK_SUN50I_H616_H_
-
-#define CLK_PLL_PERIPH0		4
-
-#define CLK_CPUX		21
-
-#define CLK_APB1		26
-
-#define CLK_DE			29
-#define CLK_BUS_DE		30
-#define CLK_DEINTERLACE		31
-#define CLK_BUS_DEINTERLACE	32
-#define CLK_G2D			33
-#define CLK_BUS_G2D		34
-#define CLK_GPU0		35
-#define CLK_BUS_GPU		36
-#define CLK_GPU1		37
-#define CLK_CE			38
-#define CLK_BUS_CE		39
-#define CLK_VE			40
-#define CLK_BUS_VE		41
-#define CLK_BUS_DMA		42
-#define CLK_BUS_HSTIMER		43
-#define CLK_AVS			44
-#define CLK_BUS_DBG		45
-#define CLK_BUS_PSI		46
-#define CLK_BUS_PWM		47
-#define CLK_BUS_IOMMU		48
-
-#define CLK_MBUS_DMA		50
-#define CLK_MBUS_VE		51
-#define CLK_MBUS_CE		52
-#define CLK_MBUS_TS		53
-#define CLK_MBUS_NAND		54
-#define CLK_MBUS_G2D		55
-
-#define CLK_NAND0		57
-#define CLK_NAND1		58
-#define CLK_BUS_NAND		59
-#define CLK_MMC0		60
-#define CLK_MMC1		61
-#define CLK_MMC2		62
-#define CLK_BUS_MMC0		63
-#define CLK_BUS_MMC1		64
-#define CLK_BUS_MMC2		65
-#define CLK_BUS_UART0		66
-#define CLK_BUS_UART1		67
-#define CLK_BUS_UART2		68
-#define CLK_BUS_UART3		69
-#define CLK_BUS_UART4		70
-#define CLK_BUS_UART5		71
-#define CLK_BUS_I2C0		72
-#define CLK_BUS_I2C1		73
-#define CLK_BUS_I2C2		74
-#define CLK_BUS_I2C3		75
-#define CLK_BUS_I2C4		76
-#define CLK_SPI0		77
-#define CLK_SPI1		78
-#define CLK_BUS_SPI0		79
-#define CLK_BUS_SPI1		80
-#define CLK_EMAC_25M		81
-#define CLK_BUS_EMAC0		82
-#define CLK_BUS_EMAC1		83
-#define CLK_TS			84
-#define CLK_BUS_TS		85
-#define CLK_BUS_THS		86
-#define CLK_SPDIF		87
-#define CLK_BUS_SPDIF		88
-#define CLK_DMIC		89
-#define CLK_BUS_DMIC		90
-#define CLK_AUDIO_CODEC_1X	91
-#define CLK_AUDIO_CODEC_4X	92
-#define CLK_BUS_AUDIO_CODEC	93
-#define CLK_AUDIO_HUB		94
-#define CLK_BUS_AUDIO_HUB	95
-#define CLK_USB_OHCI0		96
-#define CLK_USB_PHY0		97
-#define CLK_USB_OHCI1		98
-#define CLK_USB_PHY1		99
-#define CLK_USB_OHCI2		100
-#define CLK_USB_PHY2		101
-#define CLK_USB_OHCI3		102
-#define CLK_USB_PHY3		103
-#define CLK_BUS_OHCI0		104
-#define CLK_BUS_OHCI1		105
-#define CLK_BUS_OHCI2		106
-#define CLK_BUS_OHCI3		107
-#define CLK_BUS_EHCI0		108
-#define CLK_BUS_EHCI1		109
-#define CLK_BUS_EHCI2		110
-#define CLK_BUS_EHCI3		111
-#define CLK_BUS_OTG		112
-#define CLK_BUS_KEYADC		113
-#define CLK_HDMI		114
-#define CLK_HDMI_SLOW		115
-#define CLK_HDMI_CEC		116
-#define CLK_BUS_HDMI		117
-#define CLK_BUS_TCON_TOP	118
-#define CLK_TCON_TV0		119
-#define CLK_TCON_TV1		120
-#define CLK_BUS_TCON_TV0	121
-#define CLK_BUS_TCON_TV1	122
-#define CLK_TVE0		123
-#define CLK_BUS_TVE_TOP		124
-#define CLK_BUS_TVE0		125
-#define CLK_HDCP		126
-#define CLK_BUS_HDCP		127
-#define CLK_PLL_SYSTEM_32K	128
-
-#endif /* _DT_BINDINGS_CLK_SUN50I_H616_H_ */
diff --git a/include/dt-bindings/clock/sun5i-ccu.h b/include/dt-bindings/clock/sun5i-ccu.h
deleted file mode 100644
index 75fe5619c3d9..000000000000
--- a/include/dt-bindings/clock/sun5i-ccu.h
+++ /dev/null
@@ -1,97 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright 2016 Maxime Ripard
- *
- * Maxime Ripard <maxime.ripard@free-electrons.com>
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN5I_H_
-#define _DT_BINDINGS_CLK_SUN5I_H_
-
-#define CLK_HOSC		1
-
-#define CLK_PLL_VIDEO0_2X	9
-
-#define CLK_PLL_VIDEO1_2X	16
-#define CLK_CPU			17
-
-#define CLK_AHB_OTG		23
-#define CLK_AHB_EHCI		24
-#define CLK_AHB_OHCI		25
-#define CLK_AHB_SS		26
-#define CLK_AHB_DMA		27
-#define CLK_AHB_BIST		28
-#define CLK_AHB_MMC0		29
-#define CLK_AHB_MMC1		30
-#define CLK_AHB_MMC2		31
-#define CLK_AHB_NAND		32
-#define CLK_AHB_SDRAM		33
-#define CLK_AHB_EMAC		34
-#define CLK_AHB_TS		35
-#define CLK_AHB_SPI0		36
-#define CLK_AHB_SPI1		37
-#define CLK_AHB_SPI2		38
-#define CLK_AHB_GPS		39
-#define CLK_AHB_HSTIMER		40
-#define CLK_AHB_VE		41
-#define CLK_AHB_TVE		42
-#define CLK_AHB_LCD		43
-#define CLK_AHB_CSI		44
-#define CLK_AHB_HDMI		45
-#define CLK_AHB_DE_BE		46
-#define CLK_AHB_DE_FE		47
-#define CLK_AHB_IEP		48
-#define CLK_AHB_GPU		49
-#define CLK_APB0_CODEC		50
-#define CLK_APB0_SPDIF		51
-#define CLK_APB0_I2S		52
-#define CLK_APB0_PIO		53
-#define CLK_APB0_IR		54
-#define CLK_APB0_KEYPAD		55
-#define CLK_APB1_I2C0		56
-#define CLK_APB1_I2C1		57
-#define CLK_APB1_I2C2		58
-#define CLK_APB1_UART0		59
-#define CLK_APB1_UART1		60
-#define CLK_APB1_UART2		61
-#define CLK_APB1_UART3		62
-#define CLK_NAND		63
-#define CLK_MMC0		64
-#define CLK_MMC1		65
-#define CLK_MMC2		66
-#define CLK_TS			67
-#define CLK_SS			68
-#define CLK_SPI0		69
-#define CLK_SPI1		70
-#define CLK_SPI2		71
-#define CLK_IR			72
-#define CLK_I2S			73
-#define CLK_SPDIF		74
-#define CLK_KEYPAD		75
-#define CLK_USB_OHCI		76
-#define CLK_USB_PHY0		77
-#define CLK_USB_PHY1		78
-#define CLK_GPS			79
-#define CLK_DRAM_VE		80
-#define CLK_DRAM_CSI		81
-#define CLK_DRAM_TS		82
-#define CLK_DRAM_TVE		83
-#define CLK_DRAM_DE_FE		84
-#define CLK_DRAM_DE_BE		85
-#define CLK_DRAM_ACE		86
-#define CLK_DRAM_IEP		87
-#define CLK_DE_BE		88
-#define CLK_DE_FE		89
-#define CLK_TCON_CH0		90
-
-#define CLK_TCON_CH1		92
-#define CLK_CSI			93
-#define CLK_VE			94
-#define CLK_CODEC		95
-#define CLK_AVS			96
-#define CLK_HDMI		97
-#define CLK_GPU			98
-#define CLK_MBUS		99
-#define CLK_IEP			100
-
-#endif /* _DT_BINDINGS_CLK_SUN5I_H_ */
diff --git a/include/dt-bindings/clock/sun6i-a31-ccu.h b/include/dt-bindings/clock/sun6i-a31-ccu.h
deleted file mode 100644
index 39878d9dce9f..000000000000
--- a/include/dt-bindings/clock/sun6i-a31-ccu.h
+++ /dev/null
@@ -1,193 +0,0 @@
-/*
- * Copyright (C) 2016 Chen-Yu Tsai <wens@csie.org>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN6I_A31_H_
-#define _DT_BINDINGS_CLK_SUN6I_A31_H_
-
-#define CLK_PLL_VIDEO0_2X	7
-
-#define CLK_PLL_PERIPH		10
-
-#define CLK_PLL_VIDEO1_2X	13
-
-#define CLK_PLL_MIPI		15
-
-#define CLK_CPU			18
-
-#define CLK_AHB1_MIPIDSI	23
-#define CLK_AHB1_SS		24
-#define CLK_AHB1_DMA		25
-#define CLK_AHB1_MMC0		26
-#define CLK_AHB1_MMC1		27
-#define CLK_AHB1_MMC2		28
-#define CLK_AHB1_MMC3		29
-#define CLK_AHB1_NAND1		30
-#define CLK_AHB1_NAND0		31
-#define CLK_AHB1_SDRAM		32
-#define CLK_AHB1_EMAC		33
-#define CLK_AHB1_TS		34
-#define CLK_AHB1_HSTIMER	35
-#define CLK_AHB1_SPI0		36
-#define CLK_AHB1_SPI1		37
-#define CLK_AHB1_SPI2		38
-#define CLK_AHB1_SPI3		39
-#define CLK_AHB1_OTG		40
-#define CLK_AHB1_EHCI0		41
-#define CLK_AHB1_EHCI1		42
-#define CLK_AHB1_OHCI0		43
-#define CLK_AHB1_OHCI1		44
-#define CLK_AHB1_OHCI2		45
-#define CLK_AHB1_VE		46
-#define CLK_AHB1_LCD0		47
-#define CLK_AHB1_LCD1		48
-#define CLK_AHB1_CSI		49
-#define CLK_AHB1_HDMI		50
-#define CLK_AHB1_BE0		51
-#define CLK_AHB1_BE1		52
-#define CLK_AHB1_FE0		53
-#define CLK_AHB1_FE1		54
-#define CLK_AHB1_MP		55
-#define CLK_AHB1_GPU		56
-#define CLK_AHB1_DEU0		57
-#define CLK_AHB1_DEU1		58
-#define CLK_AHB1_DRC0		59
-#define CLK_AHB1_DRC1		60
-
-#define CLK_APB1_CODEC		61
-#define CLK_APB1_SPDIF		62
-#define CLK_APB1_DIGITAL_MIC	63
-#define CLK_APB1_PIO		64
-#define CLK_APB1_DAUDIO0	65
-#define CLK_APB1_DAUDIO1	66
-
-#define CLK_APB2_I2C0		67
-#define CLK_APB2_I2C1		68
-#define CLK_APB2_I2C2		69
-#define CLK_APB2_I2C3		70
-#define CLK_APB2_UART0		71
-#define CLK_APB2_UART1		72
-#define CLK_APB2_UART2		73
-#define CLK_APB2_UART3		74
-#define CLK_APB2_UART4		75
-#define CLK_APB2_UART5		76
-
-#define CLK_NAND0		77
-#define CLK_NAND1		78
-#define CLK_MMC0		79
-#define CLK_MMC0_SAMPLE		80
-#define CLK_MMC0_OUTPUT		81
-#define CLK_MMC1		82
-#define CLK_MMC1_SAMPLE		83
-#define CLK_MMC1_OUTPUT		84
-#define CLK_MMC2		85
-#define CLK_MMC2_SAMPLE		86
-#define CLK_MMC2_OUTPUT		87
-#define CLK_MMC3		88
-#define CLK_MMC3_SAMPLE		89
-#define CLK_MMC3_OUTPUT		90
-#define CLK_TS			91
-#define CLK_SS			92
-#define CLK_SPI0		93
-#define CLK_SPI1		94
-#define CLK_SPI2		95
-#define CLK_SPI3		96
-#define CLK_DAUDIO0		97
-#define CLK_DAUDIO1		98
-#define CLK_SPDIF		99
-#define CLK_USB_PHY0		100
-#define CLK_USB_PHY1		101
-#define CLK_USB_PHY2		102
-#define CLK_USB_OHCI0		103
-#define CLK_USB_OHCI1		104
-#define CLK_USB_OHCI2		105
-
-#define CLK_DRAM_VE		110
-#define CLK_DRAM_CSI_ISP	111
-#define CLK_DRAM_TS		112
-#define CLK_DRAM_DRC0		113
-#define CLK_DRAM_DRC1		114
-#define CLK_DRAM_DEU0		115
-#define CLK_DRAM_DEU1		116
-#define CLK_DRAM_FE0		117
-#define CLK_DRAM_FE1		118
-#define CLK_DRAM_BE0		119
-#define CLK_DRAM_BE1		120
-#define CLK_DRAM_MP		121
-
-#define CLK_BE0			122
-#define CLK_BE1			123
-#define CLK_FE0			124
-#define CLK_FE1			125
-#define CLK_MP			126
-#define CLK_LCD0_CH0		127
-#define CLK_LCD1_CH0		128
-#define CLK_LCD0_CH1		129
-#define CLK_LCD1_CH1		130
-#define CLK_CSI0_SCLK		131
-#define CLK_CSI0_MCLK		132
-#define CLK_CSI1_MCLK		133
-#define CLK_VE			134
-#define CLK_CODEC		135
-#define CLK_AVS			136
-#define CLK_DIGITAL_MIC		137
-#define CLK_HDMI		138
-#define CLK_HDMI_DDC		139
-#define CLK_PS			140
-
-#define CLK_MIPI_DSI		143
-#define CLK_MIPI_DSI_DPHY	144
-#define CLK_MIPI_CSI_DPHY	145
-#define CLK_IEP_DRC0		146
-#define CLK_IEP_DRC1		147
-#define CLK_IEP_DEU0		148
-#define CLK_IEP_DEU1		149
-#define CLK_GPU_CORE		150
-#define CLK_GPU_MEMORY		151
-#define CLK_GPU_HYD		152
-#define CLK_ATS			153
-#define CLK_TRACE		154
-
-#define CLK_OUT_A		155
-#define CLK_OUT_B		156
-#define CLK_OUT_C		157
-
-#endif /* _DT_BINDINGS_CLK_SUN6I_A31_H_ */
diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
deleted file mode 100644
index 3bd3aa3d57ce..000000000000
--- a/include/dt-bindings/clock/sun6i-rtc.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-
-#ifndef _DT_BINDINGS_CLK_SUN6I_RTC_H_
-#define _DT_BINDINGS_CLK_SUN6I_RTC_H_
-
-#define CLK_OSC32K		0
-#define CLK_OSC32K_FANOUT	1
-#define CLK_IOSC		2
-
-#endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */
diff --git a/include/dt-bindings/clock/sun7i-a20-ccu.h b/include/dt-bindings/clock/sun7i-a20-ccu.h
deleted file mode 100644
index 045a5178da0c..000000000000
--- a/include/dt-bindings/clock/sun7i-a20-ccu.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/*
- * Copyright (C) 2017 Priit Laes <plaes@plaes.org>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN7I_A20_H_
-#define _DT_BINDINGS_CLK_SUN7I_A20_H_
-
-#include <dt-bindings/clock/sun4i-a10-ccu.h>
-
-#define CLK_MBUS		166
-#define CLK_HDMI1_SLOW		167
-#define CLK_HDMI1		168
-#define CLK_OUT_A		169
-#define CLK_OUT_B		170
-
-#endif /* _DT_BINDINGS_CLK_SUN7I_A20_H_ */
diff --git a/include/dt-bindings/clock/sun8i-a23-a33-ccu.h b/include/dt-bindings/clock/sun8i-a23-a33-ccu.h
deleted file mode 100644
index eb524d0bbd01..000000000000
--- a/include/dt-bindings/clock/sun8i-a23-a33-ccu.h
+++ /dev/null
@@ -1,129 +0,0 @@
-/*
- * Copyright (C) 2016 Maxime Ripard <maxime.ripard@free-electrons.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN8I_A23_A33_H_
-#define _DT_BINDINGS_CLK_SUN8I_A23_A33_H_
-
-#define CLK_PLL_MIPI		13
-
-#define CLK_CPUX		18
-
-#define CLK_BUS_MIPI_DSI	23
-#define CLK_BUS_SS		24
-#define CLK_BUS_DMA		25
-#define CLK_BUS_MMC0		26
-#define CLK_BUS_MMC1		27
-#define CLK_BUS_MMC2		28
-#define CLK_BUS_NAND		29
-#define CLK_BUS_DRAM		30
-#define CLK_BUS_HSTIMER		31
-#define CLK_BUS_SPI0		32
-#define CLK_BUS_SPI1		33
-#define CLK_BUS_OTG		34
-#define CLK_BUS_EHCI		35
-#define CLK_BUS_OHCI		36
-#define CLK_BUS_VE		37
-#define CLK_BUS_LCD		38
-#define CLK_BUS_CSI		39
-#define CLK_BUS_DE_BE		40
-#define CLK_BUS_DE_FE		41
-#define CLK_BUS_GPU		42
-#define CLK_BUS_MSGBOX		43
-#define CLK_BUS_SPINLOCK	44
-#define CLK_BUS_DRC		45
-#define CLK_BUS_SAT		46
-#define CLK_BUS_CODEC		47
-#define CLK_BUS_PIO		48
-#define CLK_BUS_I2S0		49
-#define CLK_BUS_I2S1		50
-#define CLK_BUS_I2C0		51
-#define CLK_BUS_I2C1		52
-#define CLK_BUS_I2C2		53
-#define CLK_BUS_UART0		54
-#define CLK_BUS_UART1		55
-#define CLK_BUS_UART2		56
-#define CLK_BUS_UART3		57
-#define CLK_BUS_UART4		58
-#define CLK_NAND		59
-#define CLK_MMC0		60
-#define CLK_MMC0_SAMPLE		61
-#define CLK_MMC0_OUTPUT		62
-#define CLK_MMC1		63
-#define CLK_MMC1_SAMPLE		64
-#define CLK_MMC1_OUTPUT		65
-#define CLK_MMC2		66
-#define CLK_MMC2_SAMPLE		67
-#define CLK_MMC2_OUTPUT		68
-#define CLK_SS			69
-#define CLK_SPI0		70
-#define CLK_SPI1		71
-#define CLK_I2S0		72
-#define CLK_I2S1		73
-#define CLK_USB_PHY0		74
-#define CLK_USB_PHY1		75
-#define CLK_USB_HSIC		76
-#define CLK_USB_HSIC_12M	77
-#define CLK_USB_OHCI		78
-
-#define CLK_DRAM_VE		80
-#define CLK_DRAM_CSI		81
-#define CLK_DRAM_DRC		82
-#define CLK_DRAM_DE_FE		83
-#define CLK_DRAM_DE_BE		84
-#define CLK_DE_BE		85
-#define CLK_DE_FE		86
-#define CLK_LCD_CH0		87
-#define CLK_LCD_CH1		88
-#define CLK_CSI_SCLK		89
-#define CLK_CSI_MCLK		90
-#define CLK_VE			91
-#define CLK_AC_DIG		92
-#define CLK_AC_DIG_4X		93
-#define CLK_AVS			94
-
-#define CLK_DSI_SCLK		96
-#define CLK_DSI_DPHY		97
-#define CLK_DRC			98
-#define CLK_GPU			99
-#define CLK_ATS			100
-
-#endif /* _DT_BINDINGS_CLK_SUN8I_A23_A33_H_ */
diff --git a/include/dt-bindings/clock/sun8i-a83t-ccu.h b/include/dt-bindings/clock/sun8i-a83t-ccu.h
deleted file mode 100644
index 78af5085f630..000000000000
--- a/include/dt-bindings/clock/sun8i-a83t-ccu.h
+++ /dev/null
@@ -1,140 +0,0 @@
-/*
- * Copyright (C) 2017 Chen-Yu Tsai <wens@csie.org>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_CLOCK_SUN8I_A83T_CCU_H_
-#define _DT_BINDINGS_CLOCK_SUN8I_A83T_CCU_H_
-
-#define CLK_PLL_PERIPH		6
-
-#define CLK_PLL_DE		9
-
-#define CLK_C0CPUX		11
-#define CLK_C1CPUX		12
-
-#define CLK_BUS_MIPI_DSI	19
-#define CLK_BUS_SS		20
-#define CLK_BUS_DMA		21
-#define CLK_BUS_MMC0		22
-#define CLK_BUS_MMC1		23
-#define CLK_BUS_MMC2		24
-#define CLK_BUS_NAND		25
-#define CLK_BUS_DRAM		26
-#define CLK_BUS_EMAC		27
-#define CLK_BUS_HSTIMER		28
-#define CLK_BUS_SPI0		29
-#define CLK_BUS_SPI1		30
-#define CLK_BUS_OTG		31
-#define CLK_BUS_EHCI0		32
-#define CLK_BUS_EHCI1		33
-#define CLK_BUS_OHCI0		34
-
-#define CLK_BUS_VE		35
-#define CLK_BUS_TCON0		36
-#define CLK_BUS_TCON1		37
-#define CLK_BUS_CSI		38
-#define CLK_BUS_HDMI		39
-#define CLK_BUS_DE		40
-#define CLK_BUS_GPU		41
-#define CLK_BUS_MSGBOX		42
-#define CLK_BUS_SPINLOCK	43
-
-#define CLK_BUS_SPDIF		44
-#define CLK_BUS_PIO		45
-#define CLK_BUS_I2S0		46
-#define CLK_BUS_I2S1		47
-#define CLK_BUS_I2S2		48
-#define CLK_BUS_TDM		49
-
-#define CLK_BUS_I2C0		50
-#define CLK_BUS_I2C1		51
-#define CLK_BUS_I2C2		52
-#define CLK_BUS_UART0		53
-#define CLK_BUS_UART1		54
-#define CLK_BUS_UART2		55
-#define CLK_BUS_UART3		56
-#define CLK_BUS_UART4		57
-
-#define CLK_NAND		59
-#define CLK_MMC0		60
-#define CLK_MMC0_SAMPLE		61
-#define CLK_MMC0_OUTPUT		62
-#define CLK_MMC1		63
-#define CLK_MMC1_SAMPLE		64
-#define CLK_MMC1_OUTPUT		65
-#define CLK_MMC2		66
-#define CLK_MMC2_SAMPLE		67
-#define CLK_MMC2_OUTPUT		68
-#define CLK_SS			69
-#define CLK_SPI0		70
-#define CLK_SPI1		71
-#define CLK_I2S0		72
-#define CLK_I2S1		73
-#define CLK_I2S2		74
-#define CLK_TDM			75
-#define CLK_SPDIF		76
-#define CLK_USB_PHY0		77
-#define CLK_USB_PHY1		78
-#define CLK_USB_HSIC		79
-#define CLK_USB_HSIC_12M	80
-#define CLK_USB_OHCI0		81
-
-#define CLK_DRAM_VE		83
-#define CLK_DRAM_CSI		84
-
-#define CLK_TCON0		85
-#define CLK_TCON1		86
-#define CLK_CSI_MISC		87
-#define CLK_MIPI_CSI		88
-#define CLK_CSI_MCLK		89
-#define CLK_CSI_SCLK		90
-#define CLK_VE			91
-#define CLK_AVS			92
-#define CLK_HDMI		93
-#define CLK_HDMI_SLOW		94
-
-#define CLK_MIPI_DSI0		96
-#define CLK_MIPI_DSI1		97
-#define CLK_GPU_CORE		98
-#define CLK_GPU_MEMORY		99
-#define CLK_GPU_HYD		100
-
-#endif /* _DT_BINDINGS_CLOCK_SUN8I_A83T_CCU_H_ */
diff --git a/include/dt-bindings/clock/sun8i-de2.h b/include/dt-bindings/clock/sun8i-de2.h
deleted file mode 100644
index 7768f73b051e..000000000000
--- a/include/dt-bindings/clock/sun8i-de2.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/*
- * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.io>
- *
- * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
- */
-
-#ifndef _DT_BINDINGS_CLOCK_SUN8I_DE2_H_
-#define _DT_BINDINGS_CLOCK_SUN8I_DE2_H_
-
-#define CLK_BUS_MIXER0		0
-#define CLK_BUS_MIXER1		1
-#define CLK_BUS_WB		2
-
-#define CLK_MIXER0		6
-#define CLK_MIXER1		7
-#define CLK_WB			8
-
-#define CLK_BUS_ROT		9
-#define CLK_ROT			10
-
-#endif /* _DT_BINDINGS_CLOCK_SUN8I_DE2_H_ */
diff --git a/include/dt-bindings/clock/sun8i-h3-ccu.h b/include/dt-bindings/clock/sun8i-h3-ccu.h
deleted file mode 100644
index 5d4ada2c22e6..000000000000
--- a/include/dt-bindings/clock/sun8i-h3-ccu.h
+++ /dev/null
@@ -1,152 +0,0 @@
-/*
- * Copyright (C) 2016 Maxime Ripard <maxime.ripard@free-electrons.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN8I_H3_H_
-#define _DT_BINDINGS_CLK_SUN8I_H3_H_
-
-#define CLK_PLL_VIDEO		6
-
-#define CLK_PLL_PERIPH0		9
-
-#define CLK_CPUX		14
-
-#define CLK_BUS_CE		20
-#define CLK_BUS_DMA		21
-#define CLK_BUS_MMC0		22
-#define CLK_BUS_MMC1		23
-#define CLK_BUS_MMC2		24
-#define CLK_BUS_NAND		25
-#define CLK_BUS_DRAM		26
-#define CLK_BUS_EMAC		27
-#define CLK_BUS_TS		28
-#define CLK_BUS_HSTIMER		29
-#define CLK_BUS_SPI0		30
-#define CLK_BUS_SPI1		31
-#define CLK_BUS_OTG		32
-#define CLK_BUS_EHCI0		33
-#define CLK_BUS_EHCI1		34
-#define CLK_BUS_EHCI2		35
-#define CLK_BUS_EHCI3		36
-#define CLK_BUS_OHCI0		37
-#define CLK_BUS_OHCI1		38
-#define CLK_BUS_OHCI2		39
-#define CLK_BUS_OHCI3		40
-#define CLK_BUS_VE		41
-#define CLK_BUS_TCON0		42
-#define CLK_BUS_TCON1		43
-#define CLK_BUS_DEINTERLACE	44
-#define CLK_BUS_CSI		45
-#define CLK_BUS_TVE		46
-#define CLK_BUS_HDMI		47
-#define CLK_BUS_DE		48
-#define CLK_BUS_GPU		49
-#define CLK_BUS_MSGBOX		50
-#define CLK_BUS_SPINLOCK	51
-#define CLK_BUS_CODEC		52
-#define CLK_BUS_SPDIF		53
-#define CLK_BUS_PIO		54
-#define CLK_BUS_THS		55
-#define CLK_BUS_I2S0		56
-#define CLK_BUS_I2S1		57
-#define CLK_BUS_I2S2		58
-#define CLK_BUS_I2C0		59
-#define CLK_BUS_I2C1		60
-#define CLK_BUS_I2C2		61
-#define CLK_BUS_UART0		62
-#define CLK_BUS_UART1		63
-#define CLK_BUS_UART2		64
-#define CLK_BUS_UART3		65
-#define CLK_BUS_SCR0		66
-#define CLK_BUS_EPHY		67
-#define CLK_BUS_DBG		68
-
-#define CLK_THS			69
-#define CLK_NAND		70
-#define CLK_MMC0		71
-#define CLK_MMC0_SAMPLE		72
-#define CLK_MMC0_OUTPUT		73
-#define CLK_MMC1		74
-#define CLK_MMC1_SAMPLE		75
-#define CLK_MMC1_OUTPUT		76
-#define CLK_MMC2		77
-#define CLK_MMC2_SAMPLE		78
-#define CLK_MMC2_OUTPUT		79
-#define CLK_TS			80
-#define CLK_CE			81
-#define CLK_SPI0		82
-#define CLK_SPI1		83
-#define CLK_I2S0		84
-#define CLK_I2S1		85
-#define CLK_I2S2		86
-#define CLK_SPDIF		87
-#define CLK_USB_PHY0		88
-#define CLK_USB_PHY1		89
-#define CLK_USB_PHY2		90
-#define CLK_USB_PHY3		91
-#define CLK_USB_OHCI0		92
-#define CLK_USB_OHCI1		93
-#define CLK_USB_OHCI2		94
-#define CLK_USB_OHCI3		95
-#define CLK_DRAM		96
-#define CLK_DRAM_VE		97
-#define CLK_DRAM_CSI		98
-#define CLK_DRAM_DEINTERLACE	99
-#define CLK_DRAM_TS		100
-#define CLK_DE			101
-#define CLK_TCON0		102
-#define CLK_TVE			103
-#define CLK_DEINTERLACE		104
-#define CLK_CSI_MISC		105
-#define CLK_CSI_SCLK		106
-#define CLK_CSI_MCLK		107
-#define CLK_VE			108
-#define CLK_AC_DIG		109
-#define CLK_AVS			110
-#define CLK_HDMI		111
-#define CLK_HDMI_DDC		112
-#define CLK_MBUS		113
-#define CLK_GPU			114
-
-/* New clocks imported in H5 */
-#define CLK_BUS_SCR1		115
-
-#endif /* _DT_BINDINGS_CLK_SUN8I_H3_H_ */
diff --git a/include/dt-bindings/clock/sun8i-r-ccu.h b/include/dt-bindings/clock/sun8i-r-ccu.h
deleted file mode 100644
index 779d20aa0d05..000000000000
--- a/include/dt-bindings/clock/sun8i-r-ccu.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/*
- * Copyright (c) 2016 Icenowy Zheng <icenowy@aosc.xyz>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN8I_R_CCU_H_
-#define _DT_BINDINGS_CLK_SUN8I_R_CCU_H_
-
-#define CLK_AR100		0
-
-#define CLK_APB0_PIO		3
-#define CLK_APB0_IR		4
-#define CLK_APB0_TIMER		5
-#define CLK_APB0_RSB		6
-#define CLK_APB0_UART		7
-/* 8 is reserved for CLK_APB0_W1 on A31 */
-#define CLK_APB0_I2C		9
-#define CLK_APB0_TWD		10
-
-#define CLK_IR			11
-
-#endif /* _DT_BINDINGS_CLK_SUN8I_R_CCU_H_ */
diff --git a/include/dt-bindings/clock/sun8i-r40-ccu.h b/include/dt-bindings/clock/sun8i-r40-ccu.h
deleted file mode 100644
index d7337b55a4ef..000000000000
--- a/include/dt-bindings/clock/sun8i-r40-ccu.h
+++ /dev/null
@@ -1,191 +0,0 @@
-/*
- * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN8I_R40_H_
-#define _DT_BINDINGS_CLK_SUN8I_R40_H_
-
-#define CLK_PLL_VIDEO0		7
-
-#define CLK_PLL_VIDEO1		16
-
-#define CLK_CPU			24
-
-#define CLK_BUS_MIPI_DSI	29
-#define CLK_BUS_CE		30
-#define CLK_BUS_DMA		31
-#define CLK_BUS_MMC0		32
-#define CLK_BUS_MMC1		33
-#define CLK_BUS_MMC2		34
-#define CLK_BUS_MMC3		35
-#define CLK_BUS_NAND		36
-#define CLK_BUS_DRAM		37
-#define CLK_BUS_EMAC		38
-#define CLK_BUS_TS		39
-#define CLK_BUS_HSTIMER		40
-#define CLK_BUS_SPI0		41
-#define CLK_BUS_SPI1		42
-#define CLK_BUS_SPI2		43
-#define CLK_BUS_SPI3		44
-#define CLK_BUS_SATA		45
-#define CLK_BUS_OTG		46
-#define CLK_BUS_EHCI0		47
-#define CLK_BUS_EHCI1		48
-#define CLK_BUS_EHCI2		49
-#define CLK_BUS_OHCI0		50
-#define CLK_BUS_OHCI1		51
-#define CLK_BUS_OHCI2		52
-#define CLK_BUS_VE		53
-#define CLK_BUS_MP		54
-#define CLK_BUS_DEINTERLACE	55
-#define CLK_BUS_CSI0		56
-#define CLK_BUS_CSI1		57
-#define CLK_BUS_HDMI1		58
-#define CLK_BUS_HDMI0		59
-#define CLK_BUS_DE		60
-#define CLK_BUS_TVE0		61
-#define CLK_BUS_TVE1		62
-#define CLK_BUS_TVE_TOP		63
-#define CLK_BUS_GMAC		64
-#define CLK_BUS_GPU		65
-#define CLK_BUS_TVD0		66
-#define CLK_BUS_TVD1		67
-#define CLK_BUS_TVD2		68
-#define CLK_BUS_TVD3		69
-#define CLK_BUS_TVD_TOP		70
-#define CLK_BUS_TCON_LCD0	71
-#define CLK_BUS_TCON_LCD1	72
-#define CLK_BUS_TCON_TV0	73
-#define CLK_BUS_TCON_TV1	74
-#define CLK_BUS_TCON_TOP	75
-#define CLK_BUS_CODEC		76
-#define CLK_BUS_SPDIF		77
-#define CLK_BUS_AC97		78
-#define CLK_BUS_PIO		79
-#define CLK_BUS_IR0		80
-#define CLK_BUS_IR1		81
-#define CLK_BUS_THS		82
-#define CLK_BUS_KEYPAD		83
-#define CLK_BUS_I2S0		84
-#define CLK_BUS_I2S1		85
-#define CLK_BUS_I2S2		86
-#define CLK_BUS_I2C0		87
-#define CLK_BUS_I2C1		88
-#define CLK_BUS_I2C2		89
-#define CLK_BUS_I2C3		90
-#define CLK_BUS_CAN		91
-#define CLK_BUS_SCR		92
-#define CLK_BUS_PS20		93
-#define CLK_BUS_PS21		94
-#define CLK_BUS_I2C4		95
-#define CLK_BUS_UART0		96
-#define CLK_BUS_UART1		97
-#define CLK_BUS_UART2		98
-#define CLK_BUS_UART3		99
-#define CLK_BUS_UART4		100
-#define CLK_BUS_UART5		101
-#define CLK_BUS_UART6		102
-#define CLK_BUS_UART7		103
-#define CLK_BUS_DBG		104
-
-#define CLK_THS			105
-#define CLK_NAND		106
-#define CLK_MMC0		107
-#define CLK_MMC1		108
-#define CLK_MMC2		109
-#define CLK_MMC3		110
-#define CLK_TS			111
-#define CLK_CE			112
-#define CLK_SPI0		113
-#define CLK_SPI1		114
-#define CLK_SPI2		115
-#define CLK_SPI3		116
-#define CLK_I2S0		117
-#define CLK_I2S1		118
-#define CLK_I2S2		119
-#define CLK_AC97		120
-#define CLK_SPDIF		121
-#define CLK_KEYPAD		122
-#define CLK_SATA		123
-#define CLK_USB_PHY0		124
-#define CLK_USB_PHY1		125
-#define CLK_USB_PHY2		126
-#define CLK_USB_OHCI0		127
-#define CLK_USB_OHCI1		128
-#define CLK_USB_OHCI2		129
-#define CLK_IR0			130
-#define CLK_IR1			131
-
-#define CLK_DRAM_VE		133
-#define CLK_DRAM_CSI0		134
-#define CLK_DRAM_CSI1		135
-#define CLK_DRAM_TS		136
-#define CLK_DRAM_TVD		137
-#define CLK_DRAM_MP		138
-#define CLK_DRAM_DEINTERLACE	139
-#define CLK_DE			140
-#define CLK_MP			141
-#define CLK_TCON_LCD0		142
-#define CLK_TCON_LCD1		143
-#define CLK_TCON_TV0		144
-#define CLK_TCON_TV1		145
-#define CLK_DEINTERLACE		146
-#define CLK_CSI1_MCLK		147
-#define CLK_CSI_SCLK		148
-#define CLK_CSI0_MCLK		149
-#define CLK_VE			150
-#define CLK_CODEC		151
-#define CLK_AVS			152
-#define CLK_HDMI		153
-#define CLK_HDMI_SLOW		154
-#define CLK_MBUS		155
-#define CLK_DSI_DPHY		156
-#define CLK_TVE0		157
-#define CLK_TVE1		158
-#define CLK_TVD0		159
-#define CLK_TVD1		160
-#define CLK_TVD2		161
-#define CLK_TVD3		162
-#define CLK_GPU			163
-#define CLK_OUTA		164
-#define CLK_OUTB		165
-
-#endif /* _DT_BINDINGS_CLK_SUN8I_R40_H_ */
diff --git a/include/dt-bindings/clock/sun8i-tcon-top.h b/include/dt-bindings/clock/sun8i-tcon-top.h
deleted file mode 100644
index 25164d767835..000000000000
--- a/include/dt-bindings/clock/sun8i-tcon-top.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/* Copyright (C) 2018 Jernej Skrabec <jernej.skrabec@siol.net> */
-
-#ifndef _DT_BINDINGS_CLOCK_SUN8I_TCON_TOP_H_
-#define _DT_BINDINGS_CLOCK_SUN8I_TCON_TOP_H_
-
-#define CLK_TCON_TOP_TV0	0
-#define CLK_TCON_TOP_TV1	1
-#define CLK_TCON_TOP_DSI	2
-
-#endif /* _DT_BINDINGS_CLOCK_SUN8I_TCON_TOP_H_ */
diff --git a/include/dt-bindings/clock/sun8i-v3s-ccu.h b/include/dt-bindings/clock/sun8i-v3s-ccu.h
deleted file mode 100644
index 014ac6123d17..000000000000
--- a/include/dt-bindings/clock/sun8i-v3s-ccu.h
+++ /dev/null
@@ -1,111 +0,0 @@
-/*
- * Copyright (c) 2016 Icenowy Zheng <icenowy@aosc.xyz>
- *
- * Based on sun8i-h3-ccu.h, which is:
- * Copyright (C) 2016 Maxime Ripard <maxime.ripard@free-electrons.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_CLK_SUN8I_V3S_H_
-#define _DT_BINDINGS_CLK_SUN8I_V3S_H_
-
-#define CLK_CPU			14
-
-#define CLK_BUS_CE		20
-#define CLK_BUS_DMA		21
-#define CLK_BUS_MMC0		22
-#define CLK_BUS_MMC1		23
-#define CLK_BUS_MMC2		24
-#define CLK_BUS_DRAM		25
-#define CLK_BUS_EMAC		26
-#define CLK_BUS_HSTIMER		27
-#define CLK_BUS_SPI0		28
-#define CLK_BUS_OTG		29
-#define CLK_BUS_EHCI0		30
-#define CLK_BUS_OHCI0		31
-#define CLK_BUS_VE		32
-#define CLK_BUS_TCON0		33
-#define CLK_BUS_CSI		34
-#define CLK_BUS_DE		35
-#define CLK_BUS_CODEC		36
-#define CLK_BUS_PIO		37
-#define CLK_BUS_I2C0		38
-#define CLK_BUS_I2C1		39
-#define CLK_BUS_UART0		40
-#define CLK_BUS_UART1		41
-#define CLK_BUS_UART2		42
-#define CLK_BUS_EPHY		43
-#define CLK_BUS_DBG		44
-
-#define CLK_MMC0		45
-#define CLK_MMC0_SAMPLE		46
-#define CLK_MMC0_OUTPUT		47
-#define CLK_MMC1		48
-#define CLK_MMC1_SAMPLE		49
-#define CLK_MMC1_OUTPUT		50
-#define CLK_MMC2		51
-#define CLK_MMC2_SAMPLE		52
-#define CLK_MMC2_OUTPUT		53
-#define CLK_CE			54
-#define CLK_SPI0		55
-#define CLK_USB_PHY0		56
-#define CLK_USB_OHCI0		57
-
-#define CLK_DRAM_VE		59
-#define CLK_DRAM_CSI		60
-#define CLK_DRAM_EHCI		61
-#define CLK_DRAM_OHCI		62
-#define CLK_DE			63
-#define CLK_TCON0		64
-#define CLK_CSI_MISC		65
-#define CLK_CSI0_MCLK		66
-#define CLK_CSI1_SCLK		67
-#define CLK_CSI1_MCLK		68
-#define CLK_VE			69
-#define CLK_AC_DIG		70
-#define CLK_AVS			71
-
-#define CLK_MIPI_CSI		73
-
-/* Clocks not available on V3s */
-#define CLK_BUS_I2S0		75
-#define CLK_I2S0		76
-
-#endif /* _DT_BINDINGS_CLK_SUN8I_V3S_H_ */
diff --git a/include/dt-bindings/clock/sun9i-a80-ccu.h b/include/dt-bindings/clock/sun9i-a80-ccu.h
deleted file mode 100644
index 6ea1492a73a6..000000000000
--- a/include/dt-bindings/clock/sun9i-a80-ccu.h
+++ /dev/null
@@ -1,162 +0,0 @@
-/*
- * Copyright (C) 2016 Chen-Yu Tsai <wens@csie.org>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_CLOCK_SUN9I_A80_CCU_H_
-#define _DT_BINDINGS_CLOCK_SUN9I_A80_CCU_H_
-
-#define CLK_PLL_AUDIO		2
-#define CLK_PLL_PERIPH0		3
-
-#define CLK_C0CPUX		12
-#define CLK_C1CPUX		13
-
-#define CLK_OUT_A		27
-#define CLK_OUT_B		28
-
-#define CLK_NAND0_0		29
-#define CLK_NAND0_1		30
-#define CLK_NAND1_0		31
-#define CLK_NAND1_1		32
-#define CLK_MMC0		33
-#define CLK_MMC0_SAMPLE		34
-#define CLK_MMC0_OUTPUT		35
-#define CLK_MMC1		36
-#define CLK_MMC1_SAMPLE		37
-#define CLK_MMC1_OUTPUT		38
-#define CLK_MMC2		39
-#define CLK_MMC2_SAMPLE		40
-#define CLK_MMC2_OUTPUT		41
-#define CLK_MMC3		42
-#define CLK_MMC3_SAMPLE		43
-#define CLK_MMC3_OUTPUT		44
-#define CLK_TS			45
-#define CLK_SS			46
-#define CLK_SPI0		47
-#define CLK_SPI1		48
-#define CLK_SPI2		49
-#define CLK_SPI3		50
-#define CLK_I2S0		51
-#define CLK_I2S1		52
-#define CLK_SPDIF		53
-#define CLK_SDRAM		54
-#define CLK_DE			55
-#define CLK_EDP			56
-#define CLK_MP			57
-#define CLK_LCD0		58
-#define CLK_LCD1		59
-#define CLK_MIPI_DSI0		60
-#define CLK_MIPI_DSI1		61
-#define CLK_HDMI		62
-#define CLK_HDMI_SLOW		63
-#define CLK_MIPI_CSI		64
-#define CLK_CSI_ISP		65
-#define CLK_CSI_MISC		66
-#define CLK_CSI0_MCLK		67
-#define CLK_CSI1_MCLK		68
-#define CLK_FD			69
-#define CLK_VE			70
-#define CLK_AVS			71
-#define CLK_GPU_CORE		72
-#define CLK_GPU_MEMORY		73
-#define CLK_GPU_AXI		74
-#define CLK_SATA		75
-#define CLK_AC97		76
-#define CLK_MIPI_HSI		77
-#define CLK_GPADC		78
-#define CLK_CIR_TX		79
-
-#define CLK_BUS_FD		80
-#define CLK_BUS_VE		81
-#define CLK_BUS_GPU_CTRL	82
-#define CLK_BUS_SS		83
-#define CLK_BUS_MMC		84
-#define CLK_BUS_NAND0		85
-#define CLK_BUS_NAND1		86
-#define CLK_BUS_SDRAM		87
-#define CLK_BUS_MIPI_HSI	88
-#define CLK_BUS_SATA		89
-#define CLK_BUS_TS		90
-#define CLK_BUS_SPI0		91
-#define CLK_BUS_SPI1		92
-#define CLK_BUS_SPI2		93
-#define CLK_BUS_SPI3		94
-
-#define CLK_BUS_OTG		95
-#define CLK_BUS_USB		96
-#define CLK_BUS_GMAC		97
-#define CLK_BUS_MSGBOX		98
-#define CLK_BUS_SPINLOCK	99
-#define CLK_BUS_HSTIMER		100
-#define CLK_BUS_DMA		101
-
-#define CLK_BUS_LCD0		102
-#define CLK_BUS_LCD1		103
-#define CLK_BUS_EDP		104
-#define CLK_BUS_CSI		105
-#define CLK_BUS_HDMI		106
-#define CLK_BUS_DE		107
-#define CLK_BUS_MP		108
-#define CLK_BUS_MIPI_DSI	109
-
-#define CLK_BUS_SPDIF		110
-#define CLK_BUS_PIO		111
-#define CLK_BUS_AC97		112
-#define CLK_BUS_I2S0		113
-#define CLK_BUS_I2S1		114
-#define CLK_BUS_LRADC		115
-#define CLK_BUS_GPADC		116
-#define CLK_BUS_TWD		117
-#define CLK_BUS_CIR_TX		118
-
-#define CLK_BUS_I2C0		119
-#define CLK_BUS_I2C1		120
-#define CLK_BUS_I2C2		121
-#define CLK_BUS_I2C3		122
-#define CLK_BUS_I2C4		123
-#define CLK_BUS_UART0		124
-#define CLK_BUS_UART1		125
-#define CLK_BUS_UART2		126
-#define CLK_BUS_UART3		127
-#define CLK_BUS_UART4		128
-#define CLK_BUS_UART5		129
-
-#endif /* _DT_BINDINGS_CLOCK_SUN9I_A80_CCU_H_ */
diff --git a/include/dt-bindings/clock/sun9i-a80-de.h b/include/dt-bindings/clock/sun9i-a80-de.h
deleted file mode 100644
index 3dad6c3cd131..000000000000
--- a/include/dt-bindings/clock/sun9i-a80-de.h
+++ /dev/null
@@ -1,80 +0,0 @@
-/*
- * Copyright (C) 2016 Chen-Yu Tsai <wens@csie.org>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_CLOCK_SUN9I_A80_DE_H_
-#define _DT_BINDINGS_CLOCK_SUN9I_A80_DE_H_
-
-#define CLK_FE0			0
-#define CLK_FE1			1
-#define CLK_FE2			2
-#define CLK_IEP_DEU0		3
-#define CLK_IEP_DEU1		4
-#define CLK_BE0			5
-#define CLK_BE1			6
-#define CLK_BE2			7
-#define CLK_IEP_DRC0		8
-#define CLK_IEP_DRC1		9
-#define CLK_MERGE		10
-
-#define CLK_DRAM_FE0		11
-#define CLK_DRAM_FE1		12
-#define CLK_DRAM_FE2		13
-#define CLK_DRAM_DEU0		14
-#define CLK_DRAM_DEU1		15
-#define CLK_DRAM_BE0		16
-#define CLK_DRAM_BE1		17
-#define CLK_DRAM_BE2		18
-#define CLK_DRAM_DRC0		19
-#define CLK_DRAM_DRC1		20
-
-#define CLK_BUS_FE0		21
-#define CLK_BUS_FE1		22
-#define CLK_BUS_FE2		23
-#define CLK_BUS_DEU0		24
-#define CLK_BUS_DEU1		25
-#define CLK_BUS_BE0		26
-#define CLK_BUS_BE1		27
-#define CLK_BUS_BE2		28
-#define CLK_BUS_DRC0		29
-#define CLK_BUS_DRC1		30
-
-#endif /* _DT_BINDINGS_CLOCK_SUN9I_A80_DE_H_ */
diff --git a/include/dt-bindings/clock/sun9i-a80-usb.h b/include/dt-bindings/clock/sun9i-a80-usb.h
deleted file mode 100644
index 783a60d2ccea..000000000000
--- a/include/dt-bindings/clock/sun9i-a80-usb.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/*
- * Copyright (C) 2016 Chen-Yu Tsai <wens@csie.org>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_CLOCK_SUN9I_A80_USB_H_
-#define _DT_BINDINGS_CLOCK_SUN9I_A80_USB_H_
-
-#define CLK_BUS_HCI0	0
-#define CLK_USB_OHCI0	1
-#define CLK_BUS_HCI1	2
-#define CLK_BUS_HCI2	3
-#define CLK_USB_OHCI2	4
-
-#define CLK_USB0_PHY	5
-#define CLK_USB1_HSIC	6
-#define CLK_USB1_PHY	7
-#define CLK_USB2_HSIC	8
-#define CLK_USB2_PHY	9
-#define CLK_USB_HSIC	10
-
-#endif /* _DT_BINDINGS_CLOCK_SUN9I_A80_USB_H_ */
diff --git a/include/dt-bindings/clock/suniv-ccu-f1c100s.h b/include/dt-bindings/clock/suniv-ccu-f1c100s.h
deleted file mode 100644
index d7570765f424..000000000000
--- a/include/dt-bindings/clock/suniv-ccu-f1c100s.h
+++ /dev/null
@@ -1,72 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT)
- *
- * Copyright (c) 2018 Icenowy Zheng <icenowy@aosc.xyz>
- *
- */
-
-#ifndef _DT_BINDINGS_CLK_SUNIV_F1C100S_H_
-#define _DT_BINDINGS_CLK_SUNIV_F1C100S_H_
-
-#define CLK_CPU			11
-
-#define CLK_BUS_DMA		14
-#define CLK_BUS_MMC0		15
-#define CLK_BUS_MMC1		16
-#define CLK_BUS_DRAM		17
-#define CLK_BUS_SPI0		18
-#define CLK_BUS_SPI1		19
-#define CLK_BUS_OTG		20
-#define CLK_BUS_VE		21
-#define CLK_BUS_LCD		22
-#define CLK_BUS_DEINTERLACE	23
-#define CLK_BUS_CSI		24
-#define CLK_BUS_TVD		25
-#define CLK_BUS_TVE		26
-#define CLK_BUS_DE_BE		27
-#define CLK_BUS_DE_FE		28
-#define CLK_BUS_CODEC		29
-#define CLK_BUS_SPDIF		30
-#define CLK_BUS_IR		31
-#define CLK_BUS_RSB		32
-#define CLK_BUS_I2S0		33
-#define CLK_BUS_I2C0		34
-#define CLK_BUS_I2C1		35
-#define CLK_BUS_I2C2		36
-#define CLK_BUS_PIO		37
-#define CLK_BUS_UART0		38
-#define CLK_BUS_UART1		39
-#define CLK_BUS_UART2		40
-
-#define CLK_MMC0		41
-#define CLK_MMC0_SAMPLE		42
-#define CLK_MMC0_OUTPUT		43
-#define CLK_MMC1		44
-#define CLK_MMC1_SAMPLE		45
-#define CLK_MMC1_OUTPUT		46
-#define CLK_I2S			47
-#define CLK_SPDIF		48
-
-#define CLK_USB_PHY0		49
-
-#define CLK_DRAM_VE		50
-#define CLK_DRAM_CSI		51
-#define CLK_DRAM_DEINTERLACE	52
-#define CLK_DRAM_TVD		53
-#define CLK_DRAM_DE_FE		54
-#define CLK_DRAM_DE_BE		55
-
-#define CLK_DE_BE		56
-#define CLK_DE_FE		57
-#define CLK_TCON		58
-#define CLK_DEINTERLACE		59
-#define CLK_TVE2_CLK		60
-#define CLK_TVE1_CLK		61
-#define CLK_TVD			62
-#define CLK_CSI			63
-#define CLK_VE			64
-#define CLK_CODEC		65
-#define CLK_AVS			66
-
-#define CLK_IR			67
-
-#endif

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
