Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7A9AD0C3F
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jun 2025 11:37:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8522C36B2A;
	Sat,  7 Jun 2025 09:37:44 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EE82C36B1F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jun 2025 09:37:44 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ade33027bcfso124164466b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Jun 2025 02:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749289064; x=1749893864;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9NO5t2sCjJwDY57c4qoGlRa7h3BkXE9AaZMo2w9AJr4=;
 b=cb15j46HKZxVHP6iPAE67ZULXVVSWujC547suxzrt+ysJ9qw27gsHgl+QbZ5hgzqL/
 /SMEmgF+WMWNRls30Mvj5pzFZcYqqR3rFULx65EpFm1AQDHWPTG1fspeE2ZbEH7/GV7w
 03eEUGL8HauiS3PcBqCsyIbmM6jZ+wkHRTOfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749289064; x=1749893864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9NO5t2sCjJwDY57c4qoGlRa7h3BkXE9AaZMo2w9AJr4=;
 b=hxMjVj98ruICCVYcrRXtFpJh1Aa98llKT/Dkue5bsm4StFwl74yDai9aq/ZerbaugD
 WaOvcmcn5VltGlI7+dT5geVjWd9aUUUPDcgxv4qRuRVa5jYKSQMz677ANuQou0sEvVOe
 TiMpZScx27ma+yY6kiOWcnKH+Ue+8Nf80OU3LVGKMozwXNQ894sf6Nx/XJs3Q/qLb8Sa
 OraTpYlwERObdLwbzZKkARplxgWuxT+l7tvZ6tMpEJRPNoZp8m6YUhkATj74ung9JbVE
 /Le78x3dwqbETBRnRPePcnzOEDfwVQw2vlapomFCVGSeV44LIsio2x0FKybBfk12WNpW
 Pb5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL+IrnQe0BnvCwQQPEwjCdBC1/RBbO2wTXBDwl4HWQczGSb12+j8ALBWo5fPuoAHBXA+jSbnFoqKQxQQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzrVQHzTFK2KYuPLj7jzWSS67sOPodu1+FWKUu9QgWc3eBBAWRm
 /YGxYX2k+7KVWG+9ZJ8NBlhf1oZe7sgP9bTZ1IOTzw1tdQTLq1hEChLEkcQTmb+G7Y4kFeGI/F6
 vEdMa
X-Gm-Gg: ASbGncttgxEEghg3d3CYj9c4LSxcZO8+prgiihzRIA0aA/D3r1MlLIPyjQvEnVk8FXL
 pieQBUHhh9zPthvrnGPhQydd6hIOBzPn2LFK474rEZNv8ERbdIMTrzxl/vGOHA/5tFR4DGP3GuG
 rEDt3zssjFOuVzTKBBoyuAQMlb83uH1wX9N3tZ7d0aK0KIr3h23Uz8e7gzmHkMKP22My6Y3Jiww
 LH1gAqZPY/uHG0nRnUVtRh3yvYUrPGsCmOCBwHFUrcD2Qen64LJDdVbWEYYf+PjyBRYG0DiAmoH
 rplVUVV1qR0lTpJqUKtsRAYlR8v1fuzYStH2sWc/NB+ES6MoKXolifGaBJBXR8L7urVFOVf35zK
 IEyCx1UcWrcL1/BsEvFuMuU0i/3vHy22yWlFkw/j1RgV9XJ47cF1Tj5wkQMoAUqkHGDAovCEdKt
 OdjaazGt+2WKSZ
X-Google-Smtp-Source: AGHT+IEBowOeC9/dzflnqZN5u8XfRgr21rHywOKJFUnkT3+WO4E5ova2jAJIOXk6cSoELUV6dlioAg==
X-Received: by 2002:a17:906:4794:b0:ad5:372d:87e3 with SMTP id
 a640c23a62f3a-ade1aa157fcmr606984566b.27.1749289063562; 
 Sat, 07 Jun 2025 02:37:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc38cffsm246524966b.124.2025.06.07.02.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 02:37:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat,  7 Jun 2025 11:37:16 +0200
Message-ID: <20250607093730.2249536-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, linux-amarula@amarulasolutions.com,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH 8/9] ARM: dts: stm32: add
	stm32h747i-disco-u-boot DTS file
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

Add stm32h747i-disco-u-boot DTS file with FMC SDRAM node and its
pinmux settings.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/dts/stm32h747i-disco-u-boot.dtsi | 104 ++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 arch/arm/dts/stm32h747i-disco-u-boot.dtsi

