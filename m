Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6782CD25F
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Dec 2020 10:20:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4587C5663C;
	Thu,  3 Dec 2020 09:20:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 542D1C56635
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Dec 2020 09:20:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B397hHZ005954; Thu, 3 Dec 2020 10:20:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5ghMZ0wXbyZiUa3IN/DNYcT34r3/lt/nDmdrqozuOmY=;
 b=qivCMU6h9BMhF279NhKNU6GkMJOyzAJJgcVasuxID1q8OiKBEJ8088eLqSX/D0vtYWcU
 T+aaLhBr9Iu1VzrnNRWRXp7sMhrjOkryBQjE+IPnCop4pvC9iyDIJElZucz4EcxFJjAp
 DyrGCrFr7N7F11p4d4gxy1IM1efp19GWSSXUSLAKeyG11sjQiFxKF4q2l0+VMopkHQ8U
 q1pdkYGr3EUTlaO4wfSxL5dpPq3/hjqeH0LHlcPCh2elXEDmg6U2XbnwJMGrBKpsIrPa
 3DjRs5lVTVwpPelFsASaFwOEiz7vIr7W893nzjq1i/mscHTMRAH7hSF6tw9dMoTD1L/g lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3hfqe1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 10:20:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6AD00100038;
 Thu,  3 Dec 2020 10:20:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5CFDE23F6D5;
 Thu,  3 Dec 2020 10:20:38 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec 2020 10:20:38
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 3 Dec 2020 10:20:30 +0100
Message-ID: <20201203102027.3.I3e15d39becc5c180a3be52571bb570e29c6b4cd0@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203092032.8124-1-patrick.delaunay@st.com>
References: <20201203092032.8124-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_06:2020-12-03,
 2020-12-03 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH 3/4] console: remove #ifdef
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

Add helper functions to access to gd->console_out and gd->console_in
with membuff API and replace the #ifdef CONFIG_CONSOLE_RECORD test
by if (IS_ENABLED(CONFIG_CONSOLE_RECORD)) to respect the U-Boot
coding rule.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
# Conflicts:
#	common/console.c
---

 common/console.c | 86 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 66 insertions(+), 20 deletions(-)

diff --git a/common/console.c b/common/console.c
index 9a63eaa664..0b864444bb 100644
--- a/common/console.c
+++ b/common/console.c
@@ -88,6 +88,56 @@ static int on_silent(const char *name, const char *value, enum env_op op,
 U_BOOT_ENV_CALLBACK(silent, on_silent);
 #endif
 
+#ifdef CONFIG_CONSOLE_RECORD
+/* helper function: access to gd->console_out and gd->console_in */
+static void console_record_putc(const char c)
+{
+	if  (gd->console_out.start)
+		membuff_putbyte((struct membuff *)&gd->console_out, c);
+}
+
+static void console_record_puts(const char *s)
+{
+	if  (gd->console_out.start)
+		membuff_put((struct membuff *)&gd->console_out, s, strlen(s));
+}
+
+static int console_record_getc(void)
+{
+	if (!gd->console_in.start)
+		return -1;
+
+	return membuff_getbyte((struct membuff *)&gd->console_in);
+}
+
+static int console_record_tstc(void)
+{
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
@@ -420,15 +470,13 @@ int getchar(void)
 	if (!gd->have_console)
 		return 0;
 
-#ifdef CONFIG_CONSOLE_RECORD
-	if (gd->console_in.start) {
-		int ch;
+	if (IS_ENABLED(CONFIG_CONSOLE_RECORD)) {
+		int ch = console_record_getc();
 
-		ch = membuff_getbyte((struct membuff *)&gd->console_in);
 		if (ch != -1)
-			return 1;
+			return ch;
 	}
-#endif
+
 	if (gd->flags & GD_FLG_DEVINIT) {
 		/* Get from the standard input */
 		return fgetc(stdin);
@@ -445,12 +493,10 @@ int tstc(void)
 
 	if (!gd->have_console)
 		return 0;
-#ifdef CONFIG_CONSOLE_RECORD
-	if (gd->console_in.start) {
-		if (membuff_peekbyte((struct membuff *)&gd->console_in) != -1)
-			return 1;
-	}
-#endif
+
+	if (IS_ENABLED(CONFIG_CONSOLE_RECORD) && console_record_tstc())
+		return 1;
+
 	if (gd->flags & GD_FLG_DEVINIT) {
 		/* Test the standard input */
 		return ftstc(stdin);
@@ -521,10 +567,10 @@ void putc(const char c)
 {
 	if (!gd)
 		return;
-#ifdef CONFIG_CONSOLE_RECORD
-	if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
-		membuff_putbyte((struct membuff *)&gd->console_out, c);
-#endif
+
+	if (IS_ENABLED(CONFIG_CONSOLE_RECORD) && (gd->flags & GD_FLG_RECORD))
+		console_record_putc(c);
+
 #ifdef CONFIG_SANDBOX
 	/* sandbox can send characters to stdout before it has a console */
 	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
@@ -564,10 +610,10 @@ void puts(const char *s)
 {
 	if (!gd)
 		return;
-#ifdef CONFIG_CONSOLE_RECORD
-	if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
-		membuff_put((struct membuff *)&gd->console_out, s, strlen(s));
-#endif
+
+	if (IS_ENABLED(CONFIG_CONSOLE_RECORD) && (gd->flags & GD_FLG_RECORD))
+		console_record_puts(s);
+
 #ifdef CONFIG_SANDBOX
 	/* sandbox can send characters to stdout before it has a console */
 	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
