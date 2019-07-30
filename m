Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 178767AF75
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D847AC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84C5EC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHGfZW031391; Tue, 30 Jul 2019 19:17:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Ca2WKXJyZjWZAiGs4jZQrBBdc8jpgiq4g3WyWUPO+g0=;
 b=aK3OMbkBbgQFKkZbGcdkEP38Ywbs3OvddeJnefvdJHBCiQSTNgKQ2GHluW0OKtzm8aYO
 sQxvcaEEqtiksjJSjLyQqsFYJ9+r9Y8ekaAPse1T97I8YKLyquFKHmr82bcpT3wxOBuQ
 cs6NTBBOwH4HZGFi0blG8A2j4TfJdTJDKdIOgSzcRQQaeJnP3+jrB4ZYfsNolFU8gHKy
 Kqo9DZdSXYZReVDNv1z7at3ea3ZsLzXB698l0MMqBEwCJmXkQuD0hZY5bZlfa2O0brJP
 yIIiWNUqwF7n/QG93gGH3GMl9IgtkmWmbXFi/KDaicC1m+LN52fziaLiBZErG/ANZo06 oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0br9yp2u-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7598234;
 Tue, 30 Jul 2019 17:17:05 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C05ECC8EF;
 Tue, 30 Jul 2019 19:17:05 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:05 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:04
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:13 +0200
Message-ID: <1564507016-16570-6-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 05/48] ARM: dts: stm32mp1: DDR config v1.45
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

Update DDR configuration with the latest update:
- Change DQSGE to 1 for DDR3, to cure missing DQS preamble.

Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi | 4 ++--
 arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi
index dc30360..11e8f2b 100644
--- a/arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi
+++ b/arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi
@@ -16,7 +16,7 @@
  * address mapping : RBC
  * Tc > + 85C : N
  */
-#define DDR_MEM_NAME "DDR3-1066/888 bin G 1x4Gb 533MHz v1.44"
+#define DDR_MEM_NAME "DDR3-1066/888 bin G 1x4Gb 533MHz v1.45"
 #define DDR_MEM_SPEED 533000
 #define DDR_MEM_SIZE 0x20000000
 
@@ -89,7 +89,7 @@
 #define DDR_PTR2 0x042DA068
 #define DDR_ACIOCR 0x10400812
 #define DDR_DXCCR 0x00000C40
-#define DDR_DSGCR 0xF200001F
+#define DDR_DSGCR 0xF200011F
 #define DDR_DCR 0x0000000B
 #define DDR_DTPR0 0x38D488D0
 #define DDR_DTPR1 0x098B00D8
diff --git a/arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi
index 8158a56..4b70b60 100644
--- a/arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi
+++ b/arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi
@@ -16,8 +16,7 @@
  * address mapping : RBC
  * Tc > + 85C : N
  */
-
-#define DDR_MEM_NAME "DDR3-1066/888 bin G 2x4Gb 533MHz v1.44"
+#define DDR_MEM_NAME "DDR3-1066/888 bin G 2x4Gb 533MHz v1.45"
 #define DDR_MEM_SPEED 533000
 #define DDR_MEM_SIZE 0x40000000
 
@@ -90,7 +89,7 @@
 #define DDR_PTR2 0x042DA068
 #define DDR_ACIOCR 0x10400812
 #define DDR_DXCCR 0x00000C40
-#define DDR_DSGCR 0xF200001F
+#define DDR_DSGCR 0xF200011F
 #define DDR_DCR 0x0000000B
 #define DDR_DTPR0 0x38D488D0
 #define DDR_DTPR1 0x098B00D8
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
