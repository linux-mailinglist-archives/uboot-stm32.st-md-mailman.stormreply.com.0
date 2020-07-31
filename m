Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCB5234094
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 09:55:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD642C36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 07:55:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06264C36B35
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 07:55:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V7mWGN016701; Fri, 31 Jul 2020 09:55:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=i/gw1xwh3P2ULiJivke1GGiv5svjgmkCYVBYjY/eCaU=;
 b=HpxxyH5XSV33e7cqKbQCMZ2qmsarzv4Qy+SbnR3lputxvOSM0myYVxycm06ukIR2fBIK
 FIdz0fI1je+HBpF98vP0/rd+Izu765JmcbTsKqIvjJCY2GQTDQULk7DYgH1Lmc7vs+8f
 QHgwfpyWguy2IN8eJk7LfSOXrCdLtltydogQOeUXBfLSGyUe2i5I66AZ48TkpIRfICtD
 ok+BD2Hu1dCl7a0BP1RyaSp4dHTKUF7eXFROLadNlcxbipYRvNtlztdMREwoD3d/Dere
 3Mrckvlhr7i5Vlgi9xy/+FVIqV2jUYs+S/eeXCZekRMtRJ+rxAbptO/8wHc7NzEj/+7X Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmgn6x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 09:55:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6D22B10002A;
 Fri, 31 Jul 2020 09:55:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6485922109D;
 Fri, 31 Jul 2020 09:55:08 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 09:55:07 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 09:53:42 +0200
Message-ID: <1596182024-18181-10-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 09/11] board: stm32mp1: update fdt fixup
	partitions table
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

This patch adds "st,stm32mp1-fmc2-nfc" compatible string in the
fdt fixup partitions table.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 1d274c3..f2f6c99 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -851,6 +851,7 @@ int ft_board_setup(void *blob, struct bd_info *bd)
 		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
 		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_SPINAND},
 		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
+		{ "st,stm32mp1-fmc2-nfc",	MTD_DEV_TYPE_NAND, },
 	};
 	fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
 #endif
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