diff --git a/arch/arm/dts/stm32h747i-disco-u-boot.dtsi b/arch/arm/dts/stm32h747i-disco-u-boot.dtsi
new file mode 100644
index 000000000000..ff297cc91fa8
--- /dev/null
+++ b/arch/arm/dts/stm32h747i-disco-u-boot.dtsi
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include <stm32h7-u-boot.dtsi>
+
+&fmc {
+
+	/*
+	 * Memory configuration from sdram datasheet IS42S32800G-6BLI
+	 * first bank is bank@0
+	 * second bank is bank@1
+	 */
+	bank1: bank@1 {
+		st,sdram-control = /bits/ 8 <NO_COL_9
+					     NO_ROW_12
+					     MWIDTH_32
+					     BANKS_4
+					     CAS_2
+					     SDCLK_3
+					     RD_BURST_EN
+					     RD_PIPE_DL_0>;
+		st,sdram-timing = /bits/ 8 <TMRD_1
+					    TXSR_1
+					    TRAS_1
+					    TRC_6
+					    TRP_2
+					    TWR_1
+					    TRCD_1>;
+		st,sdram-refcount = <1539>;
+	};
+};
+
+&pinctrl {
+	fmc_pins: fmc@0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 0, AF12)>,
+				 <STM32_PINMUX('D', 1, AF12)>,
+				 <STM32_PINMUX('D', 8, AF12)>,
+				 <STM32_PINMUX('D', 9, AF12)>,
+				 <STM32_PINMUX('D',10, AF12)>,
+				 <STM32_PINMUX('D',14, AF12)>,
+				 <STM32_PINMUX('D',15, AF12)>,
+
+				 <STM32_PINMUX('E', 0, AF12)>,
+				 <STM32_PINMUX('E', 1, AF12)>,
+				 <STM32_PINMUX('E', 7, AF12)>,
+				 <STM32_PINMUX('E', 8, AF12)>,
+				 <STM32_PINMUX('E', 9, AF12)>,
+				 <STM32_PINMUX('E',10, AF12)>,
+				 <STM32_PINMUX('E',11, AF12)>,
+				 <STM32_PINMUX('E',12, AF12)>,
+				 <STM32_PINMUX('E',13, AF12)>,
+				 <STM32_PINMUX('E',14, AF12)>,
+				 <STM32_PINMUX('E',15, AF12)>,
+
+				 <STM32_PINMUX('F', 0, AF12)>,
+				 <STM32_PINMUX('F', 1, AF12)>,
+				 <STM32_PINMUX('F', 2, AF12)>,
+				 <STM32_PINMUX('F', 3, AF12)>,
+				 <STM32_PINMUX('F', 4, AF12)>,
+				 <STM32_PINMUX('F', 5, AF12)>,
+				 <STM32_PINMUX('F',11, AF12)>,
+				 <STM32_PINMUX('F',12, AF12)>,
+				 <STM32_PINMUX('F',13, AF12)>,
+				 <STM32_PINMUX('F',14, AF12)>,
+				 <STM32_PINMUX('F',15, AF12)>,
+
+				 <STM32_PINMUX('G', 0, AF12)>,
+				 <STM32_PINMUX('G', 1, AF12)>,
+				 <STM32_PINMUX('G', 2, AF12)>,
+				 <STM32_PINMUX('G', 4, AF12)>,
+				 <STM32_PINMUX('G', 5, AF12)>,
+				 <STM32_PINMUX('G', 8, AF12)>,
+				 <STM32_PINMUX('G',15, AF12)>,
+
+				 <STM32_PINMUX('H', 5, AF12)>,
+				 <STM32_PINMUX('H', 6, AF12)>,
+				 <STM32_PINMUX('H', 7, AF12)>,
+				 <STM32_PINMUX('H', 8, AF12)>,
+				 <STM32_PINMUX('H', 9, AF12)>,
+				 <STM32_PINMUX('H',10, AF12)>,
+				 <STM32_PINMUX('H',11, AF12)>,
+				 <STM32_PINMUX('H',12, AF12)>,
+				 <STM32_PINMUX('H',13, AF12)>,
+				 <STM32_PINMUX('H',14, AF12)>,
+				 <STM32_PINMUX('H',15, AF12)>,
+
+				 <STM32_PINMUX('I', 0, AF12)>,
+				 <STM32_PINMUX('I', 1, AF12)>,
+				 <STM32_PINMUX('I', 2, AF12)>,
+				 <STM32_PINMUX('I', 3, AF12)>,
+				 <STM32_PINMUX('I', 4, AF12)>,
+				 <STM32_PINMUX('I', 5, AF12)>,
+				 <STM32_PINMUX('I', 6, AF12)>,
+				 <STM32_PINMUX('I', 7, AF12)>,
+				 <STM32_PINMUX('I', 9, AF12)>,
+				 <STM32_PINMUX('I',10, AF12)>;
+
+			slew-rate = <3>;
+		};
+	};
+};
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
