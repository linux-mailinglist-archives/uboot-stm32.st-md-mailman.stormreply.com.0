Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E00DBA8580B
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Apr 2025 11:29:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92FADC78F89;
	Fri, 11 Apr 2025 09:29:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2308BC640E5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Apr 2025 09:29:44 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B9Snk7023534;
 Fri, 11 Apr 2025 11:29:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=mjuS0K188lu31W5lg/oB8j
 GIinih1XD0PQpx6M4anWQ=; b=DtGsjTOiZvAaz2t6hWZyXlNLzIQv9L9sZCw8Il
 X0PY+MwzDs2/zEY6ZVlFa33wnIxbp/tjKOgIZOOEM1bUT/kNnjvlwdlXVBCttL6i
 e4yItMcYiL0+gZfYsh4QnXRspwiLtuAYfGcXYdN6VMekYFQcAtqRdOjLYy4yNZaj
 2G2VScVuwnQJslJ8wTWE3dDwJ9IBs6GrNYbLE8HJC2mCvY7TuIyQ5qVVYWEn3A8O
 GQEZBlrAIQ0jlDI1UHKIWV/kXEmuYtS9iMBOgI2V37ih00ga9WtLGpvu4+aYvvJn
 PheD9gn3w8iy2GPl0vsxQKeW1TDQ3NQsQ2wD+EzXeHSJCgmg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45xgpduppk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Apr 2025 11:29:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D772940045;
 Fri, 11 Apr 2025 11:28:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0661C9B40B5;
 Fri, 11 Apr 2025 11:27:24 +0200 (CEST)
Received: from localhost (10.252.25.37) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 11:27:23 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 11 Apr 2025 11:27:20 +0200
Message-ID: <20250411092721.331518-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.25.37]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
Cc: Erik Schumacher <erik.schumacher@iris-sensing.com>,
 Marek Vasut <marex@denx.de>, Greg Malysa <malysagreg@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Heesub Shin <heesub@gmail.com>,
 Philip Oberfichtner <pro@denx.de>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>, Tom Rini <trini@konsulko.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add support of stm32mp2
	platform
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

From: Christophe Roullier <christophe.roullier@foss.st.com>

Add compatible "st,stm32mp25-dwmac" to manage STM32MP2 boards

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/net/dwc_eth_qos.c       |  4 ++++
 drivers/net/dwc_eth_qos.h       |  1 +
 drivers/net/dwc_eth_qos_stm32.c | 11 +++++++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index b4ec3614696..6605de6e036 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -1599,6 +1599,10 @@ static const struct udevice_id eqos_ids[] = {
 		.compatible = "st,stm32mp1-dwmac",
 		.data = (ulong)&eqos_stm32mp15_config
 	},
+	{
+		.compatible = "st,stm32mp25-dwmac",
+		.data = (ulong)&eqos_stm32mp25_config
+	},
 #endif
 #if IS_ENABLED(CONFIG_DWC_ETH_QOS_IMX)
 	{
diff --git a/drivers/net/dwc_eth_qos.h b/drivers/net/dwc_eth_qos.h
index 403e8203974..c239a5c7aca 100644
--- a/drivers/net/dwc_eth_qos.h
+++ b/drivers/net/dwc_eth_qos.h
@@ -301,5 +301,6 @@ extern struct eqos_config eqos_rockchip_config;
 extern struct eqos_config eqos_qcom_config;
 extern struct eqos_config eqos_stm32mp13_config;
 extern struct eqos_config eqos_stm32mp15_config;
+extern struct eqos_config eqos_stm32mp25_config;
 extern struct eqos_config eqos_jh7110_config;
 extern struct eqos_config eqos_adi_config;
diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
index f3a973f3774..7a28f2a3e83 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -350,3 +350,14 @@ struct eqos_config __maybe_unused eqos_stm32mp15_config = {
 	.interface = dev_read_phy_mode,
 	.ops = &eqos_stm32_ops
 };
+
+struct eqos_config __maybe_unused eqos_stm32mp25_config = {
+	.reg_access_always_ok = false,
+	.mdio_wait = 10000,
+	.swr_wait = 50,
+	.config_mac = EQOS_MAC_RXQ_CTRL0_RXQ0EN_ENABLED_DCB,
+	.config_mac_mdio = EQOS_MAC_MDIO_ADDRESS_CR_250_300,
+	.axi_bus_width = EQOS_AXI_WIDTH_64,
+	.interface = dev_read_phy_mode,
+	.ops = &eqos_stm32_ops
+};
-- 
2.25.1

base-commit: cb7555e93075114fe4af0adb806877ac4d4ef80d
branch: upstream_net_add_stm32mp25_support
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
