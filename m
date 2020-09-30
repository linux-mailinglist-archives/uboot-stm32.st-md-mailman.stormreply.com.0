Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2310627EDB3
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Sep 2020 17:45:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5C5DC36B37;
	Wed, 30 Sep 2020 15:45:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C19D1C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 15:45:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08UFWnW7010572; Wed, 30 Sep 2020 17:45:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=axmC5IziFGKIgN5cJT3ympSdYK3MH4dvLsYktKcuNpA=;
 b=xN80Ro+/2uK6hCQTtqsmslFHS2Ak2wj/AE2dEvB4jlzziPdN/KfTSf7zSZOMsXgvk2k4
 cp/TXGDplTOHMaj33sCcD/x6qhrOo6NKbEJybaQsDDFp2yb5RyNMa+3qlhyIS545APzi
 FJUzrgIHyxNW4qHQ+O7KUgtnCQCTMbpJEUg53Aydc5YCYs99+o0ziuXBMiLmpxCRldmJ
 McIfsl+L4pQiV8fW5I6ZYHE/vdAkeXnmjoHIg8EV+E0hHnuPquPRcBEljO+oaheeWXUo
 O2iyy16vTBhwHJTFqbv/TD4wm/dnp9bnBTVV2yyqFvKJMGfoflaweWLXybfLO3ZfKcu+ ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33sts80hjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 17:45:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6173210002A;
 Wed, 30 Sep 2020 17:45:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28B052B205F;
 Wed, 30 Sep 2020 17:45:21 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 30 Sep 2020 17:45:20 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 30 Sep 2020 17:45:08 +0200
Message-ID: <20200930174454.v2.1.I3f984b644583cb7080d779898cebfed8669d3f33@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-30_08:2020-09-30,
 2020-09-30 signatures=0
Cc: chenshuo <chenshuo@eswin.com>, Tom Rini <trini@konsulko.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Tero Kristo <t-kristo@ti.com>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [Uboot-stm32] [PATCH v2] optee: copy FDT OP-TEE related nodes
	before generic FDT changes
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

Fixes: 6ccb05eae01b ('image: fdt: copy possible optee nodes to a loaded devicetree')
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- rebase on master branch
- add Fixes tag

 common/image-fdt.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/common/image-fdt.c b/common/image-fdt.c
index f13eefb061..3d6935ad40 100644
--- a/common/image-fdt.c
+++ b/common/image-fdt.c
@@ -557,6 +557,14 @@ int image_setup_libfdt(bootm_headers_t *images, void *blob,
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
@@ -576,13 +584,6 @@ int image_setup_libfdt(bootm_headers_t *images, void *blob,
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
