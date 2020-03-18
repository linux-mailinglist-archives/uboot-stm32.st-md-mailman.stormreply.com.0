Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2A91896F6
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:25:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD18CC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:25:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25B87C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:25:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8Ic2D014430; Wed, 18 Mar 2020 09:25:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=tuxf2Loy5XGjOAGS52ONDv4/10LNLznAD0BxsdB0weg=;
 b=UagYGZXWEsYHhvUybJsHmWYdpzWGU5UWo+uC9rCWCiac0z5lB3r5V20GRNu49/TUAn3R
 4pmmD2aSgTURo2V+v9vF+rmYCGZlc7giozOMz9RERJ0I/LvksaFtYL3r7HLyGxfWKzrf
 TzfYElW1ifqxsv7d8qPU/4rjUvCeSxyuj6ZY/2U5/efUTzoQeBmeisTMPRo+f5tJRr29
 tqHl1CX7O4a+Uj/N81+1mJGSo6KMjJ1IRRSBf60mMwYtL/Zt7kcpCK161Yeb/Vt/0zIH
 awsYDSup+6mngavFVAvazZihm5UoBExpsx+Pye+eOhvYjz0hOxqYU5shw8mB23wQmg2Q 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu6xdamnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:25:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E0A67100034;
 Wed, 18 Mar 2020 09:25:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA69921CA95;
 Wed, 18 Mar 2020 09:25:22 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:25:22 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:25:01 +0100
Message-ID: <20200318082503.8025-17-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082503.8025-1-patrick.delaunay@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 16/18] stm32mp: stm32prog: enable videoconsole
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

Enable the videoconsole during the stm32prog command execution
to have information without UART.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 .../cmd_stm32prog/cmd_stm32prog.c             | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index 1769ba05f2..15bbdc2cb6 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -11,6 +11,32 @@
 
 struct stm32prog_data *stm32prog_data;
 
+static void enable_vidconsole(void)
+{
+#ifdef CONFIG_DM_VIDEO
+	char *stdname;
+	char buf[64];
+
+	stdname = env_get("stdout");
+	if (!stdname || !strstr(stdname, "vidconsole")) {
+		if (!stdname)
+			snprintf(buf, sizeof(buf), "serial,vidconsole");
+		else
+			snprintf(buf, sizeof(buf), "%s,vidconsole", stdname);
+		env_set("stdout", buf);
+	}
+
+	stdname = env_get("stderr");
+	if (!stdname || !strstr(stdname, "vidconsole")) {
+		if (!stdname)
+			snprintf(buf, sizeof(buf), "serial,vidconsole");
+		else
+			snprintf(buf, sizeof(buf), "%s,vidconsole", stdname);
+		env_set("stderr", buf);
+	}
+#endif
+}
+
 static int do_stm32prog(cmd_tbl_t *cmdtp, int flag, int argc,
 			char * const argv[])
 {
@@ -45,6 +71,8 @@ static int do_stm32prog(cmd_tbl_t *cmdtp, int flag, int argc,
 	if (argc > 4)
 		size = simple_strtoul(argv[4], NULL, 16);
 
+	enable_vidconsole();
+
 	data = (struct stm32prog_data *)malloc(sizeof(*data));
 
 	if (!data) {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
