Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 528547F7D8
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 15:08:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 225A8C35E03
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 13:08:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87278C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 13:08:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72D8K8A030242; Fri, 2 Aug 2019 15:08:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Nbp7aL3dOdNrggm0YpgNm9uyJhPZbI0ItNE/94XjQok=;
 b=O7+NcVTwkl/Hhv3GNpY8y/8OKu8CTwGsIvJ8TofWAr8M5LDCipUm1Qd0ML+KH9QwLaNf
 XeufnMr5bIRiH/pqLTCK9hdf6/Ygwsb6lFaSaGLGCIci4fZ7XdeZ2aikrvOQ7qRh+Shu
 tqGoS0RUdI0VDcenw6MHWzMxj6it2xZcOgh30Ot4AIESn5M5gohSUwIioQxW4VO32hNW
 92symV438YdrNRJY4qP6KYAn6voTdG623lDFVnlIiGduE33t9vvBftJ6zAPkkHiOBTky
 KRbommpC3yEihVCJKFiqwk2HO2nbSuPEkpwYVUEsc5ZbGPOW9U8H7X/xmFe/ahy37ovl 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4us12-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 15:08:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A10743;
 Fri,  2 Aug 2019 13:07:49 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9413A2C35C0;
 Fri,  2 Aug 2019 15:07:49 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 15:07:49 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 15:07:48
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 15:07:20 +0200
Message-ID: <1564751242-683-4-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564751242-683-1-git-send-email-patrick.delaunay@st.com>
References: <1564751242-683-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 3/5] stm32mp1: Add copro image support for M4
	firmware
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

Implements copro image loading with FIT.
Once image is loaded with remoteproc,
the M4 coprocessor is automatically started.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index b99c6c0..629fb63 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -17,6 +17,7 @@
 #include <mtd.h>
 #include <mtd_node.h>
 #include <phy.h>
+#include <remoteproc.h>
 #include <reset.h>
 #include <syscon.h>
 #include <usb.h>
@@ -770,3 +771,26 @@ int ft_board_setup(void *blob, bd_t *bd)
 	return 0;
 }
 #endif
+
+static void board_copro_image_process(ulong fw_image, size_t fw_size)
+{
+	int ret, id = 0; /* Copro id fixed to 0 as only one coproc on mp1 */
+
+	if (!rproc_is_initialized())
+		if (rproc_init()) {
+			printf("Remote Processor %d initialization failed\n",
+			       id);
+			return;
+		}
+
+	ret = rproc_load(id, fw_image, fw_size);
+	printf("Load Remote Processor %d with data@addr=0x%08lx %u bytes:%s\n",
+	       id, fw_image, fw_size, ret ? " Failed!" : " Success!");
+
+	if (!ret) {
+		rproc_start(id);
+		env_set("copro_state", "booted");
+	}
+}
+
+U_BOOT_FIT_LOADABLE_HANDLER(IH_TYPE_COPRO, board_copro_image_process);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
