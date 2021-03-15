Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 137EA33C447
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Mar 2021 18:33:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CED75C57B5A;
	Mon, 15 Mar 2021 17:33:52 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07910C57B55
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 17:33:52 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id c17so3445955pfv.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 10:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2alwYsCLSbgRJTMQhSbuA7l9cHny3FadA8wHfPLCS94=;
 b=Lmt073UU0cHEmbzZC4vlF8cFrCfCHgmt+CVE+67L/+mkcH60qMjqn1edMZ0656Jfnn
 xKFzhZv3s4NfiBROX3STO3nu8OR+vpk9Std5fz4NZ7uPM+Q7BE7pKryLF2IdYm1WaCdD
 6pNXsgeIQLbft2zYoM1IqjaSgHeGXqswC8+TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2alwYsCLSbgRJTMQhSbuA7l9cHny3FadA8wHfPLCS94=;
 b=YwL/2zgYXu0TmPsaRdKzUGc73yqAUSl4nr7Dq/rk0JQkmtdj01Ce8y++fW3CiU7Wdh
 JbKXFGZ+8sgxCVR4KFsGdRpLGFIykVlkIuvxrcBM09IqWPvfrMxjGrRnO8c1hSCKB9cy
 8Dlaz6e6We3lEvuOx0yJVjOx5XQRNenMnULSrRNIhTbiYVXhIb4ClPQqd0uJN5yLDzm3
 K7O5ArHteJYxWkoXoPK0pkRijsXticWVwI7Yar9SPtjaboqR49b5irL9jfM9XR/bTu/2
 RK47f4H/1RI5+LupNkFLQVhfjYXyThCdRmu4zN3ra2hWeqZEWlGe/VCBVXZWKO3TrdMX
 goEA==
X-Gm-Message-State: AOAM531KJupavkJYvVT7KUTSLGNvn2z+gyw+EAO+SfNGcUNsOmFYv4tJ
 6Ww9ZPccdJjKxijnGNvZNOGnDvxVPILs8g+/
X-Google-Smtp-Source: ABdhPJyvItvxiBeC+m9qeJ6aVSdHkxOAaiGiklVmlYuREstJhGswOyp068fKnrK7cSV9GUQs2FfeGg==
X-Received: by 2002:aa7:9081:0:b029:1f9:26c9:1609 with SMTP id
 i1-20020aa790810000b02901f926c91609mr25292260pfa.54.1615829630626; 
 Mon, 15 Mar 2021 10:33:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:6f76:4267:118b:2085])
 by smtp.gmail.com with ESMTPSA id y17sm227500pju.50.2021.03.15.10.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:33:50 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Mon, 15 Mar 2021 23:02:54 +0530
Message-Id: <20210315173256.103731-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315173256.103731-1-jagan@amarulasolutions.com>
References: <20210315173256.103731-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v2 7/9] ARM: dts: stm32: Add Engicam MicroGEA
	STM32MP1 1X4Gb DDR3
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

Engicam MicroGEA STM32MP1 Micro SOM has mounted 1x4Gb DDR3
which has 16bits width 533Mhz frequency.

Add DDR configurations via dtsi.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- collect Patrice r-b

 ...m32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi

