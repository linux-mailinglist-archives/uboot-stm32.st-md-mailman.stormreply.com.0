Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4133D014A
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Jul 2021 20:10:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA71CC5A4C8;
	Tue, 20 Jul 2021 18:10:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8387EC5A4C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jul 2021 18:10:50 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KI3Spd026143; Tue, 20 Jul 2021 20:10:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Z1GlDw5q/mCNSviUYlDw9gZS3FM2AmjCONrbP+TerhE=;
 b=anzjpHhyui4/zVNc2O+pt+qirtdyUa+SM5H9IXdLMwfWREPsUdqiE/f/WcssA4dWqe/5
 Hp8rrjbsnoF6J6fDxbtfXhnuNe0hAPS46NN4QqEaHanCYBAsUMyjceuPTX16c4z848iM
 GsVDzrHrKStAdvVc4IHJ74doxILR/MwwRZOXBC5pz/5GKCH2UyGJSE0vgQ8+csdq9zDw
 aPHLyc+dDnm7pvBPawHd7fMaataMQaye/DmkZwn7R6sXEIi1LboxAF88+kGLPeohCxsb
 xEyDaJhdyw8AnCNY5cBGbDLpl4KwSlV4XBqI3Ce0K2XnvEja0fjM+7soGVsT7+OSPjkp tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39wtqj377m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 20:10:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C901710002A;
 Tue, 20 Jul 2021 20:10:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDDAD2C4217;
 Tue, 20 Jul 2021 20:10:45 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Jul 2021 20:10:45
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 20 Jul 2021 20:09:56 +0200
Message-ID: <20210720200940.v3.6.I05af0032a32df49c4d6b7a18a84e2fd409097989@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
References: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
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
Subject: [Uboot-stm32] [PATCH v3 6/6] net: dwc: add a common empty ops
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

Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v2)

Changes in v2:
- cleanup ops by adding a common null ops (NEW)

 drivers/net/dwc_eth_qos.c | 97 +++++++++------------------------------
 1 file changed, 22 insertions(+), 75 deletions(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 9b1746b78b..79eb6cc926 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -281,7 +281,7 @@ struct eqos_ops {
 	int (*eqos_remove_resources)(struct udevice *dev);
 	int (*eqos_stop_resets)(struct udevice *dev);
 	int (*eqos_start_resets)(struct udevice *dev);
-	void (*eqos_stop_clks)(struct udevice *dev);
+	int (*eqos_stop_clks)(struct udevice *dev);
 	int (*eqos_start_clks)(struct udevice *dev);
 	int (*eqos_calibrate_pads)(struct udevice *dev);
 	int (*eqos_disable_calibration)(struct udevice *dev);
@@ -613,12 +613,7 @@ err:
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
@@ -633,9 +628,10 @@ static void eqos_stop_clks_tegra186(struct udevice *dev)
 #endif
 
 	debug("%s: OK\n", __func__);
+	return 0;
 }
 
-static void eqos_stop_clks_stm32(struct udevice *dev)
+static int eqos_stop_clks_stm32(struct udevice *dev)
 {
 #ifdef CONFIG_CLK
 	struct eqos_priv *eqos = dev_get_priv(dev);
@@ -648,11 +644,7 @@ static void eqos_stop_clks_stm32(struct udevice *dev)
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
@@ -694,16 +686,6 @@ static int eqos_start_resets_tegra186(struct udevice *dev)
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
@@ -714,16 +696,6 @@ static int eqos_stop_resets_tegra186(struct udevice *dev)
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
@@ -812,26 +784,6 @@ static ulong eqos_get_tick_clk_rate_imx(struct udevice *dev)
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
@@ -928,11 +880,6 @@ static int eqos_set_tx_clk_speed_tegra186(struct udevice *dev)
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
@@ -1881,11 +1828,6 @@ static int eqos_remove_resources_stm32(struct udevice *dev)
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
@@ -1974,6 +1916,11 @@ static int eqos_remove(struct udevice *dev)
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
@@ -2019,13 +1966,13 @@ static struct eqos_ops eqos_stm32_ops = {
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
 
@@ -2046,13 +1993,13 @@ static struct eqos_ops eqos_imx_ops = {
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
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
