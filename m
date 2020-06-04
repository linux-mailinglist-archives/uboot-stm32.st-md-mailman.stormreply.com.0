Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B47BE1EE467
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 14:30:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 474C2C36B0D
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 12:30:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F3C0C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2020 12:30:38 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 054CDTrJ023396; Thu, 4 Jun 2020 14:30:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=nf0kg8i4vZQ2LblyoWvSJ0CiPQuPYiUSxtBvsd8nW18=;
 b=tbKpW11+LabSucHVmYiJANkGDHEud5ahyG/j/7ummQsAXHeBs7So1IMfZXA7EDBE1NuX
 es97kOpel2m63vn38VPtHlR8869zHy9PH2PON/bByEGlt1c1ZUweQQbY2Oc82N6hZiOK
 i12nUr2vGw8j2BLxzqKpBielsHQbdeBXWekQJxRSdYesVMXUbG97zAeTXYPiPRoFQA5m
 UBfKn9WwaLWvKp5/og60u261ZkKa2m0ROyydiaCRYvr70Y4uPftf5b+OReWZdrnIbe4i
 niLjYT89+A+ai4SD/YDTsamtDVWDkZQ2rvn7NOGlJZo+QOhrp5pCoNlg4exE/Poieu1a 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31bd8wa67g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 14:30:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA54A100034;
 Thu,  4 Jun 2020 14:30:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C192B2BE22B;
 Thu,  4 Jun 2020 14:30:36 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 4 Jun 2020 14:30:36 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Jun 2020 14:30:24 +0200
Message-ID: <20200604123033.25499-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604123033.25499-1-patrick.delaunay@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_10:2020-06-02,
 2020-06-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 02/11] board: stm32mp1: update the gpio hog
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

This patch updates the current gpio hog implementation and uses
the new API gpio_hog_probe_all(), activated with CONFIG_GPIO_HOG.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 board/st/stm32mp1/stm32mp1.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 4553329b25..f4a032f781 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -664,17 +664,11 @@ static void board_ev1_init(void)
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
