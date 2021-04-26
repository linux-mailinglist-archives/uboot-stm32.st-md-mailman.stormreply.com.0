Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 462BB36B61D
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Apr 2021 17:47:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FEC8C58D60;
	Mon, 26 Apr 2021 15:47:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB117C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 15:47:10 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QFS4TP016829; Mon, 26 Apr 2021 17:47:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=8+Kg6JFGZ4lQrCgJXDoTCC/B4rOmHgexOWe57bNAVxY=;
 b=ZTXNKmbcZh0Sq4SeQtxq//8j72eLpL8IGfFpEXXNcsxg09X7e2YDaQqPDlUblyGiaT7b
 RvuHoP4a+oxkrUvm/2HuZAhNwEqyU3Xm2em9KnHk4QIvY422FZ6cTGEt/bPNuXa+ZAF7
 LvfjCjNdyDk6ekYhVkH0n1kCFVy4ScpJTa9RP6OxGHX36uG27plmmf5i/dKV4n8BhWxk
 R3edfOA4QqA3H9M53D0ZYcbrKOMqbCvhjlLyh6wARmiXWwKpkMnpQa5B7rBuCeNs6E15
 wbqEbDgWoTStNKNhnNn7pWNm97AjSIDh8FA74mb8I2d2wWuHG/k+f/3BDyz+UazvA5VD mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 385aeedy8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 17:47:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 58C0610002A;
 Mon, 26 Apr 2021 17:47:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4BB9224184F;
 Mon, 26 Apr 2021 17:47:06 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 17:47:05
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Apr 2021 17:46:51 +0200
Message-ID: <20210426174647.v2.5.I52d5d9f5fb91b6bd92ec7fed517bfe36074d487d@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_07:2021-04-26,
 2021-04-26 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: [Uboot-stm32] [PATCH v2 5/6] net: dwc_eth_qos: use generic ethernet
	phy for stm32 variant
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

Use the generic ethernet phy which already manages the correct binding
for gpio reset, including the assert an deassert delays.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- use generic ethernet phy for stm32 variant, this patch is a REWORK of
  previous serie: the device parsing is done in eth-phy driver and the gpio
  support is removed in stm32 variant: eqos_start/stop_resets_stm32 and
  eqos_probe_resources_stm32.

 drivers/net/Kconfig       |  1 +
 drivers/net/dwc_eth_qos.c | 50 ---------------------------------------
 2 files changed, 1 insertion(+), 50 deletions(-)

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 382639044b..adf43fb42a 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -206,6 +206,7 @@ config DWC_ETH_QOS_IMX
 config DWC_ETH_QOS_STM32
 	bool "Synopsys DWC Ethernet QOS device support for STM32"
 	depends on DWC_ETH_QOS
+	select DM_ETH_PHY
 	default y if ARCH_STM32MP
 	help
 	  The Synopsys Designware Ethernet QOS IP block with the specific
diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index e625aea8d1..3fb8bfaf3a 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -700,29 +700,6 @@ static int eqos_start_resets_tegra186(struct udevice *dev)
 
 static int eqos_start_resets_stm32(struct udevice *dev)
 {
-	struct eqos_priv *eqos = dev_get_priv(dev);
-	int ret;
-
-	debug("%s(dev=%p):\n", __func__, dev);
-	if (dm_gpio_is_valid(&eqos->phy_reset_gpio)) {
-		ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 1);
-		if (ret < 0) {
-			pr_err("dm_gpio_set_value(phy_reset, assert) failed: %d",
-			       ret);
-			return ret;
-		}
-
-		udelay(2);
-
-		ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 0);
-		if (ret < 0) {
-			pr_err("dm_gpio_set_value(phy_reset, deassert) failed: %d",
-			       ret);
-			return ret;
-		}
-	}
-	debug("%s: OK\n", __func__);
-
 	return 0;
 }
 
@@ -743,18 +720,6 @@ static int eqos_stop_resets_tegra186(struct udevice *dev)
 
 static int eqos_stop_resets_stm32(struct udevice *dev)
 {
-	struct eqos_priv *eqos = dev_get_priv(dev);
-	int ret;
-
-	if (dm_gpio_is_valid(&eqos->phy_reset_gpio)) {
-		ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 1);
-		if (ret < 0) {
-			pr_err("dm_gpio_set_value(phy_reset, assert) failed: %d",
-			       ret);
-			return ret;
-		}
-	}
-
 	return 0;
 }
 
@@ -1785,7 +1750,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	int ret;
 	phy_interface_t interface;
-	struct ofnode_phandle_args phandle_args;
 
 	debug("%s(dev=%p):\n", __func__, dev);
 
@@ -1825,20 +1789,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 	if (ret)
 		pr_warn("No phy clock provided %d", ret);
 
-	ret = dev_read_phandle_with_args(dev, "phy-handle", NULL, 0, 0,
-					 &phandle_args);
-	if (!ret) {
-		/* search "reset-gpios" in phy node */
-		ret = gpio_request_by_name_nodev(phandle_args.node,
-						 "reset-gpios", 0,
-						 &eqos->phy_reset_gpio,
-						 GPIOD_IS_OUT |
-						 GPIOD_IS_OUT_ACTIVE);
-		if (ret)
-			pr_warn("gpio_request_by_name(phy reset) not provided %d",
-				ret);
-	}
-
 	debug("%s: OK\n", __func__);
 	return 0;
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
