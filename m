Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD3E388E16
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 May 2021 14:31:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 291C6C57B5F;
	Wed, 19 May 2021 12:31:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21B9DC424BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 May 2021 12:31:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14JCQu0x002835; Wed, 19 May 2021 14:30:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=4j5tfmdYiBHgVWI7xynIIs3KOiiO/Ip87gNEbMoEDMA=;
 b=X/9AHzBQJS3fsJ/3WiMsWkARLu98A0oVA7tB9a4rjBbf65z53rdAlruR7nxKrzCEFJ+2
 /3YQZpSq4wu2C1S6DUYcbUpA9tVQaDWPPfYfLPhnbzqOpEGCR7IzAh7nQn9PgU1djWf/
 tuk1it917LmnJkEjU01xuqFYj0jktfUMLHVKH8HUwjut3xrKgyu6AEP9YPjOC0EhYPPg
 LCWeMcrwhMquwFXNdK0YxazMzFMNTBBLXR61OP7qlCOniGfIB9xdeAoQ2qfVt20zjOtD
 eR7GQ4BYiMUr/tBeWwMFLrBdJWfHO5tY0BZUPthvdlq5ClIjPRIMVcv6XvOTyuLTiMYz 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38mda9qncv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 14:30:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3179810002A;
 Wed, 19 May 2021 14:30:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F554216C2B;
 Wed, 19 May 2021 14:30:48 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May 2021 14:30:47
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 19 May 2021 14:30:43 +0200
Message-ID: <20210519142916.v2.2.I5b7085079ee5504cad399697bf6afef6710fa02a@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210519142916.v2.1.I6851dcbaea90c8b6ddcca5310e3c4ee58c824706@changeid>
References: <20210519142916.v2.1.I6851dcbaea90c8b6ddcca5310e3c4ee58c824706@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_05:2021-05-19,
 2021-05-19 signatures=0
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: [Uboot-stm32] [PATCH v2 2/2] cmd: pinmux: support pin name in
	status command
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

Allow pin name parameter for pimux staus command,
as gpio command to get status of one pin.

The possible usage of the command is:

> pinmux dev pinctrl
> pinmux status

> pinmux status -a

> pinmux status <pin-name>

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- use -ENOENT when the pin name is not found
- move the added pytests in a C file cmd/pinmux.c

 cmd/pinmux.c      | 38 +++++++++++++++++++++++++++++---------
 test/cmd/Makefile |  1 +
 test/cmd/pinmux.c | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+), 9 deletions(-)
 create mode 100644 test/cmd/pinmux.c

diff --git a/cmd/pinmux.c b/cmd/pinmux.c
index 0df78c71da..527d33d562 100644
--- a/cmd/pinmux.c
+++ b/cmd/pinmux.c
@@ -41,13 +41,14 @@ static int do_dev(struct cmd_tbl *cmdtp, int flag, int argc,
 	return CMD_RET_SUCCESS;
 }
 
-static int show_pinmux(struct udevice *dev)
+static int show_pinmux(struct udevice *dev, char *name)
 {
 	char pin_name[PINNAME_SIZE];
 	char pin_mux[PINMUX_SIZE];
 	int pins_count;
 	int i;
 	int ret;
+	bool found = false;
 
 	pins_count = pinctrl_get_pins_count(dev);
 
@@ -62,7 +63,9 @@ static int show_pinmux(struct udevice *dev)
 			printf("Ops get_pin_name error (%d) by %s\n", ret, dev->name);
 			return ret;
 		}
-
+		if (name && strcmp(name, pin_name))
+			continue;
+		found = true;
 		ret = pinctrl_get_pin_muxing(dev, i, pin_mux, PINMUX_SIZE);
 		if (ret) {
 			printf("Ops get_pin_muxing error (%d) by %s in %s\n",
@@ -74,6 +77,9 @@ static int show_pinmux(struct udevice *dev)
 		       PINMUX_SIZE, pin_mux);
 	}
 
+	if (!found)
+		return -ENOENT;
+
 	return 0;
 }
 
