Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C39B388622D
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Mar 2024 22:04:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A00FC6DD69;
	Thu, 21 Mar 2024 21:04:15 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C51DC6DD69
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 21:04:14 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-414689ba80eso11658545e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 14:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711055053; x=1711659853;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W2ME3680/XM9E+U1LdkBQ0ULHl78R/cNEwl6oPmef80=;
 b=Ta9oqUxYROPStiyrzcjszXaFp4q8MT8q64OqAzhF62/awMjTiA/wJZtGGzch4AG6Ms
 PGJZxj528UxLNDHhSIG2DkfX7seQiGhUZpEBvJBo2DamXnSnfT/Gez+ITGfxyKV7mfe3
 y+b/upWm8WSzHOxd+xz4wN9GA6INyPm8zKyqqaZrRD2PoHTCK8yJqhrSj0riEPosF8rM
 v7mCeJUORegjf4MI2jOK2tJUuVjFxnIiNiUsslR/jn24WK3hMpDmTU7apVvbK8dSOlfH
 C/AJvnAJOVpzVh//XCPQraMrzDSHIE6tBqGdt351Nm/aTIZstYHd2WavfeBMRppx2SDT
 LH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711055053; x=1711659853;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W2ME3680/XM9E+U1LdkBQ0ULHl78R/cNEwl6oPmef80=;
 b=ZYtbogqKga7xjzRsPJajprCJOaJ7bDlHqCgNJCKluNulxggHVRMhjiv+3kDnoP9UWI
 is5uiOKY3SBOkGvNWUS87aVOCwLCDahJ2df4DfllrReniEPGT/xFEEKQsMHM9+K9mA6w
 Tp4YGhMQoq11zebQJ9VYABvQJCwh1RUCe1YV6xIlsxTqjZUNNNbyScfLEagzhSXPBH5K
 pDK1PTghb2wgf2OTPcgSQpKH16xT54QsW+iRttlG3XHPHX97t50y804c8CnrzpaDjD40
 PVoXE+zCRIUw8LPyuXYwN2ZdNhoM6LQ9XFBKH4pINhBZC22Zpo1GxTZMPtR3ojEJTO89
 k0QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeKORZhsVG7oNvp2Py4RyxXI1c2YVMhSBVxry8OYYM6HyHCB9J0hAtktUMCpYzzeJfjFiWEJ9PDzMvmpcVEz6hEbzr9H8Lq+lyNU1WUPynbEF+CqpUiEIF
X-Gm-Message-State: AOJu0YxWZ21jFJAUVvoEbVqsDM/2YDrt7b+4yq8hSRXvgzuc8M5uVIhc
 fOIeh1HMLEM2iUcoYpHghYkiSCzJsJSXi4VodP0YnVV/2zb0v5imOE3EBfvsEgY=
X-Google-Smtp-Source: AGHT+IFMVLqRejTy5EijnrRPi9tk1ojpir8LkkSr0MaiQrAhqRPNwqtpm3bJy1T9TrSEhrcaLtsBBA==
X-Received: by 2002:a05:600c:198a:b0:414:a54:ec04 with SMTP id
 t10-20020a05600c198a00b004140a54ec04mr220755wmq.4.1711055053324; 
 Thu, 21 Mar 2024 14:04:13 -0700 (PDT)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b004146f728906sm925462wmb.7.2024.03.21.14.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 14:04:12 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Thu, 21 Mar 2024 21:03:50 +0000
MIME-Version: 1.0
Message-Id: <20240321-b4-upstream-dt-headers-v2-7-1eac0df875fe@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=71376;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=W3jZW+rPjPtBy4s4qjyVVQEOVYjIbLAcO4aAHVV1aD0=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtQ/C3Z/84xm8nHSfT9nV1dGVbtWxcwfBxfXZNUqyOkc9
 4ot2KLdUcrCIMjBICumyCJ+Ypll09rL9hrbF1yAmcPKBDKEgYtTACZiFMTwz7rWrHGSmF/tJ/6T
 cit6D/y16+aQO7f5NPN8s+N/nDnKnBn+KUm4HTK7dbJS/f6zOq1NevvWeQqac1pMcS5Pqfz//JC
 pMAA=
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 07/24] amlogic: drop dt-binding headers
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

Dropped in favour of dts/upstream

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on AML-S805X-AC
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on AML-S905X-CC
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on BPI-M2S
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on BPI-M5
---
 .../clock/amlogic,a1-peripherals-clkc.h            | 168 ---------------------
 include/dt-bindings/clock/amlogic,a1-pll-clkc.h    |  25 ---
 include/dt-bindings/clock/axg-aoclkc.h             |  31 ----
 include/dt-bindings/clock/axg-audio-clkc.h         |  94 ------------
 include/dt-bindings/clock/axg-clkc.h               | 100 ------------
 include/dt-bindings/clock/g12a-aoclkc.h            |  36 -----
 include/dt-bindings/clock/g12a-clkc.h              | 153 -------------------
 include/dt-bindings/clock/gxbb-aoclkc.h            |  74 ---------
 include/dt-bindings/clock/gxbb-clkc.h              | 151 ------------------
 include/dt-bindings/gpio/meson-a1-gpio.h           |  73 ---------
 include/dt-bindings/gpio/meson-axg-gpio.h          | 116 --------------
 include/dt-bindings/gpio/meson-g12a-gpio.h         | 114 --------------
 include/dt-bindings/gpio/meson-gxbb-gpio.h         | 148 ------------------
 include/dt-bindings/gpio/meson-gxl-gpio.h          | 125 ---------------
 include/dt-bindings/power/meson-a1-power.h         |  32 ----
 include/dt-bindings/power/meson-axg-power.h        |  14 --
 include/dt-bindings/power/meson-g12a-power.h       |  13 --
 include/dt-bindings/power/meson-gxbb-power.h       |  13 --
 include/dt-bindings/power/meson-sm1-power.h        |  18 ---
 include/dt-bindings/reset/amlogic,meson-a1-reset.h |  76 ----------
 .../reset/amlogic,meson-axg-audio-arb.h            |  19 ---
 .../dt-bindings/reset/amlogic,meson-axg-reset.h    | 123 ---------------
 .../reset/amlogic,meson-g12a-audio-reset.h         |  53 -------
 .../dt-bindings/reset/amlogic,meson-g12a-reset.h   | 137 -----------------
 .../dt-bindings/reset/amlogic,meson-gxbb-reset.h   | 161 --------------------
 include/dt-bindings/reset/axg-aoclkc.h             |  20 ---
 include/dt-bindings/reset/g12a-aoclkc.h            |  18 ---
 include/dt-bindings/reset/gxbb-aoclkc.h            |  66 --------
 include/dt-bindings/sound/meson-aiu.h              |  18 ---
 include/dt-bindings/sound/meson-g12a-toacodec.h    |  10 --
 include/dt-bindings/sound/meson-g12a-tohdmitx.h    |  13 --
 31 files changed, 2212 deletions(-)

