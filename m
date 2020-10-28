Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0CA29CF65
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Oct 2020 11:06:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1665C36B0B;
	Wed, 28 Oct 2020 10:06:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D444EC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 10:06:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SA2wOE011277; Wed, 28 Oct 2020 11:06:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=qHyNyTmdfmzMzPseac1jxTVeZEXhfbkiAk8XFbCF1fI=;
 b=dmoeerXUG3qUWsGNUH8dR4fk8PCfRXxffWGayFAEOWDZNjlU670B6DwVTBvSDXqL2NOW
 nm0C1Hdt0MuWNZxjM0L/RaqoODxUVAH6RXLahQS+A7sqtoEtpcXOfbL3faNymZB4K8yT
 k2R+RW3/peUG+ie8tq1getw6Ellut1FTT0/I+9yL6mnAx5FTqEOB0+oF77H1/2dm7bl7
 5TWk3TJVY0XJVZgk0+I109xyoXomwbKQvWsOcSIO+nqi6oqF24QOL2kDVBT4WH0Qd1+Y
 ZoBuMgY5Vm4HTxnjpC6U7qRVlCErxk6/We58dnx4ED6ipl1CwMeIi7cUrmuSolpALteN JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccffh2th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 11:06:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F1EE10002A;
 Wed, 28 Oct 2020 11:06:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 801D12A69C7;
 Wed, 28 Oct 2020 11:06:42 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct 2020 11:06:42
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 28 Oct 2020 11:06:39 +0100
Message-ID: <20201028100640.13876-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_04:2020-10-26,
 2020-10-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Sean Anderson <seanga2@gmail.com>
Subject: [Uboot-stm32] [PATCH 1/2] cmd: pinmux: update result of do_status
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

Update the result of do_status and alway returns a CMD_RET_ value
(-ENOSYS was a possible result of show_pinmux).

This patch also adds pincontrol name in error messages (dev->name)
and treats correctly the status sub command when pin-controller device is
not selected.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 cmd/pinmux.c                 | 44 +++++++++++++++++++-----------------
 test/py/tests/test_pinmux.py |  4 ++--
 2 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/cmd/pinmux.c b/cmd/pinmux.c
index 9942b15419..af04c95a46 100644
--- a/cmd/pinmux.c
+++ b/cmd/pinmux.c
@@ -41,7 +41,7 @@ static int do_dev(struct cmd_tbl *cmdtp, int flag, int argc,
 	return CMD_RET_SUCCESS;
 }
 
-static int show_pinmux(struct udevice *dev)
+static void show_pinmux(struct udevice *dev)
 {
 	char pin_name[PINNAME_SIZE];
 	char pin_mux[PINMUX_SIZE];
@@ -51,54 +51,56 @@ static int show_pinmux(struct udevice *dev)
 
 	pins_count = pinctrl_get_pins_count(dev);
 
-	if (pins_count == -ENOSYS) {
-		printf("Ops get_pins_count not supported\n");
-		return pins_count;
+	if (pins_count < 0) {
+		printf("Ops get_pins_count not supported by %s\n", dev->name);
+		return;
 	}
 
 	for (i = 0; i < pins_count; i++) {
 		ret = pinctrl_get_pin_name(dev, i, pin_name, PINNAME_SIZE);
-		if (ret == -ENOSYS) {
-			printf("Ops get_pin_name not supported\n");
-			return ret;
+		if (ret) {
+			printf("Ops get_pin_name error (%d) by %s\n",
+			       ret, dev->name);
+			return;
 		}
 
 		ret = pinctrl_get_pin_muxing(dev, i, pin_mux, PINMUX_SIZE);
 		if (ret) {
-			printf("Ops get_pin_muxing error (%d)\n", ret);
-			return ret;
+			printf("Ops get_pin_muxing error (%d) by %s in %s\n",
+			       ret, pin_name, dev->name);
+			return;
 		}
 
 		printf("%-*s: %-*s\n", PINNAME_SIZE, pin_name,
 		       PINMUX_SIZE, pin_mux);
 	}
-
-	return 0;
 }
 
 static int do_status(struct cmd_tbl *cmdtp, int flag, int argc,
 		     char *const argv[])
 {
 	struct udevice *dev;
-	int ret = CMD_RET_USAGE;
 
-	if (currdev && (argc < 2 || strcmp(argv[1], "-a")))
-		return show_pinmux(currdev);
+	if (argc < 2) {
+		if (!currdev) {
+			printf("pin-controller device not selected\n");
+			return CMD_RET_FAILURE;
+		}
+		show_pinmux(currdev);
+		return CMD_RET_SUCCESS;
+	}
 
-	if (argc < 2 || strcmp(argv[1], "-a"))
-		return ret;
+	if (strcmp(argv[1], "-a"))
+		return CMD_RET_USAGE;
 
 	uclass_foreach_dev_probe(UCLASS_PINCTRL, dev) {
 		/* insert a separator between each pin-controller display */
 		printf("--------------------------\n");
 		printf("%s:\n", dev->name);
-		ret = show_pinmux(dev);
-		if (ret < 0)
-			printf("Can't display pin muxing for %s\n",
-			       dev->name);
+		show_pinmux(dev);
 	}
 
-	return ret;
+	return CMD_RET_SUCCESS;
 }
 
 static int do_list(struct cmd_tbl *cmdtp, int flag, int argc,
diff --git a/test/py/tests/test_pinmux.py b/test/py/tests/test_pinmux.py
index 0cbbae000c..b3ae2ab024 100644
--- a/test/py/tests/test_pinmux.py
+++ b/test/py/tests/test_pinmux.py
@@ -13,9 +13,9 @@ def test_pinmux_usage_1(u_boot_console):
 @pytest.mark.buildconfigspec('cmd_pinmux')
 def test_pinmux_usage_2(u_boot_console):
     """Test that 'pinmux status' executed without previous "pinmux dev"
-    command displays pinmux usage."""
+    command displays error message."""
     output = u_boot_console.run_command('pinmux status')
-    assert 'Usage:' in output
+    assert 'pin-controller device not selected' in output
 
 @pytest.mark.buildconfigspec('cmd_pinmux')
 @pytest.mark.boardspec('sandbox')
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
