Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 354CC359707
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 10:00:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEEA6C56639;
	Fri,  9 Apr 2021 08:00:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84231C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 08:00:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1397vbvg006418; Fri, 9 Apr 2021 10:00:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=ee6vEBpbL/RYe/hqywgXETWICnKmET23KgeKqxkA51I=;
 b=KLZCztYBV/N/QryabKCM1f2XMfabP9OGy7rg97AvWuWi9xK9oBsCqIQCMk0KHyBZ2av6
 4S7pexPD7NPTWr13ueGg8yfsJBzGnr3Ik3ZYcGcnPKNtrJDL3fZxKTn90Kx+8T4YBQ59
 gJjKpExk6ObdV5VF1O2eWUZL3sVbeYaxKV/6gB0W1xo/j8Mg9UjPfvr7MG9bRdrdpAuy
 mVpGhIWyGfPH4z/BGfwjtGFxYknRpvDviAU0paXFJsuozNUqEbSvzTKPWbdvs99TYH4W
 p91zwA76pxH3jH38UROZVd/mGphvf8JZYB/V9DIXetL747KDNrRxYsb7/gV8I1ErUgTX 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37stwsypje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 10:00:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3069D10002A;
 Fri,  9 Apr 2021 10:00:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1DD9421E684;
 Fri,  9 Apr 2021 10:00:30 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr 2021 10:00:29
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 9 Apr 2021 10:00:26 +0200
Message-ID: <20210409100022.1.I93dea8b89ea632e7d8f2640a6eca6f6e69fed319@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_04:2021-04-08,
 2021-04-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, Stephen Warren <swarren@nvidia.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>, Patrick
 Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add support of device tree
	configuration for reset delay
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

The gpio reset assert/deassert delay are today harcoded in U-Boot driver
but the value should be read from DT.

STM32 use the generic binding defined in linux:
Documentation/devicetree/bindings/net/ethernet-phy.yaml

  reset-gpios:
    maxItems: 1
    description:
      The GPIO phandle and specifier for the PHY reset signal.

  reset-assert-us:
    description:
      Delay after the reset was asserted in microseconds. If this
      property is missing the delay will be skipped.

  reset-deassert-us:
    description:
      Delay after the reset was deasserted in microseconds. If
      this property is missing the delay will be skipped.

See also U-Boot: doc/device-tree-bindings/net/phy.txt

This patch moves these 2 delay configuration in the driver platdata
and manages this ethernet phy binding for STM32 variant;
when the properties are absent, the driver use the existing value = 2
and the minimal supported udelay = 1 to avoid issue with udelay(0)
when the the property is absent.

This patch also updates the tegra186 part to use the modified platdata,
even if the GPIO reset delay value is hardcoded in probe function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/net/dwc_eth_qos.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index e8242ca4e1..6ef750a348 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -293,6 +293,13 @@ struct eqos_ops {
 	ulong (*eqos_get_tick_clk_rate)(struct udevice *dev);
 };
 
+/* extend the u-class platdata (eth_pdata) with EQOS driver platdata */
+struct eqos_pdata {
+	struct eth_pdata eth_pdata;
+	u32 reset_assert_us;
+	u32 reset_deassert_us;
+};
+
 struct eqos_priv {
 	struct udevice *dev;
 	const struct eqos_config *config;
@@ -662,6 +669,7 @@ static void eqos_stop_clks_imx(struct udevice *dev)
 
 static int eqos_start_resets_tegra186(struct udevice *dev)
 {
+	struct eqos_pdata *eqos_plat = dev_get_plat(dev);
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	int ret;
 
@@ -672,14 +680,14 @@ static int eqos_start_resets_tegra186(struct udevice *dev)
 		pr_err("dm_gpio_set_value(phy_reset, assert) failed: %d", ret);
 		return ret;
 	}
-
-	udelay(2);
+	udelay(eqos_plat->reset_assert_us);
 
 	ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 0);
 	if (ret < 0) {
 		pr_err("dm_gpio_set_value(phy_reset, deassert) failed: %d", ret);
 		return ret;
 	}
