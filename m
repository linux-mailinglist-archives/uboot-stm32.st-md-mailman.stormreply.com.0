Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E245B21BA
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 16:19:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B3F9C35E01
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 14:19:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13E39C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 14:19:44 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8DEGIj7017350; Fri, 13 Sep 2019 16:19:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=RYtMQ3qt7Ih5B6YVlXH1xihr07hptIc9tUohVG1QM80=;
 b=h+bUFkBs7j9176buV+zkLQTX91khB8P8BJjADxyBJBaNqFc+SA8OGufpnbx9QzFBtbrB
 aumpKb6vCKCpq6xS7sN2PFlseSmSqGLTtaR4FI1uakqLP/SgM03210SRxXNKqp+E4eLG
 LmOneV7Qu8HBi7K4YYsoK5HJ93AB+gEGN4fpGiel/eHfXfFTIkutuGAVZRQ0p8TU8+Tl
 6KYPDFk7ohKpdQX1SJWfMtmepuaJYaVBmX4M2qpAMB2W/WgkQf9zJSDjWJgyac74YS0i
 7+tZWF75zJBzOmGHV/pWjS5XpCiEa7MPIjb/gnP/40bjj3yphqdXK56kvorHtzA1C2d4 PQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uyte2wdcw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 16:19:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9DD5C22;
 Fri, 13 Sep 2019 14:19:38 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D2F62C7F40;
 Fri, 13 Sep 2019 16:19:38 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 16:19:37 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 16:19:37
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 13 Sep 2019 16:19:20 +0200
Message-ID: <20190913141930.15784-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913141930.15784-2-patrick.delaunay@st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_07:2019-09-11,2019-09-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 04/14] dfu: allow to manage DFU on several
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
  interface with devstring'='alternate list (';' separated)
  and each interface is separated by '&'

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

 cmd/dfu.c         | 21 ++++++++++-------
 drivers/dfu/dfu.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 72 insertions(+), 9 deletions(-)

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
