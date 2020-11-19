Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C39A02B8E64
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Nov 2020 10:09:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E7CAC56631;
	Thu, 19 Nov 2020 09:09:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6760AC56631
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Nov 2020 09:09:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJ97rnv004562; Thu, 19 Nov 2020 10:09:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=7C8nYk2cPkGKBzZhtJyyzNev5Quc14oRIIsem4ZhErY=;
 b=Bs7UILxkrIWFvjiKH8jJQKNFBs4JKqiLLOjEMFDQ9xUXB/PC+tA2iZ69RJGgN8ByA+JQ
 IaNY12qDexmgZKQBJBIQa9jS0DKlbWEZvWC1347CuHTjLoKBf58skMvFzaoHmCliDb+g
 NHiBYfizrIkifaiyjIIAB8CxhKHG3YcwfWXaIsybJ64Y4JvrDRzPFVy0jGL1rgZj++sA
 VvihTv0+wVfD2eEOFhJvzO4mvYPhOYXldKRMv6xLx759odHlFZ4vt/qc41Mok2rj6iA1
 htW3JdAOL5zcMPByfIzAJugjLpxha1g/U0unM3fGti1BSpBh+u6zPrRr1Mel13NovEAl ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t5w2640j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 10:09:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61AE3100034;
 Thu, 19 Nov 2020 10:09:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5735E236ED1;
 Thu, 19 Nov 2020 10:09:16 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov 2020 10:09:15
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 Nov 2020 10:08:43 +0100
Message-ID: <20201119090843.5614-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119090843.5614-1-patrick.delaunay@st.com>
References: <20201119090843.5614-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_05:2020-11-17,
 2020-11-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/3] test: correct the test prefix in ut str
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

Align the prefix used in cmd_ut_category function and name of tests
for ut str.
This patch solves the issues detected by "make qcheck" after previous
patch.

Fixes: fdc79a6b125d ("lib: Add a function to convert a string to upper case")
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 test/str_ut.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/test/str_ut.c b/test/str_ut.c
index ef1205dbbd..cd5045516d 100644
--- a/test/str_ut.c
+++ b/test/str_ut.c
@@ -19,7 +19,7 @@ static const char str3[] = "0xbI'm sorry you're alive.";
 /* Declare a new str test */
 #define STR_TEST(_name, _flags)		UNIT_TEST(_name, _flags, str_test)
 
-static int str_test_upper(struct unit_test_state *uts)
+static int str_upper(struct unit_test_state *uts)
 {
 	char out[TEST_STR_SIZE];
 
@@ -55,7 +55,7 @@ static int str_test_upper(struct unit_test_state *uts)
 
 	return 0;
 }
-STR_TEST(str_test_upper, 0);
+STR_TEST(str_upper, 0);
 
 static int run_strtoul(struct unit_test_state *uts, const char *str, int base,
 		       ulong expect_val, int expect_endp_offset, bool upper)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
