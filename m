Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5F8D5C6B
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 09:28:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 673AAC36B0C
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 07:28:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5AD8C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 07:28:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7Rpgs007209; Mon, 14 Oct 2019 09:28:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SoVd7aRKYevSsBSjTX0GrbJwO6PKO/WnTzZsKVM6D5E=;
 b=qHj2+YC869p5LzmlXi46rkJM08tsxbX/U+BKLQ6YdTCvJMrK0pZGoxjEJ4HLEKAYNFSe
 KwdbMwXZOQrPPFCoZ+R5N7BLPW4G2O80eQUwQMVdVVNPDUnnfRqjhTT6u+cdzjPXJIoe
 BTYl0AK0/+ZdE3v23Ub9ZSb/CkR/D2w5p+jVCLAFCHisi8qsTbBTnb20xyg59jLXNRSu
 dq7x4yuVm3h0r+c23hNS8ipNkJG6Yid1BNOaWXpTe9Mixv8Fnv3CbJWgr9oCb3rWoP9a
 GHvfSXUPSBRtXrxV4YNb6RRGWouLU/TxjbVFy6NDjTGRP4k+0BHdRjQfitnIZpjEmCNN WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk3y9h5wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 09:28:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2A732100039;
 Mon, 14 Oct 2019 09:28:26 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 20EF72ADFFB;
 Mon, 14 Oct 2019 09:28:26 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 09:28:25 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 09:28:25
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 09:28:02 +0200
Message-ID: <20191014072812.21843-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014072812.21843-1-patrick.delaunay@st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 05/15] dfu: allow to manage DFU on several
	devices
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

Add support of DFU for several interface/device
with one command.

The format for "dfu_alt_info" in this case is :
- <interface> <dev>'='alternate list (';' separated)
- each interface is separated by '&'

The previous behavior is always supported.

One example for NOR (bootloaders) + NAND (rootfs in UBI):

U-Boot> env set dfu_alt_info \
"sf 0:0:10000000:0=spl part 0 1;u-boot part 0 2; \
u-boot-env part 0 3&nand 0=UBI partubi 0,3"

U-Boot> dfu 0 list

DFU alt settings list:
dev: SF alt: 0 name: spl layout: RAW_ADDR
dev: SF alt: 1 name: ssbl layout: RAW_ADDR
dev: SF alt: 2 name: u-boot-env layout: RAW_ADDR
dev: NAND alt: 3 name: UBI layout: RAW_ADDR

U-Boot> dfu 0

$> dfu-util -l

Found DFU: [0483:5720] ver=9999, devnum=96, cfg=1,\
 intf=0, alt=3, name="UBI", serial="002700333338511934383330"
Found DFU: [0483:5720] ver=9999, devnum=96, cfg=1,\
 intf=0, alt=2, name="u-boot-env", serial="002700333338511934383330"
Found DFU: [0483:5720] ver=9999, devnum=96, cfg=1,\
 intf=0, alt=1, name="u-boot", serial="002700333338511934383330"
Found DFU: [0483:5720] ver=9999, devnum=96, cfg=1,\
 intf=0, alt=0, name="spl", serial="002700333338511934383330"

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3: None
Changes in v2:
- Add dfu documentation for several device

 cmd/dfu.c         | 21 ++++++++++-------
 doc/README.dfu    | 58 ++++++++++++++++++++++++++++++++++++++++++---
 drivers/dfu/dfu.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 127 insertions(+), 12 deletions(-)

