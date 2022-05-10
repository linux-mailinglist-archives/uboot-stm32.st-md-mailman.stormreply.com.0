Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B3B520F17
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 09:51:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACAE3C0D2BD;
	Tue, 10 May 2022 07:51:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D33CC0D2B9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:51:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A2NPoQ023055;
 Tue, 10 May 2022 09:51:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=owOwhhjBaZ6yutXk6np/eIv9Bjq3oJKMF3656T93EEY=;
 b=bJpgM0FkoaL/3vjjAeq1mNss6rIkz2KHN5Vz4Xtj6gmLjxJ+m53fam2SYyYcBdK1dbUq
 5WbRY+OibIgunxkMhNP2816lUkGDHuvmBjGCu1cHejZ2rVKH9pfyUim5DUx8L6YLq/Yx
 JKNlGGZuBTedfJHSmIfbLKDT2DokiykSDWW3NxMAdVRHFUOSGPEOlu/TpkOaSRNvnc+4
 9Lrn5ozT8tetzFkMcrZubnyLRxDyemjxyUaTjIee5u7ZiLxKxA+MP0aZR8uxhxhWfjNl
 W7JbVF07ewOcK3cPK14AhB+7ZzKS3qADxbXn2H4WtAhza8Q1kPydxKA/+cQmnyTI+t6h 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwg40x9jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:51:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9E34E10002A;
 Tue, 10 May 2022 09:51:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97D1D20FA5E;
 Tue, 10 May 2022 09:51:20 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 10 May 2022 09:51:19
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 10 May 2022 09:51:13 +0200
Message-ID: <20220510095041.4.I43cd48cb3b34ee1655bd373e119c9072ef04d8c7@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
References: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: [Uboot-stm32] [PATCH 4/4] ARM: dts: stm32: add rcc node for
	STM32MP13
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

Add the RCC node, not yet in Linux kernel device tree
to handle the U-Boot RCC drivers.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp13-u-boot.dtsi | 4 ++++
 arch/arm/dts/stm32mp131.dtsi       | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
index 1b5b358690..126f282816 100644
--- a/arch/arm/dts/stm32mp13-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
@@ -86,6 +86,10 @@
 	u-boot,dm-pre-reloc;
 };
 
+&rcc {
+	u-boot,dm-pre-reloc;
+};
+
 &syscfg {
 	u-boot,dm-pre-reloc;
 };
diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
index 950e172e45..fcb0af09b5 100644
--- a/arch/arm/dts/stm32mp131.dtsi
+++ b/arch/arm/dts/stm32mp131.dtsi
@@ -159,6 +159,13 @@
 			dma-channels = <16>;
 		};
 
+		rcc: rcc@50000000 {
+			compatible = "st,stm32mp13-rcc", "syscon";
+			reg = <0x50000000 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		exti: interrupt-controller@5000d000 {
 			compatible = "st,stm32mp13-exti", "syscon";
 			interrupt-controller;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
