Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 463CB2CD260
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Dec 2020 10:20:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12E30C56635;
	Thu,  3 Dec 2020 09:20:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B720BC56637
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Dec 2020 09:20:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B397i7T005962; Thu, 3 Dec 2020 10:20:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=a4Ut/s6FhEF9rF88SZ6qS+yBt2AE/KMWZqfz34Qg7pY=;
 b=ArQU05kELg4j1Wje8X1U/9dfe0ronfBr7C4nTHiQ2aBhljgl/H1q3uC0rjscn5elg2bL
 FjuTNhQEe38OI+DaPBWgxIhT+6WCUEqcgNgZzQ/Pjw5s27+b9QtqyiRsrWpGaNrnsSmj
 l+xeCeO5nwadv/MtaKFDwNDTtyBlgVHkniwv+14CbaMkbsqpt/S7wO42ASS4jDfkVs/e
 Cps7wo8J+hgPcvUOcTmthMFxMNNSbeTrve518hfNCkhvl1cTOJTXfawiz/uGvpnFew2Q
 o2N1/ikwq6V1LELbQcLjgKug0HoZkVKvpB7Hz4Stac+yoFlsAM4Ey7xqQTLAZqMBIk1A 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3hfqdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 10:20:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 872BA10002A;
 Thu,  3 Dec 2020 10:20:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 77B1823F6D5;
 Thu,  3 Dec 2020 10:20:37 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec 2020 10:20:37
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 3 Dec 2020 10:20:29 +0100
Message-ID: <20201203102027.2.Icd4f9239c00329a77c50bc0c42b3638c744ea955@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203092032.8124-1-patrick.delaunay@st.com>
References: <20201203092032.8124-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_06:2020-12-03,
 2020-12-03 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH 2/4] console: add function console_devices_set
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

Add a new function to access to console_devices only defined if
CONFIG_IS_ENABLED(CONSOLE_MUX).

This path allows to remove #if CONFIG_IS_ENABLED(CONSOLE_MUX)
in console_getc function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 common/console.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/common/console.c b/common/console.c
index 6fc3957024..9a63eaa664 100644
--- a/common/console.c
+++ b/common/console.c
@@ -177,6 +177,11 @@ static struct stdio_dev *tstcdev;
 struct stdio_dev **console_devices[MAX_FILES];
 int cd_count[MAX_FILES];
 
+static void __maybe_unused console_devices_set(int file, struct stdio_dev *dev)
+{
+	console_devices[file][0] = dev;
+}
+
 /*
  * This depends on tstc() always being called before getchar().
  * This is guaranteed to be true because this routine is called
@@ -275,6 +280,11 @@ static inline void console_doenv(int file, struct stdio_dev *dev)
 }
 #endif
 #else
+
+static void __maybe_unused console_devices_set(int file, struct stdio_dev *dev)
+{
+}
+
 static inline int console_getc(int file)
 {
 	return stdio_devices[file]->getc(stdio_devices[file]);
@@ -961,18 +971,14 @@ int console_init_r(void)
 	if (outputdev != NULL) {
 		console_setfile(stdout, outputdev);
 		console_setfile(stderr, outputdev);
-#if CONFIG_IS_ENABLED(CONSOLE_MUX)
-		console_devices[stdout][0] = outputdev;
-		console_devices[stderr][0] = outputdev;
-#endif
+		console_devices_set(stdout, outputdev);
+		console_devices_set(stderr, outputdev);
 	}
 
 	/* Initializes input console */
 	if (inputdev != NULL) {
 		console_setfile(stdin, inputdev);
-#if CONFIG_IS_ENABLED(CONSOLE_MUX)
-		console_devices[stdin][0] = inputdev;
-#endif
+		console_devices_set(stdin, inputdev);
 	}
 
 	if (!IS_ENABLED(CONFIG_SYS_CONSOLE_INFO_QUIET))
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
