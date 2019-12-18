Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8521C124280
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 10:13:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46052C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 09:13:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41329C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 09:13:05 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBI9CF4I030954; Wed, 18 Dec 2019 10:13:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=eR4OsxOF4S9K2GuXbsjujSl4x9CIr0+wluTgod6SKgs=;
 b=gJ+KdyE8j4v9ZcCOpTTHYJJWtVBljARBbUU4uA41wXO2fib/Gn2Qp5mXUarexHaQCTkR
 mMLL2zh0bSyEZKfHBtH3bsLjnPViG0ofNR/8atCAYW9aJj7UqOS7iJ5n+DjX+wctAcpA
 SLggxSPEWMIe6n83avZHqsyYR8tO9FJoeZu5vO8BidTObW/XaI+ibZFRVwqY1qu7xk0H
 jmIn4UNIEkn5W0Iu+hsppfhOaLjwkyn1TaQsl6lVdKVd0muti1CKp3JJjIF0V/w7jeW1
 V8smFBwn9jLP9wixASnkCUQMclfgUcmSQkzVfo4lV2R1yQBhrnFyDMVCdU4W5wJjqNPT sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wvp373gh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 10:13:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF7D510002A;
 Wed, 18 Dec 2019 10:13:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7B2C220830;
 Wed, 18 Dec 2019 10:13:01 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Dec 2019 10:13:01 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Dec 2019 10:12:58 +0100
Message-ID: <20191218091259.6748-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_02:2019-12-17,2019-12-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] stm32mp1: remove the imply BOOTSTAGE
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

This patch is only a temporarily workaround for crash introduced by
commit ac9cd4805c8b ("bootstage: Correct relocation algorithm").

The crash occurs because the bootstage struct is not correctly aligned
when BOOTSTAGE feature is activated.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
Hi,

For issue analysis and patch proposal, see the patch

[U-Boot,v3] board_f.c: Insure gd->new_bootstage alignment
http://patchwork.ozlabs.org/patch/1201452/

Patrick


 arch/arm/mach-stm32mp/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index c9bc084194..a110522095 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -46,9 +46,7 @@ config TARGET_STM32MP1
 	select STM32_SERIAL
 	select SYS_ARCH_TIMER
 	imply BOOTCOUNT_LIMIT
-	imply BOOTSTAGE
 	imply CMD_BOOTCOUNT
-	imply CMD_BOOTSTAGE
 	imply DISABLE_CONSOLE
 	imply PRE_CONSOLE_BUFFER
 	imply SILENT_CONSOLE
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
