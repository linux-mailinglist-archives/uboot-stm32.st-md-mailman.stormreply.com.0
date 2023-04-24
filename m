Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C02B76ED033
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Apr 2023 16:21:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CB15C6905A;
	Mon, 24 Apr 2023 14:21:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3227DC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Apr 2023 14:21:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OCp4PI010446; Mon, 24 Apr 2023 16:21:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=rdyuNYgICY93kh7MMoNVVtPncuNU8itZSlCGVDLy7ro=;
 b=dSQAPNno7aRpvw81DDaCDTDlsHcWnFUzmV3yaWhOpj8HXn87jsgOtRbUJ1Yu4rJZ54nU
 J7FY1aZGIYN3o06GayaYP6QFQaEUaW8/Ho34VwiMlLlyypf2NvFABuWBpW9DoW9J/Ct/
 pF9IlbvRUQYUXTrxZOrvx1HrsaqyMLgdDuEsGFMYvCscLqMdMtcttaqrrXkQwVH/36K/
 27niJRE5qwy+J7kHP/VZzhBvsQk3QZy18ufkhSkB4HeM72Gh7iPZJFKGwmDCKYky0Pqu
 Z0dWwBe3rReaGuBX7ctVyXpwAeeMzcJ16Wb+qL6qG6cOGhNTrcv+ghujIYDJj25Lfz/C Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q5t4v8hp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 16:21:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF69D10002A;
 Mon, 24 Apr 2023 16:21:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D962E233C64;
 Mon, 24 Apr 2023 16:21:16 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 24 Apr
 2023 16:21:16 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 24 Apr 2023 16:21:09 +0200
Message-ID: <20230424162102.v2.1.I7a9b5c8f2d337c2f3c11bc6c5f0320a9474bcb49@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230424142110.788029-1-patrick.delaunay@foss.st.com>
References: <20230424142110.788029-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_09,2023-04-21_01,2023-02-09_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 1/2] media: dt-bindings: media: Add macros
	for video interface bus types
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

Add a new dt-bindings/media/video-interfaces.h header that defines
macros corresponding to the bus types from media/video-interfaces.yaml.
This allows avoiding hardcoded constants in device tree sources.

Based on linux commit f7eeb0084593 ("media: dt-bindings: media: Add macros
for video interface bus types")

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 include/dt-bindings/media/video-interfaces.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/media/video-interfaces.h

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
new file mode 100644
index 000000000000..68ac4e05e37f
--- /dev/null
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
+#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
+
+#define MEDIA_BUS_TYPE_CSI2_CPHY		1
+#define MEDIA_BUS_TYPE_CSI1			2
+#define MEDIA_BUS_TYPE_CCP2			3
+#define MEDIA_BUS_TYPE_CSI2_DPHY		4
+#define MEDIA_BUS_TYPE_PARALLEL			5
+#define MEDIA_BUS_TYPE_BT656			6
+
+#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
