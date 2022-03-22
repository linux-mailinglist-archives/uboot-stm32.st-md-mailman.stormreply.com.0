Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 518C94E43EC
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Mar 2022 17:08:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB24AC5EC6B;
	Tue, 22 Mar 2022 16:08:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA947C5EC47
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Mar 2022 16:08:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22MFnQhK031391;
 Tue, 22 Mar 2022 17:08:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=dFCo5Z1JItbBFqN1pcI1M0kMugR3dyi540ygQBVvWn4=;
 b=A7xPhxbZSeVhYMM4nu2lmtboTaNkctGmhZNxmUPeOme9e4qhp3YxEI89+rebmLpI582n
 2VqYbeAmERDWDusZDguEU7INhrxlCaHz30GTljHS7joPAcboj56MV2XGqwqpS4hFNQte
 spQbGXgBTLheYNukoEBEK0hYmYVzKZsWnoWmIN+ZrgL0GtxwD2qmuppvEz5a68XBG5ji
 l3RUyAnMiG8zFPq4Mcuu5sKkZl2Rz3K06as5DAv4EkV02mn1+NKLq+cI7Opq6zYQx6bw
 SFn9MYWATHbSSGH0cJcKc62QVTxvuy1nKtJ5OHb0FYUCr/qaxA8uTHxyoHvY0Qnerpaj XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ew6xkc2t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 17:08:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6077410002A;
 Tue, 22 Mar 2022 17:08:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 590C223153A;
 Tue, 22 Mar 2022 17:08:45 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 22 Mar 2022 17:08:45
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 22 Mar 2022 17:08:43 +0100
Message-ID: <20220322170840.v2.1.I87cd34696829974a97e4eae53f9652577d6e2e4b@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_07,2022-03-22_01,2022-02-23_01
Cc: Artem Lapkin <email2tema@gmail.com>, Zhaofeng Li <hello@zhaofeng.li>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v2] cmd: pxe_utils: sysboot: replace cls
	command by video_clear in PXE parser
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

Since the commit bfaa51dd4adf ("cmd: add serial console support
for the cls command") the cls command is not enough to clear the
video display when ANSI console is activated.

This patch clears the video device with the video_clear() API
before to display the bitmap used for the PXE background.

This patch avoids to display the LOGO, activated by default with
commit 7a8555d87136 ("video: Show the U-Boot logo by default").

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
I let a patman warning:

boot/pxe_utils.c:1520: warning: Use 'if (IS_ENABLED(CONFIG...))'
                       instead of '#if or #ifdef' where possible


To avoid parameter issue for video_clear(dev) function:
no parameter dev when CONFIG_DM_VIDEO is deactivated.


Changes in v2:
- move #include <dm.h> to avoid compilation issue when CONFIG_DM_RNG
  is not activated for uclass_first_device_err
- Avoid error too many arguments to function 'video_clear'
  when CONFIG_DM_VIDEO is not activated, use: #if defined(CONFIG_DM_VIDEO)

 boot/pxe_utils.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/boot/pxe_utils.c b/boot/pxe_utils.c
index 0c24becae3..b08aee9896 100644
--- a/boot/pxe_utils.c
+++ b/boot/pxe_utils.c
@@ -6,6 +6,7 @@
 
 #include <common.h>
 #include <command.h>
+#include <dm.h>
 #include <env.h>
 #include <image.h>
 #include <log.h>
@@ -14,6 +15,7 @@
 #include <lcd.h>
 #include <net.h>
 #include <fdt_support.h>
+#include <video.h>
 #include <linux/libfdt.h>
 #include <linux/string.h>
 #include <linux/ctype.h>
@@ -21,7 +23,6 @@
 #include <linux/list.h>
 
 #ifdef CONFIG_DM_RNG
-#include <dm.h>
 #include <rng.h>
 #endif
 
@@ -1516,8 +1517,13 @@ void handle_pxe_menu(struct pxe_context *ctx, struct pxe_menu *cfg)
 		/* display BMP if available */
 		if (cfg->bmp) {
 			if (get_relfile(ctx, cfg->bmp, image_load_addr, NULL)) {
-				if (CONFIG_IS_ENABLED(CMD_CLS))
-					run_command("cls", 0);
+#if defined(CONFIG_DM_VIDEO)
+				struct udevice *dev;
+
+				err = uclass_first_device_err(UCLASS_VIDEO, &dev);
+				if (!err)
+					video_clear(dev);
+#endif
 				bmp_display(image_load_addr,
 					    BMP_ALIGN_CENTER, BMP_ALIGN_CENTER);
 			} else {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
