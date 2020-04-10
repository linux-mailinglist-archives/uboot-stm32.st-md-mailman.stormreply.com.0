Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4E91A48D6
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 19:14:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C40F4C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 17:14:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10B17C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 17:14:11 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03AGbETf004185; Fri, 10 Apr 2020 19:14:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=1hoh7bK+sLqusPHc4UiohWAZqmrBME+TYxiOASLT8hg=;
 b=yMPcfBJiKO7bF2viOoH5mPAob8bkdirZP0L3Zf62L7l1Cgq8Ma0koJ1A+sIjWv003rxe
 lg3GHoOhN7EixiLkUK/FoLqbuIipRocBTPq4McnjXbCYCGVDAS82qN5dMwPOccCkG7Po
 iTCtkqKEUFsF9mteBuSQm+mTPX8cqDYc0eKwBnR8V+RH0PEO9r4CB160ZbErkc/JwF7q
 ouroQJPzCWfFBFyhrYbixhdmmWdHhLQGIWSzbh2hqLYtsZoP5ZsQ9dOQUoe4IXhZLm3o
 zeNI1XNpTkTviKue9jU+KVuwPOICV+wXT9N+RnL27svHfReTS98sxv32X4+3lzjnbYf8 Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091qkhfvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2020 19:14:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DFABC10002A;
 Fri, 10 Apr 2020 19:14:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D5B582AD2C0;
 Fri, 10 Apr 2020 19:14:03 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 10 Apr 2020 19:14:03 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 Apr 2020 19:14:01 +0200
Message-ID: <20200410191347.1.If78ae0e92c7e52f0fc20716ccfbf7d5005f38a51@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-10_06:2020-04-09,
 2020-04-10 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] board: stm32mp1: correct CONFIG_IS_ENABLED
	usage for LED
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

Use the correct macro to test presence CONFIG_LED:
replace CONFIG_IS_ENABLED(CONFIG_LED) by CONFIG_IS_ENABLED(LED)

Issue see during review unrelated patch
"board: stm32mp1: update management of boot-led"
http://patchwork.ozlabs.org/patch/1264823/

Cc: Marek Vasut <marex@denx.de>
Cc: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/dhelectronics/dh_stm32mp1/board.c | 2 +-
 board/st/stm32mp1/stm32mp1.c            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index 7bcd713a86..3c14d8206d 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -398,7 +398,7 @@ int board_init(void)
 
 	sysconf_init();
 
-	if (CONFIG_IS_ENABLED(CONFIG_LED))
+	if (CONFIG_IS_ENABLED(LED))
 		led_default_state();
 
 	return 0;
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 07f5344ec9..053c5e1f07 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -647,7 +647,7 @@ int board_init(void)
 
 	sysconf_init();
 
-	if (CONFIG_IS_ENABLED(CONFIG_LED))
+	if (CONFIG_IS_ENABLED(LED))
 		led_default_state();
 
 	return 0;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
