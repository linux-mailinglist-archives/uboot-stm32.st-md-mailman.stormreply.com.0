Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F415805D
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 18:01:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6E00C36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 17:01:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C015BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 17:01:43 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01AGwYxo026702; Mon, 10 Feb 2020 18:01:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=1HhzIehTBHCb8a9mVpdIy7U8ytUZ9dK42QaXfzDhMJc=;
 b=sqAYpZXh1vlHflIlpZw4mQKfEGE2PdZhDj1C1tbtOWvynRWoFyhWiyKWH8ex552948nZ
 GlnJcvzGCkpVzlQdBoJHpXFSEjkQ1zUQpC5Jk4jauP8YkGxUTvr3O85ciPdmfnAFANB6
 H7VfmgVO9gf+G351OgtMWU10lznB+q04Kp/wdp64QnCO/8Uq4SOLCogFVgREdgTVtFSM
 +tOXPvsWmIcYSQN72phAsPbS2nEv8nf3kW16YyxKdDt43WxuqNHX8fVEDLw0SGIcY5TG
 p0q3mgnIhIVJEU2djR+zK21Mh0GXHYNyJfXsuHZ8QNKJbBKf/p+tugtqBP44/hGU8bow og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urguw8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 18:01:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2AFA100034;
 Mon, 10 Feb 2020 18:01:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE5FA2AC86A;
 Mon, 10 Feb 2020 18:01:32 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 10 Feb 2020 18:01:32 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 10 Feb 2020 18:01:23 +0100
Message-ID: <20200210170129.8405-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210170129.8405-1-patrick.delaunay@st.com>
References: <20200210170129.8405-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_06:2020-02-10,
 2020-02-10 signatures=0
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 1/7] cmd: env: add option for quiet output
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

Changes in v2: None

 cmd/Kconfig  |  1 +
 cmd/nvedit.c | 26 +++++++++++++++++++-------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index e6ba57035e..5c859199b6 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -591,6 +591,7 @@ config CMD_NVEDIT_INFO
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