diff --git a/cmd/dfu.c b/cmd/dfu.c
index 91a750a4fc..33491d0bc9 100644
--- a/cmd/dfu.c
+++ b/cmd/dfu.c
@@ -21,23 +21,28 @@
 static int do_dfu(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 {
 
-	if (argc < 4)
+	if (argc < 2)
 		return CMD_RET_USAGE;
 
 #ifdef CONFIG_DFU_OVER_USB
 	char *usb_controller = argv[1];
 #endif
 #if defined(CONFIG_DFU_OVER_USB) || defined(CONFIG_DFU_OVER_TFTP)
-	char *interface = argv[2];
-	char *devstring = argv[3];
+	char *interface = NULL;
+	char *devstring = NULL;
+
+	if (argc >= 4) {
+		interface = argv[2];
+		devstring = argv[3];
+	}
 #endif
 
 	int ret = 0;
 #ifdef CONFIG_DFU_OVER_TFTP
 	unsigned long addr = 0;
 	if (!strcmp(argv[1], "tftp")) {
-		if (argc == 5)
-			addr = simple_strtoul(argv[4], NULL, 0);
+		if (argc == 5 || argc == 3)
+			addr = simple_strtoul(argv[argc - 1], NULL, 0);
 
 		return update_tftp(addr, interface, devstring);
 	}
@@ -48,7 +53,7 @@ static int do_dfu(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 		goto done;
 
 	ret = CMD_RET_SUCCESS;
-	if (argc > 4 && strcmp(argv[4], "list") == 0) {
+	if (strcmp(argv[argc - 1], "list") == 0) {
 		dfu_show_entities();
 		goto done;
 	}
@@ -67,7 +72,7 @@ U_BOOT_CMD(dfu, CONFIG_SYS_MAXARGS, 1, do_dfu,
 	"Device Firmware Upgrade",
 	""
 #ifdef CONFIG_DFU_OVER_USB
-	"<USB_controller> <interface> <dev> [list]\n"
+	"<USB_controller> [<interface> <dev>] [list]\n"
 	"  - device firmware upgrade via <USB_controller>\n"
 	"    on device <dev>, attached to interface\n"
 	"    <interface>\n"
@@ -77,7 +82,7 @@ U_BOOT_CMD(dfu, CONFIG_SYS_MAXARGS, 1, do_dfu,
 #ifdef CONFIG_DFU_OVER_USB
 	"dfu "
 #endif
-	"tftp <interface> <dev> [<addr>]\n"
+	"tftp [<interface> <dev>] [<addr>]\n"
 	"  - device firmware upgrade via TFTP\n"
 	"    on device <dev>, attached to interface\n"
 	"    <interface>\n"
diff --git a/doc/README.dfu b/doc/README.dfu
index 7a2b5f1d4b..d1ef7e4064 100644
--- a/doc/README.dfu
+++ b/doc/README.dfu
@@ -42,16 +42,25 @@ Environment variables:
                    separated string of information on each alternate:
                    dfu_alt_info="<alt1>;<alt2>;....;<altN>"
 
+                   when only several device are used, the format is:
+                   - <interface> <dev>'='alternate list (';' separated)
+                   - each interface is separated by '&'
+                dfu_alt_info=\
+                   "<interface1> <dev1>=<alt1>;....;<altN>&"\
+                   "<interface2> <dev2>=<altN+1>;....;<altM>&"\
+                   ...\
+                   "<interfaceI> <devI>=<altY+1>;....;<altZ>&"
+
   "dfu_bufsiz" : size of the DFU buffer, when absent, use
                  CONFIG_SYS_DFU_DATA_BUF_SIZE (8MiB by default)
 
   "dfu_hash_algo" : name of the hash algorithm to use
 
 Commands:
-  dfu <USB_controller> <interface> <dev> list
+  dfu <USB_controller> [<interface> <dev>] list
     list the alternate device defined in "dfu_alt_info"
 
-  dfu <USB_controller> <interface> <dev>
+  dfu <USB_controller> [<interface> <dev>]
     start the dfu stack on the USB instance with the selected medium
     backend and use the "dfu_alt_info" variable to configure the
     alternate setting and link each one with the medium
@@ -95,6 +104,18 @@ Commands:
 
       with <partid> is the MTD partition index
 
+  <interface> and <dev> are absent:
+    the dfu command to use multiple devices
+    cmd: dfu 0 list
+    cmd: dfu 0
+   "dfu_alt_info" variable provides the list of <interface> <dev> with
+   alternate list separated by '&' with the same format for each <alt>
+       mmc <dev>=<alt1>;....;<altN>
+       nand <dev>=<alt1>;....;<altN>
+       ram <dev>=<alt1>;....;<altN>
+       sf <dev>=<alt1>;....;<altN>
+
+
 Host tools:
   When U-Boot runs the dfu stack, the DFU host tools can be used
   to send/receive firmwares on each configurated alternate.
@@ -103,7 +124,7 @@ Host tools:
   specifications(http://dfu-util.sourceforge.net/) which works with U-Boot.
 
 Usage:
-  Example for firmware located in eMMC or SD card, with:
+  Example 1: firmware located in eMMC or SD card, with:
   - alternate 1 (alt=1) for SPL partition (GPT partition 1)
   - alternate 2 (alt=2) for U-Boot partition (GPT partition 2)
 
@@ -147,3 +168,34 @@ Usage:
 
   To request a DFU detach and reset the USB connection:
   $> dfu-util -a 0 -e  -R
+
+
+  Example 2: firmware located in NOR (sf) and NAND, with:
+  - alternate 1 (alt=1) for SPL partition (NOR GPT partition 1)
+  - alternate 2 (alt=2) for U-Boot partition (NOR GPT partition 2)
+  - alternate 3 (alt=3) for U-Boot-env partition (NOR GPT partition 3)
+  - alternate 4 (alt=4) for UBI partition (NAND GPT partition 1)
+
+  U-Boot> env set dfu_alt_info \
+  "sf 0:0:10000000:0=spl part 0 1;u-boot part 0 2; \
+  u-boot-env part 0 3&nand 0=UBI partubi 0,1"
+
+  U-Boot> dfu 0 list
+
+  DFU alt settings list:
+  dev: SF alt: 0 name: spl layout: RAW_ADDR
+  dev: SF alt: 1 name: ssbl layout: RAW_ADDR
+  dev: SF alt: 2 name: u-boot-env layout: RAW_ADDR
+  dev: NAND alt: 3 name: UBI layout: RAW_ADDR
+
+  U-Boot> dfu 0
+
+  $> dfu-util -l
+  Found DFU: [0483:5720] ver=9999, devnum=96, cfg=1,\
+     intf=0, alt=3, name="UBI", serial="002700333338511934383330"
+  Found DFU: [0483:5720] ver=9999, devnum=96, cfg=1,\
+     intf=0, alt=2, name="u-boot-env", serial="002700333338511934383330"
+  Found DFU: [0483:5720] ver=9999, devnum=96, cfg=1,\
+     intf=0, alt=1, name="u-boot", serial="002700333338511934383330"
+  Found DFU: [0483:5720] ver=9999, devnum=96, cfg=1,\
+     intf=0, alt=0, name="spl", serial="002700333338511934383330"
diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
index 900a844d15..8bd5216017 100644
--- a/drivers/dfu/dfu.c
+++ b/drivers/dfu/dfu.c
@@ -53,6 +53,54 @@ static int dfu_find_alt_num(const char *s)
 	return ++i;
 }
 
+/*
+ * treat dfu_alt_info with several interface information
+ * to allow DFU on several device with one command,
+ * the string format is
+ * interface devstring'='alternate list (';' separated)
+ * and each interface separated by '&'
+ */
+int dfu_config_interfaces(char *env)
+{
+	struct dfu_entity *dfu;
+	char *s, *i, *d, *a, *part;
+	int ret = -EINVAL;
+	int n = 1;
+
+	s = env;
+	for (; *s; s++) {
+		if (*s == ';')
+			n++;
+		if (*s == '&')
+			n++;
+	}
+	ret = dfu_alt_init(n, &dfu);
+	if (ret)
+		return ret;
+
+	s = env;
+	while (s) {
+		ret = -EINVAL;
+		i = strsep(&s, " ");
+		if (!i)
+			break;
+		d = strsep(&s, "=");
+		if (!d)
+			break;
+		a = strsep(&s, "&");
+		if (!a)
+			a = s;
+		do {
+			part = strsep(&a, ";");
+			ret = dfu_alt_add(dfu, i, d, part);
+			if (ret)
+				return ret;
+		} while (a);
+	}
+
+	return ret;
+}
+
 int dfu_init_env_entities(char *interface, char *devstr)
 {
 	const char *str_env;
@@ -69,7 +117,11 @@ int dfu_init_env_entities(char *interface, char *devstr)
 	}
 
 	env_bkp = strdup(str_env);
-	ret = dfu_config_entities(env_bkp, interface, devstr);
+	if (!interface && !devstr)
+		ret = dfu_config_interfaces(env_bkp);
+	else
+		ret = dfu_config_entities(env_bkp, interface, devstr);
+
 	if (ret) {
 		pr_err("DFU entities configuration failed!\n");
 		pr_err("(partition table does not match dfu_alt_info?)\n");
@@ -83,6 +135,7 @@ done:
 
 static unsigned char *dfu_buf;
 static unsigned long dfu_buf_size;
+static enum dfu_device_type dfu_buf_device_type;
 
 unsigned char *dfu_free_buf(void)
 {
@@ -100,6 +153,10 @@ unsigned char *dfu_get_buf(struct dfu_entity *dfu)
 {
 	char *s;
 
+	/* manage several entity with several contraint */
+	if (dfu_buf && dfu->dev_type != dfu_buf_device_type)
+		dfu_free_buf();
+
 	if (dfu_buf != NULL)
 		return dfu_buf;
 
@@ -118,6 +175,7 @@ unsigned char *dfu_get_buf(struct dfu_entity *dfu)
 		printf("%s: Could not memalign 0x%lx bytes\n",
 		       __func__, dfu_buf_size);
 
+	dfu_buf_device_type = dfu->dev_type;
 	return dfu_buf;
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
