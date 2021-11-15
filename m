Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 470D345029E
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 11:39:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0951AC5E2CC;
	Mon, 15 Nov 2021 10:39:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74E3AC5C82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 10:39:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AFA1Fjk013989;
 Mon, 15 Nov 2021 11:39:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=7Na9G05Jzka6LuiqGGK0/Ffr+Xv7iL7fKjOCV3srjbU=;
 b=xg5Cb9sXgmZMhJhlPE2A4mGUgKwbdiBG3u1+Cir+Rfz6gRqqfbNoCXdmTQL7YpYF89oN
 z/ROW/G7rNDn8Xw1dh1bcN3VqCTHUoLC5aFN4j6wz9XWc0Ie71SKpqF2SdyGco2BTunE
 p5ZNVoDwQIzeFC9tw1KuXW3a23AFBbhYzQfJROD227CYvBeJmV5lCki+PWkFLQAhh96+
 02PnWh4zWwLiURE3rkz6we8dR0AJ3kWK+859Lh8dramyzOTABOgV5srgfClIHlQAtPAI
 r221aaifY6twA1FCGxXi6Y9W3k77aLwFBhGFALz9U3U4hUmP0VlHWUai5YfQqgpMI7JZ SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cben334mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 11:39:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE8B410002A;
 Mon, 15 Nov 2021 11:39:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6625229A81;
 Mon, 15 Nov 2021 11:39:23 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 15 Nov 2021 11:39:23
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Nov 2021 11:39:14 +0100
Message-ID: <20211115103920.30149-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115103920.30149-1-patrice.chotard@foss.st.com>
References: <20211115103920.30149-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-12_01,2020-04-07_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 2/8] ARM: dts: stm32: Use lower-case hex for
	address for stm32f769-disco-u-boot.dtsi
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

Replace upper-case hex with lower-case hex for address.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32f769-disco-u-boot.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
index 7dfe430a40..5589b41652 100644
--- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
@@ -53,9 +53,9 @@
 	soc {
 		dsi: dsi@40016c00 {
 			compatible = "st,stm32-dsi";
-			reg = <0x40016C00 0x800>;
+			reg = <0x40016c00 0x800>;
 			resets = <&rcc STM32F7_APB2_RESET(DSI)>;
-			clocks =  <&rcc 0 STM32F7_APB2_CLOCK(DSI)>,
+			clocks = <&rcc 0 STM32F7_APB2_CLOCK(DSI)>,
 				  <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>,
 				  <&clk_hse>;
 			clock-names = "pclk", "px_clk", "ref";
@@ -227,7 +227,7 @@
 };
 
 &qspi {
-	reg = <0xA0001000 0x1000>, <0x90000000 0x4000000>;
+	reg = <0xa0001000 0x1000>, <0x90000000 0x4000000>;
 	flash0: mx66l51235l@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
