Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F9F2347D0
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 16:32:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DFE6C36B35
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 14:32:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA8C8C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:31:59 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VERg56024635; Fri, 31 Jul 2020 16:31:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=R29CgCefO/KzYCUBb+EARCYve6D1GhBImge6pjUvKMY=;
 b=tZtyqe20m+0nPxC7rjoFIGRAhKs4QS7M7ccgmt4WbYRi6wSxaR6IL2JTah04aQ+FzkST
 NwxPusBglrXD3wYAakyto6mAKM6au3zmzNKG0fhE5MLaip35erqA9hHUu09il9j4Xh/p
 Of9dBJoWFTIOAc4pIbs435lWmyOP3cK1Yi5IK/ZmqGHnysvESwazxzmeQEf+bxpymdVP
 Spfl62sEyqy1drcsz8QTCOHVxnEH/lZ1BDMiXAetB/E75/UtBuW53BpePV3XauxDKi4y
 2V6e3QaXe1fyZNcOo2f5TAEbMSDwqL5bqn2vVd4vtvhTOZkI1eITHmZNszZGNHKP4FSD wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9y5w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 16:31:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C1AB100034;
 Fri, 31 Jul 2020 16:31:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2EF2E2B1899;
 Fri, 31 Jul 2020 16:31:57 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 16:31:56 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 16:31:42 +0200
Message-ID: <20200731143152.8812-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_05:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 01/11] board: stm32mp1: use IS_ENABLED to
	prevent ifdef in board_key_check
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

Use IS_ENABLED to prevent ifdef in board_key_check

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 52 ++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 1d274c3157..1ad41796fb 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -135,51 +135,51 @@ int checkboard(void)
 
 static void board_key_check(void)
 {
-#if defined(CONFIG_FASTBOOT) || defined(CONFIG_CMD_STM32PROG)
 	ofnode node;
 	struct gpio_desc gpio;
 	enum forced_boot_mode boot_mode = BOOT_NORMAL;
 
+	if (!IS_ENABLED(CONFIG_FASTBOOT) && !IS_ENABLED(CONFIG_CMD_STM32PROG))
+		return;
+
 	node = ofnode_path("/config");
 	if (!ofnode_valid(node)) {
 		debug("%s: no /config node?\n", __func__);
 		return;
 	}
-#ifdef CONFIG_FASTBOOT
-	if (gpio_request_by_name_nodev(node, "st,fastboot-gpios", 0,
-				       &gpio, GPIOD_IS_IN)) {
-		debug("%s: could not find a /config/st,fastboot-gpios\n",
-		      __func__);
-	} else {
-		if (dm_gpio_get_value(&gpio)) {
-			puts("Fastboot key pressed, ");
-			boot_mode = BOOT_FASTBOOT;
-		}
+	if (IS_ENABLED(CONFIG_FASTBOOT)) {
+		if (gpio_request_by_name_nodev(node, "st,fastboot-gpios", 0,
+					       &gpio, GPIOD_IS_IN)) {
+			debug("%s: could not find a /config/st,fastboot-gpios\n",
+			      __func__);
+		} else {
+			if (dm_gpio_get_value(&gpio)) {
+				puts("Fastboot key pressed, ");
+				boot_mode = BOOT_FASTBOOT;
+			}
 
-		dm_gpio_free(NULL, &gpio);
+			dm_gpio_free(NULL, &gpio);
+		}
 	}
-#endif
-#ifdef CONFIG_CMD_STM32PROG
-	if (gpio_request_by_name_nodev(node, "st,stm32prog-gpios", 0,
-				       &gpio, GPIOD_IS_IN)) {
-		debug("%s: could not find a /config/st,stm32prog-gpios\n",
-		      __func__);
-	} else {
-		if (dm_gpio_get_value(&gpio)) {
-			puts("STM32Programmer key pressed, ");
-			boot_mode = BOOT_STM32PROG;
+	if (IS_ENABLED(CONFIG_CMD_STM32PROG)) {
+		if (gpio_request_by_name_nodev(node, "st,stm32prog-gpios", 0,
+					       &gpio, GPIOD_IS_IN)) {
+			debug("%s: could not find a /config/st,stm32prog-gpios\n",
+			      __func__);
+		} else {
+			if (dm_gpio_get_value(&gpio)) {
+				puts("STM32Programmer key pressed, ");
+				boot_mode = BOOT_STM32PROG;
+			}
+			dm_gpio_free(NULL, &gpio);
 		}
-		dm_gpio_free(NULL, &gpio);
 	}
-#endif
-
 	if (boot_mode != BOOT_NORMAL) {
 		puts("entering download mode...\n");
 		clrsetbits_le32(TAMP_BOOT_CONTEXT,
 				TAMP_BOOT_FORCED_MASK,
 				boot_mode);
 	}
-#endif
 }
 
 #if defined(CONFIG_USB_GADGET) && defined(CONFIG_USB_GADGET_DWC2_OTG)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
