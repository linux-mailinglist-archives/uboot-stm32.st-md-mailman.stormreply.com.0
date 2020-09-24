Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5212E277539
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Sep 2020 17:26:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1638CC3FADF;
	Thu, 24 Sep 2020 15:26:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 865E7C3FADE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Sep 2020 15:26:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08OFBfKG005160; Thu, 24 Sep 2020 17:26:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=edXrfTcjClScskCoNyZmBJFqLI57VIxh8bKSICXMcKs=;
 b=cBkfAIvDo+5M8GcpSPRmqxduCJj+y6DAn9i972c49jKJToATWomxtQxewjU5n2Mo8EJh
 9bgZq9SyC5ywzzksdo6fpwxsHGH4aPkDlFW+TqdXnJ0T780EiDOWs8hUDJVN7pfhibg5
 ODMQpgROpQJpYnDjKbSuNIUF8jajX7UwoCfJF3ZGtHcr85STLHXFxJLOAkpp6IfX2Gcu
 n+/Cnq5hNqnLnv9Y9KbI2GD0pVyZ61W5LPM/8+aSDr8aaDdKOVcQG1I5s12kUJ+COAth
 r6uNWXMt6hFxeQBAl05ByHU3DOcqSyRH5qUjpi5bF0YUuv7NM3XqfwviZs4qA+DAB8Pf ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n748ewfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 17:26:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 491DD10002A;
 Thu, 24 Sep 2020 17:26:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3EB462BAB93;
 Thu, 24 Sep 2020 17:26:26 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 24 Sep 2020 17:26:25 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 24 Sep 2020 17:26:20 +0200
Message-ID: <20200924152621.1317-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_09:2020-09-24,
 2020-09-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] dm: update test on of_offset in ofnode_valid
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

Update the test for node.of_offset because an invalid offset is not
always set to -1 because the return value of the libfdt functions are:
+ an error with a value < 0
+ a valid offset with value >=0

For example, in ofnode_get_by_phandle() function, we have:
node.of_offset = fdt_node_offset_by_phandle(gd->fdt_blob, phandle);
and this function can return -FDT_ERR_BADPHANDLE (-6).

Without this patch, the added test dm_test_ofnode_get_by_phandle failed.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/dm/ofnode.h |  2 +-
 test/dm/ofnode.c    | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/dm/ofnode.h b/include/dm/ofnode.h
index 8df2facf99..ef3ac7f329 100644
--- a/include/dm/ofnode.h
+++ b/include/dm/ofnode.h
@@ -127,7 +127,7 @@ static inline bool ofnode_valid(ofnode node)
 	if (of_live_active())
 		return node.np != NULL;
 	else
-		return node.of_offset != -1;
+		return node.of_offset >= 0;
 }
 
 /**
diff --git a/test/dm/ofnode.c b/test/dm/ofnode.c
index 8bfb706602..4ae8d281a7 100644
--- a/test/dm/ofnode.c
+++ b/test/dm/ofnode.c
@@ -19,6 +19,22 @@ static int dm_test_ofnode_compatible(struct unit_test_state *uts)
 }
 DM_TEST(dm_test_ofnode_compatible, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
 
+static int dm_test_ofnode_get_by_phandle(struct unit_test_state *uts)
+{
+	/* test invalid phandle */
+	ut_assert(!ofnode_valid(ofnode_get_by_phandle(0)));
+	ut_assert(!ofnode_valid(ofnode_get_by_phandle(-1)));
+
+	/* test first valid phandle */
+	ut_assert(ofnode_valid(ofnode_get_by_phandle(1)));
+
+	/* test unknown phandle */
+	ut_assert(!ofnode_valid(ofnode_get_by_phandle(0x1000000)));
+
+	return 0;
+}
+DM_TEST(dm_test_ofnode_get_by_phandle, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
+
 static int dm_test_ofnode_by_prop_value(struct unit_test_state *uts)
 {
 	const char propname[] = "compatible";
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
