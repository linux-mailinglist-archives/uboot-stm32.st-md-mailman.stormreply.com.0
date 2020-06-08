Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3AD1F155C
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Jun 2020 11:27:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 929C3C36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Jun 2020 09:27:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53C5BC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2020 09:27:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0589CvYT016518; Mon, 8 Jun 2020 11:27:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=vY5vP3P/0/EEkwi6LHlXwvwFhbzcpEwJbNKXzBW9cdM=;
 b=qAg7LGVP/cWjnGJ/uG4RucHJk1k/iG2hZlhQy/tw8qp15nQsfJsgmBOzCyHRamrI9t5T
 9iXGW5nyHJmD8d0oDYprUIcz8LXjhR5wOFdAkO/r6Rhz/8AMPPREcytbjozW46IJ3hfS
 PJonFrbUPNKAymAYRSVypV767GkiaxsjCH0tnGE2JnjBbahcaREkziB20ViTQYVann4C
 tTIy7+UCIh3IDnA0DFEjTJxOAP3Zw+ifv2dzmMzYNxlD5tqAxTcQbOLHGPBgh4/OB2Rj
 xkV64Xev7ZaHx9oqdHBogk5GzRoFxV7tUC1UKLn3r+reHKaNak53ABg7LgNwtSr/g21B kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g09711h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 11:27:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D95C100034;
 Mon,  8 Jun 2020 11:27:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3487C2AD9EF;
 Mon,  8 Jun 2020 11:27:21 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 8 Jun 2020 11:27:20 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 8 Jun 2020 11:27:19 +0200
Message-ID: <20200608092719.10643-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_04:2020-06-08,
 2020-06-08 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add Kconfig option to
	select supported configuration
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

Add configuration flag to select the supported dwc driver configuration:
- CONFIG_DWC_ETH_QOS_TEGRA186
- CONFIG_DWC_ETH_QOS_IMX
- CONFIG_DWC_ETH_QOS_STM32

See Linux driver ethernet/stmicro/stmmac and associated glue layers
for other configuration examples.

This patch removes the not-selected compatibles and lets the linker remove
the unused functions to reduce the size of the driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
Hi,

I propose this patch after Marek's remark in [1].

It is also linked to [2] to limit the STM32 glue for ST compatible.

[1] net: dwc_eth_qos: Make clk_rx and clk_tx optional
    http://patchwork.ozlabs.org/project/uboot/patch/20200512095603.29126-5-david.wu@rock-chips.com/#2432595

[2] net: dwc_eth_qos: update the compatible supported for STM32
    http://patchwork.ozlabs.org/project/uboot/list/?series=176917


 drivers/net/Kconfig       | 27 ++++++++++++++++++++++++---
 drivers/net/dwc_eth_qos.c | 12 +++++++++---
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 0b08de0ef4..c4b3667d3b 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -156,9 +156,30 @@ config DWC_ETH_QOS
 	help
 	  This driver supports the Synopsys Designware Ethernet QOS (Quality
 	  Of Service) IP block. The IP supports many options for bus type,
-	  clocking/reset structure, and feature list. This driver currently
-	  supports the specific configuration used in NVIDIA's Tegra186 chip,
-	  but should be extensible to other combinations quite easily.
+	  clocking/reset structure, and feature list.
+
+config DWC_ETH_QOS_IMX
+	bool "Synopsys DWC Ethernet QOS device support for IMX"
+	depends on DWC_ETH_QOS
+	help
+	  The Synopsys Designware Ethernet QOS IP block with the specific
+	  configuration used in IMX soc.
+
+config DWC_ETH_QOS_STM32
+	bool "Synopsys DWC Ethernet QOS device support for STM32"
+	depends on DWC_ETH_QOS
+	default y if ARCH_STM32MP
+	help
+	  The Synopsys Designware Ethernet QOS IP block with the specific
+	  configuration used in STM32MP soc.
+
+config DWC_ETH_QOS_TEGRA186
+	bool "Synopsys DWC Ethernet QOS device support for TEGRA186"
+	depends on DWC_ETH_QOS
+	default y if TEGRA186
+	help
+	  The Synopsys Designware Ethernet QOS IP block with specific
+	  configuration used in NVIDIA's Tegra186 chip.
 
 config E1000
 	bool "Intel PRO/1000 Gigabit Ethernet support"
diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 3f4437069b..d4536a325f 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -2100,7 +2100,7 @@ static struct eqos_ops eqos_tegra186_ops = {
 	.eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_tegra186
 };
 
-static const struct eqos_config eqos_tegra186_config = {
+static const struct eqos_config __maybe_unused eqos_tegra186_config = {
 	.reg_access_always_ok = false,
 	.mdio_wait = 10,
 	.swr_wait = 10,
@@ -2127,7 +2127,7 @@ static struct eqos_ops eqos_stm32_ops = {
 	.eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32
 };
 
-static const struct eqos_config eqos_stm32_config = {
+static const struct eqos_config __maybe_unused eqos_stm32_config = {
 	.reg_access_always_ok = false,
 	.mdio_wait = 10000,
 	.swr_wait = 50,
@@ -2154,7 +2154,7 @@ static struct eqos_ops eqos_imx_ops = {
 	.eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_imx
 };
 
-struct eqos_config eqos_imx_config = {
+struct eqos_config __maybe_unused eqos_imx_config = {
 	.reg_access_always_ok = false,
 	.mdio_wait = 10000,
 	.swr_wait = 50,
@@ -2165,18 +2165,24 @@ struct eqos_config eqos_imx_config = {
 };
 
 static const struct udevice_id eqos_ids[] = {
+#if IS_ENABLED(CONFIG_DWC_ETH_QOS_TEGRA186)
 	{
 		.compatible = "nvidia,tegra186-eqos",
 		.data = (ulong)&eqos_tegra186_config
 	},
+#endif
+#if IS_ENABLED(CONFIG_DWC_ETH_QOS_STM32)
 	{
 		.compatible = "snps,dwmac-4.20a",
 		.data = (ulong)&eqos_stm32_config
 	},
+#endif
+#if IS_ENABLED(CONFIG_DWC_ETH_QOS_IMX)
 	{
 		.compatible = "fsl,imx-eqos",
 		.data = (ulong)&eqos_imx_config
 	},
+#endif
 
 	{ }
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
