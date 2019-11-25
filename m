Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F31971089C0
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 09:08:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCC62C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 08:08:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7379AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 08:08:06 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAP82ofB030615; Mon, 25 Nov 2019 09:07:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=fIbe/sP9HNoW5c6lnDmxs9PaYyurnbZbC7HtEKO9QT4=;
 b=meBbsqXiwXEOHhqPnPD60NkD9MT3AAR+1cd23lKa8TCTdv5bamj7Rg9fvpKMUxe0jAa+
 kCyCWLzzBjN+tCOFyfWbnghgm4xWs2+Jx65pMRIHxsBpyIjKNZp/x9IhpZroLAyYvU36
 UC5ofAzGPRh/xND3pi4Fj51wW3bLodInIPczhTDVG34ct+iDoWKCs7KEsI2SQt+rISTA
 2QebT8n/dH/mMISxrApi/I663fiLBhqy/FTipXLmG8E3KmheRQa+Vfzur9IbYU0jaj9N
 qGLP8vdT4yeK9g2XkoF8AMRXWQ0dQ2R2iW79vqcdZbmiwOU9gJQbgaoXuq158XtM3jWb RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2weu427wfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 09:07:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 84F2410002A;
 Mon, 25 Nov 2019 09:07:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DECD2AC062;
 Mon, 25 Nov 2019 09:07:48 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 Nov 2019 09:07:47 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 Nov 2019 09:07:38 +0100
Message-ID: <20191125080741.2215-4-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125080741.2215-1-patrice.chotard@st.com>
References: <20191125080741.2215-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_01:2019-11-21,2019-11-25 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Chris Packham <judge.packham@gmail.com>,
 Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Adam Ford <aford173@gmail.com>,
 Simon Glass <sjg@chromium.org>, Anup Patel <anup.patel@wdc.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>
Subject: [Uboot-stm32] [PATCH v3 3/6] cmd: sysboot: Create a sysboot command
	dedicated file
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

Extract all sysboot command related code from pxe.c to new sysboot.c
Update Kconfig to insure that DISTRO_DEFAULT select new CMD_SYSBOOT
command.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 Kconfig       |   1 +
 cmd/Kconfig   |   6 +++
 cmd/Makefile  |   1 +
 cmd/pxe.c     | 132 ------------------------------------------------
 cmd/sysboot.c | 135 ++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 143 insertions(+), 132 deletions(-)
 create mode 100644 cmd/sysboot.c

diff --git a/Kconfig b/Kconfig
index cda4f58ff7..0a1643f7d6 100644
--- a/Kconfig
+++ b/Kconfig
@@ -88,6 +88,7 @@ config DISTRO_DEFAULTS
 	select CMD_PART if PARTITIONS
 	select CMD_PING if CMD_NET
 	select CMD_PXE if NET
+	select CMD_SYSBOOT
 	select ENV_VARS_UBOOT_CONFIG
 	select HUSH_PARSER
 	select SUPPORT_RAW_INITRD
diff --git a/cmd/Kconfig b/cmd/Kconfig
index cf982ff65e..23634a7818 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -1667,6 +1667,12 @@ config CMD_SOUND
 	     sound init   - set up sound system
 	     sound play   - play a sound
 
+config CMD_SYSBOOT
+	bool "sysboot"
+	select MENU
+	help
+	  Boot image via local extlinux.conf file
+
 config CMD_QFW
 	bool "qfw"
 	select QFW
diff --git a/cmd/Makefile b/cmd/Makefile
index 723b461e0d..3d3ed184fd 100644
--- a/cmd/Makefile
+++ b/cmd/Makefile
@@ -127,6 +127,7 @@ obj-$(CONFIG_CMD_SETEXPR) += setexpr.o
 obj-$(CONFIG_CMD_SPI) += spi.o
 obj-$(CONFIG_CMD_STRINGS) += strings.o
 obj-$(CONFIG_CMD_SMC) += smccc.o
+obj-$(CONFIG_CMD_SYSBOOT) += sysboot.o pxe_utils.o
 obj-$(CONFIG_CMD_TERMINAL) += terminal.o
 obj-$(CONFIG_CMD_TIME) += time.o
 obj-$(CONFIG_CMD_TRACE) += trace.o
diff --git a/cmd/pxe.c b/cmd/pxe.c
index 5fe7d45b3d..757e186d32 100644
--- a/cmd/pxe.c
+++ b/cmd/pxe.c
@@ -6,7 +6,6 @@
 
 #include <common.h>
 #include <command.h>
