Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F60E1F7559
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jun 2020 10:35:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A897C36B24
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jun 2020 08:35:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C75B8C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2020 08:35:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C8XUCg022121; Fri, 12 Jun 2020 10:35:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=/GIKXo1mZgokX90tyjpbd07Hkt/qrFDnbrr94oB1ifY=;
 b=fHDOAcOleVbYBqflvz1C6jVaByBZLg8fgA76Oi4NwP6zGEFxNYUX5Wh8XAZETT4/3ViJ
 5vIyFHEn8csu0rusgklOppoi08HhtkNi1DifLPw1NVqrgTiWuTFz/p3MpKhwV/k/JcRb
 LmGYxCpzV8RVxl4D7pVyABPZfCAiUiEf6x8xRcXTSMQ3QFSKCxKkXk/D5yZhviAb9GJj
 jk5D5aQ8viYIXrC7aAwAAUL5NKQ47l/h7lUuhS5W+pwuZTxSpVMC+Wqx39Q9Fv681GRJ
 05Havjfydd2h/TA6VAvnUGzlaZ2L192nzZOewPZoMs/fzipkNWl9cnIjogSVNxmL4uN9 uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g097q8e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 10:35:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5109C100034;
 Fri, 12 Jun 2020 10:35:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45A7B2B6681;
 Fri, 12 Jun 2020 10:35:04 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 12 Jun 2020 10:35:03 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 12 Jun 2020 10:34:55 +0200
Message-ID: <20200612103440.2.I3487912650c4bf7acb85b595e2865036cd0a953c@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612103440.1.I29f1f31d4312a6029cc38e3f4fe9aa0baedece7d@changeid>
References: <20200612103440.1.I29f1f31d4312a6029cc38e3f4fe9aa0baedece7d@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-12_07:2020-06-11,
 2020-06-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/4] ram: stm32mp1: add parameter addr in test
	FrequencySelectivePattern
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

Add a parameter addr in test FrequencySelectivePattern to select
the base address used to execute the tests.

Default value (when the parameter is absent) is STM32_DDR_BASE,
selected in get_addr() function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_tests.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_tests.c b/drivers/ram/stm32mp1/stm32mp1_tests.c
index 90e82acda7..fec9fd010e 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tests.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tests.c
@@ -919,10 +919,12 @@ static enum test_result test_freq_pattern(struct stm32mp1_ddrctl *ctl,
 	enum test_result res = TEST_PASSED, pattern_res;
 	int i, bus_width;
 	const u32 **patterns;
-	u32 bufsize;
+	u32 bufsize, addr;
 
 	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 128))
 		return TEST_ERROR;
+	if (get_addr(string, argc, argv, 1, &addr))
+		return TEST_ERROR;
 
 	switch (readl(&ctl->mstr) & DDRCTRL_MSTR_DATA_BUS_WIDTH_MASK) {
 	case DDRCTRL_MSTR_DATA_BUS_WIDTH_HALF:
@@ -935,15 +937,14 @@ static enum test_result test_freq_pattern(struct stm32mp1_ddrctl *ctl,
 	}
 
 	printf("running test pattern at 0x%08x length 0x%x width = %d\n",
-	       STM32_DDR_BASE, bufsize, bus_width);
+	       addr, bufsize, bus_width);
 
 	patterns =
 		(const u32 **)(bus_width == 16 ? patterns_x16 : patterns_x32);
 
 	for (i = 0; i < NB_PATTERN; i++) {
 		printf("test data pattern %s:", patterns_comments[i]);
-		pattern_res = test_loop(patterns[i], (u32 *)STM32_DDR_BASE,
-					bufsize);
+		pattern_res = test_loop(patterns[i], (u32 *)addr, bufsize);
 		if (pattern_res != TEST_PASSED)	{
 			printf("Failed\n");
 			return pattern_res;
@@ -1419,9 +1420,9 @@ const struct test_desc test[] = {
 	 "Verifies r/w and memcopy(burst for pseudo random value.",
 	 3
 	},
-	{test_freq_pattern, "FrequencySelectivePattern", "[size]",
+	{test_freq_pattern, "FrequencySelectivePattern", "[size] [addr]",
 	 "write & test patterns: Mostly Zero, Mostly One and F/n",
-	 1
+	 2
 	},
 	{test_blockseq, "BlockSequential", "[size] [loop] [addr]",
 	 "test incremental pattern",
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
