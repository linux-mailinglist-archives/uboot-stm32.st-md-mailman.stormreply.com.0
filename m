Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4425D3D0149
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Jul 2021 20:10:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCC7CC5A4C6;
	Tue, 20 Jul 2021 18:10:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C0E5C5A4C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jul 2021 18:10:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KI2ucN031518; Tue, 20 Jul 2021 20:10:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=SpSE/Nmx/dd2RkJ3hUIZnweNYXcr0FsXCq7y9/rKV6Q=;
 b=k6SPyrfc+oLd6fWQ+G50kU6yqgER1FjHUFRxxSVtuwfe+qXqzxPlUAhfWmneZW2nTrzs
 vi/fYG6FvzYJbJsNUzhmTT+T06ngBqbCOLLQvUqKd7Z47P3Mb99gPw2rg3dDK8p2wGoH
 vAPl7Aygtq6ts5i3fRGkBZg9GZZsxlBnLNRuMZILLEGPhEXNMsUQxKy4LP/oo6PvBLuP
 OUvJCO2+QMyMXNMG0QeutzcTGOYUpWs1TylEcUWtCIddFP0IaQrrhO3XfTBnmWSZrjrM
 8/o5ggZ83RHqhPDMJ33uhzC8pmcEjU1Be2AmTI9jC/nZGfoW9C7EIYypJAjl6SAHbrvG Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39wu03u2ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 20:10:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E6DF3100038;
 Tue, 20 Jul 2021 20:10:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC3A12C4217;
 Tue, 20 Jul 2021 20:10:44 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Jul 2021 20:10:44
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 20 Jul 2021 20:09:55 +0200
Message-ID: <20210720200940.v3.5.I52d5d9f5fb91b6bd92ec7fed517bfe36074d487d@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
References: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
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
Subject: [Uboot-stm32] [PATCH v3 5/6] net: dwc_eth_qos: use generic ethernet
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

Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v2)

Changes in v2:
- use generic ethernet phy for stm32 variant, this patch is a REWORK of
  previous serie: the device parsing is done in eth-phy driver and the gpio
  support is removed in stm32 variant: eqos_start/stop_resets_stm32 and
  eqos_probe_resources_stm32.

 drivers/net/Kconfig       |  1 +
 drivers/net/dwc_eth_qos.c | 50 ---------------------------------------
 2 files changed, 1 insertion(+), 50 deletions(-)

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 726ad36b7c..130db9fb39 100644
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
index a57c35785f..9b1746b78b 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -696,29 +696,6 @@ static int eqos_start_resets_tegra186(struct udevice *dev)
 
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
 
@@ -739,18 +716,6 @@ static int eqos_stop_resets_tegra186(struct udevice *dev)
 
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
 
@@ -1772,7 +1737,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	int ret;
 	phy_interface_t interface;
-	struct ofnode_phandle_args phandle_args;
 
 	debug("%s(dev=%p):\n", __func__, dev);
 
@@ -1812,20 +1776,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
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
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
