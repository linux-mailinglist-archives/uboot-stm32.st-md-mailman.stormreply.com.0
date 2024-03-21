Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A32B288623A
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Mar 2024 22:04:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E134C6DD79;
	Thu, 21 Mar 2024 21:04:42 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 236B6C6DD73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 21:04:41 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d46dd5f222so18419261fa.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 14:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711055080; x=1711659880;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xxKAVbqOd2NeaFkTAg+ccSnF4IVs2lxnYIPokcvAF7Q=;
 b=qAB4cUbUX1JIdw+2rFh5avtmOgQEoGrNUnH2M0/CvJ/UYKoPSkTRUpdq0zve4VcpaF
 shdhWzzOe7Yy5mb1IxmHm3LN8m68Kb48WTUarwXK8kENO5lkf8WK3R6QEe5i8MYBcsbs
 AKQhPc0IWHQMpPa/RyURXk0FIeGZ/eLqNppr4DJLIOUWhKI0yqwRKbMnGarjC7p6MaiK
 5Itn/ikK/PRSQ5XClkokbttCFJF+ayIwxhrcEJZkv7bwmEuH1jXrYuzFH0/ql/obi6H0
 2yBrXSdy4mrpgGuRZwJ0nX1HaozHivCULou3LKxMi0yC/A3mq15qO5U4j+YUr6i/i9Ad
 iIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711055080; x=1711659880;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xxKAVbqOd2NeaFkTAg+ccSnF4IVs2lxnYIPokcvAF7Q=;
 b=a+bf8ZknplRJHa0mHjdVVpVHDGm620ahzcNfcX9k0HzaRACGHztRzdBqc+SOsweTm5
 4dyiNcY1ucgLEmvUuLu6/2hikih8ulW3pUjY/jFbpx1zMD7CdksnwFphvwPENWTqTkLm
 tEGZwlO0MWE6d0He0Qmckei7SN15HwjpTZWpeCXMHCseHRQCEgVgtCL9WIj8/Nyf3cCL
 ueQAHHSiC3ycrRdhIeE/jqzgcn/5QDNhY5LbYf5rGyxNzp2/5F4+Ugp/Y2N/bu8b8HOI
 Os2VUAWnYD3tTyXCQaxe0rNH5qSuXfpmGD0wsnLOR/kPWgA/dgHqN5wYDKEJBRTbHmo6
 Xn/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWavXtLY5LiPLCIBjzAbY0/EoeViwRU9ZntF4AsKUfA7PpwAsY3lWyTBV3nA5TNfrI9o0U3IZKMXUF+ouShPlC/rn4OG65/BcqDeyqZgw8qRjBq/qsZzeP0
X-Gm-Message-State: AOJu0YwDtRGm1958J/OOC2XaaApfSmTeyQMJtXz0X43ykfAwfd2sgBax
 5OAVTc+5YpxGiwzfGapC9Uomvg497wBGHOyRIiklS+8fvzr6SeRYVQ+0TNsySGQ=
X-Google-Smtp-Source: AGHT+IE7NObhxgNtFmOzGEf6Sz8OhM7utldGKsiMYSflHkO5xVUsm/2bw1r8SDhCMM2OArMZ3wXcww==
X-Received: by 2002:a2e:9613:0:b0:2d3:b37b:6a50 with SMTP id
 v19-20020a2e9613000000b002d3b37b6a50mr445516ljh.19.1711055080209; 
 Thu, 21 Mar 2024 14:04:40 -0700 (PDT)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b004146f728906sm925462wmb.7.2024.03.21.14.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 14:04:39 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Thu, 21 Mar 2024 21:04:06 +0000
MIME-Version: 1.0
Message-Id: <20240321-b4-upstream-dt-headers-v2-23-1eac0df875fe@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=41760;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=zWfKa4UEsXVufBu++zsn/dv5Lxa/f68cV9TltmC8NNY=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtQ/C/bWfqrk3PVVkv2KhvCPq8+Obd1+XOqQ2749XBt4m
 HyYDipodpSyMAhyMMiKKbKIn1hm2bT2sr3G9gUXYOawMoEMYeDiFICJTNvF8M/k0+/9NSu6T/57
 f2FqzM6XMStXRzfOYV/NtN5fbv10PRclhv/Vv5fu0XL/eS+gX1rNUueZz9I1M58tLhQw8n73b+8
 +y3snAQ==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 23/24] dt-bindings: drop generic headers
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

Drop all the subsystem headers that are compatible with the headers in
dts/upstream.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on AML-S805X-AC
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on AML-S905X-CC
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on BPI-M2S
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on BPI-M5
---
 include/dt-bindings/ata/ahci.h                 |  20 -
 include/dt-bindings/gpio/gpio.h                |  42 --
 include/dt-bindings/input/gpio-keys.h          |  13 -
 include/dt-bindings/input/input.h              |  17 -
 include/dt-bindings/input/linux-event-codes.h  | 806 -------------------------
 include/dt-bindings/interrupt-controller/irq.h |  19 -
 include/dt-bindings/leds/common.h              | 106 ----
 include/dt-bindings/mux/mux.h                  |  17 -
 include/dt-bindings/phy/phy.h                  |  26 -
 include/dt-bindings/pwm/pwm.h                  |  14 -
 include/dt-bindings/spmi/spmi.h                |  10 -
 include/dt-bindings/thermal/thermal.h          |  15 -
 include/dt-bindings/usb/pd.h                   |  88 ---
 13 files changed, 1193 deletions(-)

