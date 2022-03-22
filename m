Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B424E4041
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Mar 2022 15:10:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58B38C5EC6B;
	Tue, 22 Mar 2022 14:10:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CF88C5EC47
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Mar 2022 14:10:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22MAipwb032135;
 Tue, 22 Mar 2022 15:10:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=HCV+arnZn0UA+xSv9f0d42atqXflju/v+ObomPO+SyA=;
 b=1J/Ijb6z9h7gyplHu/sXQpuF1QVGU2ibRAXIWAy6gvtllLtcgOt3r5raAMKefS+W0CFL
 rqe5OgTQCTDPxjglVDIBiD/QmCEfRVUz11fY401unFXpcBmSNtWCVmbQAbHifvBEzJUi
 tSryFV52yJ+O66j6Vs3sOUFDBno+Z/K6cDL7mkitrsV6IYuL0EYqnJNNCDIN2XUJRc6R
 qulJxhouJZ3ic7IfvqS53j0t56ajf63xUjJ5rrJvrWa/C+Mt46y520ETa4LYjqPFKOpM
 xXnhEzmfLR6Y6bipfWV2y4gLfXTT/ypr40vshQCv363DVU5Qcan8Hso2BR+UAvm3/DsY Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ew7d499ww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 15:10:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 36380100038;
 Tue, 22 Mar 2022 15:10:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2EFEB22A6C9;
 Tue, 22 Mar 2022 15:10:33 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 22 Mar 2022 15:10:32
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 22 Mar 2022 15:10:28 +0100
Message-ID: <20220322151000.1.I87cd34696829974a97e4eae53f9652577d6e2e4b@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_06,2022-03-22_01,2022-02-23_01
Cc: Artem Lapkin <email2tema@gmail.com>, Zhaofeng Li <hello@zhaofeng.li>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH] cmd: pxe_utils: sysboot: replace cls command
	by video_clear in PXE parser
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

 boot/pxe_utils.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/boot/pxe_utils.c b/boot/pxe_utils.c
index 0c24becae3..115d33b845 100644
--- a/boot/pxe_utils.c
+++ b/boot/pxe_utils.c
@@ -14,6 +14,7 @@
 #include <lcd.h>
 #include <net.h>
 #include <fdt_support.h>
+#include <video.h>
 #include <linux/libfdt.h>
 #include <linux/string.h>
 #include <linux/ctype.h>
@@ -1511,13 +1512,17 @@ void handle_pxe_menu(struct pxe_context *ctx, struct pxe_menu *cfg)
 	void *choice;
 	struct menu *m;
 	int err;
+	struct udevice *dev;
 
 	if (IS_ENABLED(CONFIG_CMD_BMP)) {
 		/* display BMP if available */
 		if (cfg->bmp) {
 			if (get_relfile(ctx, cfg->bmp, image_load_addr, NULL)) {
-				if (CONFIG_IS_ENABLED(CMD_CLS))
-					run_command("cls", 0);
+				if (IS_ENABLED(CONFIG_DM_VIDEO)) {
+					err = uclass_first_device_err(UCLASS_VIDEO, &dev);
+					if (!err)
+						video_clear(dev);
+				}
 				bmp_display(image_load_addr,
 					    BMP_ALIGN_CENTER, BMP_ALIGN_CENTER);
 			} else {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
