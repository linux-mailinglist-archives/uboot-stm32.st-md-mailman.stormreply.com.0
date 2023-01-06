Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6443466002C
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Jan 2023 13:21:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27D8DC6905D;
	Fri,  6 Jan 2023 12:21:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A3F6C6905B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jan 2023 12:21:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3067o9kF001196; Fri, 6 Jan 2023 13:21:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=rGVNiqfprhSX9tu4AHqt0odLSpe2Blw2Ap9JwK9mX8E=;
 b=KwmVZUtX9NzTVQyhTg7FStGZX/xWAZZsjoJJjpEqfrIjSHRe4u6jKa4p585mI/43+aQ3
 ua0n7LXhM+RZyYS3L+b3MQ6nV6E3FagwQKqwss/1hzU+GpxjMu3dGiU6L+AebHhzD/3V
 Fae0zRHIzEnz956ZiIFKFE+2yHm2gqv+B+MzjffsCMVMudOyeLZXpKNOm6AvNCbh2otK
 ihQcTup8v7qrvHJjmo7MZavkWL8/tmXlsuseWflzud8dENOy8JDIePf4p/f09B/wGCwM
 ta4Ntc63K7YklTxX+jJQi2/KzEnTlw2e0ZBla4X87oiI82hCB0h/5s0W2MLogdn7+WVi 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtda6q845-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 13:21:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B892810002A;
 Fri,  6 Jan 2023 13:21:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ADBAD2105AC;
 Fri,  6 Jan 2023 13:21:31 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 6 Jan
 2023 13:21:31 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Jan 2023 13:20:18 +0100
Message-ID: <20230106131952.5.I5ced2665787083835d5ce398a3bd10163cca62c9@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
References: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_06,2023-01-06_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Etienne CARRIERE <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH 5/6] board: st: Add support of STM32MP13x
	boards in stm32board cmd
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

Add board identifiers for STMicroelectronics STM32MP13x boards:
- DISCO board: MB1635

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/st/common/Kconfig       | 2 +-
 board/st/common/cmd_stboard.c | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
index 2f57118bb265..aba3590866e0 100644
--- a/board/st/common/Kconfig
+++ b/board/st/common/Kconfig
@@ -1,7 +1,7 @@
 config CMD_STBOARD
 	bool "stboard - command for OTP board information"
 	depends on ARCH_STM32MP
-	default y if TARGET_ST_STM32MP15x
+	default y if TARGET_ST_STM32MP15x || TARGET_ST_STM32MP13x
 	help
 	  This compile the stboard command to
 	  read and write the board in the OTP.
diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
index 213fb5d30208..853ab78bbf16 100644
--- a/board/st/common/cmd_stboard.c
+++ b/board/st/common/cmd_stboard.c
@@ -2,8 +2,8 @@
 /*
  * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
  *
- * the st command stboard supports the STMicroelectronics board identification
- * saved in OTP 59.
+ * the command stboard supports the STMicroelectronics board identification
+ * saved in OTP_BOARD.
  *
  * The ST product codification have several element
  * - "Commercial Product Name" (CPN): type of product board (DKX, EVX)
@@ -18,7 +18,7 @@
  * - Finished Good = EVA32MP157A1$AU1
  *
  * Both information are written on board and these information are also saved
- * in OTP59, with:
+ * in OTP_BOARD (59 for STM32MP15x or 60 for STM32MP13x), with:
  * bit [31:16] (hex) => Board id, MBxxxx
  * bit [15:12] (dec) => Variant CPN (1....15)
  * bit [11:8]  (dec) => Revision board (index with A = 1, Z = 26)
@@ -49,6 +49,7 @@ static bool check_stboard(u16 board)
 		0x1298,
 		0x1341,
 		0x1497,
+		0x1635,
 	};
 
 	for (i = 0; i < ARRAY_SIZE(st_board_id); i++)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
