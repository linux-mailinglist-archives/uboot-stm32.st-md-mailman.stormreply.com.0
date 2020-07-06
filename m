Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD84215794
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jul 2020 14:49:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 707BDC36B29
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jul 2020 12:49:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EA8DC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2020 12:49:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 066Bq4V9028897; Mon, 6 Jul 2020 14:49:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=x8H8pi1tF8xqKxfqCJ6WdzLO24s/0o8xpSUoLwx5aSc=;
 b=SoqU6I5U4kFGxAZHok5v3MPIV21ECkXBkmHnDFW/e2j9u4Wc5W0RCjXKnwFa2Kb+okQz
 CJactnqpNrIsyOs65HyMHU4pL3yKEaaWslk1zscDvLEETneD2pyL+D1IFDokkN4UU1AE
 blUQXX4J+ZTtSUMM+H3/PJH+RIQcV8dt1dSGFz4VeezY8ooXEm0gd4GQk2U4TUqhAh8y
 0tTyImrBMJtTdqKA0+ADHZwYvWUrgR9fWVfvcCj0j82FvM2qIxR7q7HprzTzbNF0RJxG
 rCzkir23L6GsCOfiZfOfD5jSXPsjli5M6FFSQGbffiLTrjuxstKfz4A5Z3xU4NHBsHeU Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322ew93g6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 14:49:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B1DC910002A;
 Mon,  6 Jul 2020 14:49:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A11A42CA5DA;
 Mon,  6 Jul 2020 14:49:03 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 6 Jul 2020 14:49:03 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 6 Jul 2020 14:48:58 +0200
Message-ID: <20200706144753.1.I1f502be5d9d0197f53e8075a283a102e05817c2b@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_08:2020-07-06,
 2020-07-06 signatures=0
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

STM32 serial IP can be reset via reset controller.
Add the support of reset to uart nodes on stm32mp15-u-boot.dtsi,
the ad-dons file for U-Boot.

This patch fix issues when previous UART configuration, for example
done in TF-A or ROM code, is not handled in U-Boot stm32 serial driver
init.

This reset property won't be not added in Linux kernel device tree
as this reset is not used in Linux STM32 serial driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp15-u-boot.dtsi | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index 142ad25c43..c463b49dda 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -179,6 +179,38 @@
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
