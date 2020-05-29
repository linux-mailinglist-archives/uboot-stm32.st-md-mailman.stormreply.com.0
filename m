Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCFE1E83C2
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 May 2020 18:33:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15664C36B21
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 May 2020 16:33:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22C45C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2020 16:33:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04TGRl0N024353; Fri, 29 May 2020 18:33:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=1Ed6mPTC56SK72Ke/IbDnzXtYP5O9neUKgraJgH1LJE=;
 b=0wYQ3zeZT0WtKm7MoE5yAoLwTrQ5kCbOSm+P5dkCMgHsVI6vQfDigdRlWySSOHHIlD2Z
 LDX4PnntITNrhRUIORG8zjOMAeUeNbtO59FIx9rYXXkRnRiKjElgOdVqzWZoIm4b6efw
 w4Dllu4kdb6SDTdyoXKNnMiQEZcnsj7GyKYR018sKtpTPaGpukoyu1NQrwe2Y4CcR7ZF
 Nb9JcMeGsB0zDi/wVk+BxoHA6jvU2rtIQM3likurjsI5Txn7LJAOGscX6622DvdE2Ksj
 bFNz5t3rjOoWDlxAzSJ0j4X2CnB32+cy24bwO5Ag053zU0NMIImRLUwM+sDaydBTif7M ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316tqhhw4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 18:33:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25A6910002A;
 Fri, 29 May 2020 18:33:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10DD22B8A19;
 Fri, 29 May 2020 18:33:27 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 29 May 2020 18:33:26 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 29 May 2020 18:33:25 +0200
Message-ID: <20200529163325.30892-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_08:2020-05-28,
 2020-05-29 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] board: dh_stm32mp1: update the gpio hog
	support
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

This patch update the current gpio hog implementation with
the new API gpio_hog_probe_all() actviated with CONFIG_GPIO_HOG.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/dhelectronics/dh_stm32mp1/board.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index 26e827bc38..ac9dc4b52c 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -513,17 +513,11 @@ static void board_init_fmc2(void)
 /* board dependent setup after realloc */
 int board_init(void)
 {
-	struct udevice *dev;
-
 	/* address of boot parameters */
 	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
 
-	/* probe all PINCTRL for hog */
-	for (uclass_first_device(UCLASS_PINCTRL, &dev);
-	     dev;
-	     uclass_next_device(&dev)) {
-		pr_debug("probe pincontrol = %s\n", dev->name);
-	}
+	if (CONFIG_IS_ENABLED(DM_GPIO_HOG))
+		gpio_hog_probe_all();
 
 	board_key_check();
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
