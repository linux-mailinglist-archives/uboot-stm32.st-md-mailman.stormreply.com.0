Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E596327336
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Feb 2021 16:52:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16C7CC56630;
	Sun, 28 Feb 2021 15:52:50 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 537A3C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 15:52:49 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id g4so9856898pgj.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 07:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DWqgfqbLVgHqU6apJZOTbbN6y2V5rG2g5kjCKlk1Qak=;
 b=U1onbdqOXSYsU+q6/JocXDtpepcsWu4EUT6nPzOCUL5vAYKJMkkRNU/ltGGMirHQB7
 FSu1d0lwuN0dVecHOdEQRskNX8TVUAxGaAQR8Y0KfPkwid3js02j5rET6aiix1ULvaMC
 ZgspDCj2GJvf4QadawnDvTmEyuTIe98sK9HGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DWqgfqbLVgHqU6apJZOTbbN6y2V5rG2g5kjCKlk1Qak=;
 b=undnEHLDsK9A2wE1cxTILVrSOHex8qAnk2S1+QPqJIqGGYTFCXv+wDrxrjb34lON63
 B5lpnwGU+G6n7b5IWQWrQjeAVecxIOY4ZbGpt/WeiX137JBVYQYfITLYbV+OhgpCuiGq
 1HgTM0IokdC/QwHHjmeMZQi5oSC6EsmydzZ7n68L9m0We7GTeVRB5oS6KpRYDM+H70OD
 0292SGesb/lMRorau69/l/yPq2hkTMWV7IL66EQGlWu8f0Q91jnAyZOJkdiS437xEzbz
 OCWXSyg9Iv065o/G6/YNvafZBBGuZPXhsHAEvt/y5sOPz/ixsK6UbnafVIn2a50t2EW0
 GAxQ==
X-Gm-Message-State: AOAM531T0UADSHWZxm96EgQYC1JCNFkMlAzaOIV+1GubVq0Wumn4LQ+7
 /94yKYcYHzGvT+Xu5z4eSbikTA==
X-Google-Smtp-Source: ABdhPJzZFFmZlZ5qed6rg8NCXd5VtyIbkrJ4fUXRixbxiJJNXbnRpuONStI5GSG/6pThDSo+az8Y1Q==
X-Received: by 2002:a62:ea08:0:b029:1ec:a029:c04a with SMTP id
 t8-20020a62ea080000b02901eca029c04amr11693848pfh.40.1614527567882; 
 Sun, 28 Feb 2021 07:52:47 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id o18sm14725779pjq.44.2021.02.28.07.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 07:52:47 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Sun, 28 Feb 2021 21:22:19 +0530
Message-Id: <20210228155226.77904-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228155226.77904-1-jagan@amarulasolutions.com>
References: <20210228155226.77904-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 2/9] ARM: dts: stm32: Add Engicam i.Core
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

Engicam i.Core STM32MP1 SODIMM SoM has mounted 1x4Gb DDR3
which has 32bits width 528000Khz frequency.

Add DDR configuration via dtsi.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi

diff --git a/arch/arm/dts/stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi
new file mode 100644
index 0000000000..1a45c6fc63
--- /dev/null
+++ b/arch/arm/dts/stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2015-2018, STMicroelectronics - All Rights Reserved
+ */
+
+/*
+ * File generated by STMicroelectronics STM32CubeMX DDR Tool for MPUs
+ * DDR type: DDR3 / DDR3L
+ * DDR width: 32bits
+ * DDR density: 4Gb
+ * System frequency: 528000Khz
+ * Relaxed Timing Mode: false
+ * Address mapping type: RBC
+ *
+ * Save Date: 2019.05.14, save Time: 11:25:16
+ */
+#define DDR_MEM_COMPATIBLE ddr3-icore-1066-888-bin-g-1x4gb-528mhz
+#define DDR_MEM_NAME	"DDR3-DDR3L 32bits 528000Khz"
+#define DDR_MEM_SPEED	528000
+#define DDR_MEM_SIZE	0x20000000
+
+#define DDR_MSTR 0x00040401
+#define DDR_MRCTRL0 0x00000010
+#define DDR_MRCTRL1 0x00000000
+#define DDR_DERATEEN 0x00000000
+#define DDR_DERATEINT 0x00800000
+#define DDR_PWRCTL 0x00000000
+#define DDR_PWRTMG 0x00400010
+#define DDR_HWLPCTL 0x00000000
+#define DDR_RFSHCTL0 0x00210000
+#define DDR_RFSHCTL3 0x00000000
+#define DDR_RFSHTMG 0x0080008A
+#define DDR_CRCPARCTL0 0x00000000
+#define DDR_DRAMTMG0 0x121B2414
+#define DDR_DRAMTMG1 0x000A041B
+#define DDR_DRAMTMG2 0x0607080F
+#define DDR_DRAMTMG3 0x0050400C
+#define DDR_DRAMTMG4 0x07040607
+#define DDR_DRAMTMG5 0x06060403
+#define DDR_DRAMTMG6 0x02020002
+#define DDR_DRAMTMG7 0x00000202
+#define DDR_DRAMTMG8 0x00001005
+#define DDR_DRAMTMG14 0x000000A0
+#define DDR_ZQCTL0 0xC2000040
+#define DDR_DFITMG0 0x02050105
+#define DDR_DFITMG1 0x00000202
+#define DDR_DFILPCFG0 0x07000000
+#define DDR_DFIUPD0 0xC0400003
+#define DDR_DFIUPD1 0x00000000
+#define DDR_DFIUPD2 0x00000000
+#define DDR_DFIPHYMSTR 0x00000000
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
+#define DDR_ADDRMAP1 0x00080808
+#define DDR_ADDRMAP2 0x00000000
+#define DDR_ADDRMAP3 0x00000000
+#define DDR_ADDRMAP4 0x00001F1F
+#define DDR_ADDRMAP5 0x07070707
+#define DDR_ADDRMAP6 0x0F0F0707
+#define DDR_ADDRMAP9 0x00000000
+#define DDR_ADDRMAP10 0x00000000
+#define DDR_ADDRMAP11 0x00000000
+#define DDR_PGCR 0x01442E02
+#define DDR_PTR0 0x0022A41B
+#define DDR_PTR1 0x047C0740
+#define DDR_PTR2 0x042D9C80
+#define DDR_ACIOCR 0x10400812
+#define DDR_DXCCR 0x00000C40
+#define DDR_DSGCR 0xF200001F
+#define DDR_DCR 0x0000000B
+#define DDR_DTPR0 0x36D477D0
+#define DDR_DTPR1 0x098A00D8
+#define DDR_DTPR2 0x10023600
+#define DDR_MR0 0x00000830
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
+#define DDR_DX2GCR 0x0000CE81
+#define DDR_DX2DLLCR 0x40000000
+#define DDR_DX2DQTR 0xFFFFFFFF
+#define DDR_DX2DQSTR 0x3DB02000
+#define DDR_DX3GCR 0x0000CE81
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
