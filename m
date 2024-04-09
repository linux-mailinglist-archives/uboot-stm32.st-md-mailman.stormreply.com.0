Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EE489DDE6
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Apr 2024 17:06:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F09D0C71290;
	Tue,  9 Apr 2024 15:06:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E232DC7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 15:06:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 439BeuDD028475; Tue, 9 Apr 2024 17:06:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=X55LUz6NhrFH1W1HstwRFrLB2XILf9hBQ9r6HREORMM=; b=RB
 forLi80HNfDVknH5JBe/sU9BVdd2VL15fbnbvWpY00Ui3DFAiFRTe+NezKY56wnc
 IbDRJsePpKlZAuyseMLqIRQI0jm9tqXG1vXOjnVA4CQZWW7k8lX1KNXnNyjNrar3
 yN4F5qAHna3H6zeMX5z6XelSEo6wQ2CYvEr3i3TLFnR4pAEZ15vtski6ZxLBnn6f
 9cWk/MEMTcDdvypVLzZthXk7JUpNaWPA5YiLpwTu++1Xs9egsM2B1b2SjfCaX95+
 P1pqunDNdA1piw2P8uN/V+m8v5tP1JMGqjbMwNdgg9Sc4mGKru9fVBj9jHuSorMO
 KE+MannwSxYo1v5RlmQw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xaw9curcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Apr 2024 17:06:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C020E4004D;
 Tue,  9 Apr 2024 17:06:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78FA62207CF;
 Tue,  9 Apr 2024 17:06:39 +0200 (CEST)
Received: from localhost (10.48.86.98) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 9 Apr
 2024 17:06:39 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Apr 2024 17:02:12 +0200
Message-ID: <20240409150215.2497778-23-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_10,2024-04-09_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 22/25] ARM: dts: stm32: Add gpio-keys for
	stm32mp157c-ed1-scmi-u-boot
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

Add 2 gpio-keys :
  _ button-user-1 for stm32prog mode activation.
  _ button-user-2 for fastboot mode activation.

Remove proprietary st,fastboot-gpios and st,stm32prog-gpios.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
index 4d763bd3a2c..84920f53496 100644
--- a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
@@ -3,6 +3,7 @@
  * Copyright : STMicroelectronics 2022
  */
 
+#include <dt-bindings/input/linux-event-codes.h>
 #include "stm32mp15-scmi-u-boot.dtsi"
 
 / {
@@ -14,8 +15,22 @@
 		u-boot,boot-led = "heartbeat";
 		u-boot,error-led = "error";
 		u-boot,mmc-env-partition = "u-boot-env";
-		st,fastboot-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
-		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-user-1 {
+			label = "User-1";
+			linux,code = <BTN_1>;
+			gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+
+		button-user-2 {
+			label = "User-2";
+			linux,code = <BTN_2>;
+			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
 	};
 
 	led {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
