Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 873C553B950
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jun 2022 15:05:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D59CC5A4FD;
	Thu,  2 Jun 2022 13:05:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55EFCC57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jun 2022 13:05:48 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25285vmD005119;
 Thu, 2 Jun 2022 15:05:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=INMkoZvsLawandf7QC17/brNmOQytPo/lLTUQjeQwwM=;
 b=Eg9gKWSm3Ef4ZFNH8HO2RxBwiGZ98UbWyftjzizLPYy944P/ssfmdR5aH5TuhJX5xC4E
 evO+6cMoNqIs9f3vnrezBVmC2NGTWFFVYAn7UuSaZcI5QNunsmcmqrNC0L/i3yfB+orn
 RMkqKVsGWbexcCKN1dFCIFUM5KzDZH+9kZJ/A3x7IewHlw2+jOjd1nRzpyRSWY6u3Du7
 KCSp1d3yPNn8kKChJy+0sX13xrwDZ48JnuyTmxcRqEjaHRGVsMEEQCAUdprJMkOD4ouc
 Ow0P8gd38LBrx117sIuJqzvH9Ngj1Un8IS1JtoJWXkK7xKaICpAWqY0oixUFTpbB7+9G eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gbc50yrsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 15:05:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0956E100034;
 Thu,  2 Jun 2022 15:05:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 03208226FB8;
 Thu,  2 Jun 2022 15:05:45 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 2 Jun
 2022 15:05:44 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 2 Jun 2022 15:05:35 +0200
Message-ID: <20220602150254.v3.3.I43cd48cb3b34ee1655bd373e119c9072ef04d8c7@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220602130535.722317-1-patrick.delaunay@foss.st.com>
References: <20220602130535.722317-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_03,2022-06-02_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 3/3] ARM: dts: stm32: add rcc node for
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
to handle the U-Boot RCC drivers with the needed U-Boot
property "u-boot,dm-pre-reloc" property as the clock and reset drivers
are required during pre-location.


Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

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
