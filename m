Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E531417B9F9
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:14:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADCA7C36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 10:14:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79F10C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 10:14:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026ADrTt020394; Fri, 6 Mar 2020 11:14:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=55ItXZtDNUswmy/vJ89HT77uOeiSwtjgcsFeqXJpXRU=;
 b=BCgTH8yFgteOdIkhxI5uszaBKmJAwpmHikl5vJFR8+I+Y4OVlIjNOCsIe9mGPmWhllg5
 o2dyZF5N829Z40wFeC1PAb6nJGWNQcFX6uBHjq6enwAtaFzuu1/DhXdUY+EegisiscC/
 j4TpRpfyOjm+KC4bnk1eE7MWQltLbfm9JG3aHff3ygGXVxbi6rklTo8ert8hscfKRFa5
 JosBOQjs13rz4IAQ6/A9Jrbn2GML/SG9X6GR0xtjOx+V68sk2XP1ve8317NOy1d1rszo
 OLrAxrOLRXKANpRMT+Wr1+DPz8x5tK5vwV4VzjEnNbMeVCiby/0oTHjW1A37Xe9rbfAi qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfdydex1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:14:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69FFB100039;
 Fri,  6 Mar 2020 11:14:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 619A82A718C;
 Fri,  6 Mar 2020 11:14:33 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 11:14:33 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 11:14:06 +0100
Message-ID: <20200306111355.4.If03eb32f9863bed008f5367b47116f667bb85099@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306101412.15376-1-patrick.delaunay@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 4/9] ram: stm32mp1: tuning: add timeout for
	polling BISTGSR.BDDONE
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

Avoid to block the tuning procedure on BIST error (not finished
BIST procedure) by adding a 1000us timeout on the polling of
BISTGSR.BDDONE executed to detect the end of BIST.

The normal duration of the BIST test is around 5us.

This patch also cleanup comments.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_tuning.c | 45 ++++++++++++++------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_tuning.c b/drivers/ram/stm32mp1/stm32mp1_tuning.c
index e3e6f0f79c..cab6cf087a 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tuning.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tuning.c
@@ -8,6 +8,7 @@
 #include <ram.h>
 #include <reset.h>
 #include <asm/io.h>
+#include <linux/iopoll.h>
 
 #include "stm32mp1_ddr_regs.h"
 #include "stm32mp1_ddr.h"
@@ -246,6 +247,8 @@ static void BIST_test(struct stm32mp1_ddrphy *phy, u8 byte,
 	bool result = true; /* BIST_SUCCESS */
 	u32 cnt = 0;
 	u32 error = 0;
+	u32 val;
+	int ret;
 
 	bist->test_result = true;
 
@@ -274,27 +277,29 @@ run:
 			0x00000001);
 	/* Write BISTRR.BINST = 3?b001; */
 
-	/* Wait for a number of CTL clocks before reading BIST register*/
-	/* Wait 300 ctl_clk cycles;  ... IS it really needed?? */
-	/* Perform BIST Instruction Stop*/
-	/* Write BISTRR.BINST = 3?b010;*/
-
-	/* poll on BISTGSR.BDONE. If 0, wait.  ++TODO Add timeout */
-	while (!(readl(&phy->bistgsr) & DDRPHYC_BISTGSR_BDDONE))
-		;
-
-	/*Check if received correct number of words*/
-	/* if (Read BISTWCSR.DXWCNT = Read BISTWCR.BWCNT) */
-	if (((readl(&phy->bistwcsr)) >> DDRPHYC_BISTWCSR_DXWCNT_SHIFT) ==
-	    readl(&phy->bistwcr)) {
-		/*Determine if there is a data comparison error*/
-		/* if (Read BISTGSR.BDXERR = 1?b0) */
-		if (readl(&phy->bistgsr) & DDRPHYC_BISTGSR_BDXERR)
-			result = false; /* BIST_FAIL; */
-		else
-			result = true; /* BIST_SUCCESS; */
-	} else {
+	/* poll on BISTGSR.BDONE and wait max 1000 us */
+	ret = readl_poll_timeout(&phy->bistgsr, val,
+				 val & DDRPHYC_BISTGSR_BDDONE, 1000);
+
+	if (ret < 0) {
+		printf("warning: BIST timeout\n");
 		result = false; /* BIST_FAIL; */
+		/*Perform BIST Stop */
+		clrsetbits_le32(&phy->bistrr, 0x00000007, 0x00000002);
+	} else {
+		/*Check if received correct number of words*/
+		/* if (Read BISTWCSR.DXWCNT = Read BISTWCR.BWCNT) */
+		if (((readl(&phy->bistwcsr)) >> DDRPHYC_BISTWCSR_DXWCNT_SHIFT)
+		    == readl(&phy->bistwcr)) {
+			/*Determine if there is a data comparison error*/
+			/* if (Read BISTGSR.BDXERR = 1?b0) */
+			if (readl(&phy->bistgsr) & DDRPHYC_BISTGSR_BDXERR)
+				result = false; /* BIST_FAIL; */
+			else
+				result = true; /* BIST_SUCCESS; */
+		} else {
+			result = false; /* BIST_FAIL; */
+		}
 	}
 
 	/* loop while success */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
