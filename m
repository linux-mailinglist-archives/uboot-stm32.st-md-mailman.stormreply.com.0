Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFD618987B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:50:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6CBAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:50:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB06DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 09:50:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9mnmF009871; Wed, 18 Mar 2020 10:50:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=hFP9N2si9xnDbwQQL1FuTLjC7iapIq2AeYlcGvKBHmg=;
 b=SdgGPpmM4Jpr340EKF6TZ2HuguDOIcmLYTkM0bcL//PBnVaDjAtiIV1Ep8OF/wSefujD
 xOmiJa510xB+8cfeS/w9CV0AOJJcNyPbF7Y5atRH7C9uY54WWxZMdYtRFOIFUp2wq6GC
 9BzZ0GK7JFTYD2hAE7KCXBYOemm6JtZ42v+EXGek0GMo5xWcD5OG/62Pa/f6MT3BR7k9
 YErXtsUwLkeSp6ZRgxmbS5AdoTqHEkb6fPnPcX/C/pVgzjjU6ye87DsmIpIw02elQrv+
 nZByI1tPjsbw3kjLEweLGelcEpanAjQN5NJniGtDGeE4od/RLdPot0SH1qJ9mA2CECj5 LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yua4waaq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 10:50:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0B6810002A;
 Wed, 18 Mar 2020 10:50:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E029C21FEB7;
 Wed, 18 Mar 2020 10:50:20 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 10:50:20 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 10:50:15 +0100
Message-ID: <20200318095016.19942-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] net: dwc_eth_qos: implement reset-gpios
	for stm32
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

From: Christophe Roullier <christophe.roullier@st.com>

Add management of property "reset-gpios" in the node identified by
"phy-handle" to configure any GPIO used to reset the PHY.

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
Reviewed-by: Patrice CHOTARD <patrice.chotard@st.com>
Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/net/dwc_eth_qos.c | 53 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 0564bebf76..4796659216 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -694,6 +694,29 @@ static int eqos_start_resets_tegra186(struct udevice *dev)
 
 static int eqos_start_resets_stm32(struct udevice *dev)
 {
+	struct eqos_priv *eqos = dev_get_priv(dev);
+	int ret;
+
+	debug("%s(dev=%p):\n", __func__, dev);
+	if (dm_gpio_is_valid(&eqos->phy_reset_gpio)) {
+		ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 1);
+		if (ret < 0) {
+			pr_err("dm_gpio_set_value(phy_reset, assert) failed: %d",
+			       ret);
+			return ret;
+		}
+
+		udelay(2);
+
+		ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 0);
+		if (ret < 0) {
+			pr_err("dm_gpio_set_value(phy_reset, deassert) failed: %d",
+			       ret);
+			return ret;
+		}
+	}
+	debug("%s: OK\n", __func__);
+
 	return 0;
 }
 
@@ -709,6 +732,18 @@ static int eqos_stop_resets_tegra186(struct udevice *dev)
 
 static int eqos_stop_resets_stm32(struct udevice *dev)
 {
+	struct eqos_priv *eqos = dev_get_priv(dev);
+	int ret;
+
+	if (dm_gpio_is_valid(&eqos->phy_reset_gpio)) {
+		ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 1);
+		if (ret < 0) {
+			pr_err("dm_gpio_set_value(phy_reset, assert) failed: %d",
+			       ret);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -1604,6 +1639,7 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	int ret;
 	phy_interface_t interface;
+	struct ofnode_phandle_args phandle_args;
 
 	debug("%s(dev=%p):\n", __func__, dev);
 
@@ -1641,6 +1677,20 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 	if (ret)
 		pr_warn("No phy clock provided %d", ret);
 
+	ret = dev_read_phandle_with_args(dev, "phy-handle", NULL, 0, 0,
+					 &phandle_args);
+	if (!ret) {
+		/* search "reset-gpios" in phy node */
+		ret = gpio_request_by_name_nodev(phandle_args.node,
+						 "reset-gpios", 0,
+						 &eqos->phy_reset_gpio,
+						 GPIOD_IS_OUT |
+						 GPIOD_IS_OUT_ACTIVE);
+		if (ret)
+			pr_warn("gpio_request_by_name(phy reset) not provided %d",
+				ret);
+	}
+
 	debug("%s: OK\n", __func__);
 	return 0;
 
@@ -1704,6 +1754,9 @@ static int eqos_remove_resources_stm32(struct udevice *dev)
 	if (clk_valid(&eqos->clk_ck))
 		clk_free(&eqos->clk_ck);
 
+	if (dm_gpio_is_valid(&eqos->phy_reset_gpio))
+		dm_gpio_free(dev, &eqos->phy_reset_gpio);
+
 	debug("%s: OK\n", __func__);
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
