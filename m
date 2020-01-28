Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6567414B194
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 10:11:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A769C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 09:11:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ABC8C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:11:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S987Xe024262; Tue, 28 Jan 2020 10:11:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=NkvDegRHM2JTEh52RNSG2NZAj6FCwW1wz43YLJ8Ihvg=;
 b=d5HpQx0TWja1OH6vo/p+6ovLSpYpvwefEBzQFx8lfHj1rnyF6H5yP81ewtbvAx/JzQ96
 h2y8g+NgZd1BHGyxf35KEYlqN0q6+d4gJoH8Vxd8s/SzjpbUBt1uDSGIvUHtlJgXbdlG
 d5M5+JoB7W0yW7aNn6X/sWbzoSjWzkPkAqyhzAJMPRlW37LK20nYIq0T0OKO4oVgSe/z
 ZQE/30Tbb8ga0Yp4W5T1/erkUNk8uEUUWVMMgrslvVzd4/jIZvZOy494GJImCrQZpGK9
 9au2fGHZhXfg5KgEErBtZVBJqwl0Aq/ZprUvbgC2iBMO53KVxVwkyUu3AuPHvuVHtEcC 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrc134y9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:11:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B3E510002A;
 Tue, 28 Jan 2020 10:11:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 200F7212A40;
 Tue, 28 Jan 2020 10:11:30 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 10:11:29 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jan 2020 10:11:01 +0100
Message-ID: <20200128101041.4.Ide537d091d8ee33f89ee50edad59ea237e517e42@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128091106.28552-1-patrick.delaunay@st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: Antonio Borneo <antonio.borneo@st.com>, Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 4/9] ARM: dts: stm32mp1: move FDCAN to PLL4_R
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

From: Antonio Borneo <antonio.borneo@st.com>

LTDC modifies the clock frequency to adapt it to the display. Such
frequency change is not detected by the FDCAN driver that instead
cache the value at probe and pretend to use it later.

Keep the LTDC alone on PLL4_Q by moving the FDCAN to PLL4_R.

Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi | 2 +-
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi       | 2 +-
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi       | 2 +-
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
index 1104a70a65..d8a4617d90 100644
--- a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
@@ -91,7 +91,7 @@
 		CLK_UART6_HSI
 		CLK_UART78_HSI
 		CLK_SPDIF_PLL4P
-		CLK_FDCAN_PLL4Q
+		CLK_FDCAN_PLL4R
 		CLK_SAI1_PLL3Q
 		CLK_SAI2_PLL3Q
 		CLK_SAI3_PLL3Q
diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 4045a6e731..a7a125c087 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -110,7 +110,7 @@
 		CLK_UART6_HSI
 		CLK_UART78_HSI
 		CLK_SPDIF_PLL4P
-		CLK_FDCAN_PLL4Q
+		CLK_FDCAN_PLL4R
 		CLK_SAI1_PLL3Q
 		CLK_SAI2_PLL3Q
 		CLK_SAI3_PLL3Q
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index b2ac49472a..32d95b84e7 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -107,7 +107,7 @@
 		CLK_UART6_HSI
 		CLK_UART78_HSI
 		CLK_SPDIF_PLL4P
-		CLK_FDCAN_PLL4Q
+		CLK_FDCAN_PLL4R
 		CLK_SAI1_PLL3Q
 		CLK_SAI2_PLL3Q
 		CLK_SAI3_PLL3Q
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
index 320912edd8..21aa4bfb86 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
@@ -142,7 +142,7 @@
 		CLK_UART6_HSI
 		CLK_UART78_HSI
 		CLK_SPDIF_PLL4P
-		CLK_FDCAN_PLL4Q
+		CLK_FDCAN_PLL4R
 		CLK_SAI1_PLL3Q
 		CLK_SAI2_PLL3Q
 		CLK_SAI3_PLL3Q
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
