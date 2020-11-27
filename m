Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEE02C62F2
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 11:21:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 075AEC56630;
	Fri, 27 Nov 2020 10:21:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECB14C56631
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 10:21:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARAIWvw009421; Fri, 27 Nov 2020 11:21:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Rikp1lzIxlmTCpUYdCmqMVwiA8fFn5dAjY05YISfRec=;
 b=v8qnBLbHNY1j54zJ/rxonMlsa73FZGlh9Qj5m/4S+85837pkVNaDwMrmHI9D2CJTLGom
 p8KzRo6Ut6lXJCKLleIFSCt199hwBPWhUgMauV5ikrOJeRKIfAnuiO6oRPSJfoMBN96l
 hVqo8kJI2F6623q3SRqMRnbgF4LfETqTMGr5D/XFlpblCIQbaCF3Ga2Ik3zDdAFpLRsu
 eNfh/fJh0Jnlu/CqK0rUaTtkT7ldcDk7IVyWsNprPRlwg2f6/wkc0/aft6QRoELTuIY+
 bPbVcLy+7ldzvcolXwIrMCf0hQMG1Y677gagbmId9tM8Do3OLAgpFY86WlHkKu7avv5w 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y05hsxqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 11:21:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 70D1A10002A;
 Fri, 27 Nov 2020 11:21:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64B20238DF9;
 Fri, 27 Nov 2020 11:21:12 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov 2020 11:21:11
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Nov 2020 11:20:58 +0100
Message-ID: <20201127102100.11721-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201127102100.11721-1-patrick.delaunay@st.com>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_05:2020-11-26,
 2020-11-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 8/9] test: log: add test for console output
	of dropped messages
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

Add a new test to check the content of the dropped messages
sent to console puts function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- added test for content of dropped messages (NEW)

 test/log/log_test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/test/log/log_test.c b/test/log/log_test.c
index 6bafc1e315..82234a6994 100644
--- a/test/log/log_test.c
+++ b/test/log/log_test.c
@@ -52,6 +52,7 @@ static int do_log_run(struct unit_test_state *uts, int cat, const char *file)
 #define EXPECT_DIRECT BIT(1)
 #define EXPECT_EXTRA BIT(2)
 #define EXPECT_FORCE BIT(3)
+#define EXPECT_DEBUG BIT(4)
 
 static int do_check_log_entries(struct unit_test_state *uts, int flags, int min,
 				int max)
@@ -63,6 +64,10 @@ static int do_check_log_entries(struct unit_test_state *uts, int flags, int min,
 			ut_assert_nextline("do_log_run() log %d", i);
 		if (flags & EXPECT_DIRECT)
 			ut_assert_nextline("func() _log %d", i);
+		if (flags & EXPECT_DEBUG) {
+			ut_assert_nextline("log %d", i);
+			ut_assert_nextline("_log %d", i);
+		}
 	}
 	if (flags & EXPECT_EXTRA)
 		for (; i <= LOGL_MAX ; i++)
@@ -71,6 +76,8 @@ static int do_check_log_entries(struct unit_test_state *uts, int flags, int min,
 	for (i = LOGL_FIRST; i < LOGL_COUNT; i++) {
 		if (flags & EXPECT_FORCE)
 			ut_assert_nextline("func() _log force %d", i);
+		if (flags & EXPECT_DEBUG)
+			ut_assert_nextline("_log force %d", i);
 	}
 
 	ut_assert_console_end();
@@ -413,6 +420,7 @@ int log_test_dropped(struct unit_test_state *uts)
 	log_run();
 
 	ut_asserteq(gd->log_drop_count, 3 * (LOGL_COUNT - LOGL_FIRST - 1));
+	check_log_entries_flags_levels(EXPECT_DEBUG, LOGL_FIRST, CONFIG_LOG_DEFAULT_LEVEL);
 
 	gd->flags |= GD_FLG_LOG_READY;
 	gd->log_drop_count = 0;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
