Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8476432733C
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Feb 2021 16:53:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 502FEC56630;
	Sun, 28 Feb 2021 15:53:05 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5316C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 15:53:03 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id b21so9836560pgk.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 07:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wgrzDxwgj1+gZIC5El3AkJ/uVxy70NjGzTfWgVncTC4=;
 b=WWUVTg0ziMVItIrPyo/YE1h359JKs7yuWyfPJExKv82ITGpdgJu6kPoAd1zYK0d8wi
 EnKmEgP5tT4Ou83Y0lc7ifeyNO5MVfsCfZrPvn+JjPAYopI1C/GauoYM2lk2bnWs7Qlf
 yc7lD21A3umgfHoJR9z13jVnwN+Y0hcKexdks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wgrzDxwgj1+gZIC5El3AkJ/uVxy70NjGzTfWgVncTC4=;
 b=fIN9ZwIqWEjyJuQvFJi1iL1yV2qDRUTahmoeIOQnBK7Pb5un/DY3KCCtqsi83V5lGy
 j7aRWt3JmIknogmce1RjWJKtLdv3EgOWxwzgUzLM607ybGYOtRcau/fVqLiElOz/Fyr0
 Q3k6CTHxoSWVmdvDcQanJPwS7DDctbd9klQ4jdFVr6wNYXZCBbXg1FB/EgOd5emrZ4Q/
 Y3j3KVAwW06gI2XmXIcwy6NBEY7Frx1mzxP+hTDPoFV93y16/YfF7sC8X8I/sB4lAiIC
 dZPsN3IW2hv2wqEBjP6ttaEeDUhciLPqmE/0A7W0OMJJw5UIfo6z2Ixt4MBtJd7dt2nQ
 Jmpw==
X-Gm-Message-State: AOAM532dr8JNu92V9jRXDGlQG0gNwYzsyu1O8o0aFdSjTwp+YogXVSw3
 I9m35kXuYpLuTVR4fu+C+Z/83g==
X-Google-Smtp-Source: ABdhPJw9cpcO0eT7rYfbppGDWTqMQO0SLAgg0XrFfvS9ugVkNQjyVyER0feMlmkLujiZPbD3P6XgSw==
X-Received: by 2002:a65:47c3:: with SMTP id f3mr10192402pgs.364.1614527582326; 
 Sun, 28 Feb 2021 07:53:02 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id o18sm14725779pjq.44.2021.02.28.07.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 07:53:02 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Sun, 28 Feb 2021 21:22:23 +0530
Message-Id: <20210228155226.77904-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228155226.77904-1-jagan@amarulasolutions.com>
References: <20210228155226.77904-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 6/9] ARM: dts: stm32: Add Engicam MicroGEA
	STM32MP1 Micro SoM
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

MicroGEA STM32MP1 is a STM32MP157A based Micro SoM.

General features:
- STM32MP157AAC
- Up to 1GB DDR3L-800
- 512MB Nand flash
- I2S

MicroGEA STM32MP1 needs to mount on top of Engicam MicroDev carrier
boards for creating complete platform solutions.

Add support for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../dts/stm32mp157a-microgea-stm32mp1.dtsi    | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1.dtsi

diff --git a/arch/arm/dts/stm32mp157a-microgea-stm32mp1.dtsi b/arch/arm/dts/stm32mp157a-microgea-stm32mp1.dtsi
new file mode 100644
index 0000000000..0b85175f15
--- /dev/null
+++ b/arch/arm/dts/stm32mp157a-microgea-stm32mp1.dtsi
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Engicam srl
+ * Copyright (c) 2020 Amarula Solutons(India)
+ */
+
+/ {
+	compatible = "engicam,microgea-stm32mp1", "st,stm32mp157";
+
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x10000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mcuram2: mcuram2@10000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10000000 0x40000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@10040000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10040000 0x1000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@10041000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10041000 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@10042000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10042000 0x4000>;
+			no-map;
+		};
+
+		mcuram: mcuram@30000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x30000000 0x40000>;
+			no-map;
+		};
+
+		retram: retram@38000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x38000000 0x10000>;
+			no-map;
+		};
+	};
+
+	vin: regulator-vin {
+		compatible = "regulator-fixed";
+		regulator-name = "vin";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	vddcore: regulator-vddcore {
+		compatible = "regulator-fixed";
+		regulator-name = "vddcore";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		vin-supply = <&vin>;
+	};
+
+	vdd: regulator-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&vin>;
+	};
+
+	vddq_ddr: regulator-vddq-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vddq_ddr";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		regulator-always-on;
+		vin-supply = <&vin>;
+	};
+};
+
+&dts {
+	status = "okay";
+};
+
+&fmc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&fmc_pins_a>;
+	pinctrl-1 = <&fmc_sleep_pins_a>;
+	status = "okay";
+
+	nand-controller@4,0 {
+		status = "okay";
+
+		nand@0 {
+			reg = <0>;
+			nand-on-flash-bbt;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
+
+&ipcc {
+	status = "okay";
+};
+
+&iwdg2{
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&m4_rproc{
+	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+			<&vdev0vring1>, <&vdev0buffer>;
+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
+	mbox-names = "vq0", "vq1", "shutdown";
+	interrupt-parent = <&exti>;
+	interrupts = <68 1>;
+	status = "okay";
+};
+
+&rng1 {
+	status = "okay";
+};
+
+&rtc{
+	status = "okay";
+};
+
+&vrefbuf {
+	regulator-min-microvolt = <2500000>;
+	regulator-max-microvolt = <2500000>;
+	vdda-supply = <&vdd>;
+	status = "okay";
+};
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
