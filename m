Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9B3233198
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jul 2020 14:04:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8287BC36B33
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jul 2020 12:04:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7F71C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jul 2020 12:04:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UBwaCF000787; Thu, 30 Jul 2020 14:04:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Gc8puNQ/Nx2BNW6Nm7JThhXAM1QzfzY1Hbp10HS8ID4=;
 b=AEfjh8W7Ak8iZlR7KtuvqUxXbPTLDjtMf75wSx4pLHNdzAl/iaKVcq9iqu8O9TRdNuUu
 4ZdC3ttRpqhqfJir6frLVsNtgDcqKJY/f15wINOYc22xZBOPoSuf+1s/MwkKaS3i5uKE
 7aSqpxU4AC9vd34XGD0AE4mKPIx/doiIi3yhCW1NkxHKpm0eV417sqDV46BTYBmOCBQj
 /YUof11o1cLd8Ymg8yeWTeVyf8zC4ztruQAxv44EMOKauT1yyT+BqAPMvQBeOApF5EuC
 ATgAGYnTUspHRRAzfDEZ1/tBX/cQfD8TYU2xUECzbvk5V7DrSyVqlnVSP0KIoBrboIqJ pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga728bh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 14:04:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1059310002A;
 Thu, 30 Jul 2020 14:04:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 03E1D2AF82D;
 Thu, 30 Jul 2020 14:04:16 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 30 Jul 2020 14:04:15 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jul 2020 14:04:09 +0200
Message-ID: <20200730140347.1.I0977b8abc51b9854d9e8f7822a7b28f3f219b99e@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_09:2020-07-30,
 2020-07-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] cmd: clk: cosmetic: correct code
	alignment in show_clks
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

Correct code alignment in show_clks() function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 cmd/clk.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/cmd/clk.c b/cmd/clk.c
index 439736d072..ba4540334a 100644
--- a/cmd/clk.c
+++ b/cmd/clk.c
@@ -25,24 +25,24 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
 	if (device_get_uclass_id(dev) == UCLASS_CLK && clkp) {
 		rate = clk_get_rate(clkp);
 
-	printf(" %-12u  %8d        ", rate, clkp->enable_count);
-
-	for (i = depth; i >= 0; i--) {
-		is_last = (last_flag >> i) & 1;
-		if (i) {
-			if (is_last)
-				printf("    ");
-			else
-				printf("|   ");
-		} else {
-			if (is_last)
-				printf("`-- ");
-			else
-				printf("|-- ");
+		printf(" %-12u  %8d        ", rate, clkp->enable_count);
+
+		for (i = depth; i >= 0; i--) {
+			is_last = (last_flag >> i) & 1;
+			if (i) {
+				if (is_last)
+					printf("    ");
+				else
+					printf("|   ");
+			} else {
+				if (is_last)
+					printf("`-- ");
+				else
+					printf("|-- ");
+			}
 		}
-	}
 
-	printf("%s\n", dev->name);
+		printf("%s\n", dev->name);
 	}
 
 	list_for_each_entry(child, &dev->child_head, sibling_node) {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
