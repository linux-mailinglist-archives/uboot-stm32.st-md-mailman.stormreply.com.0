Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BECD7AF9D
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3913DC35E02
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 392F9C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHGRMK031349; Tue, 30 Jul 2019 19:17:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=x4LcxIvz/II9D0CLMTjirbNSe2IId0l8+p4aTBTHwBc=;
 b=0LuqiDcGnaraJ36Wt4Ohn9SScX6Tbi0tD43iZ7BjNzatUOhF+qf6CYiMcgnVeUnxxbIA
 G+Tzpp2ot0JDsGCtkdUFvsnWnDHpuKS01IAl7IKyAyfw88w3Di0Oij6C+XrCXbgGK4HV
 Qqj13JDzQmMtgN/giDy/ch0lfbI9cJmvenGp1yNiEcvRZN0mSsUiphSAQHgcyt4JE7eK
 JXval4FU7gWHGQQvL/Ii4yeFHvGlYbSljJS4x2hAIKUaAaaZpgGH8rIIKg6yPgohQnLc
 iLHsJT8y/OySefai6wpsnuNeYxNDHyVFFE8cChbMfvuo2NyB4HK1183v5yJ2zR4mh5Sg jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0br9yp88-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:48 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5FC334;
 Tue, 30 Jul 2019 17:17:47 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AFD6D29B4;
 Tue, 30 Jul 2019 17:17:47 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:47 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:47
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:49 +0200
Message-ID: <1564507016-16570-42-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: Bossen WU <bossen.wu@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 41/48] stm32mp1: ram: fix address issue in 2
	tests
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

If user choose to test memory size is 1GByte (0x40000000),
memory address would overflow in test "Random" and
test "FrequencySelectivePattern".
Thus the system would hangs up when running DDR test.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Bossen WU <bossen.wu@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_tests.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_tests.c b/drivers/ram/stm32mp1/stm32mp1_tests.c
index b6fb2a9..691c63c 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tests.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tests.c
@@ -578,27 +578,29 @@ static enum test_result test_random(struct stm32mp1_ddrctl *ctl,
 	u32 error = 0;
 	unsigned int seed;
 
-	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024))
+	if (get_bufsize(string, argc, argv, 0, &bufsize, 8 * 1024))
 		return TEST_ERROR;
 	if (get_nb_loop(string, argc, argv, 1, &nb_loop, 1))
 		return TEST_ERROR;
 	if (get_addr(string, argc, argv, 2, &addr))
 		return TEST_ERROR;
 
-	printf("running %d loops at 0x%x\n", nb_loop, addr);
+	bufsize /= 2;
+	printf("running %d loops copy from 0x%x to 0x%x (buffer size=0x%x)\n",
+	       nb_loop, addr, addr + bufsize, bufsize);
 	while (!error) {
 		seed = rand();
-		for (offset = addr; offset < addr + bufsize; offset += 4)
-			writel(rand(), offset);
+		for (offset = 0; offset < bufsize; offset += 4)
+			writel(rand(), addr + offset);
 
 		memcpy((void *)addr + bufsize, (void *)addr, bufsize);
 
 		srand(seed);
-		for (offset = addr; offset < addr + 2 * bufsize; offset += 4) {
-			if (offset == (addr + bufsize))
+		for (offset = 0; offset < 2 * bufsize; offset += 4) {
+			if (offset == bufsize)
 				srand(seed);
 			value = rand();
-			error = check_addr(offset, value);
+			error = check_addr(addr + offset, value);
 			if (error)
 				break;
 			if (progress(offset))
@@ -607,6 +609,7 @@ static enum test_result test_random(struct stm32mp1_ddrctl *ctl,
 		if (test_loop_end(&loop, nb_loop, 100))
 			break;
 	}
+	putc('\n');
 
 	if (error) {
 		sprintf(string,
@@ -791,9 +794,9 @@ static enum test_result test_loop(const u32 *pattern, u32 *address,
 	int i;
 	int j;
 	enum test_result res = TEST_PASSED;
-	u32 *offset, testsize, remaining;
+	u32 offset, testsize, remaining;
 
-	offset = address;
+	offset = (u32)address;
 	remaining = bufsize;
 	while (remaining) {
 		testsize = bufsize > 0x1000000 ? 0x1000000 : bufsize;
@@ -809,7 +812,7 @@ static enum test_result test_loop(const u32 *pattern, u32 *address,
 		__asm__("stmia r1!, {R3-R10}");
 		__asm__("stmia r1!, {R3-R10}");
 		__asm__("stmia r1!, {R3-R10}");
-		__asm__("subs r2, r2, #8");
+		__asm__("subs r2, r2, #128");
 		__asm__("bge loop2");
 		__asm__("pop {R0-R10}");
 
@@ -1388,7 +1391,7 @@ const struct test_desc test[] = {
 	 "Verifies r/w and memcopy(burst for pseudo random value.",
 	 3
 	},
-	{test_freq_pattern, "FrequencySelectivePattern ", "[size]",
+	{test_freq_pattern, "FrequencySelectivePattern", "[size]",
 	 "write & test patterns: Mostly Zero, Mostly One and F/n",
 	 1
 	},
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
