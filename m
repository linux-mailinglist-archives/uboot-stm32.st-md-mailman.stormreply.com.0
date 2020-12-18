Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC1B2DE231
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Dec 2020 12:46:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96289C57183;
	Fri, 18 Dec 2020 11:46:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6943C5717F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 11:46:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BIBkhdq003111; Fri, 18 Dec 2020 12:46:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=LF1HW9PvhAQP9p+2yc6r/lYj0C1qPBzx3uglh3d4Xr0=;
 b=z7dgmG2Ec00mWzoyQa/i0+58jfCOyKV3xyDg0WhSehqFAlfbsiWrcZ0UR5I1tk5HHppO
 KnjpWaG/C0IFBHZxb0M1jKR72Vo6ggiixYaQDPldD6zMrz/rBMJJpdW2jW1odHguyZ7G
 d24GTDswNFF+7df4ky+ZKCaqZKZhJsNhAhenZEisRrpPelDahCyh7cXAGpGDgqbTPf6B
 w/lCX0/ly9Vu7Ul7wpRjKTyvKrRRgvWqq9esXhNBuysl5OjS+eWmfCg4pD5x6zZlMl2E
 J7xV276y9edirNlM425SRucGpc9FG1vtXm2j6WWrsW7xoKAV78Xsa7G90O8mnRWPRbss Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cpt9shp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 12:46:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8FD6100038;
 Fri, 18 Dec 2020 12:46:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B27723FF1F;
 Fri, 18 Dec 2020 12:46:50 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Dec 2020 12:46:50
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 18 Dec 2020 12:46:44 +0100
Message-ID: <20201218124642.v3.2.Icd4f9239c00329a77c50bc0c42b3638c744ea955@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
References: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_06:2020-12-18,
 2020-12-18 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH v3 2/4] console: add function
	console_devices_set
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

Add a new function to access to console_devices only defined if
CONFIG_IS_ENABLED(CONSOLE_MUX).

This path allows to remove #if CONFIG_IS_ENABLED(CONSOLE_MUX)
in console_getc function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 common/console.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/common/console.c b/common/console.c
index d225fdd920..036dd0358a 100644
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
@@ -958,18 +968,14 @@ int console_init_r(void)
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