diff --git a/arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi
new file mode 100644
index 0000000000..950f292abb
--- /dev/null
+++ b/arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
+ *
+ * STM32MP157C DK1/DK2 BOARD configuration
+ * 1x DDR3L 4Gb, 16-bit, 533MHz.
+ * Reference used NT5CC256M16DP-DI from NANYA
+ *
+ * DDR type / Platform	DDR3/3L
+ * freq		533MHz
+ * width	16
+ * datasheet	0  = MT41J256M16-187 / DDR3-1066 bin G
+ * DDR density	4
+ * timing mode	optimized
+ * Scheduling/QoS options : type = 2
+ * address mapping : RBC
+ * Tc > + 85C : N
+ */
+#define DDR_MEM_COMPATIBLE ddr3-microgea-1066-888-bin-g-1x4gb-533mhz
+#define DDR_MEM_NAME "DDR3-1066/888 bin G 1x4Gb 533MHz v1.45"
+#define DDR_MEM_SPEED 533000
+#define DDR_MEM_SIZE 0x20000000
+
+#define DDR_MSTR 0x00041401
+#define DDR_MRCTRL0 0x00000010
+#define DDR_MRCTRL1 0x00000000
+#define DDR_DERATEEN 0x00000000
+#define DDR_DERATEINT 0x00800000
+#define DDR_PWRCTL 0x00000000
+#define DDR_PWRTMG 0x00400010
+#define DDR_HWLPCTL 0x00000000
+#define DDR_RFSHCTL0 0x00210000
+#define DDR_RFSHCTL3 0x00000000
+#define DDR_RFSHTMG 0x0081008B
+#define DDR_CRCPARCTL0 0x00000000
+#define DDR_DRAMTMG0 0x121B2414
+#define DDR_DRAMTMG1 0x000A041C
+#define DDR_DRAMTMG2 0x0608090F
+#define DDR_DRAMTMG3 0x0050400C
+#define DDR_DRAMTMG4 0x08040608
+#define DDR_DRAMTMG5 0x06060403
+#define DDR_DRAMTMG6 0x02020002
+#define DDR_DRAMTMG7 0x00000202
+#define DDR_DRAMTMG8 0x00001005
+#define DDR_DRAMTMG14 0x000000A0
+#define DDR_ZQCTL0 0xC2000040
+#define DDR_DFITMG0 0x02060105
+#define DDR_DFITMG1 0x00000202
+#define DDR_DFILPCFG0 0x07000000
+#define DDR_DFIUPD0 0xC0400003
+#define DDR_DFIUPD1 0x00000000
+#define DDR_DFIUPD2 0x00000000
+#define DDR_DFIPHYMSTR 0x00000000
+#define DDR_ADDRMAP1 0x00070707
+#define DDR_ADDRMAP2 0x00000000
+#define DDR_ADDRMAP3 0x1F000000
+#define DDR_ADDRMAP4 0x00001F1F
+#define DDR_ADDRMAP5 0x06060606
+#define DDR_ADDRMAP6 0x0F060606
+#define DDR_ADDRMAP9 0x00000000
+#define DDR_ADDRMAP10 0x00000000
+#define DDR_ADDRMAP11 0x00000000
+#define DDR_ODTCFG 0x06000600
+#define DDR_ODTMAP 0x00000001
+#define DDR_SCHED 0x00000C01
+#define DDR_SCHED1 0x00000000
+#define DDR_PERFHPR1 0x01000001
+#define DDR_PERFLPR1 0x08000200
+#define DDR_PERFWR1 0x08000400
+#define DDR_DBG0 0x00000000
+#define DDR_DBG1 0x00000000
+#define DDR_DBGCMD 0x00000000
+#define DDR_POISONCFG 0x00000000
+#define DDR_PCCFG 0x00000010
+#define DDR_PCFGR_0 0x00010000
+#define DDR_PCFGW_0 0x00000000
+#define DDR_PCFGQOS0_0 0x02100C03
+#define DDR_PCFGQOS1_0 0x00800100
+#define DDR_PCFGWQOS0_0 0x01100C03
+#define DDR_PCFGWQOS1_0 0x01000200
+#define DDR_PCFGR_1 0x00010000
+#define DDR_PCFGW_1 0x00000000
+#define DDR_PCFGQOS0_1 0x02100C03
+#define DDR_PCFGQOS1_1 0x00800040
+#define DDR_PCFGWQOS0_1 0x01100C03
+#define DDR_PCFGWQOS1_1 0x01000200
+#define DDR_PGCR 0x01442E02
+#define DDR_PTR0 0x0022AA5B
+#define DDR_PTR1 0x04841104
+#define DDR_PTR2 0x042DA068
+#define DDR_ACIOCR 0x10400812
+#define DDR_DXCCR 0x00000C40
+#define DDR_DSGCR 0xF200011F
+#define DDR_DCR 0x0000000B
+#define DDR_DTPR0 0x38D488D0
+#define DDR_DTPR1 0x098B00D8
+#define DDR_DTPR2 0x10023600
+#define DDR_MR0 0x00000840
+#define DDR_MR1 0x00000000
+#define DDR_MR2 0x00000208
+#define DDR_MR3 0x00000000
+#define DDR_ODTCR 0x00010000
+#define DDR_ZQ0CR1 0x00000038
+#define DDR_DX0GCR 0x0000CE81
+#define DDR_DX0DLLCR 0x40000000
+#define DDR_DX0DQTR 0xFFFFFFFF
+#define DDR_DX0DQSTR 0x3DB02000
+#define DDR_DX1GCR 0x0000CE81
+#define DDR_DX1DLLCR 0x40000000
+#define DDR_DX1DQTR 0xFFFFFFFF
+#define DDR_DX1DQSTR 0x3DB02000
+#define DDR_DX2GCR 0x0000CE80
+#define DDR_DX2DLLCR 0x40000000
+#define DDR_DX2DQTR 0xFFFFFFFF
+#define DDR_DX2DQSTR 0x3DB02000
+#define DDR_DX3GCR 0x0000CE80
+#define DDR_DX3DLLCR 0x40000000
+#define DDR_DX3DQTR 0xFFFFFFFF
+#define DDR_DX3DQSTR 0x3DB02000
+
+#include "stm32mp15-ddr.dtsi"
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
