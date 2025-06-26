Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D897CAE9799
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Jun 2025 10:09:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA305C30883;
	Thu, 26 Jun 2025 08:09:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39724C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 08:09:47 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q7eaxW032330;
 Thu, 26 Jun 2025 10:09:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 /fMM+hbPYC/RSuBhKupeCZO8tL+PeJH9Hx9I9MpbKwc=; b=7/yfP/nY3RLjU0bq
 JygMW6RAinaTJSJgdmWDAnxPF0nTPq5BWmdhqZT0D+Zq6PhNMS9yeqUBls6v1EuI
 dExiziIS8poNLOxACPTuNrdmtW8SeRpiIhe4de2A5HEQkW6KfoaGYbKyEWNidUNc
 WhEIe+3LPLAB4DO1NKO/VkzQWgCQtyTS/7FHaP+TKtGIZzcDLSayIa9H2LnYMzhc
 QETV6+VsFhGVJvh+BnYcZzJ5Q1E498sNFmE/ttdgD/9G0Vm5ftIGMqzdbRwUh8Zr
 7aIX7B772/q93adLTRg+iZR8fueLI+6sGrkMTgTPpycZWyvpTB+/zsP/6HUnNyWI
 cmRUbg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dj5nxbs5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jun 2025 10:09:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 42BBA40044;
 Thu, 26 Jun 2025 10:09:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E7F3B17E92;
 Thu, 26 Jun 2025 10:08:50 +0200 (CEST)
Received: from localhost (10.252.13.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 10:08:49 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 26 Jun 2025 10:08:46 +0200
Message-ID: <20250626080846.48576-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250626080846.48576-1-patrice.chotard@foss.st.com>
References: <20250626080846.48576-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.13.141]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_03,2025-06-25_01,2025-03-28_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32: Add stm32mp235f-dk-u-boot
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

Add U-Boot specific file for stm32mp235f-dk board

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp23-u-boot.dtsi      | 104 ++++++++++++++++++++++++
 arch/arm/dts/stm32mp235f-dk-u-boot.dtsi |  27 ++++++
 2 files changed, 131 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp23-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp235f-dk-u-boot.dtsi

diff --git a/arch/arm/dts/stm32mp23-u-boot.dtsi b/arch/arm/dts/stm32mp23-u-boot.dtsi
new file mode 100644
index 00000000000..872a8739c54
--- /dev/null
+++ b/arch/arm/dts/stm32mp23-u-boot.dtsi
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright : STMicroelectronics 2024
+ */
+
+/ {
+	aliases {
+		gpio0 = &gpioa;
+		gpio1 = &gpiob;
+		gpio2 = &gpioc;
+		gpio3 = &gpiod;
+		gpio4 = &gpioe;
+		gpio5 = &gpiof;
+		gpio6 = &gpiog;
+		gpio7 = &gpioh;
+		gpio8 = &gpioi;
+		gpio25 = &gpioz;
+		pinctrl0 = &pinctrl;
+		pinctrl1 = &pinctrl_z;
+	};
+
+	firmware {
+		optee {
+			bootph-all;
+		};
+
+		scmi {
+			bootph-all;
+		};
+	};
+
+	/* need PSCI for sysreset during board_f */
+	psci {
+		bootph-all;
+	};
+
+	soc@0 {
+		bootph-all;
+	};
+};
+
+&bsec {
+	bootph-all;
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
+&pinctrl {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
+&rifsc {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
+&syscfg {
+	bootph-all;
+};
diff --git a/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
new file mode 100644
index 00000000000..1bc77874050
--- /dev/null
+++ b/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) STMicroelectronics 2024 - All Rights Reserved
+ */
+
+#include "stm32mp23-u-boot.dtsi"
+
+/ {
+	config {
+		u-boot,boot-led = "led-blue";
+		u-boot,mmc-env-partition = "u-boot-env";
+	};
+};
+
+&usart2 {
+	bootph-all;
+};
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
-- 
2.25.1

base-commit: 3b164fd951a9e93a13e793588cbcd3182089ec48
branch: upstream_Add_STM32MP23_support
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