diff --git a/include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h
deleted file mode 100644
index 06f198ee7623..000000000000
--- a/include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h
+++ /dev/null
@@ -1,168 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
-/*
- * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
- * Author: Jian Hu <jian.hu@amlogic.com>
- *
- * Copyright (c) 2023, SberDevices. All Rights Reserved.
- * Author: Dmitry Rokosov <ddrokosov@sberdevices.ru>
- */
-
-#ifndef __A1_PERIPHERALS_CLKC_H
-#define __A1_PERIPHERALS_CLKC_H
-
-#define CLKID_XTAL_IN		0
-#define CLKID_FIXPLL_IN		1
-#define CLKID_USB_PHY_IN	2
-#define CLKID_USB_CTRL_IN	3
-#define CLKID_HIFIPLL_IN	4
-#define CLKID_SYSPLL_IN		5
-#define CLKID_DDS_IN		6
-#define CLKID_SYS		7
-#define CLKID_CLKTREE		8
-#define CLKID_RESET_CTRL	9
-#define CLKID_ANALOG_CTRL	10
-#define CLKID_PWR_CTRL		11
-#define CLKID_PAD_CTRL		12
-#define CLKID_SYS_CTRL		13
-#define CLKID_TEMP_SENSOR	14
-#define CLKID_AM2AXI_DIV	15
-#define CLKID_SPICC_B		16
-#define CLKID_SPICC_A		17
-#define CLKID_MSR		18
-#define CLKID_AUDIO		19
-#define CLKID_JTAG_CTRL		20
-#define CLKID_SARADC_EN		21
-#define CLKID_PWM_EF		22
-#define CLKID_PWM_CD		23
-#define CLKID_PWM_AB		24
-#define CLKID_CEC		25
-#define CLKID_I2C_S		26
-#define CLKID_IR_CTRL		27
-#define CLKID_I2C_M_D		28
-#define CLKID_I2C_M_C		29
-#define CLKID_I2C_M_B		30
-#define CLKID_I2C_M_A		31
-#define CLKID_ACODEC		32
-#define CLKID_OTP		33
-#define CLKID_SD_EMMC_A		34
-#define CLKID_USB_PHY		35
-#define CLKID_USB_CTRL		36
-#define CLKID_SYS_DSPB		37
-#define CLKID_SYS_DSPA		38
-#define CLKID_DMA		39
-#define CLKID_IRQ_CTRL		40
-#define CLKID_NIC		41
-#define CLKID_GIC		42
-#define CLKID_UART_C		43
-#define CLKID_UART_B		44
-#define CLKID_UART_A		45
-#define CLKID_SYS_PSRAM		46
-#define CLKID_RSA		47
-#define CLKID_CORESIGHT		48
-#define CLKID_AM2AXI_VAD	49
-#define CLKID_AUDIO_VAD		50
-#define CLKID_AXI_DMC		51
-#define CLKID_AXI_PSRAM		52
-#define CLKID_RAMB		53
-#define CLKID_RAMA		54
-#define CLKID_AXI_SPIFC		55
-#define CLKID_AXI_NIC		56
-#define CLKID_AXI_DMA		57
-#define CLKID_CPU_CTRL		58
-#define CLKID_ROM		59
-#define CLKID_PROC_I2C		60
-#define CLKID_DSPA_SEL		61
-#define CLKID_DSPB_SEL		62
-#define CLKID_DSPA_EN		63
-#define CLKID_DSPA_EN_NIC	64
-#define CLKID_DSPB_EN		65
-#define CLKID_DSPB_EN_NIC	66
-#define CLKID_RTC		67
-#define CLKID_CECA_32K		68
-#define CLKID_CECB_32K		69
-#define CLKID_24M		70
-#define CLKID_12M		71
-#define CLKID_FCLK_DIV2_DIVN	72
-#define CLKID_GEN		73
-#define CLKID_SARADC_SEL	74
-#define CLKID_SARADC		75
-#define CLKID_PWM_A		76
-#define CLKID_PWM_B		77
-#define CLKID_PWM_C		78
-#define CLKID_PWM_D		79
-#define CLKID_PWM_E		80
-#define CLKID_PWM_F		81
-#define CLKID_SPICC		82
-#define CLKID_TS		83
-#define CLKID_SPIFC		84
-#define CLKID_USB_BUS		85
-#define CLKID_SD_EMMC		86
-#define CLKID_PSRAM		87
-#define CLKID_DMC		88
-#define CLKID_SYS_A_SEL		89
-#define CLKID_SYS_A_DIV		90
-#define CLKID_SYS_A		91
-#define CLKID_SYS_B_SEL		92
-#define CLKID_SYS_B_DIV		93
-#define CLKID_SYS_B		94
-#define CLKID_DSPA_A_SEL	95
-#define CLKID_DSPA_A_DIV	96
-#define CLKID_DSPA_A		97
-#define CLKID_DSPA_B_SEL	98
-#define CLKID_DSPA_B_DIV	99
-#define CLKID_DSPA_B		100
-#define CLKID_DSPB_A_SEL	101
-#define CLKID_DSPB_A_DIV	102
-#define CLKID_DSPB_A		103
-#define CLKID_DSPB_B_SEL	104
-#define CLKID_DSPB_B_DIV	105
-#define CLKID_DSPB_B		106
-#define CLKID_RTC_32K_IN	107
-#define CLKID_RTC_32K_DIV	108
-#define CLKID_RTC_32K_XTAL	109
-#define CLKID_RTC_32K_SEL	110
-#define CLKID_CECB_32K_IN	111
-#define CLKID_CECB_32K_DIV	112
-#define CLKID_CECB_32K_SEL_PRE	113
-#define CLKID_CECB_32K_SEL	114
-#define CLKID_CECA_32K_IN	115
-#define CLKID_CECA_32K_DIV	116
-#define CLKID_CECA_32K_SEL_PRE	117
-#define CLKID_CECA_32K_SEL	118
-#define CLKID_DIV2_PRE		119
-#define CLKID_24M_DIV2		120
-#define CLKID_GEN_SEL		121
-#define CLKID_GEN_DIV		122
-#define CLKID_SARADC_DIV	123
-#define CLKID_PWM_A_SEL		124
-#define CLKID_PWM_A_DIV		125
-#define CLKID_PWM_B_SEL		126
-#define CLKID_PWM_B_DIV		127
-#define CLKID_PWM_C_SEL		128
-#define CLKID_PWM_C_DIV		129
-#define CLKID_PWM_D_SEL		130
-#define CLKID_PWM_D_DIV		131
-#define CLKID_PWM_E_SEL		132
-#define CLKID_PWM_E_DIV		133
-#define CLKID_PWM_F_SEL		134
-#define CLKID_PWM_F_DIV		135
-#define CLKID_SPICC_SEL		136
-#define CLKID_SPICC_DIV		137
-#define CLKID_SPICC_SEL2	138
-#define CLKID_TS_DIV		139
-#define CLKID_SPIFC_SEL		140
-#define CLKID_SPIFC_DIV		141
-#define CLKID_SPIFC_SEL2	142
-#define CLKID_USB_BUS_SEL	143
-#define CLKID_USB_BUS_DIV	144
-#define CLKID_SD_EMMC_SEL	145
-#define CLKID_SD_EMMC_DIV	146
-#define CLKID_SD_EMMC_SEL2	147
-#define CLKID_PSRAM_SEL		148
-#define CLKID_PSRAM_DIV		149
-#define CLKID_PSRAM_SEL2	150
-#define CLKID_DMC_SEL		151
-#define CLKID_DMC_DIV		152
-#define CLKID_DMC_SEL2		153
-
-#endif /* __A1_PERIPHERALS_CLKC_H */
diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
deleted file mode 100644
index 2b660c0f2c9f..000000000000
--- a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
-/*
- * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
- * Author: Jian Hu <jian.hu@amlogic.com>
- *
- * Copyright (c) 2023, SberDevices. All Rights Reserved.
- * Author: Dmitry Rokosov <ddrokosov@sberdevices.ru>
- */
-
-#ifndef __A1_PLL_CLKC_H
-#define __A1_PLL_CLKC_H
-
-#define CLKID_FIXED_PLL_DCO	0
-#define CLKID_FIXED_PLL		1
-#define CLKID_FCLK_DIV2_DIV	2
-#define CLKID_FCLK_DIV3_DIV	3
-#define CLKID_FCLK_DIV5_DIV	4
-#define CLKID_FCLK_DIV7_DIV	5
-#define CLKID_FCLK_DIV2		6
-#define CLKID_FCLK_DIV3		7
-#define CLKID_FCLK_DIV5		8
-#define CLKID_FCLK_DIV7		9
-#define CLKID_HIFI_PLL		10
-
-#endif /* __A1_PLL_CLKC_H */
diff --git a/include/dt-bindings/clock/axg-aoclkc.h b/include/dt-bindings/clock/axg-aoclkc.h
deleted file mode 100644
index 8ec4a269c7a6..000000000000
--- a/include/dt-bindings/clock/axg-aoclkc.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
-/*
- * Copyright (c) 2016 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * Copyright (c) 2018 Amlogic, inc.
- * Author: Qiufang Dai <qiufang.dai@amlogic.com>
- */
-
-#ifndef DT_BINDINGS_CLOCK_AMLOGIC_MESON_AXG_AOCLK
-#define DT_BINDINGS_CLOCK_AMLOGIC_MESON_AXG_AOCLK
-
-#define CLKID_AO_REMOTE		0
-#define CLKID_AO_I2C_MASTER	1
-#define CLKID_AO_I2C_SLAVE	2
-#define CLKID_AO_UART1		3
-#define CLKID_AO_UART2		4
-#define CLKID_AO_IR_BLASTER	5
-#define CLKID_AO_SAR_ADC	6
-#define CLKID_AO_CLK81		7
-#define CLKID_AO_SAR_ADC_SEL	8
-#define CLKID_AO_SAR_ADC_DIV	9
-#define CLKID_AO_SAR_ADC_CLK	10
-#define CLKID_AO_CTS_OSCIN	11
-#define CLKID_AO_32K_PRE	12
-#define CLKID_AO_32K_DIV	13
-#define CLKID_AO_32K_SEL	14
-#define CLKID_AO_32K		15
-#define CLKID_AO_CTS_RTC_OSCIN	16
-
-#endif
diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
deleted file mode 100644
index f561f5c5ef8f..000000000000
--- a/include/dt-bindings/clock/axg-audio-clkc.h
+++ /dev/null
@@ -1,94 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
-/*
- * Copyright (c) 2018 Baylibre SAS.
- * Author: Jerome Brunet <jbrunet@baylibre.com>
- */
-
-#ifndef __AXG_AUDIO_CLKC_BINDINGS_H
-#define __AXG_AUDIO_CLKC_BINDINGS_H
-
-#define AUD_CLKID_DDR_ARB		29
-#define AUD_CLKID_PDM			30
-#define AUD_CLKID_TDMIN_A		31
-#define AUD_CLKID_TDMIN_B		32
-#define AUD_CLKID_TDMIN_C		33
-#define AUD_CLKID_TDMIN_LB		34
-#define AUD_CLKID_TDMOUT_A		35
-#define AUD_CLKID_TDMOUT_B		36
-#define AUD_CLKID_TDMOUT_C		37
-#define AUD_CLKID_FRDDR_A		38
-#define AUD_CLKID_FRDDR_B		39
-#define AUD_CLKID_FRDDR_C		40
-#define AUD_CLKID_TODDR_A		41
-#define AUD_CLKID_TODDR_B		42
-#define AUD_CLKID_TODDR_C		43
-#define AUD_CLKID_LOOPBACK		44
-#define AUD_CLKID_SPDIFIN		45
-#define AUD_CLKID_SPDIFOUT		46
-#define AUD_CLKID_RESAMPLE		47
-#define AUD_CLKID_POWER_DETECT		48
-#define AUD_CLKID_MST_A_MCLK		49
-#define AUD_CLKID_MST_B_MCLK		50
-#define AUD_CLKID_MST_C_MCLK		51
-#define AUD_CLKID_MST_D_MCLK		52
-#define AUD_CLKID_MST_E_MCLK		53
-#define AUD_CLKID_MST_F_MCLK		54
-#define AUD_CLKID_SPDIFOUT_CLK		55
-#define AUD_CLKID_SPDIFIN_CLK		56
-#define AUD_CLKID_PDM_DCLK		57
-#define AUD_CLKID_PDM_SYSCLK		58
-#define AUD_CLKID_MST_A_SCLK		79
-#define AUD_CLKID_MST_B_SCLK		80
-#define AUD_CLKID_MST_C_SCLK		81
-#define AUD_CLKID_MST_D_SCLK		82
-#define AUD_CLKID_MST_E_SCLK		83
-#define AUD_CLKID_MST_F_SCLK		84
-#define AUD_CLKID_MST_A_LRCLK		86
-#define AUD_CLKID_MST_B_LRCLK		87
-#define AUD_CLKID_MST_C_LRCLK		88
-#define AUD_CLKID_MST_D_LRCLK		89
-#define AUD_CLKID_MST_E_LRCLK		90
-#define AUD_CLKID_MST_F_LRCLK		91
-#define AUD_CLKID_TDMIN_A_SCLK_SEL	116
-#define AUD_CLKID_TDMIN_B_SCLK_SEL	117
-#define AUD_CLKID_TDMIN_C_SCLK_SEL	118
-#define AUD_CLKID_TDMIN_LB_SCLK_SEL	119
-#define AUD_CLKID_TDMOUT_A_SCLK_SEL	120
-#define AUD_CLKID_TDMOUT_B_SCLK_SEL	121
-#define AUD_CLKID_TDMOUT_C_SCLK_SEL	122
-#define AUD_CLKID_TDMIN_A_SCLK		123
-#define AUD_CLKID_TDMIN_B_SCLK		124
-#define AUD_CLKID_TDMIN_C_SCLK		125
-#define AUD_CLKID_TDMIN_LB_SCLK		126
-#define AUD_CLKID_TDMOUT_A_SCLK		127
-#define AUD_CLKID_TDMOUT_B_SCLK		128
-#define AUD_CLKID_TDMOUT_C_SCLK		129
-#define AUD_CLKID_TDMIN_A_LRCLK		130
-#define AUD_CLKID_TDMIN_B_LRCLK		131
-#define AUD_CLKID_TDMIN_C_LRCLK		132
-#define AUD_CLKID_TDMIN_LB_LRCLK	133
-#define AUD_CLKID_TDMOUT_A_LRCLK	134
-#define AUD_CLKID_TDMOUT_B_LRCLK	135
-#define AUD_CLKID_TDMOUT_C_LRCLK	136
-#define AUD_CLKID_SPDIFOUT_B		151
-#define AUD_CLKID_SPDIFOUT_B_CLK	152
-#define AUD_CLKID_TDM_MCLK_PAD0		155
-#define AUD_CLKID_TDM_MCLK_PAD1		156
-#define AUD_CLKID_TDM_LRCLK_PAD0	157
-#define AUD_CLKID_TDM_LRCLK_PAD1	158
-#define AUD_CLKID_TDM_LRCLK_PAD2	159
-#define AUD_CLKID_TDM_SCLK_PAD0		160
-#define AUD_CLKID_TDM_SCLK_PAD1		161
-#define AUD_CLKID_TDM_SCLK_PAD2		162
-#define AUD_CLKID_TOP			163
-#define AUD_CLKID_TORAM			164
-#define AUD_CLKID_EQDRC			165
-#define AUD_CLKID_RESAMPLE_B		166
-#define AUD_CLKID_TOVAD			167
-#define AUD_CLKID_LOCKER		168
-#define AUD_CLKID_SPDIFIN_LB		169
-#define AUD_CLKID_FRDDR_D		170
-#define AUD_CLKID_TODDR_D		171
-#define AUD_CLKID_LOOPBACK_B		172
-
-#endif /* __AXG_AUDIO_CLKC_BINDINGS_H */
diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
deleted file mode 100644
index 93752ea107e3..000000000000
--- a/include/dt-bindings/clock/axg-clkc.h
+++ /dev/null
@@ -1,100 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Meson-AXG clock tree IDs
- *
- * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
- */
-
-#ifndef __AXG_CLKC_H
-#define __AXG_CLKC_H
-
-#define CLKID_SYS_PLL				0
-#define CLKID_FIXED_PLL				1
-#define CLKID_FCLK_DIV2				2
-#define CLKID_FCLK_DIV3				3
-#define CLKID_FCLK_DIV4				4
-#define CLKID_FCLK_DIV5				5
-#define CLKID_FCLK_DIV7				6
-#define CLKID_GP0_PLL				7
-#define CLKID_CLK81				10
-#define CLKID_MPLL0				11
-#define CLKID_MPLL1				12
-#define CLKID_MPLL2				13
-#define CLKID_MPLL3				14
-#define CLKID_DDR				15
-#define CLKID_AUDIO_LOCKER			16
-#define CLKID_MIPI_DSI_HOST			17
-#define CLKID_ISA				18
-#define CLKID_PL301				19
-#define CLKID_PERIPHS				20
-#define CLKID_SPICC0				21
-#define CLKID_I2C				22
-#define CLKID_RNG0				23
-#define CLKID_UART0				24
-#define CLKID_MIPI_DSI_PHY			25
-#define CLKID_SPICC1				26
-#define CLKID_PCIE_A				27
-#define CLKID_PCIE_B				28
-#define CLKID_HIU_IFACE				29
-#define CLKID_ASSIST_MISC			30
-#define CLKID_SD_EMMC_B				31
-#define CLKID_SD_EMMC_C				32
-#define CLKID_DMA				33
-#define CLKID_SPI				34
-#define CLKID_AUDIO				35
-#define CLKID_ETH				36
-#define CLKID_UART1				37
-#define CLKID_G2D				38
-#define CLKID_USB0				39
-#define CLKID_USB1				40
-#define CLKID_RESET				41
-#define CLKID_USB				42
-#define CLKID_AHB_ARB0				43
-#define CLKID_EFUSE				44
-#define CLKID_BOOT_ROM				45
-#define CLKID_AHB_DATA_BUS			46
-#define CLKID_AHB_CTRL_BUS			47
-#define CLKID_USB1_DDR_BRIDGE			48
-#define CLKID_USB0_DDR_BRIDGE			49
-#define CLKID_MMC_PCLK				50
-#define CLKID_VPU_INTR				51
-#define CLKID_SEC_AHB_AHB3_BRIDGE		52
-#define CLKID_GIC				53
-#define CLKID_AO_MEDIA_CPU			54
-#define CLKID_AO_AHB_SRAM			55
-#define CLKID_AO_AHB_BUS			56
-#define CLKID_AO_IFACE				57
-#define CLKID_AO_I2C				58
-#define CLKID_SD_EMMC_B_CLK0			59
-#define CLKID_SD_EMMC_C_CLK0			60
-#define CLKID_HIFI_PLL				69
-#define CLKID_PCIE_CML_EN0			79
-#define CLKID_PCIE_CML_EN1			80
-#define CLKID_GEN_CLK				84
-#define CLKID_VPU_0_SEL				92
-#define CLKID_VPU_0				93
-#define CLKID_VPU_1_SEL				95
-#define CLKID_VPU_1				96
-#define CLKID_VPU				97
-#define CLKID_VAPB_0_SEL			99
-#define CLKID_VAPB_0				100
-#define CLKID_VAPB_1_SEL			102
-#define CLKID_VAPB_1				103
-#define CLKID_VAPB_SEL				104
-#define CLKID_VAPB				105
-#define CLKID_VCLK				106
-#define CLKID_VCLK2				107
-#define CLKID_VCLK_DIV1				122
-#define CLKID_VCLK_DIV2				123
-#define CLKID_VCLK_DIV4				124
-#define CLKID_VCLK_DIV6				125
-#define CLKID_VCLK_DIV12			126
-#define CLKID_VCLK2_DIV1			127
-#define CLKID_VCLK2_DIV2			128
-#define CLKID_VCLK2_DIV4			129
-#define CLKID_VCLK2_DIV6			130
-#define CLKID_VCLK2_DIV12			131
-#define CLKID_CTS_ENCL				133
-#define CLKID_VDIN_MEAS				136
-
-#endif /* __AXG_CLKC_H */
diff --git a/include/dt-bindings/clock/g12a-aoclkc.h b/include/dt-bindings/clock/g12a-aoclkc.h
deleted file mode 100644
index e916e49ff288..000000000000
--- a/include/dt-bindings/clock/g12a-aoclkc.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
-/*
- * Copyright (c) 2016 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * Copyright (c) 2018 Amlogic, inc.
- * Author: Qiufang Dai <qiufang.dai@amlogic.com>
- */
-
-#ifndef DT_BINDINGS_CLOCK_AMLOGIC_MESON_G12A_AOCLK
-#define DT_BINDINGS_CLOCK_AMLOGIC_MESON_G12A_AOCLK
-
-#define CLKID_AO_AHB		0
-#define CLKID_AO_IR_IN		1
-#define CLKID_AO_I2C_M0		2
-#define CLKID_AO_I2C_S0		3
-#define CLKID_AO_UART		4
-#define CLKID_AO_PROD_I2C	5
-#define CLKID_AO_UART2		6
-#define CLKID_AO_IR_OUT		7
-#define CLKID_AO_SAR_ADC	8
-#define CLKID_AO_MAILBOX	9
-#define CLKID_AO_M3		10
-#define CLKID_AO_AHB_SRAM	11
-#define CLKID_AO_RTI		12
-#define CLKID_AO_M4_FCLK	13
-#define CLKID_AO_M4_HCLK	14
-#define CLKID_AO_CLK81		15
-#define CLKID_AO_SAR_ADC_SEL	16
-#define CLKID_AO_SAR_ADC_CLK	18
-#define CLKID_AO_CTS_OSCIN	19
-#define CLKID_AO_32K		23
-#define CLKID_AO_CEC		27
-#define CLKID_AO_CTS_RTC_OSCIN	28
-
-#endif
diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
deleted file mode 100644
index a93b58c5e18e..000000000000
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ /dev/null
@@ -1,153 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ OR MIT */
-/*
- * Meson-G12A clock tree IDs
- *
- * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
- */
-
-#ifndef __G12A_CLKC_H
-#define __G12A_CLKC_H
-
-#define CLKID_SYS_PLL				0
-#define CLKID_FIXED_PLL				1
-#define CLKID_FCLK_DIV2				2
-#define CLKID_FCLK_DIV3				3
-#define CLKID_FCLK_DIV4				4
-#define CLKID_FCLK_DIV5				5
-#define CLKID_FCLK_DIV7				6
-#define CLKID_GP0_PLL				7
-#define CLKID_CLK81				10
-#define CLKID_MPLL0				11
-#define CLKID_MPLL1				12
-#define CLKID_MPLL2				13
-#define CLKID_MPLL3				14
-#define CLKID_DDR				15
-#define CLKID_DOS				16
-#define CLKID_AUDIO_LOCKER			17
-#define CLKID_MIPI_DSI_HOST			18
-#define CLKID_ETH_PHY				19
-#define CLKID_ISA				20
-#define CLKID_PL301				21
-#define CLKID_PERIPHS				22
-#define CLKID_SPICC0				23
-#define CLKID_I2C				24
-#define CLKID_SANA				25
-#define CLKID_SD				26
-#define CLKID_RNG0				27
-#define CLKID_UART0				28
-#define CLKID_SPICC1				29
-#define CLKID_HIU_IFACE				30
-#define CLKID_MIPI_DSI_PHY			31
-#define CLKID_ASSIST_MISC			32
-#define CLKID_SD_EMMC_A				33
-#define CLKID_SD_EMMC_B				34
-#define CLKID_SD_EMMC_C				35
-#define CLKID_AUDIO_CODEC			36
-#define CLKID_AUDIO				37
-#define CLKID_ETH				38
-#define CLKID_DEMUX				39
-#define CLKID_AUDIO_IFIFO			40
-#define CLKID_ADC				41
-#define CLKID_UART1				42
-#define CLKID_G2D				43
-#define CLKID_RESET				44
-#define CLKID_PCIE_COMB				45
-#define CLKID_PARSER				46
-#define CLKID_USB				47
-#define CLKID_PCIE_PHY				48
-#define CLKID_AHB_ARB0				49
-#define CLKID_AHB_DATA_BUS			50
-#define CLKID_AHB_CTRL_BUS			51
-#define CLKID_HTX_HDCP22			52
-#define CLKID_HTX_PCLK				53
-#define CLKID_BT656				54
-#define CLKID_USB1_DDR_BRIDGE			55
-#define CLKID_MMC_PCLK				56
-#define CLKID_UART2				57
-#define CLKID_VPU_INTR				58
-#define CLKID_GIC				59
-#define CLKID_SD_EMMC_A_CLK0			60
-#define CLKID_SD_EMMC_B_CLK0			61
-#define CLKID_SD_EMMC_C_CLK0			62
-#define CLKID_HIFI_PLL				74
-#define CLKID_VCLK2_VENCI0			80
-#define CLKID_VCLK2_VENCI1			81
-#define CLKID_VCLK2_VENCP0			82
-#define CLKID_VCLK2_VENCP1			83
-#define CLKID_VCLK2_VENCT0			84
-#define CLKID_VCLK2_VENCT1			85
-#define CLKID_VCLK2_OTHER			86
-#define CLKID_VCLK2_ENCI			87
-#define CLKID_VCLK2_ENCP			88
-#define CLKID_DAC_CLK				89
-#define CLKID_AOCLK				90
-#define CLKID_IEC958				91
-#define CLKID_ENC480P				92
-#define CLKID_RNG1				93
-#define CLKID_VCLK2_ENCT			94
-#define CLKID_VCLK2_ENCL			95
-#define CLKID_VCLK2_VENCLMMC			96
-#define CLKID_VCLK2_VENCL			97
-#define CLKID_VCLK2_OTHER1			98
-#define CLKID_FCLK_DIV2P5			99
-#define CLKID_DMA				105
-#define CLKID_EFUSE				106
-#define CLKID_ROM_BOOT				107
-#define CLKID_RESET_SEC				108
-#define CLKID_SEC_AHB_APB3			109
-#define CLKID_VPU_0_SEL				110
-#define CLKID_VPU_0				112
-#define CLKID_VPU_1_SEL				113
-#define CLKID_VPU_1				115
-#define CLKID_VPU				116
-#define CLKID_VAPB_0_SEL			117
-#define CLKID_VAPB_0				119
-#define CLKID_VAPB_1_SEL			120
-#define CLKID_VAPB_1				122
-#define CLKID_VAPB_SEL				123
-#define CLKID_VAPB				124
-#define CLKID_HDMI_PLL				128
-#define CLKID_VID_PLL				129
-#define CLKID_VCLK				138
-#define CLKID_VCLK2				139
-#define CLKID_VCLK_DIV1				148
-#define CLKID_VCLK_DIV2				149
-#define CLKID_VCLK_DIV4				150
-#define CLKID_VCLK_DIV6				151
-#define CLKID_VCLK_DIV12			152
-#define CLKID_VCLK2_DIV1			153
-#define CLKID_VCLK2_DIV2			154
-#define CLKID_VCLK2_DIV4			155
-#define CLKID_VCLK2_DIV6			156
-#define CLKID_VCLK2_DIV12			157
-#define CLKID_CTS_ENCI				162
-#define CLKID_CTS_ENCP				163
-#define CLKID_CTS_VDAC				164
-#define CLKID_HDMI_TX				165
-#define CLKID_HDMI				168
-#define CLKID_MALI_0_SEL			169
-#define CLKID_MALI_0				171
-#define CLKID_MALI_1_SEL			172
-#define CLKID_MALI_1				174
-#define CLKID_MALI				175
-#define CLKID_MPLL_50M				177
-#define CLKID_CPU_CLK				187
-#define CLKID_PCIE_PLL				201
-#define CLKID_VDEC_1				204
-#define CLKID_VDEC_HEVC				207
-#define CLKID_VDEC_HEVCF			210
-#define CLKID_TS				212
-#define CLKID_CPUB_CLK				224
-#define CLKID_GP1_PLL				243
-#define CLKID_DSU_CLK				252
-#define CLKID_CPU1_CLK				253
-#define CLKID_CPU2_CLK				254
-#define CLKID_CPU3_CLK				255
-#define CLKID_SPICC0_SCLK			258
-#define CLKID_SPICC1_SCLK			261
-#define CLKID_NNA_AXI_CLK			264
-#define CLKID_NNA_CORE_CLK			267
-#define CLKID_MIPI_DSI_PXCLK_SEL		269
-#define CLKID_MIPI_DSI_PXCLK			270
-
-#endif /* __G12A_CLKC_H */
diff --git a/include/dt-bindings/clock/gxbb-aoclkc.h b/include/dt-bindings/clock/gxbb-aoclkc.h
deleted file mode 100644
index ec3b26319fc4..000000000000
--- a/include/dt-bindings/clock/gxbb-aoclkc.h
+++ /dev/null
@@ -1,74 +0,0 @@
-/*
- * This file is provided under a dual BSD/GPLv2 license.  When using or
- * redistributing this file, you may do so under either license.
- *
- * GPL LICENSE SUMMARY
- *
- * Copyright (c) 2016 BayLibre, SAS.
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>.
- * The full GNU General Public License is included in this distribution
- * in the file called COPYING.
- *
- * BSD LICENSE
- *
- * Copyright (c) 2016 BayLibre, SAS.
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- *   * Redistributions of source code must retain the above copyright
- *     notice, this list of conditions and the following disclaimer.
- *   * Redistributions in binary form must reproduce the above copyright
- *     notice, this list of conditions and the following disclaimer in
- *     the documentation and/or other materials provided with the
- *     distribution.
- *   * Neither the name of Intel Corporation nor the names of its
- *     contributors may be used to endorse or promote products derived
- *     from this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-#ifndef DT_BINDINGS_CLOCK_AMLOGIC_MESON_GXBB_AOCLK
-#define DT_BINDINGS_CLOCK_AMLOGIC_MESON_GXBB_AOCLK
-
-#define CLKID_AO_REMOTE		0
-#define CLKID_AO_I2C_MASTER	1
-#define CLKID_AO_I2C_SLAVE	2
-#define CLKID_AO_UART1		3
-#define CLKID_AO_UART2		4
-#define CLKID_AO_IR_BLASTER	5
-#define CLKID_AO_CEC_32K	6
-#define CLKID_AO_CTS_OSCIN	7
-#define CLKID_AO_32K_PRE	8
-#define CLKID_AO_32K_DIV	9
-#define CLKID_AO_32K_SEL	10
-#define CLKID_AO_32K		11
-#define CLKID_AO_CTS_RTC_OSCIN	12
-#define CLKID_AO_CLK81		13
-
-#endif
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
deleted file mode 100644
index 4073eb7a9da1..000000000000
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ /dev/null
@@ -1,151 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * GXBB clock tree IDs
- */
-
-#ifndef __GXBB_CLKC_H
-#define __GXBB_CLKC_H
-
-#define CLKID_SYS_PLL		0
-#define CLKID_HDMI_PLL		2
-#define CLKID_FIXED_PLL		3
-#define CLKID_FCLK_DIV2		4
-#define CLKID_FCLK_DIV3		5
-#define CLKID_FCLK_DIV4		6
-#define CLKID_FCLK_DIV5		7
-#define CLKID_FCLK_DIV7		8
-#define CLKID_GP0_PLL		9
-#define CLKID_CLK81		12
-#define CLKID_MPLL0		13
-#define CLKID_MPLL1		14
-#define CLKID_MPLL2		15
-#define CLKID_DDR		16
-#define CLKID_DOS		17
-#define CLKID_ISA		18
-#define CLKID_PL301		19
-#define CLKID_PERIPHS		20
-#define CLKID_SPICC		21
-#define CLKID_I2C		22
-#define CLKID_SAR_ADC		23
-#define CLKID_SMART_CARD	24
-#define CLKID_RNG0		25
-#define CLKID_UART0		26
-#define CLKID_SDHC		27
-#define CLKID_STREAM		28
-#define CLKID_ASYNC_FIFO	29
-#define CLKID_SDIO		30
-#define CLKID_ABUF		31
-#define CLKID_HIU_IFACE		32
-#define CLKID_ASSIST_MISC	33
-#define CLKID_SPI		34
-#define CLKID_ETH		36
-#define CLKID_I2S_SPDIF		35
-#define CLKID_DEMUX		37
-#define CLKID_AIU_GLUE		38
-#define CLKID_IEC958		39
-#define CLKID_I2S_OUT		40
-#define CLKID_AMCLK		41
-#define CLKID_AIFIFO2		42
-#define CLKID_MIXER		43
-#define CLKID_MIXER_IFACE	44
-#define CLKID_ADC		45
-#define CLKID_BLKMV		46
-#define CLKID_AIU		47
-#define CLKID_UART1		48
-#define CLKID_G2D		49
-#define CLKID_USB0		50
-#define CLKID_USB1		51
-#define CLKID_RESET		52
-#define CLKID_NAND		53
-#define CLKID_DOS_PARSER	54
-#define CLKID_USB		55
-#define CLKID_VDIN1		56
-#define CLKID_AHB_ARB0		57
-#define CLKID_EFUSE		58
-#define CLKID_BOOT_ROM		59
-#define CLKID_AHB_DATA_BUS	60
-#define CLKID_AHB_CTRL_BUS	61
-#define CLKID_HDMI_INTR_SYNC	62
-#define CLKID_HDMI_PCLK		63
-#define CLKID_USB1_DDR_BRIDGE	64
-#define CLKID_USB0_DDR_BRIDGE	65
-#define CLKID_MMC_PCLK		66
-#define CLKID_DVIN		67
-#define CLKID_UART2		68
-#define CLKID_SANA		69
-#define CLKID_VPU_INTR		70
-#define CLKID_SEC_AHB_AHB3_BRIDGE 71
-#define CLKID_CLK81_A53		72
-#define CLKID_VCLK2_VENCI0	73
-#define CLKID_VCLK2_VENCI1	74
-#define CLKID_VCLK2_VENCP0	75
-#define CLKID_VCLK2_VENCP1	76
-#define CLKID_GCLK_VENCI_INT0	77
-#define CLKID_GCLK_VENCI_INT	78
-#define CLKID_DAC_CLK		79
-#define CLKID_AOCLK_GATE	80
-#define CLKID_IEC958_GATE	81
-#define CLKID_ENC480P		82
-#define CLKID_RNG1		83
-#define CLKID_GCLK_VENCI_INT1	84
-#define CLKID_VCLK2_VENCLMCC	85
-#define CLKID_VCLK2_VENCL	86
-#define CLKID_VCLK_OTHER	87
-#define CLKID_EDP		88
-#define CLKID_AO_MEDIA_CPU	89
-#define CLKID_AO_AHB_SRAM	90
-#define CLKID_AO_AHB_BUS	91
-#define CLKID_AO_IFACE		92
-#define CLKID_AO_I2C		93
-#define CLKID_SD_EMMC_A		94
-#define CLKID_SD_EMMC_B		95
-#define CLKID_SD_EMMC_C		96
-#define CLKID_SAR_ADC_CLK	97
-#define CLKID_SAR_ADC_SEL	98
-#define CLKID_MALI_0_SEL	100
-#define CLKID_MALI_0		102
-#define CLKID_MALI_1_SEL	103
-#define CLKID_MALI_1		105
-#define CLKID_MALI		106
-#define CLKID_CTS_AMCLK		107
-#define CLKID_CTS_MCLK_I958	110
-#define CLKID_CTS_I958		113
-#define CLKID_32K_CLK		114
-#define CLKID_SD_EMMC_A_CLK0	119
-#define CLKID_SD_EMMC_B_CLK0	122
-#define CLKID_SD_EMMC_C_CLK0	125
-#define CLKID_VPU_0_SEL		126
-#define CLKID_VPU_0		128
-#define CLKID_VPU_1_SEL		129
-#define CLKID_VPU_1		131
-#define CLKID_VPU		132
-#define CLKID_VAPB_0_SEL	133
-#define CLKID_VAPB_0		135
-#define CLKID_VAPB_1_SEL	136
-#define CLKID_VAPB_1		138
-#define CLKID_VAPB_SEL		139
-#define CLKID_VAPB		140
-#define CLKID_VDEC_1		153
-#define CLKID_VDEC_HEVC		156
-#define CLKID_GEN_CLK		159
-#define CLKID_VID_PLL		166
-#define CLKID_VCLK		175
-#define CLKID_VCLK2		176
-#define CLKID_VCLK_DIV1		185
-#define CLKID_VCLK_DIV2		186
-#define CLKID_VCLK_DIV4		187
-#define CLKID_VCLK_DIV6		188
-#define CLKID_VCLK_DIV12	189
-#define CLKID_VCLK2_DIV1	190
-#define CLKID_VCLK2_DIV2	191
-#define CLKID_VCLK2_DIV4	192
-#define CLKID_VCLK2_DIV6	193
-#define CLKID_VCLK2_DIV12	194
-#define CLKID_CTS_ENCI		199
-#define CLKID_CTS_ENCP		200
-#define CLKID_CTS_VDAC		201
-#define CLKID_HDMI_TX		202
-#define CLKID_HDMI		205
-#define CLKID_ACODEC		206
-
-#endif /* __GXBB_CLKC_H */
diff --git a/include/dt-bindings/gpio/meson-a1-gpio.h b/include/dt-bindings/gpio/meson-a1-gpio.h
deleted file mode 100644
index 40e57a5ff1db..000000000000
--- a/include/dt-bindings/gpio/meson-a1-gpio.h
+++ /dev/null
@@ -1,73 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
- * Author: Qianggui Song <qianggui.song@amlogic.com>
- */
-
-#ifndef _DT_BINDINGS_MESON_A1_GPIO_H
-#define _DT_BINDINGS_MESON_A1_GPIO_H
-
-#define GPIOP_0		0
-#define GPIOP_1		1
-#define GPIOP_2		2
-#define GPIOP_3		3
-#define GPIOP_4		4
-#define GPIOP_5		5
-#define GPIOP_6		6
-#define GPIOP_7		7
-#define GPIOP_8		8
-#define GPIOP_9		9
-#define GPIOP_10	10
-#define GPIOP_11	11
-#define GPIOP_12	12
-#define GPIOB_0		13
-#define GPIOB_1		14
-#define GPIOB_2		15
-#define GPIOB_3		16
-#define GPIOB_4		17
-#define GPIOB_5		18
-#define GPIOB_6		19
-#define GPIOX_0		20
-#define GPIOX_1		21
-#define GPIOX_2		22
-#define GPIOX_3		23
-#define GPIOX_4		24
-#define GPIOX_5		25
-#define GPIOX_6		26
-#define GPIOX_7		27
-#define GPIOX_8		28
-#define GPIOX_9		29
-#define GPIOX_10	30
-#define GPIOX_11	31
-#define GPIOX_12	32
-#define GPIOX_13	33
-#define GPIOX_14	34
-#define GPIOX_15	35
-#define GPIOX_16	36
-#define GPIOF_0		37
-#define GPIOF_1		38
-#define GPIOF_2		39
-#define GPIOF_3		40
-#define GPIOF_4		41
-#define GPIOF_5		42
-#define GPIOF_6		43
-#define GPIOF_7		44
-#define GPIOF_8		45
-#define GPIOF_9		46
-#define GPIOF_10	47
-#define GPIOF_11	48
-#define GPIOF_12	49
-#define GPIOA_0		50
-#define GPIOA_1		51
-#define GPIOA_2		52
-#define GPIOA_3		53
-#define GPIOA_4		54
-#define GPIOA_5		55
-#define GPIOA_6		56
-#define GPIOA_7		57
-#define GPIOA_8		58
-#define GPIOA_9		59
-#define GPIOA_10	60
-#define GPIOA_11	61
-
-#endif /* _DT_BINDINGS_MESON_A1_GPIO_H */
diff --git a/include/dt-bindings/gpio/meson-axg-gpio.h b/include/dt-bindings/gpio/meson-axg-gpio.h
deleted file mode 100644
index 25bb1fffa97a..000000000000
--- a/include/dt-bindings/gpio/meson-axg-gpio.h
+++ /dev/null
@@ -1,116 +0,0 @@
-/*
- * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
- * Author: Xingyu Chen <xingyu.chen@amlogic.com>
- *
- * SPDX-License-Identifier: GPL-2.0+
- */
-
-#ifndef _DT_BINDINGS_MESON_AXG_GPIO_H
-#define _DT_BINDINGS_MESON_AXG_GPIO_H
-
-/* First GPIO chip */
-#define GPIOAO_0	0
-#define GPIOAO_1	1
-#define GPIOAO_2	2
-#define GPIOAO_3	3
-#define GPIOAO_4	4
-#define GPIOAO_5	5
-#define GPIOAO_6	6
-#define GPIOAO_7	7
-#define GPIOAO_8	8
-#define GPIOAO_9	9
-#define GPIOAO_10	10
-#define GPIOAO_11	11
-#define GPIOAO_12	12
-#define GPIOAO_13	13
-#define GPIO_TEST_N 14
-
-/* Second GPIO chip */
-#define GPIOZ_0		0
-#define GPIOZ_1		1
-#define GPIOZ_2		2
-#define GPIOZ_3		3
-#define GPIOZ_4		4
-#define GPIOZ_5		5
-#define GPIOZ_6		6
-#define GPIOZ_7		7
-#define GPIOZ_8		8
-#define GPIOZ_9		9
-#define GPIOZ_10	10
-#define BOOT_0		11
-#define BOOT_1		12
-#define BOOT_2		13
-#define BOOT_3		14
-#define BOOT_4		15
-#define BOOT_5		16
-#define BOOT_6		17
-#define BOOT_7		18
-#define BOOT_8		19
-#define BOOT_9		20
-#define BOOT_10		21
-#define BOOT_11		22
-#define BOOT_12		23
-#define BOOT_13		24
-#define BOOT_14		25
-#define GPIOA_0	    26
-#define GPIOA_1		27
-#define GPIOA_2		28
-#define GPIOA_3		29
-#define GPIOA_4		30
-#define GPIOA_5		31
-#define GPIOA_6		32
-#define GPIOA_7		33
-#define GPIOA_8		34
-#define GPIOA_9		35
-#define GPIOA_10	36
-#define GPIOA_11	37
-#define GPIOA_12	38
-#define GPIOA_13	39
-#define GPIOA_14	40
-#define GPIOA_15	41
-#define GPIOA_16	42
-#define GPIOA_17	43
-#define GPIOA_18	44
-#define GPIOA_19	45
-#define GPIOA_20	46
-#define GPIOX_0		47
-#define GPIOX_1		48
-#define GPIOX_2		49
-#define GPIOX_3		50
-#define GPIOX_4		51
-#define GPIOX_5		52
-#define GPIOX_6		53
-#define GPIOX_7		54
-#define GPIOX_8		55
-#define GPIOX_9		56
-#define GPIOX_10	57
-#define GPIOX_11	58
-#define GPIOX_12	59
-#define GPIOX_13	60
-#define GPIOX_14	61
-#define GPIOX_15	62
-#define GPIOX_16	63
-#define GPIOX_17	64
-#define GPIOX_18	65
-#define GPIOX_19	66
-#define GPIOX_20	67
-#define GPIOX_21	68
-#define GPIOX_22	69
-#define GPIOY_0		70
-#define GPIOY_1		71
-#define GPIOY_2		72
-#define GPIOY_3		73
-#define GPIOY_4		74
-#define GPIOY_5		75
-#define GPIOY_6		76
-#define GPIOY_7		77
-#define GPIOY_8		78
-#define GPIOY_9		79
-#define GPIOY_10	80
-#define GPIOY_11	81
-#define GPIOY_12	82
-#define GPIOY_13	83
-#define GPIOY_14	84
-#define GPIOY_15	85
-
-#endif /* _DT_BINDINGS_MESON_AXG_GPIO_H */
diff --git a/include/dt-bindings/gpio/meson-g12a-gpio.h b/include/dt-bindings/gpio/meson-g12a-gpio.h
deleted file mode 100644
index f7bd69350d18..000000000000
--- a/include/dt-bindings/gpio/meson-g12a-gpio.h
+++ /dev/null
@@ -1,114 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
-/*
- * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
- * Author: Xingyu Chen <xingyu.chen@amlogic.com>
- */
-
-#ifndef _DT_BINDINGS_MESON_G12A_GPIO_H
-#define _DT_BINDINGS_MESON_G12A_GPIO_H
-
-/* First GPIO chip */
-#define GPIOAO_0	0
-#define GPIOAO_1	1
-#define GPIOAO_2	2
-#define GPIOAO_3	3
-#define GPIOAO_4	4
-#define GPIOAO_5	5
-#define GPIOAO_6	6
-#define GPIOAO_7	7
-#define GPIOAO_8	8
-#define GPIOAO_9	9
-#define GPIOAO_10	10
-#define GPIOAO_11	11
-#define GPIOE_0		12
-#define GPIOE_1		13
-#define GPIOE_2		14
-
-/* Second GPIO chip */
-#define GPIOZ_0		0
-#define GPIOZ_1		1
-#define GPIOZ_2		2
-#define GPIOZ_3		3
-#define GPIOZ_4		4
-#define GPIOZ_5		5
-#define GPIOZ_6		6
-#define GPIOZ_7		7
-#define GPIOZ_8		8
-#define GPIOZ_9		9
-#define GPIOZ_10	10
-#define GPIOZ_11	11
-#define GPIOZ_12	12
-#define GPIOZ_13	13
-#define GPIOZ_14	14
-#define GPIOZ_15	15
-#define GPIOH_0		16
-#define GPIOH_1		17
-#define GPIOH_2		18
-#define GPIOH_3		19
-#define GPIOH_4		20
-#define GPIOH_5		21
-#define GPIOH_6		22
-#define GPIOH_7		23
-#define GPIOH_8		24
-#define BOOT_0		25
-#define BOOT_1		26
-#define BOOT_2		27
-#define BOOT_3		28
-#define BOOT_4		29
-#define BOOT_5		30
-#define BOOT_6		31
-#define BOOT_7		32
-#define BOOT_8		33
-#define BOOT_9		34
-#define BOOT_10		35
-#define BOOT_11		36
-#define BOOT_12		37
-#define BOOT_13		38
-#define BOOT_14		39
-#define BOOT_15		40
-#define GPIOC_0		41
-#define GPIOC_1		42
-#define GPIOC_2		43
-#define GPIOC_3		44
-#define GPIOC_4		45
-#define GPIOC_5		46
-#define GPIOC_6		47
-#define GPIOC_7		48
-#define GPIOA_0		49
-#define GPIOA_1		50
-#define GPIOA_2		51
-#define GPIOA_3		52
-#define GPIOA_4		53
-#define GPIOA_5		54
-#define GPIOA_6		55
-#define GPIOA_7		56
-#define GPIOA_8		57
-#define GPIOA_9		58
-#define GPIOA_10	59
-#define GPIOA_11	60
-#define GPIOA_12	61
-#define GPIOA_13	62
-#define GPIOA_14	63
-#define GPIOA_15	64
-#define GPIOX_0		65
-#define GPIOX_1		66
-#define GPIOX_2		67
-#define GPIOX_3		68
-#define GPIOX_4		69
-#define GPIOX_5		70
-#define GPIOX_6		71
-#define GPIOX_7		72
-#define GPIOX_8		73
-#define GPIOX_9		74
-#define GPIOX_10	75
-#define GPIOX_11	76
-#define GPIOX_12	77
-#define GPIOX_13	78
-#define GPIOX_14	79
-#define GPIOX_15	80
-#define GPIOX_16	81
-#define GPIOX_17	82
-#define GPIOX_18	83
-#define GPIOX_19	84
-
-#endif /* _DT_BINDINGS_MESON_G12A_GPIO_H */
diff --git a/include/dt-bindings/gpio/meson-gxbb-gpio.h b/include/dt-bindings/gpio/meson-gxbb-gpio.h
deleted file mode 100644
index 489c75b27645..000000000000
--- a/include/dt-bindings/gpio/meson-gxbb-gpio.h
+++ /dev/null
@@ -1,148 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * GPIO definitions for Amlogic Meson GXBB SoCs
- *
- * Copyright (C) 2016 Endless Mobile, Inc.
- * Author: Carlo Caione <carlo@endlessm.com>
- */
-
-#ifndef _DT_BINDINGS_MESON_GXBB_GPIO_H
-#define _DT_BINDINGS_MESON_GXBB_GPIO_H
-
-#define	GPIOAO_0	0
-#define	GPIOAO_1	1
-#define	GPIOAO_2	2
-#define	GPIOAO_3	3
-#define	GPIOAO_4	4
-#define	GPIOAO_5	5
-#define	GPIOAO_6	6
-#define	GPIOAO_7	7
-#define	GPIOAO_8	8
-#define	GPIOAO_9	9
-#define	GPIOAO_10	10
-#define	GPIOAO_11	11
-#define	GPIOAO_12	12
-#define	GPIOAO_13	13
-#define	GPIO_TEST_N	14
-
-#define	GPIOZ_0		0
-#define	GPIOZ_1		1
-#define	GPIOZ_2		2
-#define	GPIOZ_3		3
-#define	GPIOZ_4		4
-#define	GPIOZ_5		5
-#define	GPIOZ_6		6
-#define	GPIOZ_7		7
-#define	GPIOZ_8		8
-#define	GPIOZ_9		9
-#define	GPIOZ_10	10
-#define	GPIOZ_11	11
-#define	GPIOZ_12	12
-#define	GPIOZ_13	13
-#define	GPIOZ_14	14
-#define	GPIOZ_15	15
-#define	GPIOH_0		16
-#define	GPIOH_1		17
-#define	GPIOH_2		18
-#define	GPIOH_3		19
-#define	BOOT_0		20
-#define	BOOT_1		21
-#define	BOOT_2		22
-#define	BOOT_3		23
-#define	BOOT_4		24
-#define	BOOT_5		25
-#define	BOOT_6		26
-#define	BOOT_7		27
-#define	BOOT_8		28
-#define	BOOT_9		29
-#define	BOOT_10		30
-#define	BOOT_11		31
-#define	BOOT_12		32
-#define	BOOT_13		33
-#define	BOOT_14		34
-#define	BOOT_15		35
-#define	BOOT_16		36
-#define	BOOT_17		37
-#define	CARD_0		38
-#define	CARD_1		39
-#define	CARD_2		40
-#define	CARD_3		41
-#define	CARD_4		42
-#define	CARD_5		43
-#define	CARD_6		44
-#define	GPIODV_0	45
-#define	GPIODV_1	46
-#define	GPIODV_2	47
-#define	GPIODV_3	48
-#define	GPIODV_4	49
-#define	GPIODV_5	50
-#define	GPIODV_6	51
-#define	GPIODV_7	52
-#define	GPIODV_8	53
-#define	GPIODV_9	54
-#define	GPIODV_10	55
-#define	GPIODV_11	56
-#define	GPIODV_12	57
-#define	GPIODV_13	58
-#define	GPIODV_14	59
-#define	GPIODV_15	60
-#define	GPIODV_16	61
-#define	GPIODV_17	62
-#define	GPIODV_18	63
-#define	GPIODV_19	64
-#define	GPIODV_20	65
-#define	GPIODV_21	66
-#define	GPIODV_22	67
-#define	GPIODV_23	68
-#define	GPIODV_24	69
-#define	GPIODV_25	70
-#define	GPIODV_26	71
-#define	GPIODV_27	72
-#define	GPIODV_28	73
-#define	GPIODV_29	74
-#define	GPIOY_0		75
-#define	GPIOY_1		76
-#define	GPIOY_2		77
-#define	GPIOY_3		78
-#define	GPIOY_4		79
-#define	GPIOY_5		80
-#define	GPIOY_6		81
-#define	GPIOY_7		82
-#define	GPIOY_8		83
-#define	GPIOY_9		84
-#define	GPIOY_10	85
-#define	GPIOY_11	86
-#define	GPIOY_12	87
-#define	GPIOY_13	88
-#define	GPIOY_14	89
-#define	GPIOY_15	90
-#define	GPIOY_16	91
-#define	GPIOX_0		92
-#define	GPIOX_1		93
-#define	GPIOX_2		94
-#define	GPIOX_3		95
-#define	GPIOX_4		96
-#define	GPIOX_5		97
-#define	GPIOX_6		98
-#define	GPIOX_7		99
-#define	GPIOX_8		100
-#define	GPIOX_9		101
-#define	GPIOX_10	102
-#define	GPIOX_11	103
-#define	GPIOX_12	104
-#define	GPIOX_13	105
-#define	GPIOX_14	106
-#define	GPIOX_15	107
-#define	GPIOX_16	108
-#define	GPIOX_17	109
-#define	GPIOX_18	110
-#define	GPIOX_19	111
-#define	GPIOX_20	112
-#define	GPIOX_21	113
-#define	GPIOX_22	114
-#define	GPIOCLK_0	115
-#define	GPIOCLK_1	116
-#define	GPIOCLK_2	117
-#define	GPIOCLK_3	118
-
-#endif
diff --git a/include/dt-bindings/gpio/meson-gxl-gpio.h b/include/dt-bindings/gpio/meson-gxl-gpio.h
deleted file mode 100644
index 0a001ae48272..000000000000
--- a/include/dt-bindings/gpio/meson-gxl-gpio.h
+++ /dev/null
@@ -1,125 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * GPIO definitions for Amlogic Meson GXL SoCs
- *
- * Copyright (C) 2016 Endless Mobile, Inc.
- * Author: Carlo Caione <carlo@endlessm.com>
- */
-
-#ifndef _DT_BINDINGS_MESON_GXL_GPIO_H
-#define _DT_BINDINGS_MESON_GXL_GPIO_H
-
-#define	GPIOAO_0	0
-#define	GPIOAO_1	1
-#define	GPIOAO_2	2
-#define	GPIOAO_3	3
-#define	GPIOAO_4	4
-#define	GPIOAO_5	5
-#define	GPIOAO_6	6
-#define	GPIOAO_7	7
-#define	GPIOAO_8	8
-#define	GPIOAO_9	9
-#define	GPIO_TEST_N	10
-
-#define	GPIOZ_0		0
-#define	GPIOZ_1		1
-#define	GPIOZ_2		2
-#define	GPIOZ_3		3
-#define	GPIOZ_4		4
-#define	GPIOZ_5		5
-#define	GPIOZ_6		6
-#define	GPIOZ_7		7
-#define	GPIOZ_8		8
-#define	GPIOZ_9		9
-#define	GPIOZ_10	10
-#define	GPIOZ_11	11
-#define	GPIOZ_12	12
-#define	GPIOZ_13	13
-#define	GPIOZ_14	14
-#define	GPIOZ_15	15
-#define	GPIOH_0		16
-#define	GPIOH_1		17
-#define	GPIOH_2		18
-#define	GPIOH_3		19
-#define	GPIOH_4		20
-#define	GPIOH_5		21
-#define	GPIOH_6		22
-#define	GPIOH_7		23
-#define	GPIOH_8		24
-#define	GPIOH_9		25
-#define	BOOT_0		26
-#define	BOOT_1		27
-#define	BOOT_2		28
-#define	BOOT_3		29
-#define	BOOT_4		30
-#define	BOOT_5		31
-#define	BOOT_6		32
-#define	BOOT_7		33
-#define	BOOT_8		34
-#define	BOOT_9		35
-#define	BOOT_10		36
-#define	BOOT_11		37
-#define	BOOT_12		38
-#define	BOOT_13		39
-#define	BOOT_14		40
-#define	BOOT_15		41
-#define	CARD_0		42
-#define	CARD_1		43
-#define	CARD_2		44
-#define	CARD_3		45
-#define	CARD_4		46
-#define	CARD_5		47
-#define	CARD_6		48
-#define	GPIODV_0	49
-#define	GPIODV_1	50
-#define	GPIODV_2	51
-#define	GPIODV_3	52
-#define	GPIODV_4	53
-#define	GPIODV_5	54
-#define	GPIODV_6	55
-#define	GPIODV_7	56
-#define	GPIODV_8	57
-#define	GPIODV_9	58
-#define	GPIODV_10	59
-#define	GPIODV_11	60
-#define	GPIODV_12	61
-#define	GPIODV_13	62
-#define	GPIODV_14	63
-#define	GPIODV_15	64
-#define	GPIODV_16	65
-#define	GPIODV_17	66
-#define	GPIODV_18	67
-#define	GPIODV_19	68
-#define	GPIODV_20	69
-#define	GPIODV_21	70
-#define	GPIODV_22	71
-#define	GPIODV_23	72
-#define	GPIODV_24	73
-#define	GPIODV_25	74
-#define	GPIODV_26	75
-#define	GPIODV_27	76
-#define	GPIODV_28	77
-#define	GPIODV_29	78
-#define	GPIOX_0		79
-#define	GPIOX_1		80
-#define	GPIOX_2		81
-#define	GPIOX_3		82
-#define	GPIOX_4		83
-#define	GPIOX_5		84
-#define	GPIOX_6		85
-#define	GPIOX_7		86
-#define	GPIOX_8		87
-#define	GPIOX_9		88
-#define	GPIOX_10	89
-#define	GPIOX_11	90
-#define	GPIOX_12	91
-#define	GPIOX_13	92
-#define	GPIOX_14	93
-#define	GPIOX_15	94
-#define	GPIOX_16	95
-#define	GPIOX_17	96
-#define	GPIOX_18	97
-#define	GPIOCLK_0	98
-#define	GPIOCLK_1	99
-
-#endif
diff --git a/include/dt-bindings/power/meson-a1-power.h b/include/dt-bindings/power/meson-a1-power.h
deleted file mode 100644
index 8e39dfc0b62a..000000000000
--- a/include/dt-bindings/power/meson-a1-power.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
-/*
- * Copyright (c) 2023 SberDevices, Inc.
- * Author: Alexey Romanov <avromanov@sberdevices.ru>
- */
-
-#ifndef _DT_BINDINGS_MESON_A1_POWER_H
-#define _DT_BINDINGS_MESON_A1_POWER_H
-
-#define PWRC_DSPA_ID	8
-#define PWRC_DSPB_ID	9
-#define PWRC_UART_ID	10
-#define PWRC_DMC_ID	11
-#define PWRC_I2C_ID	12
-#define PWRC_PSRAM_ID	13
-#define PWRC_ACODEC_ID	14
-#define PWRC_AUDIO_ID	15
-#define PWRC_OTP_ID	16
-#define PWRC_DMA_ID	17
-#define PWRC_SD_EMMC_ID	18
-#define PWRC_RAMA_ID	19
-#define PWRC_RAMB_ID	20
-#define PWRC_IR_ID	21
-#define PWRC_SPICC_ID	22
-#define PWRC_SPIFC_ID	23
-#define PWRC_USB_ID	24
-#define PWRC_NIC_ID	25
-#define PWRC_PDMIN_ID	26
-#define PWRC_RSA_ID	27
-#define PWRC_MAX_ID	28
-
-#endif
diff --git a/include/dt-bindings/power/meson-axg-power.h b/include/dt-bindings/power/meson-axg-power.h
deleted file mode 100644
index e5243884b249..000000000000
--- a/include/dt-bindings/power/meson-axg-power.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
-/*
- * Copyright (c) 2020 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef _DT_BINDINGS_MESON_AXG_POWER_H
-#define _DT_BINDINGS_MESON_AXG_POWER_H
-
-#define PWRC_AXG_VPU_ID			0
-#define PWRC_AXG_ETHERNET_MEM_ID	1
-#define PWRC_AXG_AUDIO_ID		2
-
-#endif
diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bindings/power/meson-g12a-power.h
deleted file mode 100644
index bb5e67a842de..000000000000
--- a/include/dt-bindings/power/meson-g12a-power.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
-/*
- * Copyright (c) 2019 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef _DT_BINDINGS_MESON_G12A_POWER_H
-#define _DT_BINDINGS_MESON_G12A_POWER_H
-
-#define PWRC_G12A_VPU_ID		0
-#define PWRC_G12A_ETH_ID		1
-
-#endif
diff --git a/include/dt-bindings/power/meson-gxbb-power.h b/include/dt-bindings/power/meson-gxbb-power.h
deleted file mode 100644
index 1262dac696c0..000000000000
--- a/include/dt-bindings/power/meson-gxbb-power.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
-/*
- * Copyright (c) 2019 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef _DT_BINDINGS_MESON_GXBB_POWER_H
-#define _DT_BINDINGS_MESON_GXBB_POWER_H
-
-#define PWRC_GXBB_VPU_ID		0
-#define PWRC_GXBB_ETHERNET_MEM_ID	1
-
-#endif
diff --git a/include/dt-bindings/power/meson-sm1-power.h b/include/dt-bindings/power/meson-sm1-power.h
deleted file mode 100644
index a020ab00c134..000000000000
--- a/include/dt-bindings/power/meson-sm1-power.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
-/*
- * Copyright (c) 2019 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef _DT_BINDINGS_MESON_SM1_POWER_H
-#define _DT_BINDINGS_MESON_SM1_POWER_H
-
-#define PWRC_SM1_VPU_ID		0
-#define PWRC_SM1_NNA_ID		1
-#define PWRC_SM1_USB_ID		2
-#define PWRC_SM1_PCIE_ID	3
-#define PWRC_SM1_GE2D_ID	4
-#define PWRC_SM1_AUDIO_ID	5
-#define PWRC_SM1_ETH_ID		6
-
-#endif
diff --git a/include/dt-bindings/reset/amlogic,meson-a1-reset.h b/include/dt-bindings/reset/amlogic,meson-a1-reset.h
deleted file mode 100644
index 2c749c655e1e..000000000000
--- a/include/dt-bindings/reset/amlogic,meson-a1-reset.h
+++ /dev/null
@@ -1,76 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
- * Author: Xingyu Chen <xingyu.chen@amlogic.com>
- *
- * Copyright (c) 2023, SberDevices, Inc.
- * Author: Alexey Romanov <avromanov@salutedevices.com>
- */
-
-#ifndef _DT_BINDINGS_AMLOGIC_MESON_A1_RESET_H
-#define _DT_BINDINGS_AMLOGIC_MESON_A1_RESET_H
-
-/*	RESET0					*/
-/*					0	*/
-#define RESET_AM2AXI_VAD		1
-/*					2-3	*/
-#define RESET_PSRAM			4
-#define RESET_PAD_CTRL			5
-/*					6	*/
-#define RESET_TEMP_SENSOR		7
-#define RESET_AM2AXI_DEV		8
-/*					9	*/
-#define RESET_SPICC_A			10
-#define RESET_MSR_CLK			11
-#define RESET_AUDIO			12
-#define RESET_ANALOG_CTRL		13
-#define RESET_SAR_ADC			14
-#define RESET_AUDIO_VAD			15
-#define RESET_CEC			16
-#define RESET_PWM_EF			17
-#define RESET_PWM_CD			18
-#define RESET_PWM_AB			19
-/*					20	*/
-#define RESET_IR_CTRL			21
-#define RESET_I2C_S_A			22
-/*					23	*/
-#define RESET_I2C_M_D			24
-#define RESET_I2C_M_C			25
-#define RESET_I2C_M_B			26
-#define RESET_I2C_M_A			27
-#define RESET_I2C_PROD_AHB		28
-#define RESET_I2C_PROD			29
-/*					30-31	*/
-
-/*	RESET1					*/
-#define RESET_ACODEC			32
-#define RESET_DMA			33
-#define RESET_SD_EMMC_A			34
-/*					35	*/
-#define RESET_USBCTRL			36
-/*					37	*/
-#define RESET_USBPHY			38
-/*					39-41	*/
-#define RESET_RSA			42
-#define RESET_DMC			43
-/*					44	*/
-#define RESET_IRQ_CTRL			45
-/*					46	*/
-#define RESET_NIC_VAD			47
-#define RESET_NIC_AXI			48
-#define RESET_RAMA			49
-#define RESET_RAMB			50
-/*					51-52	*/
-#define RESET_ROM			53
-#define RESET_SPIFC			54
-#define RESET_GIC			55
-#define RESET_UART_C			56
-#define RESET_UART_B			57
-#define RESET_UART_A			58
-#define RESET_OSC_RING			59
-/*					60-63	*/
-
-/*	RESET2					*/
-/*					64-95	*/
-
-#endif
diff --git a/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h b/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
deleted file mode 100644
index 1ef807856cb8..000000000000
--- a/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR MIT)
- *
- * Copyright (c) 2018 Baylibre SAS.
- * Author: Jerome Brunet <jbrunet@baylibre.com>
- */
-
-#ifndef _DT_BINDINGS_AMLOGIC_MESON_AXG_AUDIO_ARB_H
-#define _DT_BINDINGS_AMLOGIC_MESON_AXG_AUDIO_ARB_H
-
-#define AXG_ARB_TODDR_A	0
-#define AXG_ARB_TODDR_B	1
-#define AXG_ARB_TODDR_C	2
-#define AXG_ARB_FRDDR_A	3
-#define AXG_ARB_FRDDR_B	4
-#define AXG_ARB_FRDDR_C	5
-#define AXG_ARB_TODDR_D	6
-#define AXG_ARB_FRDDR_D	7
-
-#endif /* _DT_BINDINGS_AMLOGIC_MESON_AXG_AUDIO_ARB_H */
diff --git a/include/dt-bindings/reset/amlogic,meson-axg-reset.h b/include/dt-bindings/reset/amlogic,meson-axg-reset.h
deleted file mode 100644
index 0f2e0fe45ca4..000000000000
--- a/include/dt-bindings/reset/amlogic,meson-axg-reset.h
+++ /dev/null
@@ -1,123 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
-/*
- * Copyright (c) 2016 BayLibre, SAS.
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * Copyright (c) 2017 Amlogic, inc.
- * Author: Yixun Lan <yixun.lan@amlogic.com>
- *
- */
-
-#ifndef _DT_BINDINGS_AMLOGIC_MESON_AXG_RESET_H
-#define _DT_BINDINGS_AMLOGIC_MESON_AXG_RESET_H
-
-/*	RESET0					*/
-#define RESET_HIU			0
-#define RESET_PCIE_A			1
-#define RESET_PCIE_B			2
-#define RESET_DDR_TOP			3
-/*					4	*/
-#define RESET_VIU			5
-#define RESET_PCIE_PHY			6
-#define RESET_PCIE_APB			7
-/*					8	*/
-/*					9	*/
-#define RESET_VENC			10
-#define RESET_ASSIST			11
-/*					12	*/
-#define RESET_VCBUS			13
-/*					14	*/
-/*					15	*/
-#define RESET_GIC			16
-#define RESET_CAPB3_DECODE		17
-/*					18-21	*/
-#define RESET_SYS_CPU_CAPB3		22
-#define RESET_CBUS_CAPB3		23
-#define RESET_AHB_CNTL			24
-#define RESET_AHB_DATA			25
-#define RESET_VCBUS_CLK81		26
-#define RESET_MMC			27
-/*					28-31	*/
-/*	RESET1					*/
-/*					32	*/
-/*					33	*/
-#define RESET_USB_OTG			34
-#define RESET_DDR			35
-#define RESET_AO_RESET			36
-/*					37	*/
-#define RESET_AHB_SRAM			38
-/*					39	*/
-/*					40	*/
-#define RESET_DMA			41
-#define RESET_ISA			42
-#define RESET_ETHERNET			43
-/*					44	*/
-#define RESET_SD_EMMC_B			45
-#define RESET_SD_EMMC_C			46
-#define RESET_ROM_BOOT			47
-#define RESET_SYS_CPU_0			48
-#define RESET_SYS_CPU_1			49
-#define RESET_SYS_CPU_2			50
-#define RESET_SYS_CPU_3			51
-#define RESET_SYS_CPU_CORE_0		52
-#define RESET_SYS_CPU_CORE_1		53
-#define RESET_SYS_CPU_CORE_2		54
-#define RESET_SYS_CPU_CORE_3		55
-#define RESET_SYS_PLL_DIV		56
-#define RESET_SYS_CPU_AXI		57
-#define RESET_SYS_CPU_L2		58
-#define RESET_SYS_CPU_P			59
-#define RESET_SYS_CPU_MBIST		60
-/*					61-63	*/
-/*	RESET2					*/
-/*					64	*/
-/*					65	*/
-#define RESET_AUDIO			66
-/*					67	*/
-#define RESET_MIPI_HOST			68
-#define RESET_AUDIO_LOCKER		69
-#define RESET_GE2D			70
-/*					71-76	*/
-#define RESET_AO_CPU_RESET		77
-/*					78-95	*/
-/*	RESET3					*/
-#define RESET_RING_OSCILLATOR		96
-/*					97-127	*/
-/*	RESET4					*/
-/*					128	*/
-/*					129	*/
-#define RESET_MIPI_PHY			130
-/*					131-140	*/
-#define RESET_VENCL			141
-#define RESET_I2C_MASTER_2		142
-#define RESET_I2C_MASTER_1		143
-/*					144-159	*/
-/*	RESET5					*/
-/*					160-191	*/
-/*	RESET6					*/
-#define RESET_PERIPHS_GENERAL		192
-#define RESET_PERIPHS_SPICC		193
-/*					194	*/
-/*					195	*/
-#define RESET_PERIPHS_I2C_MASTER_0	196
-/*					197-200	*/
-#define RESET_PERIPHS_UART_0		201
-#define RESET_PERIPHS_UART_1		202
-/*					203-204	*/
-#define RESET_PERIPHS_SPI_0		205
-#define RESET_PERIPHS_I2C_MASTER_3	206
-/*					207-223	*/
-/*	RESET7					*/
-#define RESET_USB_DDR_0			224
-#define RESET_USB_DDR_1			225
-#define RESET_USB_DDR_2			226
-#define RESET_USB_DDR_3			227
-/*					228	*/
-#define RESET_DEVICE_MMC_ARB		229
-/*					230	*/
-#define RESET_VID_LOCK			231
-#define RESET_A9_DMC_PIPEL		232
-#define RESET_DMC_VPU_PIPEL		233
-/*					234-255	*/
-
-#endif
diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
deleted file mode 100644
index f805129ca7af..000000000000
--- a/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2019 BayLibre, SAS.
- * Author: Jerome Brunet <jbrunet@baylibre.com>
- *
- */
-
-#ifndef _DT_BINDINGS_AMLOGIC_MESON_G12A_AUDIO_RESET_H
-#define _DT_BINDINGS_AMLOGIC_MESON_G12A_AUDIO_RESET_H
-
-#define AUD_RESET_PDM		0
-#define AUD_RESET_TDMIN_A	1
-#define AUD_RESET_TDMIN_B	2
-#define AUD_RESET_TDMIN_C	3
-#define AUD_RESET_TDMIN_LB	4
-#define AUD_RESET_LOOPBACK	5
-#define AUD_RESET_TODDR_A	6
-#define AUD_RESET_TODDR_B	7
-#define AUD_RESET_TODDR_C	8
-#define AUD_RESET_FRDDR_A	9
-#define AUD_RESET_FRDDR_B	10
-#define AUD_RESET_FRDDR_C	11
-#define AUD_RESET_TDMOUT_A	12
-#define AUD_RESET_TDMOUT_B	13
-#define AUD_RESET_TDMOUT_C	14
-#define AUD_RESET_SPDIFOUT	15
-#define AUD_RESET_SPDIFOUT_B	16
-#define AUD_RESET_SPDIFIN	17
-#define AUD_RESET_EQDRC		18
-#define AUD_RESET_RESAMPLE	19
-#define AUD_RESET_DDRARB	20
-#define AUD_RESET_POWDET	21
-#define AUD_RESET_TORAM		22
-#define AUD_RESET_TOACODEC	23
-#define AUD_RESET_TOHDMITX	24
-#define AUD_RESET_CLKTREE	25
-
-/* SM1 added resets */
-#define AUD_RESET_RESAMPLE_B	26
-#define AUD_RESET_TOVAD		27
-#define AUD_RESET_LOCKER	28
-#define AUD_RESET_SPDIFIN_LB	29
-#define AUD_RESET_FRATV		30
-#define AUD_RESET_FRHDMIRX	31
-#define AUD_RESET_FRDDR_D	32
-#define AUD_RESET_TODDR_D	33
-#define AUD_RESET_LOOPBACK_B	34
-#define AUD_RESET_EARCTX	35
-#define AUD_RESET_EARCRX	36
-#define AUD_RESET_FRDDR_E	37
-#define AUD_RESET_TODDR_E	38
-
-#endif
diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
deleted file mode 100644
index 6d487c5eba2c..000000000000
--- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
+++ /dev/null
@@ -1,137 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
-/*
- * Copyright (c) 2019 BayLibre, SAS.
- * Author: Jerome Brunet <jbrunet@baylibre.com>
- *
- */
-
-#ifndef _DT_BINDINGS_AMLOGIC_MESON_G12A_RESET_H
-#define _DT_BINDINGS_AMLOGIC_MESON_G12A_RESET_H
-
-/*	RESET0					*/
-#define RESET_HIU			0
-/*					1	*/
-#define RESET_DOS			2
-/*					3-4	*/
-#define RESET_VIU			5
-#define RESET_AFIFO			6
-#define RESET_VID_PLL_DIV		7
-/*					8-9	*/
-#define RESET_VENC			10
-#define RESET_ASSIST			11
-#define RESET_PCIE_CTRL_A		12
-#define RESET_VCBUS			13
-#define RESET_PCIE_PHY			14
-#define RESET_PCIE_APB			15
-#define RESET_GIC			16
-#define RESET_CAPB3_DECODE		17
-/*					18	*/
-#define RESET_HDMITX_CAPB3		19
-#define RESET_DVALIN_CAPB3		20
-#define RESET_DOS_CAPB3			21
-/*					22	*/
-#define RESET_CBUS_CAPB3		23
-#define RESET_AHB_CNTL			24
-#define RESET_AHB_DATA			25
-#define RESET_VCBUS_CLK81		26
-/*					27-31	*/
-/*	RESET1					*/
-/*					32	*/
-#define RESET_DEMUX			33
-#define RESET_USB			34
-#define RESET_DDR			35
-/*					36	*/
-#define RESET_BT656			37
-#define RESET_AHB_SRAM			38
-/*					39	*/
-#define RESET_PARSER			40
-/*					41	*/
-#define RESET_ISA			42
-#define RESET_ETHERNET			43
-#define RESET_SD_EMMC_A			44
-#define RESET_SD_EMMC_B			45
-#define RESET_SD_EMMC_C			46
-/*					47	*/
-#define RESET_USB_PHY20			48
-#define RESET_USB_PHY21			49
-/*					50-60	*/
-#define RESET_AUDIO_CODEC		61
-/*					62-63	*/
-/*	RESET2					*/
-/*					64	*/
-#define RESET_AUDIO			65
-#define RESET_HDMITX_PHY		66
-/*					67	*/
-#define RESET_MIPI_DSI_HOST		68
-#define RESET_ALOCKER			69
-#define RESET_GE2D			70
-#define RESET_PARSER_REG		71
-#define RESET_PARSER_FETCH		72
-#define RESET_CTL			73
-#define RESET_PARSER_TOP		74
-/*					75-77	*/
-#define RESET_DVALIN			78
-#define RESET_HDMITX			79
-/*					80-95	*/
-/*	RESET3					*/
-/*					96-95	*/
-#define RESET_DEMUX_TOP			105
-#define RESET_DEMUX_DES_PL		106
-#define RESET_DEMUX_S2P_0		107
-#define RESET_DEMUX_S2P_1		108
-#define RESET_DEMUX_0			109
-#define RESET_DEMUX_1			110
-#define RESET_DEMUX_2			111
-/*					112-127	*/
-/*	RESET4					*/
-/*					128-129	*/
-#define RESET_MIPI_DSI_PHY		130
-/*					131-132	*/
-#define RESET_RDMA			133
-#define RESET_VENCI			134
-#define RESET_VENCP			135
-/*					136	*/
-#define RESET_VDAC			137
-/*					138-139 */
-#define RESET_VDI6			140
-#define RESET_VENCL			141
-#define RESET_I2C_M1			142
-#define RESET_I2C_M2			143
-/*					144-159	*/
-/*	RESET5					*/
-/*					160-191	*/
-/*	RESET6					*/
-#define RESET_GEN			192
-#define RESET_SPICC0			193
-#define RESET_SC			194
-#define RESET_SANA_3			195
-#define RESET_I2C_M0			196
-#define RESET_TS_PLL			197
-#define RESET_SPICC1			198
-#define RESET_STREAM			199
-#define RESET_TS_CPU			200
-#define RESET_UART0			201
-#define RESET_UART1_2			202
-#define RESET_ASYNC0			203
-#define RESET_ASYNC1			204
-#define RESET_SPIFC0			205
-#define RESET_I2C_M3			206
-/*					207-223	*/
-/*	RESET7					*/
-#define RESET_USB_DDR_0			224
-#define RESET_USB_DDR_1			225
-#define RESET_USB_DDR_2			226
-#define RESET_USB_DDR_3			227
-#define RESET_TS_GPU			228
-#define RESET_DEVICE_MMC_ARB		229
-#define RESET_DVALIN_DMC_PIPL		230
-#define RESET_VID_LOCK			231
-#define RESET_NIC_DMC_PIPL		232
-#define RESET_DMC_VPU_PIPL		233
-#define RESET_GE2D_DMC_PIPL		234
-#define RESET_HCODEC_DMC_PIPL		235
-#define RESET_WAVE420_DMC_PIPL		236
-#define RESET_HEVCF_DMC_PIPL		237
-/*					238-255	*/
-
-#endif
diff --git a/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h b/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
deleted file mode 100644
index 883bfd3bcbad..000000000000
--- a/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
+++ /dev/null
@@ -1,161 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/*
- * Copyright (c) 2016 BayLibre, SAS.
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-#ifndef _DT_BINDINGS_AMLOGIC_MESON_GXBB_RESET_H
-#define _DT_BINDINGS_AMLOGIC_MESON_GXBB_RESET_H
-
-/*	RESET0					*/
-#define RESET_HIU			0
-/*					1	*/
-#define RESET_DOS_RESET			2
-#define RESET_DDR_TOP			3
-#define RESET_DCU_RESET			4
-#define RESET_VIU			5
-#define RESET_AIU			6
-#define RESET_VID_PLL_DIV		7
-/*					8	*/
-#define RESET_PMUX			9
-#define RESET_VENC			10
-#define RESET_ASSIST			11
-#define RESET_AFIFO2			12
-#define RESET_VCBUS			13
-/*					14	*/
-/*					15	*/
-#define RESET_GIC			16
-#define RESET_CAPB3_DECODE		17
-#define RESET_NAND_CAPB3		18
-#define RESET_HDMITX_CAPB3		19
-#define RESET_MALI_CAPB3		20
-#define RESET_DOS_CAPB3			21
-#define RESET_SYS_CPU_CAPB3		22
-#define RESET_CBUS_CAPB3		23
-#define RESET_AHB_CNTL			24
-#define RESET_AHB_DATA			25
-#define RESET_VCBUS_CLK81		26
-#define RESET_MMC			27
-#define RESET_MIPI_0			28
-#define RESET_MIPI_1			29
-#define RESET_MIPI_2			30
-#define RESET_MIPI_3			31
-/*	RESET1					*/
-#define RESET_CPPM			32
-#define RESET_DEMUX			33
-#define RESET_USB_OTG			34
-#define RESET_DDR			35
-#define RESET_AO_RESET			36
-#define RESET_BT656			37
-#define RESET_AHB_SRAM			38
-/*					39	*/
-#define RESET_PARSER			40
-#define RESET_BLKMV			41
-#define RESET_ISA			42
-#define RESET_ETHERNET			43
-#define RESET_SD_EMMC_A			44
-#define RESET_SD_EMMC_B			45
-#define RESET_SD_EMMC_C			46
-#define RESET_ROM_BOOT			47
-#define RESET_SYS_CPU_0			48
-#define RESET_SYS_CPU_1			49
-#define RESET_SYS_CPU_2			50
-#define RESET_SYS_CPU_3			51
-#define RESET_SYS_CPU_CORE_0		52
-#define RESET_SYS_CPU_CORE_1		53
-#define RESET_SYS_CPU_CORE_2		54
-#define RESET_SYS_CPU_CORE_3		55
-#define RESET_SYS_PLL_DIV		56
-#define RESET_SYS_CPU_AXI		57
-#define RESET_SYS_CPU_L2		58
-#define RESET_SYS_CPU_P			59
-#define RESET_SYS_CPU_MBIST		60
-#define RESET_ACODEC			61
-/*					62	*/
-/*					63	*/
-/*	RESET2					*/
-#define RESET_VD_RMEM			64
-#define RESET_AUDIN			65
-#define RESET_HDMI_TX			66
-/*					67	*/
-/*					68	*/
-/*					69	*/
-#define RESET_GE2D			70
-#define RESET_PARSER_REG		71
-#define RESET_PARSER_FETCH		72
-#define RESET_PARSER_CTL		73
-#define RESET_PARSER_TOP		74
-/*					75	*/
-/*					76	*/
-#define RESET_AO_CPU_RESET		77
-#define RESET_MALI			78
-#define RESET_HDMI_SYSTEM_RESET		79
-/*					80-95	*/
-/*	RESET3					*/
-#define RESET_RING_OSCILLATOR		96
-#define RESET_SYS_CPU			97
-#define RESET_EFUSE			98
-#define RESET_SYS_CPU_BVCI		99
-#define RESET_AIFIFO			100
-#define RESET_TVFE			101
-#define RESET_AHB_BRIDGE_CNTL		102
-/*					103	*/
-#define RESET_AUDIO_DAC			104
-#define RESET_DEMUX_TOP			105
-#define RESET_DEMUX_DES			106
-#define RESET_DEMUX_S2P_0		107
-#define RESET_DEMUX_S2P_1		108
-#define RESET_DEMUX_RESET_0		109
-#define RESET_DEMUX_RESET_1		110
-#define RESET_DEMUX_RESET_2		111
-/*					112-127	*/
-/*	RESET4					*/
-/*					128	*/
-/*					129	*/
-/*					130	*/
-/*					131	*/
-#define RESET_DVIN_RESET		132
-#define RESET_RDMA			133
-#define RESET_VENCI			134
-#define RESET_VENCP			135
-/*					136	*/
-#define RESET_VDAC			137
-#define RESET_RTC			138
-/*					139	*/
-#define RESET_VDI6			140
-#define RESET_VENCL			141
-#define RESET_I2C_MASTER_2		142
-#define RESET_I2C_MASTER_1		143
-/*					144-159	*/
-/*	RESET5					*/
-/*					160-191	*/
-/*	RESET6					*/
-#define RESET_PERIPHS_GENERAL		192
-#define RESET_PERIPHS_SPICC		193
-#define RESET_PERIPHS_SMART_CARD	194
-#define RESET_PERIPHS_SAR_ADC		195
-#define RESET_PERIPHS_I2C_MASTER_0	196
-#define RESET_SANA			197
-/*					198	*/
-#define RESET_PERIPHS_STREAM_INTERFACE	199
-#define RESET_PERIPHS_SDIO		200
-#define RESET_PERIPHS_UART_0		201
-#define RESET_PERIPHS_UART_1_2		202
-#define RESET_PERIPHS_ASYNC_0		203
-#define RESET_PERIPHS_ASYNC_1		204
-#define RESET_PERIPHS_SPI_0		205
-#define RESET_PERIPHS_SDHC		206
-#define RESET_UART_SLIP			207
-/*					208-223	*/
-/*	RESET7					*/
-#define RESET_USB_DDR_0			224
-#define RESET_USB_DDR_1			225
-#define RESET_USB_DDR_2			226
-#define RESET_USB_DDR_3			227
-/*					228	*/
-#define RESET_DEVICE_MMC_ARB		229
-/*					230	*/
-#define RESET_VID_LOCK			231
-#define RESET_A9_DMC_PIPEL		232
-/*					233-255	*/
-
-#endif
diff --git a/include/dt-bindings/reset/axg-aoclkc.h b/include/dt-bindings/reset/axg-aoclkc.h
deleted file mode 100644
index d342c0b6b2a7..000000000000
--- a/include/dt-bindings/reset/axg-aoclkc.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
-/*
- * Copyright (c) 2016 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * Copyright (c) 2018 Amlogic, inc.
- * Author: Qiufang Dai <qiufang.dai@amlogic.com>
- */
-
-#ifndef DT_BINDINGS_RESET_AMLOGIC_MESON_AXG_AOCLK
-#define DT_BINDINGS_RESET_AMLOGIC_MESON_AXG_AOCLK
-
-#define RESET_AO_REMOTE		0
-#define RESET_AO_I2C_MASTER	1
-#define RESET_AO_I2C_SLAVE	2
-#define RESET_AO_UART1		3
-#define RESET_AO_UART2		4
-#define RESET_AO_IR_BLASTER	5
-
-#endif
diff --git a/include/dt-bindings/reset/g12a-aoclkc.h b/include/dt-bindings/reset/g12a-aoclkc.h
deleted file mode 100644
index bd2e2337135c..000000000000
--- a/include/dt-bindings/reset/g12a-aoclkc.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
-/*
- * Copyright (c) 2016 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef DT_BINDINGS_RESET_AMLOGIC_MESON_G12A_AOCLK
-#define DT_BINDINGS_RESET_AMLOGIC_MESON_G12A_AOCLK
-
-#define RESET_AO_IR_IN		0
-#define RESET_AO_UART		1
-#define RESET_AO_I2C_M		2
-#define RESET_AO_I2C_S		3
-#define RESET_AO_SAR_ADC	4
-#define RESET_AO_UART2		5
-#define RESET_AO_IR_OUT		6
-
-#endif
diff --git a/include/dt-bindings/reset/gxbb-aoclkc.h b/include/dt-bindings/reset/gxbb-aoclkc.h
deleted file mode 100644
index 9e3fd60c309c..000000000000
--- a/include/dt-bindings/reset/gxbb-aoclkc.h
+++ /dev/null
@@ -1,66 +0,0 @@
-/*
- * This file is provided under a dual BSD/GPLv2 license.  When using or
- * redistributing this file, you may do so under either license.
- *
- * GPL LICENSE SUMMARY
- *
- * Copyright (c) 2016 BayLibre, SAS.
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>.
- * The full GNU General Public License is included in this distribution
- * in the file called COPYING.
- *
- * BSD LICENSE
- *
- * Copyright (c) 2016 BayLibre, SAS.
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- *   * Redistributions of source code must retain the above copyright
- *     notice, this list of conditions and the following disclaimer.
- *   * Redistributions in binary form must reproduce the above copyright
- *     notice, this list of conditions and the following disclaimer in
- *     the documentation and/or other materials provided with the
- *     distribution.
- *   * Neither the name of Intel Corporation nor the names of its
- *     contributors may be used to endorse or promote products derived
- *     from this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-#ifndef DT_BINDINGS_RESET_AMLOGIC_MESON_GXBB_AOCLK
-#define DT_BINDINGS_RESET_AMLOGIC_MESON_GXBB_AOCLK
-
-#define RESET_AO_REMOTE		0
-#define RESET_AO_I2C_MASTER	1
-#define RESET_AO_I2C_SLAVE	2
-#define RESET_AO_UART1		3
-#define RESET_AO_UART2		4
-#define RESET_AO_IR_BLASTER	5
-
-#endif
diff --git a/include/dt-bindings/sound/meson-aiu.h b/include/dt-bindings/sound/meson-aiu.h
deleted file mode 100644
index 1051b8af298b..000000000000
--- a/include/dt-bindings/sound/meson-aiu.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_MESON_AIU_H
-#define __DT_MESON_AIU_H
-
-#define AIU_CPU			0
-#define AIU_HDMI		1
-#define AIU_ACODEC		2
-
-#define CPU_I2S_FIFO		0
-#define CPU_SPDIF_FIFO		1
-#define CPU_I2S_ENCODER		2
-#define CPU_SPDIF_ENCODER	3
-
-#define CTRL_I2S		0
-#define CTRL_PCM		1
-#define CTRL_OUT		2
-
-#endif /* __DT_MESON_AIU_H */
diff --git a/include/dt-bindings/sound/meson-g12a-toacodec.h b/include/dt-bindings/sound/meson-g12a-toacodec.h
deleted file mode 100644
index 69d7a75592a2..000000000000
--- a/include/dt-bindings/sound/meson-g12a-toacodec.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_MESON_G12A_TOACODEC_H
-#define __DT_MESON_G12A_TOACODEC_H
-
-#define TOACODEC_IN_A	0
-#define TOACODEC_IN_B	1
-#define TOACODEC_IN_C	2
-#define TOACODEC_OUT	3
-
-#endif /* __DT_MESON_G12A_TOACODEC_H */
diff --git a/include/dt-bindings/sound/meson-g12a-tohdmitx.h b/include/dt-bindings/sound/meson-g12a-tohdmitx.h
deleted file mode 100644
index c5e1f48d30d0..000000000000
--- a/include/dt-bindings/sound/meson-g12a-tohdmitx.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_MESON_G12A_TOHDMITX_H
-#define __DT_MESON_G12A_TOHDMITX_H
-
-#define TOHDMITX_I2S_IN_A	0
-#define TOHDMITX_I2S_IN_B	1
-#define TOHDMITX_I2S_IN_C	2
-#define TOHDMITX_I2S_OUT	3
-#define TOHDMITX_SPDIF_IN_A	4
-#define TOHDMITX_SPDIF_IN_B	5
-#define TOHDMITX_SPDIF_OUT	6
-
-#endif /* __DT_MESON_G12A_TOHDMITX_H */

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
