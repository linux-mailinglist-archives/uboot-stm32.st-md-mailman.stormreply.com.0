Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF081089B8
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 09:07:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11241C36B0C
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 08:07:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87FBCC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 08:07:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAP81uEb002771; Mon, 25 Nov 2019 09:07:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=LQSlovwUveVyconXgEU6+vFO47HHYQ2hwvFRHCulCoU=;
 b=1XDrrfoBjZIo2hvmtvxRuo6yX4YPx6h5SUZqswscJ7ssIHpszv6CSKFkzIXIYmtRezGf
 ZDsP6/8Yr2KP8AIBVFuyGFlKunflUwDRDs6X3fSwFGz9gfJxiC+3COVgQa7/SNS04ljk
 znLRHwwjDBKeIb5wAbstBmhorX3hH4fWBj+HrB7QfMOlbTX/BqHFRUkZ57CcvqziLGmD
 S6TzHMF/mlUuBRzdNXwf5u75WrYY80bikF1rfeALCNli59Wc3BXgvkuxsSEVQi2KrqXO
 w3+tttdIyt+a/EQjs+sRoOERybmixvUzts18Q0q1HniyKeGUv6zWuhcwJphe/wZW1Jbv Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2weudvyusb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 09:07:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 45A9510002A;
 Mon, 25 Nov 2019 09:07:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A6D52AC062;
 Mon, 25 Nov 2019 09:07:49 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 Nov 2019 09:07:48 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 Nov 2019 09:07:39 +0100
Message-ID: <20191125080741.2215-5-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125080741.2215-1-patrice.chotard@st.com>
References: <20191125080741.2215-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_01:2019-11-21,2019-11-25 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v3 4/6] cmd: pxe_utils: Fix checkpatch
	WARNING/CHECK
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

Fix checkpatch WARNING and CHECK issues

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 cmd/pxe_utils.c | 93 ++++++++++++++++++++++++-------------------------
 1 file changed, 46 insertions(+), 47 deletions(-)

diff --git a/cmd/pxe_utils.c b/cmd/pxe_utils.c
index c318f98417..86a669fa79 100644
--- a/cmd/pxe_utils.c
+++ b/cmd/pxe_utils.c
@@ -78,14 +78,14 @@ static int get_bootfile_path(const char *file_path, char *bootfile_path,
 
 	last_slash = strrchr(bootfile, '/');
 
-	if (last_slash == NULL				)
+	if (!last_slash)
 		goto ret;
 
 	path_len = (last_slash - bootfile) + 1;
 
 	if (bootfile_path_size < path_len) {
 		printf("bootfile_path too small. (%zd < %zd)\n",
-				bootfile_path_size, path_len);
+		       bootfile_path_size, path_len);
 
 		return -1;
 	}
