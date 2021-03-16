Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BF533D91F
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 17:22:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A042AC57B5A;
	Tue, 16 Mar 2021 16:22:31 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FD58C56632
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 16:22:30 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so1708036pjg.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 09:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dsco01rvfQRqwoKzd9g8v/23OS6+FuvEv15EYQMWyfE=;
 b=inyYcV++Ikvm11NEuf0KEr8r0EheqzDNzG8ZKbnr2g+7dDbGojt+1Kn+1C2jLIWR6w
 u6uCOWtYzxXRqiN5Wb2Se7O2iRcmgnUz+NSPHY61HTGVNfcA+wYAHiq3vvmzWL06KTcz
 pGe30+X0H/KRG8ZSHkIcQQ3csKGGOj8uUPiqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dsco01rvfQRqwoKzd9g8v/23OS6+FuvEv15EYQMWyfE=;
 b=cTNQQAx8keM5j4wE3/ouYx6Eo62Du/4n8LkBryBPGKwbUi74LA4Trn+OUcMXxM4ef6
 qAzdzqaAc3ub7WhbGnJ3VHJAX5HhQj9uAdoN2T++m8v4DWq7nBpiIvXrKb2UWsxRHuVH
 cInVvibkNX8EvfgPhWnNu0esv9t2uZJsASjwt0RVExuv0ryeR/2+VwE47mo+vLoR/xkB
 Eo6HNyKZ/06zw+kxj2JvTLIGV5S7df8Ooy21u/qrutnI0qkAkjFF/Y8UhtrcT6FyIztw
 49SEWQBbPm0OI5NEPNaDrdcTwdnxVUN/0dlba8xAOG21tk8UQGZEYr6Qt8sckkS4rC6C
 PKTQ==
X-Gm-Message-State: AOAM532EUdThoY7B7+Z/LAOCyNkHH4/ZOVEi7/Hl7M6wHxEqnZCLpNdY
 QteOgQVNwgLBjOunx/3CkuOVwQ==
X-Google-Smtp-Source: ABdhPJw9TTbe92wE4S2VW4CjynZE3QwllU6i+K2xU7KldExq3hKAa+XUQfA/Djh5GK4NRR39iX4+wg==
X-Received: by 2002:a17:902:b497:b029:e6:a938:586f with SMTP id
 y23-20020a170902b497b02900e6a938586fmr212745plr.70.1615911749053; 
 Tue, 16 Mar 2021 09:22:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:9de:273e:6ee1:9865])
 by smtp.gmail.com with ESMTPSA id
 k27sm17678240pfg.95.2021.03.16.09.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 09:22:28 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Tue, 16 Mar 2021 21:52:01 +0530
Message-Id: <20210316162207.35641-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316162207.35641-1-jagan@amarulasolutions.com>
References: <20210316162207.35641-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v3 2/8] ARM: dts: stm32: Add Engicam i.Core
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

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- fixed cosmetic s/Khz/kHz 
- collect Patrice r-b
Changes for v2:
- collect Patrice r-b

 .../stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi

diff --git a/arch/arm/dts/stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi
new file mode 100644
index 0000000000..24c81269b0
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
+#define DDR_MEM_NAME	"DDR3-DDR3L 32bits 528000kHz"
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
