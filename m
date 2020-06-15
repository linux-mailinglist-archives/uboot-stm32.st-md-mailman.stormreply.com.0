Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7F61F9980
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 16:01:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12DD9C36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 14:01:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D29FDC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 14:01:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FDxoDn005777; Mon, 15 Jun 2020 16:01:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=6DGn1ZPTGOLBN1PxGc5+rOo7PlnSjM5SH8vSiXmOzhk=;
 b=yBZYZY3PTIoHoBHGGiDv7ZmtqkrKCInDIsWJNAWlpLfn8sXh4XN8MXymHj0QDU4aIVq+
 KNcQSkI6AA83saXHqkVlPTndD+NJk8WlpZ8vZeVyUrEi5/9MT3SezDbssTm8r1d8LbSf
 cFGa4j7SXh1RiPqqk8LrpDKHJrN90BURP7pZIscp9tbC8yL1MYbR/0LUFMIa8ddDHURN
 mUOazhL/BfoNBSbV9OUgH4pNZDVJClOsQ8kZ/4q1jDROdavSlcD140WrtmLeYjDYGgr0
 m8tedqa01IebuTtVIWGRm9Sf6xlaM+MI9oUWlJ3/1dyVLvZ8uja/mVPHU9rSStSWYodP 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mkx9237x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 16:01:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20CCE100038;
 Mon, 15 Jun 2020 16:01:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7570206807;
 Mon, 15 Jun 2020 16:01:40 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 15 Jun 2020 16:01:40 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jun 2020 16:01:34 +0200
Message-ID: <20200615140137.21186-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615140137.21186-1-patrick.delaunay@st.com>
References: <20200615140137.21186-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_03:2020-06-15,
 2020-06-15 signatures=0
Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Anup Patel <Anup.Patel@wdc.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ramon Fried <rfried.dev@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v4 1/4] cmd: env: add option for quiet output
	on env info
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
Reviewed-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 cmd/Kconfig  |  1 +
 cmd/nvedit.c | 26 +++++++++++++++++++-------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index 192b3b262f..1de57988ae 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -607,6 +607,7 @@ config CMD_NVEDIT_INFO
 	  This command can be optionally used for evaluation in scripts:
 	  [-d] : evaluate whether default environment is used
 	  [-p] : evaluate whether environment can be persisted
+	  [-q] : quiet output
 	  The result of multiple evaluations will be combined with AND.
 
 endmenu
diff --git a/cmd/nvedit.c b/cmd/nvedit.c
index 49338b4d36..68cb1a4a8f 100644
--- a/cmd/nvedit.c
+++ b/cmd/nvedit.c
@@ -1224,12 +1224,15 @@ static int print_env_info(void)
  * env info - display environment information
  * env info [-d] - evaluate whether default environment is used
  * env info [-p] - evaluate whether environment can be persisted
+ *      Add [-q] - quiet mode, use only for command result, for test by example:
+ *                 test env info -p -d -q
  */
 static int do_env_info(struct cmd_tbl *cmdtp, int flag,
 		       int argc, char *const argv[])
 {
 	int eval_flags = 0;
 	int eval_results = 0;
+	bool quiet = false;
 
 	/* display environment information */
 	if (argc <= 1)
@@ -1247,6 +1250,9 @@ static int do_env_info(struct cmd_tbl *cmdtp, int flag,
 			case 'p':
 				eval_flags |= ENV_INFO_IS_PERSISTED;
 				break;
+			case 'q':
+				quiet = true;
+				break;
 			default:
 				return CMD_RET_USAGE;
 			}
@@ -1256,20 +1262,24 @@ static int do_env_info(struct cmd_tbl *cmdtp, int flag,
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
 #if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
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
 
@@ -1326,7 +1336,7 @@ static struct cmd_tbl cmd_env_sub[] = {
 	U_BOOT_CMD_MKENT(import, 5, 0, do_env_import, "", ""),
 #endif
 #if defined(CONFIG_CMD_NVEDIT_INFO)
-	U_BOOT_CMD_MKENT(info, 2, 0, do_env_info, "", ""),
+	U_BOOT_CMD_MKENT(info, 3, 0, do_env_info, "", ""),
 #endif
 	U_BOOT_CMD_MKENT(print, CONFIG_SYS_MAXARGS, 1, do_env_print, "", ""),
 #if defined(CONFIG_CMD_RUN)
@@ -1405,8 +1415,10 @@ static char env_help_text[] =
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
