Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F375F92DA
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 15:40:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F32BAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 14:40:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EBCBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 14:40:05 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xACEbAW5005858; Tue, 12 Nov 2019 15:40:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=sycYQY7PMl9T2MwZQKcKGreE983c7OkKIMkTMTn59sE=;
 b=dA+gzDkjDxAms5poMh3p/zIpUifcA8b2uGL3X27QLldfMBCfJgncVx+eTXdS0wqdbFUv
 +tVMMzQ4zXu/zFpPPNRKsQp9arkyGSyRORnGaX8hfBAcgJr3OGCfsrJ/lqVZtOFHFb4x
 x969lGewEmoPUKJ4R23DwaewoG5Z+nCuz2OwEHgqCg2I1yyIV7h7i4LN2zfobSYyzRI8
 vsyZcXOVkhT0zjEToaZBcqbA60Ul1ovWy5lPbimWcVv6ffz5U+wMDT0/0AQ9pZE7L0Ri
 MqPd8/w5H80DNQNmBOaVDnJoh6ROtq3hBGtRpqlcDOToZzOT6GWZwgjVzQFAqFj9Yrse iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w7psb2psu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 15:40:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E599A100038;
 Tue, 12 Nov 2019 15:40:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDDC92C5EB5;
 Tue, 12 Nov 2019 15:40:00 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 12 Nov 2019 15:40:00 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 12 Nov 2019 15:39:58 +0100
Message-ID: <20191112153954.1.Iff44a1504ac7a1605e9ea0706753235c6b9cab15@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_04:2019-11-11,2019-11-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Anatolij Gustschin <agust@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] video: stm32: remove the compatible "synopsys,
	dw-mipi-dsi" support
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

Remove the compatible "synopsys,dw-mipi-dsi" added in U-Boot
(it don't exist in Linux kernel binding); it is only used
to bind the generic synopsys UCLASS_DSI_HOST "dw_mipi_dsi" to
the driver "stm32-display-dsi" UCLASS_VIDEO_BRIDGE

This binding is done in Linux kernel drivers without compatible
(dw_mipi_dsi_bind() is called in bind of driver, for example in
drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c).

This patch does the same in U-Boot driver, the STM32 driver
calls during its bind the function device_bind_driver_to_node
to bind the generic driver "dw_mipi_dsi" at the same address.

This patch reduces the device tree differences
between Linux kernel and U-Boot for stm32mp1 platform.

Tested with v2020.01-rc1 on STM32MP157C-EV1 and STM32MP157C-DK2.

The dependency of driver is clearer and the probe order is guaranteed.

STM32MP> dm tree
 Class     Index  Probed  Driver                Name
-----------------------------------------------------------
 root          0  [ + ]   root_driver           root_driver
 sysreset      0  [   ]   syscon_reboot         |-- reboot
 simple_bus    0  [ + ]   generic_simple_bus    |-- soc
 serial        0  [ + ]   serial_stm32          |   |-- serial@40010000
...
 video_brid    0  [ + ]   stm32-display-dsi     |   |-- dsi@5a000000
 dsi_host      0  [ + ]   dw_mipi_dsi           |   |   |-- dsihost
 panel         0  [ + ]   rm68200_panel         |   |   `-- panel-dsi@0
...


Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi |  7 -------
 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi |  5 -----
 drivers/video/dw_mipi_dsi.c              |  6 ------
 drivers/video/stm32/stm32_dsi.c          | 15 ++++++++++++++-
 4 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi b/arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi
index cd9947f166..18ac1e3cb2 100644
--- a/arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi
@@ -5,13 +5,6 @@
 
 #include "stm32mp157a-dk1-u-boot.dtsi"
 
-/ {
-	dsi_host: dsi_host {
-		compatible = "synopsys,dw-mipi-dsi";
-		status = "okay";
-	};
-};
-
 &i2c1 {
 	hdmi-transmitter@39 {
 		reset-gpios = <&gpioa 10 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
index af5945d20b..ec60486f41 100644
--- a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
@@ -14,11 +14,6 @@
 		spi0 = &qspi;
 		usb0 = &usbotg_hs;
 	};
-
-	dsi_host: dsi_host {
-		compatible = "synopsys,dw-mipi-dsi";
-		status = "okay";
-	};
 };
 
 &flash0 {
diff --git a/drivers/video/dw_mipi_dsi.c b/drivers/video/dw_mipi_dsi.c
index 04b07e3a2c..83d7c7b2c0 100644
--- a/drivers/video/dw_mipi_dsi.c
+++ b/drivers/video/dw_mipi_dsi.c
@@ -816,15 +816,9 @@ static int dw_mipi_dsi_probe(struct udevice *dev)
 	return 0;
 }
 
-static const struct udevice_id dw_mipi_dsi_ids[] = {
-	{ .compatible = "synopsys,dw-mipi-dsi" },
-	{ }
-};
-
 U_BOOT_DRIVER(dw_mipi_dsi) = {
 	.name			= "dw_mipi_dsi",
 	.id			= UCLASS_DSI_HOST,
-	.of_match		= dw_mipi_dsi_ids,
 	.probe			= dw_mipi_dsi_probe,
 	.ops			= &dw_mipi_dsi_ops,
 	.priv_auto_alloc_size	= sizeof(struct dw_mipi_dsi),
diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
index cb89576e1d..12895a8f5d 100644
--- a/drivers/video/stm32/stm32_dsi.c
+++ b/drivers/video/stm32/stm32_dsi.c
@@ -20,6 +20,7 @@
 #include <asm/io.h>
 #include <asm/arch/gpio.h>
 #include <dm/device-internal.h>
+#include <dm/lists.h>
 #include <linux/iopoll.h>
 #include <power/regulator.h>
 
@@ -399,6 +400,18 @@ static int stm32_dsi_set_backlight(struct udevice *dev, int percent)
 	return 0;
 }
 
+static int stm32_dsi_bind(struct udevice *dev)
+{
+	int ret;
+
+	ret = device_bind_driver_to_node(dev, "dw_mipi_dsi", "dsihost",
+					 dev_ofnode(dev), NULL);
+	if (ret)
+		return ret;
+
+	return dm_scan_fdt_dev(dev);
+}
+
 static int stm32_dsi_probe(struct udevice *dev)
 {
 	struct stm32_dsi_priv *priv = dev_get_priv(dev);
@@ -483,7 +496,7 @@ U_BOOT_DRIVER(stm32_dsi) = {
 	.name				= "stm32-display-dsi",
 	.id				= UCLASS_VIDEO_BRIDGE,
 	.of_match			= stm32_dsi_ids,
-	.bind				= dm_scan_fdt_dev,
+	.bind				= stm32_dsi_bind,
 	.probe				= stm32_dsi_probe,
 	.ops				= &stm32_dsi_ops,
 	.priv_auto_alloc_size		= sizeof(struct stm32_dsi_priv),
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
