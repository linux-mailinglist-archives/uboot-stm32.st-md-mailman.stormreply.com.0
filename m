Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 624502C62EB
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 11:21:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B379C56633;
	Fri, 27 Nov 2020 10:21:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4557EC32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 10:21:11 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARAIIso019311; Fri, 27 Nov 2020 11:21:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=HZhD9KZI+lYy8523o1ICZAao0PeE2RfuRcuXbIl01Oo=;
 b=pz3oWbyjt/LiwQXD7plvva5l61v+x1YBsq23sgzOJBm5X2S6/3sXFAfhZpS8BvpEnjiE
 sC+12gsHBPHJBp0nc6U3GuT+i7MjnYoQ1ZMrJ7GVYYaZxKnKGk8SQQa8EL0sarEP52+D
 0wxBJIBfuamCbK/oGlEtlDiZd1UYOeFYn7JZaRaQocqnVP4wRXfmtbOYvzAlPiUP2+XG
 LW3d1moQ+qj2OiaiQyQjzSK4h4yW0OFdUWAsmo5SmIhiSbWiPzY6/F3qa1u+fOx8k1eb
 7pthddHRAh5HabyBgMYQu1FTdCaiwfXX+XNM2g81a7nij0Sdka2ppvmiLlJjw2zDMgDS UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01d1xap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 11:21:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 00B7F100038;
 Fri, 27 Nov 2020 11:21:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29FF9236CB6;
 Fri, 27 Nov 2020 11:21:08 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov 2020 11:21:07
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Nov 2020 11:20:53 +0100
Message-ID: <20201127102100.11721-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201127102100.11721-1-patrick.delaunay@st.com>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_05:2020-11-26,
 2020-11-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 3/9] test: log: add test for dropped
	messages
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

Add a new test to check the dropped messages when LOG is not ready
with log_drop_count and the result of _log().

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- add test to count the dropped messages (NEW)

 test/log/log_test.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/test/log/log_test.c b/test/log/log_test.c
index 15874751f9..6bafc1e315 100644
--- a/test/log/log_test.c
+++ b/test/log/log_test.c
@@ -15,30 +15,38 @@
 DECLARE_GLOBAL_DATA_PTR;
 
 /* emit some sample log records in different ways, for testing */
-static int do_log_run(int cat, const char *file)
+static int do_log_run(struct unit_test_state *uts, int cat, const char *file)
 {
 	int i;
+	int ret, expected_ret;
+
+	if (gd->flags & GD_FLG_LOG_READY)
+		expected_ret = 0;
+	else
+		expected_ret = -ENOSYS;
 
 	gd->log_fmt = LOGF_TEST;
 	debug("debug\n");
 	for (i = LOGL_FIRST; i < LOGL_COUNT; i++) {
 		log(cat, i, "log %d\n", i);
-		_log(log_uc_cat(cat), i, file, 100 + i, "func", "_log %d\n",
-		     i);
+		ret = _log(log_uc_cat(cat), i, file, 100 + i,
+			   "func", "_log %d\n", i);
+		ut_asserteq(ret, expected_ret);
 	}
 	/* test with LOGL_COUNT flag */
 	for (i = LOGL_FIRST; i < LOGL_COUNT; i++) {
-		_log(log_uc_cat(cat), i | LOGL_FORCE_DEBUG, file, 100 + i,
-		     "func", "_log force %d\n", i);
+		ret = _log(log_uc_cat(cat), i | LOGL_FORCE_DEBUG, file, 100 + i,
+			   "func", "_log force %d\n", i);
+		ut_asserteq(ret, expected_ret);
 	}
 
 	gd->log_fmt = log_get_default_format();
 	return 0;
 }
 
-#define log_run_cat(cat) do_log_run(cat, "file")
-#define log_run_file(file) do_log_run(UCLASS_SPI, file)
-#define log_run() do_log_run(UCLASS_SPI, "file")
+#define log_run_cat(cat) do_log_run(uts, cat, "file")
+#define log_run_file(file) do_log_run(uts, UCLASS_SPI, file)
+#define log_run() do_log_run(uts, UCLASS_SPI, "file")
 
 #define EXPECT_LOG BIT(0)
 #define EXPECT_DIRECT BIT(1)
@@ -393,3 +401,22 @@ int log_test_min(struct unit_test_state *uts)
 	return 0;
 }
 LOG_TEST_FLAGS(log_test_min, UT_TESTF_CONSOLE_REC);
+
+/* Check dropped traces */
+int log_test_dropped(struct unit_test_state *uts)
+{
+	/* force LOG not ready */
+	gd->flags &= ~(GD_FLG_LOG_READY);
+	gd->log_drop_count = 0;
+
+	ut_assertok(console_record_reset_enable());
+	log_run();
+
+	ut_asserteq(gd->log_drop_count, 3 * (LOGL_COUNT - LOGL_FIRST - 1));
+
+	gd->flags |= GD_FLG_LOG_READY;
+	gd->log_drop_count = 0;
+
+	return 0;
+}
+LOG_TEST_FLAGS(log_test_dropped, UT_TESTF_CONSOLE_REC);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
