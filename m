Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 111FEAB3EE8
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 May 2025 19:22:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB8C3C7A82D;
	Mon, 12 May 2025 17:22:30 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66DFAC7A82F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 17:22:29 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Zx5yY0V68z9tV1;
 Mon, 12 May 2025 19:22:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4ap557lfCQgYh5td6+jBPw28mHLUWYcaVFKktofZXI=;
 b=SSRsQEGxBzsfp/jpFDye+0kkM7z64s/eD1KCNj1sqNYBhBuQj9ZhJ/3shSURSzxviwgR2A
 A6Xm8fEMTO/M/3HL0ISq63xkjxqkpPlogIiGU8QlbQtzmL2yAYHwfgMi2g0B5hZ9PE1bnN
 E1jf2w3M3SoIoR1VgbUWfNcD/jfbDU5DH9Z/JcgHVQvp1L7dPTHgDkVO2+WJJbuHdhvb9O
 hzy5NPDC6zHMQtwZV2Blg9YgNQu7WKbfpUrNP0VpMIs/JdrME23IP7ouS6VkBsFuo290LV
 tCWrVf1zjDCai4gmC3UsYtS3ADydE/23Ph6G62F1avsj/soLe+KCKbji6YBBpg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4ap557lfCQgYh5td6+jBPw28mHLUWYcaVFKktofZXI=;
 b=obkVuu+LhVw+akKpcjtYhdrYA5sAl1UP0JNUoiNotEradEA81nT3Jz0ptRMM1T5mguH6Rj
 11QsyyJfpOYJUEPlprSJ6F2N1tLQhznhaAqV+uwGOBT5c5OsKI9W23DRmPaP5UZZsdhLDj
 qgtInk1s9AaMePg0sOZhQuceelS4gCuJCPhGYdrLndJ4Ap/DpUZlclwIuJ6gKnn/a386Te
 YEFFAoF3Rd5StFv2dBvxVBsz77PH0hRv+l+K3L+12P5mcO9fxC5GggH2QJRXm+MM5sz6Un
 HVyB6hZ/HKh9rBR0UK6+Ytbc335C80jNozNVRl0XkR4Qi/FLpC+cD0FounQHCA==
To: u-boot@lists.denx.de
Date: Mon, 12 May 2025 19:21:35 +0200
Message-ID: <20250512172149.150214-9-marek.vasut@mailbox.org>
In-Reply-To: <20250512172149.150214-1-marek.vasut@mailbox.org>
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 3757f4041f8e38d1ded
X-MBO-RS-META: buqzk47xma3oruqisbksijxkmktsexex
X-Rspamd-Queue-Id: 4Zx5yY0V68z9tV1
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: [Uboot-stm32] [PATCH 08/10] ARM: dts: stm32: Add STM32MP13x SPL
	specific DT additions
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

Add DT additions required by U-Boot SPL to bring up the hardware.
This includes binman node to generate STM32 Image v2.0 which can be
booted by the BootROM, clock entries used by the SPL clock driver
during clock tree initialization, and syscon-reboot node so U-Boot
can reset the system without having to rely on PSCI call.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Cheick Traore <cheick.traore@foss.st.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Lionel Debieve <lionel.debieve@foss.st.com>
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp13-u-boot.dtsi | 89 ++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
index 1fe6966781c..ad63d5027b2 100644
--- a/arch/arm/dts/stm32mp13-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
@@ -17,6 +17,7 @@
 		pinctrl0 = &pinctrl;
 	};
 
+#if defined(CONFIG_TFABOOT)
 	firmware {
 		optee {
 			bootph-all;
@@ -27,6 +28,86 @@
 	psci {
 		bootph-some-ram;
 	};
+#else
+	binman: binman {
+		multiple-images;
+
+		spl-stm32 {
+			filename = "u-boot-spl.stm32";
+			mkimage {
+				args = "-T stm32imagev2 -a 0x2ffe0000 -e 0x2ffe0000";
+				u-boot-spl {
+					no-write-symbols;
+				};
+			};
+		};
+	};
+
+	clocks {
+		bootph-all;
+
+		clk_hse: ck_hse {
+			bootph-all;
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+
+		clk_hsi: ck_hsi {
+			bootph-all;
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <64000000>;
+		};
+
+		clk_lse: ck_lse {
+			bootph-all;
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32768>;
+		};
+
+		clk_lsi: ck_lsi {
+			bootph-all;
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+		};
+
+		clk_csi: ck_csi {
+			bootph-all;
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <4000000>;
+		};
+	};
+
+	cpu0_opp_table: cpu0-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+		bootph-pre-ram;
+		opp-650000000 {
+			bootph-pre-ram;
+			opp-hz = /bits/ 64 <650000000>;
+			opp-microvolt = <1200000>;
+			opp-supported-hw = <0x1>;
+		};
+		opp-1000000000 {
+			bootph-pre-ram;
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <1350000>;
+			opp-supported-hw = <0x2>;
+		};
+	};
+
+	reboot {
+		bootph-all;
+		compatible = "syscon-reboot";
+		regmap = <&rcc>;
+		offset = <0x114>;
+		mask = <0x1>;
+	};
+#endif
 
 	soc {
 		bootph-all;
@@ -52,6 +133,14 @@
 	bootph-all;
 };
 
+#if !defined(CONFIG_TFABOOT)
+&cpu0 {
+	nvmem-cells = <&part_number_otp>;
+	nvmem-cell-names = "part_number";
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+#endif
+
 &gpioa {
 	bootph-all;
 };
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
