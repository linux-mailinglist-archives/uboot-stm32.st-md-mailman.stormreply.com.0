Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAC487079D
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Mar 2024 17:51:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13FF0C6DD69;
	Mon,  4 Mar 2024 16:51:54 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FD47C6DD6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 16:51:52 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-412e783c94fso5576145e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 08:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709571112; x=1710175912;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aVDKzg9V2lBGcaJRFhmFUi2V8PIKffjRsqXPDSEFEk0=;
 b=aW05fwj/AHPhDLvHPiBRyMKexRfemC8e3S0uzmk/4SBsn9Wez/fPOEoq6gn/53ybA7
 bJttiQ2u60YrGK9Uk82QwSbHBAaDq7jrIECjYHj6dwj1jCku/4pSb5NT77epPN/d+lcZ
 N2LoR9Jtb0xHcfcExMWuDg22LNECpHc+39Yn59G9r//ZzaZ5bjrZ1vdkfQA7gHT0LgU4
 2HF5m8m551b4vYyrzRxNSqKIHjddYDzqXjpicho4fFRLR/qPrPfyOYfZn3iDvD3h3OP0
 AjZXvhKDY55hWkW0qVSavNPGf3ab1SugkEkoQgouyjeC4evVcvqUCoM0UKhWTVc823n/
 /N6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571112; x=1710175912;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aVDKzg9V2lBGcaJRFhmFUi2V8PIKffjRsqXPDSEFEk0=;
 b=jE+fsTyzKJQinLJ0VH8Zg7y7mxFpgyZfbSopY44hAmAoTr5ynlL1hwMu0ny+iLB05B
 qm9Hk261diP8zURr7NQlLIj9MZGLwGlVY16XxWv36Bp60ujO/TL88qp4/oMaGoLOmJJ4
 OYxe18QBn6kiliX7AV4C885/j65MrtW/9snPHlB19xwxUT3sFXYHrXEjIPEMNo4ZXUa8
 YqTY7AjCa4b5jjWYTDCaXKyHO/fdDlCwb/Wb3/jp5HNe6E+Dj8EXvVZlEIyuPKNEi0oh
 A4cDotkCGFK9Hjnf3FnGvG3sZ3RvjU0H7UyzFPR4pOkHQArFpDbsTwdpRcq8z9F+llq5
 8RwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj1JSAV8qT8eLowBZiN1wHDCfHdl9cJjJo3h5q1nqjaZZrsYWWA3XWMBKyDt9JcGLQPP5F2Sao3Ys94R3QCvyTu7djzJ2ylKj405R31wSstTiLUU98Muur
X-Gm-Message-State: AOJu0Yxy7000qDKjZ0VDIvsCTIndEPTdjPgYPrSFYjIEy4Gumt5a4zNU
 fvOwlFkAQQf//SYP2B8fj/wy/K5jK4JgyWOSrc523q+5y857vTfrhmsCc/8288U=
X-Google-Smtp-Source: AGHT+IHhrXpAWv10W9btOlhsp/GjzqarEn1kBvO2ep93Oy996qK36Bi2t0ojWsrJM4up8iKz+pWFlQ==
X-Received: by 2002:a05:600c:5252:b0:412:de1f:cdfb with SMTP id
 fc18-20020a05600c525200b00412de1fcdfbmr3167355wmb.20.1709571111857; 
 Mon, 04 Mar 2024 08:51:51 -0800 (PST)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm10598517wmq.6.2024.03.04.08.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:51:51 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Mon, 04 Mar 2024 16:51:26 +0000
MIME-Version: 1.0
Message-Id: <20240304-b4-upstream-dt-headers-v1-18-b7ff41925f92@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=34887;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=Rmw7YFywNX9UzQxfjmwd48GA4gJ5B5udEStMy4frYYs=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtSnfzg4PjVGOE1pXOtdcGYy79t1U/4omu+5sebo3jd8T
 xYKsZRO7ShlYRDkYJAVU2QRP7HMsmntZXuN7QsuwMxhZQIZwsDFKQAT+ZTG8D/G9ntJuEG7WHJl
 2Mzv/4LWc+/2NRUzfVkQNeHV5hTH5scM/x3iuvueeH8su3w1VTLq9QeJFX7rHE0tyrr5GjPOTD0
 xTxUA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH RFC 18/26] renesas: drop remaining dt-binding
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

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 include/dt-bindings/pinctrl/r7s72100-pinctrl.h |  18 ----
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h    |  23 ----
 include/dt-bindings/pinctrl/rzn1-pinctrl.h     | 141 -------------------------
 include/dt-bindings/power/r8a774a1-sysc.h      |  31 ------
 include/dt-bindings/power/r8a774b1-sysc.h      |  26 -----
 include/dt-bindings/power/r8a774c0-sysc.h      |  25 -----
 include/dt-bindings/power/r8a774e1-sysc.h      |  36 -------
 include/dt-bindings/power/r8a7790-sysc.h       |  31 ------
 include/dt-bindings/power/r8a7791-sysc.h       |  23 ----
 include/dt-bindings/power/r8a7792-sysc.h       |  23 ----
 include/dt-bindings/power/r8a7793-sysc.h       |  25 -----
 include/dt-bindings/power/r8a7794-sysc.h       |  23 ----
 include/dt-bindings/power/r8a7795-sysc.h       |  38 -------
 include/dt-bindings/power/r8a7796-sysc.h       |  33 ------
 include/dt-bindings/power/r8a77961-sysc.h      |  32 ------
 include/dt-bindings/power/r8a77965-sysc.h      |  29 -----
 include/dt-bindings/power/r8a77970-sysc.h      |  28 -----
 include/dt-bindings/power/r8a77980-sysc.h      |  43 --------
 include/dt-bindings/power/r8a77990-sysc.h      |  26 -----
 include/dt-bindings/power/r8a77995-sysc.h      |  20 ----
 include/dt-bindings/power/r8a779a0-sysc.h      |  59 -----------
 include/dt-bindings/power/r8a779f0-sysc.h      |  30 ------
 include/dt-bindings/power/r8a779g0-sysc.h      |  46 --------
 23 files changed, 809 deletions(-)

