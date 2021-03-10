Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FD6333883
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Mar 2021 10:16:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 038D7C57195;
	Wed, 10 Mar 2021 09:16:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BCAAC57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 09:16:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A9D6we003440; Wed, 10 Mar 2021 10:16:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=pqe34HSbdbV4tQ3zWBpSHXMN+JC9Cq76O4NPORhAFDU=;
 b=qJAYarj0+XQrYUxLlJ4yyxZQjSGxfBqrPK0S//sXLOuLL4zA3PVhP99LKa5BDhruOUFc
 Z9HTk6Ha5tEklM7SpTPMBJWnKADNB1efxAaUbS7Weia3xzpYvB8gyOGd4mA78K2rmxUM
 46HambTaHSW2JRluTdjJfpIv9FSyo1N7ffOBZNDxYKoRjgWGSfPx8PxbAWvSrQBQ9Knv
 6o2HvknaFeVrrP0K+RYSwI9YQ92O1eT9Tl+ReHMDvqhjjC1/PIyiN6HoaSe0piU1X/H9
 mOkw/7u6fitCDV3MDZCtBJ1CcC6k9/vRPEUa2eVwrKTqdlViH2AW0PwtxLUr9KEO/6I2 kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741gpq1q5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 10:16:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B42310002A;
 Wed, 10 Mar 2021 10:16:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30785228D95;
 Wed, 10 Mar 2021 10:16:48 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Mar 2021 10:16:47
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 10 Mar 2021 10:16:30 +0100
Message-ID: <20210310101622.v2.6.Id37d7acc114d58f6c20cfb3200846bdec196a740@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_07:2021-03-09,
 2021-03-10 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v2 6/8] test: lmb: add test for overflow
	protection in lmb_add_region
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

Add test for max number of memory regions and in reserved regions.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- new in V2: add test for overflow protection in lmb libary

 test/lib/lmb.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/test/lib/lmb.c b/test/lib/lmb.c
index 644ee78758..0d8963fcbf 100644
--- a/test/lib/lmb.c
+++ b/test/lib/lmb.c
@@ -659,3 +659,67 @@ static int lib_test_lmb_get_free_size(struct unit_test_state *uts)
 
 DM_TEST(lib_test_lmb_get_free_size,
 	UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
+
+static int lib_test_lmb_max_regions(struct unit_test_state *uts)
+{
+	const phys_addr_t ram = 0x00000000;
+	const phys_size_t ram_size = 0x8000000;
+	const phys_size_t blk_size = 0x10000;
+	phys_addr_t offset;
+	struct lmb lmb;
+	int ret, i;
+
+	lmb_init(&lmb);
+
+	ut_asserteq(lmb.memory.cnt, 0);
+	ut_asserteq(lmb.memory.max, 8);
+	ut_asserteq(lmb.reserved.cnt, 0);
+	ut_asserteq(lmb.reserved.max, 8);
+
+	/*  Add 8 memory regions */
+	for (i = 0; i < 8; i++) {
+		offset = ram + 2 * i * ram_size;
+		ret = lmb_add(&lmb, offset, ram_size);
+		ut_asserteq(ret, 0);
+	}
+	ut_asserteq(lmb.memory.cnt, 8);
+	ut_asserteq(lmb.reserved.cnt, 0);
+
+	/*  error for the 9th memory regions */
+	offset = ram + 2 * 8 * ram_size;
+	ret = lmb_add(&lmb, offset, ram_size);
+	ut_asserteq(ret, -1);
+
+	ut_asserteq(lmb.memory.cnt, 8);
+	ut_asserteq(lmb.reserved.cnt, 0);
+
+	/*  reserve 8 regions */
+	for (i = 0; i < 8; i++) {
+		offset = ram + 2 * i * blk_size;
+		ret = lmb_reserve(&lmb, offset, blk_size);
+		ut_asserteq(ret, 0);
+	}
+
+	ut_asserteq(lmb.memory.cnt, 8);
+	ut_asserteq(lmb.reserved.cnt, 8);
+
+	/*  error for the 9th reserved blocks */
+	offset = ram + 2 * 8 * blk_size;
+	ret = lmb_reserve(&lmb, offset, blk_size);
+	ut_asserteq(ret, -1);
+
+	ut_asserteq(lmb.memory.cnt, 8);
+	ut_asserteq(lmb.reserved.cnt, 8);
+
+	/*  check each regions */
+	for (i = 0; i < 8; i++)
+		ut_asserteq(lmb.memory.region[i].base, ram + 2 * i * ram_size);
+
+	for (i = 0; i < 8; i++)
+		ut_asserteq(lmb.reserved.region[i].base, ram + 2 * i * blk_size);
+
+	return 0;
+}
+
+DM_TEST(lib_test_lmb_max_regions,
+	UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
