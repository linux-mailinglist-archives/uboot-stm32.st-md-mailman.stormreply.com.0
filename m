Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 522A44502A1
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 11:39:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CEF7C5EC72;
	Mon, 15 Nov 2021 10:39:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9D23C5C82B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 10:39:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AF9Yq01014093;
 Mon, 15 Nov 2021 11:39:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=nmDAavVI/0GJPZBFwmUEPCNi9F0qBJtrCZ7i0CncxYM=;
 b=oEqAWCU9+AKOnvKIzevxyuzDVC890WUPmKHh2iA18EkTpPWZfcV3vcL4H+qw2OdB3NxF
 fBrx78AsxX5C55degetPHDnHbTPtzSsyOuj4l3KdfLvgkMkQ+LtwuHhHxMshNC32kkgT
 cI/JrYkMyldhAXYBUbFeCKeACKCBm/+NswsMLlTDCOyNFA9EyoVl8rIbI9TQ8jhk1hAJ
 FttyXIvnxW9sEbeBW0K5EtWaDqoHN2ng7ivI2UV5bs0nPBAnhYnpYgJtmNkaxxOJdUe2
 1QZC1WOX9IZXM16Gd8umqopI1dU5WvXRrPapPJZONFlpTOXilAAYRfQDkXrwg1GJf7JV wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cben334n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 11:39:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 54B08100039;
 Mon, 15 Nov 2021 11:39:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4BFD6229A80;
 Mon, 15 Nov 2021 11:39:25 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 15 Nov 2021 11:39:24
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Nov 2021 11:39:16 +0100
Message-ID: <20211115103920.30149-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115103920.30149-1-patrice.chotard@foss.st.com>
References: <20211115103920.30149-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-12_01,2020-04-07_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 4/8] ARM: dts: stm32: Use lower-case hex for
	address for stm32f7-u-boot.dtsi
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

 arch/arm/dts/stm32f7-u-boot.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/dts/stm32f7-u-boot.dtsi b/arch/arm/dts/stm32f7-u-boot.dtsi
index 46bd1102df..c1b2ac25c3 100644
--- a/arch/arm/dts/stm32f7-u-boot.dtsi
+++ b/arch/arm/dts/stm32f7-u-boot.dtsi
@@ -7,7 +7,7 @@
 
 		fmc: fmc@A0000000 {
 			compatible = "st,stm32-fmc";
-			reg = <0xA0000000 0x1000>;
+			reg = <0xa0000000 0x1000>;
 			clocks = <&rcc 0 STM32F7_AHB3_CLOCK(FMC)>;
 			pinctrl-0 = <&fmc_pins>;
 			pinctrl-names = "default";
@@ -46,7 +46,7 @@
 			compatible = "st,stm32f469-qspi";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0xA0001000 0x1000>, <0x90000000 0x10000000>;
+			reg = <0xa0001000 0x1000>, <0x90000000 0x10000000>;
 			reg-names = "qspi", "qspi_mm";
 			interrupts = <92>;
 			spi-max-frequency = <108000000>;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
