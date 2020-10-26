Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C17298854
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Oct 2020 09:32:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A18BDC35E3C;
	Mon, 26 Oct 2020 08:32:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8E6FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 08:32:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09Q8Qg0b032173; Mon, 26 Oct 2020 09:31:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=K5IHezR7jJOXoWqMbv4EqSkPe5Fmo2YjEDUCkaglXtQ=;
 b=W4+T4bL6wFEEfjmLNsUhm/0TV0S2b9oBU0zNSGJJi2QSdPpBRlKjDG5ltGc51RvBjl09
 etKccYHGWv5lczEbX/TQurTfWhQD7iV67XOugvaXTMyclPBHeLtRRn20qe5bShxNiAws
 9m+WuinbcIeGi5V9KPxBTYkSH7p51B4cx033s2ITH/jikH5ERlAYfj4JHnwx0yriRvSg
 S3/AQppz9ONZ7Gr9VJZSBYbL4+C4FyRg7uP2GlOUk8Ep39f8o4tZHjRuzcWdK9Nt/KpH
 qtqMYXwNnfSqIHtTawJXAkm2QSMTEbt7pQ8w6xKVuBomOOIf6mYQUaDMALVAJ26t2Qo2 yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccf3ah6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 09:31:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 515D6100034;
 Mon, 26 Oct 2020 09:31:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B0002B0B99;
 Mon, 26 Oct 2020 09:31:47 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Oct 2020 09:31:46
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Oct 2020 09:31:42 +0100
Message-ID: <20201026083142.6395-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026083142.6395-1-patrick.delaunay@st.com>
References: <20201026083142.6395-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_04:2020-10-26,
 2020-10-26 signatures=0
Cc: Philippe Reynes <philippe.reynes@softathome.com>,
 Holger Brunck <holger.brunck@ch.abb.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis@collabora.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Adam Ford <aford173@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [Uboot-stm32] [PATCH 2/2] cmd: Kconfig: migrate
	CONFIG_SYS_PROMPT_HUSH_PS2
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

Move CONFIG_SYS_PROMPT_HUSH_PS2 in Kconfig, depending
on CONFIG_HUSH_PARSER, and remove the default value defined
in cli_hush.c under __U_BOOT__.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 README                       | 7 -------
 cmd/Kconfig                  | 9 +++++++++
 common/cli_hush.c            | 3 ---
 scripts/config_whitelist.txt | 1 -
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/README b/README
index df824b67e7..8338e5ec21 100644
--- a/README
+++ b/README
@@ -1927,13 +1927,6 @@ The following options need to be configured:
 		try longer timeout such as
 		#define CONFIG_NFS_TIMEOUT 10000UL
 
-- Command Interpreter:
-		CONFIG_SYS_PROMPT_HUSH_PS2
-
-		This defines the secondary prompt string, which is
-		printed when the command interpreter needs more input
-		to complete a command. Usually "> ".
-
 	Note:
 
 		In the current implementation, the local variables
diff --git a/cmd/Kconfig b/cmd/Kconfig
index a3166e4f31..2c427d77b8 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -55,6 +55,15 @@ config SYS_PROMPT
 	  This string is displayed in the command line to the left of the
 	  cursor.
 
+config SYS_PROMPT_HUSH_PS2
+	string "Hush shell secondary prompt"
+	depends on HUSH_PARSER
+	default "> "
+	help
+	  This defines the secondary prompt string, which is
+	  printed when the command interpreter needs more input
+	  to complete a command. Usually "> ".
+
 config SYS_XTRACE
 	string "Command execution tracer"
 	depends on CMDLINE
diff --git a/common/cli_hush.c b/common/cli_hush.c
index 5b1f119074..79664aad58 100644
--- a/common/cli_hush.c
+++ b/common/cli_hush.c
@@ -84,9 +84,6 @@
 #include <cli.h>
 #include <cli_hush.h>
 #include <command.h>        /* find_cmd */
-#ifndef CONFIG_SYS_PROMPT_HUSH_PS2
-#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
-#endif
 #endif
 #ifndef __U_BOOT__
 #include <ctype.h>     /* isalpha, isdigit */
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index dc4f0b050c..7b5093fbfd 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -3512,7 +3512,6 @@ CONFIG_SYS_POST_WATCHDOG
 CONFIG_SYS_POST_WORD_ADDR
 CONFIG_SYS_PPC_DDR_WIMGE
 CONFIG_SYS_PQSPAR
-CONFIG_SYS_PROMPT_HUSH_PS2
 CONFIG_SYS_PSDPAR
 CONFIG_SYS_PSSR_VAL
 CONFIG_SYS_PTCPAR
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