diff --git a/include/dt-bindings/ata/ahci.h b/include/dt-bindings/ata/ahci.h
deleted file mode 100644
index b3f3b7cf9af8..000000000000
--- a/include/dt-bindings/ata/ahci.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
-/*
- * This header provides constants for most AHCI bindings.
- */
-
-#ifndef _DT_BINDINGS_ATA_AHCI_H
-#define _DT_BINDINGS_ATA_AHCI_H
-
-/* Host Bus Adapter generic platform capabilities */
-#define HBA_SSS		(1 << 27)
-#define HBA_SMPS	(1 << 28)
-
-/* Host Bus Adapter port-specific platform capabilities */
-#define HBA_PORT_HPCP	(1 << 18)
-#define HBA_PORT_MPSP	(1 << 19)
-#define HBA_PORT_CPD	(1 << 20)
-#define HBA_PORT_ESP	(1 << 21)
-#define HBA_PORT_FBSCP	(1 << 22)
-
-#endif
diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
deleted file mode 100644
index c029467e828b..000000000000
--- a/include/dt-bindings/gpio/gpio.h
+++ /dev/null
@@ -1,42 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants for most GPIO bindings.
- *
- * Most GPIO bindings include a flags cell as part of the GPIO specifier.
- * In most cases, the format of the flags cell uses the standard values
- * defined in this header.
- */
-
-#ifndef _DT_BINDINGS_GPIO_GPIO_H
-#define _DT_BINDINGS_GPIO_GPIO_H
-
-/* Bit 0 express polarity */
-#define GPIO_ACTIVE_HIGH 0
-#define GPIO_ACTIVE_LOW 1
-
-/* Bit 1 express single-endedness */
-#define GPIO_PUSH_PULL 0
-#define GPIO_SINGLE_ENDED 2
-
-/* Bit 2 express Open drain or open source */
-#define GPIO_LINE_OPEN_SOURCE 0
-#define GPIO_LINE_OPEN_DRAIN 4
-
-/*
- * Open Drain/Collector is the combination of single-ended open drain interface.
- * Open Source/Emitter is the combination of single-ended open source interface.
- */
-#define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
-#define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_SOURCE)
-
-/* Bit 3 express GPIO suspend/resume and reset persistence */
-#define GPIO_PERSISTENT 0
-#define GPIO_TRANSITORY 8
-
-/* Bit 4 express pull up */
-#define GPIO_PULL_UP 16
-
-/* Bit 5 express pull down */
-#define GPIO_PULL_DOWN 32
-
-#endif
diff --git a/include/dt-bindings/input/gpio-keys.h b/include/dt-bindings/input/gpio-keys.h
deleted file mode 100644
index 8962df79e753..000000000000
--- a/include/dt-bindings/input/gpio-keys.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants for gpio keys bindings.
- */
-
-#ifndef _DT_BINDINGS_GPIO_KEYS_H
-#define _DT_BINDINGS_GPIO_KEYS_H
-
-#define EV_ACT_ANY		0x00	/* asserted or deasserted */
-#define EV_ACT_ASSERTED		0x01	/* asserted */
-#define EV_ACT_DEASSERTED	0x02	/* deasserted */
-
-#endif /* _DT_BINDINGS_GPIO_KEYS_H */
diff --git a/include/dt-bindings/input/input.h b/include/dt-bindings/input/input.h
deleted file mode 100644
index a21413324a3f..000000000000
--- a/include/dt-bindings/input/input.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/*
- * This header provides constants for most input bindings.
- *
- * Most input bindings include key code, matrix key code format.
- * In most cases, key code and matrix key code format uses
- * the standard values/macro defined in this header.
- */
-
-#ifndef _DT_BINDINGS_INPUT_INPUT_H
-#define _DT_BINDINGS_INPUT_INPUT_H
-
-#include "linux-event-codes.h"
-
-#define MATRIX_KEY(row, col, code)	\
-	((((row) & 0xFF) << 24) | (((col) & 0xFF) << 16) | ((code) & 0xFFFF))
-
-#endif /* _DT_BINDINGS_INPUT_INPUT_H */
diff --git a/include/dt-bindings/input/linux-event-codes.h b/include/dt-bindings/input/linux-event-codes.h
deleted file mode 100644
index 331458c0e710..000000000000
--- a/include/dt-bindings/input/linux-event-codes.h
+++ /dev/null
@@ -1,806 +0,0 @@
-/*
- * Input event codes
- *
- *    *** IMPORTANT ***
- * This file is not only included from C-code but also from devicetree source
- * files. As such this file MUST only contain comments and defines.
- *
- * Copyright (c) 1999-2002 Vojtech Pavlik
- * Copyright (c) 2015 Hans de Goede <hdegoede@redhat.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- */
-#ifndef _UAPI_INPUT_EVENT_CODES_H
-#define _UAPI_INPUT_EVENT_CODES_H
-
-/*
- * Device properties and quirks
- */
-
-#define INPUT_PROP_POINTER		0x00	/* needs a pointer */
-#define INPUT_PROP_DIRECT		0x01	/* direct input devices */
-#define INPUT_PROP_BUTTONPAD		0x02	/* has button(s) under pad */
-#define INPUT_PROP_SEMI_MT		0x03	/* touch rectangle only */
-#define INPUT_PROP_TOPBUTTONPAD		0x04	/* softbuttons at top of pad */
-#define INPUT_PROP_POINTING_STICK	0x05	/* is a pointing stick */
-#define INPUT_PROP_ACCELEROMETER	0x06	/* has accelerometer */
-
-#define INPUT_PROP_MAX			0x1f
-#define INPUT_PROP_CNT			(INPUT_PROP_MAX + 1)
-
-/*
- * Event types
- */
-
-#define EV_SYN			0x00
-#define EV_KEY			0x01
-#define EV_REL			0x02
-#define EV_ABS			0x03
-#define EV_MSC			0x04
-#define EV_SW			0x05
-#define EV_LED			0x11
-#define EV_SND			0x12
-#define EV_REP			0x14
-#define EV_FF			0x15
-#define EV_PWR			0x16
-#define EV_FF_STATUS		0x17
-#define EV_MAX			0x1f
-#define EV_CNT			(EV_MAX+1)
-
-/*
- * Synchronization events.
- */
-
-#define SYN_REPORT		0
-#define SYN_CONFIG		1
-#define SYN_MT_REPORT		2
-#define SYN_DROPPED		3
-#define SYN_MAX			0xf
-#define SYN_CNT			(SYN_MAX+1)
-
-/*
- * Keys and buttons
- *
- * Most of the keys/buttons are modeled after USB HUT 1.12
- * (see http://www.usb.org/developers/hidpage).
- * Abbreviations in the comments:
- * AC - Application Control
- * AL - Application Launch Button
- * SC - System Control
- */
-
-#define KEY_RESERVED		0
-#define KEY_ESC			1
-#define KEY_1			2
-#define KEY_2			3
-#define KEY_3			4
-#define KEY_4			5
-#define KEY_5			6
-#define KEY_6			7
-#define KEY_7			8
-#define KEY_8			9
-#define KEY_9			10
-#define KEY_0			11
-#define KEY_MINUS		12
-#define KEY_EQUAL		13
-#define KEY_BACKSPACE		14
-#define KEY_TAB			15
-#define KEY_Q			16
-#define KEY_W			17
-#define KEY_E			18
-#define KEY_R			19
-#define KEY_T			20
-#define KEY_Y			21
-#define KEY_U			22
-#define KEY_I			23
-#define KEY_O			24
-#define KEY_P			25
-#define KEY_LEFTBRACE		26
-#define KEY_RIGHTBRACE		27
-#define KEY_ENTER		28
-#define KEY_LEFTCTRL		29
-#define KEY_A			30
-#define KEY_S			31
-#define KEY_D			32
-#define KEY_F			33
-#define KEY_G			34
-#define KEY_H			35
-#define KEY_J			36
-#define KEY_K			37
-#define KEY_L			38
-#define KEY_SEMICOLON		39
-#define KEY_APOSTROPHE		40
-#define KEY_GRAVE		41
-#define KEY_LEFTSHIFT		42
-#define KEY_BACKSLASH		43
-#define KEY_Z			44
-#define KEY_X			45
-#define KEY_C			46
-#define KEY_V			47
-#define KEY_B			48
-#define KEY_N			49
-#define KEY_M			50
-#define KEY_COMMA		51
-#define KEY_DOT			52
-#define KEY_SLASH		53
-#define KEY_RIGHTSHIFT		54
-#define KEY_KPASTERISK		55
-#define KEY_LEFTALT		56
-#define KEY_SPACE		57
-#define KEY_CAPSLOCK		58
-#define KEY_F1			59
-#define KEY_F2			60
-#define KEY_F3			61
-#define KEY_F4			62
-#define KEY_F5			63
-#define KEY_F6			64
-#define KEY_F7			65
-#define KEY_F8			66
-#define KEY_F9			67
-#define KEY_F10			68
-#define KEY_NUMLOCK		69
-#define KEY_SCROLLLOCK		70
-#define KEY_KP7			71
-#define KEY_KP8			72
-#define KEY_KP9			73
-#define KEY_KPMINUS		74
-#define KEY_KP4			75
-#define KEY_KP5			76
-#define KEY_KP6			77
-#define KEY_KPPLUS		78
-#define KEY_KP1			79
-#define KEY_KP2			80
-#define KEY_KP3			81
-#define KEY_KP0			82
-#define KEY_KPDOT		83
-
-#define KEY_ZENKAKUHANKAKU	85
-#define KEY_102ND		86
-#define KEY_F11			87
-#define KEY_F12			88
-#define KEY_RO			89
-#define KEY_KATAKANA		90
-#define KEY_HIRAGANA		91
-#define KEY_HENKAN		92
-#define KEY_KATAKANAHIRAGANA	93
-#define KEY_MUHENKAN		94
-#define KEY_KPJPCOMMA		95
-#define KEY_KPENTER		96
-#define KEY_RIGHTCTRL		97
-#define KEY_KPSLASH		98
-#define KEY_SYSRQ		99
-#define KEY_RIGHTALT		100
-#define KEY_LINEFEED		101
-#define KEY_HOME		102
-#define KEY_UP			103
-#define KEY_PAGEUP		104
-#define KEY_LEFT		105
-#define KEY_RIGHT		106
-#define KEY_END			107
-#define KEY_DOWN		108
-#define KEY_PAGEDOWN		109
-#define KEY_INSERT		110
-#define KEY_DELETE		111
-#define KEY_MACRO		112
-#define KEY_MUTE		113
-#define KEY_VOLUMEDOWN		114
-#define KEY_VOLUMEUP		115
-#define KEY_POWER		116	/* SC System Power Down */
-#define KEY_KPEQUAL		117
-#define KEY_KPPLUSMINUS		118
-#define KEY_PAUSE		119
-#define KEY_SCALE		120	/* AL Compiz Scale (Expose) */
-
-#define KEY_KPCOMMA		121
-#define KEY_HANGEUL		122
-#define KEY_HANGUEL		KEY_HANGEUL
-#define KEY_HANJA		123
-#define KEY_YEN			124
-#define KEY_LEFTMETA		125
-#define KEY_RIGHTMETA		126
-#define KEY_COMPOSE		127
-
-#define KEY_STOP		128	/* AC Stop */
-#define KEY_AGAIN		129
-#define KEY_PROPS		130	/* AC Properties */
-#define KEY_UNDO		131	/* AC Undo */
-#define KEY_FRONT		132
-#define KEY_COPY		133	/* AC Copy */
-#define KEY_OPEN		134	/* AC Open */
-#define KEY_PASTE		135	/* AC Paste */
-#define KEY_FIND		136	/* AC Search */
-#define KEY_CUT			137	/* AC Cut */
-#define KEY_HELP		138	/* AL Integrated Help Center */
-#define KEY_MENU		139	/* Menu (show menu) */
-#define KEY_CALC		140	/* AL Calculator */
-#define KEY_SETUP		141
-#define KEY_SLEEP		142	/* SC System Sleep */
-#define KEY_WAKEUP		143	/* System Wake Up */
-#define KEY_FILE		144	/* AL Local Machine Browser */
-#define KEY_SENDFILE		145
-#define KEY_DELETEFILE		146
-#define KEY_XFER		147
-#define KEY_PROG1		148
-#define KEY_PROG2		149
-#define KEY_WWW			150	/* AL Internet Browser */
-#define KEY_MSDOS		151
-#define KEY_COFFEE		152	/* AL Terminal Lock/Screensaver */
-#define KEY_SCREENLOCK		KEY_COFFEE
-#define KEY_ROTATE_DISPLAY	153	/* Display orientation for e.g. tablets */
-#define KEY_DIRECTION		KEY_ROTATE_DISPLAY
-#define KEY_CYCLEWINDOWS	154
-#define KEY_MAIL		155
-#define KEY_BOOKMARKS		156	/* AC Bookmarks */
-#define KEY_COMPUTER		157
-#define KEY_BACK		158	/* AC Back */
-#define KEY_FORWARD		159	/* AC Forward */
-#define KEY_CLOSECD		160
-#define KEY_EJECTCD		161
-#define KEY_EJECTCLOSECD	162
-#define KEY_NEXTSONG		163
-#define KEY_PLAYPAUSE		164
-#define KEY_PREVIOUSSONG	165
-#define KEY_STOPCD		166
-#define KEY_RECORD		167
-#define KEY_REWIND		168
-#define KEY_PHONE		169	/* Media Select Telephone */
-#define KEY_ISO			170
-#define KEY_CONFIG		171	/* AL Consumer Control Configuration */
-#define KEY_HOMEPAGE		172	/* AC Home */
-#define KEY_REFRESH		173	/* AC Refresh */
-#define KEY_EXIT		174	/* AC Exit */
-#define KEY_MOVE		175
-#define KEY_EDIT		176
-#define KEY_SCROLLUP		177
-#define KEY_SCROLLDOWN		178
-#define KEY_KPLEFTPAREN		179
-#define KEY_KPRIGHTPAREN	180
-#define KEY_NEW			181	/* AC New */
-#define KEY_REDO		182	/* AC Redo/Repeat */
-
-#define KEY_F13			183
-#define KEY_F14			184
-#define KEY_F15			185
-#define KEY_F16			186
-#define KEY_F17			187
-#define KEY_F18			188
-#define KEY_F19			189
-#define KEY_F20			190
-#define KEY_F21			191
-#define KEY_F22			192
-#define KEY_F23			193
-#define KEY_F24			194
-
-#define KEY_PLAYCD		200
-#define KEY_PAUSECD		201
-#define KEY_PROG3		202
-#define KEY_PROG4		203
-#define KEY_DASHBOARD		204	/* AL Dashboard */
-#define KEY_SUSPEND		205
-#define KEY_CLOSE		206	/* AC Close */
-#define KEY_PLAY		207
-#define KEY_FASTFORWARD		208
-#define KEY_BASSBOOST		209
-#define KEY_PRINT		210	/* AC Print */
-#define KEY_HP			211
-#define KEY_CAMERA		212
-#define KEY_SOUND		213
-#define KEY_QUESTION		214
-#define KEY_EMAIL		215
-#define KEY_CHAT		216
-#define KEY_SEARCH		217
-#define KEY_CONNECT		218
-#define KEY_FINANCE		219	/* AL Checkbook/Finance */
-#define KEY_SPORT		220
-#define KEY_SHOP		221
-#define KEY_ALTERASE		222
-#define KEY_CANCEL		223	/* AC Cancel */
-#define KEY_BRIGHTNESSDOWN	224
-#define KEY_BRIGHTNESSUP	225
-#define KEY_MEDIA		226
-
-#define KEY_SWITCHVIDEOMODE	227	/* Cycle between available video
-					   outputs (Monitor/LCD/TV-out/etc) */
-#define KEY_KBDILLUMTOGGLE	228
-#define KEY_KBDILLUMDOWN	229
-#define KEY_KBDILLUMUP		230
-
-#define KEY_SEND		231	/* AC Send */
-#define KEY_REPLY		232	/* AC Reply */
-#define KEY_FORWARDMAIL		233	/* AC Forward Msg */
-#define KEY_SAVE		234	/* AC Save */
-#define KEY_DOCUMENTS		235
-
-#define KEY_BATTERY		236
-
-#define KEY_BLUETOOTH		237
-#define KEY_WLAN		238
-#define KEY_UWB			239
-
-#define KEY_UNKNOWN		240
-
-#define KEY_VIDEO_NEXT		241	/* drive next video source */
-#define KEY_VIDEO_PREV		242	/* drive previous video source */
-#define KEY_BRIGHTNESS_CYCLE	243	/* brightness up, after max is min */
-#define KEY_BRIGHTNESS_AUTO	244	/* Set Auto Brightness: manual
-					  brightness control is off,
-					  rely on ambient */
-#define KEY_BRIGHTNESS_ZERO	KEY_BRIGHTNESS_AUTO
-#define KEY_DISPLAY_OFF		245	/* display device to off state */
-
-#define KEY_WWAN		246	/* Wireless WAN (LTE, UMTS, GSM, etc.) */
-#define KEY_WIMAX		KEY_WWAN
-#define KEY_RFKILL		247	/* Key that controls all radios */
-
-#define KEY_MICMUTE		248	/* Mute / unmute the microphone */
-
-/* Code 255 is reserved for special needs of AT keyboard driver */
-
-#define BTN_MISC		0x100
-#define BTN_0			0x100
-#define BTN_1			0x101
-#define BTN_2			0x102
-#define BTN_3			0x103
-#define BTN_4			0x104
-#define BTN_5			0x105
-#define BTN_6			0x106
-#define BTN_7			0x107
-#define BTN_8			0x108
-#define BTN_9			0x109
-
-#define BTN_MOUSE		0x110
-#define BTN_LEFT		0x110
-#define BTN_RIGHT		0x111
-#define BTN_MIDDLE		0x112
-#define BTN_SIDE		0x113
-#define BTN_EXTRA		0x114
-#define BTN_FORWARD		0x115
-#define BTN_BACK		0x116
-#define BTN_TASK		0x117
-
-#define BTN_JOYSTICK		0x120
-#define BTN_TRIGGER		0x120
-#define BTN_THUMB		0x121
-#define BTN_THUMB2		0x122
-#define BTN_TOP			0x123
-#define BTN_TOP2		0x124
-#define BTN_PINKIE		0x125
-#define BTN_BASE		0x126
-#define BTN_BASE2		0x127
-#define BTN_BASE3		0x128
-#define BTN_BASE4		0x129
-#define BTN_BASE5		0x12a
-#define BTN_BASE6		0x12b
-#define BTN_DEAD		0x12f
-
-#define BTN_GAMEPAD		0x130
-#define BTN_SOUTH		0x130
-#define BTN_A			BTN_SOUTH
-#define BTN_EAST		0x131
-#define BTN_B			BTN_EAST
-#define BTN_C			0x132
-#define BTN_NORTH		0x133
-#define BTN_X			BTN_NORTH
-#define BTN_WEST		0x134
-#define BTN_Y			BTN_WEST
-#define BTN_Z			0x135
-#define BTN_TL			0x136
-#define BTN_TR			0x137
-#define BTN_TL2			0x138
-#define BTN_TR2			0x139
-#define BTN_SELECT		0x13a
-#define BTN_START		0x13b
-#define BTN_MODE		0x13c
-#define BTN_THUMBL		0x13d
-#define BTN_THUMBR		0x13e
-
-#define BTN_DIGI		0x140
-#define BTN_TOOL_PEN		0x140
-#define BTN_TOOL_RUBBER		0x141
-#define BTN_TOOL_BRUSH		0x142
-#define BTN_TOOL_PENCIL		0x143
-#define BTN_TOOL_AIRBRUSH	0x144
-#define BTN_TOOL_FINGER		0x145
-#define BTN_TOOL_MOUSE		0x146
-#define BTN_TOOL_LENS		0x147
-#define BTN_TOOL_QUINTTAP	0x148	/* Five fingers on trackpad */
-#define BTN_TOUCH		0x14a
-#define BTN_STYLUS		0x14b
-#define BTN_STYLUS2		0x14c
-#define BTN_TOOL_DOUBLETAP	0x14d
-#define BTN_TOOL_TRIPLETAP	0x14e
-#define BTN_TOOL_QUADTAP	0x14f	/* Four fingers on trackpad */
-
-#define BTN_WHEEL		0x150
-#define BTN_GEAR_DOWN		0x150
-#define BTN_GEAR_UP		0x151
-
-#define KEY_OK			0x160
-#define KEY_SELECT		0x161
-#define KEY_GOTO		0x162
-#define KEY_CLEAR		0x163
-#define KEY_POWER2		0x164
-#define KEY_OPTION		0x165
-#define KEY_INFO		0x166	/* AL OEM Features/Tips/Tutorial */
-#define KEY_TIME		0x167
-#define KEY_VENDOR		0x168
-#define KEY_ARCHIVE		0x169
-#define KEY_PROGRAM		0x16a	/* Media Select Program Guide */
-#define KEY_CHANNEL		0x16b
-#define KEY_FAVORITES		0x16c
-#define KEY_EPG			0x16d
-#define KEY_PVR			0x16e	/* Media Select Home */
-#define KEY_MHP			0x16f
-#define KEY_LANGUAGE		0x170
-#define KEY_TITLE		0x171
-#define KEY_SUBTITLE		0x172
-#define KEY_ANGLE		0x173
-#define KEY_ZOOM		0x174
-#define KEY_MODE		0x175
-#define KEY_KEYBOARD		0x176
-#define KEY_SCREEN		0x177
-#define KEY_PC			0x178	/* Media Select Computer */
-#define KEY_TV			0x179	/* Media Select TV */
-#define KEY_TV2			0x17a	/* Media Select Cable */
-#define KEY_VCR			0x17b	/* Media Select VCR */
-#define KEY_VCR2		0x17c	/* VCR Plus */
-#define KEY_SAT			0x17d	/* Media Select Satellite */
-#define KEY_SAT2		0x17e
-#define KEY_CD			0x17f	/* Media Select CD */
-#define KEY_TAPE		0x180	/* Media Select Tape */
-#define KEY_RADIO		0x181
-#define KEY_TUNER		0x182	/* Media Select Tuner */
-#define KEY_PLAYER		0x183
-#define KEY_TEXT		0x184
-#define KEY_DVD			0x185	/* Media Select DVD */
-#define KEY_AUX			0x186
-#define KEY_MP3			0x187
-#define KEY_AUDIO		0x188	/* AL Audio Browser */
-#define KEY_VIDEO		0x189	/* AL Movie Browser */
-#define KEY_DIRECTORY		0x18a
-#define KEY_LIST		0x18b
-#define KEY_MEMO		0x18c	/* Media Select Messages */
-#define KEY_CALENDAR		0x18d
-#define KEY_RED			0x18e
-#define KEY_GREEN		0x18f
-#define KEY_YELLOW		0x190
-#define KEY_BLUE		0x191
-#define KEY_CHANNELUP		0x192	/* Channel Increment */
-#define KEY_CHANNELDOWN		0x193	/* Channel Decrement */
-#define KEY_FIRST		0x194
-#define KEY_LAST		0x195	/* Recall Last */
-#define KEY_AB			0x196
-#define KEY_NEXT		0x197
-#define KEY_RESTART		0x198
-#define KEY_SLOW		0x199
-#define KEY_SHUFFLE		0x19a
-#define KEY_BREAK		0x19b
-#define KEY_PREVIOUS		0x19c
-#define KEY_DIGITS		0x19d
-#define KEY_TEEN		0x19e
-#define KEY_TWEN		0x19f
-#define KEY_VIDEOPHONE		0x1a0	/* Media Select Video Phone */
-#define KEY_GAMES		0x1a1	/* Media Select Games */
-#define KEY_ZOOMIN		0x1a2	/* AC Zoom In */
-#define KEY_ZOOMOUT		0x1a3	/* AC Zoom Out */
-#define KEY_ZOOMRESET		0x1a4	/* AC Zoom */
-#define KEY_WORDPROCESSOR	0x1a5	/* AL Word Processor */
-#define KEY_EDITOR		0x1a6	/* AL Text Editor */
-#define KEY_SPREADSHEET		0x1a7	/* AL Spreadsheet */
-#define KEY_GRAPHICSEDITOR	0x1a8	/* AL Graphics Editor */
-#define KEY_PRESENTATION	0x1a9	/* AL Presentation App */
-#define KEY_DATABASE		0x1aa	/* AL Database App */
-#define KEY_NEWS		0x1ab	/* AL Newsreader */
-#define KEY_VOICEMAIL		0x1ac	/* AL Voicemail */
-#define KEY_ADDRESSBOOK		0x1ad	/* AL Contacts/Address Book */
-#define KEY_MESSENGER		0x1ae	/* AL Instant Messaging */
-#define KEY_DISPLAYTOGGLE	0x1af	/* Turn display (LCD) on and off */
-#define KEY_BRIGHTNESS_TOGGLE	KEY_DISPLAYTOGGLE
-#define KEY_SPELLCHECK		0x1b0   /* AL Spell Check */
-#define KEY_LOGOFF		0x1b1   /* AL Logoff */
-
-#define KEY_DOLLAR		0x1b2
-#define KEY_EURO		0x1b3
-
-#define KEY_FRAMEBACK		0x1b4	/* Consumer - transport controls */
-#define KEY_FRAMEFORWARD	0x1b5
-#define KEY_CONTEXT_MENU	0x1b6	/* GenDesc - system context menu */
-#define KEY_MEDIA_REPEAT	0x1b7	/* Consumer - transport control */
-#define KEY_10CHANNELSUP	0x1b8	/* 10 channels up (10+) */
-#define KEY_10CHANNELSDOWN	0x1b9	/* 10 channels down (10-) */
-#define KEY_IMAGES		0x1ba	/* AL Image Browser */
-
-#define KEY_DEL_EOL		0x1c0
-#define KEY_DEL_EOS		0x1c1
-#define KEY_INS_LINE		0x1c2
-#define KEY_DEL_LINE		0x1c3
-
-#define KEY_FN			0x1d0
-#define KEY_FN_ESC		0x1d1
-#define KEY_FN_F1		0x1d2
-#define KEY_FN_F2		0x1d3
-#define KEY_FN_F3		0x1d4
-#define KEY_FN_F4		0x1d5
-#define KEY_FN_F5		0x1d6
-#define KEY_FN_F6		0x1d7
-#define KEY_FN_F7		0x1d8
-#define KEY_FN_F8		0x1d9
-#define KEY_FN_F9		0x1da
-#define KEY_FN_F10		0x1db
-#define KEY_FN_F11		0x1dc
-#define KEY_FN_F12		0x1dd
-#define KEY_FN_1		0x1de
-#define KEY_FN_2		0x1df
-#define KEY_FN_D		0x1e0
-#define KEY_FN_E		0x1e1
-#define KEY_FN_F		0x1e2
-#define KEY_FN_S		0x1e3
-#define KEY_FN_B		0x1e4
-
-#define KEY_BRL_DOT1		0x1f1
-#define KEY_BRL_DOT2		0x1f2
-#define KEY_BRL_DOT3		0x1f3
-#define KEY_BRL_DOT4		0x1f4
-#define KEY_BRL_DOT5		0x1f5
-#define KEY_BRL_DOT6		0x1f6
-#define KEY_BRL_DOT7		0x1f7
-#define KEY_BRL_DOT8		0x1f8
-#define KEY_BRL_DOT9		0x1f9
-#define KEY_BRL_DOT10		0x1fa
-
-#define KEY_NUMERIC_0		0x200	/* used by phones, remote controls, */
-#define KEY_NUMERIC_1		0x201	/* and other keypads */
-#define KEY_NUMERIC_2		0x202
-#define KEY_NUMERIC_3		0x203
-#define KEY_NUMERIC_4		0x204
-#define KEY_NUMERIC_5		0x205
-#define KEY_NUMERIC_6		0x206
-#define KEY_NUMERIC_7		0x207
-#define KEY_NUMERIC_8		0x208
-#define KEY_NUMERIC_9		0x209
-#define KEY_NUMERIC_STAR	0x20a
-#define KEY_NUMERIC_POUND	0x20b
-#define KEY_NUMERIC_A		0x20c	/* Phone key A - HUT Telephony 0xb9 */
-#define KEY_NUMERIC_B		0x20d
-#define KEY_NUMERIC_C		0x20e
-#define KEY_NUMERIC_D		0x20f
-
-#define KEY_CAMERA_FOCUS	0x210
-#define KEY_WPS_BUTTON		0x211	/* WiFi Protected Setup key */
-
-#define KEY_TOUCHPAD_TOGGLE	0x212	/* Request switch touchpad on or off */
-#define KEY_TOUCHPAD_ON		0x213
-#define KEY_TOUCHPAD_OFF	0x214
-
-#define KEY_CAMERA_ZOOMIN	0x215
-#define KEY_CAMERA_ZOOMOUT	0x216
-#define KEY_CAMERA_UP		0x217
-#define KEY_CAMERA_DOWN		0x218
-#define KEY_CAMERA_LEFT		0x219
-#define KEY_CAMERA_RIGHT	0x21a
-
-#define KEY_ATTENDANT_ON	0x21b
-#define KEY_ATTENDANT_OFF	0x21c
-#define KEY_ATTENDANT_TOGGLE	0x21d	/* Attendant call on or off */
-#define KEY_LIGHTS_TOGGLE	0x21e	/* Reading light on or off */
-
-#define BTN_DPAD_UP		0x220
-#define BTN_DPAD_DOWN		0x221
-#define BTN_DPAD_LEFT		0x222
-#define BTN_DPAD_RIGHT		0x223
-
-#define KEY_ALS_TOGGLE		0x230	/* Ambient light sensor */
-
-#define KEY_BUTTONCONFIG		0x240	/* AL Button Configuration */
-#define KEY_TASKMANAGER		0x241	/* AL Task/Project Manager */
-#define KEY_JOURNAL		0x242	/* AL Log/Journal/Timecard */
-#define KEY_CONTROLPANEL		0x243	/* AL Control Panel */
-#define KEY_APPSELECT		0x244	/* AL Select Task/Application */
-#define KEY_SCREENSAVER		0x245	/* AL Screen Saver */
-#define KEY_VOICECOMMAND		0x246	/* Listening Voice Command */
-
-#define KEY_BRIGHTNESS_MIN		0x250	/* Set Brightness to Minimum */
-#define KEY_BRIGHTNESS_MAX		0x251	/* Set Brightness to Maximum */
-
-#define KEY_KBDINPUTASSIST_PREV		0x260
-#define KEY_KBDINPUTASSIST_NEXT		0x261
-#define KEY_KBDINPUTASSIST_PREVGROUP		0x262
-#define KEY_KBDINPUTASSIST_NEXTGROUP		0x263
-#define KEY_KBDINPUTASSIST_ACCEPT		0x264
-#define KEY_KBDINPUTASSIST_CANCEL		0x265
-
-#define BTN_TRIGGER_HAPPY		0x2c0
-#define BTN_TRIGGER_HAPPY1		0x2c0
-#define BTN_TRIGGER_HAPPY2		0x2c1
-#define BTN_TRIGGER_HAPPY3		0x2c2
-#define BTN_TRIGGER_HAPPY4		0x2c3
-#define BTN_TRIGGER_HAPPY5		0x2c4
-#define BTN_TRIGGER_HAPPY6		0x2c5
-#define BTN_TRIGGER_HAPPY7		0x2c6
-#define BTN_TRIGGER_HAPPY8		0x2c7
-#define BTN_TRIGGER_HAPPY9		0x2c8
-#define BTN_TRIGGER_HAPPY10		0x2c9
-#define BTN_TRIGGER_HAPPY11		0x2ca
-#define BTN_TRIGGER_HAPPY12		0x2cb
-#define BTN_TRIGGER_HAPPY13		0x2cc
-#define BTN_TRIGGER_HAPPY14		0x2cd
-#define BTN_TRIGGER_HAPPY15		0x2ce
-#define BTN_TRIGGER_HAPPY16		0x2cf
-#define BTN_TRIGGER_HAPPY17		0x2d0
-#define BTN_TRIGGER_HAPPY18		0x2d1
-#define BTN_TRIGGER_HAPPY19		0x2d2
-#define BTN_TRIGGER_HAPPY20		0x2d3
-#define BTN_TRIGGER_HAPPY21		0x2d4
-#define BTN_TRIGGER_HAPPY22		0x2d5
-#define BTN_TRIGGER_HAPPY23		0x2d6
-#define BTN_TRIGGER_HAPPY24		0x2d7
-#define BTN_TRIGGER_HAPPY25		0x2d8
-#define BTN_TRIGGER_HAPPY26		0x2d9
-#define BTN_TRIGGER_HAPPY27		0x2da
-#define BTN_TRIGGER_HAPPY28		0x2db
-#define BTN_TRIGGER_HAPPY29		0x2dc
-#define BTN_TRIGGER_HAPPY30		0x2dd
-#define BTN_TRIGGER_HAPPY31		0x2de
-#define BTN_TRIGGER_HAPPY32		0x2df
-#define BTN_TRIGGER_HAPPY33		0x2e0
-#define BTN_TRIGGER_HAPPY34		0x2e1
-#define BTN_TRIGGER_HAPPY35		0x2e2
-#define BTN_TRIGGER_HAPPY36		0x2e3
-#define BTN_TRIGGER_HAPPY37		0x2e4
-#define BTN_TRIGGER_HAPPY38		0x2e5
-#define BTN_TRIGGER_HAPPY39		0x2e6
-#define BTN_TRIGGER_HAPPY40		0x2e7
-
-/* We avoid low common keys in module aliases so they don't get huge. */
-#define KEY_MIN_INTERESTING	KEY_MUTE
-#define KEY_MAX			0x2ff
-#define KEY_CNT			(KEY_MAX+1)
-
-/*
- * Relative axes
- */
-
-#define REL_X			0x00
-#define REL_Y			0x01
-#define REL_Z			0x02
-#define REL_RX			0x03
-#define REL_RY			0x04
-#define REL_RZ			0x05
-#define REL_HWHEEL		0x06
-#define REL_DIAL		0x07
-#define REL_WHEEL		0x08
-#define REL_MISC		0x09
-#define REL_MAX			0x0f
-#define REL_CNT			(REL_MAX+1)
-
-/*
- * Absolute axes
- */
-
-#define ABS_X			0x00
-#define ABS_Y			0x01
-#define ABS_Z			0x02
-#define ABS_RX			0x03
-#define ABS_RY			0x04
-#define ABS_RZ			0x05
-#define ABS_THROTTLE		0x06
-#define ABS_RUDDER		0x07
-#define ABS_WHEEL		0x08
-#define ABS_GAS			0x09
-#define ABS_BRAKE		0x0a
-#define ABS_HAT0X		0x10
-#define ABS_HAT0Y		0x11
-#define ABS_HAT1X		0x12
-#define ABS_HAT1Y		0x13
-#define ABS_HAT2X		0x14
-#define ABS_HAT2Y		0x15
-#define ABS_HAT3X		0x16
-#define ABS_HAT3Y		0x17
-#define ABS_PRESSURE		0x18
-#define ABS_DISTANCE		0x19
-#define ABS_TILT_X		0x1a
-#define ABS_TILT_Y		0x1b
-#define ABS_TOOL_WIDTH		0x1c
-
-#define ABS_VOLUME		0x20
-
-#define ABS_MISC		0x28
-
-#define ABS_MT_SLOT		0x2f	/* MT slot being modified */
-#define ABS_MT_TOUCH_MAJOR	0x30	/* Major axis of touching ellipse */
-#define ABS_MT_TOUCH_MINOR	0x31	/* Minor axis (omit if circular) */
-#define ABS_MT_WIDTH_MAJOR	0x32	/* Major axis of approaching ellipse */
-#define ABS_MT_WIDTH_MINOR	0x33	/* Minor axis (omit if circular) */
-#define ABS_MT_ORIENTATION	0x34	/* Ellipse orientation */
-#define ABS_MT_POSITION_X	0x35	/* Center X touch position */
-#define ABS_MT_POSITION_Y	0x36	/* Center Y touch position */
-#define ABS_MT_TOOL_TYPE	0x37	/* Type of touching device */
-#define ABS_MT_BLOB_ID		0x38	/* Group a set of packets as a blob */
-#define ABS_MT_TRACKING_ID	0x39	/* Unique ID of initiated contact */
-#define ABS_MT_PRESSURE		0x3a	/* Pressure on contact area */
-#define ABS_MT_DISTANCE		0x3b	/* Contact hover distance */
-#define ABS_MT_TOOL_X		0x3c	/* Center X tool position */
-#define ABS_MT_TOOL_Y		0x3d	/* Center Y tool position */
-
-
-#define ABS_MAX			0x3f
-#define ABS_CNT			(ABS_MAX+1)
-
-/*
- * Switch events
- */
-
-#define SW_LID			0x00  /* set = lid shut */
-#define SW_TABLET_MODE		0x01  /* set = tablet mode */
-#define SW_HEADPHONE_INSERT	0x02  /* set = inserted */
-#define SW_RFKILL_ALL		0x03  /* rfkill master switch, type "any"
-					 set = radio enabled */
-#define SW_RADIO		SW_RFKILL_ALL	/* deprecated */
-#define SW_MICROPHONE_INSERT	0x04  /* set = inserted */
-#define SW_DOCK			0x05  /* set = plugged into dock */
-#define SW_LINEOUT_INSERT	0x06  /* set = inserted */
-#define SW_JACK_PHYSICAL_INSERT 0x07  /* set = mechanical switch set */
-#define SW_VIDEOOUT_INSERT	0x08  /* set = inserted */
-#define SW_CAMERA_LENS_COVER	0x09  /* set = lens covered */
-#define SW_KEYPAD_SLIDE		0x0a  /* set = keypad slide out */
-#define SW_FRONT_PROXIMITY	0x0b  /* set = front proximity sensor active */
-#define SW_ROTATE_LOCK		0x0c  /* set = rotate locked/disabled */
-#define SW_LINEIN_INSERT	0x0d  /* set = inserted */
-#define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
-#define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
-#define SW_MAX			0x10
-#define SW_CNT			(SW_MAX+1)
-
-/*
- * Misc events
- */
-
-#define MSC_SERIAL		0x00
-#define MSC_PULSELED		0x01
-#define MSC_GESTURE		0x02
-#define MSC_RAW			0x03
-#define MSC_SCAN		0x04
-#define MSC_TIMESTAMP		0x05
-#define MSC_MAX			0x07
-#define MSC_CNT			(MSC_MAX+1)
-
-/*
- * LEDs
- */
-
-#define LED_NUML		0x00
-#define LED_CAPSL		0x01
-#define LED_SCROLLL		0x02
-#define LED_COMPOSE		0x03
-#define LED_KANA		0x04
-#define LED_SLEEP		0x05
-#define LED_SUSPEND		0x06
-#define LED_MUTE		0x07
-#define LED_MISC		0x08
-#define LED_MAIL		0x09
-#define LED_CHARGING		0x0a
-#define LED_MAX			0x0f
-#define LED_CNT			(LED_MAX+1)
-
-/*
- * Autorepeat values
- */
-
-#define REP_DELAY		0x00
-#define REP_PERIOD		0x01
-#define REP_MAX			0x01
-#define REP_CNT			(REP_MAX+1)
-
-/*
- * Sounds
- */
-
-#define SND_CLICK		0x00
-#define SND_BELL		0x01
-#define SND_TONE		0x02
-#define SND_MAX			0x07
-#define SND_CNT			(SND_MAX+1)
-
-#endif
diff --git a/include/dt-bindings/interrupt-controller/irq.h b/include/dt-bindings/interrupt-controller/irq.h
deleted file mode 100644
index 33a1003c55aa..000000000000
--- a/include/dt-bindings/interrupt-controller/irq.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/*
- * This header provides constants for most IRQ bindings.
- *
- * Most IRQ bindings include a flags cell as part of the IRQ specifier.
- * In most cases, the format of the flags cell uses the standard values
- * defined in this header.
- */
-
-#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_H
-#define _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_H
-
-#define IRQ_TYPE_NONE		0
-#define IRQ_TYPE_EDGE_RISING	1
-#define IRQ_TYPE_EDGE_FALLING	2
-#define IRQ_TYPE_EDGE_BOTH	(IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING)
-#define IRQ_TYPE_LEVEL_HIGH	4
-#define IRQ_TYPE_LEVEL_LOW	8
-
-#endif
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
deleted file mode 100644
index 9a0d33d027ff..000000000000
--- a/include/dt-bindings/leds/common.h
+++ /dev/null
@@ -1,106 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides macros for the common LEDs device tree bindings.
- *
- * Copyright (C) 2015, Samsung Electronics Co., Ltd.
- * Author: Jacek Anaszewski <j.anaszewski@samsung.com>
- *
- * Copyright (C) 2019 Jacek Anaszewski <jacek.anaszewski@gmail.com>
- * Copyright (C) 2020 Pavel Machek <pavel@ucw.cz>
- */
-
-#ifndef __DT_BINDINGS_LEDS_H
-#define __DT_BINDINGS_LEDS_H
-
-/* External trigger type */
-#define LEDS_TRIG_TYPE_EDGE	0
-#define LEDS_TRIG_TYPE_LEVEL	1
-
-/* Boost modes */
-#define LEDS_BOOST_OFF		0
-#define LEDS_BOOST_ADAPTIVE	1
-#define LEDS_BOOST_FIXED	2
-
-/* Standard LED colors */
-#define LED_COLOR_ID_WHITE	0
-#define LED_COLOR_ID_RED	1
-#define LED_COLOR_ID_GREEN	2
-#define LED_COLOR_ID_BLUE	3
-#define LED_COLOR_ID_AMBER	4
-#define LED_COLOR_ID_VIOLET	5
-#define LED_COLOR_ID_YELLOW	6
-#define LED_COLOR_ID_IR		7
-#define LED_COLOR_ID_MULTI	8	/* For multicolor LEDs */
-#define LED_COLOR_ID_RGB	9	/* For multicolor LEDs that can do arbitrary color,
-					   so this would include RGBW and similar */
-#define LED_COLOR_ID_PURPLE	10
-#define LED_COLOR_ID_ORANGE	11
-#define LED_COLOR_ID_PINK	12
-#define LED_COLOR_ID_CYAN	13
-#define LED_COLOR_ID_LIME	14
-#define LED_COLOR_ID_MAX	15
-
-/* Standard LED functions */
-/* Keyboard LEDs, usually it would be input4::capslock etc. */
-/*   Obsolete equivalent: "shift-key-light" */
-#define LED_FUNCTION_CAPSLOCK "capslock"
-#define LED_FUNCTION_SCROLLLOCK "scrolllock"
-#define LED_FUNCTION_NUMLOCK "numlock"
-/*   Obsolete equivalents: "tpacpi::thinklight" (IBM/Lenovo Thinkpads),
-     "lp5523:kb{1,2,3,4,5,6}" (Nokia N900) */
-#define LED_FUNCTION_KBD_BACKLIGHT "kbd_backlight"
-
-/* System LEDs, usually found on system body.
-   platform::mute (etc) is sometimes seen, :mute would be better */
-#define LED_FUNCTION_POWER "power"
-#define LED_FUNCTION_DISK "disk"
-
-/*   Obsolete: "platform:*:charging" (allwinner sun50i) */
-#define LED_FUNCTION_CHARGING "charging"
-/*   Used RGB notification LEDs common on phones.
-     Obsolete equivalents: "status-led:{red,green,blue}" (Motorola Droid 4),
-     "lp5523:{r,g,b}" (Nokia N900) */
-#define LED_FUNCTION_STATUS "status"
-
-#define LED_FUNCTION_MICMUTE "micmute"
-#define LED_FUNCTION_MUTE "mute"
-
-/* Used for player LEDs as found on game controllers from e.g. Nintendo, Sony. */
-#define LED_FUNCTION_PLAYER1 "player-1"
-#define LED_FUNCTION_PLAYER2 "player-2"
-#define LED_FUNCTION_PLAYER3 "player-3"
-#define LED_FUNCTION_PLAYER4 "player-4"
-#define LED_FUNCTION_PLAYER5 "player-5"
-
-/* Miscelleaus functions. Use functions above if you can. */
-#define LED_FUNCTION_ACTIVITY "activity"
-#define LED_FUNCTION_ALARM "alarm"
-#define LED_FUNCTION_BACKLIGHT "backlight"
-#define LED_FUNCTION_BLUETOOTH "bluetooth"
-#define LED_FUNCTION_BOOT "boot"
-#define LED_FUNCTION_CPU "cpu"
-#define LED_FUNCTION_DEBUG "debug"
-#define LED_FUNCTION_DISK_ACTIVITY "disk-activity"
-#define LED_FUNCTION_DISK_ERR "disk-err"
-#define LED_FUNCTION_DISK_READ "disk-read"
-#define LED_FUNCTION_DISK_WRITE "disk-write"
-#define LED_FUNCTION_FAULT "fault"
-#define LED_FUNCTION_FLASH "flash"
-#define LED_FUNCTION_HEARTBEAT "heartbeat"
-#define LED_FUNCTION_INDICATOR "indicator"
-#define LED_FUNCTION_LAN "lan"
-#define LED_FUNCTION_MAIL "mail"
-#define LED_FUNCTION_MTD "mtd"
-#define LED_FUNCTION_PANIC "panic"
-#define LED_FUNCTION_PROGRAMMING "programming"
-#define LED_FUNCTION_RX "rx"
-#define LED_FUNCTION_SD "sd"
-#define LED_FUNCTION_STANDBY "standby"
-#define LED_FUNCTION_TORCH "torch"
-#define LED_FUNCTION_TX "tx"
-#define LED_FUNCTION_USB "usb"
-#define LED_FUNCTION_WAN "wan"
-#define LED_FUNCTION_WLAN "wlan"
-#define LED_FUNCTION_WPS "wps"
-
-#endif /* __DT_BINDINGS_LEDS_H */
diff --git a/include/dt-bindings/mux/mux.h b/include/dt-bindings/mux/mux.h
deleted file mode 100644
index 042719218dbf..000000000000
--- a/include/dt-bindings/mux/mux.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants for most Multiplexer bindings.
- *
- * Most Multiplexer bindings specify an idle state. In most cases, the
- * the multiplexer can be left as is when idle, and in some cases it can
- * disconnect the input/output and leave the multiplexer in a high
- * impedance state.
- */
-
-#ifndef _DT_BINDINGS_MUX_MUX_H
-#define _DT_BINDINGS_MUX_MUX_H
-
-#define MUX_IDLE_AS_IS      (-1)
-#define MUX_IDLE_DISCONNECT (-2)
-
-#endif
diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
deleted file mode 100644
index f48c9acf251e..000000000000
--- a/include/dt-bindings/phy/phy.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- *
- * This header provides constants for the phy framework
- *
- * Copyright (C) 2014 STMicroelectronics
- * Author: Gabriel Fernandez <gabriel.fernandez@st.com>
- */
-
-#ifndef _DT_BINDINGS_PHY
-#define _DT_BINDINGS_PHY
-
-#define PHY_NONE		0
-#define PHY_TYPE_SATA		1
-#define PHY_TYPE_PCIE		2
-#define PHY_TYPE_USB2		3
-#define PHY_TYPE_USB3		4
-#define PHY_TYPE_UFS		5
-#define PHY_TYPE_DP		6
-#define PHY_TYPE_XPCS		7
-#define PHY_TYPE_SGMII		8
-#define PHY_TYPE_QSGMII		9
-#define PHY_TYPE_DPHY		10
-#define PHY_TYPE_CPHY		11
-
-#endif /* _DT_BINDINGS_PHY */
diff --git a/include/dt-bindings/pwm/pwm.h b/include/dt-bindings/pwm/pwm.h
deleted file mode 100644
index 96f49e82253e..000000000000
--- a/include/dt-bindings/pwm/pwm.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/*
- * This header provides constants for most PWM bindings.
- *
- * Most PWM bindings can include a flags cell as part of the PWM specifier.
- * In most cases, the format of the flags cell uses the standard values
- * defined in this header.
- */
-
-#ifndef _DT_BINDINGS_PWM_PWM_H
-#define _DT_BINDINGS_PWM_PWM_H
-
-#define PWM_POLARITY_INVERTED			(1 << 0)
-
-#endif
diff --git a/include/dt-bindings/spmi/spmi.h b/include/dt-bindings/spmi/spmi.h
deleted file mode 100644
index ad4a43481de4..000000000000
--- a/include/dt-bindings/spmi/spmi.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2013, The Linux Foundation. All rights reserved.
- */
-#ifndef __DT_BINDINGS_SPMI_H
-#define __DT_BINDINGS_SPMI_H
-
-#define SPMI_USID	0
-#define SPMI_GSID	1
-
-#endif
diff --git a/include/dt-bindings/thermal/thermal.h b/include/dt-bindings/thermal/thermal.h
deleted file mode 100644
index 7871e5f52b1c..000000000000
--- a/include/dt-bindings/thermal/thermal.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * This header provides constants for most thermal bindings.
- *
- * Copyright (C) 2013 Texas Instruments
- *	Eduardo Valentin <eduardo.valentin@ti.com>
- */
-
-#ifndef _DT_BINDINGS_THERMAL_THERMAL_H
-#define _DT_BINDINGS_THERMAL_THERMAL_H
-
-/* On cooling devices upper and lower limits */
-#define THERMAL_NO_LIMIT		(~0)
-
-#endif
diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
deleted file mode 100644
index 985f2bbd4d24..000000000000
--- a/include/dt-bindings/usb/pd.h
+++ /dev/null
@@ -1,88 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_POWER_DELIVERY_H
-#define __DT_POWER_DELIVERY_H
-
-/* Power delivery Power Data Object definitions */
-#define PDO_TYPE_FIXED		0
-#define PDO_TYPE_BATT		1
-#define PDO_TYPE_VAR		2
-#define PDO_TYPE_APDO		3
-
-#define PDO_TYPE_SHIFT		30
-#define PDO_TYPE_MASK		0x3
-
-#define PDO_TYPE(t)	((t) << PDO_TYPE_SHIFT)
-
-#define PDO_VOLT_MASK		0x3ff
-#define PDO_CURR_MASK		0x3ff
-#define PDO_PWR_MASK		0x3ff
-
-#define PDO_FIXED_DUAL_ROLE	(1 << 29) /* Power role swap supported */
-#define PDO_FIXED_SUSPEND	(1 << 28) /* USB Suspend supported (Source) */
-#define PDO_FIXED_HIGHER_CAP	(1 << 28) /* Requires more than vSafe5V (Sink) */
-#define PDO_FIXED_EXTPOWER	(1 << 27) /* Externally powered */
-#define PDO_FIXED_USB_COMM	(1 << 26) /* USB communications capable */
-#define PDO_FIXED_DATA_SWAP	(1 << 25) /* Data role swap supported */
-#define PDO_FIXED_VOLT_SHIFT	10	/* 50mV units */
-#define PDO_FIXED_CURR_SHIFT	0	/* 10mA units */
-
-#define PDO_FIXED_VOLT(mv)	((((mv) / 50) & PDO_VOLT_MASK) << PDO_FIXED_VOLT_SHIFT)
-#define PDO_FIXED_CURR(ma)	((((ma) / 10) & PDO_CURR_MASK) << PDO_FIXED_CURR_SHIFT)
-
-#define PDO_FIXED(mv, ma, flags)			\
-	(PDO_TYPE(PDO_TYPE_FIXED) | (flags) |		\
-	 PDO_FIXED_VOLT(mv) | PDO_FIXED_CURR(ma))
-
-#define VSAFE5V 5000 /* mv units */
-
-#define PDO_BATT_MAX_VOLT_SHIFT	20	/* 50mV units */
-#define PDO_BATT_MIN_VOLT_SHIFT	10	/* 50mV units */
-#define PDO_BATT_MAX_PWR_SHIFT	0	/* 250mW units */
-
-#define PDO_BATT_MIN_VOLT(mv) ((((mv) / 50) & PDO_VOLT_MASK) << PDO_BATT_MIN_VOLT_SHIFT)
-#define PDO_BATT_MAX_VOLT(mv) ((((mv) / 50) & PDO_VOLT_MASK) << PDO_BATT_MAX_VOLT_SHIFT)
-#define PDO_BATT_MAX_POWER(mw) ((((mw) / 250) & PDO_PWR_MASK) << PDO_BATT_MAX_PWR_SHIFT)
-
-#define PDO_BATT(min_mv, max_mv, max_mw)			\
-	(PDO_TYPE(PDO_TYPE_BATT) | PDO_BATT_MIN_VOLT(min_mv) |	\
-	 PDO_BATT_MAX_VOLT(max_mv) | PDO_BATT_MAX_POWER(max_mw))
-
-#define PDO_VAR_MAX_VOLT_SHIFT	20	/* 50mV units */
-#define PDO_VAR_MIN_VOLT_SHIFT	10	/* 50mV units */
-#define PDO_VAR_MAX_CURR_SHIFT	0	/* 10mA units */
-
-#define PDO_VAR_MIN_VOLT(mv) ((((mv) / 50) & PDO_VOLT_MASK) << PDO_VAR_MIN_VOLT_SHIFT)
-#define PDO_VAR_MAX_VOLT(mv) ((((mv) / 50) & PDO_VOLT_MASK) << PDO_VAR_MAX_VOLT_SHIFT)
-#define PDO_VAR_MAX_CURR(ma) ((((ma) / 10) & PDO_CURR_MASK) << PDO_VAR_MAX_CURR_SHIFT)
-
-#define PDO_VAR(min_mv, max_mv, max_ma)				\
-	(PDO_TYPE(PDO_TYPE_VAR) | PDO_VAR_MIN_VOLT(min_mv) |	\
-	 PDO_VAR_MAX_VOLT(max_mv) | PDO_VAR_MAX_CURR(max_ma))
-
-#define APDO_TYPE_PPS		0
-
-#define PDO_APDO_TYPE_SHIFT	28	/* Only valid value currently is 0x0 - PPS */
-#define PDO_APDO_TYPE_MASK	0x3
-
-#define PDO_APDO_TYPE(t)	((t) << PDO_APDO_TYPE_SHIFT)
-
-#define PDO_PPS_APDO_MAX_VOLT_SHIFT	17	/* 100mV units */
-#define PDO_PPS_APDO_MIN_VOLT_SHIFT	8	/* 100mV units */
-#define PDO_PPS_APDO_MAX_CURR_SHIFT	0	/* 50mA units */
-
-#define PDO_PPS_APDO_VOLT_MASK	0xff
-#define PDO_PPS_APDO_CURR_MASK	0x7f
-
-#define PDO_PPS_APDO_MIN_VOLT(mv)	\
-	((((mv) / 100) & PDO_PPS_APDO_VOLT_MASK) << PDO_PPS_APDO_MIN_VOLT_SHIFT)
-#define PDO_PPS_APDO_MAX_VOLT(mv)	\
-	((((mv) / 100) & PDO_PPS_APDO_VOLT_MASK) << PDO_PPS_APDO_MAX_VOLT_SHIFT)
-#define PDO_PPS_APDO_MAX_CURR(ma)	\
-	((((ma) / 50) & PDO_PPS_APDO_CURR_MASK) << PDO_PPS_APDO_MAX_CURR_SHIFT)
-
-#define PDO_PPS_APDO(min_mv, max_mv, max_ma)					\
-	(PDO_TYPE(PDO_TYPE_APDO) | PDO_APDO_TYPE(APDO_TYPE_PPS) |		\
-	 PDO_PPS_APDO_MIN_VOLT(min_mv) | PDO_PPS_APDO_MAX_VOLT(max_mv) |	\
-	 PDO_PPS_APDO_MAX_CURR(max_ma))
-
- #endif /* __DT_POWER_DELIVERY_H */

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
