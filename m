Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC4C7AFA0
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AD61C36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EF92C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHGRsG031350; Tue, 30 Jul 2019 19:17:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=x8npMS2q4wdX4iPb526HswK75XvEzeuADxYp+00vxGs=;
 b=J8D0SaIPaICMoqQnjJSrc73k9gIzAHD2Mpfzwexa5rNWoJF+IwXTl6ClHqqcVjQDCNVP
 JhfSrrsLuNFHGQ4haSKSGm/vy4DQNXMpjVX9ivIIr4reuca7Y8tZmp5K2GvTRnkuLgCJ
 LnW2ThzToM7x4AV1qePVDdKVBRUH+ByYUM9LYbPDvZ3LFjp1Hjk+U9hhKJTCeZ/YPtF0
 brjSK7srH3FPJAlyzElAT+LJ8npXmXf6LVmjdkPugWlIEskc9K0N0qUv7UkEeMSIIpG2
 yGOch7Dr1lkgHLXpSehUTC0Kx/Zv8mgk33Xfzl40xNOL3answkGeqDpAzG+vlLzkyKBr QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0br9yp8t-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 405F731;
 Tue, 30 Jul 2019 17:17:51 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 39886CEA01;
 Tue, 30 Jul 2019 19:17:51 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:51 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:50
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:52 +0200
Message-ID: <1564507016-16570-45-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 44/48] stm32mp1: ram: add pattern parameter in
	infinite write test
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

Add pattern for infinite test_read and test_write, that
allow to change the pattern to test without recompilation;
default pattern is 0xA5A5AA55.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_tests.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_tests.c b/drivers/ram/stm32mp1/stm32mp1_tests.c
index f947b5d..581ee48 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tests.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tests.c
@@ -1250,13 +1250,18 @@ static enum test_result test_read(struct stm32mp1_ddrctl *ctl,
 	if (get_addr(string, argc, argv, 0, (u32 *)&addr))
 		return TEST_ERROR;
 
+	if (get_pattern(string, argc, argv, 1, &data, 0xA5A5AA55))
+		return TEST_ERROR;
+
 	if ((u32)addr == ADDR_INVALID) {
-		printf("random ");
+		printf("running random\n");
 		random = true;
+	} else {
+		printf("running at 0x%08x with pattern=0x%08x\n",
+		       (u32)addr, data);
+		writel(data, addr);
 	}
 
-	printf("running at 0x%08x\n", (u32)addr);
-
 	while (1) {
 		for (i = 0; i < size; i++) {
 			if (random)
@@ -1287,7 +1292,7 @@ static enum test_result test_write(struct stm32mp1_ddrctl *ctl,
 				   char *string, int argc, char *argv[])
 {
 	u32 *addr;
-	u32 data = 0xA5A5AA55;
+	u32 data;
 	u32 loop = 0;
 	int i, size = 1024 * 1024;
 	bool random = false;
@@ -1295,13 +1300,17 @@ static enum test_result test_write(struct stm32mp1_ddrctl *ctl,
 	if (get_addr(string, argc, argv, 0, (u32 *)&addr))
 		return TEST_ERROR;
 
+	if (get_pattern(string, argc, argv, 1, &data, 0xA5A5AA55))
+		return TEST_ERROR;
+
 	if ((u32)addr == ADDR_INVALID) {
-		printf("random ");
+		printf("running random\n");
 		random = true;
+	} else {
+		printf("running at 0x%08x with pattern 0x%08x\n",
+		       (u32)addr, data);
 	}
 
-	printf("running at 0x%08x\n", (u32)addr);
-
 	while (1) {
 		for (i = 0; i < size; i++) {
 			if (random) {
@@ -1435,10 +1444,10 @@ const struct test_desc test[] = {
 	 3
 	},
 	/* need to the the 2 last one (infinite) : skipped for test all */
-	{test_read, "infinite read", "[addr]",
-	 "basic test : infinite read access", 1},
-	{test_write, "infinite write", "[addr]",
-	 "basic test : infinite write access", 1},
+	{test_read, "infinite read", "[addr] [pattern]",
+	 "basic test : infinite read access (random: addr=0xFFFFFFFF)", 2},
+	{test_write, "infinite write", "[addr] [pattern]",
+	 "basic test : infinite write access (random: addr=0xFFFFFFFF)", 2},
 };
 
 const int test_nb = ARRAY_SIZE(test);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
