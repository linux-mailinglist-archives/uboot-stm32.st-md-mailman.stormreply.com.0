Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BE4108F28
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 14:48:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A0A9C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 13:48:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20BA5C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 13:48:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPDlWfB021354; Mon, 25 Nov 2019 14:48:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ph9/2HrpNmVlDmB6LCUkZl4bMlb8BN2JotI0XQf1pP8=;
 b=AFzvUiGIOgNzSxvmat4vRL63pJ1jm9LTaYO+ZAONjT2Rpk0SfCIQ/EzebMiEwxmNjDZS
 mAoXZbHpP5k27o2cAJkhphK4ODHivbdqEnWaFGLVayirJjzp9SaHsIn255QCIsCm+UvJ
 SzenBAwetDaMIANIQxOKvbbe8cBduNjtT7U5wmTUC82qTWk1LUqbI5s1VOfO6Nwyd8LI
 BNDbPH4/oukx2EGdS77CuCX6uqNN1STd6D/TirbaLt2F7qI+6eY9RgRMtAmgh7K0p2c6
 96YN9kDXTJ2g/eRlrtvPU0GlUbVUHLjNVhhLKgXc1O+sMW9enKSL79+f8ZKk2RFim+X8 wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2weudw1cmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 14:48:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C11FE100038;
 Mon, 25 Nov 2019 14:48:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE0002C7882;
 Mon, 25 Nov 2019 14:48:15 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 Nov 2019 14:48:15 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 Nov 2019 14:48:11 +0100
Message-ID: <20191125134811.16462-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_03:2019-11-21,2019-11-25 signatures=0
Cc: Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Joe
 Hershberger <joe.hershberger@ni.com>, Trevor Woerner <trevor@toganlabs.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH] board_f.c: Insure gd->new_bootstage alignment
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

In reserve_bootstage(), in case size is odd, gd->new_bootstage
is not aligned. In bootstage_relocate(), the platform hangs when
getting access to data->record[i].name.
To avoid this issue, make gd->new_bootstage 16 byte aligned.

Fixes: ac9cd4805c8b ("bootstage: Correct relocation algorithm")

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
---

 common/board_f.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/common/board_f.c b/common/board_f.c
index e3591cbaeb..9cd4cfaf5f 100644
--- a/common/board_f.c
+++ b/common/board_f.c
@@ -559,6 +559,7 @@ static int reserve_bootstage(void)
 	int size = bootstage_get_size();
 
 	gd->start_addr_sp -= size;
+	gd->start_addr_sp = ALIGN_DOWN(gd->start_addr_sp, 16);
 	gd->new_bootstage = map_sysmem(gd->start_addr_sp, size);
 	debug("Reserving %#x Bytes for bootstage at: %08lx\n", size,
 	      gd->start_addr_sp);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
