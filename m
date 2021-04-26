Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DE836B61E
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Apr 2021 17:47:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1862BC58D63;
	Mon, 26 Apr 2021 15:47:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1083CC57B74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 15:47:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QFS3bD016804; Mon, 26 Apr 2021 17:47:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=83lQ9ylLBzfaE5oNxMPaanRzyFqJlUDiZJB/IuPCzKI=;
 b=22yBC9u2Vj8FqxBgBhynhlGCZfkCLZw24r+qIuwt1YRAZGb2tmfNjq4yyphFx++9ONfH
 QCP4pmhh2+3xOnKT4oSRlP1RhaT6kj5SyKXx/jwUaKZgz2FF08p9H25E6BOBFmiZ5bUz
 YnvQ5cTI4STVrn5ieNMZX8KbLwT1eZxCUqA3pjfzvyxkc1bUnN+pH330McBo+GBQoidr
 jyLw89zgMyDY7DgCUWO4shROdTSczUp8wKnODxF6y5XeWw6hBwvv+OswdO8IdK4JMWL8
 DtzjcpPxx5iQghL9EgL6rDJUUjwF2TM9tsoWZkFH/M62jZNuhYXYWRaservhKvhKezWS cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 385aeedy8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 17:47:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 36C2410002A;
 Mon, 26 Apr 2021 17:47:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 299E024184F;
 Mon, 26 Apr 2021 17:47:07 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 17:47:06
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Apr 2021 17:46:52 +0200
Message-ID: <20210426174647.v2.6.I05af0032a32df49c4d6b7a18a84e2fd409097989@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
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
Subject: [Uboot-stm32] [PATCH v2 6/6] net: dwc: add a common empty ops
	eqos_null_ops
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

Add a common empty ops: eqos_null_ops() to remove the duplicated empty
functions and reduce the driver size for stm32 and imx config.

This patch also aligns the prototype of ops 'eqos_stop_clks' with other
eqos ops by adding return value.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- cleanup ops by adding a common null ops (NEW)

 drivers/net/dwc_eth_qos.c | 97 +++++++++------------------------------
 1 file changed, 22 insertions(+), 75 deletions(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 3fb8bfaf3a..4d1e5d6f8f 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -285,7 +285,7 @@ struct eqos_ops {
 	int (*eqos_remove_resources)(struct udevice *dev);
 	int (*eqos_stop_resets)(struct udevice *dev);
 	int (*eqos_start_resets)(struct udevice *dev);
-	void (*eqos_stop_clks)(struct udevice *dev);
+	int (*eqos_stop_clks)(struct udevice *dev);
 	int (*eqos_start_clks)(struct udevice *dev);
 	int (*eqos_calibrate_pads)(struct udevice *dev);
 	int (*eqos_disable_calibration)(struct udevice *dev);
@@ -615,12 +615,7 @@ err:
 #endif
 }
 
-static int eqos_start_clks_imx(struct udevice *dev)
-{
-	return 0;
-}
-
-static void eqos_stop_clks_tegra186(struct udevice *dev)
+static int eqos_stop_clks_tegra186(struct udevice *dev)
 {
 #ifdef CONFIG_CLK
 	struct eqos_priv *eqos = dev_get_priv(dev);
@@ -635,9 +630,10 @@ static void eqos_stop_clks_tegra186(struct udevice *dev)
 #endif
 
 	debug("%s: OK\n", __func__);
+	return 0;
 }
 
-static void eqos_stop_clks_stm32(struct udevice *dev)
+static int eqos_stop_clks_stm32(struct udevice *dev)
 {
 #ifdef CONFIG_CLK
 	struct eqos_priv *eqos = dev_get_priv(dev);
@@ -652,11 +648,7 @@ static void eqos_stop_clks_stm32(struct udevice *dev)
 #endif
 
 	debug("%s: OK\n", __func__);
-}
-
-static void eqos_stop_clks_imx(struct udevice *dev)
-{
-	/* empty */
+	return 0;
 }
 
 static int eqos_start_resets_tegra186(struct udevice *dev)
@@ -698,16 +690,6 @@ static int eqos_start_resets_tegra186(struct udevice *dev)
 	return 0;
 }
 
-static int eqos_start_resets_stm32(struct udevice *dev)
-{
-	return 0;
-}
-
-static int eqos_start_resets_imx(struct udevice *dev)
-{
-	return 0;
-}
-
 static int eqos_stop_resets_tegra186(struct udevice *dev)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
