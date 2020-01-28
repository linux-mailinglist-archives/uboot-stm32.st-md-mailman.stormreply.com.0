Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C29814B192
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 10:11:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 076ECC36B0E
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 09:11:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31A56C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:11:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S98GpD024300; Tue, 28 Jan 2020 10:11:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=KQ6NtV/cJfGvebXlOH/6pucGpgndUcSttICdFY5Wo2k=;
 b=IOEzd3guEquTVRZXxqdkkF0iBeTFs6DUNMh/c4k3m7xh2OPTDiSu1suAm5Ky/cZ1g0JS
 b4khKGlqsXTIgOeGM+78Y29Puii3lLl1lTfpiP0+Af3Bn05ICdbLrqBlJXMUzJIv6bGj
 XU8kd8/JMkxY0BE3JAxHRXCdURaKA48kU7WUWtQRUhcV90WhIzonWdh3Ij4jIDfFHr17
 VBEJsi97sd1RZVfXwg3f2ELeoCwndsAsHZitriZJ+kdsKF88rUZws9tEu3wW7NgEHDox
 b1hcFHnauhNVdOlolcaaZKHocdT17EvcygbeH4Cw5a/RdalkCuXghLitmjAy+pxSB6f/ VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrc134y8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:11:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C4377100034;
 Tue, 28 Jan 2020 10:11:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA284212A3F;
 Tue, 28 Jan 2020 10:11:26 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 10:11:26 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jan 2020 10:10:59 +0100
Message-ID: <20200128101041.2.Ic3c189e7da6e6ff909e435d7011057b867559ba2@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128091106.28552-1-patrick.delaunay@st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 2/9] stm32mp1: pwr: use the last binding for
	pwr
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

Update the driver to use the latest binding from kernel v5.5-rc1:
no more use syscon or regmap to access to pwr register and
only one pwr_regulators node with the compatibility "st,stm32mp1,pwr-reg"
is available.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157-u-boot.dtsi        |  2 +-
 arch/arm/dts/stm32mp157a-avenger96.dts     |  8 ++--
 arch/arm/dts/stm32mp157a-dk1.dts           |  8 ++--
 arch/arm/dts/stm32mp157c-ed1.dts           |  8 ++--
 arch/arm/dts/stm32mp157c.dtsi              | 46 +++++++++-------------
 arch/arm/dts/stm32mp15xx-dhcom.dtsi        |  8 ++--
 arch/arm/mach-stm32mp/include/mach/stm32.h |  1 -
 arch/arm/mach-stm32mp/pwr_regulator.c      | 23 ++++++-----
 arch/arm/mach-stm32mp/syscon.c             |  1 -
 9 files changed, 42 insertions(+), 63 deletions(-)

diff --git a/arch/arm/dts/stm32mp157-u-boot.dtsi b/arch/arm/dts/stm32mp157-u-boot.dtsi
index 0d1d387e54..cb8d60e33d 100644
--- a/arch/arm/dts/stm32mp157-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157-u-boot.dtsi
@@ -128,7 +128,7 @@
 	u-boot,dm-pre-reloc;
 };
 
-&pwr {
+&pwr_regulators {
 	u-boot,dm-pre-reloc;
 };
 
diff --git a/arch/arm/dts/stm32mp157a-avenger96.dts b/arch/arm/dts/stm32mp157a-avenger96.dts
index 5b15a4a915..232fe70905 100644
--- a/arch/arm/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/dts/stm32mp157a-avenger96.dts
@@ -282,11 +282,9 @@
 	status = "okay";
 };
 
-&pwr {
-	pwr-regulators {
-		vdd-supply = <&vdd>;
-		vdd_3v3_usbfs-supply = <&vdd_usb>;
-	};
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
 };
 
 &rng1 {
diff --git a/arch/arm/dts/stm32mp157a-dk1.dts b/arch/arm/dts/stm32mp157a-dk1.dts
index 4652253012..dc61bfc3d5 100644
--- a/arch/arm/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/dts/stm32mp157a-dk1.dts
@@ -397,11 +397,9 @@
 	status = "okay";
 };
 
-&pwr {
-	pwr-regulators {
-		vdd-supply = <&vdd>;
-		vdd_3v3_usbfs-supply = <&vdd_usb>;
-	};
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
 };
 
 &rng1 {
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index bc4d7e1ab5..acb59f24cc 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -263,11 +263,9 @@
 	status = "okay";
 };
 
-&pwr {
-	pwr-regulators {
-		vdd-supply = <&vdd>;
-		vdd_3v3_usbfs-supply = <&vdd_usb>;
-	};
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
 };
 
 &rng1 {
diff --git a/arch/arm/dts/stm32mp157c.dtsi b/arch/arm/dts/stm32mp157c.dtsi
index 28a7e4c08a..22a9386248 100644
--- a/arch/arm/dts/stm32mp157c.dtsi
+++ b/arch/arm/dts/stm32mp157c.dtsi
@@ -1110,36 +1110,26 @@
 			#reset-cells = <1>;
 		};
 