@@ -109,10 +109,10 @@ int (*do_getfile)(cmd_tbl_t *cmdtp, const char *file_path, char *file_addr);
  * Returns 1 for success, or < 0 on error.
  */
 static int get_relfile(cmd_tbl_t *cmdtp, const char *file_path,
-	unsigned long file_addr)
+		       unsigned long file_addr)
 {
 	size_t path_len;
-	char relfile[MAX_TFTP_PATH_LEN+1];
+	char relfile[MAX_TFTP_PATH_LEN + 1];
 	char addr_buf[18];
 	int err;
 
@@ -125,9 +125,7 @@ static int get_relfile(cmd_tbl_t *cmdtp, const char *file_path,
 	path_len += strlen(relfile);
 
 	if (path_len > MAX_TFTP_PATH_LEN) {
-		printf("Base path too long (%s%s)\n",
-					relfile,
-					file_path);
+		printf("Base path too long (%s%s)\n", relfile, file_path);
 
 		return -ENAMETOOLONG;
 	}
@@ -149,7 +147,7 @@ static int get_relfile(cmd_tbl_t *cmdtp, const char *file_path,
  * Returns 1 on success, or < 0 for error.
  */
 int get_pxe_file(cmd_tbl_t *cmdtp, const char *file_path,
-	unsigned long file_addr)
+		 unsigned long file_addr)
 {
 	unsigned long config_file_size;
 	char *tftp_filesize;
@@ -182,7 +180,6 @@ int get_pxe_file(cmd_tbl_t *cmdtp, const char *file_path,
 
 #define PXELINUX_DIR "pxelinux.cfg/"
 
-
 /*
  * Retrieves a file in the 'pxelinux.cfg' folder. Since this uses get_pxe_file
  * to do the hard work, the location of the 'pxelinux.cfg' folder is generated
@@ -191,14 +188,14 @@ int get_pxe_file(cmd_tbl_t *cmdtp, const char *file_path,
  * Returns 1 on success or < 0 on error.
  */
 int get_pxelinux_path(cmd_tbl_t *cmdtp, const char *file,
-	unsigned long pxefile_addr_r)
+		      unsigned long pxefile_addr_r)
 {
 	size_t base_len = strlen(PXELINUX_DIR);
-	char path[MAX_TFTP_PATH_LEN+1];
+	char path[MAX_TFTP_PATH_LEN + 1];
 
 	if (base_len + strlen(file) > MAX_TFTP_PATH_LEN) {
 		printf("path (%s%s) too long, skipping\n",
-				PXELINUX_DIR, file);
+		       PXELINUX_DIR, file);
 		return -ENAMETOOLONG;
 	}
 
@@ -276,7 +273,8 @@ int pxe_ipaddr_paths(cmd_tbl_t *cmdtp, unsigned long pxefile_addr_r)
  *
  * Returns 1 on success or < 0 on error.
  */
-static int get_relfile_envaddr(cmd_tbl_t *cmdtp, const char *file_path, const char *envaddr_name)
+static int get_relfile_envaddr(cmd_tbl_t *cmdtp, const char *file_path,
+			       const char *envaddr_name)
 {
 	unsigned long file_addr;
 	char *envaddr;
@@ -427,16 +425,16 @@ static int label_boot(cmd_tbl_t *cmdtp, struct pxe_label *label)
 		return 0;
 	}
 
-	if (label->kernel == NULL) {
+	if (!label->kernel) {
 		printf("No kernel given, skipping %s\n",
-				label->name);
+		       label->name);
 		return 1;
 	}
 
 	if (label->initrd) {
 		if (get_relfile_envaddr(cmdtp, label->initrd, "ramdisk_addr_r") < 0) {
 			printf("Skipping %s for failure retrieving initrd\n",
-					label->name);
+			       label->name);
 			return 1;
 		}
 
@@ -448,7 +446,7 @@ static int label_boot(cmd_tbl_t *cmdtp, struct pxe_label *label)
 
 	if (get_relfile_envaddr(cmdtp, label->kernel, "kernel_addr_r") < 0) {
 		printf("Skipping %s for failure retrieving kernel\n",
-				label->name);
+		       label->name);
 		return 1;
 	}
 
@@ -461,6 +459,7 @@ static int label_boot(cmd_tbl_t *cmdtp, struct pxe_label *label)
 #ifdef CONFIG_CMD_NET
 	if (label->ipappend & 0x2) {
 		int err;
+
 		strcpy(mac_str, " BOOTIF=");
 		err = format_mac_pxe(mac_str + 8, sizeof(mac_str) - 8);
 		if (err < 0)
@@ -479,17 +478,17 @@ static int label_boot(cmd_tbl_t *cmdtp, struct pxe_label *label)
 			       strlen(ip_str), strlen(mac_str),
 			       sizeof(bootargs));
 			return 1;
-		} else {
-			if (label->append)
-				strncpy(bootargs, label->append,
-					sizeof(bootargs));
-			strcat(bootargs, ip_str);
-			strcat(bootargs, mac_str);
-
-			cli_simple_process_macros(bootargs, finalbootargs);
-			env_set("bootargs", finalbootargs);
-			printf("append: %s\n", finalbootargs);
 		}
+
+		if (label->append)
+			strncpy(bootargs, label->append, sizeof(bootargs));
+
+		strcat(bootargs, ip_str);
+		strcat(bootargs, mac_str);
+
+		cli_simple_process_macros(bootargs, finalbootargs);
+		env_set("bootargs", finalbootargs);
+		printf("append: %s\n", finalbootargs);
 	}
 
 	bootm_argv[1] = env_get("kernel_addr_r");
