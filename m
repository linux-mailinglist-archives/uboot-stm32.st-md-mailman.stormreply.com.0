Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A15417B9F5
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:14:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D3C4C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 10:14:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1E07C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 10:14:36 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026AERuW018889; Fri, 6 Mar 2020 11:14:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=M8FnDHR6DcJiu2LnFbflCmfRUwu2lqs8XDBzj1WNESs=;
 b=qrxBJbG9w+1fNhcEdvIs5USGjm3ID0y9SgRYoHngujQoe++UPGX3kgxZuDcYvyrLwhUA
 lTuQPSq8bfunOK6arkrOcd3F24N1JzUXBUIyDIjy/VsorO9WFJ79LH8NS52JJvlgKME7
 N7oo0H1wljIk7L2k9AyTqeL9OcyZR5ZbJIDDnsPBHmif6g7dugAX8ZQ3Jdv2DTJAaHGu
 FIHcarJ4lOi57bB2J85Ladk64a9m1NFFk4YLNzO37BMD0HqWkuAT/6ZFCw00XtRnuRY5
 kK7CiyTVp299qZ3qCpCnjpt3G9ZsBgJgDtWYq/ELVjw0+KxOVsyELbS1IeH3XmaPcLp7 cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfea7ef3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:14:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F3FA8100034;
 Fri,  6 Mar 2020 11:14:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC2142A718C;
 Fri,  6 Mar 2020 11:14:31 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 11:14:31 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 11:14:04 +0100
Message-ID: <20200306111355.2.I7aa349c91deffa4a6f096fbadfa22b01844a7c4d@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306101412.15376-1-patrick.delaunay@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/9] ram: stm32mp1: display result for
	software read DQS gating
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

Display result information for software read DQS gating, the tuning 0
which be used by CubeMX DDR tuning tools.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_tuning.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_tuning.c b/drivers/ram/stm32mp1/stm32mp1_tuning.c
index 4e1c1fab54..e3e6f0f79c 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tuning.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tuning.c
@@ -1182,15 +1182,17 @@ static u8 set_midpoint_read_dqs_gating(struct stm32mp1_ddrphy *phy, u8 byte,
 				 dqs_gate_values[byte][0],
 				 dqs_gate_values[byte][1]);
 			pr_debug("*******the nominal values were system latency: 0  phase: 2*******\n");
-			set_r0dgsl_delay(phy, byte, dqs_gate_values[byte][0]);
-			set_r0dgps_delay(phy, byte, dqs_gate_values[byte][1]);
 		}
 	} else {
 		/* if intermitant, restore defaut values */
 		pr_debug("dqs gating:no regular fail/pass/fail found. defaults values restored.\n");
-		set_r0dgsl_delay(phy, byte, 0);
-		set_r0dgps_delay(phy, byte, 2);
+		dqs_gate_values[byte][0] = 0;
+		dqs_gate_values[byte][1] = 2;
 	}
+	set_r0dgsl_delay(phy, byte, dqs_gate_values[byte][0]);
+	set_r0dgps_delay(phy, byte, dqs_gate_values[byte][1]);
+	printf("Byte %d, R0DGSL = %d, R0DGPS = %d\n",
+	       byte, dqs_gate_values[byte][0], dqs_gate_values[byte][1]);
 
 	/* return 0 if intermittent or if both left_bound
 	 * and right_bound are not found
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
