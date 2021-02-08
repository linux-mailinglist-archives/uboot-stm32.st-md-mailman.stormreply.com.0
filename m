Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B07CF313336
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Feb 2021 14:27:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7192AC57B54;
	Mon,  8 Feb 2021 13:27:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90765C5717D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 13:27:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 118DMFfQ002274; Mon, 8 Feb 2021 14:27:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=6TOu1UL5B5Hu9ssuaV+lUoIvqZCW8SnLpTXws1rppiU=;
 b=uR7Me+VG2eZh8e+qOHQ5Zhbw8ehDpezhrpABmGJSQo3bpmWDb4Fwh1bQJLGDSn4WL8tF
 wyMBMlnRM9x6tQAlGH9r68tNxLEuK5qrtgsBpI4n33Uxz0fCE4cs2MSzp7c2ghJhTPxD
 1PxsG6kWJrsplPmdoSRfmdwzn1WtZN9Own5vJKj4hR7IG5vgOQNVpMgflLfO1ryQ+klb
 NoOyCjjy+mH48BPhXg5W3iSYphC8NB6lu1vjfQ1nK4XbTRCtooMwMCsofSTxQJbx7JXI
 QrIyREB8B+4iH7C9IAPLTjQOmXHNvs5C1HQif2XbFPikMxF2BvlJqOavdHxJTICSmT/U Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hraujc3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 14:27:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 564FE10002A;
 Mon,  8 Feb 2021 14:27:20 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 442212AD2C0;
 Mon,  8 Feb 2021 14:27:20 +0100 (CET)
Received: from localhost (10.75.127.123) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 8 Feb 2021 14:27:19 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 8 Feb 2021 14:26:52 +0100
Message-ID: <20210208142645.v2.4.I0067e50d8ebc0817f12ad5feb66db7e2f200d1d0@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
References: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE6.st.com (10.75.127.70) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-08_06:2021-02-08,
 2021-02-08 signatures=0
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, marek.bykowski@gmail.com,
 Etienne
 Carriere <etienne.carriere@linaro.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: [Uboot-stm32] [PATCH v2 4/7] test: lmb: add test for
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 test/lib/lmb.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/test/lib/lmb.c b/test/lib/lmb.c
index 644ee78758..d7bd826190 100644
--- a/test/lib/lmb.c
+++ b/test/lib/lmb.c
@@ -659,3 +659,92 @@ static int lib_test_lmb_get_free_size(struct unit_test_state *uts)
 
 DM_TEST(lib_test_lmb_get_free_size,
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
