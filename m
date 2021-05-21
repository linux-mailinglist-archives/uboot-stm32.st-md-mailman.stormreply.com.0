Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6727B38C493
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 May 2021 12:25:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC02AC57B60;
	Fri, 21 May 2021 10:25:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E338C57B5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 May 2021 10:25:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LAMAGW029875; Fri, 21 May 2021 12:25:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=vxkpNekA58FrFqOoNOyxIkmcLRtUpXnCTYromaFbJ1I=;
 b=F2IZ5S20kbiTCq2uoXocB0q26vZYRQwRQ3xiT14VELPheafeGMYoxUskyujs4qFCwa5m
 Qn9u2kF0HMWoAJT051TPIVhI+1Z3DI0gXOMFILed0/ZP316PYwMXqAVnt/qEQIpeSOxF
 kbw4V8+2PJSWQPk8/bOGCryltjCrYVkco7qGds3w6rYMcKkwIZdSlF2gGkroAjOF7c3r
 gBQ93cpJo/lBqCDrWbxbNlFFLHGSkFaVDWMIdsNNq4tiSHaaUIkAOYSQTEwyH6yAT6m6
 63NreWMxbvcr26sMCfW9/PAcyEWXfzVqpJ+drbQDltoIZQsbZSnYtlu1U9G4GOoafHAP dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38p8pbrx5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 12:25:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 78E52100034;
 Fri, 21 May 2021 12:25:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F64C21CA9A;
 Fri, 21 May 2021 12:25:08 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 21 May 2021 12:25:08
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 May 2021 12:25:00 +0200
Message-ID: <20210521122438.v2.2.Id119f821cb12efab440905cad658e8cb459ebd8a@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521102500.12981-1-patrick.delaunay@foss.st.com>
References: <20210521102500.12981-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_04:2021-05-20,
 2021-05-21 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v2 2/2] test: add dm_test_read_resource
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

Add a test of dev_read_resource with translation or without translation

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Add reviewed-by
- use lower-case hex

 test/dm/test-fdt.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
index 9b771fdf19..d273e21853 100644
--- a/test/dm/test-fdt.c
+++ b/test/dm/test-fdt.c
@@ -19,6 +19,7 @@
 #include <dm/util.h>
 #include <dm/lists.h>
 #include <dm/of_access.h>
+#include <linux/ioport.h>
 #include <test/test.h>
 #include <test/ut.h>
 
@@ -1165,3 +1166,35 @@ static int dm_test_decode_display_timing(struct unit_test_state *uts)
 	return 0;
 }
 DM_TEST(dm_test_decode_display_timing, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
+
+/* Test read_resourcee() */
+static int dm_test_read_resource(struct unit_test_state *uts)
+{
+	struct udevice *dev;
+	struct resource res;
+
+	/* test resource without translation */
+	ut_assertok(uclass_find_device_by_name(UCLASS_SIMPLE_BUS, "syscon@2", &dev));
+	ut_assertok(dev_read_resource(dev, 0, &res));
+	ut_asserteq(0x40, res.start);
+	ut_asserteq(0x44, res.end);
+	ut_assertok(dev_read_resource(dev, 1, &res));
+	ut_asserteq(0x48, res.start);
+	ut_asserteq(0x4d, res.end);
+
+	/* test resource with translation */
+	ut_assertok(uclass_find_device_by_name(UCLASS_TEST_DUMMY, "dev@1,100", &dev));
+	ut_assertok(dev_read_resource(dev, 0, &res));
+	ut_asserteq(0x9000, res.start);
+	ut_asserteq(0x9fff, res.end);
+
+	/* test named resource */
+	ut_assertok(uclass_find_device_by_name(UCLASS_TEST_DUMMY, "dev@0,0", &dev));
+	ut_assertok(dev_read_resource_byname(dev, "sandbox-dummy-0", &res));
+	ut_asserteq(0x8000, res.start);
+	ut_asserteq(0x8fff, res.end);
+
+	return 0;
+}
+
+DM_TEST(dm_test_read_resource, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