@@ -718,16 +700,6 @@ static int eqos_stop_resets_tegra186(struct udevice *dev)
 	return 0;
 }
 
-static int eqos_stop_resets_stm32(struct udevice *dev)
-{
-	return 0;
-}
-
-static int eqos_stop_resets_imx(struct udevice *dev)
-{
-	return 0;
-}
-
 static int eqos_calibrate_pads_tegra186(struct udevice *dev)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
@@ -816,26 +788,6 @@ static ulong eqos_get_tick_clk_rate_imx(struct udevice *dev)
 	return imx_get_eqos_csr_clk();
 }
 
-static int eqos_calibrate_pads_stm32(struct udevice *dev)
-{
-	return 0;
-}
-
-static int eqos_calibrate_pads_imx(struct udevice *dev)
-{
-	return 0;
-}
-
-static int eqos_disable_calibration_stm32(struct udevice *dev)
-{
-	return 0;
-}
-
-static int eqos_disable_calibration_imx(struct udevice *dev)
-{
-	return 0;
-}
-
 static int eqos_set_full_duplex(struct udevice *dev)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
@@ -932,11 +884,6 @@ static int eqos_set_tx_clk_speed_tegra186(struct udevice *dev)
 	return 0;
 }
 
-static int eqos_set_tx_clk_speed_stm32(struct udevice *dev)
-{
-	return 0;
-}
-
 static int eqos_set_tx_clk_speed_imx(struct udevice *dev)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
@@ -1894,11 +1841,6 @@ static int eqos_remove_resources_stm32(struct udevice *dev)
 	return 0;
 }
 
-static int eqos_remove_resources_imx(struct udevice *dev)
-{
-	return 0;
-}
-
 static int eqos_probe(struct udevice *dev)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
@@ -1987,6 +1929,11 @@ static int eqos_remove(struct udevice *dev)
 	return 0;
 }
 
+static int eqos_null_ops(struct udevice *dev)
+{
+	return 0;
+}
+
 static const struct eth_ops eqos_ops = {
 	.start = eqos_start,
 	.stop = eqos_stop,
@@ -2032,13 +1979,13 @@ static struct eqos_ops eqos_stm32_ops = {
 	.eqos_flush_buffer = eqos_flush_buffer_generic,
 	.eqos_probe_resources = eqos_probe_resources_stm32,
 	.eqos_remove_resources = eqos_remove_resources_stm32,
-	.eqos_stop_resets = eqos_stop_resets_stm32,
-	.eqos_start_resets = eqos_start_resets_stm32,
+	.eqos_stop_resets = eqos_null_ops,
+	.eqos_start_resets = eqos_null_ops,
 	.eqos_stop_clks = eqos_stop_clks_stm32,
 	.eqos_start_clks = eqos_start_clks_stm32,
-	.eqos_calibrate_pads = eqos_calibrate_pads_stm32,
-	.eqos_disable_calibration = eqos_disable_calibration_stm32,
-	.eqos_set_tx_clk_speed = eqos_set_tx_clk_speed_stm32,
+	.eqos_calibrate_pads = eqos_null_ops,
+	.eqos_disable_calibration = eqos_null_ops,
+	.eqos_set_tx_clk_speed = eqos_null_ops,
 	.eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32
 };
 
@@ -2059,13 +2006,13 @@ static struct eqos_ops eqos_imx_ops = {
 	.eqos_inval_buffer = eqos_inval_buffer_generic,
 	.eqos_flush_buffer = eqos_flush_buffer_generic,
 	.eqos_probe_resources = eqos_probe_resources_imx,
-	.eqos_remove_resources = eqos_remove_resources_imx,
-	.eqos_stop_resets = eqos_stop_resets_imx,
-	.eqos_start_resets = eqos_start_resets_imx,
-	.eqos_stop_clks = eqos_stop_clks_imx,
-	.eqos_start_clks = eqos_start_clks_imx,
-	.eqos_calibrate_pads = eqos_calibrate_pads_imx,
-	.eqos_disable_calibration = eqos_disable_calibration_imx,
+	.eqos_remove_resources = eqos_null_ops,
+	.eqos_stop_resets = eqos_null_ops,
+	.eqos_start_resets = eqos_null_ops,
+	.eqos_stop_clks = eqos_null_ops,
+	.eqos_start_clks = eqos_null_ops,
+	.eqos_calibrate_pads = eqos_null_ops,
+	.eqos_disable_calibration = eqos_null_ops,
 	.eqos_set_tx_clk_speed = eqos_set_tx_clk_speed_imx,
 	.eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_imx
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
