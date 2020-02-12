Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FF415AFF5
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:38:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2363C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:38:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0AD6C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:38:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIXwmY014893; Wed, 12 Feb 2020 19:38:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=g5RLp/O9EzyJdgfOEHfnwcmbNhFQNUULspXH0l2YynE=;
 b=HzJrhPvXL6HrlckEBk22UN0WfuHEMmhJsnEDThx1iSdt5XtYXLxdoow/DijL7lLD/5d4
 6BH1ahBeG7lRy5n2uKZMpdb1xydTbyZ2n4lj8RL9DwXhmuuhf1xrWJ51Euj2POyGe0gY
 EZd5Gs3rgxYGo0rPfRdcKIwy5hOr51700COsxDL1cufL+/dVVKbdVAFnKQlYiCqZ9yWO
 l3KBCNyeoC+gAbE4vPXLnii/U6u8G3txjyScoOSmRfe2zmfen9VXYP1ouMLiRBt5Y5fh
 h+/YEY9bneieXJm7VoeVs8DhCwLtlSTF5a8WTmXzmLz71jrRM2n9I2KVLto8R6CQmUFa /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uvdqtyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:38:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1782610008D;
 Wed, 12 Feb 2020 19:37:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F8282C60AA;
 Wed, 12 Feb 2020 19:37:55 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:37:54 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:37:42 +0100
Message-ID: <20200212183744.5309-9-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183744.5309-1-patrick.delaunay@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 08/10] board: stm32mp1: display reference only
	for STMicroelectronics board
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

Display the reference MBxxxx found in OTP49
only for STMicroelectronics boards when CONFIG_CMD_STBOARD
is activated.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 76399e2d62..463248bcd7 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -101,20 +101,21 @@ int checkboard(void)
 		printf(" (%s)", fdt_compat);
 	puts("\n");
 
-	ret = uclass_get_device_by_driver(UCLASS_MISC,
-					  DM_GET_DRIVER(stm32mp_bsec),
-					  &dev);
+	if (CONFIG_IS_ENABLED(CMD_STBOARD)) {
+		ret = uclass_get_device_by_driver(UCLASS_MISC,
+						  DM_GET_DRIVER(stm32mp_bsec),
+						  &dev);
 
-	if (!ret)
-		ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
-				&otp, sizeof(otp));
-	if (ret > 0 && otp) {
-		printf("Board: MB%04x Var%d.%d Rev.%c-%02d\n",
-		       otp >> 16,
-		       (otp >> 12) & 0xF,
-		       (otp >> 4) & 0xF,
-		       ((otp >> 8) & 0xF) - 1 + 'A',
-		       otp & 0xF);
+		if (!ret)
+			ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
+					&otp, sizeof(otp));
+		if (ret > 0 && otp)
+			printf("Board: MB%04x Var%d.%d Rev.%c-%02d\n",
+			       otp >> 16,
+			       (otp >> 12) & 0xF,
+			       (otp >> 4) & 0xF,
+			       ((otp >> 8) & 0xF) - 1 + 'A',
+			       otp & 0xF);
 	}
 
 	return 0;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
