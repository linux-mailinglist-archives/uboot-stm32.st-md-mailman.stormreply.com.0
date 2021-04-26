Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80036B618
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Apr 2021 17:47:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C335EC3FADC;
	Mon, 26 Apr 2021 15:47:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5894C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 15:47:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QFSRNX022230; Mon, 26 Apr 2021 17:47:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=53IswZWowBUcvqQv4kuNtDlTeo/OYl4lUH4lMBh6N2M=;
 b=lFXfSm+gyWCvXpxe1BhuRmISnvoExnC2HtN4HaPCvwpGmDWbHnWbEsoIgSEEipTYzUCN
 8Fue5RMqhWomknx1jvJNZ+5uxQtb32wIKTMqJKmJlJdUZdCVTox6ctp+cggswX1oaxxq
 XbA+aNFhCxTafivljXQ3nFfZbXHU9tQy/A5Y5YIAmh9VLp+DHOMuL2UOF/3FvBLQH0ju
 ut1NS0A94Agn/eTfvSG6xVFUB3BzW8H8qBywZRR2sydcP1vMh7WN4vNNX42riFx6zqpl
 +qFvWN3Lvbu+Ob/1Nj6B2qhkHOo0qrNgTiIMuPXTR59/0K14yaaPCJV7wftF1+xPlAqI 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 385b0xxjdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 17:47:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E32DD10002A;
 Mon, 26 Apr 2021 17:47:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D582823BD64;
 Mon, 26 Apr 2021 17:47:02 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 17:47:02
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Apr 2021 17:46:47 +0200
Message-ID: <20210426174647.v2.1.I5a50f8eef93c11cb54dfdd3b11183422a82fb373@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_07:2021-04-26,
 2021-04-26 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: [Uboot-stm32] [PATCH v2 1/6] net: eth-phy: add support of device
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

Changes in v2:
- Update eth-phy driver (NEW)

 drivers/net/eth-phy-uclass.c | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
index 07aebd935e..153f6909eb 100644
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
@@ -110,13 +115,58 @@ int eth_phy_get_addr(struct udevice *dev)
 	return reg;
 }
 
+/* parsing generic properties of devicetree/bindings/net/ethernet-phy.yaml */
+static int eth_phy_of_to_plat(struct udevice *dev)
+{
+	struct eth_phy_device_priv *uc_priv = dev_get_uclass_priv(dev);
+	int ret;
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
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
