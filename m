Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD8958796B
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Aug 2022 10:56:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 889BEC640F0;
	Tue,  2 Aug 2022 08:56:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BF39C0D2C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Aug 2022 08:56:16 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27281mXB006366;
 Tue, 2 Aug 2022 10:56:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=XO60BLkdC9uVEEtxiUMEtvfmiUW7dsE3a9amp0kJwEo=;
 b=aRho6xukZoztdaHkzmPhMbCcQ61v/No2f0CwT2je79JcjMVTYVlDfYpCjYXmYo3A/WHU
 mjqFpR0LY7TKWUIzlkyYuHfnb64Yi/8zT5uBiVQKtQjAmvRlaYqlzjVJGbU8jdGPXhAT
 3Cc5x9gPDB94OaP6FrJcbj5Htfy9PAfwRibJ1nvFRHyzLjElSp8TMfKK5vRHgIFntTnJ
 26FLoYDix0Rp6ml0qTA/jI0Yx3o7snKfzZrVCJi9+6qPwWMRnYBLqvqkFKrLm2nfH/By
 tQZV3Qp04FgAFEZGuqgUh5tUiSEeRMJ2N83vTRgifSsvNe7iESTEtCDPOX0EW+F9f1NU qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hmv01aj0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 10:56:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 994DD10002A;
 Tue,  2 Aug 2022 10:56:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 920BF21F149;
 Tue,  2 Aug 2022 10:56:06 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 2 Aug
 2022 10:56:06 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 2 Aug 2022 10:55:25 +0200
Message-ID: <20220802085526.272953-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_05,2022-08-01_01,2022-06-22_01
Cc: Peng Fan <peng.fan@nxp.com>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/2] net: dwc_eth_qos: Add eqos_get_enetaddr
	callback for tegra186
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

Add .eqos_get_enetaddr callback defined as eqos_null_ops() to avoid
illegal access.

Fixes: a624251461bf ("net: dwc_eth_qos: introduce eqos hook eqos_get_enetaddr")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/net/dwc_eth_qos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index c1f2391d63..09d95e4bc3 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -1609,6 +1609,7 @@ static struct eqos_ops eqos_tegra186_ops = {
 	.eqos_calibrate_pads = eqos_calibrate_pads_tegra186,
 	.eqos_disable_calibration = eqos_disable_calibration_tegra186,
 	.eqos_set_tx_clk_speed = eqos_set_tx_clk_speed_tegra186,
+	.eqos_get_enetaddr = eqos_null_ops,
 	.eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_tegra186
 };
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
