Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C4A2DE232
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Dec 2020 12:46:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1FB8C57185;
	Fri, 18 Dec 2020 11:46:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97902C57184
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 11:46:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BIBbfpm002900; Fri, 18 Dec 2020 12:46:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=zots2ErolWJpF8jeQuSz2JFafjBPbkoZN/7BDdt+w34=;
 b=STPo1AcknJ3lYB1hfgvxkIwRcelC1/dNFnfLXPOWxb+UpHf5AtZRvyQvMnnc4DRNmfus
 qWaEaY/5RImjc3tS8KudO3lH0utJspQ1a96/Ym+KSqELM2GK6I9cZyPjI0Ts6FwdKio0
 JLtkHioQNs3Ruub/onRpZ1psyo+z+LSlUBGsQ4gbE9r1vyZMtqcpPT5EWvYf0R+/rcx5
 r5juQjZKWZWNw8igTMs5TjXv7QKkp85Kg5wuXWBfDMTaNH0Nya3wQFP5FiNqGFI202UB
 bf2dmcpmmzCBv1PjyIdv0fE9RXsBuomtM59hskxy8jQedas5qkIF9o6AHZD6MBU/kyEP tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cpwep992-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 12:46:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6ECCF10002A;
 Fri, 18 Dec 2020 12:46:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62A7623FF1F;
 Fri, 18 Dec 2020 12:46:52 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Dec 2020 12:46:51
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 18 Dec 2020 12:46:46 +0100
Message-ID: <20201218124642.v3.4.I810a6b37da2c8aa13ca2e20408a8d54b08e2ef32@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
References: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_06:2020-12-18,
 2020-12-18 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH v3 4/4] console: add console_has_tstc helper
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

Add the helper function console_has_tstc() and replace the test
#if CONFIG_IS_ENABLED(CONSOLE_MUX) to a simple 'if' test to
respect the U-Boot coding rule.

No functional change.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v3:
- update commit message with new function name console_has_tstc

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
