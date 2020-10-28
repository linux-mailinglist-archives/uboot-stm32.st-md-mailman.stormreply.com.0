Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E15A29CF66
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Oct 2020 11:06:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB7FEC3FAD5;
	Wed, 28 Oct 2020 10:06:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2DA2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 10:06:46 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SA2x3e003322; Wed, 28 Oct 2020 11:06:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SOt39+EUAG0WamP11PxomG5eQADb/IxLybvT/FVPVl0=;
 b=GQdIXCS0IgE+D9mXXWaRakeghTzbPfxAojgE0qs3MRTQJciBpO34hv/sT3rdc3RKlLxF
 283qW1AtkBy4VwiHLmo4Uxe+aHYq2J2VZP1f67oSZFK8y+3BZtb+vqtteJdGIX44UXsd
 Gy4egiPNvogsd5NHHhyecb6UUmseAlAkjAKJoKOErGBZDKbDUHOAmO4GFWw7CSguzxoo
 u+Nsgx2MWh/HAuMHxoRpCtpvOVxpUOzyDFaLYFGGE8tTg8FXWi7tpgf3T3LFVm2cAGW6
 cWloZ6HMyUNGf3dCFCX7x/QTa731RC/VgdGYZFookRh/RksQIRk8jO5Nk+Cvf6x1NMCI Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccj20dsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 11:06:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88FF7100038;
 Wed, 28 Oct 2020 11:06:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 755392A69C8;
 Wed, 28 Oct 2020 11:06:43 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct 2020 11:06:43
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 28 Oct 2020 11:06:40 +0100
Message-ID: <20201028100640.13876-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201028100640.13876-1-patrick.delaunay@st.com>
References: <20201028100640.13876-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_04:2020-10-26,
 2020-10-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Sean Anderson <seanga2@gmail.com>
Subject: [Uboot-stm32] [PATCH 2/2] cmd: pinmux: support pin name in status
	command
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 cmd/pinmux.c                 | 41 +++++++++++++++++++++++++-----------
 test/py/tests/test_pinmux.py | 29 +++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 12 deletions(-)

diff --git a/cmd/pinmux.c b/cmd/pinmux.c
index af04c95a46..e096f16982 100644
--- a/cmd/pinmux.c
+++ b/cmd/pinmux.c
@@ -41,19 +41,20 @@ static int do_dev(struct cmd_tbl *cmdtp, int flag, int argc,
 	return CMD_RET_SUCCESS;
 }
 
-static void show_pinmux(struct udevice *dev)
+static bool show_pinmux(struct udevice *dev, char *name)
 {
 	char pin_name[PINNAME_SIZE];
 	char pin_mux[PINMUX_SIZE];
 	int pins_count;
 	int i;
 	int ret;
+	bool found = false;
 
 	pins_count = pinctrl_get_pins_count(dev);
 
 	if (pins_count < 0) {
 		printf("Ops get_pins_count not supported by %s\n", dev->name);
-		return;
+		return found;
 	}
 
 	for (i = 0; i < pins_count; i++) {
@@ -61,43 +62,59 @@ static void show_pinmux(struct udevice *dev)
 		if (ret) {
 			printf("Ops get_pin_name error (%d) by %s\n",
 			       ret, dev->name);
-			return;
+			return found;
 		}
-
+		if (name && strcmp(name, pin_name))
+			continue;
+		found = true;
 		ret = pinctrl_get_pin_muxing(dev, i, pin_mux, PINMUX_SIZE);
 		if (ret) {
 			printf("Ops get_pin_muxing error (%d) by %s in %s\n",
 			       ret, pin_name, dev->name);
-			return;
+			return found;
 		}
 
 		printf("%-*s: %-*s\n", PINNAME_SIZE, pin_name,
 		       PINMUX_SIZE, pin_mux);
 	}
+
+	return found;
 }
 
 static int do_status(struct cmd_tbl *cmdtp, int flag, int argc,
 		     char *const argv[])
 {
 	struct udevice *dev;
+	char *name;
+	bool found = false;
 
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
+		if (show_pinmux(dev, name))
+			found = true;
+	}
+
+	if (name && !found) {
+		printf("%s not found\n", name);
+		return CMD_RET_FAILURE;
 	}
 
 	return CMD_RET_SUCCESS;
@@ -148,5 +165,5 @@ U_BOOT_CMD(pinmux, CONFIG_SYS_MAXARGS, 1, do_pinmux,
 	   "show pin-controller muxing",
 	   "list                     - list UCLASS_PINCTRL devices\n"
 	   "pinmux dev [pincontroller-name] - select pin-controller device\n"
-	   "pinmux status [-a]              - print pin-controller muxing [for all]\n"
+	   "pinmux status [-a | pin-name]   - print pin-controller muxing [for all | for pin-name]\n"
 )
diff --git a/test/py/tests/test_pinmux.py b/test/py/tests/test_pinmux.py
index b3ae2ab024..fbde1d99b1 100644
--- a/test/py/tests/test_pinmux.py
+++ b/test/py/tests/test_pinmux.py
@@ -82,3 +82,32 @@ def test_pinmux_status(u_boot_console):
     assert ('P6        : GPIO1 drive-open-drain.' in output)
     assert ('P7        : GPIO2 bias-pull-down input-enable.' in output)
     assert ('P8        : GPIO3 bias-disable.' in output)
+
+@pytest.mark.buildconfigspec('cmd_pinmux')
+@pytest.mark.boardspec('sandbox')
+def test_pinmux_status_pinname(u_boot_console):
+    """Test that 'pinmux status <pinname>' displays selected pin."""
+
+    output = u_boot_console.run_command('pinmux status a5')
+    assert ('a5        : gpio output .' in output)
+    assert (not 'pinctrl-gpio:' in output)
+    assert (not 'pinctrl:' in output)
+    assert (not 'a6' in output)
+    assert (not 'P0' in output)
+    assert (not 'P8' in output)
+
+    output = u_boot_console.run_command('pinmux status P7')
+    assert (not 'pinctrl-gpio:' in output)
+    assert (not 'pinctrl:' in output)
+    assert (not 'a5' in output)
+    assert (not 'P0' in output)
+    assert (not 'P6' in output)
+    assert ('P7        : GPIO2 bias-pull-down input-enable.' in output)
+    assert (not 'P8' in output)
+
+    output = u_boot_console.run_command('pinmux status P9')
+    assert (not 'pinctrl-gpio:' in output)
+    assert (not 'pinctrl:' in output)
+    assert (not 'a5' in output)
+    assert (not 'P8' in output)
+    assert ('P9 not found' in output)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
