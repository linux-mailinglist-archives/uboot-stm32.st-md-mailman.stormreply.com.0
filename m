Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDEC2781D2
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Sep 2020 09:41:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88B65C3FADF;
	Fri, 25 Sep 2020 07:41:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67D19C3FADE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Sep 2020 07:41:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08P7bn77018153; Fri, 25 Sep 2020 09:41:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=L159NDEmrpaUnt8x8KCAzlenWPUEbC75fXKoC0g8nP4=;
 b=IxiUSbfuLvG4qUxQQhtK4UZQxlscK0zygXMCvb5Woe7UwV3zhdz7cMX9l1lHzuPbDCl8
 3ShBC/2UiKKjIM7eICC7+sO5tm0jPdRN4Qt56Jbir/hQYLmad5c09N7pW72dV29peXcu
 idddM3R95nz0FEItxiqPjSU31AbRWI4oLw8Q8YTiGADE8hpIPtN+qvD7IZ0u0RQs2dQj
 WWmnUBZqXN/YaV6DljCaB2fxgogMZKDm13vjZT4SMqwAxtRSeMCqzgHp0FSk5aFb/wyr
 YAccg6E0JcDX7nb0tJ9q8nHhbkjAuxsvg/YB1iAnarzglZWbmf4FIlduQNbPGS2b31ln YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n748k6t4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Sep 2020 09:41:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3A5110002A;
 Fri, 25 Sep 2020 09:41:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B31E21FE8A;
 Fri, 25 Sep 2020 09:41:29 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 25 Sep 2020 09:41:28 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 25 Sep 2020 09:41:16 +0200
Message-ID: <20200925074116.16068-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925074116.16068-1-patrick.delaunay@st.com>
References: <20200925074116.16068-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-25_02:2020-09-24,
 2020-09-25 signatures=0
Cc: Heiko Schocher <hs@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Sean Anderson <seanga2@gmail.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 3/3] test: dm: add test for phandle access
	functions
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

Add unitary test for phandle access functions
- ofnode_count_phandle_with_args
- ofnode_parse_phandle_with_args
- dev_count_phandle_with_args
- dev_read_phandle_with_args

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/sandbox/dts/test.dts |  1 +
 test/dm/ofnode.c          | 75 +++++++++++++++++++++++++++++++++++++++
 test/dm/test-fdt.c        | 65 +++++++++++++++++++++++++++++++++
 3 files changed, 141 insertions(+)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index 9f45c48e4e..25d4b2e598 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -128,6 +128,7 @@
 		str-value = "test string";
 		interrupts-extended = <&irq 3 0>;
 		acpi,name = "GHIJ";
