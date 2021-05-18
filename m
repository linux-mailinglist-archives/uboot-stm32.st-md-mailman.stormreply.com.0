Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD67387A2C
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 May 2021 15:41:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CB49C57B74;
	Tue, 18 May 2021 13:41:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAE93C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:40:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IDaidC009200; Tue, 18 May 2021 15:40:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=1dJnXrkKkcASY9/T+fQDReo+Y4E/B1p/MPjs3vdyVBM=;
 b=4eYQBUSuZpkIDddhOo1iE/RZO3ZvGULfGYX1rWWmH7pAjOcsAH/zinF4qGtfywUYLRZj
 2NbeMjVlcT1Nj6QguTN+dARIkTOffbqd1eMl8oXVKwDV4trrz2TEZyCbCyutipeQhNii
 HejwF4nQV8PUV3ffRgIvbIScxPl6YSwbYuW3BMJjFUUNms1l2OA+SAYw/UneLPVBg0Yh
 ohD5vdpWoWTkSwYNYSVrdYPncQUA39IJHh2mO0lhIoTUzTghw9CVwXsJWu5pRGWKMDma
 JoYWuWeK6wXgBu815ZHAywSG45j40ty+cof0HtWHmxGO9C0jolqbER5TQnt0HJKAAvjZ QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38mda9gha6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:40:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 47D8A10002A;
 Tue, 18 May 2021 15:40:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD70F21D1C9;
 Tue, 18 May 2021 15:40:53 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 15:40:53
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 May 2021 15:40:38 +0200
Message-ID: <20210518154026.2.Id119f821cb12efab440905cad658e8cb459ebd8a@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518134039.26865-1-patrick.delaunay@foss.st.com>
References: <20210518134039.26865-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 2/2] test: add dm_test_read_resource
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
---

 test/dm/test-fdt.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
index 9b771fdf19..b1736fbe27 100644
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
+	ut_asserteq(0x4D, res.end);
+
+	/* test resource with translation */
+	ut_assertok(uclass_find_device_by_name(UCLASS_TEST_DUMMY, "dev@1,100", &dev));
+	ut_assertok(dev_read_resource(dev, 0, &res));
+	ut_asserteq(0x9000, res.start);
+	ut_asserteq(0x9FFF, res.end);
+
+	/* test named resource */
+	ut_assertok(uclass_find_device_by_name(UCLASS_TEST_DUMMY, "dev@0,0", &dev));
+	ut_assertok(dev_read_resource_byname(dev, "sandbox-dummy-0", &res));
+	ut_asserteq(0x8000, res.start);
+	ut_asserteq(0x8FFF, res.end);
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
