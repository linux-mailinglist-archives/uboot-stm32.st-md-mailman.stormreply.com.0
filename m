Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2533115AFF6
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:38:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC939C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:38:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CA6EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:38:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIWbXK015130; Wed, 12 Feb 2020 19:38:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=IzfHBoOJmSJDiRxyu+zBiESI1mTZZWo8ngs80+wWf/c=;
 b=0W2FLcWNKVuHkUk+l5BO6fY2vZUQtyO3fMrOEN5V2cE0pjHy4V2muTYEBNtEaatwZjaY
 PRSlcPqAvuTXKgjhbpX1UU4sRi0+jiGWxX8zvebHvFHL698nPL0Qf5HY9oRUTGWh5Nh4
 hASm6jyc6o1GdN6miSAa8So/JJ4R1tRnba5wHawOD8I69sQzIZjUQeeZTvTmk2u6DJiL
 Ite1OH6um712z7WL0EMK2G1Yjv2NPi2i8jeanl8VQYR2ADliTfXreLBHTzY+3WKQjxhS
 WkQE2A5o6HP7wvbXh4xAbAlXeNXJspAuplL7snZ97wDS5abAzNvdIJADbShPl6I2jv64 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uda03ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:38:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A81DB100089;
 Wed, 12 Feb 2020 19:37:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A08002C60AA;
 Wed, 12 Feb 2020 19:37:51 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:37:50 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:37:39 +0100
Message-ID: <20200212183744.5309-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183744.5309-1-patrick.delaunay@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 05/10] board: stm32mp1: stboard: lock the OTP
	after programming
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

Lock the OTP used for board identification for the ST boards after
programming.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/common/cmd_stboard.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
index c7ca773b1c..1573e35410 100644
--- a/board/st/common/cmd_stboard.c
+++ b/board/st/common/cmd_stboard.c
@@ -42,7 +42,7 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
 		      char * const argv[])
 {
 	int ret;
-	u32 otp;
+	u32 otp, lock;
 	u8 revision;
 	unsigned long board, variant, bom;
 	struct udevice *dev;
@@ -66,11 +66,20 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
 		return CMD_RET_FAILURE;
 	}
 
+	ret = misc_read(dev, STM32_BSEC_LOCK(BSEC_OTP_BOARD),
+			&lock, sizeof(lock));
+	if (ret < 0) {
+		puts("LOCK read error");
+		return CMD_RET_FAILURE;
+	}
+
 	if (argc == 0) {
 		if (!otp)
 			puts("Board : OTP board FREE\n");
 		else
 			display_stboard(otp);
+		printf("      OTP %d %s locked !\n", BSEC_OTP_BOARD,
+		       lock == 1 ? "" : "NOT");
 		return CMD_RET_SUCCESS;
 	}
 
@@ -129,6 +138,16 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
 		puts("BOARD programming error\n");
 		return CMD_RET_FAILURE;
 	}
+
+	/* write persistent lock */
+	otp = 1;
+	ret = misc_write(dev, STM32_BSEC_LOCK(BSEC_OTP_BOARD),
+			 &otp, sizeof(otp));
+	if (ret < 0) {
+		puts("BOARD lock error\n");
+		return CMD_RET_FAILURE;
+	}
+
 	puts("BOARD programming done\n");
 
 	return CMD_RET_SUCCESS;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
