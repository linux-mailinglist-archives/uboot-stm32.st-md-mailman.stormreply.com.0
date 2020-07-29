Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01973231D51
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Jul 2020 13:25:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9BA8C36B25
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Jul 2020 11:25:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D06C0C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 11:25:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TBMEOl032194; Wed, 29 Jul 2020 13:24:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=EWUnOQTpwyCwtZRZOHNkvAqqEoX7gDTbsZXIj404c8s=;
 b=kl4eYSyTliNGwKhmH6K7lavC+ZMUTDNE7ytJl2ERnk7PONkQg4xNA/k6OLCoMBZJ/Mdq
 q3/QaS8dzeZtLiiF9Hhs3XFRpUkJYLox85d2ucEb1V0xRfQ3/s1tQmkIcfXsY0c1bDYn
 TUJfUB6H542GWhkXShiO3I/EtoUyHxSv0dnB72O/Ibbu77p0Mmxt9Sh4bU2i6fA+GtNO
 i3resAMBH4gEBgpQ7Lr0C0Nn8m8P3Ft5d+h46N5zDWQYYdXoALeKpWSfjkKjzuIy892X
 DH2ow1h2WcyG77Ik2Vl4jSS+h9UhPI/OHhpvQoRaWrYfMuGuw6YbJ5onV0Wu9Dsr6+Sn 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmgbg50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 13:24:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1270A10002A;
 Wed, 29 Jul 2020 13:24:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F09C2222CB6;
 Wed, 29 Jul 2020 13:24:58 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 29 Jul 2020 13:24:58 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 29 Jul 2020 13:24:52 +0200
Message-ID: <20200729112452.15812-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_04:2020-07-29,
 2020-07-29 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] board: stm32mp1: use const for struct
	node_info
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

Use const for the variable nodes in ft_board_setup,
this patch follow fdt_fixup_mtdparts prototype and no more use stack.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 1d274c3157..68c4a221da 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -847,7 +847,7 @@ int mmc_get_env_dev(void)
 int ft_board_setup(void *blob, struct bd_info *bd)
 {
 #ifdef CONFIG_FDT_FIXUP_PARTITIONS
-	struct node_info nodes[] = {
+	static const struct node_info nodes[] = {
 		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
 		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_SPINAND},
 		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
