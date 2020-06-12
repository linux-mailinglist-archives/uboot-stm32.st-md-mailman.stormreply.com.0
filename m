Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E371F755B
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jun 2020 10:35:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52EE3C36B26
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jun 2020 08:35:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02115C36B22
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2020 08:35:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C8XUCh022121; Fri, 12 Jun 2020 10:35:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=H4/1Hi+oR3fUUns8HfAVBeTV6xvk/nJCfOZjPmbn6zU=;
 b=J9CXcYU3+5v+qpLMbhzYSpOzJmUFjHdZru/VzYXkCRStDgeAGSB2Lz41rXkNXY9eHBry
 qBkZ4619C7k1654Tb1CuBi69Lio/ozNi8LiXb5ZtLIqCqc+GvGYekQ2gkRMgY7HfKZ9/
 H5HFzAfYfjRJgkvYDh6u8Wdt/PKczu7LQdmpAHsILeliTWpXwvH/VSoTStIZCNN6We7J
 P03e/A+boxwGXsoDjTqUbutH1BdnRioeARL0W2CFchZZCuocKVthR0OWRWOK9TliMvDd
 yiIf2eilTAVcj9Y1zwUVxAZsRUo2B197ZppDUNaAXVfvacI0FLShD6cLUrYISC6NFYVN kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g097q8e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 10:35:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EDBFE100034;
 Fri, 12 Jun 2020 10:35:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E37DD2B6681;
 Fri, 12 Jun 2020 10:35:05 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 12 Jun 2020 10:35:05 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 12 Jun 2020 10:34:57 +0200
Message-ID: <20200612103440.4.Id92de3d924b6867219d678a450c01fd8abe8c268@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612103440.1.I29f1f31d4312a6029cc38e3f4fe9aa0baedece7d@changeid>
References: <20200612103440.1.I29f1f31d4312a6029cc38e3f4fe9aa0baedece7d@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-12_07:2020-06-11,
 2020-06-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 4/4] ram: stm32mp1: add size and addr
	parameter to test all
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

Add size and addr parameter to test "All" to override the default
value (4kB and STM32_DDR_BASE) used in tests with these optional
parameters: [size] or [addr].

When other optional parameters are present before [addr],
they are replaced by default value:
- [loop] = "1"
- [pattern] = "-" (new: force default pattern)

Example to use:

DDR>test 0 1 0x20000

DDR>test 0 1 0x1000000 0xD0000000

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_tests.c | 47 +++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_tests.c b/drivers/ram/stm32mp1/stm32mp1_tests.c
index a2a69da9a3..952006aa14 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tests.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tests.c
@@ -14,6 +14,8 @@
 
 #define ADDR_INVALID	0xFFFFFFFF
 
+#define PATTERN_DEFAULT	"-"
+
 DECLARE_GLOBAL_DATA_PTR;
 
 static int get_bufsize(char *string, int argc, char *argv[], int arg_nb,
@@ -103,6 +105,10 @@ static int get_pattern(char *string, int argc, char *argv[], int arg_nb,
 	unsigned long value;
 
 	if (argc > arg_nb) {
+		if (!strcmp(argv[arg_nb], PATTERN_DEFAULT)) {
+			*pattern = default_pattern;
+			return 0;
+		}
 		if (strict_strtoul(argv[arg_nb], 16, &value) < 0) {
 			sprintf(string, "invalid %d parameter %s",
 				arg_nb, argv[arg_nb]);
@@ -1343,17 +1349,52 @@ static enum test_result test_all(struct stm32mp1_ddrctl *ctl,
 				 char *string, int argc, char *argv[])
 {
 	enum test_result res = TEST_PASSED, result;
-	int i, nb_error = 0;
+	int i, j, nb_error = 0, len;
 	u32 loop = 0, nb_loop;
+	int argc_test;
+	char *argv_test[4];
+	char loop_string[] = "1";
+	char pattern_string[] = PATTERN_DEFAULT;
+	u32 *addr;
 
 	if (get_nb_loop(string, argc, argv, 0, &nb_loop, 1))
 		return TEST_ERROR;
 
+	if (get_addr(string, argc, argv, 2, (u32 *)&addr))
+		return TEST_ERROR;
+
 	while (!nb_error) {
 		/* execute all the test except the lasts which are infinite */
 		for (i = 1; i < test_nb - NB_TEST_INFINITE; i++) {
+			argc_test = 0;
+			j = 0;
+			len = strlen(test[i].usage);
+			if (argc > 1 && j < len &&
+			    !strncmp("[size]", &test[i].usage[j], 6)) {
+				argv_test[argc_test++] = argv[1];
+				j += 7;
+			}
+			if (argc > 2) {
+				if (j < len &&
+				    !strncmp("[loop]", &test[i].usage[j], 6)) {
+					argv_test[argc_test++] = loop_string;
+					j += 7;
+				}
+				if (j < len &&
+				    !strncmp("[pattern]", &test[i].usage[j],
+					     9)) {
+					argv_test[argc_test++] = pattern_string;
+					j += 10;
+				}
+				if (j < len &&
+				    !strncmp("[addr]", &test[i].usage[j], 6)) {
+					argv_test[argc_test++] = argv[2];
+					j += 7;
+				}
+			}
 			printf("execute %d:%s\n", (int)i, test[i].name);
-			result = test[i].fct(ctl, phy, string, 0, NULL);
+			result = test[i].fct(ctl, phy, string,
+					     argc_test, argv_test);
 			printf("result %d:%s = ", (int)i, test[i].name);
 			if (result != TEST_PASSED) {
 				nb_error++;
@@ -1384,7 +1425,7 @@ static enum test_result test_all(struct stm32mp1_ddrctl *ctl,
  ****************************************************************/
 
 const struct test_desc test[] = {
-	{test_all, "All", "[loop]", "Execute all tests", 1 },
+	{test_all, "All", "[loop] [size] [addr]", "Execute all tests", 3 },
 	{test_databus, "Simple DataBus", "[addr]",
 	 "Verifies each data line by walking 1 on fixed address",
 	 1
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
