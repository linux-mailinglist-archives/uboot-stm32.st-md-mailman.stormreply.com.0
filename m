Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F21DA3D0146
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Jul 2021 20:10:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC87DC597BD;
	Tue, 20 Jul 2021 18:10:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61DB4C597BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jul 2021 18:10:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KI2w8O013100; Tue, 20 Jul 2021 20:10:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=MZQZ58JoAx3+vIxlZen4oREshZ03NmssFTnGWAGEi9s=;
 b=ANajbegNCtZcAlx4r5nwOIIJaMzMxZoL0nodJZZjPMEWoyB/P4Ontr3rnJ2PJxmJI9Oc
 HG1hrhgCnRa4f8JNFGDc+TQSr6dXqfvQycwYn66o3xfprJ8RScW3VYvz0tyVO+/oPbn9
 CJwy42Sl1DrvA6/kgiE93icsKtvPeUvTCKRsCtGRio+70pR7t7dXJPU49joeAf5tIc0s
 dsV99SFPVubkGYPgc9bnUtHh4oYbls5ij6H0HUrhFCbgeOM5B4UXe+EhU8DU2FBgSeDx
 RL4PEb4Rni0+iE56O1QQ9PA2ISTHAJkI1s2O+kBx1gU9yU24bZTGBgwszxo/fFks5FtH Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39wtu2k57x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 20:10:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A0E910002A;
 Tue, 20 Jul 2021 20:10:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D7B32C4217;
 Tue, 20 Jul 2021 20:10:41 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Jul 2021 20:10:40
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 20 Jul 2021 20:09:51 +0200
Message-ID: <20210720200940.v3.1.I5a50f8eef93c11cb54dfdd3b11183422a82fb373@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
References: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 1/6] net: eth-phy: add support of device
	tree configuration for gpio reset
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

The gpio reset and the assert or deassert delay are defined in generic
binding of the ethernet phy in Linux:
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

This patch adds the parsing of this common DT properties in the
u-class "eth_phy_generic", used by default in the associated driver
"eth_phy_generic_drv"

This parsing function eth_phy_of_to_plat can be reused by other
ethernet phy drivers for this uclass UCLASS_ETH_PHY.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v3:
- allow compilation without DM_GPIO

Changes in v2:
- Update eth-phy driver (NEW)

 drivers/net/eth-phy-uclass.c | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
index 07aebd935e..7abed14392 100644
--- a/drivers/net/eth-phy-uclass.c
+++ b/drivers/net/eth-phy-uclass.c
@@ -6,12 +6,17 @@
 #include <common.h>
 #include <dm.h>
 #include <net.h>
+#include <asm-generic/gpio.h>
 #include <dm/device-internal.h>
 #include <dm/uclass-internal.h>
 #include <dm/lists.h>
+#include <linux/delay.h>
 
 struct eth_phy_device_priv {
 	struct mii_dev *mdio_bus;
+	struct gpio_desc reset_gpio;
+	u32 reset_assert_delay;
+	u32 reset_deassert_delay;
 };
 
 int eth_phy_binds_nodes(struct udevice *eth_dev)
@@ -110,13 +115,64 @@ int eth_phy_get_addr(struct udevice *dev)
 	return reg;
 }
 
+/* parsing generic properties of devicetree/bindings/net/ethernet-phy.yaml */
+static int eth_phy_of_to_plat(struct udevice *dev)
+{
+	struct eth_phy_device_priv *uc_priv = dev_get_uclass_priv(dev);
+	int ret;
+
+	if (!CONFIG_IS_ENABLED(DM_GPIO))
+		return 0;
+
+	/* search "reset-gpios" in phy node */
+	ret = gpio_request_by_name(dev, "reset-gpios", 0,
+				   &uc_priv->reset_gpio,
+				   GPIOD_IS_OUT);
+	if (ret != -ENOENT)
+		return ret;
+
+	uc_priv->reset_assert_delay = dev_read_u32_default(dev, "reset-assert-us", 0);
+	uc_priv->reset_deassert_delay = dev_read_u32_default(dev, "reset-deassert-us", 0);
+
+	return 0;
+}
+
+void eth_phy_reset(struct udevice *dev, int value)
+{
+	struct eth_phy_device_priv *uc_priv = dev_get_uclass_priv(dev);
+	u32 delay;
+
+	if (!CONFIG_IS_ENABLED(DM_GPIO))
+		return;
+
+	if (!dm_gpio_is_valid(&uc_priv->reset_gpio))
+		return;
+
+	dm_gpio_set_value(&uc_priv->reset_gpio, value);
+
+	delay = value ? uc_priv->reset_assert_delay : uc_priv->reset_deassert_delay;
+	if (delay)
+		udelay(delay);
+}
+
+static int eth_phy_pre_probe(struct udevice *dev)
+{
+	/* Assert and deassert the reset signal */
+	eth_phy_reset(dev, 1);
+	eth_phy_reset(dev, 0);
+
+	return 0;
+}
+
 UCLASS_DRIVER(eth_phy_generic) = {
 	.id		= UCLASS_ETH_PHY,
 	.name		= "eth_phy_generic",
 	.per_device_auto	= sizeof(struct eth_phy_device_priv),
+	.pre_probe	= eth_phy_pre_probe,
 };
 
 U_BOOT_DRIVER(eth_phy_generic_drv) = {
 	.name		= "eth_phy_generic_drv",
 	.id		= UCLASS_ETH_PHY,
+	.of_to_plat	= eth_phy_of_to_plat,
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
