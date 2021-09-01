Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 644403FD773
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Sep 2021 12:15:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1655CC58D58;
	Wed,  1 Sep 2021 10:15:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A34BC0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Sep 2021 10:15:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1818Xa4g003232;
 Wed, 1 Sep 2021 12:15:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=KdDdj50X6N0Boq9KZPJq0UJ7k630I4btInL6af9apL4=;
 b=ZP+pavS3uC/YHHHnF53wch6U2GKDwNshvFSk1ca3AGDPY35N1RLfi07jbqgd5K6Varq7
 khPttNB99nT4IfkHQj+NAUGPhT/LmXRtjSgiU7sgTTr4O6jTISZsazzAg4rZIcc47B+E
 /Vy4E6UjefIJ1fhVIZCFjyba46PzAcq8fDjR1vbuHnt0ws8D85CTS9y8GVCo0f+Mv4HR
 a84F906+Slxu7OTirp5CwN/dFL8KU/Hm4vReP8PlH4VHyvocnUfg32Hk8nHL+7swMNdY
 dFpaKW/u0cspaJGS+v5waAYzSEQ9fdI3Kyfq2Z/pfeFSykhXEaBWVOoGeA/p16p7KWwx sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3asyb9beeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 12:15:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E7691000FE;
 Wed,  1 Sep 2021 11:51:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24F1A21A22E;
 Wed,  1 Sep 2021 11:51:48 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep 2021 11:51:47
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 1 Sep 2021 11:51:43 +0200
Message-ID: <20210901095143.4143-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210901095143.4143-1-patrice.chotard@foss.st.com>
References: <20210901095143.4143-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-01_03,2021-09-01_01,2020-04-07_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Marek Vasut <marex@denx.de>
Subject: [Uboot-stm32] [PATCH 2/2] board: dh_stm32mp1: Remove
	gpio_hog_probe_all() from board
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

DM_GPIO_HOG flag has been replaced by GPIO_HOG flag since a while in
commit 49b10cb49262 ("gpio: fixes for gpio-hog support").

And furthermore, gpio_hog_probe_all() is already called in board_r.c.
So gpio_hog_probe() can be removed from stm32mp1.c.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>
---

 board/dhelectronics/dh_stm32mp1/board.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index d7c1857c16..725b438d76 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -593,9 +593,6 @@ int board_init(void)
 	/* address of boot parameters */
 	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
 
-	if (CONFIG_IS_ENABLED(DM_GPIO_HOG))
-		gpio_hog_probe_all();
-
 	board_key_check();
 
 #ifdef CONFIG_DM_REGULATOR
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
