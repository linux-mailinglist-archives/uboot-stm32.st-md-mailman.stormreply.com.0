Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 183A989DDD9
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Apr 2024 17:06:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D135CC71290;
	Tue,  9 Apr 2024 15:06:04 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3A4AC7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 15:06:03 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 439B5tkA026813; Tue, 9 Apr 2024 17:06:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=ZYVS+yjceVO08fV4A9HS6oaZD0NojpZixb1ZvY/EAFc=; b=Z6
 HWk2ngNnDK6Me9Y+P6WGTjlGQFPuwmBpT9sojDZbtd9sLcQLfjEBid2DsMQavOek
 j6WAdjZ0xtym6tTW9OmHgaPXv+PVsxxi6PdvSjiBXmlWhBcSt9nkSAYshZmTzVr2
 VpHw7BBy9gEMfmY8tUSIvncZY7L3Qw3hWg+SEnJiu3AHhiTYnqXcFwqLeBQqqNe/
 htqBpyBQrm3BHnB0rAGcs54PFUGvOqlzARchz2hBR7wnngjzuGzXN5hfNGCAPv62
 1d4zjeturIOpYbP03Dws8gkOIfEfdTvCJHWO7VvnZbGnnSPEhQpKR+3r2VPkNNNG
 BMbVXiNhtZGwlT7v9bQA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xbhbj1ryu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Apr 2024 17:06:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E98AD40045;
 Tue,  9 Apr 2024 17:05:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 013032207BC;
 Tue,  9 Apr 2024 17:05:36 +0200 (CEST)
Received: from localhost (10.48.86.98) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 9 Apr
 2024 17:05:35 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Apr 2024 17:02:08 +0200
Message-ID: <20240409150215.2497778-19-patrice.chotard@foss.st.com>
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
 Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 18/25] ARM: dts: stm32: Add gpio-keys for
	stm32mp157c-ed1-u-boot
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

 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index ef91088aa37..e6a452c9d8e 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/stm32mp1-clksrc.h>
+#include <dt-bindings/input/linux-event-codes.h>
 #include "stm32mp15-u-boot.dtsi"
 #include "stm32mp15-ddr3-2x4Gb-1066-binG.dtsi"
 
@@ -16,8 +17,6 @@
 		u-boot,boot-led = "heartbeat";
 		u-boot,error-led = "error";
 		u-boot,mmc-env-partition = "fip";
-		st,fastboot-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
-		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 	};
 
 #if defined(CONFIG_STM32MP15X_STM32IMAGE) || defined(CONFIG_SPL)
@@ -43,6 +42,22 @@
 	};
 #endif
 
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
+	};
+
 	led {
 		red {
 			label = "error";
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