-		pwr: pwr@50001000 {
-			compatible = "st,stm32mp1-pwr", "st,stm32-pwr", "syscon", "simple-mfd";
-			reg = <0x50001000 0x400>;
-			system-power-controller;
-			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
-			st,sysrcc = <&rcc>;
-			clocks = <&rcc PLL2_R>;
-			clock-names = "phyclk";
-
-			pwr-regulators {
-				compatible = "st,stm32mp1,pwr-reg";
-				st,tzcr = <&rcc 0x0 0x1>;
-
-				reg11: reg11 {
-					regulator-name = "reg11";
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
-				};
+		pwr_regulators: pwr@50001000 {
+			compatible = "st,stm32mp1,pwr-reg";
+			reg = <0x50001000 0x10>;
+
+			reg11: reg11 {
+				regulator-name = "reg11";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+			};
 
-				reg18: reg18 {
-					regulator-name = "reg18";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
+			reg18: reg18 {
+				regulator-name = "reg18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
 
-				usb33: usb33 {
-					regulator-name = "usb33";
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-				};
+			usb33: usb33 {
+				regulator-name = "usb33";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 			};
 		};
 
diff --git a/arch/arm/dts/stm32mp15xx-dhcom.dtsi b/arch/arm/dts/stm32mp15xx-dhcom.dtsi
index 96661ae783..bed69c97b6 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom.dtsi
@@ -217,11 +217,9 @@
 	status = "okay";
 };
 
-&pwr {
-	pwr-regulators {
-		vdd-supply = <&vdd>;
-		vdd_3v3_usbfs-supply = <&vdd_usb>;
-	};
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
 };
 
 &qspi {
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 88126b8cdb..f0636005e5 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -37,7 +37,6 @@
 /* enumerated used to identify the SYSCON driver instance */
 enum {
 	STM32MP_SYSCON_UNKNOWN,
-	STM32MP_SYSCON_PWR,
 	STM32MP_SYSCON_SYSCFG,
 };
 
diff --git a/arch/arm/mach-stm32mp/pwr_regulator.c b/arch/arm/mach-stm32mp/pwr_regulator.c
index 9484645dbd..f00e7527c2 100644
--- a/arch/arm/mach-stm32mp/pwr_regulator.c
+++ b/arch/arm/mach-stm32mp/pwr_regulator.c
@@ -6,8 +6,8 @@
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
-#include <regmap.h>
 #include <syscon.h>
+#include <asm/io.h>
 #include <power/pmic.h>
 #include <power/regulator.h>
 
@@ -26,7 +26,7 @@ struct stm32mp_pwr_reg_info {
 };
 
 struct stm32mp_pwr_priv {
-	struct regmap *regmap;
+	fdt_addr_t base;
 };
 
 static int stm32mp_pwr_write(struct udevice *dev, uint reg,
@@ -38,7 +38,9 @@ static int stm32mp_pwr_write(struct udevice *dev, uint reg,
 	if (len != 4)
 		return -EINVAL;
 
-	return regmap_write(priv->regmap, STM32MP_PWR_CR3, val);
+	writel(val, priv->base + STM32MP_PWR_CR3);
+
+	return 0;
 }
 
 static int stm32mp_pwr_read(struct udevice *dev, uint reg, uint8_t *buff,
@@ -49,21 +51,18 @@ static int stm32mp_pwr_read(struct udevice *dev, uint reg, uint8_t *buff,
 	if (len != 4)
 		return -EINVAL;
 
-	return regmap_read(priv->regmap, STM32MP_PWR_CR3, (u32 *)buff);
+	*(u32 *)buff = readl(priv->base + STM32MP_PWR_CR3);
+
+	return 0;
 }
 
 static int stm32mp_pwr_ofdata_to_platdata(struct udevice *dev)
 {
 	struct stm32mp_pwr_priv *priv = dev_get_priv(dev);
-	struct regmap *regmap;
 
-	regmap = syscon_get_regmap_by_driver_data(STM32MP_SYSCON_PWR);
-	if (IS_ERR(regmap)) {
-		pr_err("%s: unable to find regmap (%ld)\n", __func__,
-		       PTR_ERR(regmap));
-		return PTR_ERR(regmap);
-	}
-	priv->regmap = regmap;
+	priv->base = dev_read_addr(dev);
+	if (priv->base == FDT_ADDR_T_NONE)
+		return -EINVAL;
 
 	return 0;
 }
diff --git a/arch/arm/mach-stm32mp/syscon.c b/arch/arm/mach-stm32mp/syscon.c
index 6070837bf0..3e61ce4097 100644
--- a/arch/arm/mach-stm32mp/syscon.c
+++ b/arch/arm/mach-stm32mp/syscon.c
@@ -9,7 +9,6 @@
 #include <asm/arch/stm32.h>
 
 static const struct udevice_id stm32mp_syscon_ids[] = {
-	{ .compatible = "st,stm32mp1-pwr", .data = STM32MP_SYSCON_PWR },
 	{ .compatible = "st,stm32mp157-syscfg",
 	  .data = STM32MP_SYSCON_SYSCFG },
 	{ }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
