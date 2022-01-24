Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 428A24980E0
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Jan 2022 14:17:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05658C5F1D3;
	Mon, 24 Jan 2022 13:17:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9BC6C5AB61
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 13:17:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20O8b4Q8017029;
 Mon, 24 Jan 2022 14:17:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=9U+gxFiQYSay/yhD57A1BxPvi+dQrhzpQ74xHHTNp98=;
 b=fdEVsuRu1C33Wp2XYMjCOKoVB0wy0VSnZulVpFZRlIfGe60Ke4Skk0wNDbnMuSEfV95C
 AnXp0wOlyyl4RF8KV8s0yY5R2eRWW/PSLKXVbliG3XekGZbURHQeXevbb/n9X/2i5624
 9fqsVf+MPooZHa4mwgLlUFHdeckEDxfsSTUrTx3J7VX55hNcrp4tFBppwqEj1M+XACle
 eqQDjMO4XMrjWIk9Nr4Atg0cl2fuMir7JKh3k3WXe4wzOopMnUB7sspcs1ET6t7vqkQt
 /xvPjJvZEnEqorNPmD9lT1XAAzUeRRTZCMg55zJDqQEjnHQJxYhmeI2nskpguGtSqW/3 +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dsrru1gtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 14:17:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A75DB10002A;
 Mon, 24 Jan 2022 14:17:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88E262171EF;
 Mon, 24 Jan 2022 14:17:22 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 24 Jan 2022 14:17:22
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 24 Jan 2022 14:17:14 +0100
Message-ID: <20220124141711.1.Ic9cd1563aac729132cadae8c5df372be1a49ecc7@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_07,2022-01-24_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>
Subject: [Uboot-stm32] [PATCH] clk: ccf: correct the test on the parent
	uclass in clk_enable/clk_disable
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

It is safe to check if the uclass id on the device is UCLASS_CLK
before to call the clk_ functions, but today this comparison is
not done on the device used in API: clkp->dev->parent
but on the device himself: clkp->dev.

This patch corrects this behavior and tests if the parent device
is a clock device before to call the clock API, clk_enable or
clk_disable, on this device.

Fixes: 0520be0f67e3 ("clk: prograte clk enable/disable to parent")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/clk/clk-uclass.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index d245b672fa..8b6981a307 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -652,7 +652,7 @@ int clk_enable(struct clk *clk)
 				return 0;
 			}
 			if (clkp->dev->parent &&
-			    device_get_uclass_id(clkp->dev) == UCLASS_CLK) {
+			    device_get_uclass_id(clkp->dev->parent) == UCLASS_CLK) {
 				ret = clk_enable(dev_get_clk_ptr(clkp->dev->parent));
 				if (ret) {
 					printf("Enable %s failed\n",
@@ -726,7 +726,7 @@ int clk_disable(struct clk *clk)
 		}
 
 		if (clkp && clkp->dev->parent &&
-		    device_get_uclass_id(clkp->dev) == UCLASS_CLK) {
+		    device_get_uclass_id(clkp->dev->parent) == UCLASS_CLK) {
 			ret = clk_disable(dev_get_clk_ptr(clkp->dev->parent));
 			if (ret) {
 				printf("Disable %s failed\n",
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
