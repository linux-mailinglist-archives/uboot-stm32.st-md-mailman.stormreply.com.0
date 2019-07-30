Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0187AF9E
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FBD7C35E04
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CA09C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHFo3l001890; Tue, 30 Jul 2019 19:17:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=bEhkWtR0HnD6PkCO4AmELHzl/JiJ7nbzntplwxmWJTI=;
 b=KALERFbtMFFPW/DxdYZtwFsdJ/Z4w+Z+Be6o//Et+IWpByuwwwBA2DKmVj/Ih40Gu+qN
 tuz5CYlSaYRx5KBp4LZD/0xBlHswTp6HtFaUf6YwAiMxKQmaS8jTdwRsSrwMq/ZTYQPR
 Mfv/uKMrd0V85AW4F7F4u+JTFAAHFhrYB64LDc6Zos9/ATB0ww4fbX01hTM7OTYAK8e2
 OH0sRvy1zQhsh+bF9fT+4mUjqilXqB+CnUuGjf6YvkWGMtZ4afGIown1AzlOkvURSqih
 Ez1FUclxL7xmk3UYfZkx60ERNJ4ze0WWAewOVkS1KPZDLt8JlkDtte0rFjrmAR7reMsk uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4acvq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E985B38;
 Tue, 30 Jul 2019 17:17:48 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2FADCEA01;
 Tue, 30 Jul 2019 19:17:48 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:49 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:48
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:50 +0200
Message-ID: <1564507016-16570-43-git-send-email-patrick.delaunay@st.com>
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
Subject: [Uboot-stm32] [PATCH 42/48] stm32mp1: ram: update loop management
	in infinite test
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

Reduce verbosity of the infinite tests to avoid CubeMX issue.
test and display loop by 1024*1024 accesses: read or write.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_tests.c | 38 +++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_tests.c b/drivers/ram/stm32mp1/stm32mp1_tests.c
index 691c63c..7356802 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tests.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tests.c
@@ -1241,6 +1241,7 @@ static enum test_result test_read(struct stm32mp1_ddrctl *ctl,
 	u32 *addr;
 	u32 data;
 	u32 loop = 0;
+	int i, size = 1024 * 1024;
 	bool random = false;
 
 	if (get_addr(string, argc, argv, 0, (u32 *)&addr))
@@ -1254,14 +1255,19 @@ static enum test_result test_read(struct stm32mp1_ddrctl *ctl,
 	printf("running at 0x%08x\n", (u32)addr);
 
 	while (1) {
-		if (random)
-			addr = (u32 *)(STM32_DDR_BASE +
-			       (rand() & (STM32_DDR_SIZE - 1) & ~0x3));
-		data = readl(addr);
-		if (test_loop_end(&loop, 0, 1000))
+		for (i = 0; i < size; i++) {
+			if (random)
+				addr = (u32 *)(STM32_DDR_BASE +
+				       (rand() & (STM32_DDR_SIZE - 1) & ~0x3));
+			data = readl(addr);
+		}
+		if (test_loop_end(&loop, 0, 1))
 			break;
 	}
-	sprintf(string, "0x%x: %x", (u32)addr, data);
+	if (random)
+		sprintf(string, "%d loops random", loop);
+	else
+		sprintf(string, "%d loops at 0x%x: %x", loop, (u32)addr, data);
 
 	return TEST_PASSED;
 }
@@ -1280,6 +1286,7 @@ static enum test_result test_write(struct stm32mp1_ddrctl *ctl,
 	u32 *addr;
 	u32 data = 0xA5A5AA55;
 	u32 loop = 0;
+	int i, size = 1024 * 1024;
 	bool random = false;
 
 	if (get_addr(string, argc, argv, 0, (u32 *)&addr))
@@ -1293,16 +1300,21 @@ static enum test_result test_write(struct stm32mp1_ddrctl *ctl,
 	printf("running at 0x%08x\n", (u32)addr);
 
 	while (1) {
-		if (random) {
-			addr = (u32 *)(STM32_DDR_BASE +
-			       (rand() & (STM32_DDR_SIZE - 1) & ~0x3));
-			data = rand();
+		for (i = 0; i < size; i++) {
+			if (random) {
+				addr = (u32 *)(STM32_DDR_BASE +
+				       (rand() & (STM32_DDR_SIZE - 1) & ~0x3));
+				data = rand();
+			}
+			writel(data, addr);
 		}
-		writel(data, addr);
-		if (test_loop_end(&loop, 0, 1000))
+		if (test_loop_end(&loop, 0, 1))
 			break;
 	}
-	sprintf(string, "0x%x: %x", (u32)addr, data);
+	if (random)
+		sprintf(string, "%d loops random", loop);
+	else
+		sprintf(string, "%d loops at 0x%x: %x", loop, (u32)addr, data);
 
 	return TEST_PASSED;
 }
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
