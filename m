Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2BC1EF1F3
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jun 2020 09:23:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88784C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jun 2020 07:23:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88924C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2020 07:23:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0557MABG028595; Fri, 5 Jun 2020 09:23:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=L870uk5RKdPETLjhANTG1lHwdjYRdw6v1qo6Ku2ohE0=;
 b=ylMtCCCe9gGWl7L6MPr1cjNFWKKSMuV1LS2icb4peh9aPyUpW1yWQuxOaPZJjFjTfzT8
 2oPLGK3St3X9zb1IqBYTTRfzFwULE2hnll8soZ/frFr1VObKbt8h1dqMG/yklgvbp8gE
 XcUcFWIKnSfV0pkCYciLpohvDONl9PF4UJ9yQtj+9SYVdyiGLBQB8VJbBe7STLKz/Y1D
 zHp/hLiDvyZ32EUAmvWHAIyt1eqTViP1RflW3B14ejALxucie4JVviB6/Y72zqP8dSCG
 wNARI/IyCVTf6SZIE2NgRNOxy1WgfuGZgh/Eax2ORMm/15+3nS8zncozaVCtiNK+n6lJ kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31fasesq4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jun 2020 09:23:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD48A10002A;
 Fri,  5 Jun 2020 09:22:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD2D42AB5B7;
 Fri,  5 Jun 2020 09:22:59 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 5 Jun 2020 09:22:59 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Jun 2020 09:22:54 +0200
Message-ID: <20200605092244.1.I773bf523d9f4d1a6212483d030e34113b832a779@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-05_01:2020-06-04,
 2020-06-05 signatures=0
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [Uboot-stm32] [PATCH] optee: copy FDT OP-TEE related nodes before
	generic FDT changes
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

From: Etienne Carriere <etienne.carriere@linaro.org>

Move call to optee_copy_fdt_nodes() introduced by [1] before generic
changes in kernel FDT so that platform specific changes are not
overridden by the changes made by this function.

Link: [1] commit 6ccb05eae01b ("image: fdt: copy possible optee nodes to a loaded devicetree")
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 common/image-fdt.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/common/image-fdt.c b/common/image-fdt.c
index b63e772bd6..041382447e 100644
--- a/common/image-fdt.c
+++ b/common/image-fdt.c
@@ -547,6 +547,14 @@ int image_setup_libfdt(bootm_headers_t *images, void *blob,
 		printf("ERROR: arch-specific fdt fixup failed\n");
 		goto err;
 	}
+
+	fdt_ret = optee_copy_fdt_nodes(gd->fdt_blob, blob);
+	if (fdt_ret) {
+		printf("ERROR: transfer of optee nodes to new fdt failed: %s\n",
+		       fdt_strerror(fdt_ret));
+		goto err;
+	}
+
 	/* Update ethernet nodes */
 	fdt_fixup_ethernet(blob);
 	if (IMAGE_OF_BOARD_SETUP) {
@@ -566,13 +574,6 @@ int image_setup_libfdt(bootm_headers_t *images, void *blob,
 		}
 	}
 
-	fdt_ret = optee_copy_fdt_nodes(gd->fdt_blob, blob);
-	if (fdt_ret) {
-		printf("ERROR: transfer of optee nodes to new fdt failed: %s\n",
-		       fdt_strerror(fdt_ret));
-		goto err;
-	}
-
 	/* Delete the old LMB reservation */
 	if (lmb)
 		lmb_free(lmb, (phys_addr_t)(u32)(uintptr_t)blob,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
