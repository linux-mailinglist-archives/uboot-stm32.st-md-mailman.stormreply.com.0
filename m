Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 974C82CD25E
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Dec 2020 10:20:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FE47C56636;
	Thu,  3 Dec 2020 09:20:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26544C56635
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Dec 2020 09:20:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B397sBU006045; Thu, 3 Dec 2020 10:20:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=WECbQwB9kRgmWcVxcT4NTTN6rrb6d+PRrxPj/UGBAWI=;
 b=s3V79CY5gjl3wB2ZeoZ+HOL/3gWwbokVKOg8uuNPx2QRUb0eF8kMCqeFffzuZpGK3Io2
 HnjUuGUgfdm1rgkJHBlb4p18K+oUvG2jTGOs9a9i3GH2OKqIwApqdAAQkP2/fCGNWD/j
 XyQ34QI4TwLgz54pONKb2uqANvt+RVr0OT2JCKOfDwSlsQWpsZJZal54PPLGzIOKfxa4
 ntkizXIWYg61p5QhvxgCxhqxo2LJNiYbVka+YWtH3NnDnIxsvPA3Oqln9PD4q8zFhjI4
 ptAY221CJZgcem5GH+mpITJrKpy/bSq79YOfx/cz1oJjheKN6EcDyLMQBERWZF5jWGTB zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3hfqe4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 10:20:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41D65100034;
 Thu,  3 Dec 2020 10:20:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 344CF23F6D7;
 Thu,  3 Dec 2020 10:20:39 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec 2020 10:20:38
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 3 Dec 2020 10:20:31 +0100
Message-ID: <20201203102027.4.I810a6b37da2c8aa13ca2e20408a8d54b08e2ef32@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203092032.8124-1-patrick.delaunay@st.com>
References: <20201203092032.8124-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_06:2020-12-03,
 2020-12-03 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH 4/4] console: add console_tstc_check helper
	function for CONSOLE_MUX
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

Add the helper function console_tstc_check() and replace the test
#if CONFIG_IS_ENABLED(CONSOLE_MUX) to a simple if to respect the
U-Boot coding rule.

No functional change.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 common/console.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/common/console.c b/common/console.c
index 0b864444bb..c570cd88cf 100644
--- a/common/console.c
+++ b/common/console.c
@@ -248,6 +248,12 @@ static int console_getc(int file)
 	return ret;
 }
 
+/*  Upper layer may have already called tstc(): check the saved result */
+static bool console_tstc_check(void)
+{
+	return !!tstcdev;
+}
+
 static int console_tstc(int file)
 {
 	int i, ret;
@@ -340,6 +346,11 @@ static inline int console_getc(int file)
 	return stdio_devices[file]->getc(stdio_devices[file]);
 }
 
+static bool console_tstc_check(void)
+{
+	return false;
+}
+
 static inline int console_tstc(int file)
 {
 	return stdio_devices[file]->tstc(stdio_devices[file]);
@@ -397,18 +408,19 @@ int fgetc(int file)
 		 */
 		for (;;) {
 			WATCHDOG_RESET();
-#if CONFIG_IS_ENABLED(CONSOLE_MUX)
-			/*
-			 * Upper layer may have already called tstc() so
-			 * check for that first.
-			 */
-			if (tstcdev != NULL)
-				return console_getc(file);
-			console_tstc(file);
-#else
-			if (console_tstc(file))
-				return console_getc(file);
-#endif
+			if (CONFIG_IS_ENABLED(CONSOLE_MUX)) {
+				/*
+				 * Upper layer may have already called tstc() so
+				 * check for that first.
+				 */
+				if (console_tstc_check())
+					return console_getc(file);
+				console_tstc(file);
+			} else {
+				if (console_tstc(file))
+					return console_getc(file);
+			}
+
 			/*
 			 * If the watchdog must be rate-limited then it should
 			 * already be handled in board-specific code.
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
