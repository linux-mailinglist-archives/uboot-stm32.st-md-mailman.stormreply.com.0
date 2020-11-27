Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6932C62F1
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 11:21:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E17E9C56637;
	Fri, 27 Nov 2020 10:21:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93756C56632
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 10:21:15 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARAIIeV019306; Fri, 27 Nov 2020 11:21:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9C8FJIpZ+BZ4jWq4Iyr4iZIlVVpstOa4ikuJBXZziiU=;
 b=PWACo68YjHWUTTK2r2I8m9jyRDMvYU0/+28ijA8epPQu3vsH7fwFCeS+FwEQ24cLUqyu
 S+UCG5kbUM6cdXakSxST8XD7D1tGfg5+0NbN0iA55dI+ZD95qiEOjoWrojgr0ulE66Ax
 eWJ5FPA7xXOWZmct4sWxGNyrDh1y6pK7hLNN2duAxlu79SHzFDTHnuuEwYd0pTdDp0ae
 GMzs/XrnJHafZViDT64qNE5KYOEagpw7FJCb6lWjEMG+8tJMYIlca9YZY4AxFkzit77f
 IU1jaV7VuuB3XrK5oOeVPXYUqXykg+Hy3ivTRy/dk3n399v3NKqEF/Ouw4FGAgd9KAtz Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01d1xaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 11:21:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9249C100034;
 Fri, 27 Nov 2020 11:21:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 850EF238DF9;
 Fri, 27 Nov 2020 11:21:11 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov 2020 11:21:10
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Nov 2020 11:20:57 +0100
Message-ID: <20201127102100.11721-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201127102100.11721-1-patrick.delaunay@st.com>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_05:2020-11-26,
 2020-11-27 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH v2 7/9] console: allow to record console
	output before ready
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

Allow to record the console output before before U-Boot
has a console ready.

This patch allows to test the console output in sandbox test
based on console record.

It is possible because GD_FLG_RECORD and GD_FLG_SERIAL_READY
are 2 independent flags.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- Record all messages in console, even when dropped (NEW)

 common/console.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/common/console.c b/common/console.c
index 70579af042..c3d552bb3e 100644
--- a/common/console.c
+++ b/common/console.c
@@ -519,6 +519,10 @@ void putc(const char c)
 {
 	if (!gd)
 		return;
+#ifdef CONFIG_CONSOLE_RECORD
+	if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
+		membuff_putbyte((struct membuff *)&gd->console_out, c);
+#endif
 #ifdef CONFIG_SANDBOX
 	/* sandbox can send characters to stdout before it has a console */
 	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
@@ -533,10 +537,6 @@ void putc(const char c)
 		return;
 	}
 #endif
-#ifdef CONFIG_CONSOLE_RECORD
-	if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
-		membuff_putbyte((struct membuff *)&gd->console_out, c);
-#endif
 #ifdef CONFIG_SILENT_CONSOLE
 	if (gd->flags & GD_FLG_SILENT) {
 		if (!(gd->flags & GD_FLG_DEVINIT))
@@ -567,6 +567,10 @@ void puts(const char *s)
 {
 	if (!gd)
 		return;
+#ifdef CONFIG_CONSOLE_RECORD
+	if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
+		membuff_put((struct membuff *)&gd->console_out, s, strlen(s));
+#endif
 #ifdef CONFIG_SANDBOX
 	/* sandbox can send characters to stdout before it has a console */
 	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
@@ -584,10 +588,6 @@ void puts(const char *s)
 		return;
 	}
 #endif
-#ifdef CONFIG_CONSOLE_RECORD
-	if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
-		membuff_put((struct membuff *)&gd->console_out, s, strlen(s));
-#endif
 #ifdef CONFIG_SILENT_CONSOLE
 	if (gd->flags & GD_FLG_SILENT) {
 		if (!(gd->flags & GD_FLG_DEVINIT))
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
