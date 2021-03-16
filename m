Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE3D33D924
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 17:22:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C2B8C57B78;
	Tue, 16 Mar 2021 16:22:45 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01526C57B5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 16:22:44 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so1617059pjq.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 09:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HgAyfKDeQqV1rPQNMpEC4TDbAUtgWRkL4ch4X3LHZLs=;
 b=XyZyBq/3oSny4famq5VwZtycZzvPwDxoxGCr7762OvRaKToQr6oSeWJOYWyVNQwNQh
 lNmlaSjJftwY4rlshdNRsuVTBaYin2mWuoBapmodH/OS/zI87Xw2t5RuWABzwrwQuEsb
 2o6kEJDZpFCyEcjCOVny7F4mff7pyxbtZVpSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HgAyfKDeQqV1rPQNMpEC4TDbAUtgWRkL4ch4X3LHZLs=;
 b=BCj8mCfCDqWvopswO5ewZjgck9bTj2y471kVKwIf1ge4DPw2/lgTSWZgV7fbyyqq3p
 WBO7OZQT/V53PTS6rDJt40H8OxycnCYaC0jMGbSmMlEqxrJ79gHX5aqwBBvyuc8KfMps
 JRJkEQvGh8Lr50DNT09wUJIxCldrAGT9Yjzx6bJ0Fg9oX/Amg1noMO9lqstunVvGZjue
 lOKAlt2B0HapWjdaEN6Rn7do2jcw1RqzTuDEam/wc18YI8fQAybnCzMw93pw1d6lDDbj
 kO+hsZPRZ3sbOipWImigJCGCnpbnr+QEyaxn3NDdF8Un0ZQOb+9mt26GHHaVMc9CVrZA
 ZMow==
X-Gm-Message-State: AOAM531uy0aqXHt6UhwZHztiHhhAbX/EMhsMOAvi6jXc8DEkAYbM+TqE
 DaIdcbWOdKRv7qyAD+OAOCJvCBaJJJuKiE3U
X-Google-Smtp-Source: ABdhPJw97O44+JGm5xxq4fPBG9vu0fg9RQ6YpJfM4WNw5SyeeH7Qr/2GgLp9C+QVpVCmFHqEreVo3Q==
X-Received: by 2002:a17:90b:438a:: with SMTP id
 in10mr400527pjb.165.1615911762648; 
 Tue, 16 Mar 2021 09:22:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:9de:273e:6ee1:9865])
 by smtp.gmail.com with ESMTPSA id
 k27sm17678240pfg.95.2021.03.16.09.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 09:22:42 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Tue, 16 Mar 2021 21:52:05 +0530
Message-Id: <20210316162207.35641-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316162207.35641-1-jagan@amarulasolutions.com>
References: <20210316162207.35641-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v3 6/8] ARM: dts: stm32: Add Engicam MicroGEA
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

Linux dts commit details:

commit <0be81dfaeaf8> ("ARM: dts: stm32: Add Engicam MicroGEA STM32MP1
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
- drop CONFIG_BOARD_EARLY_INIT_F

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