diff --git a/include/dt-bindings/pinctrl/r7s72100-pinctrl.h b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
deleted file mode 100644
index 31ee37610eb2..000000000000
--- a/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Defines macros and constants for Renesas RZ/A1 pin controller pin
- * muxing functions.
- */
-#ifndef __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
-#define __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
-
-#define RZA1_PINS_PER_PORT	16
-
-/*
- * Create the pin index from its bank and position numbers and store in
- * the upper 16 bits the alternate function identifier
- */
-#define RZA1_PINMUX(b, p, f)	\
-	((b) * RZA1_PINS_PER_PORT + (p) | ((f) << 16))
-
-#endif /* __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H */
diff --git a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
deleted file mode 100644
index c78ed5e5efb7..000000000000
--- a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
-/*
- * This header provides constants for Renesas RZ/G2L family pinctrl bindings.
- *
- * Copyright (C) 2021 Renesas Electronics Corp.
- *
- */
-
-#ifndef __DT_BINDINGS_RZG2L_PINCTRL_H
-#define __DT_BINDINGS_RZG2L_PINCTRL_H
-
-#define RZG2L_PINS_PER_PORT	8
-
-/*
- * Create the pin index from its bank and position numbers and store in
- * the upper 16 bits the alternate function identifier
- */
-#define RZG2L_PORT_PINMUX(b, p, f)	((b) * RZG2L_PINS_PER_PORT + (p) | ((f) << 16))
-
-/* Convert a port and pin label to its global pin index */
-#define RZG2L_GPIO(port, pin)	((port) * RZG2L_PINS_PER_PORT + (pin))
-
-#endif /* __DT_BINDINGS_RZG2L_PINCTRL_H */
diff --git a/include/dt-bindings/pinctrl/rzn1-pinctrl.h b/include/dt-bindings/pinctrl/rzn1-pinctrl.h
deleted file mode 100644
index 21d6cc4d59f5..000000000000
--- a/include/dt-bindings/pinctrl/rzn1-pinctrl.h
+++ /dev/null
@@ -1,141 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Defines macros and constants for Renesas RZ/N1 pin controller pin
- * muxing functions.
- */
-#ifndef __DT_BINDINGS_RZN1_PINCTRL_H
-#define __DT_BINDINGS_RZN1_PINCTRL_H
-
-#define RZN1_PINMUX(_gpio, _func) \
-	(((_func) << 8) | (_gpio))
-
-/*
- * Given the different levels of muxing on the SoC, it was decided to
- * 'linearize' them into one numerical space. So mux level 1, 2 and the MDIO
- * muxes are all represented by one single value.
- *
- * You can derive the hardware value pretty easily too, as
- * 0...9   are Level 1
- * 10...71 are Level 2. The Level 2 mux will be set to this
- *         value - RZN1_FUNC_L2_OFFSET, and the Level 1 mux will be
- *         set accordingly.
- * 72...103 are for the 2 MDIO muxes.
- */
-#define RZN1_FUNC_HIGHZ				0
-#define RZN1_FUNC_0L				1
-#define RZN1_FUNC_CLK_ETH_MII_RGMII_RMII	2
-#define RZN1_FUNC_CLK_ETH_NAND			3
-#define RZN1_FUNC_QSPI				4
-#define RZN1_FUNC_SDIO				5
-#define RZN1_FUNC_LCD				6
-#define RZN1_FUNC_LCD_E				7
-#define RZN1_FUNC_MSEBIM			8
-#define RZN1_FUNC_MSEBIS			9
-#define RZN1_FUNC_L2_OFFSET			10	/* I'm Special */
-
-#define RZN1_FUNC_HIGHZ1			(RZN1_FUNC_L2_OFFSET + 0)
-#define RZN1_FUNC_ETHERCAT			(RZN1_FUNC_L2_OFFSET + 1)
-#define RZN1_FUNC_SERCOS3			(RZN1_FUNC_L2_OFFSET + 2)
-#define RZN1_FUNC_SDIO_E			(RZN1_FUNC_L2_OFFSET + 3)
-#define RZN1_FUNC_ETH_MDIO			(RZN1_FUNC_L2_OFFSET + 4)
-#define RZN1_FUNC_ETH_MDIO_E1			(RZN1_FUNC_L2_OFFSET + 5)
-#define RZN1_FUNC_USB				(RZN1_FUNC_L2_OFFSET + 6)
-#define RZN1_FUNC_MSEBIM_E			(RZN1_FUNC_L2_OFFSET + 7)
-#define RZN1_FUNC_MSEBIS_E			(RZN1_FUNC_L2_OFFSET + 8)
-#define RZN1_FUNC_RSV				(RZN1_FUNC_L2_OFFSET + 9)
-#define RZN1_FUNC_RSV_E				(RZN1_FUNC_L2_OFFSET + 10)
-#define RZN1_FUNC_RSV_E1			(RZN1_FUNC_L2_OFFSET + 11)
-#define RZN1_FUNC_UART0_I			(RZN1_FUNC_L2_OFFSET + 12)
-#define RZN1_FUNC_UART0_I_E			(RZN1_FUNC_L2_OFFSET + 13)
-#define RZN1_FUNC_UART1_I			(RZN1_FUNC_L2_OFFSET + 14)
-#define RZN1_FUNC_UART1_I_E			(RZN1_FUNC_L2_OFFSET + 15)
-#define RZN1_FUNC_UART2_I			(RZN1_FUNC_L2_OFFSET + 16)
-#define RZN1_FUNC_UART2_I_E			(RZN1_FUNC_L2_OFFSET + 17)
-#define RZN1_FUNC_UART0				(RZN1_FUNC_L2_OFFSET + 18)
-#define RZN1_FUNC_UART0_E			(RZN1_FUNC_L2_OFFSET + 19)
-#define RZN1_FUNC_UART1				(RZN1_FUNC_L2_OFFSET + 20)
-#define RZN1_FUNC_UART1_E			(RZN1_FUNC_L2_OFFSET + 21)
-#define RZN1_FUNC_UART2				(RZN1_FUNC_L2_OFFSET + 22)
-#define RZN1_FUNC_UART2_E			(RZN1_FUNC_L2_OFFSET + 23)
-#define RZN1_FUNC_UART3				(RZN1_FUNC_L2_OFFSET + 24)
-#define RZN1_FUNC_UART3_E			(RZN1_FUNC_L2_OFFSET + 25)
-#define RZN1_FUNC_UART4				(RZN1_FUNC_L2_OFFSET + 26)
-#define RZN1_FUNC_UART4_E			(RZN1_FUNC_L2_OFFSET + 27)
-#define RZN1_FUNC_UART5				(RZN1_FUNC_L2_OFFSET + 28)
-#define RZN1_FUNC_UART5_E			(RZN1_FUNC_L2_OFFSET + 29)
-#define RZN1_FUNC_UART6				(RZN1_FUNC_L2_OFFSET + 30)
-#define RZN1_FUNC_UART6_E			(RZN1_FUNC_L2_OFFSET + 31)
-#define RZN1_FUNC_UART7				(RZN1_FUNC_L2_OFFSET + 32)
-#define RZN1_FUNC_UART7_E			(RZN1_FUNC_L2_OFFSET + 33)
-#define RZN1_FUNC_SPI0_M			(RZN1_FUNC_L2_OFFSET + 34)
-#define RZN1_FUNC_SPI0_M_E			(RZN1_FUNC_L2_OFFSET + 35)
-#define RZN1_FUNC_SPI1_M			(RZN1_FUNC_L2_OFFSET + 36)
-#define RZN1_FUNC_SPI1_M_E			(RZN1_FUNC_L2_OFFSET + 37)
-#define RZN1_FUNC_SPI2_M			(RZN1_FUNC_L2_OFFSET + 38)
-#define RZN1_FUNC_SPI2_M_E			(RZN1_FUNC_L2_OFFSET + 39)
-#define RZN1_FUNC_SPI3_M			(RZN1_FUNC_L2_OFFSET + 40)
-#define RZN1_FUNC_SPI3_M_E			(RZN1_FUNC_L2_OFFSET + 41)
-#define RZN1_FUNC_SPI4_S			(RZN1_FUNC_L2_OFFSET + 42)
-#define RZN1_FUNC_SPI4_S_E			(RZN1_FUNC_L2_OFFSET + 43)
-#define RZN1_FUNC_SPI5_S			(RZN1_FUNC_L2_OFFSET + 44)
-#define RZN1_FUNC_SPI5_S_E			(RZN1_FUNC_L2_OFFSET + 45)
-#define RZN1_FUNC_SGPIO0_M			(RZN1_FUNC_L2_OFFSET + 46)
-#define RZN1_FUNC_SGPIO1_M			(RZN1_FUNC_L2_OFFSET + 47)
-#define RZN1_FUNC_GPIO				(RZN1_FUNC_L2_OFFSET + 48)
-#define RZN1_FUNC_CAN				(RZN1_FUNC_L2_OFFSET + 49)
-#define RZN1_FUNC_I2C				(RZN1_FUNC_L2_OFFSET + 50)
-#define RZN1_FUNC_SAFE				(RZN1_FUNC_L2_OFFSET + 51)
-#define RZN1_FUNC_PTO_PWM			(RZN1_FUNC_L2_OFFSET + 52)
-#define RZN1_FUNC_PTO_PWM1			(RZN1_FUNC_L2_OFFSET + 53)
-#define RZN1_FUNC_PTO_PWM2			(RZN1_FUNC_L2_OFFSET + 54)
-#define RZN1_FUNC_PTO_PWM3			(RZN1_FUNC_L2_OFFSET + 55)
-#define RZN1_FUNC_PTO_PWM4			(RZN1_FUNC_L2_OFFSET + 56)
-#define RZN1_FUNC_DELTA_SIGMA			(RZN1_FUNC_L2_OFFSET + 57)
-#define RZN1_FUNC_SGPIO2_M			(RZN1_FUNC_L2_OFFSET + 58)
-#define RZN1_FUNC_SGPIO3_M			(RZN1_FUNC_L2_OFFSET + 59)
-#define RZN1_FUNC_SGPIO4_S			(RZN1_FUNC_L2_OFFSET + 60)
-#define RZN1_FUNC_MAC_MTIP_SWITCH		(RZN1_FUNC_L2_OFFSET + 61)
-
-#define RZN1_FUNC_MDIO_OFFSET			(RZN1_FUNC_L2_OFFSET + 62)
-
-/* These are MDIO0 peripherals for the RZN1_FUNC_ETH_MDIO function */
-#define RZN1_FUNC_MDIO0_HIGHZ			(RZN1_FUNC_MDIO_OFFSET + 0)
-#define RZN1_FUNC_MDIO0_GMAC0			(RZN1_FUNC_MDIO_OFFSET + 1)
-#define RZN1_FUNC_MDIO0_GMAC1			(RZN1_FUNC_MDIO_OFFSET + 2)
-#define RZN1_FUNC_MDIO0_ECAT			(RZN1_FUNC_MDIO_OFFSET + 3)
-#define RZN1_FUNC_MDIO0_S3_MDIO0		(RZN1_FUNC_MDIO_OFFSET + 4)
-#define RZN1_FUNC_MDIO0_S3_MDIO1		(RZN1_FUNC_MDIO_OFFSET + 5)
-#define RZN1_FUNC_MDIO0_HWRTOS			(RZN1_FUNC_MDIO_OFFSET + 6)
-#define RZN1_FUNC_MDIO0_SWITCH			(RZN1_FUNC_MDIO_OFFSET + 7)
-/* These are MDIO0 peripherals for the RZN1_FUNC_ETH_MDIO_E1 function */
-#define RZN1_FUNC_MDIO0_E1_HIGHZ		(RZN1_FUNC_MDIO_OFFSET + 8)
-#define RZN1_FUNC_MDIO0_E1_GMAC0		(RZN1_FUNC_MDIO_OFFSET + 9)
-#define RZN1_FUNC_MDIO0_E1_GMAC1		(RZN1_FUNC_MDIO_OFFSET + 10)
-#define RZN1_FUNC_MDIO0_E1_ECAT			(RZN1_FUNC_MDIO_OFFSET + 11)
-#define RZN1_FUNC_MDIO0_E1_S3_MDIO0		(RZN1_FUNC_MDIO_OFFSET + 12)
-#define RZN1_FUNC_MDIO0_E1_S3_MDIO1		(RZN1_FUNC_MDIO_OFFSET + 13)
-#define RZN1_FUNC_MDIO0_E1_HWRTOS		(RZN1_FUNC_MDIO_OFFSET + 14)
-#define RZN1_FUNC_MDIO0_E1_SWITCH		(RZN1_FUNC_MDIO_OFFSET + 15)
-
-/* These are MDIO1 peripherals for the RZN1_FUNC_ETH_MDIO function */
-#define RZN1_FUNC_MDIO1_HIGHZ			(RZN1_FUNC_MDIO_OFFSET + 16)
-#define RZN1_FUNC_MDIO1_GMAC0			(RZN1_FUNC_MDIO_OFFSET + 17)
-#define RZN1_FUNC_MDIO1_GMAC1			(RZN1_FUNC_MDIO_OFFSET + 18)
-#define RZN1_FUNC_MDIO1_ECAT			(RZN1_FUNC_MDIO_OFFSET + 19)
-#define RZN1_FUNC_MDIO1_S3_MDIO0		(RZN1_FUNC_MDIO_OFFSET + 20)
-#define RZN1_FUNC_MDIO1_S3_MDIO1		(RZN1_FUNC_MDIO_OFFSET + 21)
-#define RZN1_FUNC_MDIO1_HWRTOS			(RZN1_FUNC_MDIO_OFFSET + 22)
-#define RZN1_FUNC_MDIO1_SWITCH			(RZN1_FUNC_MDIO_OFFSET + 23)
-/* These are MDIO1 peripherals for the RZN1_FUNC_ETH_MDIO_E1 function */
-#define RZN1_FUNC_MDIO1_E1_HIGHZ		(RZN1_FUNC_MDIO_OFFSET + 24)
-#define RZN1_FUNC_MDIO1_E1_GMAC0		(RZN1_FUNC_MDIO_OFFSET + 25)
-#define RZN1_FUNC_MDIO1_E1_GMAC1		(RZN1_FUNC_MDIO_OFFSET + 26)
-#define RZN1_FUNC_MDIO1_E1_ECAT			(RZN1_FUNC_MDIO_OFFSET + 27)
-#define RZN1_FUNC_MDIO1_E1_S3_MDIO0		(RZN1_FUNC_MDIO_OFFSET + 28)
-#define RZN1_FUNC_MDIO1_E1_S3_MDIO1		(RZN1_FUNC_MDIO_OFFSET + 29)
-#define RZN1_FUNC_MDIO1_E1_HWRTOS		(RZN1_FUNC_MDIO_OFFSET + 30)
-#define RZN1_FUNC_MDIO1_E1_SWITCH		(RZN1_FUNC_MDIO_OFFSET + 31)
-
-#define RZN1_FUNC_MAX				(RZN1_FUNC_MDIO_OFFSET + 32)
-
-#endif /* __DT_BINDINGS_RZN1_PINCTRL_H */
diff --git a/include/dt-bindings/power/r8a774a1-sysc.h b/include/dt-bindings/power/r8a774a1-sysc.h
deleted file mode 100644
index 580f431cd32e..000000000000
--- a/include/dt-bindings/power/r8a774a1-sysc.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- * Copyright (C) 2018 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_POWER_R8A774A1_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A774A1_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A774A1_PD_CA57_CPU0		 0
-#define R8A774A1_PD_CA57_CPU1		 1
-#define R8A774A1_PD_CA53_CPU0		 5
-#define R8A774A1_PD_CA53_CPU1		 6
-#define R8A774A1_PD_CA53_CPU2		 7
-#define R8A774A1_PD_CA53_CPU3		 8
-#define R8A774A1_PD_CA57_SCU		12
-#define R8A774A1_PD_A3VC		14
-#define R8A774A1_PD_3DG_A		17
-#define R8A774A1_PD_3DG_B		18
-#define R8A774A1_PD_CA53_SCU		21
-#define R8A774A1_PD_A2VC0		25
-#define R8A774A1_PD_A2VC1		26
-
-/* Always-on power area */
-#define R8A774A1_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A774A1_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a774b1-sysc.h b/include/dt-bindings/power/r8a774b1-sysc.h
deleted file mode 100644
index 373736402f04..000000000000
--- a/include/dt-bindings/power/r8a774b1-sysc.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- * Copyright (C) 2019 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_POWER_R8A774B1_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A774B1_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A774B1_PD_CA57_CPU0		 0
-#define R8A774B1_PD_CA57_CPU1		 1
-#define R8A774B1_PD_A3VP		 9
-#define R8A774B1_PD_CA57_SCU		12
-#define R8A774B1_PD_A3VC		14
-#define R8A774B1_PD_3DG_A		17
-#define R8A774B1_PD_3DG_B		18
-#define R8A774B1_PD_A2VC1		26
-
-/* Always-on power area */
-#define R8A774B1_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A774B1_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a774c0-sysc.h b/include/dt-bindings/power/r8a774c0-sysc.h
deleted file mode 100644
index 9922d4c6f87d..000000000000
--- a/include/dt-bindings/power/r8a774c0-sysc.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- * Copyright (C) 2018 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_POWER_R8A774C0_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A774C0_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A774C0_PD_CA53_CPU0		5
-#define R8A774C0_PD_CA53_CPU1		6
-#define R8A774C0_PD_A3VC		14
-#define R8A774C0_PD_3DG_A		17
-#define R8A774C0_PD_3DG_B		18
-#define R8A774C0_PD_CA53_SCU		21
-#define R8A774C0_PD_A2VC1		26
-
-/* Always-on power area */
-#define R8A774C0_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A774C0_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a774e1-sysc.h b/include/dt-bindings/power/r8a774e1-sysc.h
deleted file mode 100644
index 7edb8161db36..000000000000
--- a/include/dt-bindings/power/r8a774e1-sysc.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- * Copyright (C) 2020 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_POWER_R8A774E1_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A774E1_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A774E1_PD_CA57_CPU0		 0
-#define R8A774E1_PD_CA57_CPU1		 1
-#define R8A774E1_PD_CA57_CPU2		 2
-#define R8A774E1_PD_CA57_CPU3		 3
-#define R8A774E1_PD_CA53_CPU0		 5
-#define R8A774E1_PD_CA53_CPU1		 6
-#define R8A774E1_PD_CA53_CPU2		 7
-#define R8A774E1_PD_CA53_CPU3		 8
-#define R8A774E1_PD_A3VP		 9
-#define R8A774E1_PD_CA57_SCU		12
-#define R8A774E1_PD_A3VC		14
-#define R8A774E1_PD_3DG_A		17
-#define R8A774E1_PD_3DG_B		18
-#define R8A774E1_PD_3DG_C		19
-#define R8A774E1_PD_3DG_D		20
-#define R8A774E1_PD_CA53_SCU		21
-#define R8A774E1_PD_3DG_E		22
-#define R8A774E1_PD_A2VC1		26
-
-/* Always-on power area */
-#define R8A774E1_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A774E1_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a7790-sysc.h b/include/dt-bindings/power/r8a7790-sysc.h
deleted file mode 100644
index bcb490570606..000000000000
--- a/include/dt-bindings/power/r8a7790-sysc.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2016 Glider bvba
- */
-#ifndef __DT_BINDINGS_POWER_R8A7790_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A7790_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A7790_PD_CA15_CPU0		 0
-#define R8A7790_PD_CA15_CPU1		 1
-#define R8A7790_PD_CA15_CPU2		 2
-#define R8A7790_PD_CA15_CPU3		 3
-#define R8A7790_PD_CA7_CPU0		 5
-#define R8A7790_PD_CA7_CPU1		 6
-#define R8A7790_PD_CA7_CPU2		 7
-#define R8A7790_PD_CA7_CPU3		 8
-#define R8A7790_PD_CA15_SCU		12
-#define R8A7790_PD_SH_4A		16
-#define R8A7790_PD_RGX			20
-#define R8A7790_PD_CA7_SCU		21
-#define R8A7790_PD_IMP			24
-
-/* Always-on power area */
-#define R8A7790_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A7790_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a7791-sysc.h b/include/dt-bindings/power/r8a7791-sysc.h
deleted file mode 100644
index 1d20fae42420..000000000000
--- a/include/dt-bindings/power/r8a7791-sysc.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2016 Glider bvba
- */
-#ifndef __DT_BINDINGS_POWER_R8A7791_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A7791_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A7791_PD_CA15_CPU0		 0
-#define R8A7791_PD_CA15_CPU1		 1
-#define R8A7791_PD_CA15_SCU		12
-#define R8A7791_PD_SH_4A		16
-#define R8A7791_PD_SGX			20
-
-/* Always-on power area */
-#define R8A7791_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A7791_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a7792-sysc.h b/include/dt-bindings/power/r8a7792-sysc.h
deleted file mode 100644
index dd3a4667ca19..000000000000
--- a/include/dt-bindings/power/r8a7792-sysc.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2016 Cogent Embedded Inc.
- */
-#ifndef __DT_BINDINGS_POWER_R8A7792_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A7792_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A7792_PD_CA15_CPU0		0
-#define R8A7792_PD_CA15_CPU1		1
-#define R8A7792_PD_CA15_SCU		12
-#define R8A7792_PD_SGX			20
-#define R8A7792_PD_IMP			24
-
-/* Always-on power area */
-#define R8A7792_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A7792_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a7793-sysc.h b/include/dt-bindings/power/r8a7793-sysc.h
deleted file mode 100644
index 056998c635a9..000000000000
--- a/include/dt-bindings/power/r8a7793-sysc.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2016 Glider bvba
- */
-#ifndef __DT_BINDINGS_POWER_R8A7793_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A7793_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- *
- * Note that R-Car M2-N is identical to R-Car M2-W w.r.t. power domains.
- */
-
-#define R8A7793_PD_CA15_CPU0		 0
-#define R8A7793_PD_CA15_CPU1		 1
-#define R8A7793_PD_CA15_SCU		12
-#define R8A7793_PD_SH_4A		16
-#define R8A7793_PD_SGX			20
-
-/* Always-on power area */
-#define R8A7793_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A7793_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a7794-sysc.h b/include/dt-bindings/power/r8a7794-sysc.h
deleted file mode 100644
index 4d6c708e6f32..000000000000
--- a/include/dt-bindings/power/r8a7794-sysc.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2016 Glider bvba
- */
-#ifndef __DT_BINDINGS_POWER_R8A7794_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A7794_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A7794_PD_CA7_CPU0		 5
-#define R8A7794_PD_CA7_CPU1		 6
-#define R8A7794_PD_SH_4A		16
-#define R8A7794_PD_SGX			20
-#define R8A7794_PD_CA7_SCU		21
-
-/* Always-on power area */
-#define R8A7794_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A7794_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a7795-sysc.h b/include/dt-bindings/power/r8a7795-sysc.h
deleted file mode 100644
index ff5323858572..000000000000
--- a/include/dt-bindings/power/r8a7795-sysc.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2016 Glider bvba
- */
-#ifndef __DT_BINDINGS_POWER_R8A7795_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A7795_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A7795_PD_CA57_CPU0		 0
-#define R8A7795_PD_CA57_CPU1		 1
-#define R8A7795_PD_CA57_CPU2		 2
-#define R8A7795_PD_CA57_CPU3		 3
-#define R8A7795_PD_CA53_CPU0		 5
-#define R8A7795_PD_CA53_CPU1		 6
-#define R8A7795_PD_CA53_CPU2		 7
-#define R8A7795_PD_CA53_CPU3		 8
-#define R8A7795_PD_A3VP			 9
-#define R8A7795_PD_CA57_SCU		12
-#define R8A7795_PD_CR7			13
-#define R8A7795_PD_A3VC			14
-#define R8A7795_PD_3DG_A		17
-#define R8A7795_PD_3DG_B		18
-#define R8A7795_PD_3DG_C		19
-#define R8A7795_PD_3DG_D		20
-#define R8A7795_PD_CA53_SCU		21
-#define R8A7795_PD_3DG_E		22
-#define R8A7795_PD_A3IR			24
-#define R8A7795_PD_A2VC1		26
-
-/* Always-on power area */
-#define R8A7795_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A7795_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a7796-sysc.h b/include/dt-bindings/power/r8a7796-sysc.h
deleted file mode 100644
index 7e6fc06ebff2..000000000000
--- a/include/dt-bindings/power/r8a7796-sysc.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2016 Glider bvba
- */
-#ifndef __DT_BINDINGS_POWER_R8A7796_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A7796_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A7796_PD_CA57_CPU0		 0
-#define R8A7796_PD_CA57_CPU1		 1
-#define R8A7796_PD_CA53_CPU0		 5
-#define R8A7796_PD_CA53_CPU1		 6
-#define R8A7796_PD_CA53_CPU2		 7
-#define R8A7796_PD_CA53_CPU3		 8
-#define R8A7796_PD_CA57_SCU		12
-#define R8A7796_PD_CR7			13
-#define R8A7796_PD_A3VC			14
-#define R8A7796_PD_3DG_A		17
-#define R8A7796_PD_3DG_B		18
-#define R8A7796_PD_CA53_SCU		21
-#define R8A7796_PD_A3IR			24
-#define R8A7796_PD_A2VC0		25
-#define R8A7796_PD_A2VC1		26
-
-/* Always-on power area */
-#define R8A7796_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A7796_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a77961-sysc.h b/include/dt-bindings/power/r8a77961-sysc.h
deleted file mode 100644
index 7a3800996f7c..000000000000
--- a/include/dt-bindings/power/r8a77961-sysc.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2019 Glider bvba
- */
-#ifndef __DT_BINDINGS_POWER_R8A77961_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A77961_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A77961_PD_CA57_CPU0		 0
-#define R8A77961_PD_CA57_CPU1		 1
-#define R8A77961_PD_CA53_CPU0		 5
-#define R8A77961_PD_CA53_CPU1		 6
-#define R8A77961_PD_CA53_CPU2		 7
-#define R8A77961_PD_CA53_CPU3		 8
-#define R8A77961_PD_CA57_SCU		12
-#define R8A77961_PD_CR7			13
-#define R8A77961_PD_A3VC		14
-#define R8A77961_PD_3DG_A		17
-#define R8A77961_PD_3DG_B		18
-#define R8A77961_PD_CA53_SCU		21
-#define R8A77961_PD_A3IR		24
-#define R8A77961_PD_A2VC1		26
-
-/* Always-on power area */
-#define R8A77961_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A77961_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a77965-sysc.h b/include/dt-bindings/power/r8a77965-sysc.h
deleted file mode 100644
index de82d8a15ea1..000000000000
--- a/include/dt-bindings/power/r8a77965-sysc.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2018 Jacopo Mondi <jacopo+renesas@jmondi.org>
- * Copyright (C) 2016 Glider bvba
- */
-
-#ifndef __DT_BINDINGS_POWER_R8A77965_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A77965_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A77965_PD_CA57_CPU0		 0
-#define R8A77965_PD_CA57_CPU1		 1
-#define R8A77965_PD_A3VP		 9
-#define R8A77965_PD_CA57_SCU		12
-#define R8A77965_PD_CR7			13
-#define R8A77965_PD_A3VC		14
-#define R8A77965_PD_3DG_A		17
-#define R8A77965_PD_3DG_B		18
-#define R8A77965_PD_A2VC1		26
-
-/* Always-on power area */
-#define R8A77965_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A77965_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a77970-sysc.h b/include/dt-bindings/power/r8a77970-sysc.h
deleted file mode 100644
index 9dcdbd5a9304..000000000000
--- a/include/dt-bindings/power/r8a77970-sysc.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2017 Cogent Embedded Inc.
- */
-#ifndef __DT_BINDINGS_POWER_R8A77970_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A77970_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A77970_PD_CA53_CPU0		 5
-#define R8A77970_PD_CA53_CPU1		 6
-#define R8A77970_PD_CA53_SCU		21
-#define R8A77970_PD_A2IR0		23
-#define R8A77970_PD_A3IR		24
-#define R8A77970_PD_A2IR1		27
-#define R8A77970_PD_A2DP		28
-#define R8A77970_PD_A2CN		29
-#define R8A77970_PD_A2SC0		30
-#define R8A77970_PD_A2SC1		31
-
-/* Always-on power area */
-#define R8A77970_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A77970_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a77980-sysc.h b/include/dt-bindings/power/r8a77980-sysc.h
deleted file mode 100644
index e12c8587b87e..000000000000
--- a/include/dt-bindings/power/r8a77980-sysc.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- * Copyright (C) 2018 Renesas Electronics Corp.
- * Copyright (C) 2018 Cogent Embedded, Inc.
- */
-#ifndef __DT_BINDINGS_POWER_R8A77980_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A77980_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A77980_PD_A2SC2		0
-#define R8A77980_PD_A2SC3		1
-#define R8A77980_PD_A2SC4		2
-#define R8A77980_PD_A2DP0		3
-#define R8A77980_PD_A2DP1		4
-#define R8A77980_PD_CA53_CPU0		5
-#define R8A77980_PD_CA53_CPU1		6
-#define R8A77980_PD_CA53_CPU2		7
-#define R8A77980_PD_CA53_CPU3		8
-#define R8A77980_PD_A2CN		10
-#define R8A77980_PD_A3VIP0		11
-#define R8A77980_PD_A2IR5		12
-#define R8A77980_PD_CR7			13
-#define R8A77980_PD_A2IR4		15
-#define R8A77980_PD_CA53_SCU		21
-#define R8A77980_PD_A2IR0		23
-#define R8A77980_PD_A3IR		24
-#define R8A77980_PD_A3VIP1		25
-#define R8A77980_PD_A3VIP2		26
-#define R8A77980_PD_A2IR1		27
-#define R8A77980_PD_A2IR2		28
-#define R8A77980_PD_A2IR3		29
-#define R8A77980_PD_A2SC0		30
-#define R8A77980_PD_A2SC1		31
-
-/* Always-on power area */
-#define R8A77980_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A77980_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a77990-sysc.h b/include/dt-bindings/power/r8a77990-sysc.h
deleted file mode 100644
index 944d85beec15..000000000000
--- a/include/dt-bindings/power/r8a77990-sysc.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2018 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_POWER_R8A77990_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A77990_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A77990_PD_CA53_CPU0		5
-#define R8A77990_PD_CA53_CPU1		6
-#define R8A77990_PD_CR7			13
-#define R8A77990_PD_A3VC		14
-#define R8A77990_PD_3DG_A		17
-#define R8A77990_PD_3DG_B		18
-#define R8A77990_PD_CA53_SCU		21
-#define R8A77990_PD_A2VC1		26
-
-/* Always-on power area */
-#define R8A77990_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A77990_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a77995-sysc.h b/include/dt-bindings/power/r8a77995-sysc.h
deleted file mode 100644
index f2b35502f2be..000000000000
--- a/include/dt-bindings/power/r8a77995-sysc.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2017 Glider bvba
- */
-#ifndef __DT_BINDINGS_POWER_R8A77995_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A77995_SYSC_H__
-
-/*
- * These power domain indices match the numbers of the interrupt bits
- * representing the power areas in the various Interrupt Registers
- * (e.g. SYSCISR, Interrupt Status Register)
- */
-
-#define R8A77995_PD_CA53_CPU0		 5
-#define R8A77995_PD_CA53_SCU		21
-
-/* Always-on power area */
-#define R8A77995_PD_ALWAYS_ON		32
-
-#endif /* __DT_BINDINGS_POWER_R8A77995_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a779a0-sysc.h b/include/dt-bindings/power/r8a779a0-sysc.h
deleted file mode 100644
index 57929e459a67..000000000000
--- a/include/dt-bindings/power/r8a779a0-sysc.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2020 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_POWER_R8A779A0_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A779A0_SYSC_H__
-
-/*
- * These power domain indices match the Power Domain Register Numbers (PDR)
- */
-
-#define R8A779A0_PD_A1E0D0C0		0
-#define R8A779A0_PD_A1E0D0C1		1
-#define R8A779A0_PD_A1E0D1C0		2
-#define R8A779A0_PD_A1E0D1C1		3
-#define R8A779A0_PD_A1E1D0C0		4
-#define R8A779A0_PD_A1E1D0C1		5
-#define R8A779A0_PD_A1E1D1C0		6
-#define R8A779A0_PD_A1E1D1C1		7
-#define R8A779A0_PD_A2E0D0		16
-#define R8A779A0_PD_A2E0D1		17
-#define R8A779A0_PD_A2E1D0		18
-#define R8A779A0_PD_A2E1D1		19
-#define R8A779A0_PD_A3E0		20
-#define R8A779A0_PD_A3E1		21
-#define R8A779A0_PD_3DG_A		24
-#define R8A779A0_PD_3DG_B		25
-#define R8A779A0_PD_A1CNN2		32
-#define R8A779A0_PD_A1DSP0		33
-#define R8A779A0_PD_A2IMP01		34
-#define R8A779A0_PD_A2DP0		35
-#define R8A779A0_PD_A2CV0		36
-#define R8A779A0_PD_A2CV1		37
-#define R8A779A0_PD_A2CV4		38
-#define R8A779A0_PD_A2CV6		39
-#define R8A779A0_PD_A2CN2		40
-#define R8A779A0_PD_A1CNN0		41
-#define R8A779A0_PD_A2CN0		42
-#define R8A779A0_PD_A3IR		43
-#define R8A779A0_PD_A1CNN1		44
-#define R8A779A0_PD_A1DSP1		45
-#define R8A779A0_PD_A2IMP23		46
-#define R8A779A0_PD_A2DP1		47
-#define R8A779A0_PD_A2CV2		48
-#define R8A779A0_PD_A2CV3		49
-#define R8A779A0_PD_A2CV5		50
-#define R8A779A0_PD_A2CV7		51
-#define R8A779A0_PD_A2CN1		52
-#define R8A779A0_PD_A3VIP0		56
-#define R8A779A0_PD_A3VIP1		57
-#define R8A779A0_PD_A3VIP2		58
-#define R8A779A0_PD_A3VIP3		59
-#define R8A779A0_PD_A3ISP01		60
-#define R8A779A0_PD_A3ISP23		61
-
-/* Always-on power area */
-#define R8A779A0_PD_ALWAYS_ON		64
-
-#endif /* __DT_BINDINGS_POWER_R8A779A0_SYSC_H__ */
diff --git a/include/dt-bindings/power/r8a779f0-sysc.h b/include/dt-bindings/power/r8a779f0-sysc.h
deleted file mode 100644
index cde1536e9ed0..000000000000
--- a/include/dt-bindings/power/r8a779f0-sysc.h
+++ /dev/null
@@ -1,30 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
-/*
- * Copyright (C) 2021 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_POWER_R8A779F0_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A779F0_SYSC_H__
-
-/*
- * These power domain indices match the Power Domain Register Numbers (PDR)
- */
-
-#define R8A779F0_PD_A1E0D0C0		0
-#define R8A779F0_PD_A1E0D0C1		1
-#define R8A779F0_PD_A1E0D1C0		2
-#define R8A779F0_PD_A1E0D1C1		3
-#define R8A779F0_PD_A1E1D0C0		4
-#define R8A779F0_PD_A1E1D0C1		5
-#define R8A779F0_PD_A1E1D1C0		6
-#define R8A779F0_PD_A1E1D1C1		7
-#define R8A779F0_PD_A2E0D0		16
-#define R8A779F0_PD_A2E0D1		17
-#define R8A779F0_PD_A2E1D0		18
-#define R8A779F0_PD_A2E1D1		19
-#define R8A779F0_PD_A3E0		20
-#define R8A779F0_PD_A3E1		21
-
-/* Always-on power area */
-#define R8A779F0_PD_ALWAYS_ON		64
-
-#endif /* __DT_BINDINGS_POWER_R8A779A0_SYSC_H__*/
diff --git a/include/dt-bindings/power/r8a779g0-sysc.h b/include/dt-bindings/power/r8a779g0-sysc.h
deleted file mode 100644
index c7b139fb075f..000000000000
--- a/include/dt-bindings/power/r8a779g0-sysc.h
+++ /dev/null
@@ -1,46 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
-/*
- * Copyright (C) 2022 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_POWER_R8A779G0_SYSC_H__
-#define __DT_BINDINGS_POWER_R8A779G0_SYSC_H__
-
-/*
- * These power domain indices match the Power Domain Register Numbers (PDR)
- */
-
-#define R8A779G0_PD_A1E0D0C0		0
-#define R8A779G0_PD_A1E0D0C1		1
-#define R8A779G0_PD_A1E0D1C0		2
-#define R8A779G0_PD_A1E0D1C1		3
-#define R8A779G0_PD_A2E0D0		16
-#define R8A779G0_PD_A2E0D1		17
-#define R8A779G0_PD_A3E0		20
-#define R8A779G0_PD_A33DGA		24
-#define R8A779G0_PD_A23DGB		25
-#define R8A779G0_PD_A1DSP0		33
-#define R8A779G0_PD_A2IMP01		34
-#define R8A779G0_PD_A2PSC		35
-#define R8A779G0_PD_A2CV0		36
-#define R8A779G0_PD_A2CV1		37
-#define R8A779G0_PD_A1CNN0		41
-#define R8A779G0_PD_A2CN0		42
-#define R8A779G0_PD_A3IR		43
-#define R8A779G0_PD_A1DSP1		45
-#define R8A779G0_PD_A2IMP23		46
-#define R8A779G0_PD_A2DMA		47
-#define R8A779G0_PD_A2CV2		48
-#define R8A779G0_PD_A2CV3		49
-#define R8A779G0_PD_A1DSP2		53
-#define R8A779G0_PD_A1DSP3		54
-#define R8A779G0_PD_A3VIP0		56
-#define R8A779G0_PD_A3VIP1		57
-#define R8A779G0_PD_A3VIP2		58
-#define R8A779G0_PD_A3ISP0		60
-#define R8A779G0_PD_A3ISP1		61
-#define R8A779G0_PD_A3DUL		62
-
-/* Always-on power area */
-#define R8A779G0_PD_ALWAYS_ON		64
-
-#endif /* __DT_BINDINGS_POWER_R8A779G0_SYSC_H__*/

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
