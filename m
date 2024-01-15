Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDD282D910
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 13:49:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10280C6DD80;
	Mon, 15 Jan 2024 12:49:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20E0EC6DD77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 12:49:40 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40F8ACjO015531; Mon, 15 Jan 2024 13:49:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=H6eAGv0ZYir6Hpi1/nWGD6PUoEkXYF86svOWCmESVDo=; b=vB
 f44jjWAHtr7/ShPu7c+D2lCRatJXjCcUxmxoMaxM0ZqsaZ9y6U8cV1qrOtiPZlNM
 JouCPs6bFZWgdMorXXk0B9jqRtlsPJ+sLT7MEPC9hgAO4XIDs6KvKUM8HXVwPbhu
 Jha4b3nW2EXURqjp+Fw9ughTQF0+PPNdX2BYCLur+vlTRvdPh0olbsa/C8xwCCud
 b0joat3rYI7qoCmH6p8GrHWbUWK5N6sASXunNQOlEcaITD0gCxJ0Cc6XhxpP/XEr
 MErKVBy6eku1GaMN9zwlDFuKmxw1qg6jJj8cgtLZkUgByNXOkidpgFMJ4sk0cIrr
 w/2Vo3/e3po45u3WCuow==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmfy8mm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 13:49:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A73D10002A;
 Mon, 15 Jan 2024 13:49:39 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1480E2721D5;
 Mon, 15 Jan 2024 13:49:39 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 13:49:38 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jan 2024 13:46:57 +0100
Message-ID: <20240115134642.12.I23dadcfeb0941c41ad9d8dabeb6c70a0bb9a7b56@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240115124657.39109-1-patrick.delaunay@foss.st.com>
References: <20240115124657.39109-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 12/12] board: st: stm32mp2: display the board
	identification
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

Add the display of the STMicroelectronics board identification saved in OTP
in stm32mp2 checkboard function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/st/stm32mp2/stm32mp2.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
index 9a881583d904..aa7dd31996ea 100644
--- a/board/st/stm32mp2/stm32mp2.c
+++ b/board/st/stm32mp2/stm32mp2.c
@@ -9,9 +9,12 @@
 #include <env.h>
 #include <fdt_support.h>
 #include <log.h>
+#include <misc.h>
 #include <asm/global_data.h>
 #include <asm/arch/sys_proto.h>
+#include <dm/device.h>
 #include <dm/ofnode.h>
+#include <dm/uclass.h>
 
 /*
  * Get a global data pointer
@@ -20,6 +23,9 @@ DECLARE_GLOBAL_DATA_PTR;
 
 int checkboard(void)
 {
+	int ret;
+	u32 otp;
+	struct udevice *dev;
 	const char *fdt_compat;
 	int fdt_compat_len;
 
@@ -27,6 +33,23 @@ int checkboard(void)
 
 	log_info("Board: stm32mp2 (%s)\n", fdt_compat && fdt_compat_len ? fdt_compat : "");
 
+	/* display the STMicroelectronics board identification */
+	if (CONFIG_IS_ENABLED(CMD_STBOARD)) {
+		ret = uclass_get_device_by_driver(UCLASS_MISC,
+						  DM_DRIVER_GET(stm32mp_bsec),
+						  &dev);
+		if (!ret)
+			ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
+					&otp, sizeof(otp));
+		if (ret > 0 && otp)
+			log_info("Board: MB%04x Var%d.%d Rev.%c-%02d\n",
+				 otp >> 16,
+				 (otp >> 12) & 0xF,
+				 (otp >> 4) & 0xF,
+				 ((otp >> 8) & 0xF) - 1 + 'A',
+				 otp & 0xF);
+	}
+
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
