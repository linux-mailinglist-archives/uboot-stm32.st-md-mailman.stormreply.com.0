Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8251C5B6C54
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Sep 2022 13:24:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B9A0C640F1;
	Tue, 13 Sep 2022 11:24:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DE12C01577
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Sep 2022 11:24:02 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DB9whd027890;
 Tue, 13 Sep 2022 13:23:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Snhg3h2kM61hC29hMk/+0tkv9ISwR0DQxsE6BCO58Og=;
 b=uCsIWdpxaSpPYUgUeg18lxa4hxR+QbrJk/iVOx4sKc/cGt69w4I/MB5Nebw6Nb3DKX9P
 jFc80kS3/eIP4S20p4nmpmCdppQ0LosLXobnOINKmi4rBBEaZBC6OKd8snpb9XQHD/VV
 yiCoNkCX/pWHVZ3GdKe9Vvm3Bhi2foaHRJCe7DunA6qwg64LMLn91rVY+7yNcZb+HnbL
 UnMdIxt1InULjzf0+V0xs/DTMQ/GksfEf6v5HGrs9A9YtPn+fYzlifhTnYv86njfeH8x
 9bQE8t/MES+/F6NBFyCmzean2gAvuFWfH2NfeLjH+R1Ewe89xEdnl9a4vttVqe0CT4bX QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjxp0pj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 13:23:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 031DA10002A;
 Tue, 13 Sep 2022 13:23:52 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D11BE222CA8;
 Tue, 13 Sep 2022 13:23:52 +0200 (CEST)
Received: from localhost (10.75.127.46) by EQNDAG1NODE5.st.com (10.75.129.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 13 Sep
 2022 13:23:52 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 13 Sep 2022 13:23:44 +0200
Message-ID: <20220913112346.301480-1-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE5.st.com
 (10.75.129.134)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_05,2022-09-13_01,2022-06-22_01
Cc: Peng Fan <peng.fan@nxp.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/3] mmc: stm32_sdmmc2: add dual data rate
	support
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

To support dual data rate with STM32 sdmmc2 driver, the dedicated bit
(DDR - BIT(18)) needs to be set in the CLKRC register. Clock bypass
(no divider) is not allowed in this case. This is required for the
eMMC DDR modes.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---

 drivers/mmc/stm32_sdmmc2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index bfce8a2e4a..3cfa5a66f1 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -598,13 +598,16 @@ static int stm32_sdmmc2_set_ios(struct udevice *dev)
 	 * clk_div > 0 and NEGEDGE = 1 => command and data generated on
 	 * SDMMCCLK falling edge
 	 */
-	if (desired && ((sys_clock > desired) ||
+	if (desired && (sys_clock > desired || mmc->ddr_mode ||
 			IS_RISING_EDGE(plat->clk_reg_msk))) {
 		clk = DIV_ROUND_UP(sys_clock, 2 * desired);
 		if (clk > SDMMC_CLKCR_CLKDIV_MAX)
 			clk = SDMMC_CLKCR_CLKDIV_MAX;
 	}
 
+	if (mmc->ddr_mode)
+		clk |= SDMMC_CLKCR_DDR;
+
 	if (mmc->bus_width == 4)
 		clk |= SDMMC_CLKCR_WIDBUS_4;
 	if (mmc->bus_width == 8)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