+		phandle-value = <&gpio_c 10>, <0xFFFFFFFF 20>, <&gpio_a 30>;
 	};
 
 	junk {
diff --git a/test/dm/ofnode.c b/test/dm/ofnode.c
index 8bfb706602..84c49c4f18 100644
--- a/test/dm/ofnode.c
+++ b/test/dm/ofnode.c
@@ -87,6 +87,81 @@ static int dm_test_ofnode_read(struct unit_test_state *uts)
 }
 DM_TEST(dm_test_ofnode_read, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
 
+static int dm_test_ofnode_phandle(struct unit_test_state *uts)
+{
+	struct ofnode_phandle_args args;
+	ofnode node;
+	int ret;
+	const char prop[] = "test-gpios";
+	const char cell[] = "#gpio-cells";
+	const char prop2[] = "phandle-value";
+
+	node = ofnode_path("/a-test");
+	ut_assert(ofnode_valid(node));
+
+	/* Test ofnode_count_phandle_with_args with cell name */
+	ret = ofnode_count_phandle_with_args(node, "missing", cell, 0);
+	ut_asserteq(-ENOENT, ret);
+	ret = ofnode_count_phandle_with_args(node, prop, "#invalid", 0);
+	ut_asserteq(-EINVAL, ret);
+	ret = ofnode_count_phandle_with_args(node, prop, cell, 0);
+	ut_asserteq(5, ret);
+
+	/* Test ofnode_parse_phandle_with_args with cell name */
+	ret = ofnode_parse_phandle_with_args(node, "missing", cell, 0, 0,
+					     &args);
+	ut_asserteq(-ENOENT, ret);
+	ret = ofnode_parse_phandle_with_args(node, prop, "#invalid", 0, 0,
+					     &args);
+	ut_asserteq(-EINVAL, ret);
+	ret = ofnode_parse_phandle_with_args(node, prop, cell, 0, 0, &args);
+	ut_assertok(ret);
+	ut_asserteq(1, args.args_count);
+	ut_asserteq(1, args.args[0]);
+	ret = ofnode_parse_phandle_with_args(node, prop, cell, 0, 1, &args);
+	ut_assertok(ret);
+	ut_asserteq(1, args.args_count);
+	ut_asserteq(4, args.args[0]);
+	ret = ofnode_parse_phandle_with_args(node, prop, cell, 0, 2, &args);
+	ut_assertok(ret);
+	ut_asserteq(5, args.args_count);
+	ut_asserteq(5, args.args[0]);
+	ut_asserteq(1, args.args[4]);
+	ret = ofnode_parse_phandle_with_args(node, prop, cell, 0, 3, &args);
+	ut_asserteq(-ENOENT, ret);
+	ret = ofnode_parse_phandle_with_args(node, prop, cell, 0, 4, &args);
+	ut_assertok(ret);
+	ut_asserteq(1, args.args_count);
+	ut_asserteq(12, args.args[0]);
+	ret = ofnode_parse_phandle_with_args(node, prop, cell, 0, 5, &args);
+	ut_asserteq(-ENOENT, ret);
+
+	/* Test ofnode_count_phandle_with_args with cell count */
+	ret = ofnode_count_phandle_with_args(node, "missing", NULL, 2);
+	ut_asserteq(-ENOENT, ret);
+	ret = ofnode_count_phandle_with_args(node, prop2, NULL, 1);
+	ut_asserteq(3, ret);
+
+	/* Test ofnode_parse_phandle_with_args with cell count */
+	ret = ofnode_parse_phandle_with_args(node, prop2, NULL, 1, 0, &args);
+	ut_assertok(ret);
+	ut_asserteq(1, ofnode_valid(args.node));
+	ut_asserteq(1, args.args_count);
+	ut_asserteq(10, args.args[0]);
+	ret = ofnode_parse_phandle_with_args(node, prop2, NULL, 1, 1, &args);
+	ut_asserteq(-EINVAL, ret);
+	ret = ofnode_parse_phandle_with_args(node, prop2, NULL, 1, 2, &args);
+	ut_assertok(ret);
+	ut_asserteq(1, ofnode_valid(args.node));
+	ut_asserteq(1, args.args_count);
+	ut_asserteq(30, args.args[0]);
+	ret = ofnode_parse_phandle_with_args(node, prop2, NULL, 1, 3, &args);
+	ut_asserteq(-ENOENT, ret);
+
+	return 0;
+}
+DM_TEST(dm_test_ofnode_phandle, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
+
 static int dm_test_ofnode_read_chosen(struct unit_test_state *uts)
 {
 	const char *str;
diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
index 04802deb7f..862b7ce8b1 100644
--- a/test/dm/test-fdt.c
+++ b/test/dm/test-fdt.c
@@ -968,6 +968,71 @@ static int dm_test_read_int_index(struct unit_test_state *uts)
 }
 DM_TEST(dm_test_read_int_index, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
 
+static int dm_test_read_phandle(struct unit_test_state *uts)
+{
+	struct udevice *dev;
+	struct ofnode_phandle_args args;
+	int ret;
+	const char prop[] = "test-gpios";
+	const char cell[] = "#gpio-cells";
+	const char prop2[] = "phandle-value";
+
+	ut_assertok(uclass_first_device_err(UCLASS_TEST_FDT, &dev));
+	ut_asserteq_str("a-test", dev->name);
+
+	/* Test dev_count_phandle_with_args with cell name */
+	ret = dev_count_phandle_with_args(dev, "missing", cell, 0);
+	ut_asserteq(-ENOENT, ret);
+	ret = dev_count_phandle_with_args(dev, prop, "#invalid", 0);
+	ut_asserteq(-EINVAL, ret);
+	ut_asserteq(5, dev_count_phandle_with_args(dev, prop, cell, 0));
+
+	/* Test dev_read_phandle_with_args with cell name */
+	ret = dev_read_phandle_with_args(dev, "missing", cell, 0, 0, &args);
+	ut_asserteq(-ENOENT, ret);
+	ret = dev_read_phandle_with_args(dev, prop, "#invalid", 0, 0, &args);
+	ut_asserteq(-EINVAL, ret);
+	ut_assertok(dev_read_phandle_with_args(dev, prop, cell, 0, 0, &args));
+	ut_asserteq(1, args.args_count);
+	ut_asserteq(1, args.args[0]);
+	ut_assertok(dev_read_phandle_with_args(dev, prop, cell, 0, 1, &args));
+	ut_asserteq(1, args.args_count);
+	ut_asserteq(4, args.args[0]);
+	ut_assertok(dev_read_phandle_with_args(dev, prop, cell, 0, 2, &args));
+	ut_asserteq(5, args.args_count);
+	ut_asserteq(5, args.args[0]);
+	ut_asserteq(1, args.args[4]);
+	ret = dev_read_phandle_with_args(dev, prop, cell, 0, 3, &args);
+	ut_asserteq(-ENOENT, ret);
+	ut_assertok(dev_read_phandle_with_args(dev, prop, cell, 0, 4, &args));
+	ut_asserteq(1, args.args_count);
+	ut_asserteq(12, args.args[0]);
+	ret = dev_read_phandle_with_args(dev, prop, cell, 0, 5, &args);
+	ut_asserteq(-ENOENT, ret);
+
+	/* Test dev_count_phandle_with_args with cell count */
+	ret = dev_count_phandle_with_args(dev, "missing", NULL, 2);
+	ut_asserteq(-ENOENT, ret);
+	ut_asserteq(3, dev_count_phandle_with_args(dev, prop2, NULL, 1));
+
+	/* Test dev_read_phandle_with_args with cell count */
+	ut_assertok(dev_read_phandle_with_args(dev, prop2, NULL, 1, 0, &args));
+	ut_asserteq(1, ofnode_valid(args.node));
+	ut_asserteq(1, args.args_count);
+	ut_asserteq(10, args.args[0]);
+	ret = dev_read_phandle_with_args(dev, prop2, NULL, 1, 1, &args);
+	ut_asserteq(-EINVAL, ret);
+	ut_assertok(dev_read_phandle_with_args(dev, prop2, NULL, 1, 2, &args));
+	ut_asserteq(1, ofnode_valid(args.node));
+	ut_asserteq(1, args.args_count);
+	ut_asserteq(30, args.args[0]);
+	ret = dev_read_phandle_with_args(dev, prop2, NULL, 1, 3, &args);
+	ut_asserteq(-ENOENT, ret);
+
+	return 0;
+}
+DM_TEST(dm_test_read_phandle, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
+
 /* Test iteration through devices by drvdata */
 static int dm_test_uclass_drvdata(struct unit_test_state *uts)
 {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
