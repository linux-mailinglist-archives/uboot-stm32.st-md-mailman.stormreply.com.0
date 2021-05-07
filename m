Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB4376587
	for <lists+uboot-stm32@lfdr.de>; Fri,  7 May 2021 14:50:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B804EC58D7A;
	Fri,  7 May 2021 12:50:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25D1BC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 May 2021 12:50:49 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147CkIbI028330; Fri, 7 May 2021 14:50:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=hBEAczKpxlUL3+cMUQRZoZqEBxg0ngvQh1dIMaxzFjQ=;
 b=Ml+9toAieI+xlELvOGxyzgPTm0SfL4l2b4O7iqqtSO6axP2idr3vKWu027Dhhmy/zzIB
 EmfJgCjQ/IjKnrOzGgM8+KXlGgiMvZnxBAXSFx6h5uhW4ODZR6MPPtLOSBBk/9qfLwds
 lfCyUCRykyxqdc8vM+k5dm3+Ltw1wqHaook+3RgBg1tMVgqOyV+TroShiZeyZ9XqeQYT
 HYdNCCnTd8ljLIYg9QCwSIGhRU2WAB5bDmKEzavsjZM4cgmgEKLiyRYFhDSZ+3fJSt2V
 IxlAf67K/Ks+/1QXXz3R1cy/inelkxznSyyMNMYw+hKx/wnzxN2CDMuEiNaBp9s98aUR yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38cspsbxh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 14:50:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A20510002A;
 Fri,  7 May 2021 14:50:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4127421CA8B;
 Fri,  7 May 2021 14:50:47 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May 2021 14:50:46
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 7 May 2021 14:50:32 +0200
Message-ID: <20210507145030.v4.4.I0067e50d8ebc0817f12ad5feb66db7e2f200d1d0@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507125035.1594-1-patrick.delaunay@foss.st.com>
References: <20210507125035.1594-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_04:2021-05-06,
 2021-05-07 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v4 4/7] test: lmb: add test for
	lmb_reserve_flags
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

Add a test to check the management of reserved region with flags.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 test/lib/lmb.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/test/lib/lmb.c b/test/lib/lmb.c
index 0d8963fcbf..b2c2b99ef1 100644
--- a/test/lib/lmb.c
+++ b/test/lib/lmb.c
@@ -723,3 +723,92 @@ static int lib_test_lmb_max_regions(struct unit_test_state *uts)
 
 DM_TEST(lib_test_lmb_max_regions,
 	UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
+
+static int lib_test_lmb_flags(struct unit_test_state *uts)
+{
+	const phys_addr_t ram = 0x40000000;
+	const phys_size_t ram_size = 0x20000000;
+	struct lmb lmb;
+	long ret;
+
+	lmb_init(&lmb);
+
+	ret = lmb_add(&lmb, ram, ram_size);
+	ut_asserteq(ret, 0);
+
+	/* reserve, same flag */
+	ret = lmb_reserve_flags(&lmb, 0x40010000, 0x10000, LMB_NOMAP);
+	ut_asserteq(ret, 0);
+	ASSERT_LMB(&lmb, ram, ram_size, 1, 0x40010000, 0x10000,
+		   0, 0, 0, 0);
+
+	/* reserve again, same flag */
+	ret = lmb_reserve_flags(&lmb, 0x40010000, 0x10000, LMB_NOMAP);
+	ut_asserteq(ret, 0);
+	ASSERT_LMB(&lmb, ram, ram_size, 1, 0x40010000, 0x10000,
+		   0, 0, 0, 0);
+
+	/* reserve again, new flag */
+	ret = lmb_reserve_flags(&lmb, 0x40010000, 0x10000, LMB_NONE);
+	ut_asserteq(ret, -1);
+	ASSERT_LMB(&lmb, ram, ram_size, 1, 0x40010000, 0x10000,
+		   0, 0, 0, 0);
+
+	ut_asserteq(lmb_is_nomap(&lmb.reserved.region[0]), 1);
+
+	/* merge after */
+	ret = lmb_reserve_flags(&lmb, 0x40020000, 0x10000, LMB_NOMAP);
+	ut_asserteq(ret, 1);
+	ASSERT_LMB(&lmb, ram, ram_size, 1, 0x40010000, 0x20000,
+		   0, 0, 0, 0);
+
+	/* merge before */
+	ret = lmb_reserve_flags(&lmb, 0x40000000, 0x10000, LMB_NOMAP);
+	ut_asserteq(ret, 1);
+	ASSERT_LMB(&lmb, ram, ram_size, 1, 0x40000000, 0x30000,
+		   0, 0, 0, 0);
+
+	ut_asserteq(lmb_is_nomap(&lmb.reserved.region[0]), 1);
+
+	ret = lmb_reserve_flags(&lmb, 0x40030000, 0x10000, LMB_NONE);
+	ut_asserteq(ret, 0);
+	ASSERT_LMB(&lmb, ram, ram_size, 2, 0x40000000, 0x30000,
+		   0x40030000, 0x10000, 0, 0);
+
+	ut_asserteq(lmb_is_nomap(&lmb.reserved.region[0]), 1);
+	ut_asserteq(lmb_is_nomap(&lmb.reserved.region[1]), 0);
+
+	/* test that old API use LMB_NONE */
+	ret = lmb_reserve(&lmb, 0x40040000, 0x10000);
+	ut_asserteq(ret, 1);
+	ASSERT_LMB(&lmb, ram, ram_size, 2, 0x40000000, 0x30000,
+		   0x40030000, 0x20000, 0, 0);
+
+	ut_asserteq(lmb_is_nomap(&lmb.reserved.region[0]), 1);
+	ut_asserteq(lmb_is_nomap(&lmb.reserved.region[1]), 0);
+
+	ret = lmb_reserve_flags(&lmb, 0x40070000, 0x10000, LMB_NOMAP);
+	ut_asserteq(ret, 0);
+	ASSERT_LMB(&lmb, ram, ram_size, 3, 0x40000000, 0x30000,
+		   0x40030000, 0x20000, 0x40070000, 0x10000);
+
+	ret = lmb_reserve_flags(&lmb, 0x40050000, 0x10000, LMB_NOMAP);
+	ut_asserteq(ret, 0);
+	ASSERT_LMB(&lmb, ram, ram_size, 4, 0x40000000, 0x30000,
+		   0x40030000, 0x20000, 0x40050000, 0x10000);
+
+	/* merge with 2 adjacent regions */
+	ret = lmb_reserve_flags(&lmb, 0x40060000, 0x10000, LMB_NOMAP);
+	ut_asserteq(ret, 2);
+	ASSERT_LMB(&lmb, ram, ram_size, 3, 0x40000000, 0x30000,
+		   0x40030000, 0x20000, 0x40050000, 0x30000);
+
+	ut_asserteq(lmb_is_nomap(&lmb.reserved.region[0]), 1);
+	ut_asserteq(lmb_is_nomap(&lmb.reserved.region[1]), 0);
+	ut_asserteq(lmb_is_nomap(&lmb.reserved.region[2]), 1);
+
+	return 0;
+}
+
+DM_TEST(lib_test_lmb_flags,
+	UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
