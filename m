Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C69022B8E65
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Nov 2020 10:09:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90BABC56630;
	Thu, 19 Nov 2020 09:09:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FEAEC35E3C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Nov 2020 09:09:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJ97uBC004846; Thu, 19 Nov 2020 10:09:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=RgrzMQDT7yZGgPTzG39psZCGA+vFDEqBIYYuFXr5ApQ=;
 b=G47irLy0GO41NJlKm67XTr4fqegLtaYHgSVKsHh2qz78nBYWI8UDLcUKMkq12YRhduSf
 2nA95dNvSRGv+MvJxxrffuSyNQPX7ASEyAKBnGhQXYsrJ8XlNRSPbtkxoBRBqal5Iy8/
 eYAozGA9QJXaK0nJndtRyO3/5oFZtmetJfzY8JUpHX20sT8QnTyHGGrxrdktGXC0Onac
 g5AdIjdzcTR1KoTRRbV2Slc3Ywh8p7r50F8UXu20yG5pIkLXhcCKDHAFmXps0LiVIjqg
 O1QcPS7V97M5GXbPH5OuBeTqkxiDU2jCitWaDwMdRJqQL4DhdxY7VpmdQtr2S6Qpdrkw nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t70gxv6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 10:09:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 315A6100034;
 Thu, 19 Nov 2020 10:09:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B1DB4236ED5;
 Thu, 19 Nov 2020 10:09:14 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov 2020 10:09:14
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 Nov 2020 10:08:41 +0100
Message-ID: <20201119090843.5614-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_05:2020-11-17,
 2020-11-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/3] test: cmd_ut_category: raise a error when
	the test is not found
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

Raise an error when test is not found, for example with manual test
with bad test name, as following, doesn't raise an error

=> ut lib bad
Failures: 0

After the patch:

=> ut lib bad
lib test bad not found
Failures: 1

This patch allows also to detect tests which don't respect the expected
format with "prefix" used in cmd_ut_category and defined in ut_subtest
(./test/py/conftest.py). When I execute "make qcheck" this patch detects
2 issues, corrected by the 2 next patches.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 test/cmd_ut.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/test/cmd_ut.c b/test/cmd_ut.c
index 8f0bc688a2..6a752e6456 100644
--- a/test/cmd_ut.c
+++ b/test/cmd_ut.c
@@ -20,6 +20,7 @@ int cmd_ut_category(const char *name, const char *prefix,
 	struct unit_test_state uts = { .fail_count = 0 };
 	struct unit_test *test;
 	int prefix_len = prefix ? strlen(prefix) : 0;
+	int nb_tests = 0;
 
 	if (argc == 1)
 		printf("Running %d %s tests\n", n_ents, name);
@@ -47,6 +48,12 @@ int cmd_ut_category(const char *name, const char *prefix,
 		uts.start = mallinfo();
 
 		test->func(&uts);
+		nb_tests++;
+	}
+
+	if (argc > 1 && nb_tests == 0) {
+		printf("%s test %s not found\n", name, argv[1]);
+		uts.fail_count = 1;
 	}
 
 	printf("Failures: %d\n", uts.fail_count);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
