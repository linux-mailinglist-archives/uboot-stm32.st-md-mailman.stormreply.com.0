Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B8A64B6A3
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Dec 2022 14:57:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11A41C65E61;
	Tue, 13 Dec 2022 13:57:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE24EC035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 13:57:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDAT3Oc007733; Tue, 13 Dec 2022 14:57:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=p2P77gZUg/Z40gaXLaD+0gOFM80S1GswU8ijLRw5uTI=;
 b=33yLEQMzpurJ7Y1fh9AVMHZmrZhx5YnVu6LZabT6IQYfz6nslliXsVKI+tHCjhAH2eXE
 MpncGAi6dCrAmSPcQqThY6jgibQFU7tNNVg+GxArEQsAHWZ7XYnRaq/i9wx9bB35Y4JP
 ExEtfUB4Y4N8fcIltqY5uA1qJX1YUzwCeBVvJ5lvaS/V2AVGu5Lcu1/9cQaazsT6ehOK
 ka3Cvybo2XPHA/+5cHFjfV+Y3AOkfFASJIcqXMhJsodab4zWO28JMmu7dRKCywNJe+Uz
 OTl8zCJDfPEAcdeseX+5tMw/LPgNMrQ/vsN+iOLnVbCO9K+UY8vCVWayrHoAELPEP6Qw pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3meqpa9ab7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 14:57:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF2EE10002A;
 Tue, 13 Dec 2022 14:57:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C816C228A26;
 Tue, 13 Dec 2022 14:57:15 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 13 Dec
 2022 14:57:12 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 13 Dec 2022 14:57:10 +0100
Message-ID: <20221213145708.v2.1.Ia0bc6b272f1e2e3f37873c61d79138c2663c4055@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
Cc: Simon Glass <sjg@chromium.org>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2] cmd: clk: probe the clock before dump them
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

The clock UCLASS need to be probed to allow availability of the
private data (struct clk *), get in show_clks() with dev_get_clk_ptr()
before use them.

Without this patch the clock dump can cause crash because all the
private data are not available before calling the API clk_get_rate().

It is the case for the SCMI clocks, priv->channel is needed for
scmi_clk_get_rate() and it is initialized only in scmi_clk_probe().
This issue causes a crash for "clk dump" command on STM32MP135F-DK board
for SCMI clock not yet probed.

Fixes: 1a725e229096 ("clk: fix clock tree dump to properly dump out every registered clock")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- simplify the patch after Simon review of V1: always probe the clk device
  before call to show_clks(), by using device_foreach_child_probe() and
  uclass_foreach_dev_probe()
- test UCLASS_CLK only when show_clks is called for child device

 cmd/clk.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/cmd/clk.c b/cmd/clk.c
index a483fd898122..ff7c7649a159 100644
--- a/cmd/clk.c
+++ b/cmd/clk.c
@@ -22,7 +22,7 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
 	u32 rate;
 
 	clkp = dev_get_clk_ptr(dev);
-	if (device_get_uclass_id(dev) == UCLASS_CLK && clkp) {
+	if (clkp) {
 		parent = clk_get_parent(clkp);
 		if (!IS_ERR(parent) && depth == -1)
 			return;
@@ -49,10 +49,11 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
 		printf("%s\n", dev->name);
 	}
 
-	list_for_each_entry(child, &dev->child_head, sibling_node) {
+	device_foreach_child_probe(child, dev) {
+		if (device_get_uclass_id(child) != UCLASS_CLK)
+			continue;
 		if (child == dev)
 			continue;
-
 		is_last = list_is_last(&child->sibling_node, &dev->child_head);
 		show_clks(child, depth, (last_flag << 1) | is_last);
 	}
@@ -61,17 +62,11 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
 int __weak soc_clk_dump(void)
 {
 	struct udevice *dev;
-	struct uclass *uc;
-	int ret;
-
-	ret = uclass_get(UCLASS_CLK, &uc);
-	if (ret)
-		return ret;
 
 	printf(" Rate               Usecnt      Name\n");
 	printf("------------------------------------------\n");
 
-	uclass_foreach_dev(dev, uc)
+	uclass_foreach_dev_probe(UCLASS_CLK, dev)
 		show_clks(dev, -1, 0);
 
 	return 0;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
