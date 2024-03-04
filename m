Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 500F187189D
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Mar 2024 09:51:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 070FBC6DD9C;
	Tue,  5 Mar 2024 08:51:47 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BAEBC6DD6E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 16:51:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-412e4426e32so7674185e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 08:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709571110; x=1710175910;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4+SBLdwGnKNSd9O3Ivc5UgBnVQJdSDgsDHEaYNyIaok=;
 b=tNEDOgjlB+FnPtohd8Zws3pk8+KBM2rl7Ivj1Kf+mole/se/OunrkDVhmahEX8Aaoe
 b/PvhQok7p3LZtFYdOl7CdmSj0cOMGBEyAnyBYwR5lsWp0fQzTQ+slPkU62lKx2twuKL
 9P9KT4TRUye1IMf6s/Y4tbN9MY2UOl0Rrkt95U4MCZJE3cKVy5PAyqZAUt6pzVOh6NHT
 Gp8iRiuhNax49DZABLw/DyNcU6mK7J2u54INZKx6hNJbniHoqTTE/g9aPsEqgSZlhQYk
 juKaeftmQVrVpXNBf9sgHWV5u56ueWQZQsE+3OsAzDs3o55WVRG0qaEPvn/Woz2QpVot
 X45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571110; x=1710175910;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+SBLdwGnKNSd9O3Ivc5UgBnVQJdSDgsDHEaYNyIaok=;
 b=gXuvEYl88oUKxkPu+URNeUEwI4dSgLgMLGkcZ7at+rHS0z0JnmlIWe0kqR3oO9MnIT
 /qEsSf44wNns/r1xeRYhXaOKJUwJNhrnVTT2p7e8qTRN7MrYOTxLLTNP7fVoUlzCnia7
 0a3DfYVDaEOy7Jrip5hVS/52Jnn4qXBpVPcuEpjtRheorRj3KpCkOPFabnSUlFQgb2Lk
 3L1uhXbhKDyGbEh4FRnFapIkPEdTLpdVTAYwYcznt/hPK1RNLVwRrq+h8BdFwxAfoMOq
 DtYiMQjvwaPB3ohLNrHLSK9F48ETDuTnQwQ9JuOIonC+wgUG1AnXuGx2ajdQl2/krGRX
 SaKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDjX+BfASV7gkZpHTXRKDJmteF3+UolzVuBCWyVuHkwipuaCFXJvvRfLRqFlD+dXGRIIEr8w8Z5wywpFK/ciPEW7YzGqtwqa88VcpRDgbe+AV/KZX/sfyg
X-Gm-Message-State: AOJu0Yx4bZfZRS0e1cqZc1Wo1Mnp3tm/53d1yahHp2Ua5wSOiJM9NVsk
 3iCSAYlhzMrQqRTzM3kTku0zmUkSG5y9WVRXjioahvXtF5T3/oqafhn9nSP/dmA=
X-Google-Smtp-Source: AGHT+IHJqsVlYznnpo1G8RlDB7T4nkOJ/Gtky4oFhrJ3+/ZYu5nUz2LQA6iF7lgDdohd3WLw2qWR9g==
X-Received: by 2002:a05:600c:19cb:b0:412:c78f:a8df with SMTP id
 u11-20020a05600c19cb00b00412c78fa8dfmr6811556wmq.22.1709571110342; 
 Mon, 04 Mar 2024 08:51:50 -0800 (PST)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm10598517wmq.6.2024.03.04.08.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:51:49 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Mon, 04 Mar 2024 16:51:25 +0000
MIME-Version: 1.0
Message-Id: <20240304-b4-upstream-dt-headers-v1-17-b7ff41925f92@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=80750;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=XMsYOzREDhuLslBqGaDkgTmXZhcByJ2OYm66wAu2ECo=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtSnfzi44yoLY8OeWC7O72k/bbttx5Y3nDuZk70OvL2vE
 t+S/469o5SFQZCDQVZMkUX8xDLLprWX7TW2L7gAM4eVCWQIAxenAEykToThr7g4u1dfS1ttTMi6
 FqfTm2/kWuxqS3j1I6TU9dTkve5/XzL8z3PWyipNvOF5pavd6/6U4ttybXGt85IfPVXYtf7drdd
 /HQE=
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Mailman-Approved-At: Tue, 05 Mar 2024 08:51:46 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH RFC 17/26] renesas: drop clock dt-binding
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
 include/dt-bindings/clock/r7s72100-clock.h    | 112 -------------
 include/dt-bindings/clock/r8a774a1-cpg-mssr.h |  59 -------
 include/dt-bindings/clock/r8a774b1-cpg-mssr.h |  57 -------
 include/dt-bindings/clock/r8a774c0-cpg-mssr.h |  61 -------
 include/dt-bindings/clock/r8a774e1-cpg-mssr.h |  59 -------
 include/dt-bindings/clock/r8a7790-clock.h     | 158 ------------------
 include/dt-bindings/clock/r8a7790-cpg-mssr.h  |  48 ------
 include/dt-bindings/clock/r8a7791-clock.h     | 161 -------------------
 include/dt-bindings/clock/r8a7791-cpg-mssr.h  |  44 ------
 include/dt-bindings/clock/r8a7792-clock.h     |  98 ------------
 include/dt-bindings/clock/r8a7792-cpg-mssr.h  |  39 -----
 include/dt-bindings/clock/r8a7793-clock.h     | 159 -------------------
 include/dt-bindings/clock/r8a7793-cpg-mssr.h  |  44 ------
 include/dt-bindings/clock/r8a7794-clock.h     | 137 ----------------
 include/dt-bindings/clock/r8a7794-cpg-mssr.h  |  43 -----
 include/dt-bindings/clock/r8a7795-cpg-mssr.h  |  66 --------
 include/dt-bindings/clock/r8a7796-cpg-mssr.h  |  65 --------
 include/dt-bindings/clock/r8a77961-cpg-mssr.h |  65 --------
 include/dt-bindings/clock/r8a77965-cpg-mssr.h |  62 --------
 include/dt-bindings/clock/r8a77970-cpg-mssr.h |  44 ------
 include/dt-bindings/clock/r8a77980-cpg-mssr.h |  51 ------
 include/dt-bindings/clock/r8a77990-cpg-mssr.h |  62 --------
 include/dt-bindings/clock/r8a77995-cpg-mssr.h |  54 -------
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h |  55 -------
 include/dt-bindings/clock/r8a779f0-cpg-mssr.h |  64 --------
 include/dt-bindings/clock/r8a779g0-cpg-mssr.h |  90 -----------
 include/dt-bindings/clock/r9a06g032-sysctrl.h | 149 -----------------
 include/dt-bindings/clock/r9a07g044-cpg.h     | 220 --------------------------
 include/dt-bindings/clock/renesas-cpg-mssr.h  |  15 --
 29 files changed, 2341 deletions(-)

diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
deleted file mode 100644
index a267ac250143..000000000000
--- a/include/dt-bindings/clock/r7s72100-clock.h
+++ /dev/null
@@ -1,112 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- * Copyright (C) 2014 Renesas Solutions Corp.
- * Copyright (C) 2014 Wolfram Sang, Sang Engineering <wsa@sang-engineering.com>
- */
-
-#ifndef __DT_BINDINGS_CLOCK_R7S72100_H__
-#define __DT_BINDINGS_CLOCK_R7S72100_H__
-
-#define R7S72100_CLK_PLL	0
-#define R7S72100_CLK_I		1
-#define R7S72100_CLK_G		2
-
-/* MSTP2 */
-#define R7S72100_CLK_CORESIGHT	0
-
-/* MSTP3 */
-#define R7S72100_CLK_IEBUS	7
-#define R7S72100_CLK_IRDA	6
-#define R7S72100_CLK_LIN0	5
-#define R7S72100_CLK_LIN1	4
-#define R7S72100_CLK_MTU2	3
-#define R7S72100_CLK_CAN	2
-#define R7S72100_CLK_ADCPWR	1
-#define R7S72100_CLK_PWM	0
-
-/* MSTP4 */
-#define R7S72100_CLK_SCIF0	7
-#define R7S72100_CLK_SCIF1	6
-#define R7S72100_CLK_SCIF2	5
-#define R7S72100_CLK_SCIF3	4
-#define R7S72100_CLK_SCIF4	3
-#define R7S72100_CLK_SCIF5	2
-#define R7S72100_CLK_SCIF6	1
-#define R7S72100_CLK_SCIF7	0
-
-/* MSTP5 */
-#define R7S72100_CLK_SCI0	7
-#define R7S72100_CLK_SCI1	6
-#define R7S72100_CLK_SG0	5
-#define R7S72100_CLK_SG1	4
-#define R7S72100_CLK_SG2	3
-#define R7S72100_CLK_SG3	2
-#define R7S72100_CLK_OSTM0	1
-#define R7S72100_CLK_OSTM1	0
-
-/* MSTP6 */
-#define R7S72100_CLK_ADC	7
-#define R7S72100_CLK_CEU	6
-#define R7S72100_CLK_DOC0	5
-#define R7S72100_CLK_DOC1	4
-#define R7S72100_CLK_DRC0	3
-#define R7S72100_CLK_DRC1	2
-#define R7S72100_CLK_JCU	1
-#define R7S72100_CLK_RTC	0
-
-/* MSTP7 */
-#define R7S72100_CLK_VDEC0	7
-#define R7S72100_CLK_VDEC1	6
-#define R7S72100_CLK_ETHER	4
-#define R7S72100_CLK_NAND	3
-#define R7S72100_CLK_USB0	1
-#define R7S72100_CLK_USB1	0
-
-/* MSTP8 */
-#define R7S72100_CLK_IMR0	7
-#define R7S72100_CLK_IMR1	6
-#define R7S72100_CLK_IMRDISP	5
-#define R7S72100_CLK_MMCIF	4
-#define R7S72100_CLK_MLB	3
-#define R7S72100_CLK_ETHAVB	2
-#define R7S72100_CLK_SCUX	1
-
-/* MSTP9 */
-#define R7S72100_CLK_I2C0	7
-#define R7S72100_CLK_I2C1	6
-#define R7S72100_CLK_I2C2	5
-#define R7S72100_CLK_I2C3	4
-#define R7S72100_CLK_SPIBSC0	3
-#define R7S72100_CLK_SPIBSC1	2
-#define R7S72100_CLK_VDC50	1	/* and LVDS */
-#define R7S72100_CLK_VDC51	0
-
-/* MSTP10 */
-#define R7S72100_CLK_SPI0	7
-#define R7S72100_CLK_SPI1	6
-#define R7S72100_CLK_SPI2	5
-#define R7S72100_CLK_SPI3	4
-#define R7S72100_CLK_SPI4	3
-#define R7S72100_CLK_CDROM	2
-#define R7S72100_CLK_SPDIF	1
-#define R7S72100_CLK_RGPVG2	0
-
-/* MSTP11 */
-#define R7S72100_CLK_SSI0	5
-#define R7S72100_CLK_SSI1	4
-#define R7S72100_CLK_SSI2	3
-#define R7S72100_CLK_SSI3	2
-#define R7S72100_CLK_SSI4	1
-#define R7S72100_CLK_SSI5	0
-
-/* MSTP12 */
-#define R7S72100_CLK_SDHI00	3
-#define R7S72100_CLK_SDHI01	2
-#define R7S72100_CLK_SDHI10	1
-#define R7S72100_CLK_SDHI11	0
-
-/* MSTP13 */
-#define R7S72100_CLK_PIX1	2
-#define R7S72100_CLK_PIX0	1
-
-#endif /* __DT_BINDINGS_CLOCK_R7S72100_H__ */
diff --git a/include/dt-bindings/clock/r8a774a1-cpg-mssr.h b/include/dt-bindings/clock/r8a774a1-cpg-mssr.h
deleted file mode 100644
index e355363f40c2..000000000000
--- a/include/dt-bindings/clock/r8a774a1-cpg-mssr.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- * Copyright (C) 2018 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A774A1_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A774A1_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a774a1 CPG Core Clocks */
-#define R8A774A1_CLK_Z			0
-#define R8A774A1_CLK_Z2			1
-#define R8A774A1_CLK_ZG			2
-#define R8A774A1_CLK_ZTR		3
-#define R8A774A1_CLK_ZTRD2		4
-#define R8A774A1_CLK_ZT			5
-#define R8A774A1_CLK_ZX			6
-#define R8A774A1_CLK_S0D1		7
-#define R8A774A1_CLK_S0D2		8
-#define R8A774A1_CLK_S0D3		9
-#define R8A774A1_CLK_S0D4		10
-#define R8A774A1_CLK_S0D6		11
-#define R8A774A1_CLK_S0D8		12
-#define R8A774A1_CLK_S0D12		13
-#define R8A774A1_CLK_S1D2		14
-#define R8A774A1_CLK_S1D4		15
-#define R8A774A1_CLK_S2D1		16
-#define R8A774A1_CLK_S2D2		17
-#define R8A774A1_CLK_S2D4		18
-#define R8A774A1_CLK_S3D1		19
-#define R8A774A1_CLK_S3D2		20
-#define R8A774A1_CLK_S3D4		21
-#define R8A774A1_CLK_LB			22
-#define R8A774A1_CLK_CL			23
-#define R8A774A1_CLK_ZB3		24
-#define R8A774A1_CLK_ZB3D2		25
-#define R8A774A1_CLK_ZB3D4		26
-#define R8A774A1_CLK_CR			27
-#define R8A774A1_CLK_CRD2		28
-#define R8A774A1_CLK_SD0H		29
-#define R8A774A1_CLK_SD0		30
-#define R8A774A1_CLK_SD1H		31
-#define R8A774A1_CLK_SD1		32
-#define R8A774A1_CLK_SD2H		33
-#define R8A774A1_CLK_SD2		34
-#define R8A774A1_CLK_SD3H		35
-#define R8A774A1_CLK_SD3		36
-#define R8A774A1_CLK_RPC		37
-#define R8A774A1_CLK_RPCD2		38
-#define R8A774A1_CLK_MSO		39
-#define R8A774A1_CLK_HDMI		40
-#define R8A774A1_CLK_CSI0		41
-#define R8A774A1_CLK_CP			42
-#define R8A774A1_CLK_CPEX		43
-#define R8A774A1_CLK_R			44
-#define R8A774A1_CLK_OSC		45
-#define R8A774A1_CLK_CANFD		46
-
-#endif /* __DT_BINDINGS_CLOCK_R8A774A1_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a774b1-cpg-mssr.h b/include/dt-bindings/clock/r8a774b1-cpg-mssr.h
deleted file mode 100644
index 1355451b74b0..000000000000
--- a/include/dt-bindings/clock/r8a774b1-cpg-mssr.h
+++ /dev/null
@@ -1,57 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- * Copyright (C) 2019 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A774B1_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A774B1_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a774b1 CPG Core Clocks */
-#define R8A774B1_CLK_Z			0
-#define R8A774B1_CLK_ZG			1
-#define R8A774B1_CLK_ZTR		2
-#define R8A774B1_CLK_ZTRD2		3
-#define R8A774B1_CLK_ZT			4
-#define R8A774B1_CLK_ZX			5
-#define R8A774B1_CLK_S0D1		6
-#define R8A774B1_CLK_S0D2		7
-#define R8A774B1_CLK_S0D3		8
-#define R8A774B1_CLK_S0D4		9
-#define R8A774B1_CLK_S0D6		10
-#define R8A774B1_CLK_S0D8		11
-#define R8A774B1_CLK_S0D12		12
-#define R8A774B1_CLK_S1D2		13
-#define R8A774B1_CLK_S1D4		14
-#define R8A774B1_CLK_S2D1		15
-#define R8A774B1_CLK_S2D2		16
-#define R8A774B1_CLK_S2D4		17
-#define R8A774B1_CLK_S3D1		18
-#define R8A774B1_CLK_S3D2		19
-#define R8A774B1_CLK_S3D4		20
-#define R8A774B1_CLK_LB			21
-#define R8A774B1_CLK_CL			22
-#define R8A774B1_CLK_ZB3		23
-#define R8A774B1_CLK_ZB3D2		24
-#define R8A774B1_CLK_CR			25
-#define R8A774B1_CLK_DDR		26
-#define R8A774B1_CLK_SD0H		27
-#define R8A774B1_CLK_SD0		28
-#define R8A774B1_CLK_SD1H		29
-#define R8A774B1_CLK_SD1		30
-#define R8A774B1_CLK_SD2H		31
-#define R8A774B1_CLK_SD2		32
-#define R8A774B1_CLK_SD3H		33
-#define R8A774B1_CLK_SD3		34
-#define R8A774B1_CLK_RPC		35
-#define R8A774B1_CLK_RPCD2		36
-#define R8A774B1_CLK_MSO		37
-#define R8A774B1_CLK_HDMI		38
-#define R8A774B1_CLK_CSI0		39
-#define R8A774B1_CLK_CP			40
-#define R8A774B1_CLK_CPEX		41
-#define R8A774B1_CLK_R			42
-#define R8A774B1_CLK_OSC		43
-#define R8A774B1_CLK_CANFD		44
-
-#endif /* __DT_BINDINGS_CLOCK_R8A774B1_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a774c0-cpg-mssr.h b/include/dt-bindings/clock/r8a774c0-cpg-mssr.h
deleted file mode 100644
index 8ad9cd6be8e9..000000000000
--- a/include/dt-bindings/clock/r8a774c0-cpg-mssr.h
+++ /dev/null
@@ -1,61 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2018 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A774C0_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A774C0_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a774c0 CPG Core Clocks */
-#define R8A774C0_CLK_Z2			0
-#define R8A774C0_CLK_ZG			1
-#define R8A774C0_CLK_ZTR		2
-#define R8A774C0_CLK_ZT			3
-#define R8A774C0_CLK_ZX			4
-#define R8A774C0_CLK_S0D1		5
-#define R8A774C0_CLK_S0D3		6
-#define R8A774C0_CLK_S0D6		7
-#define R8A774C0_CLK_S0D12		8
-#define R8A774C0_CLK_S0D24		9
-#define R8A774C0_CLK_S1D1		10
-#define R8A774C0_CLK_S1D2		11
-#define R8A774C0_CLK_S1D4		12
-#define R8A774C0_CLK_S2D1		13
-#define R8A774C0_CLK_S2D2		14
-#define R8A774C0_CLK_S2D4		15
-#define R8A774C0_CLK_S3D1		16
-#define R8A774C0_CLK_S3D2		17
-#define R8A774C0_CLK_S3D4		18
-#define R8A774C0_CLK_S0D6C		19
-#define R8A774C0_CLK_S3D1C		20
-#define R8A774C0_CLK_S3D2C		21
-#define R8A774C0_CLK_S3D4C		22
-#define R8A774C0_CLK_LB			23
-#define R8A774C0_CLK_CL			24
-#define R8A774C0_CLK_ZB3		25
-#define R8A774C0_CLK_ZB3D2		26
-#define R8A774C0_CLK_CR			27
-#define R8A774C0_CLK_CRD2		28
-#define R8A774C0_CLK_SD0H		29
-#define R8A774C0_CLK_SD0		30
-#define R8A774C0_CLK_SD1H		31
-#define R8A774C0_CLK_SD1		32
-#define R8A774C0_CLK_SD3H		33
-#define R8A774C0_CLK_SD3		34
-#define R8A774C0_CLK_RPC		35
-#define R8A774C0_CLK_RPCD2		36
-#define R8A774C0_CLK_ZA2		37
-#define R8A774C0_CLK_ZA8		38
-#define R8A774C0_CLK_Z2D		39
-#define R8A774C0_CLK_MSO		40
-#define R8A774C0_CLK_R			41
-#define R8A774C0_CLK_OSC		42
-#define R8A774C0_CLK_LV0		43
-#define R8A774C0_CLK_LV1		44
-#define R8A774C0_CLK_CSI0		45
-#define R8A774C0_CLK_CP			46
-#define R8A774C0_CLK_CPEX		47
-#define R8A774C0_CLK_CANFD		48
-
-#endif /* __DT_BINDINGS_CLOCK_R8A774C0_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a774e1-cpg-mssr.h b/include/dt-bindings/clock/r8a774e1-cpg-mssr.h
deleted file mode 100644
index b2fc1d1c3c47..000000000000
--- a/include/dt-bindings/clock/r8a774e1-cpg-mssr.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- * Copyright (C) 2020 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A774E1_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A774E1_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* R8A774E1 CPG Core Clocks */
-#define R8A774E1_CLK_Z			0
-#define R8A774E1_CLK_Z2			1
-#define R8A774E1_CLK_ZG			2
-#define R8A774E1_CLK_ZTR		3
-#define R8A774E1_CLK_ZTRD2		4
-#define R8A774E1_CLK_ZT			5
-#define R8A774E1_CLK_ZX			6
-#define R8A774E1_CLK_S0D1		7
-#define R8A774E1_CLK_S0D2		8
-#define R8A774E1_CLK_S0D3		9
-#define R8A774E1_CLK_S0D4		10
-#define R8A774E1_CLK_S0D6		11
-#define R8A774E1_CLK_S0D8		12
-#define R8A774E1_CLK_S0D12		13
-#define R8A774E1_CLK_S1D2		14
-#define R8A774E1_CLK_S1D4		15
-#define R8A774E1_CLK_S2D1		16
-#define R8A774E1_CLK_S2D2		17
-#define R8A774E1_CLK_S2D4		18
-#define R8A774E1_CLK_S3D1		19
-#define R8A774E1_CLK_S3D2		20
-#define R8A774E1_CLK_S3D4		21
-#define R8A774E1_CLK_LB			22
-#define R8A774E1_CLK_CL			23
-#define R8A774E1_CLK_ZB3		24
-#define R8A774E1_CLK_ZB3D2		25
-#define R8A774E1_CLK_ZB3D4		26
-#define R8A774E1_CLK_CR			27
-#define R8A774E1_CLK_CRD2		28
-#define R8A774E1_CLK_SD0H		29
-#define R8A774E1_CLK_SD0		30
-#define R8A774E1_CLK_SD1H		31
-#define R8A774E1_CLK_SD1		32
-#define R8A774E1_CLK_SD2H		33
-#define R8A774E1_CLK_SD2		34
-#define R8A774E1_CLK_SD3H		35
-#define R8A774E1_CLK_SD3		36
-#define R8A774E1_CLK_RPC		37
-#define R8A774E1_CLK_RPCD2		38
-#define R8A774E1_CLK_MSO		39
-#define R8A774E1_CLK_HDMI		40
-#define R8A774E1_CLK_CSI0		41
-#define R8A774E1_CLK_CP			42
-#define R8A774E1_CLK_CPEX		43
-#define R8A774E1_CLK_R			44
-#define R8A774E1_CLK_OSC		45
-#define R8A774E1_CLK_CANFD		46
-
-#endif /* __DT_BINDINGS_CLOCK_R8A774E1_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a7790-clock.h b/include/dt-bindings/clock/r8a7790-clock.h
deleted file mode 100644
index c92ff1e60223..000000000000
--- a/include/dt-bindings/clock/r8a7790-clock.h
+++ /dev/null
@@ -1,158 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright 2013 Ideas On Board SPRL
- */
-
-#ifndef __DT_BINDINGS_CLOCK_R8A7790_H__
-#define __DT_BINDINGS_CLOCK_R8A7790_H__
-
-/* CPG */
-#define R8A7790_CLK_MAIN		0
-#define R8A7790_CLK_PLL0		1
-#define R8A7790_CLK_PLL1		2
-#define R8A7790_CLK_PLL3		3
-#define R8A7790_CLK_LB			4
-#define R8A7790_CLK_QSPI		5
-#define R8A7790_CLK_SDH			6
-#define R8A7790_CLK_SD0			7
-#define R8A7790_CLK_SD1			8
-#define R8A7790_CLK_Z			9
-#define R8A7790_CLK_RCAN		10
-#define R8A7790_CLK_ADSP		11
-
-/* MSTP0 */
-#define R8A7790_CLK_MSIOF0		0
-
-/* MSTP1 */
-#define R8A7790_CLK_VCP1		0
-#define R8A7790_CLK_VCP0		1
-#define R8A7790_CLK_VPC1		2
-#define R8A7790_CLK_VPC0		3
-#define R8A7790_CLK_JPU			6
-#define R8A7790_CLK_SSP1		9
-#define R8A7790_CLK_TMU1		11
-#define R8A7790_CLK_3DG			12
-#define R8A7790_CLK_2DDMAC		15
-#define R8A7790_CLK_FDP1_2		17
-#define R8A7790_CLK_FDP1_1		18
-#define R8A7790_CLK_FDP1_0		19
-#define R8A7790_CLK_TMU3		21
-#define R8A7790_CLK_TMU2		22
-#define R8A7790_CLK_CMT0		24
-#define R8A7790_CLK_TMU0		25
-#define R8A7790_CLK_VSP1_DU1		27
-#define R8A7790_CLK_VSP1_DU0		28
-#define R8A7790_CLK_VSP1_R		30
-#define R8A7790_CLK_VSP1_S		31
-
-/* MSTP2 */
-#define R8A7790_CLK_SCIFA2		2
-#define R8A7790_CLK_SCIFA1		3
-#define R8A7790_CLK_SCIFA0		4
-#define R8A7790_CLK_MSIOF2		5
-#define R8A7790_CLK_SCIFB0		6
-#define R8A7790_CLK_SCIFB1		7
-#define R8A7790_CLK_MSIOF1		8
-#define R8A7790_CLK_MSIOF3		15
-#define R8A7790_CLK_SCIFB2		16
-#define R8A7790_CLK_SYS_DMAC1		18
-#define R8A7790_CLK_SYS_DMAC0		19
-
-/* MSTP3 */
-#define R8A7790_CLK_IIC2		0
-#define R8A7790_CLK_TPU0		4
-#define R8A7790_CLK_MMCIF1		5
-#define R8A7790_CLK_SCIF2		10
-#define R8A7790_CLK_SDHI3		11
-#define R8A7790_CLK_SDHI2		12
-#define R8A7790_CLK_SDHI1		13
-#define R8A7790_CLK_SDHI0		14
-#define R8A7790_CLK_MMCIF0		15
-#define R8A7790_CLK_IIC0		18
-#define R8A7790_CLK_PCIEC		19
-#define R8A7790_CLK_IIC1		23
-#define R8A7790_CLK_SSUSB		28
-#define R8A7790_CLK_CMT1		29
-#define R8A7790_CLK_USBDMAC0		30
-#define R8A7790_CLK_USBDMAC1		31
-
-/* MSTP4 */
-#define R8A7790_CLK_IRQC		7
-#define R8A7790_CLK_INTC_SYS		8
-
-/* MSTP5 */
-#define R8A7790_CLK_AUDIO_DMAC1		1
-#define R8A7790_CLK_AUDIO_DMAC0		2
-#define R8A7790_CLK_ADSP_MOD		6
-#define R8A7790_CLK_THERMAL		22
-#define R8A7790_CLK_PWM			23
-
-/* MSTP7 */
-#define R8A7790_CLK_EHCI		3
-#define R8A7790_CLK_HSUSB		4
-#define R8A7790_CLK_HSCIF1		16
-#define R8A7790_CLK_HSCIF0		17
-#define R8A7790_CLK_SCIF1		20
-#define R8A7790_CLK_SCIF0		21
-#define R8A7790_CLK_DU2			22
-#define R8A7790_CLK_DU1			23
-#define R8A7790_CLK_DU0			24
-#define R8A7790_CLK_LVDS1		25
-#define R8A7790_CLK_LVDS0		26
-
-/* MSTP8 */
-#define R8A7790_CLK_MLB			2
-#define R8A7790_CLK_VIN3		8
-#define R8A7790_CLK_VIN2		9
-#define R8A7790_CLK_VIN1		10
-#define R8A7790_CLK_VIN0		11
-#define R8A7790_CLK_ETHERAVB		12
-#define R8A7790_CLK_ETHER		13
-#define R8A7790_CLK_SATA1		14
-#define R8A7790_CLK_SATA0		15
-
-/* MSTP9 */
-#define R8A7790_CLK_GPIO5		7
-#define R8A7790_CLK_GPIO4		8
-#define R8A7790_CLK_GPIO3		9
-#define R8A7790_CLK_GPIO2		10
-#define R8A7790_CLK_GPIO1		11
-#define R8A7790_CLK_GPIO0		12
-#define R8A7790_CLK_RCAN1		15
-#define R8A7790_CLK_RCAN0		16
-#define R8A7790_CLK_QSPI_MOD		17
-#define R8A7790_CLK_IICDVFS		26
-#define R8A7790_CLK_I2C3		28
-#define R8A7790_CLK_I2C2		29
-#define R8A7790_CLK_I2C1		30
-#define R8A7790_CLK_I2C0		31
-
-/* MSTP10 */
-#define R8A7790_CLK_SSI_ALL		5
-#define R8A7790_CLK_SSI9		6
-#define R8A7790_CLK_SSI8		7
-#define R8A7790_CLK_SSI7		8
-#define R8A7790_CLK_SSI6		9
-#define R8A7790_CLK_SSI5		10
-#define R8A7790_CLK_SSI4		11
-#define R8A7790_CLK_SSI3		12
-#define R8A7790_CLK_SSI2		13
-#define R8A7790_CLK_SSI1		14
-#define R8A7790_CLK_SSI0		15
-#define R8A7790_CLK_SCU_ALL		17
-#define R8A7790_CLK_SCU_DVC1		18
-#define R8A7790_CLK_SCU_DVC0		19
-#define R8A7790_CLK_SCU_CTU1_MIX1	20
-#define R8A7790_CLK_SCU_CTU0_MIX0	21
-#define R8A7790_CLK_SCU_SRC9		22
-#define R8A7790_CLK_SCU_SRC8		23
-#define R8A7790_CLK_SCU_SRC7		24
-#define R8A7790_CLK_SCU_SRC6		25
-#define R8A7790_CLK_SCU_SRC5		26
-#define R8A7790_CLK_SCU_SRC4		27
-#define R8A7790_CLK_SCU_SRC3		28
-#define R8A7790_CLK_SCU_SRC2		29
-#define R8A7790_CLK_SCU_SRC1		30
-#define R8A7790_CLK_SCU_SRC0		31
-
-#endif /* __DT_BINDINGS_CLOCK_R8A7790_H__ */
diff --git a/include/dt-bindings/clock/r8a7790-cpg-mssr.h b/include/dt-bindings/clock/r8a7790-cpg-mssr.h
deleted file mode 100644
index c5955b56b36d..000000000000
--- a/include/dt-bindings/clock/r8a7790-cpg-mssr.h
+++ /dev/null
@@ -1,48 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+
- *
- * Copyright (C) 2015 Renesas Electronics Corp.
- */
-
-#ifndef __DT_BINDINGS_CLOCK_R8A7790_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A7790_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a7790 CPG Core Clocks */
-#define R8A7790_CLK_Z			0
-#define R8A7790_CLK_Z2			1
-#define R8A7790_CLK_ZG			2
-#define R8A7790_CLK_ZTR			3
-#define R8A7790_CLK_ZTRD2		4
-#define R8A7790_CLK_ZT			5
-#define R8A7790_CLK_ZX			6
-#define R8A7790_CLK_ZS			7
-#define R8A7790_CLK_HP			8
-#define R8A7790_CLK_I			9
-#define R8A7790_CLK_B			10
-#define R8A7790_CLK_LB			11
-#define R8A7790_CLK_P			12
-#define R8A7790_CLK_CL			13
-#define R8A7790_CLK_M2			14
-#define R8A7790_CLK_ADSP		15
-#define R8A7790_CLK_IMP			16
-#define R8A7790_CLK_ZB3			17
-#define R8A7790_CLK_ZB3D2		18
-#define R8A7790_CLK_DDR			19
-#define R8A7790_CLK_SDH			20
-#define R8A7790_CLK_SD0			21
-#define R8A7790_CLK_SD1			22
-#define R8A7790_CLK_SD2			23
-#define R8A7790_CLK_SD3			24
-#define R8A7790_CLK_MMC0		25
-#define R8A7790_CLK_MMC1		26
-#define R8A7790_CLK_MP			27
-#define R8A7790_CLK_SSP			28
-#define R8A7790_CLK_SSPRS		29
-#define R8A7790_CLK_QSPI		30
-#define R8A7790_CLK_CP			31
-#define R8A7790_CLK_RCAN		32
-#define R8A7790_CLK_R			33
-#define R8A7790_CLK_OSC			34
-
-#endif /* __DT_BINDINGS_CLOCK_R8A7790_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a7791-clock.h b/include/dt-bindings/clock/r8a7791-clock.h
deleted file mode 100644
index bb4f18b1b3d5..000000000000
--- a/include/dt-bindings/clock/r8a7791-clock.h
+++ /dev/null
@@ -1,161 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright 2013 Ideas On Board SPRL
- */
-
-#ifndef __DT_BINDINGS_CLOCK_R8A7791_H__
-#define __DT_BINDINGS_CLOCK_R8A7791_H__
-
-/* CPG */
-#define R8A7791_CLK_MAIN		0
-#define R8A7791_CLK_PLL0		1
-#define R8A7791_CLK_PLL1		2
-#define R8A7791_CLK_PLL3		3
-#define R8A7791_CLK_LB			4
-#define R8A7791_CLK_QSPI		5
-#define R8A7791_CLK_SDH			6
-#define R8A7791_CLK_SD0			7
-#define R8A7791_CLK_Z			8
-#define R8A7791_CLK_RCAN		9
-#define R8A7791_CLK_ADSP		10
-
-/* MSTP0 */
-#define R8A7791_CLK_MSIOF0		0
-
-/* MSTP1 */
-#define R8A7791_CLK_VCP0		1
-#define R8A7791_CLK_VPC0		3
-#define R8A7791_CLK_JPU			6
-#define R8A7791_CLK_SSP1		9
-#define R8A7791_CLK_TMU1		11
-#define R8A7791_CLK_3DG			12
-#define R8A7791_CLK_2DDMAC		15
-#define R8A7791_CLK_FDP1_1		18
-#define R8A7791_CLK_FDP1_0		19
-#define R8A7791_CLK_TMU3		21
-#define R8A7791_CLK_TMU2		22
-#define R8A7791_CLK_CMT0		24
-#define R8A7791_CLK_TMU0		25
-#define R8A7791_CLK_VSP1_DU1		27
-#define R8A7791_CLK_VSP1_DU0		28
-#define R8A7791_CLK_VSP1_S		31
-
-/* MSTP2 */
-#define R8A7791_CLK_SCIFA2		2
-#define R8A7791_CLK_SCIFA1		3
-#define R8A7791_CLK_SCIFA0		4
-#define R8A7791_CLK_MSIOF2		5
-#define R8A7791_CLK_SCIFB0		6
-#define R8A7791_CLK_SCIFB1		7
-#define R8A7791_CLK_MSIOF1		8
-#define R8A7791_CLK_SCIFB2		16
-#define R8A7791_CLK_SYS_DMAC1		18
-#define R8A7791_CLK_SYS_DMAC0		19
-
-/* MSTP3 */
-#define R8A7791_CLK_TPU0		4
-#define R8A7791_CLK_SDHI2		11
-#define R8A7791_CLK_SDHI1		12
-#define R8A7791_CLK_SDHI0		14
-#define R8A7791_CLK_MMCIF0		15
-#define R8A7791_CLK_IIC0		18
-#define R8A7791_CLK_PCIEC		19
-#define R8A7791_CLK_IIC1		23
-#define R8A7791_CLK_SSUSB		28
-#define R8A7791_CLK_CMT1		29
-#define R8A7791_CLK_USBDMAC0		30
-#define R8A7791_CLK_USBDMAC1		31
-
-/* MSTP4 */
-#define R8A7791_CLK_IRQC		7
-#define R8A7791_CLK_INTC_SYS		8
-
-/* MSTP5 */
-#define R8A7791_CLK_AUDIO_DMAC1		1
-#define R8A7791_CLK_AUDIO_DMAC0		2
-#define R8A7791_CLK_ADSP_MOD		6
-#define R8A7791_CLK_THERMAL		22
-#define R8A7791_CLK_PWM			23
-
-/* MSTP7 */
-#define R8A7791_CLK_EHCI		3
-#define R8A7791_CLK_HSUSB		4
-#define R8A7791_CLK_HSCIF2		13
-#define R8A7791_CLK_SCIF5		14
-#define R8A7791_CLK_SCIF4		15
-#define R8A7791_CLK_HSCIF1		16
-#define R8A7791_CLK_HSCIF0		17
-#define R8A7791_CLK_SCIF3		18
-#define R8A7791_CLK_SCIF2		19
-#define R8A7791_CLK_SCIF1		20
-#define R8A7791_CLK_SCIF0		21
-#define R8A7791_CLK_DU1			23
-#define R8A7791_CLK_DU0			24
-#define R8A7791_CLK_LVDS0		26
-
-/* MSTP8 */
-#define R8A7791_CLK_IPMMU_SGX		0
-#define R8A7791_CLK_MLB			2
-#define R8A7791_CLK_VIN2		9
-#define R8A7791_CLK_VIN1		10
-#define R8A7791_CLK_VIN0		11
-#define R8A7791_CLK_ETHERAVB		12
-#define R8A7791_CLK_ETHER		13
-#define R8A7791_CLK_SATA1		14
-#define R8A7791_CLK_SATA0		15
-
-/* MSTP9 */
-#define R8A7791_CLK_GYROADC		1
-#define R8A7791_CLK_GPIO7		4
-#define R8A7791_CLK_GPIO6		5
-#define R8A7791_CLK_GPIO5		7
-#define R8A7791_CLK_GPIO4		8
-#define R8A7791_CLK_GPIO3		9
-#define R8A7791_CLK_GPIO2		10
-#define R8A7791_CLK_GPIO1		11
-#define R8A7791_CLK_GPIO0		12
-#define R8A7791_CLK_RCAN1		15
-#define R8A7791_CLK_RCAN0		16
-#define R8A7791_CLK_QSPI_MOD		17
-#define R8A7791_CLK_I2C5		25
-#define R8A7791_CLK_IICDVFS		26
-#define R8A7791_CLK_I2C4		27
-#define R8A7791_CLK_I2C3		28
-#define R8A7791_CLK_I2C2		29
-#define R8A7791_CLK_I2C1		30
-#define R8A7791_CLK_I2C0		31
-
-/* MSTP10 */
-#define R8A7791_CLK_SSI_ALL		5
-#define R8A7791_CLK_SSI9		6
-#define R8A7791_CLK_SSI8		7
-#define R8A7791_CLK_SSI7		8
-#define R8A7791_CLK_SSI6		9
-#define R8A7791_CLK_SSI5		10
-#define R8A7791_CLK_SSI4		11
-#define R8A7791_CLK_SSI3		12
-#define R8A7791_CLK_SSI2		13
-#define R8A7791_CLK_SSI1		14
-#define R8A7791_CLK_SSI0		15
-#define R8A7791_CLK_SCU_ALL		17
-#define R8A7791_CLK_SCU_DVC1		18
-#define R8A7791_CLK_SCU_DVC0		19
-#define R8A7791_CLK_SCU_CTU1_MIX1	20
-#define R8A7791_CLK_SCU_CTU0_MIX0	21
-#define R8A7791_CLK_SCU_SRC9		22
-#define R8A7791_CLK_SCU_SRC8		23
-#define R8A7791_CLK_SCU_SRC7		24
-#define R8A7791_CLK_SCU_SRC6		25
-#define R8A7791_CLK_SCU_SRC5		26
-#define R8A7791_CLK_SCU_SRC4		27
-#define R8A7791_CLK_SCU_SRC3		28
-#define R8A7791_CLK_SCU_SRC2		29
-#define R8A7791_CLK_SCU_SRC1		30
-#define R8A7791_CLK_SCU_SRC0		31
-
-/* MSTP11 */
-#define R8A7791_CLK_SCIFA3		6
-#define R8A7791_CLK_SCIFA4		7
-#define R8A7791_CLK_SCIFA5		8
-
-#endif /* __DT_BINDINGS_CLOCK_R8A7791_H__ */
diff --git a/include/dt-bindings/clock/r8a7791-cpg-mssr.h b/include/dt-bindings/clock/r8a7791-cpg-mssr.h
deleted file mode 100644
index aadd06c566c0..000000000000
--- a/include/dt-bindings/clock/r8a7791-cpg-mssr.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+
- *
- * Copyright (C) 2015 Renesas Electronics Corp.
- */
-
-#ifndef __DT_BINDINGS_CLOCK_R8A7791_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A7791_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a7791 CPG Core Clocks */
-#define R8A7791_CLK_Z			0
-#define R8A7791_CLK_ZG			1
-#define R8A7791_CLK_ZTR			2
-#define R8A7791_CLK_ZTRD2		3
-#define R8A7791_CLK_ZT			4
-#define R8A7791_CLK_ZX			5
-#define R8A7791_CLK_ZS			6
-#define R8A7791_CLK_HP			7
-#define R8A7791_CLK_I			8
-#define R8A7791_CLK_B			9
-#define R8A7791_CLK_LB			10
-#define R8A7791_CLK_P			11
-#define R8A7791_CLK_CL			12
-#define R8A7791_CLK_M2			13
-#define R8A7791_CLK_ADSP		14
-#define R8A7791_CLK_ZB3			15
-#define R8A7791_CLK_ZB3D2		16
-#define R8A7791_CLK_DDR			17
-#define R8A7791_CLK_SDH			18
-#define R8A7791_CLK_SD0			19
-#define R8A7791_CLK_SD2			20
-#define R8A7791_CLK_SD3			21
-#define R8A7791_CLK_MMC0		22
-#define R8A7791_CLK_MP			23
-#define R8A7791_CLK_SSP			24
-#define R8A7791_CLK_SSPRS		25
-#define R8A7791_CLK_QSPI		26
-#define R8A7791_CLK_CP			27
-#define R8A7791_CLK_RCAN		28
-#define R8A7791_CLK_R			29
-#define R8A7791_CLK_OSC			30
-
-#endif /* __DT_BINDINGS_CLOCK_R8A7791_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a7792-clock.h b/include/dt-bindings/clock/r8a7792-clock.h
deleted file mode 100644
index 2948d9ce3a14..000000000000
--- a/include/dt-bindings/clock/r8a7792-clock.h
+++ /dev/null
@@ -1,98 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2016 Cogent Embedded, Inc.
- */
-
-#ifndef __DT_BINDINGS_CLOCK_R8A7792_H__
-#define __DT_BINDINGS_CLOCK_R8A7792_H__
-
-/* CPG */
-#define R8A7792_CLK_MAIN		0
-#define R8A7792_CLK_PLL0		1
-#define R8A7792_CLK_PLL1		2
-#define R8A7792_CLK_PLL3		3
-#define R8A7792_CLK_LB			4
-#define R8A7792_CLK_QSPI		5
-
-/* MSTP0 */
-#define R8A7792_CLK_MSIOF0		0
-
-/* MSTP1 */
-#define R8A7792_CLK_JPU			6
-#define R8A7792_CLK_TMU1		11
-#define R8A7792_CLK_TMU3		21
-#define R8A7792_CLK_TMU2		22
-#define R8A7792_CLK_CMT0		24
-#define R8A7792_CLK_TMU0		25
-#define R8A7792_CLK_VSP1DU1		27
-#define R8A7792_CLK_VSP1DU0		28
-#define R8A7792_CLK_VSP1_SY		31
-
-/* MSTP2 */
-#define R8A7792_CLK_MSIOF1		8
-#define R8A7792_CLK_SYS_DMAC1		18
-#define R8A7792_CLK_SYS_DMAC0		19
-
-/* MSTP3 */
-#define R8A7792_CLK_TPU0		4
-#define R8A7792_CLK_SDHI0		14
-#define R8A7792_CLK_CMT1		29
-
-/* MSTP4 */
-#define R8A7792_CLK_IRQC		7
-#define R8A7792_CLK_INTC_SYS		8
-
-/* MSTP5 */
-#define R8A7792_CLK_AUDIO_DMAC0		2
-#define R8A7792_CLK_THERMAL		22
-#define R8A7792_CLK_PWM			23
-
-/* MSTP7 */
-#define R8A7792_CLK_HSCIF1		16
-#define R8A7792_CLK_HSCIF0		17
-#define R8A7792_CLK_SCIF3		18
-#define R8A7792_CLK_SCIF2		19
-#define R8A7792_CLK_SCIF1		20
-#define R8A7792_CLK_SCIF0		21
-#define R8A7792_CLK_DU1			23
-#define R8A7792_CLK_DU0			24
-
-/* MSTP8 */
-#define R8A7792_CLK_VIN5		4
-#define R8A7792_CLK_VIN4		5
-#define R8A7792_CLK_VIN3		8
-#define R8A7792_CLK_VIN2		9
-#define R8A7792_CLK_VIN1		10
-#define R8A7792_CLK_VIN0		11
-#define R8A7792_CLK_ETHERAVB		12
-
-/* MSTP9 */
-#define R8A7792_CLK_GPIO7		4
-#define R8A7792_CLK_GPIO6		5
-#define R8A7792_CLK_GPIO5		7
-#define R8A7792_CLK_GPIO4		8
-#define R8A7792_CLK_GPIO3		9
-#define R8A7792_CLK_GPIO2		10
-#define R8A7792_CLK_GPIO1		11
-#define R8A7792_CLK_GPIO0		12
-#define R8A7792_CLK_GPIO11		13
-#define R8A7792_CLK_GPIO10		14
-#define R8A7792_CLK_CAN1		15
-#define R8A7792_CLK_CAN0		16
-#define R8A7792_CLK_QSPI_MOD		17
-#define R8A7792_CLK_GPIO9		19
-#define R8A7792_CLK_GPIO8		21
-#define R8A7792_CLK_I2C5		25
-#define R8A7792_CLK_IICDVFS		26
-#define R8A7792_CLK_I2C4		27
-#define R8A7792_CLK_I2C3		28
-#define R8A7792_CLK_I2C2		29
-#define R8A7792_CLK_I2C1		30
-#define R8A7792_CLK_I2C0		31
-
-/* MSTP10 */
-#define R8A7792_CLK_SSI_ALL		5
-#define R8A7792_CLK_SSI4		11
-#define R8A7792_CLK_SSI3		12
-
-#endif /* __DT_BINDINGS_CLOCK_R8A7792_H__ */
diff --git a/include/dt-bindings/clock/r8a7792-cpg-mssr.h b/include/dt-bindings/clock/r8a7792-cpg-mssr.h
deleted file mode 100644
index 829c44db0271..000000000000
--- a/include/dt-bindings/clock/r8a7792-cpg-mssr.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+
- *
- * Copyright (C) 2015 Renesas Electronics Corp.
- */
-
-#ifndef __DT_BINDINGS_CLOCK_R8A7792_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A7792_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a7792 CPG Core Clocks */
-#define R8A7792_CLK_Z			0
-#define R8A7792_CLK_ZG			1
-#define R8A7792_CLK_ZTR			2
-#define R8A7792_CLK_ZTRD2		3
-#define R8A7792_CLK_ZT			4
-#define R8A7792_CLK_ZX			5
-#define R8A7792_CLK_ZS			6
-#define R8A7792_CLK_HP			7
-#define R8A7792_CLK_I			8
-#define R8A7792_CLK_B			9
-#define R8A7792_CLK_LB			10
-#define R8A7792_CLK_P			11
-#define R8A7792_CLK_CL			12
-#define R8A7792_CLK_M2			13
-#define R8A7792_CLK_IMP			14
-#define R8A7792_CLK_ZB3			15
-#define R8A7792_CLK_ZB3D2		16
-#define R8A7792_CLK_DDR			17
-#define R8A7792_CLK_SD			18
-#define R8A7792_CLK_MP			19
-#define R8A7792_CLK_QSPI		20
-#define R8A7792_CLK_CP			21
-#define R8A7792_CLK_CPEX		22
-#define R8A7792_CLK_RCAN		23
-#define R8A7792_CLK_R			24
-#define R8A7792_CLK_OSC			25
-
-#endif /* __DT_BINDINGS_CLOCK_R8A7792_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a7793-clock.h b/include/dt-bindings/clock/r8a7793-clock.h
deleted file mode 100644
index 49c66d8ed178..000000000000
--- a/include/dt-bindings/clock/r8a7793-clock.h
+++ /dev/null
@@ -1,159 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- * r8a7793 clock definition
- *
- * Copyright (C) 2014  Renesas Electronics Corporation
- */
-
-#ifndef __DT_BINDINGS_CLOCK_R8A7793_H__
-#define __DT_BINDINGS_CLOCK_R8A7793_H__
-
-/* CPG */
-#define R8A7793_CLK_MAIN		0
-#define R8A7793_CLK_PLL0		1
-#define R8A7793_CLK_PLL1		2
-#define R8A7793_CLK_PLL3		3
-#define R8A7793_CLK_LB			4
-#define R8A7793_CLK_QSPI		5
-#define R8A7793_CLK_SDH			6
-#define R8A7793_CLK_SD0			7
-#define R8A7793_CLK_Z			8
-#define R8A7793_CLK_RCAN		9
-#define R8A7793_CLK_ADSP		10
-
-/* MSTP0 */
-#define R8A7793_CLK_MSIOF0		0
-
-/* MSTP1 */
-#define R8A7793_CLK_VCP0		1
-#define R8A7793_CLK_VPC0		3
-#define R8A7793_CLK_SSP1		9
-#define R8A7793_CLK_TMU1		11
-#define R8A7793_CLK_3DG			12
-#define R8A7793_CLK_2DDMAC		15
-#define R8A7793_CLK_FDP1_1		18
-#define R8A7793_CLK_FDP1_0		19
-#define R8A7793_CLK_TMU3		21
-#define R8A7793_CLK_TMU2		22
-#define R8A7793_CLK_CMT0		24
-#define R8A7793_CLK_TMU0		25
-#define R8A7793_CLK_VSP1_DU1		27
-#define R8A7793_CLK_VSP1_DU0		28
-#define R8A7793_CLK_VSP1_S		31
-
-/* MSTP2 */
-#define R8A7793_CLK_SCIFA2		2
-#define R8A7793_CLK_SCIFA1		3
-#define R8A7793_CLK_SCIFA0		4
-#define R8A7793_CLK_MSIOF2		5
-#define R8A7793_CLK_SCIFB0		6
-#define R8A7793_CLK_SCIFB1		7
-#define R8A7793_CLK_MSIOF1		8
-#define R8A7793_CLK_SCIFB2		16
-#define R8A7793_CLK_SYS_DMAC1		18
-#define R8A7793_CLK_SYS_DMAC0		19
-
-/* MSTP3 */
-#define R8A7793_CLK_TPU0		4
-#define R8A7793_CLK_SDHI2		11
-#define R8A7793_CLK_SDHI1		12
-#define R8A7793_CLK_SDHI0		14
-#define R8A7793_CLK_MMCIF0		15
-#define R8A7793_CLK_IIC0		18
-#define R8A7793_CLK_PCIEC		19
-#define R8A7793_CLK_IIC1		23
-#define R8A7793_CLK_SSUSB		28
-#define R8A7793_CLK_CMT1		29
-#define R8A7793_CLK_USBDMAC0		30
-#define R8A7793_CLK_USBDMAC1		31
-
-/* MSTP4 */
-#define R8A7793_CLK_IRQC		7
-#define R8A7793_CLK_INTC_SYS		8
-
-/* MSTP5 */
-#define R8A7793_CLK_AUDIO_DMAC1		1
-#define R8A7793_CLK_AUDIO_DMAC0		2
-#define R8A7793_CLK_ADSP_MOD		6
-#define R8A7793_CLK_THERMAL		22
-#define R8A7793_CLK_PWM			23
-
-/* MSTP7 */
-#define R8A7793_CLK_EHCI		3
-#define R8A7793_CLK_HSUSB		4
-#define R8A7793_CLK_HSCIF2		13
-#define R8A7793_CLK_SCIF5		14
-#define R8A7793_CLK_SCIF4		15
-#define R8A7793_CLK_HSCIF1		16
-#define R8A7793_CLK_HSCIF0		17
-#define R8A7793_CLK_SCIF3		18
-#define R8A7793_CLK_SCIF2		19
-#define R8A7793_CLK_SCIF1		20
-#define R8A7793_CLK_SCIF0		21
-#define R8A7793_CLK_DU1			23
-#define R8A7793_CLK_DU0			24
-#define R8A7793_CLK_LVDS0		26
-
-/* MSTP8 */
-#define R8A7793_CLK_IPMMU_SGX		0
-#define R8A7793_CLK_VIN2		9
-#define R8A7793_CLK_VIN1		10
-#define R8A7793_CLK_VIN0		11
-#define R8A7793_CLK_ETHER		13
-#define R8A7793_CLK_SATA1		14
-#define R8A7793_CLK_SATA0		15
-
-/* MSTP9 */
-#define R8A7793_CLK_GPIO7		4
-#define R8A7793_CLK_GPIO6		5
-#define R8A7793_CLK_GPIO5		7
-#define R8A7793_CLK_GPIO4		8
-#define R8A7793_CLK_GPIO3		9
-#define R8A7793_CLK_GPIO2		10
-#define R8A7793_CLK_GPIO1		11
-#define R8A7793_CLK_GPIO0		12
-#define R8A7793_CLK_RCAN1		15
-#define R8A7793_CLK_RCAN0		16
-#define R8A7793_CLK_QSPI_MOD		17
-#define R8A7793_CLK_I2C5		25
-#define R8A7793_CLK_IICDVFS		26
-#define R8A7793_CLK_I2C4		27
-#define R8A7793_CLK_I2C3		28
-#define R8A7793_CLK_I2C2		29
-#define R8A7793_CLK_I2C1		30
-#define R8A7793_CLK_I2C0		31
-
-/* MSTP10 */
-#define R8A7793_CLK_SSI_ALL		5
-#define R8A7793_CLK_SSI9		6
-#define R8A7793_CLK_SSI8		7
-#define R8A7793_CLK_SSI7		8
-#define R8A7793_CLK_SSI6		9
-#define R8A7793_CLK_SSI5		10
-#define R8A7793_CLK_SSI4		11
-#define R8A7793_CLK_SSI3		12
-#define R8A7793_CLK_SSI2		13
-#define R8A7793_CLK_SSI1		14
-#define R8A7793_CLK_SSI0		15
-#define R8A7793_CLK_SCU_ALL		17
-#define R8A7793_CLK_SCU_DVC1		18
-#define R8A7793_CLK_SCU_DVC0		19
-#define R8A7793_CLK_SCU_CTU1_MIX1	20
-#define R8A7793_CLK_SCU_CTU0_MIX0	21
-#define R8A7793_CLK_SCU_SRC9		22
-#define R8A7793_CLK_SCU_SRC8		23
-#define R8A7793_CLK_SCU_SRC7		24
-#define R8A7793_CLK_SCU_SRC6		25
-#define R8A7793_CLK_SCU_SRC5		26
-#define R8A7793_CLK_SCU_SRC4		27
-#define R8A7793_CLK_SCU_SRC3		28
-#define R8A7793_CLK_SCU_SRC2		29
-#define R8A7793_CLK_SCU_SRC1		30
-#define R8A7793_CLK_SCU_SRC0		31
-
-/* MSTP11 */
-#define R8A7793_CLK_SCIFA3		6
-#define R8A7793_CLK_SCIFA4		7
-#define R8A7793_CLK_SCIFA5		8
-
-#endif /* __DT_BINDINGS_CLOCK_R8A7793_H__ */
diff --git a/include/dt-bindings/clock/r8a7793-cpg-mssr.h b/include/dt-bindings/clock/r8a7793-cpg-mssr.h
deleted file mode 100644
index d1ff646c31f2..000000000000
--- a/include/dt-bindings/clock/r8a7793-cpg-mssr.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+
- *
- * Copyright (C) 2015 Renesas Electronics Corp.
- */
-
-#ifndef __DT_BINDINGS_CLOCK_R8A7793_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A7793_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a7793 CPG Core Clocks */
-#define R8A7793_CLK_Z			0
-#define R8A7793_CLK_ZG			1
-#define R8A7793_CLK_ZTR			2
-#define R8A7793_CLK_ZTRD2		3
-#define R8A7793_CLK_ZT			4
-#define R8A7793_CLK_ZX			5
-#define R8A7793_CLK_ZS			6
-#define R8A7793_CLK_HP			7
-#define R8A7793_CLK_I			8
-#define R8A7793_CLK_B			9
-#define R8A7793_CLK_LB			10
-#define R8A7793_CLK_P			11
-#define R8A7793_CLK_CL			12
-#define R8A7793_CLK_M2			13
-#define R8A7793_CLK_ADSP		14
-#define R8A7793_CLK_ZB3			15
-#define R8A7793_CLK_ZB3D2		16
-#define R8A7793_CLK_DDR			17
-#define R8A7793_CLK_SDH			18
-#define R8A7793_CLK_SD0			19
-#define R8A7793_CLK_SD2			20
-#define R8A7793_CLK_SD3			21
-#define R8A7793_CLK_MMC0		22
-#define R8A7793_CLK_MP			23
-#define R8A7793_CLK_SSP			24
-#define R8A7793_CLK_SSPRS		25
-#define R8A7793_CLK_QSPI		26
-#define R8A7793_CLK_CP			27
-#define R8A7793_CLK_RCAN		28
-#define R8A7793_CLK_R			29
-#define R8A7793_CLK_OSC			30
-
-#endif /* __DT_BINDINGS_CLOCK_R8A7793_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a7794-clock.h b/include/dt-bindings/clock/r8a7794-clock.h
deleted file mode 100644
index 649f005782d0..000000000000
--- a/include/dt-bindings/clock/r8a7794-clock.h
+++ /dev/null
@@ -1,137 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+
- *
- * Copyright (C) 2014 Renesas Electronics Corporation
- * Copyright 2013 Ideas On Board SPRL
- */
-
-#ifndef __DT_BINDINGS_CLOCK_R8A7794_H__
-#define __DT_BINDINGS_CLOCK_R8A7794_H__
-
-/* CPG */
-#define R8A7794_CLK_MAIN		0
-#define R8A7794_CLK_PLL0		1
-#define R8A7794_CLK_PLL1		2
-#define R8A7794_CLK_PLL3		3
-#define R8A7794_CLK_LB			4
-#define R8A7794_CLK_QSPI		5
-#define R8A7794_CLK_SDH			6
-#define R8A7794_CLK_SD0			7
-#define R8A7794_CLK_RCAN		8
-
-/* MSTP0 */
-#define R8A7794_CLK_MSIOF0		0
-
-/* MSTP1 */
-#define R8A7794_CLK_VCP0		1
-#define R8A7794_CLK_VPC0		3
-#define R8A7794_CLK_TMU1		11
-#define R8A7794_CLK_3DG			12
-#define R8A7794_CLK_2DDMAC		15
-#define R8A7794_CLK_FDP1_0		19
-#define R8A7794_CLK_TMU3		21
-#define R8A7794_CLK_TMU2		22
-#define R8A7794_CLK_CMT0		24
-#define R8A7794_CLK_TMU0		25
-#define R8A7794_CLK_VSP1_DU0		28
-#define R8A7794_CLK_VSP1_S		31
-
-/* MSTP2 */
-#define R8A7794_CLK_SCIFA2		2
-#define R8A7794_CLK_SCIFA1		3
-#define R8A7794_CLK_SCIFA0		4
-#define R8A7794_CLK_MSIOF2		5
-#define R8A7794_CLK_SCIFB0		6
-#define R8A7794_CLK_SCIFB1		7
-#define R8A7794_CLK_MSIOF1		8
-#define R8A7794_CLK_SCIFB2		16
-#define R8A7794_CLK_SYS_DMAC1		18
-#define R8A7794_CLK_SYS_DMAC0		19
-
-/* MSTP3 */
-#define R8A7794_CLK_SDHI2		11
-#define R8A7794_CLK_SDHI1		12
-#define R8A7794_CLK_SDHI0		14
-#define R8A7794_CLK_MMCIF0		15
-#define R8A7794_CLK_IIC0		18
-#define R8A7794_CLK_IIC1		23
-#define R8A7794_CLK_CMT1		29
-#define R8A7794_CLK_USBDMAC0		30
-#define R8A7794_CLK_USBDMAC1		31
-
-/* MSTP4 */
-#define R8A7794_CLK_IRQC		7
-#define R8A7794_CLK_INTC_SYS		8
-
-/* MSTP5 */
-#define R8A7794_CLK_AUDIO_DMAC0		2
-#define R8A7794_CLK_PWM			23
-
-/* MSTP7 */
-#define R8A7794_CLK_EHCI		3
-#define R8A7794_CLK_HSUSB		4
-#define R8A7794_CLK_HSCIF2		13
-#define R8A7794_CLK_SCIF5		14
-#define R8A7794_CLK_SCIF4		15
-#define R8A7794_CLK_HSCIF1		16
-#define R8A7794_CLK_HSCIF0		17
-#define R8A7794_CLK_SCIF3		18
-#define R8A7794_CLK_SCIF2		19
-#define R8A7794_CLK_SCIF1		20
-#define R8A7794_CLK_SCIF0		21
-#define R8A7794_CLK_DU1			23
-#define R8A7794_CLK_DU0			24
-
-/* MSTP8 */
-#define R8A7794_CLK_VIN1		10
-#define R8A7794_CLK_VIN0		11
-#define R8A7794_CLK_ETHERAVB		12
-#define R8A7794_CLK_ETHER		13
-
-/* MSTP9 */
-#define R8A7794_CLK_GPIO6		5
-#define R8A7794_CLK_GPIO5		7
-#define R8A7794_CLK_GPIO4		8
-#define R8A7794_CLK_GPIO3		9
-#define R8A7794_CLK_GPIO2		10
-#define R8A7794_CLK_GPIO1		11
-#define R8A7794_CLK_GPIO0		12
-#define R8A7794_CLK_RCAN1		15
-#define R8A7794_CLK_RCAN0		16
-#define R8A7794_CLK_QSPI_MOD		17
-#define R8A7794_CLK_I2C5		25
-#define R8A7794_CLK_I2C4		27
-#define R8A7794_CLK_I2C3		28
-#define R8A7794_CLK_I2C2		29
-#define R8A7794_CLK_I2C1		30
-#define R8A7794_CLK_I2C0		31
-
-/* MSTP10 */
-#define R8A7794_CLK_SSI_ALL		5
-#define R8A7794_CLK_SSI9		6
-#define R8A7794_CLK_SSI8		7
-#define R8A7794_CLK_SSI7		8
-#define R8A7794_CLK_SSI6		9
-#define R8A7794_CLK_SSI5		10
-#define R8A7794_CLK_SSI4		11
-#define R8A7794_CLK_SSI3		12
-#define R8A7794_CLK_SSI2		13
-#define R8A7794_CLK_SSI1		14
-#define R8A7794_CLK_SSI0		15
-#define R8A7794_CLK_SCU_ALL		17
-#define R8A7794_CLK_SCU_DVC1		18
-#define R8A7794_CLK_SCU_DVC0		19
-#define R8A7794_CLK_SCU_CTU1_MIX1	20
-#define R8A7794_CLK_SCU_CTU0_MIX0	21
-#define R8A7794_CLK_SCU_SRC6		25
-#define R8A7794_CLK_SCU_SRC5		26
-#define R8A7794_CLK_SCU_SRC4		27
-#define R8A7794_CLK_SCU_SRC3		28
-#define R8A7794_CLK_SCU_SRC2		29
-#define R8A7794_CLK_SCU_SRC1		30
-
-/* MSTP11 */
-#define R8A7794_CLK_SCIFA3		6
-#define R8A7794_CLK_SCIFA4		7
-#define R8A7794_CLK_SCIFA5		8
-
-#endif /* __DT_BINDINGS_CLOCK_R8A7794_H__ */
diff --git a/include/dt-bindings/clock/r8a7794-cpg-mssr.h b/include/dt-bindings/clock/r8a7794-cpg-mssr.h
deleted file mode 100644
index 6314e23b51af..000000000000
--- a/include/dt-bindings/clock/r8a7794-cpg-mssr.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+
- *
- * Copyright (C) 2015 Renesas Electronics Corp.
- */
-
-#ifndef __DT_BINDINGS_CLOCK_R8A7794_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A7794_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a7794 CPG Core Clocks */
-#define R8A7794_CLK_Z2			0
-#define R8A7794_CLK_ZG			1
-#define R8A7794_CLK_ZTR			2
-#define R8A7794_CLK_ZTRD2		3
-#define R8A7794_CLK_ZT			4
-#define R8A7794_CLK_ZX			5
-#define R8A7794_CLK_ZS			6
-#define R8A7794_CLK_HP			7
-#define R8A7794_CLK_I			8
-#define R8A7794_CLK_B			9
-#define R8A7794_CLK_LB			10
-#define R8A7794_CLK_P			11
-#define R8A7794_CLK_CL			12
-#define R8A7794_CLK_CP			13
-#define R8A7794_CLK_M2			14
-#define R8A7794_CLK_ADSP		15
-#define R8A7794_CLK_ZB3			16
-#define R8A7794_CLK_ZB3D2		17
-#define R8A7794_CLK_DDR			18
-#define R8A7794_CLK_SDH			19
-#define R8A7794_CLK_SD0			20
-#define R8A7794_CLK_SD2			21
-#define R8A7794_CLK_SD3			22
-#define R8A7794_CLK_MMC0		23
-#define R8A7794_CLK_MP			24
-#define R8A7794_CLK_QSPI		25
-#define R8A7794_CLK_CPEX		26
-#define R8A7794_CLK_RCAN		27
-#define R8A7794_CLK_R			28
-#define R8A7794_CLK_OSC			29
-
-#endif /* __DT_BINDINGS_CLOCK_R8A7794_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a7795-cpg-mssr.h b/include/dt-bindings/clock/r8a7795-cpg-mssr.h
deleted file mode 100644
index 92b3e2a95179..000000000000
--- a/include/dt-bindings/clock/r8a7795-cpg-mssr.h
+++ /dev/null
@@ -1,66 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+
- *
- * Copyright (C) 2015 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A7795_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A7795_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a7795 CPG Core Clocks */
-#define R8A7795_CLK_Z			0
-#define R8A7795_CLK_Z2			1
-#define R8A7795_CLK_ZR			2
-#define R8A7795_CLK_ZG			3
-#define R8A7795_CLK_ZTR			4
-#define R8A7795_CLK_ZTRD2		5
-#define R8A7795_CLK_ZT			6
-#define R8A7795_CLK_ZX			7
-#define R8A7795_CLK_S0D1		8
-#define R8A7795_CLK_S0D4		9
-#define R8A7795_CLK_S1D1		10
-#define R8A7795_CLK_S1D2		11
-#define R8A7795_CLK_S1D4		12
-#define R8A7795_CLK_S2D1		13
-#define R8A7795_CLK_S2D2		14
-#define R8A7795_CLK_S2D4		15
-#define R8A7795_CLK_S3D1		16
-#define R8A7795_CLK_S3D2		17
-#define R8A7795_CLK_S3D4		18
-#define R8A7795_CLK_LB			19
-#define R8A7795_CLK_CL			20
-#define R8A7795_CLK_ZB3			21
-#define R8A7795_CLK_ZB3D2		22
-#define R8A7795_CLK_CR			23
-#define R8A7795_CLK_CRD2		24
-#define R8A7795_CLK_SD0H		25
-#define R8A7795_CLK_SD0			26
-#define R8A7795_CLK_SD1H		27
-#define R8A7795_CLK_SD1			28
-#define R8A7795_CLK_SD2H		29
-#define R8A7795_CLK_SD2			30
-#define R8A7795_CLK_SD3H		31
-#define R8A7795_CLK_SD3			32
-#define R8A7795_CLK_SSP2		33
-#define R8A7795_CLK_SSP1		34
-#define R8A7795_CLK_SSPRS		35
-#define R8A7795_CLK_RPC			36
-#define R8A7795_CLK_RPCD2		37
-#define R8A7795_CLK_MSO			38
-#define R8A7795_CLK_CANFD		39
-#define R8A7795_CLK_HDMI		40
-#define R8A7795_CLK_CSI0		41
-/* CLK_CSIREF was removed */
-#define R8A7795_CLK_CP			43
-#define R8A7795_CLK_CPEX		44
-#define R8A7795_CLK_R			45
-#define R8A7795_CLK_OSC			46
-
-/* r8a7795 ES2.0 CPG Core Clocks */
-#define R8A7795_CLK_S0D2		47
-#define R8A7795_CLK_S0D3		48
-#define R8A7795_CLK_S0D6		49
-#define R8A7795_CLK_S0D8		50
-#define R8A7795_CLK_S0D12		51
-
-#endif /* __DT_BINDINGS_CLOCK_R8A7795_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a7796-cpg-mssr.h b/include/dt-bindings/clock/r8a7796-cpg-mssr.h
deleted file mode 100644
index c0957cf45840..000000000000
--- a/include/dt-bindings/clock/r8a7796-cpg-mssr.h
+++ /dev/null
@@ -1,65 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+
- *
- * Copyright (C) 2016 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A7796_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A7796_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a7796 CPG Core Clocks */
-#define R8A7796_CLK_Z			0
-#define R8A7796_CLK_Z2			1
-#define R8A7796_CLK_ZR			2
-#define R8A7796_CLK_ZG			3
-#define R8A7796_CLK_ZTR			4
-#define R8A7796_CLK_ZTRD2		5
-#define R8A7796_CLK_ZT			6
-#define R8A7796_CLK_ZX			7
-#define R8A7796_CLK_S0D1		8
-#define R8A7796_CLK_S0D2		9
-#define R8A7796_CLK_S0D3		10
-#define R8A7796_CLK_S0D4		11
-#define R8A7796_CLK_S0D6		12
-#define R8A7796_CLK_S0D8		13
-#define R8A7796_CLK_S0D12		14
-#define R8A7796_CLK_S1D1		15
-#define R8A7796_CLK_S1D2		16
-#define R8A7796_CLK_S1D4		17
-#define R8A7796_CLK_S2D1		18
-#define R8A7796_CLK_S2D2		19
-#define R8A7796_CLK_S2D4		20
-#define R8A7796_CLK_S3D1		21
-#define R8A7796_CLK_S3D2		22
-#define R8A7796_CLK_S3D4		23
-#define R8A7796_CLK_LB			24
-#define R8A7796_CLK_CL			25
-#define R8A7796_CLK_ZB3			26
-#define R8A7796_CLK_ZB3D2		27
-#define R8A7796_CLK_ZB3D4		28
-#define R8A7796_CLK_CR			29
-#define R8A7796_CLK_CRD2		30
-#define R8A7796_CLK_SD0H		31
-#define R8A7796_CLK_SD0			32
-#define R8A7796_CLK_SD1H		33
-#define R8A7796_CLK_SD1			34
-#define R8A7796_CLK_SD2H		35
-#define R8A7796_CLK_SD2			36
-#define R8A7796_CLK_SD3H		37
-#define R8A7796_CLK_SD3			38
-#define R8A7796_CLK_SSP2		39
-#define R8A7796_CLK_SSP1		40
-#define R8A7796_CLK_SSPRS		41
-#define R8A7796_CLK_RPC			42
-#define R8A7796_CLK_RPCD2		43
-#define R8A7796_CLK_MSO			44
-#define R8A7796_CLK_CANFD		45
-#define R8A7796_CLK_HDMI		46
-#define R8A7796_CLK_CSI0		47
-/* CLK_CSIREF was removed */
-#define R8A7796_CLK_CP			49
-#define R8A7796_CLK_CPEX		50
-#define R8A7796_CLK_R			51
-#define R8A7796_CLK_OSC			52
-
-#endif /* __DT_BINDINGS_CLOCK_R8A7796_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a77961-cpg-mssr.h b/include/dt-bindings/clock/r8a77961-cpg-mssr.h
deleted file mode 100644
index 7921d785546d..000000000000
--- a/include/dt-bindings/clock/r8a77961-cpg-mssr.h
+++ /dev/null
@@ -1,65 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+
- *
- * Copyright (C) 2019 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A77961_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A77961_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a77961 CPG Core Clocks */
-#define R8A77961_CLK_Z			0
-#define R8A77961_CLK_Z2			1
-#define R8A77961_CLK_ZR			2
-#define R8A77961_CLK_ZG			3
-#define R8A77961_CLK_ZTR			4
-#define R8A77961_CLK_ZTRD2		5
-#define R8A77961_CLK_ZT			6
-#define R8A77961_CLK_ZX			7
-#define R8A77961_CLK_S0D1		8
-#define R8A77961_CLK_S0D2		9
-#define R8A77961_CLK_S0D3		10
-#define R8A77961_CLK_S0D4		11
-#define R8A77961_CLK_S0D6		12
-#define R8A77961_CLK_S0D8		13
-#define R8A77961_CLK_S0D12		14
-#define R8A77961_CLK_S1D1		15
-#define R8A77961_CLK_S1D2		16
-#define R8A77961_CLK_S1D4		17
-#define R8A77961_CLK_S2D1		18
-#define R8A77961_CLK_S2D2		19
-#define R8A77961_CLK_S2D4		20
-#define R8A77961_CLK_S3D1		21
-#define R8A77961_CLK_S3D2		22
-#define R8A77961_CLK_S3D4		23
-#define R8A77961_CLK_LB			24
-#define R8A77961_CLK_CL			25
-#define R8A77961_CLK_ZB3			26
-#define R8A77961_CLK_ZB3D2		27
-#define R8A77961_CLK_ZB3D4		28
-#define R8A77961_CLK_CR			29
-#define R8A77961_CLK_CRD2		30
-#define R8A77961_CLK_SD0H		31
-#define R8A77961_CLK_SD0			32
-#define R8A77961_CLK_SD1H		33
-#define R8A77961_CLK_SD1			34
-#define R8A77961_CLK_SD2H		35
-#define R8A77961_CLK_SD2			36
-#define R8A77961_CLK_SD3H		37
-#define R8A77961_CLK_SD3			38
-#define R8A77961_CLK_SSP2		39
-#define R8A77961_CLK_SSP1		40
-#define R8A77961_CLK_SSPRS		41
-#define R8A77961_CLK_RPC			42
-#define R8A77961_CLK_RPCD2		43
-#define R8A77961_CLK_MSO			44
-#define R8A77961_CLK_CANFD		45
-#define R8A77961_CLK_HDMI		46
-#define R8A77961_CLK_CSI0		47
-/* CLK_CSIREF was removed */
-#define R8A77961_CLK_CP			49
-#define R8A77961_CLK_CPEX		50
-#define R8A77961_CLK_R			51
-#define R8A77961_CLK_OSC			52
-
-#endif /* __DT_BINDINGS_CLOCK_R8A77961_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a77965-cpg-mssr.h b/include/dt-bindings/clock/r8a77965-cpg-mssr.h
deleted file mode 100644
index 6d3b5a9a6084..000000000000
--- a/include/dt-bindings/clock/r8a77965-cpg-mssr.h
+++ /dev/null
@@ -1,62 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2018 Jacopo Mondi <jacopo+renesas@jmondi.org>
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A77965_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A77965_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a77965 CPG Core Clocks */
-#define R8A77965_CLK_Z			0
-#define R8A77965_CLK_ZR			1
-#define R8A77965_CLK_ZG			2
-#define R8A77965_CLK_ZTR		3
-#define R8A77965_CLK_ZTRD2		4
-#define R8A77965_CLK_ZT			5
-#define R8A77965_CLK_ZX			6
-#define R8A77965_CLK_S0D1		7
-#define R8A77965_CLK_S0D2		8
-#define R8A77965_CLK_S0D3		9
-#define R8A77965_CLK_S0D4		10
-#define R8A77965_CLK_S0D6		11
-#define R8A77965_CLK_S0D8		12
-#define R8A77965_CLK_S0D12		13
-#define R8A77965_CLK_S1D1		14
-#define R8A77965_CLK_S1D2		15
-#define R8A77965_CLK_S1D4		16
-#define R8A77965_CLK_S2D1		17
-#define R8A77965_CLK_S2D2		18
-#define R8A77965_CLK_S2D4		19
-#define R8A77965_CLK_S3D1		20
-#define R8A77965_CLK_S3D2		21
-#define R8A77965_CLK_S3D4		22
-#define R8A77965_CLK_LB			23
-#define R8A77965_CLK_CL			24
-#define R8A77965_CLK_ZB3		25
-#define R8A77965_CLK_ZB3D2		26
-#define R8A77965_CLK_CR			27
-#define R8A77965_CLK_CRD2		28
-#define R8A77965_CLK_SD0H		29
-#define R8A77965_CLK_SD0		30
-#define R8A77965_CLK_SD1H		31
-#define R8A77965_CLK_SD1		32
-#define R8A77965_CLK_SD2H		33
-#define R8A77965_CLK_SD2		34
-#define R8A77965_CLK_SD3H		35
-#define R8A77965_CLK_SD3		36
-#define R8A77965_CLK_SSP2		37
-#define R8A77965_CLK_SSP1		38
-#define R8A77965_CLK_SSPRS		39
-#define R8A77965_CLK_RPC		40
-#define R8A77965_CLK_RPCD2		41
-#define R8A77965_CLK_MSO		42
-#define R8A77965_CLK_CANFD		43
-#define R8A77965_CLK_HDMI		44
-#define R8A77965_CLK_CSI0		45
-#define R8A77965_CLK_CP			46
-#define R8A77965_CLK_CPEX		47
-#define R8A77965_CLK_R			48
-#define R8A77965_CLK_OSC		49
-
-#endif /* __DT_BINDINGS_CLOCK_R8A77965_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a77970-cpg-mssr.h b/include/dt-bindings/clock/r8a77970-cpg-mssr.h
deleted file mode 100644
index 6145ebe66361..000000000000
--- a/include/dt-bindings/clock/r8a77970-cpg-mssr.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+
- *
- * Copyright (C) 2016 Renesas Electronics Corp.
- * Copyright (C) 2017 Cogent Embedded, Inc.
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A77970_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A77970_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a77970 CPG Core Clocks */
-#define R8A77970_CLK_Z2			0
-#define R8A77970_CLK_ZR			1
-#define R8A77970_CLK_ZTR		2
-#define R8A77970_CLK_ZTRD2		3
-#define R8A77970_CLK_ZT			4
-#define R8A77970_CLK_ZX			5
-#define R8A77970_CLK_S1D1		6
-#define R8A77970_CLK_S1D2		7
-#define R8A77970_CLK_S1D4		8
-#define R8A77970_CLK_S2D1		9
-#define R8A77970_CLK_S2D2		10
-#define R8A77970_CLK_S2D4		11
-#define R8A77970_CLK_LB			12
-#define R8A77970_CLK_CL			13
-#define R8A77970_CLK_ZB3		14
-#define R8A77970_CLK_ZB3D2		15
-#define R8A77970_CLK_DDR		16
-#define R8A77970_CLK_CR			17
-#define R8A77970_CLK_CRD2		18
-#define R8A77970_CLK_SD0H		19
-#define R8A77970_CLK_SD0		20
-#define R8A77970_CLK_RPC		21
-#define R8A77970_CLK_RPCD2		22
-#define R8A77970_CLK_MSO		23
-#define R8A77970_CLK_CANFD		24
-#define R8A77970_CLK_CSI0		25
-#define R8A77970_CLK_FRAY		26
-#define R8A77970_CLK_CP			27
-#define R8A77970_CLK_CPEX		28
-#define R8A77970_CLK_R			29
-#define R8A77970_CLK_OSC		30
-
-#endif /* __DT_BINDINGS_CLOCK_R8A77970_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a77980-cpg-mssr.h b/include/dt-bindings/clock/r8a77980-cpg-mssr.h
deleted file mode 100644
index a4c0d76c392e..000000000000
--- a/include/dt-bindings/clock/r8a77980-cpg-mssr.h
+++ /dev/null
@@ -1,51 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Copyright (C) 2018 Renesas Electronics Corp.
- * Copyright (C) 2018 Cogent Embedded, Inc.
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A77980_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A77980_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a77980 CPG Core Clocks */
-#define R8A77980_CLK_Z2			0
-#define R8A77980_CLK_ZR			1
-#define R8A77980_CLK_ZTR		2
-#define R8A77980_CLK_ZTRD2		3
-#define R8A77980_CLK_ZT			4
-#define R8A77980_CLK_ZX			5
-#define R8A77980_CLK_S0D1		6
-#define R8A77980_CLK_S0D2		7
-#define R8A77980_CLK_S0D3		8
-#define R8A77980_CLK_S0D4		9
-#define R8A77980_CLK_S0D6		10
-#define R8A77980_CLK_S0D12		11
-#define R8A77980_CLK_S0D24		12
-#define R8A77980_CLK_S1D1		13
-#define R8A77980_CLK_S1D2		14
-#define R8A77980_CLK_S1D4		15
-#define R8A77980_CLK_S2D1		16
-#define R8A77980_CLK_S2D2		17
-#define R8A77980_CLK_S2D4		18
-#define R8A77980_CLK_S3D1		19
-#define R8A77980_CLK_S3D2		20
-#define R8A77980_CLK_S3D4		21
-#define R8A77980_CLK_LB			22
-#define R8A77980_CLK_CL			23
-#define R8A77980_CLK_ZB3		24
-#define R8A77980_CLK_ZB3D2		25
-#define R8A77980_CLK_ZB3D4		26
-#define R8A77980_CLK_SD0H		27
-#define R8A77980_CLK_SD0		28
-#define R8A77980_CLK_RPC		29
-#define R8A77980_CLK_RPCD2		30
-#define R8A77980_CLK_MSO		31
-#define R8A77980_CLK_CANFD		32
-#define R8A77980_CLK_CSI0		33
-#define R8A77980_CLK_CP			34
-#define R8A77980_CLK_CPEX		35
-#define R8A77980_CLK_R			36
-#define R8A77980_CLK_OSC		37
-
-#endif /* __DT_BINDINGS_CLOCK_R8A77980_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a77990-cpg-mssr.h b/include/dt-bindings/clock/r8a77990-cpg-mssr.h
deleted file mode 100644
index a596a482f3a9..000000000000
--- a/include/dt-bindings/clock/r8a77990-cpg-mssr.h
+++ /dev/null
@@ -1,62 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2018 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A77990_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A77990_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a77990 CPG Core Clocks */
-#define R8A77990_CLK_Z2			0
-#define R8A77990_CLK_ZR			1
-#define R8A77990_CLK_ZG			2
-#define R8A77990_CLK_ZTR		3
-#define R8A77990_CLK_ZT			4
-#define R8A77990_CLK_ZX			5
-#define R8A77990_CLK_S0D1		6
-#define R8A77990_CLK_S0D3		7
-#define R8A77990_CLK_S0D6		8
-#define R8A77990_CLK_S0D12		9
-#define R8A77990_CLK_S0D24		10
-#define R8A77990_CLK_S1D1		11
-#define R8A77990_CLK_S1D2		12
-#define R8A77990_CLK_S1D4		13
-#define R8A77990_CLK_S2D1		14
-#define R8A77990_CLK_S2D2		15
-#define R8A77990_CLK_S2D4		16
-#define R8A77990_CLK_S3D1		17
-#define R8A77990_CLK_S3D2		18
-#define R8A77990_CLK_S3D4		19
-#define R8A77990_CLK_S0D6C		20
-#define R8A77990_CLK_S3D1C		21
-#define R8A77990_CLK_S3D2C		22
-#define R8A77990_CLK_S3D4C		23
-#define R8A77990_CLK_LB			24
-#define R8A77990_CLK_CL			25
-#define R8A77990_CLK_ZB3		26
-#define R8A77990_CLK_ZB3D2		27
-#define R8A77990_CLK_CR			28
-#define R8A77990_CLK_CRD2		29
-#define R8A77990_CLK_SD0H		30
-#define R8A77990_CLK_SD0		31
-#define R8A77990_CLK_SD1H		32
-#define R8A77990_CLK_SD1		33
-#define R8A77990_CLK_SD3H		34
-#define R8A77990_CLK_SD3		35
-#define R8A77990_CLK_RPC		36
-#define R8A77990_CLK_RPCD2		37
-#define R8A77990_CLK_ZA2		38
-#define R8A77990_CLK_ZA8		39
-#define R8A77990_CLK_Z2D		40
-#define R8A77990_CLK_CANFD		41
-#define R8A77990_CLK_MSO		42
-#define R8A77990_CLK_R			43
-#define R8A77990_CLK_OSC		44
-#define R8A77990_CLK_LV0		45
-#define R8A77990_CLK_LV1		46
-#define R8A77990_CLK_CSI0		47
-#define R8A77990_CLK_CP			48
-#define R8A77990_CLK_CPEX		49
-
-#endif /* __DT_BINDINGS_CLOCK_R8A77990_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a77995-cpg-mssr.h b/include/dt-bindings/clock/r8a77995-cpg-mssr.h
deleted file mode 100644
index fd701c4e87cf..000000000000
--- a/include/dt-bindings/clock/r8a77995-cpg-mssr.h
+++ /dev/null
@@ -1,54 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+
- *
- * Copyright (C) 2017 Glider bvba
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A77995_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A77995_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a77995 CPG Core Clocks */
-#define R8A77995_CLK_Z2			0
-#define R8A77995_CLK_ZG			1
-#define R8A77995_CLK_ZTR		2
-#define R8A77995_CLK_ZT			3
-#define R8A77995_CLK_ZX			4
-#define R8A77995_CLK_S0D1		5
-#define R8A77995_CLK_S1D1		6
-#define R8A77995_CLK_S1D2		7
-#define R8A77995_CLK_S1D4		8
-#define R8A77995_CLK_S2D1		9
-#define R8A77995_CLK_S2D2		10
-#define R8A77995_CLK_S2D4		11
-#define R8A77995_CLK_S3D1		12
-#define R8A77995_CLK_S3D2		13
-#define R8A77995_CLK_S3D4		14
-#define R8A77995_CLK_S1D4C		15
-#define R8A77995_CLK_S3D1C		16
-#define R8A77995_CLK_S3D2C		17
-#define R8A77995_CLK_S3D4C		18
-#define R8A77995_CLK_LB			19
-#define R8A77995_CLK_CL			20
-#define R8A77995_CLK_ZB3		21
-#define R8A77995_CLK_ZB3D2		22
-#define R8A77995_CLK_CR			23
-#define R8A77995_CLK_CRD2		24
-#define R8A77995_CLK_SD0H		25
-#define R8A77995_CLK_SD0		26
-/* CLK_SSP2 was removed */
-/* CLK_SSP1 was removed */
-#define R8A77995_CLK_RPC		29
-#define R8A77995_CLK_RPCD2		30
-#define R8A77995_CLK_ZA2		31
-#define R8A77995_CLK_ZA8		32
-#define R8A77995_CLK_Z2D		33
-#define R8A77995_CLK_CANFD		34
-#define R8A77995_CLK_MSO		35
-#define R8A77995_CLK_R			36
-#define R8A77995_CLK_OSC		37
-#define R8A77995_CLK_LV0		38
-#define R8A77995_CLK_LV1		39
-#define R8A77995_CLK_CP			40
-#define R8A77995_CLK_CPEX		41
-
-#endif /* __DT_BINDINGS_CLOCK_R8A77995_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
deleted file mode 100644
index f1d737ca7ca1..000000000000
--- a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
+++ /dev/null
@@ -1,55 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2020 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a779A0 CPG Core Clocks */
-#define R8A779A0_CLK_Z0			0
-#define R8A779A0_CLK_ZX			1
-#define R8A779A0_CLK_Z1			2
-#define R8A779A0_CLK_ZR			3
-#define R8A779A0_CLK_ZS			4
-#define R8A779A0_CLK_ZT			5
-#define R8A779A0_CLK_ZTR		6
-#define R8A779A0_CLK_S1D1		7
-#define R8A779A0_CLK_S1D2		8
-#define R8A779A0_CLK_S1D4		9
-#define R8A779A0_CLK_S1D8		10
-#define R8A779A0_CLK_S1D12		11
-#define R8A779A0_CLK_S3D1		12
-#define R8A779A0_CLK_S3D2		13
-#define R8A779A0_CLK_S3D4		14
-#define R8A779A0_CLK_LB			15
-#define R8A779A0_CLK_CP			16
-#define R8A779A0_CLK_CL			17
-#define R8A779A0_CLK_CL16MCK		18
-#define R8A779A0_CLK_ZB30		19
-#define R8A779A0_CLK_ZB30D2		20
-#define R8A779A0_CLK_ZB30D4		21
-#define R8A779A0_CLK_ZB31		22
-#define R8A779A0_CLK_ZB31D2		23
-#define R8A779A0_CLK_ZB31D4		24
-#define R8A779A0_CLK_SD0H		25
-#define R8A779A0_CLK_SD0		26
-#define R8A779A0_CLK_RPC		27
-#define R8A779A0_CLK_RPCD2		28
-#define R8A779A0_CLK_MSO		29
-#define R8A779A0_CLK_CANFD		30
-#define R8A779A0_CLK_CSI0		31
-#define R8A779A0_CLK_FRAY		32
-#define R8A779A0_CLK_DSI		33
-#define R8A779A0_CLK_VIP		34
-#define R8A779A0_CLK_ADGH		35
-#define R8A779A0_CLK_CNNDSP		36
-#define R8A779A0_CLK_ICU		37
-#define R8A779A0_CLK_ICUD2		38
-#define R8A779A0_CLK_VCBUS		39
-#define R8A779A0_CLK_CBFUSA		40
-#define R8A779A0_CLK_R			41
-#define R8A779A0_CLK_OSC		42
-
-#endif /* __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a779f0-cpg-mssr.h b/include/dt-bindings/clock/r8a779f0-cpg-mssr.h
deleted file mode 100644
index c34be5624954..000000000000
--- a/include/dt-bindings/clock/r8a779f0-cpg-mssr.h
+++ /dev/null
@@ -1,64 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
-/*
- * Copyright (C) 2021 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A779F0_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A779F0_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a779f0 CPG Core Clocks */
-
-#define R8A779F0_CLK_ZX			0
-#define R8A779F0_CLK_ZS			1
-#define R8A779F0_CLK_ZT			2
-#define R8A779F0_CLK_ZTR		3
-#define R8A779F0_CLK_S0D2		4
-#define R8A779F0_CLK_S0D3		5
-#define R8A779F0_CLK_S0D4		6
-#define R8A779F0_CLK_S0D2_MM		7
-#define R8A779F0_CLK_S0D3_MM		8
-#define R8A779F0_CLK_S0D4_MM		9
-#define R8A779F0_CLK_S0D2_RT		10
-#define R8A779F0_CLK_S0D3_RT		11
-#define R8A779F0_CLK_S0D4_RT		12
-#define R8A779F0_CLK_S0D6_RT		13
-#define R8A779F0_CLK_S0D3_PER		14
-#define R8A779F0_CLK_S0D6_PER		15
-#define R8A779F0_CLK_S0D12_PER		16
-#define R8A779F0_CLK_S0D24_PER		17
-#define R8A779F0_CLK_S0D2_HSC		18
-#define R8A779F0_CLK_S0D3_HSC		19
-#define R8A779F0_CLK_S0D4_HSC		20
-#define R8A779F0_CLK_S0D6_HSC		21
-#define R8A779F0_CLK_S0D12_HSC		22
-#define R8A779F0_CLK_S0D2_CC		23
-#define R8A779F0_CLK_CL			24
-#define R8A779F0_CLK_CL16M		25
-#define R8A779F0_CLK_CL16M_MM		26
-#define R8A779F0_CLK_CL16M_RT		27
-#define R8A779F0_CLK_CL16M_PER		28
-#define R8A779F0_CLK_CL16M_HSC		29
-#define R8A779F0_CLK_Z0			30
-#define R8A779F0_CLK_Z1			31
-#define R8A779F0_CLK_ZB3		32
-#define R8A779F0_CLK_ZB3D2		33
-#define R8A779F0_CLK_ZB3D4		34
-#define R8A779F0_CLK_SD0H		35
-#define R8A779F0_CLK_SD0		36
-#define R8A779F0_CLK_RPC		37
-#define R8A779F0_CLK_RPCD2		38
-#define R8A779F0_CLK_MSO		39
-#define R8A779F0_CLK_SASYNCRT		40
-#define R8A779F0_CLK_SASYNCPERD1	41
-#define R8A779F0_CLK_SASYNCPERD2	42
-#define R8A779F0_CLK_SASYNCPERD4	43
-#define R8A779F0_CLK_DBGSOC_HSC		44
-#define R8A779F0_CLK_RSW2		45
-#define R8A779F0_CLK_OSC		46
-#define R8A779F0_CLK_ZR			47
-#define R8A779F0_CLK_CPEX		48
-#define R8A779F0_CLK_CBFUSA		49
-#define R8A779F0_CLK_R			50
-
-#endif /* __DT_BINDINGS_CLOCK_R8A779F0_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r8a779g0-cpg-mssr.h b/include/dt-bindings/clock/r8a779g0-cpg-mssr.h
deleted file mode 100644
index 754c54a6eb06..000000000000
--- a/include/dt-bindings/clock/r8a779g0-cpg-mssr.h
+++ /dev/null
@@ -1,90 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
-/*
- * Copyright (C) 2022 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_CLOCK_R8A779G0_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_R8A779G0_CPG_MSSR_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a779g0 CPG Core Clocks */
-
-#define R8A779G0_CLK_ZX			0
-#define R8A779G0_CLK_ZS			1
-#define R8A779G0_CLK_ZT			2
-#define R8A779G0_CLK_ZTR		3
-#define R8A779G0_CLK_S0D2		4
-#define R8A779G0_CLK_S0D3		5
-#define R8A779G0_CLK_S0D4		6
-#define R8A779G0_CLK_S0D1_VIO		7
-#define R8A779G0_CLK_S0D2_VIO		8
-#define R8A779G0_CLK_S0D4_VIO		9
-#define R8A779G0_CLK_S0D8_VIO		10
-#define R8A779G0_CLK_S0D1_VC		11
-#define R8A779G0_CLK_S0D2_VC		12
-#define R8A779G0_CLK_S0D4_VC		13
-#define R8A779G0_CLK_S0D2_MM		14
-#define R8A779G0_CLK_S0D4_MM		15
-#define R8A779G0_CLK_S0D2_U3DG		16
-#define R8A779G0_CLK_S0D4_U3DG		17
-#define R8A779G0_CLK_S0D2_RT		18
-#define R8A779G0_CLK_S0D3_RT		19
-#define R8A779G0_CLK_S0D4_RT		20
-#define R8A779G0_CLK_S0D6_RT		21
-#define R8A779G0_CLK_S0D24_RT		22
-#define R8A779G0_CLK_S0D2_PER		23
-#define R8A779G0_CLK_S0D3_PER		24
-#define R8A779G0_CLK_S0D4_PER		25
-#define R8A779G0_CLK_S0D6_PER		26
-#define R8A779G0_CLK_S0D12_PER		27
-#define R8A779G0_CLK_S0D24_PER		28
-#define R8A779G0_CLK_S0D1_HSC		29
-#define R8A779G0_CLK_S0D2_HSC		30
-#define R8A779G0_CLK_S0D4_HSC		31
-#define R8A779G0_CLK_S0D2_CC		32
-#define R8A779G0_CLK_SVD1_IR		33
-#define R8A779G0_CLK_SVD2_IR		34
-#define R8A779G0_CLK_SVD1_VIP		35
-#define R8A779G0_CLK_SVD2_VIP		36
-#define R8A779G0_CLK_CL			37
-#define R8A779G0_CLK_CL16M		38
-#define R8A779G0_CLK_CL16M_MM		39
-#define R8A779G0_CLK_CL16M_RT		40
-#define R8A779G0_CLK_CL16M_PER		41
-#define R8A779G0_CLK_CL16M_HSC		42
-#define R8A779G0_CLK_Z0			43
-#define R8A779G0_CLK_ZB3		44
-#define R8A779G0_CLK_ZB3D2		45
-#define R8A779G0_CLK_ZB3D4		46
-#define R8A779G0_CLK_ZG			47
-#define R8A779G0_CLK_SD0H		48
-#define R8A779G0_CLK_SD0		49
-#define R8A779G0_CLK_RPC		50
-#define R8A779G0_CLK_RPCD2		51
-#define R8A779G0_CLK_MSO		52
-#define R8A779G0_CLK_CANFD		53
-#define R8A779G0_CLK_CSI		54
-#define R8A779G0_CLK_FRAY		55
-#define R8A779G0_CLK_IPC		56
-#define R8A779G0_CLK_SASYNCRT		57
-#define R8A779G0_CLK_SASYNCPERD1	58
-#define R8A779G0_CLK_SASYNCPERD2	59
-#define R8A779G0_CLK_SASYNCPERD4	60
-#define R8A779G0_CLK_VIOBUS		61
-#define R8A779G0_CLK_VIOBUSD2		62
-#define R8A779G0_CLK_VCBUS		63
-#define R8A779G0_CLK_VCBUSD2		64
-#define R8A779G0_CLK_DSIEXT		65
-#define R8A779G0_CLK_DSIREF		66
-#define R8A779G0_CLK_ADGH		67
-#define R8A779G0_CLK_OSC		68
-#define R8A779G0_CLK_ZR0		69
-#define R8A779G0_CLK_ZR1		70
-#define R8A779G0_CLK_ZR2		71
-#define R8A779G0_CLK_IMPA		72
-#define R8A779G0_CLK_IMPAD4		73
-#define R8A779G0_CLK_CPEX		74
-#define R8A779G0_CLK_CBFUSA		75
-#define R8A779G0_CLK_R			76
-
-#endif /* __DT_BINDINGS_CLOCK_R8A779G0_CPG_MSSR_H__ */
diff --git a/include/dt-bindings/clock/r9a06g032-sysctrl.h b/include/dt-bindings/clock/r9a06g032-sysctrl.h
deleted file mode 100644
index d9d7b8b4f426..000000000000
--- a/include/dt-bindings/clock/r9a06g032-sysctrl.h
+++ /dev/null
@@ -1,149 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * R9A06G032 sysctrl IDs
- *
- * Copyright (C) 2018 Renesas Electronics Europe Limited
- *
- * Michel Pollet <michel.pollet@bp.renesas.com>, <buserror@gmail.com>
- */
-
-#ifndef __DT_BINDINGS_R9A06G032_SYSCTRL_H__
-#define __DT_BINDINGS_R9A06G032_SYSCTRL_H__
-
-#define R9A06G032_CLK_PLL_USB		1
-#define R9A06G032_CLK_48		1	/* AKA CLK_PLL_USB */
-#define R9A06G032_MSEBIS_CLK		3	/* AKA CLKOUT_D16 */
-#define R9A06G032_MSEBIM_CLK		3	/* AKA CLKOUT_D16 */
-#define R9A06G032_CLK_DDRPHY_PLLCLK	5	/* AKA CLKOUT_D1OR2 */
-#define R9A06G032_CLK50			6	/* AKA CLKOUT_D20 */
-#define R9A06G032_CLK25			7	/* AKA CLKOUT_D40 */
-#define R9A06G032_CLK125		9	/* AKA CLKOUT_D8 */
-#define R9A06G032_CLK_P5_PG1		17	/* AKA DIV_P5_PG */
-#define R9A06G032_CLK_REF_SYNC		21	/* AKA DIV_REF_SYNC */
-#define R9A06G032_CLK_25_PG4		26
-#define R9A06G032_CLK_25_PG5		27
-#define R9A06G032_CLK_25_PG6		28
-#define R9A06G032_CLK_25_PG7		29
-#define R9A06G032_CLK_25_PG8		30
-#define R9A06G032_CLK_ADC		31
-#define R9A06G032_CLK_ECAT100		32
-#define R9A06G032_CLK_HSR100		33
-#define R9A06G032_CLK_I2C0		34
-#define R9A06G032_CLK_I2C1		35
-#define R9A06G032_CLK_MII_REF		36
-#define R9A06G032_CLK_NAND		37
-#define R9A06G032_CLK_NOUSBP2_PG6	38
-#define R9A06G032_CLK_P1_PG2		39
-#define R9A06G032_CLK_P1_PG3		40
-#define R9A06G032_CLK_P1_PG4		41
-#define R9A06G032_CLK_P4_PG3		42
-#define R9A06G032_CLK_P4_PG4		43
-#define R9A06G032_CLK_P6_PG1		44
-#define R9A06G032_CLK_P6_PG2		45
-#define R9A06G032_CLK_P6_PG3		46
-#define R9A06G032_CLK_P6_PG4		47
-#define R9A06G032_CLK_PCI_USB		48
-#define R9A06G032_CLK_QSPI0		49
-#define R9A06G032_CLK_QSPI1		50
-#define R9A06G032_CLK_RGMII_REF		51
-#define R9A06G032_CLK_RMII_REF		52
-#define R9A06G032_CLK_SDIO0		53
-#define R9A06G032_CLK_SDIO1		54
-#define R9A06G032_CLK_SERCOS100		55
-#define R9A06G032_CLK_SLCD		56
-#define R9A06G032_CLK_SPI0		57
-#define R9A06G032_CLK_SPI1		58
-#define R9A06G032_CLK_SPI2		59
-#define R9A06G032_CLK_SPI3		60
-#define R9A06G032_CLK_SPI4		61
-#define R9A06G032_CLK_SPI5		62
-#define R9A06G032_CLK_SWITCH		63
-#define R9A06G032_HCLK_ECAT125		65
-#define R9A06G032_HCLK_PINCONFIG	66
-#define R9A06G032_HCLK_SERCOS		67
-#define R9A06G032_HCLK_SGPIO2		68
-#define R9A06G032_HCLK_SGPIO3		69
-#define R9A06G032_HCLK_SGPIO4		70
-#define R9A06G032_HCLK_TIMER0		71
-#define R9A06G032_HCLK_TIMER1		72
-#define R9A06G032_HCLK_USBF		73
-#define R9A06G032_HCLK_USBH		74
-#define R9A06G032_HCLK_USBPM		75
-#define R9A06G032_CLK_48_PG_F		76
-#define R9A06G032_CLK_48_PG4		77
-#define R9A06G032_CLK_DDRPHY_PCLK	81	/* AKA CLK_REF_SYNC_D4 */
-#define R9A06G032_CLK_FW		81	/* AKA CLK_REF_SYNC_D4 */
-#define R9A06G032_CLK_CRYPTO		81	/* AKA CLK_REF_SYNC_D4 */
-#define R9A06G032_CLK_WATCHDOG		82	/* AKA CLK_REF_SYNC_D8 */
-#define R9A06G032_CLK_A7MP		84	/* AKA DIV_CA7 */
-#define R9A06G032_HCLK_CAN0		85
-#define R9A06G032_HCLK_CAN1		86
-#define R9A06G032_HCLK_DELTASIGMA	87
-#define R9A06G032_HCLK_PWMPTO		88
-#define R9A06G032_HCLK_RSV		89
-#define R9A06G032_HCLK_SGPIO0		90
-#define R9A06G032_HCLK_SGPIO1		91
-#define R9A06G032_RTOS_MDC		92
-#define R9A06G032_CLK_CM3		93
-#define R9A06G032_CLK_DDRC		94
-#define R9A06G032_CLK_ECAT25		95
-#define R9A06G032_CLK_HSR50		96
-#define R9A06G032_CLK_HW_RTOS		97
-#define R9A06G032_CLK_SERCOS50		98
-#define R9A06G032_HCLK_ADC		99
-#define R9A06G032_HCLK_CM3		100
-#define R9A06G032_HCLK_CRYPTO_EIP150	101
-#define R9A06G032_HCLK_CRYPTO_EIP93	102
-#define R9A06G032_HCLK_DDRC		103
-#define R9A06G032_HCLK_DMA0		104
-#define R9A06G032_HCLK_DMA1		105
-#define R9A06G032_HCLK_GMAC0		106
-#define R9A06G032_HCLK_GMAC1		107
-#define R9A06G032_HCLK_GPIO0		108
-#define R9A06G032_HCLK_GPIO1		109
-#define R9A06G032_HCLK_GPIO2		110
-#define R9A06G032_HCLK_HSR		111
-#define R9A06G032_HCLK_I2C0		112
-#define R9A06G032_HCLK_I2C1		113
-#define R9A06G032_HCLK_LCD		114
-#define R9A06G032_HCLK_MSEBI_M		115
-#define R9A06G032_HCLK_MSEBI_S		116
-#define R9A06G032_HCLK_NAND		117
-#define R9A06G032_HCLK_PG_I		118
-#define R9A06G032_HCLK_PG19		119
-#define R9A06G032_HCLK_PG20		120
-#define R9A06G032_HCLK_PG3		121
-#define R9A06G032_HCLK_PG4		122
-#define R9A06G032_HCLK_QSPI0		123
-#define R9A06G032_HCLK_QSPI1		124
-#define R9A06G032_HCLK_ROM		125
-#define R9A06G032_HCLK_RTC		126
-#define R9A06G032_HCLK_SDIO0		127
-#define R9A06G032_HCLK_SDIO1		128
-#define R9A06G032_HCLK_SEMAP		129
-#define R9A06G032_HCLK_SPI0		130
-#define R9A06G032_HCLK_SPI1		131
-#define R9A06G032_HCLK_SPI2		132
-#define R9A06G032_HCLK_SPI3		133
-#define R9A06G032_HCLK_SPI4		134
-#define R9A06G032_HCLK_SPI5		135
-#define R9A06G032_HCLK_SWITCH		136
-#define R9A06G032_HCLK_SWITCH_RG	137
-#define R9A06G032_HCLK_UART0		138
-#define R9A06G032_HCLK_UART1		139
-#define R9A06G032_HCLK_UART2		140
-#define R9A06G032_HCLK_UART3		141
-#define R9A06G032_HCLK_UART4		142
-#define R9A06G032_HCLK_UART5		143
-#define R9A06G032_HCLK_UART6		144
-#define R9A06G032_HCLK_UART7		145
-#define R9A06G032_CLK_UART0		146
-#define R9A06G032_CLK_UART1		147
-#define R9A06G032_CLK_UART2		148
-#define R9A06G032_CLK_UART3		149
-#define R9A06G032_CLK_UART4		150
-#define R9A06G032_CLK_UART5		151
-#define R9A06G032_CLK_UART6		152
-#define R9A06G032_CLK_UART7		153
-
-#endif /* __DT_BINDINGS_R9A06G032_SYSCTRL_H__ */
diff --git a/include/dt-bindings/clock/r9a07g044-cpg.h b/include/dt-bindings/clock/r9a07g044-cpg.h
deleted file mode 100644
index 0bb17ff1a01a..000000000000
--- a/include/dt-bindings/clock/r9a07g044-cpg.h
+++ /dev/null
@@ -1,220 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
- *
- * Copyright (C) 2021 Renesas Electronics Corp.
- */
-#ifndef __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__
-#define __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__
-
-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* R9A07G044 CPG Core Clocks */
-#define R9A07G044_CLK_I			0
-#define R9A07G044_CLK_I2		1
-#define R9A07G044_CLK_G			2
-#define R9A07G044_CLK_S0		3
-#define R9A07G044_CLK_S1		4
-#define R9A07G044_CLK_SPI0		5
-#define R9A07G044_CLK_SPI1		6
-#define R9A07G044_CLK_SD0		7
-#define R9A07G044_CLK_SD1		8
-#define R9A07G044_CLK_M0		9
-#define R9A07G044_CLK_M1		10
-#define R9A07G044_CLK_M2		11
-#define R9A07G044_CLK_M3		12
-#define R9A07G044_CLK_M4		13
-#define R9A07G044_CLK_HP		14
-#define R9A07G044_CLK_TSU		15
-#define R9A07G044_CLK_ZT		16
-#define R9A07G044_CLK_P0		17
-#define R9A07G044_CLK_P1		18
-#define R9A07G044_CLK_P2		19
-#define R9A07G044_CLK_AT		20
-#define R9A07G044_OSCCLK		21
-#define R9A07G044_CLK_P0_DIV2		22
-
-/* R9A07G044 Module Clocks */
-#define R9A07G044_CA55_SCLK		0
-#define R9A07G044_CA55_PCLK		1
-#define R9A07G044_CA55_ATCLK		2
-#define R9A07G044_CA55_GICCLK		3
-#define R9A07G044_CA55_PERICLK		4
-#define R9A07G044_CA55_ACLK		5
-#define R9A07G044_CA55_TSCLK		6
-#define R9A07G044_GIC600_GICCLK		7
-#define R9A07G044_IA55_CLK		8
-#define R9A07G044_IA55_PCLK		9
-#define R9A07G044_MHU_PCLK		10
-#define R9A07G044_SYC_CNT_CLK		11
-#define R9A07G044_DMAC_ACLK		12
-#define R9A07G044_DMAC_PCLK		13
-#define R9A07G044_OSTM0_PCLK		14
-#define R9A07G044_OSTM1_PCLK		15
-#define R9A07G044_OSTM2_PCLK		16
-#define R9A07G044_MTU_X_MCK_MTU3	17
-#define R9A07G044_POE3_CLKM_POE		18
-#define R9A07G044_GPT_PCLK		19
-#define R9A07G044_POEG_A_CLKP		20
-#define R9A07G044_POEG_B_CLKP		21
-#define R9A07G044_POEG_C_CLKP		22
-#define R9A07G044_POEG_D_CLKP		23
-#define R9A07G044_WDT0_PCLK		24
-#define R9A07G044_WDT0_CLK		25
-#define R9A07G044_WDT1_PCLK		26
-#define R9A07G044_WDT1_CLK		27
-#define R9A07G044_WDT2_PCLK		28
-#define R9A07G044_WDT2_CLK		29
-#define R9A07G044_SPI_CLK2		30
-#define R9A07G044_SPI_CLK		31
-#define R9A07G044_SDHI0_IMCLK		32
-#define R9A07G044_SDHI0_IMCLK2		33
-#define R9A07G044_SDHI0_CLK_HS		34
-#define R9A07G044_SDHI0_ACLK		35
-#define R9A07G044_SDHI1_IMCLK		36
-#define R9A07G044_SDHI1_IMCLK2		37
-#define R9A07G044_SDHI1_CLK_HS		38
-#define R9A07G044_SDHI1_ACLK		39
-#define R9A07G044_GPU_CLK		40
-#define R9A07G044_GPU_AXI_CLK		41
-#define R9A07G044_GPU_ACE_CLK		42
-#define R9A07G044_ISU_ACLK		43
-#define R9A07G044_ISU_PCLK		44
-#define R9A07G044_H264_CLK_A		45
-#define R9A07G044_H264_CLK_P		46
-#define R9A07G044_CRU_SYSCLK		47
-#define R9A07G044_CRU_VCLK		48
-#define R9A07G044_CRU_PCLK		49
-#define R9A07G044_CRU_ACLK		50
-#define R9A07G044_MIPI_DSI_PLLCLK	51
-#define R9A07G044_MIPI_DSI_SYSCLK	52
-#define R9A07G044_MIPI_DSI_ACLK		53
-#define R9A07G044_MIPI_DSI_PCLK		54
-#define R9A07G044_MIPI_DSI_VCLK		55
-#define R9A07G044_MIPI_DSI_LPCLK	56
-#define R9A07G044_LCDC_CLK_A		57
-#define R9A07G044_LCDC_CLK_P		58
-#define R9A07G044_LCDC_CLK_D		59
-#define R9A07G044_SSI0_PCLK2		60
-#define R9A07G044_SSI0_PCLK_SFR		61
-#define R9A07G044_SSI1_PCLK2		62
-#define R9A07G044_SSI1_PCLK_SFR		63
-#define R9A07G044_SSI2_PCLK2		64
-#define R9A07G044_SSI2_PCLK_SFR		65
-#define R9A07G044_SSI3_PCLK2		66
-#define R9A07G044_SSI3_PCLK_SFR		67
-#define R9A07G044_SRC_CLKP		68
-#define R9A07G044_USB_U2H0_HCLK		69
-#define R9A07G044_USB_U2H1_HCLK		70
-#define R9A07G044_USB_U2P_EXR_CPUCLK	71
-#define R9A07G044_USB_PCLK		72
-#define R9A07G044_ETH0_CLK_AXI		73
-#define R9A07G044_ETH0_CLK_CHI		74
-#define R9A07G044_ETH1_CLK_AXI		75
-#define R9A07G044_ETH1_CLK_CHI		76
-#define R9A07G044_I2C0_PCLK		77
-#define R9A07G044_I2C1_PCLK		78
-#define R9A07G044_I2C2_PCLK		79
-#define R9A07G044_I2C3_PCLK		80
-#define R9A07G044_SCIF0_CLK_PCK		81
-#define R9A07G044_SCIF1_CLK_PCK		82
-#define R9A07G044_SCIF2_CLK_PCK		83
-#define R9A07G044_SCIF3_CLK_PCK		84
-#define R9A07G044_SCIF4_CLK_PCK		85
-#define R9A07G044_SCI0_CLKP		86
-#define R9A07G044_SCI1_CLKP		87
-#define R9A07G044_IRDA_CLKP		88
-#define R9A07G044_RSPI0_CLKB		89
-#define R9A07G044_RSPI1_CLKB		90
-#define R9A07G044_RSPI2_CLKB		91
-#define R9A07G044_CANFD_PCLK		92
-#define R9A07G044_GPIO_HCLK		93
-#define R9A07G044_ADC_ADCLK		94
-#define R9A07G044_ADC_PCLK		95
-#define R9A07G044_TSU_PCLK		96
-
-/* R9A07G044 Resets */
-#define R9A07G044_CA55_RST_1_0		0
-#define R9A07G044_CA55_RST_1_1		1
-#define R9A07G044_CA55_RST_3_0		2
-#define R9A07G044_CA55_RST_3_1		3
-#define R9A07G044_CA55_RST_4		4
-#define R9A07G044_CA55_RST_5		5
-#define R9A07G044_CA55_RST_6		6
-#define R9A07G044_CA55_RST_7		7
-#define R9A07G044_CA55_RST_8		8
-#define R9A07G044_CA55_RST_9		9
-#define R9A07G044_CA55_RST_10		10
-#define R9A07G044_CA55_RST_11		11
-#define R9A07G044_CA55_RST_12		12
-#define R9A07G044_GIC600_GICRESET_N	13
-#define R9A07G044_GIC600_DBG_GICRESET_N	14
-#define R9A07G044_IA55_RESETN		15
-#define R9A07G044_MHU_RESETN		16
-#define R9A07G044_DMAC_ARESETN		17
-#define R9A07G044_DMAC_RST_ASYNC	18
-#define R9A07G044_SYC_RESETN		19
-#define R9A07G044_OSTM0_PRESETZ		20
-#define R9A07G044_OSTM1_PRESETZ		21
-#define R9A07G044_OSTM2_PRESETZ		22
-#define R9A07G044_MTU_X_PRESET_MTU3	23
-#define R9A07G044_POE3_RST_M_REG	24
-#define R9A07G044_GPT_RST_C		25
-#define R9A07G044_POEG_A_RST		26
-#define R9A07G044_POEG_B_RST		27
-#define R9A07G044_POEG_C_RST		28
-#define R9A07G044_POEG_D_RST		29
-#define R9A07G044_WDT0_PRESETN		30
-#define R9A07G044_WDT1_PRESETN		31
-#define R9A07G044_WDT2_PRESETN		32
-#define R9A07G044_SPI_RST		33
-#define R9A07G044_SDHI0_IXRST		34
-#define R9A07G044_SDHI1_IXRST		35
-#define R9A07G044_GPU_RESETN		36
-#define R9A07G044_GPU_AXI_RESETN	37
-#define R9A07G044_GPU_ACE_RESETN	38
-#define R9A07G044_ISU_ARESETN		39
-#define R9A07G044_ISU_PRESETN		40
-#define R9A07G044_H264_X_RESET_VCP	41
-#define R9A07G044_H264_CP_PRESET_P	42
-#define R9A07G044_CRU_CMN_RSTB		43
-#define R9A07G044_CRU_PRESETN		44
-#define R9A07G044_CRU_ARESETN		45
-#define R9A07G044_MIPI_DSI_CMN_RSTB	46
-#define R9A07G044_MIPI_DSI_ARESET_N	47
-#define R9A07G044_MIPI_DSI_PRESET_N	48
-#define R9A07G044_LCDC_RESET_N		49
-#define R9A07G044_SSI0_RST_M2_REG	50
-#define R9A07G044_SSI1_RST_M2_REG	51
-#define R9A07G044_SSI2_RST_M2_REG	52
-#define R9A07G044_SSI3_RST_M2_REG	53
-#define R9A07G044_SRC_RST		54
-#define R9A07G044_USB_U2H0_HRESETN	55
-#define R9A07G044_USB_U2H1_HRESETN	56
-#define R9A07G044_USB_U2P_EXL_SYSRST	57
-#define R9A07G044_USB_PRESETN		58
-#define R9A07G044_ETH0_RST_HW_N		59
-#define R9A07G044_ETH1_RST_HW_N		60
-#define R9A07G044_I2C0_MRST		61
-#define R9A07G044_I2C1_MRST		62
-#define R9A07G044_I2C2_MRST		63
-#define R9A07G044_I2C3_MRST		64
-#define R9A07G044_SCIF0_RST_SYSTEM_N	65
-#define R9A07G044_SCIF1_RST_SYSTEM_N	66
-#define R9A07G044_SCIF2_RST_SYSTEM_N	67
-#define R9A07G044_SCIF3_RST_SYSTEM_N	68
-#define R9A07G044_SCIF4_RST_SYSTEM_N	69
-#define R9A07G044_SCI0_RST		70
-#define R9A07G044_SCI1_RST		71
-#define R9A07G044_IRDA_RST		72
-#define R9A07G044_RSPI0_RST		73
-#define R9A07G044_RSPI1_RST		74
-#define R9A07G044_RSPI2_RST		75
-#define R9A07G044_CANFD_RSTP_N		76
-#define R9A07G044_CANFD_RSTC_N		77
-#define R9A07G044_GPIO_RSTN		78
-#define R9A07G044_GPIO_PORT_RESETN	79
-#define R9A07G044_GPIO_SPARE_RESETN	80
-#define R9A07G044_ADC_PRESETN		81
-#define R9A07G044_ADC_ADRST_N		82
-#define R9A07G044_TSU_PRESETN		83
-
-#endif /* __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas-cpg-mssr.h b/include/dt-bindings/clock/renesas-cpg-mssr.h
deleted file mode 100644
index 569a3cc33ffb..000000000000
--- a/include/dt-bindings/clock/renesas-cpg-mssr.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/*
- * Copyright (C) 2015 Renesas Electronics Corp.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
-#ifndef __DT_BINDINGS_CLOCK_RENESAS_CPG_MSSR_H__
-#define __DT_BINDINGS_CLOCK_RENESAS_CPG_MSSR_H__
-
-#define CPG_CORE			0	/* Core Clock */
-#define CPG_MOD				1	/* Module Clock */
-
-#endif /* __DT_BINDINGS_CLOCK_RENESAS_CPG_MSSR_H__ */

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