@@ -573,11 +572,13 @@ static int label_boot(cmd_tbl_t *cmdtp, struct pxe_label *label)
 		}
 
 		if (fdtfile) {
-			int err = get_relfile_envaddr(cmdtp, fdtfile, "fdt_addr_r");
+			int err = get_relfile_envaddr(cmdtp, fdtfile,
+						      "fdt_addr_r");
+
 			free(fdtfilefree);
 			if (err < 0) {
 				printf("Skipping %s for failure retrieving fdt\n",
-						label->name);
+				       label->name);
 				goto cleanup;
 			}
 		} else {
@@ -720,7 +721,8 @@ static char *get_string(char **p, struct token *t, char delim, int lower)
 	 * e is incremented until we find the ending delimiter, or a NUL byte
 	 * is reached. Then, we take e - b to find the length of the token.
 	 */
-	b = e = *p;
+	b = *p;
+	e = *p;
 
 	while (*e) {
 		if ((delim == ' ' && isspace(*e)) || delim == *e)
@@ -880,7 +882,7 @@ static int parse_integer(char **c, int *dst)
 }
 
 static int parse_pxefile_top(cmd_tbl_t *cmdtp, char *p, unsigned long base,
-	struct pxe_menu *cfg, int nest_level);
+			     struct pxe_menu *cfg, int nest_level);
 
 /*
  * Parse an include statement, and retrieve and parse the file it mentions.
@@ -891,7 +893,7 @@ static int parse_pxefile_top(cmd_tbl_t *cmdtp, char *p, unsigned long base,
  * incremented here.
  */
 static int handle_include(cmd_tbl_t *cmdtp, char **c, unsigned long base,
-				struct pxe_menu *cfg, int nest_level)
+			  struct pxe_menu *cfg, int nest_level)
 {
 	char *include_path;
 	char *s = *c;
@@ -902,8 +904,7 @@ static int handle_include(cmd_tbl_t *cmdtp, char **c, unsigned long base,
 	err = parse_sliteral(c, &include_path);
 
 	if (err < 0) {
-		printf("Expected include path: %.*s\n",
-				 (int)(*c - s), s);
+		printf("Expected include path: %.*s\n", (int)(*c - s), s);
 		return err;
 	}
 
@@ -932,7 +933,7 @@ static int handle_include(cmd_tbl_t *cmdtp, char **c, unsigned long base,
  * a file it includes, 3 when parsing a file included by that file, and so on.
  */
 static int parse_menu(cmd_tbl_t *cmdtp, char **c, struct pxe_menu *cfg,
-				unsigned long base, int nest_level)
+		      unsigned long base, int nest_level)
 {
 	struct token t;
 	char *s = *c;
@@ -947,8 +948,7 @@ static int parse_menu(cmd_tbl_t *cmdtp, char **c, struct pxe_menu *cfg,
 		break;
 
 	case T_INCLUDE:
-		err = handle_include(cmdtp, c, base, cfg,
-						nest_level + 1);
+		err = handle_include(cmdtp, c, base, cfg, nest_level + 1);
 		break;
 
 	case T_BACKGROUND:
@@ -957,7 +957,7 @@ static int parse_menu(cmd_tbl_t *cmdtp, char **c, struct pxe_menu *cfg,
 
 	default:
 		printf("Ignoring malformed menu command: %.*s\n",
-				(int)(*c - s), s);
+		       (int)(*c - s), s);
 	}
 
 	if (err < 0)
@@ -972,7 +972,7 @@ static int parse_menu(cmd_tbl_t *cmdtp, char **c, struct pxe_menu *cfg,
  * Handles parsing a 'menu line' when we're parsing a label.
  */
 static int parse_label_menu(char **c, struct pxe_menu *cfg,
-				struct pxe_label *label)
+			    struct pxe_label *label)
 {
 	struct token t;
 	char *s;
@@ -995,7 +995,7 @@ static int parse_label_menu(char **c, struct pxe_menu *cfg,
 		break;
 	default:
 		printf("Ignoring malformed menu command: %.*s\n",
-				(int)(*c - s), s);
+		       (int)(*c - s), s);
 	}
 
 	eol_or_eof(c);
@@ -1146,7 +1146,7 @@ static int parse_label(char **c, struct pxe_menu *cfg)
  * Returns 1 on success, < 0 on error.
  */
 static int parse_pxefile_top(cmd_tbl_t *cmdtp, char *p, unsigned long base,
-				struct pxe_menu *cfg, int nest_level)
+			     struct pxe_menu *cfg, int nest_level)
 {
 	struct token t;
 	char *s, *b, *label_name;
@@ -1169,8 +1169,8 @@ static int parse_pxefile_top(cmd_tbl_t *cmdtp, char *p, unsigned long base,
 		case T_MENU:
 			cfg->prompt = 1;
 			err = parse_menu(cmdtp, &p, cfg,
-				base + ALIGN(strlen(b) + 1, 4),
-				nest_level);
+					 base + ALIGN(strlen(b) + 1, 4),
+					 nest_level);
 			break;
 
 		case T_TIMEOUT:
@@ -1196,8 +1196,8 @@ static int parse_pxefile_top(cmd_tbl_t *cmdtp, char *p, unsigned long base,
 
 		case T_INCLUDE:
 			err = handle_include(cmdtp, &p,
-				base + ALIGN(strlen(b), 4), cfg,
-				nest_level + 1);
+					     base + ALIGN(strlen(b), 4), cfg,
+					     nest_level + 1);
 			break;
 
 		case T_PROMPT:
@@ -1212,7 +1212,7 @@ static int parse_pxefile_top(cmd_tbl_t *cmdtp, char *p, unsigned long base,
 
 		default:
 			printf("Ignoring unknown command: %.*s\n",
-							(int)(p - s), s);
+			       (int)(p - s), s);
 			eol_or_eof(&p);
 		}
 
@@ -1313,7 +1313,6 @@ static struct menu *pxe_menu_to_menu(struct pxe_menu *cfg)
 		if (cfg->default_label &&
 		    (strcmp(label->name, cfg->default_label) == 0))
 			default_num = label->num;
-
 	}
 
 	/*
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
