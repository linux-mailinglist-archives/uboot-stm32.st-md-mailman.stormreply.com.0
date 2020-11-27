Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 588C02C62EF
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 11:21:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2057CC56633;
	Fri, 27 Nov 2020 10:21:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FB5DC56634
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 10:21:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARAII8P019318; Fri, 27 Nov 2020 11:21:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=E2m0bn4TrcdVs6t/kNZurzG31/GKYaWpagQ0cGElsp0=;
 b=uHt6RprS8gOwG+mM6pffZ6wOUPCVIkMs+Rb2c1ym19eo29iy77Lzv9Xsn1z61IzFRTiX
 oGjDY6JTFeBD4B5g+oUj1Ul5P+emoTXP+pD2BRCiHWXfX99jbUA8fJXeWNfzJX+9HoLc
 xNn5LrPJN1L6JKeOLae6ViISDSMBD4CvUEQlqza7nqS9jZMAMgmtiiJsMKVEfzy9/I2H
 LGCpDACvarA8mddnzIhUa6FilEe2VzY2XU8KK6/URWR6AIs/eOo+kP8KH0WEbgBlfHo0
 rxx8onu6Xs/kpP/WuparG01hPbanYrnEoH86G/X4CGTEvP1POx1esA62zyxNKOgO7A3O qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01d1xau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 11:21:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC809100034;
 Fri, 27 Nov 2020 11:21:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ABB1F238DF0;
 Fri, 27 Nov 2020 11:21:10 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov 2020 11:21:10
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Nov 2020 11:20:56 +0100
Message-ID: <20201127102100.11721-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201127102100.11721-1-patrick.delaunay@st.com>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_05:2020-11-26,
 2020-11-27 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH v2 6/9] console: remove duplicated test on gd
	value
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

Reorder test on gd value and remove the duplicated test (!gd)
in putc and puts function.

This patch is a preliminary step for rework of this function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- update gd test in console function puts and putc (cosmetic)

 common/console.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/common/console.c b/common/console.c
index 3348436da6..70579af042 100644
--- a/common/console.c
+++ b/common/console.c
@@ -517,22 +517,22 @@ static inline void print_pre_console_buffer(int flushpoint) {}
 
 void putc(const char c)
 {
+	if (!gd)
+		return;
 #ifdef CONFIG_SANDBOX
 	/* sandbox can send characters to stdout before it has a console */
-	if (!gd || !(gd->flags & GD_FLG_SERIAL_READY)) {
+	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
 		os_putc(c);
 		return;
 	}
 #endif
 #ifdef CONFIG_DEBUG_UART
 	/* if we don't have a console yet, use the debug UART */
-	if (!gd || !(gd->flags & GD_FLG_SERIAL_READY)) {
+	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
 		printch(c);
 		return;
 	}
 #endif
-	if (!gd)
-		return;
 #ifdef CONFIG_CONSOLE_RECORD
 	if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
 		membuff_putbyte((struct membuff *)&gd->console_out, c);
@@ -565,15 +565,17 @@ void putc(const char c)
 
 void puts(const char *s)
 {
+	if (!gd)
+		return;
 #ifdef CONFIG_SANDBOX
 	/* sandbox can send characters to stdout before it has a console */
-	if (!gd || !(gd->flags & GD_FLG_SERIAL_READY)) {
+	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
 		os_puts(s);
 		return;
 	}
 #endif
 #ifdef CONFIG_DEBUG_UART
-	if (!gd || !(gd->flags & GD_FLG_SERIAL_READY)) {
+	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
 		while (*s) {
 			int ch = *s++;
 
@@ -582,8 +584,6 @@ void puts(const char *s)
 		return;
 	}
 #endif
-	if (!gd)
-		return;
 #ifdef CONFIG_CONSOLE_RECORD
 	if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
 		membuff_put((struct membuff *)&gd->console_out, s, strlen(s));
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
