Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F27C22C62EC
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 11:21:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B49E5C56635;
	Fri, 27 Nov 2020 10:21:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A5DAC56631
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 10:21:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARAIV9X009278; Fri, 27 Nov 2020 11:21:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=F5w3JW8Ap1mNx+aqnd+aQ5to8PlZL4NC2ECEmQV2dmg=;
 b=tUb09bNYWJ4ZejXKsgGQmFZd76iGlJKPieMUGjS5M9Z2lyGZyrnTSnw/wfOQ5XfVg4gL
 zYzYm/CIJILRaIIMEIWao5+pNROu9u4g4I+1YsGD/MncLQYYuNnhPTYvphp4/FYJpCls
 p9EtkO08Hd3sUzrZZQy7Q/Ai1SkOJtdNxG2wMWBDpbHW0sWxx1Rp66Kmum+3mrLf8ZSr
 l64u6aqcR5J1ymGRAJFQ3pZWvUl4poTKgZPQFBtKIvce/sWUEOoLPaelZKU/XGku/5gE
 OoqYbSuyGxcTpTMYvQ2uDpTnhqm0OnaBA73Vr+uv0iV+LjU6rWRhZaXiRW/vPGnUB8ki 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y05hsxpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 11:21:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 55EBE100034;
 Fri, 27 Nov 2020 11:21:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78FDB236CBA;
 Fri, 27 Nov 2020 11:21:06 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov 2020 11:21:05
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Nov 2020 11:20:51 +0100
Message-ID: <20201127102100.11721-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201127102100.11721-1-patrick.delaunay@st.com>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_05:2020-11-26,
 2020-11-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 1/9] test: add LOGL_FORCE_DEBUG flags
	support in log tests
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

Add a check of the _log function with LOGL_FORCE_DEBUG flags,
used to force the trace display.

The trace should be displayed for all the level when flags
have LOGL_FORCE_DEBUG bit is set, for any filter.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- Add test for LOGL_FORCE_DEBUG (NEW)

 test/log/log_test.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/test/log/log_test.c b/test/log/log_test.c
index ea4fc6bc30..15874751f9 100644
--- a/test/log/log_test.c
+++ b/test/log/log_test.c
@@ -26,6 +26,11 @@ static int do_log_run(int cat, const char *file)
 		_log(log_uc_cat(cat), i, file, 100 + i, "func", "_log %d\n",
 		     i);
 	}
+	/* test with LOGL_COUNT flag */
+	for (i = LOGL_FIRST; i < LOGL_COUNT; i++) {
+		_log(log_uc_cat(cat), i | LOGL_FORCE_DEBUG, file, 100 + i,
+		     "func", "_log force %d\n", i);
+	}
 
 	gd->log_fmt = log_get_default_format();
 	return 0;
@@ -38,6 +43,7 @@ static int do_log_run(int cat, const char *file)
 #define EXPECT_LOG BIT(0)
 #define EXPECT_DIRECT BIT(1)
 #define EXPECT_EXTRA BIT(2)
+#define EXPECT_FORCE BIT(3)
 
 static int do_check_log_entries(struct unit_test_state *uts, int flags, int min,
 				int max)
@@ -54,6 +60,11 @@ static int do_check_log_entries(struct unit_test_state *uts, int flags, int min,
 		for (; i <= LOGL_MAX ; i++)
 			ut_assert_nextline("func() _log %d", i);
 
+	for (i = LOGL_FIRST; i < LOGL_COUNT; i++) {
+		if (flags & EXPECT_FORCE)
+			ut_assert_nextline("func() _log force %d", i);
+	}
+
 	ut_assert_console_end();
 	return 0;
 }
@@ -66,10 +77,10 @@ static int do_check_log_entries(struct unit_test_state *uts, int flags, int min,
 
 #define check_log_entries_flags(flags) \
 	check_log_entries_flags_levels(flags, LOGL_FIRST, _LOG_MAX_LEVEL)
-#define check_log_entries() check_log_entries_flags(EXPECT_LOG | EXPECT_DIRECT)
+#define check_log_entries() check_log_entries_flags(EXPECT_LOG | EXPECT_DIRECT | EXPECT_FORCE)
 #define check_log_entries_extra() \
-	check_log_entries_flags(EXPECT_LOG | EXPECT_DIRECT | EXPECT_EXTRA)
-#define check_log_entries_none() check_log_entries_flags(0)
+	check_log_entries_flags(EXPECT_LOG | EXPECT_DIRECT | EXPECT_EXTRA | EXPECT_FORCE)
+#define check_log_entries_none() check_log_entries_flags(EXPECT_FORCE)
 
 /* Check a category filter using the first category */
 int log_test_cat_allow(struct unit_test_state *uts)
@@ -126,7 +137,7 @@ int log_test_file(struct unit_test_state *uts)
 
 	ut_assertok(console_record_reset_enable());
 	log_run_file("file");
-	check_log_entries_flags(EXPECT_DIRECT | EXPECT_EXTRA);
+	check_log_entries_flags(EXPECT_DIRECT | EXPECT_EXTRA | EXPECT_FORCE);
 
 	ut_assertok(console_record_reset_enable());
 	log_run_file("file2");
@@ -147,7 +158,7 @@ int log_test_file_second(struct unit_test_state *uts)
 
 	ut_assertok(console_record_reset_enable());
 	log_run_file("file2");
-	check_log_entries_flags(EXPECT_DIRECT | EXPECT_EXTRA);
+	check_log_entries_flags(EXPECT_DIRECT | EXPECT_EXTRA | EXPECT_FORCE);
 
 	ut_assertok(log_remove_filter("console", filt));
 	return 0;
@@ -182,8 +193,8 @@ int log_test_level(struct unit_test_state *uts)
 
 	ut_assertok(console_record_reset_enable());
 	log_run();
-	check_log_entries_flags_levels(EXPECT_LOG | EXPECT_DIRECT, LOGL_FIRST,
-				       LOGL_WARNING);
+	check_log_entries_flags_levels(EXPECT_LOG | EXPECT_DIRECT | EXPECT_FORCE,
+				       LOGL_FIRST, LOGL_WARNING);
 
 	ut_assertok(log_remove_filter("console", filt));
 	return 0;
@@ -351,7 +362,7 @@ int log_test_level_deny(struct unit_test_state *uts)
 
 	ut_assertok(console_record_reset_enable());
 	log_run();
-	check_log_entries_flags_levels(EXPECT_LOG | EXPECT_DIRECT,
+	check_log_entries_flags_levels(EXPECT_LOG | EXPECT_DIRECT | EXPECT_FORCE,
 				       LOGL_WARNING + 1, _LOG_MAX_LEVEL);
 
 	ut_assertok(log_remove_filter("console", filt1));
@@ -374,7 +385,7 @@ int log_test_min(struct unit_test_state *uts)
 
 	ut_assertok(console_record_reset_enable());
 	log_run();
-	check_log_entries_flags_levels(EXPECT_LOG | EXPECT_DIRECT,
+	check_log_entries_flags_levels(EXPECT_LOG | EXPECT_DIRECT | EXPECT_FORCE,
 				       LOGL_WARNING, LOGL_INFO - 1);
 
 	ut_assertok(log_remove_filter("console", filt1));
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
