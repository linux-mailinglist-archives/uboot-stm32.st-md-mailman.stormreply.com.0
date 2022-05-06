Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD14A51D9F6
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 16:08:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 727E8C628B4;
	Fri,  6 May 2022 14:08:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E49DDC628AA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 14:08:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246Bd1Rg010864;
 Fri, 6 May 2022 16:08:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=/IGR4BVWm8ix3AZ13FlY6SjAHYZDO09pjo52KZ7whSU=;
 b=WTNR++FrC+OHgKeq3ouBcVFYo6US8B6SDsZPoa0h07Xgu/QBZ8hR5MaZENAnkqJ1nElQ
 i4b/1rz5ybbTTUG3PUhMVhHiDmFFAh6nWBEg8S/DTRGsDFcGL+HmTZepmovF3jJlNrLD
 6d3jB2p2sQKoaj7BlnKcJ9qwIE3mSHQ3dj6U03UkoEKUeC4QcCOEYyxlZSgGYy8I0K1V
 6ZdjHpnzg2DepqZwwpY+LhxijNY/v3gDhvGkIYoUJy7QfXqOB/IxzaMXImrLXu/stPGs
 VbMUbR2e6d10QoFQPP476WRXHpuCP6k8yN+MgktB9jau89dl9xyWrHXfQhtxJPuEoqGX Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fvygu2cyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 16:08:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C3EE10002A;
 Fri,  6 May 2022 16:08:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 84A292248DB;
 Fri,  6 May 2022 16:08:38 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 6 May 2022 16:08:37
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 May 2022 16:06:21 +0200
Message-ID: <20220506160540.14.I8f3aebcc95b60f45691cc7aa918ef5efece05887@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
Cc: Tom Rini <trini@konsulko.com>, Fabio Estevam <festevam@denx.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Tim Harvey <tharvey@gateworks.com>
Subject: [Uboot-stm32] [PATCH 14/16] arm: dts: stm32mp: add stm32mp13 device
	tree for U-Boot
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

Compile the device tree of STM32MP13x boards and add the needed
U-Boot add-on.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/Makefile                   |  3 +
 arch/arm/dts/stm32mp13-u-boot.dtsi      | 91 +++++++++++++++++++++++++
 arch/arm/dts/stm32mp135f-dk-u-boot.dtsi | 30 ++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp13-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp135f-dk-u-boot.dtsi

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 1032ce4c85..ba2987197c 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -1135,6 +1135,9 @@ dtb-$(CONFIG_ASPEED_AST2600) += ast2600-evb.dtb
 
 dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
 
+dtb-$(CONFIG_STM32MP13x) += \
+	stm32mp135f-dk.dtb
+
 dtb-$(CONFIG_STM32MP15x) += \
 	stm32mp157a-dk1.dtb \
 	stm32mp157a-icore-stm32mp1-ctouch2.dtb \
diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
new file mode 100644
index 0000000000..1b5b358690
--- /dev/null
+++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
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
+		pinctrl0 = &pinctrl;
+	};
+
+	/* need PSCI for sysreset during board_f */
+	psci {
+		u-boot,dm-pre-proper;
+	};
+
+	soc {
+		u-boot,dm-pre-reloc;
+
+		ddr: ddr@5a003000 {
+			u-boot,dm-pre-reloc;
+
+			compatible = "st,stm32mp13-ddr";
+
+			reg = <0x5A003000 0x550
+			       0x5A004000 0x234>;
+
+			status = "okay";
+		};
+	};
+};
+
+&bsec {
+	u-boot,dm-pre-reloc;
+};
+
+&gpioa {
+	u-boot,dm-pre-reloc;
+};
+
+&gpiob {
+	u-boot,dm-pre-reloc;
+};
+
+&gpioc {
+	u-boot,dm-pre-reloc;
+};
+
+&gpiod {
+	u-boot,dm-pre-reloc;
+};
+
+&gpioe {
+	u-boot,dm-pre-reloc;
+};
+
+&gpiof {
+	u-boot,dm-pre-reloc;
+};
+
+&gpiog {
+	u-boot,dm-pre-reloc;
+};
+
+&gpioh {
+	u-boot,dm-pre-reloc;
+};
+
+&gpioi {
+	u-boot,dm-pre-reloc;
+};
+
+&iwdg2 {
+	u-boot,dm-pre-reloc;
+};
+
+&pinctrl {
+	u-boot,dm-pre-reloc;
+};
+
+&syscfg {
+	u-boot,dm-pre-reloc;
+};
diff --git a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
new file mode 100644
index 0000000000..dfe5bbb2e3
--- /dev/null
+++ b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ */
+
+#include "stm32mp13-u-boot.dtsi"
+
+/ {
+	aliases {
+		mmc0 = &sdmmc1;
+	};
+
+	config {
+		u-boot,mmc-env-partition = "u-boot-env";
+	};
+};
+
+&uart4 {
+	u-boot,dm-pre-reloc;
+};
+
+&uart4_pins_a {
+	u-boot,dm-pre-reloc;
+	pins1 {
+		u-boot,dm-pre-reloc;
+	};
+	pins2 {
+		u-boot,dm-pre-reloc;
+	};
+};
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