@@ -81,24 +87,38 @@ static int do_status(struct cmd_tbl *cmdtp, int flag, int argc,
 		     char *const argv[])
 {
 	struct udevice *dev;
+	char *name;
+	int ret;
 
 	if (argc < 2) {
 		if (!currdev) {
 			printf("pin-controller device not selected\n");
 			return CMD_RET_FAILURE;
 		}
-		show_pinmux(currdev);
+		show_pinmux(currdev, NULL);
 		return CMD_RET_SUCCESS;
 	}
 
 	if (strcmp(argv[1], "-a"))
-		return CMD_RET_USAGE;
+		name = argv[1];
+	else
+		name = NULL;
 
 	uclass_foreach_dev_probe(UCLASS_PINCTRL, dev) {
-		/* insert a separator between each pin-controller display */
-		printf("--------------------------\n");
-		printf("%s:\n", dev->name);
-		show_pinmux(dev);
+		if (!name) {
+			/* insert a separator between each pin-controller display */
+			printf("--------------------------\n");
+			printf("%s:\n", dev->name);
+		}
+		ret = show_pinmux(dev, name);
+		/* stop when the status of requested pin is displayed */
+		if (name && !ret)
+			return CMD_RET_SUCCESS;
+	}
+
+	if (name) {
+		printf("%s not found\n", name);
+		return CMD_RET_FAILURE;
 	}
 
 	return CMD_RET_SUCCESS;
@@ -149,5 +169,5 @@ U_BOOT_CMD(pinmux, CONFIG_SYS_MAXARGS, 1, do_pinmux,
 	   "show pin-controller muxing",
 	   "list                     - list UCLASS_PINCTRL devices\n"
 	   "pinmux dev [pincontroller-name] - select pin-controller device\n"
-	   "pinmux status [-a]              - print pin-controller muxing [for all]\n"
+	   "pinmux status [-a | pin-name]   - print pin-controller muxing [for all | for pin-name]\n"
 )
diff --git a/test/cmd/Makefile b/test/cmd/Makefile
index 2cfe43a6bd..a59adb1e6d 100644
--- a/test/cmd/Makefile
+++ b/test/cmd/Makefile
@@ -8,5 +8,6 @@ endif
 obj-y += mem.o
 obj-$(CONFIG_CMD_ADDRMAP) += addrmap.o
 obj-$(CONFIG_CMD_MEM_SEARCH) += mem_search.o
+obj-$(CONFIG_CMD_PINMUX) += pinmux.o
 obj-$(CONFIG_CMD_PWM) += pwm.o
 obj-$(CONFIG_CMD_SETEXPR) += setexpr.o
diff --git a/test/cmd/pinmux.c b/test/cmd/pinmux.c
new file mode 100644
index 0000000000..8ae807b537
--- /dev/null
+++ b/test/cmd/pinmux.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Executes tests for pinmux command
+ *
+ * Copyright (C) 2021, STMicroelectronics - All Rights Reserved
+ */
+
+#include <common.h>
+#include <command.h>
+#include <dm/test.h>
+#include <test/test.h>
+#include <test/ut.h>
+
+static int dm_test_cmd_pinmux_status_pinname(struct unit_test_state *uts)
+{
+	/* Test that 'pinmux status <pinname>' displays the selected pin. */
+	console_record_reset();
+	run_command("pinmux status a5", 0);
+	ut_assert_nextline("a5        : gpio input .                            ");
+	ut_assert_console_end();
+
+	console_record_reset();
+	run_command("pinmux status P7", 0);
+	ut_assert_nextline("P7        : GPIO2 bias-pull-down input-enable.      ");
+	ut_assert_console_end();
+
+	console_record_reset();
+	run_command("pinmux status P9", 0);
+	ut_assert_nextline("single-pinctrl pinctrl-single-no-width: missing register width");
+	ut_assert_nextline("P9 not found");
+	ut_assert_console_end();
+
+	return 0;
+}
+
+DM_TEST(dm_test_cmd_pinmux_status_pinname, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
