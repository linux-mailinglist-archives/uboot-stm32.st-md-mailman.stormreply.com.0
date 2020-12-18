Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C02862DE22F
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Dec 2020 12:46:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75C82C5717F;
	Fri, 18 Dec 2020 11:46:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B1B3C5717E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 11:46:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BIBbsHk014131; Fri, 18 Dec 2020 12:46:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=6+j4++KxPHczwJHaVqRwPW2wXSENGynm89sPxdIdYQ0=;
 b=2m7KQTAsI0XZzqXdxLjGiZ1wXAAFkX4Z/5PaYySyBQKvlnWrrT29Qgi/41umRenZycB0
 jd0tZvRFCQy0ps88iy+uREo7roAKTLQALWWZJawpgdWW9J0FPmHEUAjl8qbhkdhaxMQG
 EE67J45iuLhwjXUMUfqKFj6Msi6QLg/BDjALBK0g6v+bflZ60V7G5EvKOasKgdnW3UUk
 3sg/6QdLdSNrOec+tzLsHxlx6WzUhIRsnU46sS72nI7xwvn3uJigooGhUplwfC9GWjEF
 tbFPhg3DR25lF7Ave2G6scKH881aFqaJ0LLFNNGofpyQtuGFbFgeUQ3f1fz3yRoGHzBb rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cq03e73v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 12:46:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8625110002A;
 Fri, 18 Dec 2020 12:46:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B0CA23FF1F;
 Fri, 18 Dec 2020 12:46:51 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Dec 2020 12:46:51
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 18 Dec 2020 12:46:45 +0100
Message-ID: <20201218124642.v3.3.I3e15d39becc5c180a3be52571bb570e29c6b4cd0@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
References: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_06:2020-12-18,
 2020-12-18 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH v3 3/4] console: remove #ifdef
	CONFIG_CONSOLE_RECORD
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

From: Patrick Delaunay <patrick.delaunay@st.com>

Add helper functions to access to gd->console_out and gd->console_in
with membuff API and replace the #ifdef CONFIG_CONSOLE_RECORD test
by if (IS_ENABLED(CONFIG_CONSOLE_RECORD)) to respect the U-Boot
coding rule.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v2)

Changes in v2:
- move the tests on gd->flags & GD_FLG_RECORD in helper functions
- remove test on IS_ENABLED(CONFIG_CONSOLE_RECORD)
  before to call helper functions

 common/console.c | 95 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 22 deletions(-)

diff --git a/common/console.c b/common/console.c
index 036dd0358a..295c10f242 100644
--- a/common/console.c
+++ b/common/console.c
@@ -88,6 +88,64 @@ static int on_silent(const char *name, const char *value, enum env_op op,
 U_BOOT_ENV_CALLBACK(silent, on_silent);
 #endif
 
+#ifdef CONFIG_CONSOLE_RECORD
+/* helper function: access to gd->console_out and gd->console_in */
+static void console_record_putc(const char c)
+{
+	if (!(gd->flags & GD_FLG_RECORD))
+		return;
+	if  (gd->console_out.start)
+		membuff_putbyte((struct membuff *)&gd->console_out, c);
+}
+
+static void console_record_puts(const char *s)
+{
+	if (!(gd->flags & GD_FLG_RECORD))
+		return;
+	if  (gd->console_out.start)
+		membuff_put((struct membuff *)&gd->console_out, s, strlen(s));
+}
+
+static int console_record_getc(void)
+{
+	if (!(gd->flags & GD_FLG_RECORD))
+		return -1;
+	if (!gd->console_in.start)
+		return -1;
+
+	return membuff_getbyte((struct membuff *)&gd->console_in);
+}
+
+static int console_record_tstc(void)
+{
+	if (!(gd->flags & GD_FLG_RECORD))
+		return 0;
+	if (gd->console_in.start) {
+		if (membuff_peekbyte((struct membuff *)&gd->console_in) != -1)
+			return 1;
+	}
+	return 0;
+}
+#else
+static void console_record_putc(char c)
+{
+}
+
+static void console_record_puts(const char *s)
+{
+}
+
+static int console_record_getc(void)
+{
+	return -1;
+}
+
+static int console_record_tstc(void)
+{
+	return 0;
+}
+#endif
+
 #if CONFIG_IS_ENABLED(SYS_CONSOLE_IS_IN_ENV)
 /*
  * if overwrite_console returns 1, the stdin, stderr and stdout
@@ -414,21 +472,18 @@ int fprintf(int file, const char *fmt, ...)
 
 int getchar(void)
 {
+	int ch;
+
 	if (IS_ENABLED(CONFIG_DISABLE_CONSOLE) && (gd->flags & GD_FLG_DISABLE_CONSOLE))
 		return 0;
 
 	if (!gd->have_console)
 		return 0;
 
-#ifdef CONFIG_CONSOLE_RECORD
-	if (gd->console_in.start) {
-		int ch;
+	ch = console_record_getc();
+	if (ch != -1)
+		return ch;
 
-		ch = membuff_getbyte((struct membuff *)&gd->console_in);
-		if (ch != -1)
-			return 1;
-	}
-#endif
 	if (gd->flags & GD_FLG_DEVINIT) {
 		/* Get from the standard input */
 		return fgetc(stdin);
@@ -445,12 +500,10 @@ int tstc(void)
 
 	if (!gd->have_console)
 		return 0;
-#ifdef CONFIG_CONSOLE_RECORD
-	if (gd->console_in.start) {
-		if (membuff_peekbyte((struct membuff *)&gd->console_in) != -1)
-			return 1;
-	}
-#endif
+
+	if (console_record_tstc())
+		return 1;
+
 	if (gd->flags & GD_FLG_DEVINIT) {
 		/* Test the standard input */
 		return ftstc(stdin);
@@ -521,10 +574,9 @@ void putc(const char c)
 {
 	if (!gd)
 		return;
-#ifdef CONFIG_CONSOLE_RECORD
-	if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
-		membuff_putbyte((struct membuff *)&gd->console_out, c);
-#endif
+
+	console_record_putc(c);
+
 	/* sandbox can send characters to stdout before it has a console */
 	if (IS_ENABLED(CONFIG_SANDBOX) && !(gd->flags & GD_FLG_SERIAL_READY)) {
 		os_putc(c);
@@ -563,10 +615,9 @@ void puts(const char *s)
 {
 	if (!gd)
 		return;
-#ifdef CONFIG_CONSOLE_RECORD
-	if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
-		membuff_put((struct membuff *)&gd->console_out, s, strlen(s));
-#endif
+
+	console_record_puts(s);
+
 	/* sandbox can send characters to stdout before it has a console */
 	if (IS_ENABLED(CONFIG_SANDBOX) && !(gd->flags & GD_FLG_SERIAL_READY)) {
 		os_puts(s);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
