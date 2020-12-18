Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E327E2DE21B
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Dec 2020 12:42:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7F9BC57182;
	Fri, 18 Dec 2020 11:42:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3E19C5717E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 11:42:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BIBfBJ4020383; Fri, 18 Dec 2020 12:42:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=OrzPRcBIISqwahVb20iv6lllqHCkczA+s6E7drI2Ono=;
 b=Mb4ThEC6FE8ehFeyDVfwCZ5xca9Pp8ygswAOIyVz3UlWSl5YZ+UPBwrjEcLXOHAfw9V7
 IAP4cJLPvDFNCYisgz1ASjrBilsPYfjvjv6FGZ56naW63AP6PzcGUjcuADjb0++MWkjV
 NqolvZ7RTQyAEDMwZZZO+vJkU6sdTxVZNRzvQHqTIoqNSuq0gRLg1h7Rnf9Td9F29zlg
 0V4+g3AQuGCYoe0xnwoW48lRTwYVQSR8FPUUdy8/2GPLJC6c9Yizd5HSl3MuX3YQxxd8
 Va1OLWJtP/sONbKITBb52jhC5uYzDf1T8akk7Ck2wBEdhi6+ASvtpoyLsiKDpWpZ/fxM 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cpt9sh0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 12:42:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4218B10002A;
 Fri, 18 Dec 2020 12:42:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3258423FF0F;
 Fri, 18 Dec 2020 12:42:23 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Dec 2020 12:42:22
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 18 Dec 2020 12:42:17 +0100
Message-ID: <20201218124142.v2.4.I810a6b37da2c8aa13ca2e20408a8d54b08e2ef32@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201218114217.9309-1-patrick.delaunay@foss.st.com>
References: <20201218114217.9309-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_06:2020-12-18,
 2020-12-18 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH v2 4/4] console: add console_tstc_check helper
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

From: Patrick Delaunay <patrick.delaunay@st.com>

Add the helper function console_tstc_check() and replace the test
#if CONFIG_IS_ENABLED(CONSOLE_MUX) to a simple if to respect the
U-Boot coding rule.

No functional change.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- add comment for tstcdev variable
- rename console_tstc_check to console_has_tstc

 common/console.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/common/console.c b/common/console.c
index 295c10f242..e82b5d2075 100644
--- a/common/console.c
+++ b/common/console.c
@@ -231,6 +231,7 @@ static bool console_dev_is_serial(struct stdio_dev *sdev)
 #if CONFIG_IS_ENABLED(CONSOLE_MUX)
 /** Console I/O multiplexing *******************************************/
 
+/* tstcdev: save the last stdio device with pending characters, with tstc != 0 */
 static struct stdio_dev *tstcdev;
 struct stdio_dev **console_devices[MAX_FILES];
 int cd_count[MAX_FILES];
@@ -256,6 +257,12 @@ static int console_getc(int file)
 	return ret;
 }
 
+/*  Upper layer may have already called tstc(): check the saved result */
+static bool console_has_tstc(void)
+{
+	return !!tstcdev;
+}
+
 static int console_tstc(int file)
 {
 	int i, ret;
@@ -348,6 +355,11 @@ static inline int console_getc(int file)
 	return stdio_devices[file]->getc(stdio_devices[file]);
 }
 
+static bool console_has_tstc(void)
+{
+	return false;
+}
+
 static inline int console_tstc(int file)
 {
 	return stdio_devices[file]->tstc(stdio_devices[file]);
@@ -405,18 +417,19 @@ int fgetc(int file)
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
+				if (console_has_tstc())
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
