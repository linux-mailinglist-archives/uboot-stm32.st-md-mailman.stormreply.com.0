Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC44212BB4
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 19:56:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10F35C36B29
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 17:56:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 974A8C36B26
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 17:56:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062Hn1hT020100; Thu, 2 Jul 2020 19:56:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=gA7hwSDVtZfHOz/griaRLAMzqbiBazoLXVo8oJY/jbg=;
 b=sv8wMoa3m7rxgBmpFf41GGDkHpe0ATMwPPqWoTaOJ8slM1h6F0zyqXNS8ci/Eimpkmq1
 XSlYuBpS0SI4u1lF86IE+a/LgcZxl0N6kc/l6nB2eJfxbS2XIzTa0hONZJ1oLACQvIRR
 4AFWlYCVq3gakN8IbE6OrWeVjM8upkysEwDnnUEa3Jkt619LI6EpYXgXKBMnIfKhFDsb
 2PQOYb38Y1atubPtlvDbFXxbuAPYgLj5xoxXa+bwQ6ETTOa0JIuwLAEELVwzk8ELi1se
 ve3wRQSSp4TlG3WPkXtMdisa770gQxJcva+edkLajZXKJT/01org4Il194qbCVZIve7a IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0ghprx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 19:56:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA5F210002A;
 Thu,  2 Jul 2020 19:56:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AD622C7518;
 Thu,  2 Jul 2020 19:56:40 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 2 Jul 2020 19:56:40 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 2 Jul 2020 19:56:35 +0200
Message-ID: <20200702195609.v2.2.I3487912650c4bf7acb85b595e2865036cd0a953c@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200702195609.v2.1.I29f1f31d4312a6029cc38e3f4fe9aa0baedece7d@changeid>
References: <20200702195609.v2.1.I29f1f31d4312a6029cc38e3f4fe9aa0baedece7d@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_09:2020-07-02,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 2/4] ram: stm32mp1: add parameter addr in
	test FrequencySelectivePattern
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

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

(no changes since v1)

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
