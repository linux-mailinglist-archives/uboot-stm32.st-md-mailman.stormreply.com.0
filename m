Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ADC148538
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 13:34:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99232C36B0F
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 12:34:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA9CCC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 12:34:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00OCXxoD000468; Fri, 24 Jan 2020 13:33:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=zi9jir/PxIiS+O2VV6rWMUNXQUZFFOH2iF6cc2pn/CY=;
 b=VQT45oz8Tg9T6wiCf0bgyxudQ2wfy5PSufluyM9rv3T8RgnhweAVzm+Dq9lXxNAzj4hF
 Vwl67sWEywdUj2ivzPmkyioUzpPzUDDKLmq7hozitY3YKHd4zP4iem3uMtXk12KeWAhi
 edxdtqtz8XLA70JBxRovS+5DOS7M9vvlzw96V065sRvpPph1WmMpVm4e+nwl+3+QU0Gu
 16LpF1jMoNl/oVcBODgsGwiZOlznPaSLqsxiWr9Ee+hqFjgIE9vHv7mys3K8bcZz4prX
 a0BlEf34xouBnH4/d4AChms63h2xR54qfcWP3frX/XItZVyFYOGOruce157mO/Snv0qZ dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xksspfmhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2020 13:33:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A71810003A;
 Fri, 24 Jan 2020 13:33:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 699202A76F8;
 Fri, 24 Jan 2020 13:33:50 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Jan 2020 13:33:50 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Jan 2020 13:33:42 +0100
Message-ID: <20200124123346.32210-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_03:2020-01-24,
 2020-01-24 signatures=0
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/5] cmd: env: add option for quiet output on
	env info
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

The "env info" can be use for test with -d and -p parameter,
in scripting case the output of the command is not needed.

This patch allows to deactivate this output with a new option "-q".

For example, we can save the environment if default
environment is used and persistent storage is managed with:
  if env info -p -d -q; then env save; fi

Without the quiet option, I have the unnecessary traces
First boot:
      Default environment is used
      Environment can be persisted
      Saving Environment to EXT4... File System is consistent

Next boot:
      Environment was loaded from persistent storage
      Environment can be persisted

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 cmd/Kconfig  |  1 +
 cmd/nvedit.c | 26 +++++++++++++++++++-------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index b1a1cbcab2..458dbcedac 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -567,6 +567,7 @@ config CMD_NVEDIT_INFO
 	  This command can be optionally used for evaluation in scripts:
 	  [-d] : evaluate whether default environment is used
 	  [-p] : evaluate whether environment can be persisted
+	  [-q] : quiet output
 	  The result of multiple evaluations will be combined with AND.
 
 endmenu
diff --git a/cmd/nvedit.c b/cmd/nvedit.c
index 81d94cd193..aaa032cd96 100644
--- a/cmd/nvedit.c
+++ b/cmd/nvedit.c
@@ -1219,12 +1219,15 @@ static int print_env_info(void)
  * env info - display environment information
  * env info [-d] - evaluate whether default environment is used
  * env info [-p] - evaluate whether environment can be persisted
+ *      Add [-q] - quiet mode, use only for command result, for test by example:
+ *                 test env info -p -d -q
  */
 static int do_env_info(cmd_tbl_t *cmdtp, int flag,
 		       int argc, char * const argv[])
 {
 	int eval_flags = 0;
 	int eval_results = 0;
+	bool quiet = false;
 
 	/* display environment information */
 	if (argc <= 1)
@@ -1242,6 +1245,9 @@ static int do_env_info(cmd_tbl_t *cmdtp, int flag,
 			case 'p':
 				eval_flags |= ENV_INFO_IS_PERSISTED;
 				break;
+			case 'q':
+				quiet = true;
+				break;
 			default:
 				return CMD_RET_USAGE;
 			}
@@ -1251,20 +1257,24 @@ static int do_env_info(cmd_tbl_t *cmdtp, int flag,
 	/* evaluate whether default environment is used */
 	if (eval_flags & ENV_INFO_IS_DEFAULT) {
 		if (gd->flags & GD_FLG_ENV_DEFAULT) {
-			printf("Default environment is used\n");
+			if (!quiet)
+				printf("Default environment is used\n");
 			eval_results |= ENV_INFO_IS_DEFAULT;
 		} else {
-			printf("Environment was loaded from persistent storage\n");
+			if (!quiet)
+				printf("Environment was loaded from persistent storage\n");
 		}
 	}
 
 	/* evaluate whether environment can be persisted */
 	if (eval_flags & ENV_INFO_IS_PERSISTED) {
 #if defined(CONFIG_CMD_SAVEENV) && !defined(CONFIG_ENV_IS_NOWHERE)
-		printf("Environment can be persisted\n");
+		if (!quiet)
+			printf("Environment can be persisted\n");
 		eval_results |= ENV_INFO_IS_PERSISTED;
 #else
-		printf("Environment cannot be persisted\n");
+		if (!quiet)
+			printf("Environment cannot be persisted\n");
 #endif
 	}
 
@@ -1321,7 +1331,7 @@ static cmd_tbl_t cmd_env_sub[] = {
 	U_BOOT_CMD_MKENT(import, 5, 0, do_env_import, "", ""),
 #endif
 #if defined(CONFIG_CMD_NVEDIT_INFO)
-	U_BOOT_CMD_MKENT(info, 2, 0, do_env_info, "", ""),
+	U_BOOT_CMD_MKENT(info, 3, 0, do_env_info, "", ""),
 #endif
 	U_BOOT_CMD_MKENT(print, CONFIG_SYS_MAXARGS, 1, do_env_print, "", ""),
 #if defined(CONFIG_CMD_RUN)
@@ -1400,8 +1410,10 @@ static char env_help_text[] =
 #endif
 #if defined(CONFIG_CMD_NVEDIT_INFO)
 	"env info - display environment information\n"
-	"env info [-d] - whether default environment is used\n"
-	"env info [-p] - whether environment can be persisted\n"
+	"env info [-d] [-p] [-q] - evaluate environment information\n"
+	"      \"-d\": default environment is used\n"
+	"      \"-p\": environment can be persisted\n"
+	"      \"-q\": quiet output\n"
 #endif
 	"env print [-a | name ...] - print environment\n"
 #if defined(CONFIG_CMD_NVEDIT_EFI)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
