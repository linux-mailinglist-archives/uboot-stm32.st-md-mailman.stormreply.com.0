Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E177338C0F8
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 May 2021 09:47:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CCEEC57B60;
	Fri, 21 May 2021 07:47:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86F91C57B5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 May 2021 07:47:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L7kDqF007023; Fri, 21 May 2021 09:47:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=gK38DkUwd71YPXZGpK0hrfTXi6CjTkE7m0Aj3wu30LQ=;
 b=lP1ypsDf1c/b6gqzHJVtIEGcFjtr3D+tJE2hxgVzjJlKGcjdK7Y4A8h0GGgbGgViUA2D
 vp8H0JpwyAufYGZws4i951UgqOf6fkhvtDlf2mf3U9JPTl9r06fuXd8X9Sq07cs3dJbp
 T90KduYLE9I2za/S0t6+5am6NlxJfIdkcdRkGydQ4M7xQagOD0gk36qVqslFarolPT2Y
 9pWaxpeqJFFTnO2O/eEmUXv0Wd5rfMswz8eHTqPThHDPn3JZnEG2+PVntjFIZj1e375f
 Z9T+LSiVE3Zah7i4txaxHa+ltDO73pWEKFh1v019qkDZDqGrnVue7YgnTobCEpwmJPy+ 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38p3c51fef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 09:47:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C2EA10002A;
 Fri, 21 May 2021 09:47:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F118215C9B;
 Fri, 21 May 2021 09:47:39 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 21 May 2021 09:47:39
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 May 2021 09:47:31 +0200
Message-ID: <20210521094728.v3.1.I6851dcbaea90c8b6ddcca5310e3c4ee58c824706@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 1/2] cmd: pinmux: update result of do_status
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

Update the result of do_status and always returns a CMD_RET_ value
(-ENOSYS was a possible result of show_pinmux).

This patch also adds pincontrol name in error messages (dev->name)
and treats correctly the status sub command when pin-controller device is
not selected.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

(no changes since v2)

Changes in v2:
- keep result in show_pinmux
- add comment in API pinctrl_get_pins_count() for -ENOSYS result

 cmd/pinmux.c                 | 31 +++++++++++++++++--------------
 include/dm/pinctrl.h         |  2 +-
 test/py/tests/test_pinmux.py |  4 ++--
 3 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/cmd/pinmux.c b/cmd/pinmux.c
index 9942b15419..0df78c71da 100644
--- a/cmd/pinmux.c
+++ b/cmd/pinmux.c
@@ -52,20 +52,21 @@ static int show_pinmux(struct udevice *dev)
 	pins_count = pinctrl_get_pins_count(dev);
 
 	if (pins_count == -ENOSYS) {
-		printf("Ops get_pins_count not supported\n");
+		printf("Ops get_pins_count not supported by %s\n", dev->name);
 		return pins_count;
 	}
 
 	for (i = 0; i < pins_count; i++) {
 		ret = pinctrl_get_pin_name(dev, i, pin_name, PINNAME_SIZE);
-		if (ret == -ENOSYS) {
-			printf("Ops get_pin_name not supported\n");
+		if (ret) {
+			printf("Ops get_pin_name error (%d) by %s\n", ret, dev->name);
 			return ret;
 		}
 
 		ret = pinctrl_get_pin_muxing(dev, i, pin_mux, PINMUX_SIZE);
 		if (ret) {
-			printf("Ops get_pin_muxing error (%d)\n", ret);
+			printf("Ops get_pin_muxing error (%d) by %s in %s\n",
+			       ret, pin_name, dev->name);
 			return ret;
 		}
 
@@ -80,25 +81,27 @@ static int do_status(struct cmd_tbl *cmdtp, int flag, int argc,
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
diff --git a/include/dm/pinctrl.h b/include/dm/pinctrl.h
index 1bdc8d3cbd..695e78ad0d 100644
--- a/include/dm/pinctrl.h
+++ b/include/dm/pinctrl.h
@@ -587,7 +587,7 @@ int pinctrl_get_pin_muxing(struct udevice *dev, int selector, char *buf,
  *
  * This allows to know the number of pins owned by a given pin-controller
  *
- * Return: Number of pins if OK, or negative error code on failure
+ * Return: Number of pins if OK, or -ENOSYS when not supported
  */
 int pinctrl_get_pins_count(struct udevice *dev);
 
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
