Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C415A62E5
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Aug 2022 14:09:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3231AC57B6C;
	Tue, 30 Aug 2022 12:09:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92530C57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 12:09:30 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U9Uq5i029924;
 Tue, 30 Aug 2022 14:09:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=JHwz52Y0Y84oXd93ryeQ1bx1Ej5utbJHedT8gy1IvIk=;
 b=QX66Yi5B7y6kgKb2dgdhF6Jf54Rdxn1ymsENA48fhxopr632k57Iq4lkF1xdlkrOoc1V
 Ale+mYKqi19nGxmB9x3qdFaj1/0BaDX3qYlXNWcYCSZa9gu5PyYwcZI8Tgx0y9/CeMAr
 bXgjW8kTD1dMeFKNBMqXqPS/a51AvN2je+DzAGcfUgb8gL0kGGaDDoPq/xm+YNY56e/U
 H8iLxgRLun4ecX/7111jqothzino6Oo20vnlVtdUh/7NyZVzTfbfoAtHax5L0HKrkgdC
 u27RBsPZ6R8cX6ip+SJq9878QvY12DWThyLEnL5aIxZvApqFVq0/lwUt4/+33lqAWhOJ QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j7am0yjsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 14:09:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7D3310003A;
 Tue, 30 Aug 2022 14:09:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF3E5226FCA;
 Tue, 30 Aug 2022 14:09:22 +0200 (CEST)
Received: from localhost (10.75.127.116) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 30 Aug
 2022 14:09:22 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Aug 2022 14:09:14 +0200
Message-ID: <20220830120914.2329522-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830120914.2329522-1-patrice.chotard@foss.st.com>
References: <20220830120914.2329522-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_06,2022-08-30_01,2022-06-22_01
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 4/4] gpio: sandbox: Add GPIOD_IS_AF for
	gpio configured in alternate function
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

This allows to test if a pin's label if displayed using gpio_get_status()
when this pin is configured in alternate function.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>

---

(no changes since v1)

 drivers/gpio/sandbox.c                  |  5 +++++
 include/asm-generic/gpio.h              |  1 +
 include/dt-bindings/gpio/sandbox-gpio.h |  3 +++
 test/dm/gpio.c                          | 30 +++++++++++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpio/sandbox.c b/drivers/gpio/sandbox.c
index 106b2a7b27..305f9a6ff6 100644
--- a/drivers/gpio/sandbox.c
+++ b/drivers/gpio/sandbox.c
@@ -196,6 +196,8 @@ static int sb_gpio_get_function(struct udevice *dev, unsigned offset)
 		return GPIOF_OUTPUT;
 	if (get_gpio_flag(dev, offset, GPIOD_IS_IN))
 		return GPIOF_INPUT;
+	if (get_gpio_flag(dev, offset, GPIOD_IS_AF))
+		return GPIOF_FUNC;
 
 	return GPIOF_INPUT; /*GPIO is not configurated */
 }
@@ -219,6 +221,9 @@ static int sb_gpio_xlate(struct udevice *dev, struct gpio_desc *desc,
 	if (args->args[1] & GPIO_OUT_ACTIVE)
 		desc->flags |= GPIOD_IS_OUT_ACTIVE;
 
+	if (args->args[1] & GPIO_AF)
+		desc->flags |= GPIOD_IS_AF;
+
 	return 0;
 }
 
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index 81f63f06f1..0fcf70983f 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -127,6 +127,7 @@ struct gpio_desc {
 #define GPIOD_OPEN_SOURCE	BIT(6)	/* GPIO is open source type */
 #define GPIOD_PULL_UP		BIT(7)	/* GPIO has pull-up enabled */
 #define GPIOD_PULL_DOWN		BIT(8)	/* GPIO has pull-down enabled */
+#define GPIOD_IS_AF		BIT(9)	/* GPIO is an alternate function */
 
 /* Flags for updating the above */
 #define GPIOD_MASK_DIR		(GPIOD_IS_OUT | GPIOD_IS_IN | \
diff --git a/include/dt-bindings/gpio/sandbox-gpio.h b/include/dt-bindings/gpio/sandbox-gpio.h
index e4bfdb3ce1..05f9836583 100644
--- a/include/dt-bindings/gpio/sandbox-gpio.h
+++ b/include/dt-bindings/gpio/sandbox-gpio.h
@@ -21,4 +21,7 @@
 /* Bit 18 express GPIO output is active */
 #define GPIO_OUT_ACTIVE		0x40000
 
+/* Bit 19 express GPIO set as alternate function */
+#define GPIO_AF			0x80000
+
 #endif
diff --git a/test/dm/gpio.c b/test/dm/gpio.c
index 33ae98701f..a8c35d4370 100644
--- a/test/dm/gpio.c
+++ b/test/dm/gpio.c
@@ -778,3 +778,33 @@ static int dm_test_gpio_get_values_as_int_base3(struct unit_test_state *uts)
 }
 DM_TEST(dm_test_gpio_get_values_as_int_base3,
 	UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
+
+/* Check that gpio_get_status return the label of a GPIO configured as GPIOD_AF */
+static int dm_test_gpio_function(struct unit_test_state *uts)
+{
+	struct gpio_desc desc;
+	struct udevice *dev;
+	ulong flags;
+	unsigned int offset, gpio;
+	char buf[80];
+
+	ut_assertok(uclass_get_device(UCLASS_TEST_FDT, 0, &dev));
+	ut_asserteq_str("a-test", dev->name);
+
+	/* request gpio_b 5 */
+	ut_assertok(gpio_request_by_name(dev, "test-gpios", 2, &desc, 0));
+	/* update gpio_b 5 function to GPIO_AF */
+	ut_assertok(dm_gpio_clrset_flags(&desc, GPIOD_IS_AF, GPIOD_IS_AF));
+	ut_assertok(dm_gpio_get_flags(&desc, &flags));
+	ut_asserteq(GPIOD_IS_AF, flags);
+	/* check using gpio_get_status that label is displayed for a pin with GPIO_AF function */
+	ut_assertok(gpio_lookup_name("b5", &dev, &offset, &gpio));
+	ut_assertok(gpio_get_status(dev, offset, buf, sizeof(buf)));
+	ut_asserteq_str("b5: func a-test.test-gpios2", buf);
+
+	ut_assertok(dm_gpio_free(dev, &desc));
+
+	return 0;
+}
+DM_TEST(dm_test_gpio_function,
+	UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
