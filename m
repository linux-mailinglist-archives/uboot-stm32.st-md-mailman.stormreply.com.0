Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD352C6362
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 11:49:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4B22C56632;
	Fri, 27 Nov 2020 10:49:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEE04C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 10:49:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARAgblc023964; Fri, 27 Nov 2020 11:49:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=vdQtUU7TFI8atDOP5k/YU/53WTU8+TpmUInR8SsMGks=;
 b=Bp8NHIlv834H/5avJ0UiYOhAHer5U8NQWIsEhICVOkTXLWD1riWsh50/diJRGrXvdz6+
 MbAx7qUXFxGgaaRWmMPBPCFwoHydBht7TzYgsqRHl86yZD4t0zIGbqnCXY+wvQS1uP4o
 Tn3LIvuXSe4X48UM5OVmKra5rKZOt3hX6IEVU4vXvO/P6BoGMNJSzVzQ03mY7HnR3tUw
 XgD6EvminBaNJiSRjU+gQbWJZMch9Stn82JVOfBVVErKe+E65dZKaSpJlX/SFYM6K5lG
 zrSBEx0dFbkdJxOSnSqX8fu5yiy5IinUDX0EXjRRJKlg43mfZRM8VzMhVXl4GZM5bal6 rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y05ht3e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 11:49:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6774100038;
 Fri, 27 Nov 2020 11:49:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C536E23B151;
 Fri, 27 Nov 2020 11:49:38 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov 2020 11:49:38
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Nov 2020 11:49:30 +0100
Message-ID: <20201127114927.2.Ida70f4fb1524187703e9240d63e436f8ae5adaab@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201127104930.32692-1-patrick.delaunay@st.com>
References: <20201127104930.32692-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_05:2020-11-26,
 2020-11-27 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH 2/2] console: sandbox: remove unnecessary
	sandbox code
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

Remove the specific sandbox code in console.c, as the config
CONFIG_DEBUG_UART is already supported in drivers/serial/sandbox.c
and activated by default in all sandbox defconfig
(CONFIG_DEBUG_UART_SANDBOX=y and CONFIG_DEBUG_UART=y).

This patch allows to test the console code under DEBUG_UART in sandbox
and avoids to include the file <os.h> in this u-boot generic code.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 common/console.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/common/console.c b/common/console.c
index 3348436da6..11d3694159 100644
--- a/common/console.c
+++ b/common/console.c
@@ -13,7 +13,6 @@
 #include <iomux.h>
 #include <malloc.h>
 #include <mapmem.h>
-#include <os.h>
 #include <serial.h>
 #include <stdio_dev.h>
 #include <exports.h>
@@ -517,13 +516,6 @@ static inline void print_pre_console_buffer(int flushpoint) {}
 
 void putc(const char c)
 {
-#ifdef CONFIG_SANDBOX
-	/* sandbox can send characters to stdout before it has a console */
-	if (!gd || !(gd->flags & GD_FLG_SERIAL_READY)) {
-		os_putc(c);
-		return;
-	}
-#endif
 #ifdef CONFIG_DEBUG_UART
 	/* if we don't have a console yet, use the debug UART */
 	if (!gd || !(gd->flags & GD_FLG_SERIAL_READY)) {
@@ -565,13 +557,6 @@ void putc(const char c)
 
 void puts(const char *s)
 {
-#ifdef CONFIG_SANDBOX
-	/* sandbox can send characters to stdout before it has a console */
-	if (!gd || !(gd->flags & GD_FLG_SERIAL_READY)) {
-		os_puts(s);
-		return;
-	}
-#endif
 #ifdef CONFIG_DEBUG_UART
 	if (!gd || !(gd->flags & GD_FLG_SERIAL_READY)) {
 		while (*s) {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
