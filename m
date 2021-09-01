Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC743FD754
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Sep 2021 12:02:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1CA7C5A4F3;
	Wed,  1 Sep 2021 10:02:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D487C58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Sep 2021 10:02:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1819APBS002245;
 Wed, 1 Sep 2021 12:02:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=Tr9q5Lo+2bCc26+YPw3Hvx95X0x+Zcq/BrhetV5+Uzc=;
 b=kiwMNHJQRwR9W+j4vX1bVP02pBHG3wk0pkEQwkjWs5y7QFRKFBX0GEodMhyOCE1xY53j
 7VxykcxWMcZuYX1Z1acVEnQ6t/uxH9DapWjaSJQRblwHHl4D5iDXEhmcoftQEwd0Iz9U
 VmjFkklHkRxuOIGRu0YoWOnObGemGLM7r6tRdqvl5KbQqFdY4+H/678c3cD1bE0YvV6z
 rvQxG4FVbO5PJGTI2QyvFuehJ0/usJEYUd6ce66pwYviI2MdxgRao36kQ8+uvuag3Haz
 KGi6gMMIgZmcor7tVkWd4usZhBnpeko8IXWKItrxmVJG3hEYQaZZZ85vOKXgI4377m7l bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3at101ax3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 12:02:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 790051000FA;
 Wed,  1 Sep 2021 11:51:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B09321A22E;
 Wed,  1 Sep 2021 11:51:47 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep 2021 11:51:46
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 1 Sep 2021 11:51:42 +0200
Message-ID: <20210901095143.4143-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-01_03,2021-08-31_01,2020-04-07_01
Cc: Simon Glass <sjg@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Manuel Reis <mluis.reis@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/2] board: stm32mp1: Remove
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
---

 board/st/stm32mp1/stm32mp1.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 032f08d795..b5500399e6 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -649,9 +649,6 @@ int board_init(void)
 	/* address of boot parameters */
 	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
 
-	if (CONFIG_IS_ENABLED(DM_GPIO_HOG))
-		gpio_hog_probe_all();
-
 	board_key_check();
 
 	if (board_is_ev1())
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