+	udelay(eqos_plat->reset_deassert_us);
 
 	ret = reset_assert(&eqos->reset_ctl);
 	if (ret < 0) {
@@ -701,6 +709,7 @@ static int eqos_start_resets_tegra186(struct udevice *dev)
 
 static int eqos_start_resets_stm32(struct udevice *dev)
 {
+	struct eqos_pdata *eqos_plat = dev_get_plat(dev);
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	int ret;
 
@@ -712,8 +721,7 @@ static int eqos_start_resets_stm32(struct udevice *dev)
 			       ret);
 			return ret;
 		}
-
-		udelay(2);
+		udelay(eqos_plat->reset_assert_us);
 
 		ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 0);
 		if (ret < 0) {
@@ -721,6 +729,7 @@ static int eqos_start_resets_stm32(struct udevice *dev)
 			       ret);
 			return ret;
 		}
+		udelay(eqos_plat->reset_deassert_us);
 	}
 	debug("%s: OK\n", __func__);
 
@@ -1070,7 +1079,8 @@ static int eqos_adjust_link(struct udevice *dev)
 
 static int eqos_write_hwaddr(struct udevice *dev)
 {
-	struct eth_pdata *plat = dev_get_plat(dev);
+	struct eqos_pdata *eqos_plat = dev_get_plat(dev);
+	struct eth_pdata *plat = &eqos_plat->eth_pdata;
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	uint32_t val;
 
@@ -1114,7 +1124,8 @@ static int eqos_write_hwaddr(struct udevice *dev)
 
 static int eqos_read_rom_hwaddr(struct udevice *dev)
 {
-	struct eth_pdata *pdata = dev_get_plat(dev);
+	struct eqos_pdata *eqos_plat = dev_get_plat(dev);
+	struct eth_pdata *pdata = &eqos_plat->eth_pdata;
 
 #ifdef CONFIG_ARCH_IMX8M
 	imx_get_mac_from_fuse(dev_seq(dev), pdata->enetaddr);
@@ -1704,6 +1715,7 @@ static int eqos_remove_resources_core(struct udevice *dev)
 
 static int eqos_probe_resources_tegra186(struct udevice *dev)
 {
+	struct eqos_pdata *eqos_plat = dev_get_plat(dev);
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	int ret;
 
@@ -1722,6 +1734,8 @@ static int eqos_probe_resources_tegra186(struct udevice *dev)
 		pr_err("gpio_request_by_name(phy reset) failed: %d", ret);
 		goto err_free_reset_eqos;
 	}
+	eqos_plat->reset_assert_us = 2;
+	eqos_plat->reset_deassert_us = 1;
 
 	ret = clk_get_by_name(dev, "slave_bus", &eqos->clk_slave_bus);
 	if (ret) {
@@ -1783,6 +1797,7 @@ __weak int board_interface_eth_init(struct udevice *dev,
 
 static int eqos_probe_resources_stm32(struct udevice *dev)
 {
+	struct eqos_pdata *eqos_plat = dev_get_plat(dev);
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	int ret;
 	phy_interface_t interface;
@@ -1839,6 +1854,10 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 		if (ret)
 			pr_warn("gpio_request_by_name(phy reset) not provided %d",
 				ret);
+		eqos_plat->reset_assert_us = ofnode_read_u32_default(phandle_args.node,
+								     "reset-assert-us", 2);
+		eqos_plat->reset_deassert_us = ofnode_read_u32_default(phandle_args.node,
+								       "reset-deassert-us", 1);
 
 		eqos->phyaddr = ofnode_read_u32_default(phandle_args.node,
 							"reg", -1);
@@ -2167,5 +2186,5 @@ U_BOOT_DRIVER(eth_eqos) = {
 	.remove = eqos_remove,
 	.ops = &eqos_ops,
 	.priv_auto	= sizeof(struct eqos_priv),
-	.plat_auto	= sizeof(struct eth_pdata),
+	.plat_auto	= sizeof(struct eqos_pdata),
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
