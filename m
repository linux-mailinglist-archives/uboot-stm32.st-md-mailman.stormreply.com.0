Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 898DF87078F
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Mar 2024 17:51:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51119C6DD69;
	Mon,  4 Mar 2024 16:51:31 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F8B5C6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 16:51:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-412e90ef887so3424705e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 08:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709571090; x=1710175890;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3x38FyIlnQn8kLwkXTXsLKvDYpxFNbraf5Lu6CNveUM=;
 b=dvSdX0/75KU4l9bg/HgIZsGpc994/7dAHPPpKfJftbkmFV15/quoUQXbFVkOPxPOV3
 mu7kGnMyvJUOUr9fzz9m8fMSgp5X6t5JBkFzFoldXRkaQOk9G891rIzXka+zQn+AhixL
 rr3wysC0m7CouVhVLkMgbQxCLE1yYmPqHuzNamr1vUCoTVpG9gv1l2CnWCNc//UT1ELO
 mWsqA0pscdBxFFUoLaq0oLryj56vF39VTc83aDd8e2TpuD0MmVo9x01mj2RV2xKcmiU/
 C2LYX0ycFqGvdfh+z+xZTk+NKwuYTTFqlSV4Mb8BcKDv/d7s5K8AUb+iYYphZhXPzR/s
 zLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571090; x=1710175890;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3x38FyIlnQn8kLwkXTXsLKvDYpxFNbraf5Lu6CNveUM=;
 b=Q7//i8BTQ6VhA4qITaCZS3am85cBo5iDAA5Bj47LbYfOqOjjwWGRYhwilkrSefYr2e
 cMj6eVGN9n74N291vkRNbEwI9BnObQLd1eeCMtvzXq18BdAD+TumaRsh4HgPFxYEw+ZO
 m0RdAHGblELX5kVsYrVaCx3+qQ1ZFk1LeqrOO3dJ6j5dr/jzXuxgeptJ7nVAMMv7tRsK
 IFYjvZa9EDYWzxIjqp6iD2od9NHRO0lYJM4ez2QpO/h9vXnhnEUj64j6ERxLehvKAmHO
 yODyYh3lSEJJklTmHF1rQsSr+VxB9UH14aCc1LGsDNz+ej28MmYweFLDRUvhGr1wyjrH
 901Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIH+8LIFH8wGvPgEDj290QCYYUU7hfg26W6FUPnwVEg9HzK8w5jTMd+GpAPh1vnvrrXewlu9tPBM6tTXeISbmC/EXReyKM0N0xTGz1RE/OWL8v+oP3c0nt
X-Gm-Message-State: AOJu0YxSPzY4+9Mq1A3frpLqyDUfYXF7fRayXNMPFz3vCwoOpIaVn6ei
 9K+lerIi9LBqFbs3eSYSVihtlFTLvZCCjtIZC8w3WwsrIF0ouSuV4QEC3RmbfNs=
X-Google-Smtp-Source: AGHT+IEn3rjcU9beTKGeTOww2Y5rzFKqrhxsMrNfGB3R9VSog1S5Ip+fDt47eFEJFlzb9+QBjLVQEg==
X-Received: by 2002:a05:600c:1da6:b0:412:e95f:51bb with SMTP id
 p38-20020a05600c1da600b00412e95f51bbmr485837wms.32.1709571089323; 
 Mon, 04 Mar 2024 08:51:29 -0800 (PST)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm10598517wmq.6.2024.03.04.08.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:51:28 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Mon, 04 Mar 2024 16:51:12 +0000
MIME-Version: 1.0
Message-Id: <20240304-b4-upstream-dt-headers-v1-4-b7ff41925f92@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=60107;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=bizfKN3Y5eCOUWeElRKqffMXK0rqfJbBO79LfenU0js=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtSnf9gyvQS4vRc/y8hM9OVeVX724ne3iGsScV9vWvddv
 MzA8eVQRykLgyAHg6yYIov4iWWWTWsv22tsX3ABZg4rE8gQBi5OAZjIQ2aGP7y5SRrvBN7w7DZc
 dryPR+SKmt2zXYtfLDa9+urP2gDtC+yMDDuZ8jbpNL34cHtd5m7Hv+WNq2O+CdddPm+bEln374j
 Vcx0A
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH RFC 04/26] sunxi: drop remaining dt-binding
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
 include/dt-bindings/dma/sun4i-a10.h           |  56 -----------
 include/dt-bindings/pinctrl/sun4i-a10.h       |  62 ------------
 include/dt-bindings/reset/sun20i-d1-ccu.h     |  79 ----------------
 include/dt-bindings/reset/sun20i-d1-r-ccu.h   |  16 ----
 include/dt-bindings/reset/sun4i-a10-ccu.h     |  69 --------------
 include/dt-bindings/reset/sun50i-a64-ccu.h    |  98 -------------------
 include/dt-bindings/reset/sun50i-h6-ccu.h     |  73 ---------------
 include/dt-bindings/reset/sun50i-h6-r-ccu.h   |  18 ----
 include/dt-bindings/reset/sun50i-h616-ccu.h   |  70 --------------
 include/dt-bindings/reset/sun5i-ccu.h         |  23 -----
 include/dt-bindings/reset/sun6i-a31-ccu.h     | 106 ---------------------
 include/dt-bindings/reset/sun8i-a23-a33-ccu.h |  87 -----------------
 include/dt-bindings/reset/sun8i-a83t-ccu.h    |  98 -------------------
 include/dt-bindings/reset/sun8i-de2.h         |  15 ---
 include/dt-bindings/reset/sun8i-h3-ccu.h      | 106 ---------------------
 include/dt-bindings/reset/sun8i-r-ccu.h       |  53 -----------
 include/dt-bindings/reset/sun8i-r40-ccu.h     | 130 --------------------------
 include/dt-bindings/reset/sun8i-v3s-ccu.h     |  81 ----------------
 include/dt-bindings/reset/sun9i-a80-ccu.h     | 102 --------------------
 include/dt-bindings/reset/sun9i-a80-de.h      |  58 ------------
 include/dt-bindings/reset/sun9i-a80-usb.h     |  56 -----------
 include/dt-bindings/reset/suniv-ccu-f1c100s.h |  38 --------
 22 files changed, 1494 deletions(-)

