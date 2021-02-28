Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C4A327335
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Feb 2021 16:52:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F8A0C56630;
	Sun, 28 Feb 2021 15:52:47 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6CCEC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 15:52:45 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id g4so9856740pgj.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 07:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7KGTEH2nJQEoTOzO1mxN/ui3LOLKWOBSGiOjthnYqqM=;
 b=BoswGlBlzHV6s9g1UKCGgMgexTUO5wyX9HLV8/j6Qe7hx2C127P8QV/8ccdN0S2tyq
 TdVzM8RxsNWPll+1l0+5db32k+PGIWkNrn2DYa3kT4mcxkVW13dHO2Cr0i80evs21tqu
 lTjfHZgFo6AaMlzDmljX7WyW7bBwmY++IMhhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7KGTEH2nJQEoTOzO1mxN/ui3LOLKWOBSGiOjthnYqqM=;
 b=Eb9yJZ4qzphA8a4EhU/SfjmEBjsc9OvWhGaDESz7wWtgcHnHAMQo+rj4G3sJxrPHaG
 DT5bhAgwNNykYsQ5R4lrR5y+jXHH2it72T6yZFRGUNGULhnPOJbv1pQQjldPjxvoQnJM
 5EFpBGPE4h5HVq6E8299vr+/1jJnPR2LeKNaaGIwxs56rtmdOkQVbAjGtqgTU3uTbY5i
 2+YaR7n5hAH4+UX72ensYkAsHAhiRSQNSZdBb3oAEGM9hC2WVZpqGe+a3or2TqmMRdGa
 n28XRt9ST1KD4Uuj+qhjM358uOFLelagddLGdb95wfpT8VcsvbN50zZ5WvOlIzy1oHYo
 ylPQ==
X-Gm-Message-State: AOAM5321KpAdCwks9lVGTLSyMLw9MjC0RMWoxgYZjqy+M+97qRDA3kva
 jSoNydQY8dX4TCeOiVqyYv1zzA==
X-Google-Smtp-Source: ABdhPJy/GHls5ZRF/sMfld+bcEEwh+oAPjmjwCyFtQbUJnbBoAjOsdPOYW+0BZWlxDznVHsFoss3SQ==
X-Received: by 2002:a62:8202:0:b029:1ed:b091:cc88 with SMTP id
 w2-20020a6282020000b02901edb091cc88mr11142158pfd.53.1614527564282; 
 Sun, 28 Feb 2021 07:52:44 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id o18sm14725779pjq.44.2021.02.28.07.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 07:52:43 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Sun, 28 Feb 2021 21:22:18 +0530
Message-Id: <20210228155226.77904-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228155226.77904-1-jagan@amarulasolutions.com>
References: <20210228155226.77904-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 1/9] ARM: dts: stm32: Add Engicam i.Core
	STM32MP1 SoM
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

i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.

General features:
- STM32MP157A
- Up to 1GB DDR3L
- 4GB eMMC
- 10/100 Ethernet
- USB 2.0 Host/OTG
- I2S
- MIPI DSI to LVDS
- rest of STM32MP157A features

i.Core STM32MP1 needs to mount on top of Engicam baseboards
for creating complete platform solutions.

Add support for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/dts/stm32mp157a-icore-stm32mp1.dtsi | 196 +++++++++++++++++++
 1 file changed, 196 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1.dtsi

diff --git a/arch/arm/dts/stm32mp157a-icore-stm32mp1.dtsi b/arch/arm/dts/stm32mp157a-icore-stm32mp1.dtsi
new file mode 100644
index 0000000000..01166ccacf
--- /dev/null
+++ b/arch/arm/dts/stm32mp157a-icore-stm32mp1.dtsi
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Engicam srl
+ * Copyright (c) 2020 Amarula Solutons(India)
+ */
+
+/ {
+	compatible = "engicam,icore-stm32mp1", "st,stm32mp157";
+
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x20000000>;
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
+	vddcore: regulator-vddcore {
+		compatible = "regulator-fixed";
+		regulator-name = "vddcore";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
+
+	vdd: regulator-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vdd_usb: regulator-vdd-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_usb";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vdda: regulator-vdda {
+		compatible = "regulator-fixed";
+		regulator-name = "vdda";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vdd_ddr: regulator-vdd-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_ddr";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		regulator-always-on;
+	};
+
+	vtt_ddr: regulator-vtt-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vtt_ddr";
+		regulator-min-microvolt = <675000>;
+		regulator-max-microvolt = <675000>;
+		regulator-always-on;
+		vin-supply = <&vdd>;
+	};
+
+	vref_ddr: regulator-vref-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_ddr";
+		regulator-min-microvolt = <675000>;
+		regulator-max-microvolt = <675000>;
+		regulator-always-on;
+		vin-supply = <&vdd>;
+	};
+
+	vdd_sd: regulator-vdd-sd {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	v3v3: regulator-v3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "v3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	v2v8: regulator-v2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "v2v8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+		vin-supply = <&v3v3>;
+	};
+
+	v1v8: regulator-v1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "v1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		vin-supply = <&v3v3>;
+	};
+};
+
+&dts {
+	status = "okay";
+};
+
+&i2c2 {
+	i2c-scl-falling-time-ns = <20>;
+	i2c-scl-rising-time-ns = <185>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_a>;
+	pinctrl-1 = <&i2c2_sleep_pins_a>;
+	status = "okay";
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