-#include <fs.h>
 
 #include "pxe_utils.h"
 
@@ -35,50 +34,6 @@ static int do_get_tftp(cmd_tbl_t *cmdtp, const char *file_path, char *file_addr)
 
 	return 1;
 }
-#endif
-
-static char *fs_argv[5];
-
-static int do_get_ext2(cmd_tbl_t *cmdtp, const char *file_path, char *file_addr)
-{
-#ifdef CONFIG_CMD_EXT2
-	fs_argv[0] = "ext2load";
-	fs_argv[3] = file_addr;
-	fs_argv[4] = (void *)file_path;
-
-	if (!do_ext2load(cmdtp, 0, 5, fs_argv))
-		return 1;
-#endif
-	return -ENOENT;
-}
-
-static int do_get_fat(cmd_tbl_t *cmdtp, const char *file_path, char *file_addr)
-{
-#ifdef CONFIG_CMD_FAT
-	fs_argv[0] = "fatload";
-	fs_argv[3] = file_addr;
-	fs_argv[4] = (void *)file_path;
-
-	if (!do_fat_fsload(cmdtp, 0, 5, fs_argv))
-		return 1;
-#endif
-	return -ENOENT;
-}
-
-static int do_get_any(cmd_tbl_t *cmdtp, const char *file_path, char *file_addr)
-{
-#ifdef CONFIG_CMD_FS_GENERIC
-	fs_argv[0] = "load";
-	fs_argv[3] = file_addr;
-	fs_argv[4] = (void *)file_path;
-
-	if (!do_load(cmdtp, 0, 5, fs_argv, FS_TYPE_ANY))
-		return 1;
-#endif
-	return -ENOENT;
-}
-
-#ifdef CONFIG_CMD_NET
 
 /*
  * Entry point for the 'pxe get' command.
@@ -221,90 +176,3 @@ U_BOOT_CMD(
 	"boot [pxefile_addr_r] - boot from the pxe file at pxefile_addr_r\n"
 );
 #endif
-
-/*
- * Boots a system using a local disk syslinux/extlinux file
- *
- * Returns 0 on success, 1 on error.
- */
-static int do_sysboot(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
-{
-	unsigned long pxefile_addr_r;
-	struct pxe_menu *cfg;
-	char *pxefile_addr_str;
-	char *filename;
-	int prompt = 0;
-
-	is_pxe = false;
-
-	if (argc > 1 && strstr(argv[1], "-p")) {
-		prompt = 1;
-		argc--;
-		argv++;
-	}
-
-	if (argc < 4)
-		return cmd_usage(cmdtp);
-
-	if (argc < 5) {
-		pxefile_addr_str = from_env("pxefile_addr_r");
-		if (!pxefile_addr_str)
-			return 1;
-	} else {
-		pxefile_addr_str = argv[4];
-	}
-
-	if (argc < 6)
-		filename = env_get("bootfile");
-	else {
-		filename = argv[5];
-		env_set("bootfile", filename);
-	}
-
-	if (strstr(argv[3], "ext2"))
-		do_getfile = do_get_ext2;
-	else if (strstr(argv[3], "fat"))
-		do_getfile = do_get_fat;
-	else if (strstr(argv[3], "any"))
-		do_getfile = do_get_any;
-	else {
-		printf("Invalid filesystem: %s\n", argv[3]);
-		return 1;
-	}
-	fs_argv[1] = argv[1];
-	fs_argv[2] = argv[2];
-
-	if (strict_strtoul(pxefile_addr_str, 16, &pxefile_addr_r) < 0) {
-		printf("Invalid pxefile address: %s\n", pxefile_addr_str);
-		return 1;
-	}
-
-	if (get_pxe_file(cmdtp, filename, pxefile_addr_r) < 0) {
-		printf("Error reading config file\n");
-		return 1;
-	}
-
-	cfg = parse_pxefile(cmdtp, pxefile_addr_r);
-
-	if (cfg == NULL) {
-		printf("Error parsing config file\n");
-		return 1;
-	}
-
-	if (prompt)
-		cfg->prompt = 1;
-
-	handle_pxe_menu(cmdtp, cfg);
-
-	destroy_pxe_menu(cfg);
-
-	return 0;
-}
-
-U_BOOT_CMD(
-	sysboot, 7, 1, do_sysboot,
-	"command to get and boot from syslinux files",
-	"[-p] <interface> <dev[:part]> <ext2|fat|any> [addr] [filename]\n"
-	"    - load and parse syslinux menu file 'filename' from ext2, fat\n"
-	"      or any filesystem on 'dev' on 'interface' to address 'addr'"
-);
diff --git a/cmd/sysboot.c b/cmd/sysboot.c
new file mode 100644
index 0000000000..965799a1cb
--- /dev/null
+++ b/cmd/sysboot.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <common.h>
+#include <command.h>
+#include <env.h>
+#include <fs.h>
+#include "pxe_utils.h"
+
+static char *fs_argv[5];
+
+static int do_get_ext2(cmd_tbl_t *cmdtp, const char *file_path, char *file_addr)
+{
+#ifdef CONFIG_CMD_EXT2
+	fs_argv[0] = "ext2load";
+	fs_argv[3] = file_addr;
+	fs_argv[4] = (void *)file_path;
+
+	if (!do_ext2load(cmdtp, 0, 5, fs_argv))
+		return 1;
+#endif
+	return -ENOENT;
+}
+
+static int do_get_fat(cmd_tbl_t *cmdtp, const char *file_path, char *file_addr)
+{
+#ifdef CONFIG_CMD_FAT
+	fs_argv[0] = "fatload";
+	fs_argv[3] = file_addr;
+	fs_argv[4] = (void *)file_path;
+
+	if (!do_fat_fsload(cmdtp, 0, 5, fs_argv))
+		return 1;
+#endif
+	return -ENOENT;
+}
+
+static int do_get_any(cmd_tbl_t *cmdtp, const char *file_path, char *file_addr)
+{
+#ifdef CONFIG_CMD_FS_GENERIC
+	fs_argv[0] = "load";
+	fs_argv[3] = file_addr;
+	fs_argv[4] = (void *)file_path;
+
+	if (!do_load(cmdtp, 0, 5, fs_argv, FS_TYPE_ANY))
+		return 1;
+#endif
+	return -ENOENT;
+}
+
+/*
+ * Boots a system using a local disk syslinux/extlinux file
+ *
+ * Returns 0 on success, 1 on error.
+ */
+static int do_sysboot(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
+{
+	unsigned long pxefile_addr_r;
+	struct pxe_menu *cfg;
+	char *pxefile_addr_str;
+	char *filename;
+	int prompt = 0;
+
+	is_pxe = false;
+
+	if (argc > 1 && strstr(argv[1], "-p")) {
+		prompt = 1;
+		argc--;
+		argv++;
+	}
+
+	if (argc < 4)
+		return cmd_usage(cmdtp);
+
+	if (argc < 5) {
+		pxefile_addr_str = from_env("pxefile_addr_r");
+		if (!pxefile_addr_str)
+			return 1;
+	} else {
+		pxefile_addr_str = argv[4];
+	}
+
+	if (argc < 6)
+		filename = env_get("bootfile");
+	else {
+		filename = argv[5];
+		env_set("bootfile", filename);
+	}
+
+	if (strstr(argv[3], "ext2"))
+		do_getfile = do_get_ext2;
+	else if (strstr(argv[3], "fat"))
+		do_getfile = do_get_fat;
+	else if (strstr(argv[3], "any"))
+		do_getfile = do_get_any;
+	else {
+		printf("Invalid filesystem: %s\n", argv[3]);
+		return 1;
+	}
+	fs_argv[1] = argv[1];
+	fs_argv[2] = argv[2];
+
+	if (strict_strtoul(pxefile_addr_str, 16, &pxefile_addr_r) < 0) {
+		printf("Invalid pxefile address: %s\n", pxefile_addr_str);
+		return 1;
+	}
+
+	if (get_pxe_file(cmdtp, filename, pxefile_addr_r) < 0) {
+		printf("Error reading config file\n");
+		return 1;
+	}
+
+	cfg = parse_pxefile(cmdtp, pxefile_addr_r);
+
+	if (cfg == NULL) {
+		printf("Error parsing config file\n");
+		return 1;
+	}
+
+	if (prompt)
+		cfg->prompt = 1;
+
+	handle_pxe_menu(cmdtp, cfg);
+
+	destroy_pxe_menu(cfg);
+
+	return 0;
+}
+
+U_BOOT_CMD(
+	sysboot, 7, 1, do_sysboot,
+	"command to get and boot from syslinux files",
+	"[-p] <interface> <dev[:part]> <ext2|fat|any> [addr] [filename]\n"
+	"    - load and parse syslinux menu file 'filename' from ext2, fat\n"
+	"      or any filesystem on 'dev' on 'interface' to address 'addr'"
+);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
