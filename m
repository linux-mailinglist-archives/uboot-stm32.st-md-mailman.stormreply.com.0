Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D082F33D91A
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 17:22:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96A53C57B5A;
	Tue, 16 Mar 2021 16:22:28 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10F57C56632
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 16:22:27 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 18so9162684pfo.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 09:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yh0b19SbgmAsTjJ4rqIXTXOCQIgEjAUHjKglAEhHaI4=;
 b=jgD0/ln0zEBhOzEFKTKVGAJJshpFDbrgBGPqVG0MT9NCuuOKhlazM7gBTH77ej/XVn
 Hv/fP8G8TzV7wPdrla2LybZZ1OUA1W0NAc8rmdcB85iuKcSnvDdgBRyHSvDv4g1UJRD3
 uGoadTpQ3xDIYd3iT4ApQfE61cdG5jGksIirM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yh0b19SbgmAsTjJ4rqIXTXOCQIgEjAUHjKglAEhHaI4=;
 b=jrm7REAJZC4EtBfB0D9lllRtr1JkoOaFaeVonjRy6XLJYgv8k5MX+iybWQN0pa0L2x
 2S6/95KWA7W3oUxXiJVZmyrxEU5hAWG4CNnurA+K0FXzhSpfprjLYzKxp1rsgCfchDrJ
 5MEvjx6FMWcWDVKlnd+JIOZrX1Nr+b+9gO1XGFbNidq3beR/tJiXtOb6pamNXKCsocPu
 QdLPHa2SqvidV0iy5lfv5ilvvLc+/umoUsL24+pAAkkxhgscXoCiL7pYcN6FeLl/Rvae
 mTF4n68By7AUuXtqyk1OtMr6WPWGywMjR2CgxhMLrsS2SrI2c5AeXQYbNppq4jxdd27B
 jGVg==
X-Gm-Message-State: AOAM532Y/nNncVMuRmUgnqLlSf7naG6UF8ZcLzPKdQRkF8xYQYURDKqc
 lercohmBhrsflG4A1mrKxNK28A==
X-Google-Smtp-Source: ABdhPJydJhwdolne2a+Jl6w41dg19e6P/b6+pQuS7IppJ5J1JP1GCfh09Ndqn/IJc0CpE2YRfrfZwA==
X-Received: by 2002:a62:17c4:0:b029:1f5:7cfe:ebc4 with SMTP id
 187-20020a6217c40000b02901f57cfeebc4mr196082pfx.5.1615911745581; 
 Tue, 16 Mar 2021 09:22:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:9de:273e:6ee1:9865])
 by smtp.gmail.com with ESMTPSA id
 k27sm17678240pfg.95.2021.03.16.09.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 09:22:25 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Tue, 16 Mar 2021 21:52:00 +0530
Message-Id: <20210316162207.35641-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316162207.35641-1-jagan@amarulasolutions.com>
References: <20210316162207.35641-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v3 1/8] ARM: dts: stm32: Add Engicam i.Core
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

Linux commit details:

commit <30f9a9da4ee1> ("ARM: dts: stm32: Add Engicam i.Core STM32MP1
SoM")

Add support for it.

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- collect Patrice r-b
Changes for v2:
- collect Patrice r-b
- add linux dts commit 

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
