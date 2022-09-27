Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CEA5EBD0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Sep 2022 10:18:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58048C63325;
	Tue, 27 Sep 2022 08:18:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DAD8C03FC4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 08:18:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R82kxX002166;
 Tue, 27 Sep 2022 10:18:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=nIc8uIxde4MTOphpjcAnFagRLTSa/wRedqcseLAMscc=;
 b=UA80YxFQqDzjsekodHLLwnja+J9tDZslntguxQ3AT8ua4P3IfBh/jj+NllRvXmgsLDv2
 3Fi8cuUMbfpWFN3WJHZzZByRCs8HU6fwwqMnaOHSpOvpyz1ZdPJuN2hSaCjb8sV3UVDR
 Bn9eYo8PZSaQCX0AT7OO1vInBTuosvJH6Q3X1ZOew1NPUGTIwR4saT3YyV7IA6tMu+wP
 kzVvCj9nRNJn2C5YWGx+xLcTJjk+rqOIWJVgZqXjoVuKn2js9tTICbBVvU5Luk7SRdVm
 Okp+Z6UmvNAEeLFZXWQ/DFIKQ33REPBMYbQ3amEP+dJSr8AH3Wxzu9sZHj0ZvGypw+1a wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsq1b10ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 10:18:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3DC3710002A;
 Tue, 27 Sep 2022 10:18:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29AF8215155;
 Tue, 27 Sep 2022 10:18:07 +0200 (CEST)
Received: from localhost (10.75.127.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 10:18:06 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 27 Sep 2022 10:18:05 +0200
Message-ID: <20220927101756.1.I33483759ec654ce103609cc3ef13a6162b722975@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.120]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_02,2022-09-22_02,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Schocher <hs@denx.de>
Subject: [Uboot-stm32] [PATCH] fdt_support: cosmetic: remove
	fdt_fixup_nor_flash_size prototype
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

Remove prototype for the removed function fdt_fixup_nor_flash_size.
This patch has no impact as the function is never used.

Fixes: 98f705c9cefd ("powerpc: remove 4xx support")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/fdt_support.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/fdt_support.h b/include/fdt_support.h
index b8380716f39..5638bd4f165 100644
--- a/include/fdt_support.h
+++ b/include/fdt_support.h
@@ -243,8 +243,6 @@ int fdt_increase_size(void *fdt, int add_len);
 
 int fdt_delete_disabled_nodes(void *blob);
 
-int fdt_fixup_nor_flash_size(void *blob);
-
 struct node_info;
 #if defined(CONFIG_FDT_FIXUP_PARTITIONS)
 void fdt_fixup_mtdparts(void *fdt, const struct node_info *node_info,
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
