Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8AA1FBA45
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 18:10:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC1B6C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 16:10:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 631A4C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 16:10:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GG7uqv024811; Tue, 16 Jun 2020 18:10:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=H48uZn52efSCubzRef7MM/K3/UifzGnRhuGMHfaGM3o=;
 b=sZnfRz1qB7P1Igf682X9/SStzO6MzMKMIsEY2IY8b4NgPTmlSJVDhZoCWE4aaTMdI8MO
 tCfIRanlqXB3OoIrV0+2CC7vwXP2t2vZdN59tzMtE6yiKRg02E+b6Rj49JmXZcrJfkgm
 f5zTO1J3OzNMnP1oMIlrI+8Oh6APbQvCH4OMolm9RuWJRvy9D663pA8hyPut+aJcTYuN
 4M5hkmtPrBqDxDouaw3H9+FMNkNE8D8G0oS20gatv6MNk1JTGgZO5L89g8jHybsZOxfC
 rkqlbgkN1De/DzrAVzLO13cKEkT+nvNFdscD0/uzg0Xx5KHm+r5lY5y5cfo1cGNWFcaT xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mkx98dhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 18:10:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DFEFD10002A;
 Tue, 16 Jun 2020 18:10:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF5D02C6D62;
 Tue, 16 Jun 2020 18:10:07 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 18:10:07 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 16 Jun 2020 18:10:06 +0200
Message-ID: <20200616161006.17424-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_07:2020-06-16,
 2020-06-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: add reset support to uart
	nodes on stm32mp15x
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

STM32 serial can be reset via reset controller.
Add the support of reset to uart nodes on stm32mp15x.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp15-u-boot.dtsi | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index 1279589a56..39591ec202 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -175,6 +175,38 @@
 	compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
 };
 
+&usart1 {
+	resets = <&rcc USART1_R>;
+};
+
+&usart2 {
+	resets = <&rcc USART2_R>;
+};
+
+&usart3 {
+	resets = <&rcc USART3_R>;
+};
+
+&uart4 {
+	resets = <&rcc UART4_R>;
+};
+
+&uart5 {
+	resets = <&rcc UART5_R>;
+};
+
+&usart6 {
+	resets = <&rcc USART6_R>;
+};
+
+&uart7 {
+	resets = <&rcc UART7_R>;
+};
+
+&uart8{
+	resets = <&rcc UART8_R>;
+};
+
 &usbotg_hs {
 	compatible = "st,stm32mp1-hsotg", "snps,dwc2";
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