diff --git a/include/dt-bindings/dma/sun4i-a10.h b/include/dt-bindings/dma/sun4i-a10.h
deleted file mode 100644
index 8caba9ef7e9d..000000000000
--- a/include/dt-bindings/dma/sun4i-a10.h
+++ /dev/null
@@ -1,56 +0,0 @@
-/*
- * Copyright 2014 Maxime Ripard
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
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
-#ifndef __DT_BINDINGS_DMA_SUN4I_A10_H_
-#define __DT_BINDINGS_DMA_SUN4I_A10_H_
-
-#define SUN4I_DMA_NORMAL	0
-#define SUN4I_DMA_DEDICATED	1
-
-#endif /* __DT_BINDINGS_DMA_SUN4I_A10_H_ */
diff --git a/include/dt-bindings/pinctrl/sun4i-a10.h b/include/dt-bindings/pinctrl/sun4i-a10.h
deleted file mode 100644
index f7553c143b40..000000000000
--- a/include/dt-bindings/pinctrl/sun4i-a10.h
+++ /dev/null
@@ -1,62 +0,0 @@
-/*
- * Copyright 2014 Maxime Ripard
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
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
-#ifndef __DT_BINDINGS_PINCTRL_SUN4I_A10_H_
-#define __DT_BINDINGS_PINCTRL_SUN4I_A10_H_
-
-#define SUN4I_PINCTRL_10_MA	0
-#define SUN4I_PINCTRL_20_MA	1
-#define SUN4I_PINCTRL_30_MA	2
-#define SUN4I_PINCTRL_40_MA	3
-
-#define SUN4I_PINCTRL_NO_PULL	0
-#define SUN4I_PINCTRL_PULL_UP	1
-#define SUN4I_PINCTRL_PULL_DOWN	2
-
-#endif /* __DT_BINDINGS_PINCTRL_SUN4I_A10_H_ */
diff --git a/include/dt-bindings/reset/sun20i-d1-ccu.h b/include/dt-bindings/reset/sun20i-d1-ccu.h
deleted file mode 100644
index 79e52aca5912..000000000000
--- a/include/dt-bindings/reset/sun20i-d1-ccu.h
+++ /dev/null
@@ -1,79 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (c) 2020 huangzhenwei@allwinnertech.com
- * Copyright (C) 2021 Samuel Holland <samuel@sholland.org>
- */
-
-#ifndef _DT_BINDINGS_RST_SUN20I_D1_CCU_H_
-#define _DT_BINDINGS_RST_SUN20I_D1_CCU_H_
-
-#define RST_MBUS		0
-#define RST_BUS_DE		1
-#define RST_BUS_DI		2
-#define RST_BUS_G2D		3
-#define RST_BUS_CE		4
-#define RST_BUS_VE		5
-#define RST_BUS_DMA		6
-#define RST_BUS_MSGBOX0		7
-#define RST_BUS_MSGBOX1		8
-#define RST_BUS_MSGBOX2		9
-#define RST_BUS_SPINLOCK	10
-#define RST_BUS_HSTIMER		11
-#define RST_BUS_DBG		12
-#define RST_BUS_PWM		13
-#define RST_BUS_DRAM		14
-#define RST_BUS_MMC0		15
-#define RST_BUS_MMC1		16
-#define RST_BUS_MMC2		17
-#define RST_BUS_UART0		18
-#define RST_BUS_UART1		19
-#define RST_BUS_UART2		20
-#define RST_BUS_UART3		21
-#define RST_BUS_UART4		22
-#define RST_BUS_UART5		23
-#define RST_BUS_I2C0		24
-#define RST_BUS_I2C1		25
-#define RST_BUS_I2C2		26
-#define RST_BUS_I2C3		27
-#define RST_BUS_SPI0		28
-#define RST_BUS_SPI1		29
-#define RST_BUS_EMAC		30
-#define RST_BUS_IR_TX		31
-#define RST_BUS_GPADC		32
-#define RST_BUS_THS		33
-#define RST_BUS_I2S0		34
-#define RST_BUS_I2S1		35
-#define RST_BUS_I2S2		36
-#define RST_BUS_SPDIF		37
-#define RST_BUS_DMIC		38
-#define RST_BUS_AUDIO		39
-#define RST_USB_PHY0		40
-#define RST_USB_PHY1		41
-#define RST_BUS_OHCI0		42
-#define RST_BUS_OHCI1		43
-#define RST_BUS_EHCI0		44
-#define RST_BUS_EHCI1		45
-#define RST_BUS_OTG		46
-#define RST_BUS_LRADC		47
-#define RST_BUS_DPSS_TOP	48
-#define RST_BUS_HDMI_SUB	49
-#define RST_BUS_HDMI_MAIN	50
-#define RST_BUS_MIPI_DSI	51
-#define RST_BUS_TCON_LCD0	52
-#define RST_BUS_TCON_TV		53
-#define RST_BUS_LVDS0		54
-#define RST_BUS_TVE		55
-#define RST_BUS_TVE_TOP		56
-#define RST_BUS_TVD		57
-#define RST_BUS_TVD_TOP		58
-#define RST_BUS_LEDC		59
-#define RST_BUS_CSI		60
-#define RST_BUS_TPADC		61
-#define RST_DSP			62
-#define RST_BUS_DSP_CFG		63
-#define RST_BUS_DSP_DBG		64
-#define RST_BUS_RISCV_CFG	65
-#define RST_BUS_CAN0		66
-#define RST_BUS_CAN1		67
-
-#endif /* _DT_BINDINGS_RST_SUN20I_D1_CCU_H_ */
diff --git a/include/dt-bindings/reset/sun20i-d1-r-ccu.h b/include/dt-bindings/reset/sun20i-d1-r-ccu.h
deleted file mode 100644
index e20babc990af..000000000000
--- a/include/dt-bindings/reset/sun20i-d1-r-ccu.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (C) 2021 Samuel Holland <samuel@sholland.org>
- */
-
-#ifndef _DT_BINDINGS_RST_SUN20I_D1_R_CCU_H_
-#define _DT_BINDINGS_RST_SUN20I_D1_R_CCU_H_
-
-#define RST_BUS_R_TIMER		0
-#define RST_BUS_R_TWD		1
-#define RST_BUS_R_PPU		2
-#define RST_BUS_R_IR_RX		3
-#define RST_BUS_R_RTC		4
-#define RST_BUS_R_CPUCFG	5
-
-#endif /* _DT_BINDINGS_RST_SUN20I_D1_R_CCU_H_ */
diff --git a/include/dt-bindings/reset/sun4i-a10-ccu.h b/include/dt-bindings/reset/sun4i-a10-ccu.h
deleted file mode 100644
index 5f4480bedc8a..000000000000
--- a/include/dt-bindings/reset/sun4i-a10-ccu.h
+++ /dev/null
@@ -1,69 +0,0 @@
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
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DT_BINDINGS_RST_SUN4I_A10_H
-#define _DT_BINDINGS_RST_SUN4I_A10_H
-
-#define	RST_USB_PHY0		1
-#define	RST_USB_PHY1		2
-#define	RST_USB_PHY2		3
-#define	RST_GPS			4
-#define	RST_DE_BE0		5
-#define	RST_DE_BE1		6
-#define	RST_DE_FE0		7
-#define	RST_DE_FE1		8
-#define	RST_DE_MP		9
-#define	RST_TVE0		10
-#define	RST_TCON0		11
-#define	RST_TVE1		12
-#define	RST_TCON1		13
-#define	RST_CSI0		14
-#define	RST_CSI1		15
-#define	RST_VE			16
-#define	RST_ACE			17
-#define	RST_LVDS		18
-#define	RST_GPU			19
-#define	RST_HDMI_H		20
-#define	RST_HDMI_SYS		21
-#define	RST_HDMI_AUDIO_DMA	22
-
-#endif /* DT_BINDINGS_RST_SUN4I_A10_H */
diff --git a/include/dt-bindings/reset/sun50i-a64-ccu.h b/include/dt-bindings/reset/sun50i-a64-ccu.h
deleted file mode 100644
index db60b29ddb11..000000000000
--- a/include/dt-bindings/reset/sun50i-a64-ccu.h
+++ /dev/null
@@ -1,98 +0,0 @@
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
-#ifndef _DT_BINDINGS_RST_SUN50I_A64_H_
-#define _DT_BINDINGS_RST_SUN50I_A64_H_
-
-#define RST_USB_PHY0		0
-#define RST_USB_PHY1		1
-#define RST_USB_HSIC		2
-#define RST_DRAM		3
-#define RST_MBUS		4
-#define RST_BUS_MIPI_DSI	5
-#define RST_BUS_CE		6
-#define RST_BUS_DMA		7
-#define RST_BUS_MMC0		8
-#define RST_BUS_MMC1		9
-#define RST_BUS_MMC2		10
-#define RST_BUS_NAND		11
-#define RST_BUS_DRAM		12
-#define RST_BUS_EMAC		13
-#define RST_BUS_TS		14
-#define RST_BUS_HSTIMER		15
-#define RST_BUS_SPI0		16
-#define RST_BUS_SPI1		17
-#define RST_BUS_OTG		18
-#define RST_BUS_EHCI0		19
-#define RST_BUS_EHCI1		20
-#define RST_BUS_OHCI0		21
-#define RST_BUS_OHCI1		22
-#define RST_BUS_VE		23
-#define RST_BUS_TCON0		24
-#define RST_BUS_TCON1		25
-#define RST_BUS_DEINTERLACE	26
-#define RST_BUS_CSI		27
-#define RST_BUS_HDMI0		28
-#define RST_BUS_HDMI1		29
-#define RST_BUS_DE		30
-#define RST_BUS_GPU		31
-#define RST_BUS_MSGBOX		32
-#define RST_BUS_SPINLOCK	33
-#define RST_BUS_DBG		34
-#define RST_BUS_LVDS		35
-#define RST_BUS_CODEC		36
-#define RST_BUS_SPDIF		37
-#define RST_BUS_THS		38
-#define RST_BUS_I2S0		39
-#define RST_BUS_I2S1		40
-#define RST_BUS_I2S2		41
-#define RST_BUS_I2C0		42
-#define RST_BUS_I2C1		43
-#define RST_BUS_I2C2		44
-#define RST_BUS_SCR		45
-#define RST_BUS_UART0		46
-#define RST_BUS_UART1		47
-#define RST_BUS_UART2		48
-#define RST_BUS_UART3		49
-#define RST_BUS_UART4		50
-
-#endif /* _DT_BINDINGS_RST_SUN50I_A64_H_ */
diff --git a/include/dt-bindings/reset/sun50i-h6-ccu.h b/include/dt-bindings/reset/sun50i-h6-ccu.h
deleted file mode 100644
index d038ddfa4818..000000000000
--- a/include/dt-bindings/reset/sun50i-h6-ccu.h
+++ /dev/null
@@ -1,73 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
- */
-
-#ifndef _DT_BINDINGS_RESET_SUN50I_H6_H_
-#define _DT_BINDINGS_RESET_SUN50I_H6_H_
-
-#define RST_MBUS		0
-#define RST_BUS_DE		1
-#define RST_BUS_DEINTERLACE	2
-#define RST_BUS_GPU		3
-#define RST_BUS_CE		4
-#define RST_BUS_VE		5
-#define RST_BUS_EMCE		6
-#define RST_BUS_VP9		7
-#define RST_BUS_DMA		8
-#define RST_BUS_MSGBOX		9
-#define RST_BUS_SPINLOCK	10
-#define RST_BUS_HSTIMER		11
-#define RST_BUS_DBG		12
-#define RST_BUS_PSI		13
-#define RST_BUS_PWM		14
-#define RST_BUS_IOMMU		15
-#define RST_BUS_DRAM		16
-#define RST_BUS_NAND		17
-#define RST_BUS_MMC0		18
-#define RST_BUS_MMC1		19
-#define RST_BUS_MMC2		20
-#define RST_BUS_UART0		21
-#define RST_BUS_UART1		22
-#define RST_BUS_UART2		23
-#define RST_BUS_UART3		24
-#define RST_BUS_I2C0		25
-#define RST_BUS_I2C1		26
-#define RST_BUS_I2C2		27
-#define RST_BUS_I2C3		28
-#define RST_BUS_SCR0		29
-#define RST_BUS_SCR1		30
-#define RST_BUS_SPI0		31
-#define RST_BUS_SPI1		32
-#define RST_BUS_EMAC		33
-#define RST_BUS_TS		34
-#define RST_BUS_IR_TX		35
-#define RST_BUS_THS		36
-#define RST_BUS_I2S0		37
-#define RST_BUS_I2S1		38
-#define RST_BUS_I2S2		39
-#define RST_BUS_I2S3		40
-#define RST_BUS_SPDIF		41
-#define RST_BUS_DMIC		42
-#define RST_BUS_AUDIO_HUB	43
-#define RST_USB_PHY0		44
-#define RST_USB_PHY1		45
-#define RST_USB_PHY3		46
-#define RST_USB_HSIC		47
-#define RST_BUS_OHCI0		48
-#define RST_BUS_OHCI3		49
-#define RST_BUS_EHCI0		50
-#define RST_BUS_XHCI		51
-#define RST_BUS_EHCI3		52
-#define RST_BUS_OTG		53
-#define RST_BUS_PCIE		54
-#define RST_PCIE_POWERUP	55
-#define RST_BUS_HDMI		56
-#define RST_BUS_HDMI_SUB	57
-#define RST_BUS_TCON_TOP	58
-#define RST_BUS_TCON_LCD0	59
-#define RST_BUS_TCON_TV0	60
-#define RST_BUS_CSI		61
-#define RST_BUS_HDCP		62
-
-#endif /* _DT_BINDINGS_RESET_SUN50I_H6_H_ */
diff --git a/include/dt-bindings/reset/sun50i-h6-r-ccu.h b/include/dt-bindings/reset/sun50i-h6-r-ccu.h
deleted file mode 100644
index d541ade884fc..000000000000
--- a/include/dt-bindings/reset/sun50i-h6-r-ccu.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.xyz>
- */
-
-#ifndef _DT_BINDINGS_RST_SUN50I_H6_R_CCU_H_
-#define _DT_BINDINGS_RST_SUN50I_H6_R_CCU_H_
-
-#define RST_R_APB1_TIMER	0
-#define RST_R_APB1_TWD		1
-#define RST_R_APB1_PWM		2
-#define RST_R_APB2_UART		3
-#define RST_R_APB2_I2C		4
-#define RST_R_APB1_IR		5
-#define RST_R_APB1_W1		6
-#define RST_R_APB2_RSB		7
-
-#endif /* _DT_BINDINGS_RST_SUN50I_H6_R_CCU_H_ */
diff --git a/include/dt-bindings/reset/sun50i-h616-ccu.h b/include/dt-bindings/reset/sun50i-h616-ccu.h
deleted file mode 100644
index 1bd8bb0a11be..000000000000
--- a/include/dt-bindings/reset/sun50i-h616-ccu.h
+++ /dev/null
@@ -1,70 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (C) 2020 Arm Ltd.
- */
-
-#ifndef _DT_BINDINGS_RESET_SUN50I_H616_H_
-#define _DT_BINDINGS_RESET_SUN50I_H616_H_
-
-#define RST_MBUS		0
-#define RST_BUS_DE		1
-#define RST_BUS_DEINTERLACE	2
-#define RST_BUS_GPU		3
-#define RST_BUS_CE		4
-#define RST_BUS_VE		5
-#define RST_BUS_DMA		6
-#define RST_BUS_HSTIMER		7
-#define RST_BUS_DBG		8
-#define RST_BUS_PSI		9
-#define RST_BUS_PWM		10
-#define RST_BUS_IOMMU		11
-#define RST_BUS_DRAM		12
-#define RST_BUS_NAND		13
-#define RST_BUS_MMC0		14
-#define RST_BUS_MMC1		15
-#define RST_BUS_MMC2		16
-#define RST_BUS_UART0		17
-#define RST_BUS_UART1		18
-#define RST_BUS_UART2		19
-#define RST_BUS_UART3		20
-#define RST_BUS_UART4		21
-#define RST_BUS_UART5		22
-#define RST_BUS_I2C0		23
-#define RST_BUS_I2C1		24
-#define RST_BUS_I2C2		25
-#define RST_BUS_I2C3		26
-#define RST_BUS_I2C4		27
-#define RST_BUS_SPI0		28
-#define RST_BUS_SPI1		29
-#define RST_BUS_EMAC0		30
-#define RST_BUS_EMAC1		31
-#define RST_BUS_TS		32
-#define RST_BUS_THS		33
-#define RST_BUS_SPDIF		34
-#define RST_BUS_DMIC		35
-#define RST_BUS_AUDIO_CODEC	36
-#define RST_BUS_AUDIO_HUB	37
-#define RST_USB_PHY0		38
-#define RST_USB_PHY1		39
-#define RST_USB_PHY2		40
-#define RST_USB_PHY3		41
-#define RST_BUS_OHCI0		42
-#define RST_BUS_OHCI1		43
-#define RST_BUS_OHCI2		44
-#define RST_BUS_OHCI3		45
-#define RST_BUS_EHCI0		46
-#define RST_BUS_EHCI1		47
-#define RST_BUS_EHCI2		48
-#define RST_BUS_EHCI3		49
-#define RST_BUS_OTG		50
-#define RST_BUS_HDMI		51
-#define RST_BUS_HDMI_SUB	52
-#define RST_BUS_TCON_TOP	53
-#define RST_BUS_TCON_TV0	54
-#define RST_BUS_TCON_TV1	55
-#define RST_BUS_TVE_TOP		56
-#define RST_BUS_TVE0		57
-#define RST_BUS_HDCP		58
-#define RST_BUS_KEYADC		59
-
-#endif /* _DT_BINDINGS_RESET_SUN50I_H616_H_ */
diff --git a/include/dt-bindings/reset/sun5i-ccu.h b/include/dt-bindings/reset/sun5i-ccu.h
deleted file mode 100644
index 40cc22ae7630..000000000000
--- a/include/dt-bindings/reset/sun5i-ccu.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright 2016 Maxime Ripard
- *
- * Maxime Ripard <maxime.ripard@free-electrons.com>
- */
-
-#ifndef _RST_SUN5I_H_
-#define _RST_SUN5I_H_
-
-#define RST_USB_PHY0	0
-#define RST_USB_PHY1	1
-#define RST_GPS		2
-#define RST_DE_BE	3
-#define RST_DE_FE	4
-#define RST_TVE		5
-#define RST_LCD		6
-#define RST_CSI		7
-#define RST_VE		8
-#define RST_GPU		9
-#define RST_IEP		10
-
-#endif /* _RST_SUN5I_H_ */
diff --git a/include/dt-bindings/reset/sun6i-a31-ccu.h b/include/dt-bindings/reset/sun6i-a31-ccu.h
deleted file mode 100644
index fbff365ed6e1..000000000000
--- a/include/dt-bindings/reset/sun6i-a31-ccu.h
+++ /dev/null
@@ -1,106 +0,0 @@
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
-#ifndef _DT_BINDINGS_RST_SUN6I_A31_H_
-#define _DT_BINDINGS_RST_SUN6I_A31_H_
-
-#define RST_USB_PHY0		0
-#define RST_USB_PHY1		1
-#define RST_USB_PHY2		2
-
-#define RST_AHB1_MIPI_DSI	3
-#define RST_AHB1_SS		4
-#define RST_AHB1_DMA		5
-#define RST_AHB1_MMC0		6
-#define RST_AHB1_MMC1		7
-#define RST_AHB1_MMC2		8
-#define RST_AHB1_MMC3		9
-#define RST_AHB1_NAND1		10
-#define RST_AHB1_NAND0		11
-#define RST_AHB1_SDRAM		12
-#define RST_AHB1_EMAC		13
-#define RST_AHB1_TS		14
-#define RST_AHB1_HSTIMER	15
-#define RST_AHB1_SPI0		16
-#define RST_AHB1_SPI1		17
-#define RST_AHB1_SPI2		18
-#define RST_AHB1_SPI3		19
-#define RST_AHB1_OTG		20
-#define RST_AHB1_EHCI0		21
-#define RST_AHB1_EHCI1		22
-#define RST_AHB1_OHCI0		23
-#define RST_AHB1_OHCI1		24
-#define RST_AHB1_OHCI2		25
-#define RST_AHB1_VE		26
-#define RST_AHB1_LCD0		27
-#define RST_AHB1_LCD1		28
-#define RST_AHB1_CSI		29
-#define RST_AHB1_HDMI		30
-#define RST_AHB1_BE0		31
-#define RST_AHB1_BE1		32
-#define RST_AHB1_FE0		33
-#define RST_AHB1_FE1		34
-#define RST_AHB1_MP		35
-#define RST_AHB1_GPU		36
-#define RST_AHB1_DEU0		37
-#define RST_AHB1_DEU1		38
-#define RST_AHB1_DRC0		39
-#define RST_AHB1_DRC1		40
-#define RST_AHB1_LVDS		41
-
-#define RST_APB1_CODEC		42
-#define RST_APB1_SPDIF		43
-#define RST_APB1_DIGITAL_MIC	44
-#define RST_APB1_DAUDIO0	45
-#define RST_APB1_DAUDIO1	46
-#define RST_APB2_I2C0		47
-#define RST_APB2_I2C1		48
-#define RST_APB2_I2C2		49
-#define RST_APB2_I2C3		50
-#define RST_APB2_UART0		51
-#define RST_APB2_UART1		52
-#define RST_APB2_UART2		53
-#define RST_APB2_UART3		54
-#define RST_APB2_UART4		55
-#define RST_APB2_UART5		56
-
-#endif /* _DT_BINDINGS_RST_SUN6I_A31_H_ */
diff --git a/include/dt-bindings/reset/sun8i-a23-a33-ccu.h b/include/dt-bindings/reset/sun8i-a23-a33-ccu.h
deleted file mode 100644
index 6121f2b0cd0a..000000000000
--- a/include/dt-bindings/reset/sun8i-a23-a33-ccu.h
+++ /dev/null
@@ -1,87 +0,0 @@
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
-#ifndef _DT_BINDINGS_RST_SUN8I_A23_A33_H_
-#define _DT_BINDINGS_RST_SUN8I_A23_A33_H_
-
-#define RST_USB_PHY0		0
-#define RST_USB_PHY1		1
-#define RST_USB_HSIC		2
-#define RST_MBUS		3
-#define RST_BUS_MIPI_DSI	4
-#define RST_BUS_SS		5
-#define RST_BUS_DMA		6
-#define RST_BUS_MMC0		7
-#define RST_BUS_MMC1		8
-#define RST_BUS_MMC2		9
-#define RST_BUS_NAND		10
-#define RST_BUS_DRAM		11
-#define RST_BUS_HSTIMER		12
-#define RST_BUS_SPI0		13
-#define RST_BUS_SPI1		14
-#define RST_BUS_OTG		15
-#define RST_BUS_EHCI		16
-#define RST_BUS_OHCI		17
-#define RST_BUS_VE		18
-#define RST_BUS_LCD		19
-#define RST_BUS_CSI		20
-#define RST_BUS_DE_BE		21
-#define RST_BUS_DE_FE		22
-#define RST_BUS_GPU		23
-#define RST_BUS_MSGBOX		24
-#define RST_BUS_SPINLOCK	25
-#define RST_BUS_DRC		26
-#define RST_BUS_SAT		27
-#define RST_BUS_LVDS		28
-#define RST_BUS_CODEC		29
-#define RST_BUS_I2S0		30
-#define RST_BUS_I2S1		31
-#define RST_BUS_I2C0		32
-#define RST_BUS_I2C1		33
-#define RST_BUS_I2C2		34
-#define RST_BUS_UART0		35
-#define RST_BUS_UART1		36
-#define RST_BUS_UART2		37
-#define RST_BUS_UART3		38
-#define RST_BUS_UART4		39
-
-#endif /* _DT_BINDINGS_RST_SUN8I_A23_A33_H_ */
diff --git a/include/dt-bindings/reset/sun8i-a83t-ccu.h b/include/dt-bindings/reset/sun8i-a83t-ccu.h
deleted file mode 100644
index 784f6e11664e..000000000000
--- a/include/dt-bindings/reset/sun8i-a83t-ccu.h
+++ /dev/null
@@ -1,98 +0,0 @@
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
-#ifndef _DT_BINDINGS_RESET_SUN8I_A83T_CCU_H_
-#define _DT_BINDINGS_RESET_SUN8I_A83T_CCU_H_
-
-#define RST_USB_PHY0		0
-#define RST_USB_PHY1		1
-#define RST_USB_HSIC		2
-
-#define RST_DRAM		3
-#define RST_MBUS		4
-
-#define RST_BUS_MIPI_DSI	5
-#define RST_BUS_SS		6
-#define RST_BUS_DMA		7
-#define RST_BUS_MMC0		8
-#define RST_BUS_MMC1		9
-#define RST_BUS_MMC2		10
-#define RST_BUS_NAND		11
-#define RST_BUS_DRAM		12
-#define RST_BUS_EMAC		13
-#define RST_BUS_HSTIMER		14
-#define RST_BUS_SPI0		15
-#define RST_BUS_SPI1		16
-#define RST_BUS_OTG		17
-#define RST_BUS_EHCI0		18
-#define RST_BUS_EHCI1		19
-#define RST_BUS_OHCI0		20
-
-#define RST_BUS_VE		21
-#define RST_BUS_TCON0		22
-#define RST_BUS_TCON1		23
-#define RST_BUS_CSI		24
-#define RST_BUS_HDMI0		25
-#define RST_BUS_HDMI1		26
-#define RST_BUS_DE		27
-#define RST_BUS_GPU		28
-#define RST_BUS_MSGBOX		29
-#define RST_BUS_SPINLOCK	30
-
-#define RST_BUS_LVDS		31
-
-#define RST_BUS_SPDIF		32
-#define RST_BUS_I2S0		33
-#define RST_BUS_I2S1		34
-#define RST_BUS_I2S2		35
-#define RST_BUS_TDM		36
-
-#define RST_BUS_I2C0		37
-#define RST_BUS_I2C1		38
-#define RST_BUS_I2C2		39
-#define RST_BUS_UART0		40
-#define RST_BUS_UART1		41
-#define RST_BUS_UART2		42
-#define RST_BUS_UART3		43
-#define RST_BUS_UART4		44
-
-#endif /* _DT_BINDINGS_RESET_SUN8I_A83T_CCU_H_ */
diff --git a/include/dt-bindings/reset/sun8i-de2.h b/include/dt-bindings/reset/sun8i-de2.h
deleted file mode 100644
index 1c36a6ac86d6..000000000000
--- a/include/dt-bindings/reset/sun8i-de2.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/*
- * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.io>
- *
- * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
- */
-
-#ifndef _DT_BINDINGS_RESET_SUN8I_DE2_H_
-#define _DT_BINDINGS_RESET_SUN8I_DE2_H_
-
-#define RST_MIXER0	0
-#define RST_MIXER1	1
-#define RST_WB		2
-#define RST_ROT		3
-
-#endif /* _DT_BINDINGS_RESET_SUN8I_DE2_H_ */
diff --git a/include/dt-bindings/reset/sun8i-h3-ccu.h b/include/dt-bindings/reset/sun8i-h3-ccu.h
deleted file mode 100644
index 484c2a22919d..000000000000
--- a/include/dt-bindings/reset/sun8i-h3-ccu.h
+++ /dev/null
@@ -1,106 +0,0 @@
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
-#ifndef _DT_BINDINGS_RST_SUN8I_H3_H_
-#define _DT_BINDINGS_RST_SUN8I_H3_H_
-
-#define RST_USB_PHY0		0
-#define RST_USB_PHY1		1
-#define RST_USB_PHY2		2
-#define RST_USB_PHY3		3
-
-#define RST_MBUS		4
-
-#define RST_BUS_CE		5
-#define RST_BUS_DMA		6
-#define RST_BUS_MMC0		7
-#define RST_BUS_MMC1		8
-#define RST_BUS_MMC2		9
-#define RST_BUS_NAND		10
-#define RST_BUS_DRAM		11
-#define RST_BUS_EMAC		12
-#define RST_BUS_TS		13
-#define RST_BUS_HSTIMER		14
-#define RST_BUS_SPI0		15
-#define RST_BUS_SPI1		16
-#define RST_BUS_OTG		17
-#define RST_BUS_EHCI0		18
-#define RST_BUS_EHCI1		19
-#define RST_BUS_EHCI2		20
-#define RST_BUS_EHCI3		21
-#define RST_BUS_OHCI0		22
-#define RST_BUS_OHCI1		23
-#define RST_BUS_OHCI2		24
-#define RST_BUS_OHCI3		25
-#define RST_BUS_VE		26
-#define RST_BUS_TCON0		27
-#define RST_BUS_TCON1		28
-#define RST_BUS_DEINTERLACE	29
-#define RST_BUS_CSI		30
-#define RST_BUS_TVE		31
-#define RST_BUS_HDMI0		32
-#define RST_BUS_HDMI1		33
-#define RST_BUS_DE		34
-#define RST_BUS_GPU		35
-#define RST_BUS_MSGBOX		36
-#define RST_BUS_SPINLOCK	37
-#define RST_BUS_DBG		38
-#define RST_BUS_EPHY		39
-#define RST_BUS_CODEC		40
-#define RST_BUS_SPDIF		41
-#define RST_BUS_THS		42
-#define RST_BUS_I2S0		43
-#define RST_BUS_I2S1		44
-#define RST_BUS_I2S2		45
-#define RST_BUS_I2C0		46
-#define RST_BUS_I2C1		47
-#define RST_BUS_I2C2		48
-#define RST_BUS_UART0		49
-#define RST_BUS_UART1		50
-#define RST_BUS_UART2		51
-#define RST_BUS_UART3		52
-#define RST_BUS_SCR0		53
-
-/* New resets imported in H5 */
-#define RST_BUS_SCR1		54
-
-#endif /* _DT_BINDINGS_RST_SUN8I_H3_H_ */
diff --git a/include/dt-bindings/reset/sun8i-r-ccu.h b/include/dt-bindings/reset/sun8i-r-ccu.h
deleted file mode 100644
index 4ba64f3d6fc9..000000000000
--- a/include/dt-bindings/reset/sun8i-r-ccu.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/*
- * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.xyz>
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
-#ifndef _DT_BINDINGS_RST_SUN8I_R_CCU_H_
-#define _DT_BINDINGS_RST_SUN8I_R_CCU_H_
-
-#define RST_APB0_IR		0
-#define RST_APB0_TIMER		1
-#define RST_APB0_RSB		2
-#define RST_APB0_UART		3
-/* 4 is reserved for RST_APB0_W1 on A31 */
-#define RST_APB0_I2C		5
-
-#endif /* _DT_BINDINGS_RST_SUN8I_R_CCU_H_ */
diff --git a/include/dt-bindings/reset/sun8i-r40-ccu.h b/include/dt-bindings/reset/sun8i-r40-ccu.h
deleted file mode 100644
index c5ebcf6672e4..000000000000
--- a/include/dt-bindings/reset/sun8i-r40-ccu.h
+++ /dev/null
@@ -1,130 +0,0 @@
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
-#ifndef _DT_BINDINGS_RST_SUN8I_R40_H_
-#define _DT_BINDINGS_RST_SUN8I_R40_H_
-
-#define RST_USB_PHY0		0
-#define RST_USB_PHY1		1
-#define RST_USB_PHY2		2
-
-#define RST_DRAM		3
-#define RST_MBUS		4
-
-#define RST_BUS_MIPI_DSI	5
-#define RST_BUS_CE		6
-#define RST_BUS_DMA		7
-#define RST_BUS_MMC0		8
-#define RST_BUS_MMC1		9
-#define RST_BUS_MMC2		10
-#define RST_BUS_MMC3		11
-#define RST_BUS_NAND		12
-#define RST_BUS_DRAM		13
-#define RST_BUS_EMAC		14
-#define RST_BUS_TS		15
-#define RST_BUS_HSTIMER		16
-#define RST_BUS_SPI0		17
-#define RST_BUS_SPI1		18
-#define RST_BUS_SPI2		19
-#define RST_BUS_SPI3		20
-#define RST_BUS_SATA		21
-#define RST_BUS_OTG		22
-#define RST_BUS_EHCI0		23
-#define RST_BUS_EHCI1		24
-#define RST_BUS_EHCI2		25
-#define RST_BUS_OHCI0		26
-#define RST_BUS_OHCI1		27
-#define RST_BUS_OHCI2		28
-#define RST_BUS_VE		29
-#define RST_BUS_MP		30
-#define RST_BUS_DEINTERLACE	31
-#define RST_BUS_CSI0		32
-#define RST_BUS_CSI1		33
-#define RST_BUS_HDMI0		34
-#define RST_BUS_HDMI1		35
-#define RST_BUS_DE		36
-#define RST_BUS_TVE0		37
-#define RST_BUS_TVE1		38
-#define RST_BUS_TVE_TOP		39
-#define RST_BUS_GMAC		40
-#define RST_BUS_GPU		41
-#define RST_BUS_TVD0		42
-#define RST_BUS_TVD1		43
-#define RST_BUS_TVD2		44
-#define RST_BUS_TVD3		45
-#define RST_BUS_TVD_TOP		46
-#define RST_BUS_TCON_LCD0	47
-#define RST_BUS_TCON_LCD1	48
-#define RST_BUS_TCON_TV0	49
-#define RST_BUS_TCON_TV1	50
-#define RST_BUS_TCON_TOP	51
-#define RST_BUS_DBG		52
-#define RST_BUS_LVDS		53
-#define RST_BUS_CODEC		54
-#define RST_BUS_SPDIF		55
-#define RST_BUS_AC97		56
-#define RST_BUS_IR0		57
-#define RST_BUS_IR1		58
-#define RST_BUS_THS		59
-#define RST_BUS_KEYPAD		60
-#define RST_BUS_I2S0		61
-#define RST_BUS_I2S1		62
-#define RST_BUS_I2S2		63
-#define RST_BUS_I2C0		64
-#define RST_BUS_I2C1		65
-#define RST_BUS_I2C2		66
-#define RST_BUS_I2C3		67
-#define RST_BUS_CAN		68
-#define RST_BUS_SCR		69
-#define RST_BUS_PS20		70
-#define RST_BUS_PS21		71
-#define RST_BUS_I2C4		72
-#define RST_BUS_UART0		73
-#define RST_BUS_UART1		74
-#define RST_BUS_UART2		75
-#define RST_BUS_UART3		76
-#define RST_BUS_UART4		77
-#define RST_BUS_UART5		78
-#define RST_BUS_UART6		79
-#define RST_BUS_UART7		80
-
-#endif /* _DT_BINDINGS_RST_SUN8I_R40_H_ */
diff --git a/include/dt-bindings/reset/sun8i-v3s-ccu.h b/include/dt-bindings/reset/sun8i-v3s-ccu.h
deleted file mode 100644
index b6790173afd6..000000000000
--- a/include/dt-bindings/reset/sun8i-v3s-ccu.h
+++ /dev/null
@@ -1,81 +0,0 @@
-/*
- * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.xyz>
- *
- * Based on sun8i-v3s-ccu.h, which is
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
-#ifndef _DT_BINDINGS_RST_SUN8I_V3S_H_
-#define _DT_BINDINGS_RST_SUN8I_V3S_H_
-
-#define RST_USB_PHY0		0
-
-#define RST_MBUS		1
-
-#define RST_BUS_CE		5
-#define RST_BUS_DMA		6
-#define RST_BUS_MMC0		7
-#define RST_BUS_MMC1		8
-#define RST_BUS_MMC2		9
-#define RST_BUS_DRAM		11
-#define RST_BUS_EMAC		12
-#define RST_BUS_HSTIMER		14
-#define RST_BUS_SPI0		15
-#define RST_BUS_OTG		17
-#define RST_BUS_EHCI0		18
-#define RST_BUS_OHCI0		22
-#define RST_BUS_VE		26
-#define RST_BUS_TCON0		27
-#define RST_BUS_CSI		30
-#define RST_BUS_DE		34
-#define RST_BUS_DBG		38
-#define RST_BUS_EPHY		39
-#define RST_BUS_CODEC		40
-#define RST_BUS_I2C0		46
-#define RST_BUS_I2C1		47
-#define RST_BUS_UART0		49
-#define RST_BUS_UART1		50
-#define RST_BUS_UART2		51
-
-/* Reset lines not available on V3s */
-#define RST_BUS_I2S0		52
-
-#endif /* _DT_BINDINGS_RST_SUN8I_H3_H_ */
diff --git a/include/dt-bindings/reset/sun9i-a80-ccu.h b/include/dt-bindings/reset/sun9i-a80-ccu.h
deleted file mode 100644
index 4b8df4b36788..000000000000
--- a/include/dt-bindings/reset/sun9i-a80-ccu.h
+++ /dev/null
@@ -1,102 +0,0 @@
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
-#ifndef _DT_BINDINGS_RESET_SUN9I_A80_CCU_H_
-#define _DT_BINDINGS_RESET_SUN9I_A80_CCU_H_
-
-#define RST_BUS_FD		0
-#define RST_BUS_VE		1
-#define RST_BUS_GPU_CTRL	2
-#define RST_BUS_SS		3
-#define RST_BUS_MMC		4
-#define RST_BUS_NAND0		5
-#define RST_BUS_NAND1		6
-#define RST_BUS_SDRAM		7
-#define RST_BUS_SATA		8
-#define RST_BUS_TS		9
-#define RST_BUS_SPI0		10
-#define RST_BUS_SPI1		11
-#define RST_BUS_SPI2		12
-#define RST_BUS_SPI3		13
-
-#define RST_BUS_OTG		14
-#define RST_BUS_OTG_PHY		15
-#define RST_BUS_MIPI_HSI	16
-#define RST_BUS_GMAC		17
-#define RST_BUS_MSGBOX		18
-#define RST_BUS_SPINLOCK	19
-#define RST_BUS_HSTIMER		20
-#define RST_BUS_DMA		21
-
-#define RST_BUS_LCD0		22
-#define RST_BUS_LCD1		23
-#define RST_BUS_EDP		24
-#define RST_BUS_LVDS		25
-#define RST_BUS_CSI		26
-#define RST_BUS_HDMI0		27
-#define RST_BUS_HDMI1		28
-#define RST_BUS_DE		29
-#define RST_BUS_MP		30
-#define RST_BUS_GPU		31
-#define RST_BUS_MIPI_DSI	32
-
-#define RST_BUS_SPDIF		33
-#define RST_BUS_AC97		34
-#define RST_BUS_I2S0		35
-#define RST_BUS_I2S1		36
-#define RST_BUS_LRADC		37
-#define RST_BUS_GPADC		38
-#define RST_BUS_CIR_TX		39
-
-#define RST_BUS_I2C0		40
-#define RST_BUS_I2C1		41
-#define RST_BUS_I2C2		42
-#define RST_BUS_I2C3		43
-#define RST_BUS_I2C4		44
-#define RST_BUS_UART0		45
-#define RST_BUS_UART1		46
-#define RST_BUS_UART2		47
-#define RST_BUS_UART3		48
-#define RST_BUS_UART4		49
-#define RST_BUS_UART5		50
-
-#endif /* _DT_BINDINGS_RESET_SUN9I_A80_CCU_H_ */
diff --git a/include/dt-bindings/reset/sun9i-a80-de.h b/include/dt-bindings/reset/sun9i-a80-de.h
deleted file mode 100644
index 205072770171..000000000000
--- a/include/dt-bindings/reset/sun9i-a80-de.h
+++ /dev/null
@@ -1,58 +0,0 @@
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
-#ifndef _DT_BINDINGS_RESET_SUN9I_A80_DE_H_
-#define _DT_BINDINGS_RESET_SUN9I_A80_DE_H_
-
-#define RST_FE0		0
-#define RST_FE1		1
-#define RST_FE2		2
-#define RST_DEU0	3
-#define RST_DEU1	4
-#define RST_BE0		5
-#define RST_BE1		6
-#define RST_BE2		7
-#define RST_DRC0	8
-#define RST_DRC1	9
-#define RST_MERGE	10
-
-#endif /* _DT_BINDINGS_RESET_SUN9I_A80_DE_H_ */
diff --git a/include/dt-bindings/reset/sun9i-a80-usb.h b/include/dt-bindings/reset/sun9i-a80-usb.h
deleted file mode 100644
index ee492864c2aa..000000000000
--- a/include/dt-bindings/reset/sun9i-a80-usb.h
+++ /dev/null
@@ -1,56 +0,0 @@
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
-#ifndef _DT_BINDINGS_RESET_SUN9I_A80_USB_H_
-#define _DT_BINDINGS_RESET_SUN9I_A80_USB_H_
-
-#define RST_USB0_HCI	0
-#define RST_USB1_HCI	1
-#define RST_USB2_HCI	2
-
-#define RST_USB0_PHY	3
-#define RST_USB1_HSIC	4
-#define RST_USB1_PHY	5
-#define RST_USB2_HSIC	6
-#define RST_USB2_PHY	7
-
-#endif /* _DT_BINDINGS_RESET_SUN9I_A80_USB_H_ */
diff --git a/include/dt-bindings/reset/suniv-ccu-f1c100s.h b/include/dt-bindings/reset/suniv-ccu-f1c100s.h
deleted file mode 100644
index 6a4b4385fe5a..000000000000
--- a/include/dt-bindings/reset/suniv-ccu-f1c100s.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT)
- *
- * Copyright (C) 2018 Icenowy Zheng <icenowy@aosc.xyz>
- *
- */
-
-#ifndef _DT_BINDINGS_RST_SUNIV_F1C100S_H_
-#define _DT_BINDINGS_RST_SUNIV_F1C100S_H_
-
-#define RST_USB_PHY0		0
-#define RST_BUS_DMA		1
-#define RST_BUS_MMC0		2
-#define RST_BUS_MMC1		3
-#define RST_BUS_DRAM		4
-#define RST_BUS_SPI0		5
-#define RST_BUS_SPI1		6
-#define RST_BUS_OTG		7
-#define RST_BUS_VE		8
-#define RST_BUS_LCD		9
-#define RST_BUS_DEINTERLACE	10
-#define RST_BUS_CSI		11
-#define RST_BUS_TVD		12
-#define RST_BUS_TVE		13
-#define RST_BUS_DE_BE		14
-#define RST_BUS_DE_FE		15
-#define RST_BUS_CODEC		16
-#define RST_BUS_SPDIF		17
-#define RST_BUS_IR		18
-#define RST_BUS_RSB		19
-#define RST_BUS_I2S0		20
-#define RST_BUS_I2C0		21
-#define RST_BUS_I2C1		22
-#define RST_BUS_I2C2		23
-#define RST_BUS_UART0		24
-#define RST_BUS_UART1		25
-#define RST_BUS_UART2		26
-
-#endif /* _DT_BINDINGS_RST_SUNIV_F1C100S_H_ */

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
