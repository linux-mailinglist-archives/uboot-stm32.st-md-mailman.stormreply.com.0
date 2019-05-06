Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F714765
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 May 2019 11:17:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DA57C9AE52
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 May 2019 09:17:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B59EFC9AE42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 09:17:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4698W2f006416; Mon, 6 May 2019 11:17:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=zS2lijl/RL9efAAs0wPDgJoPGiXRSS4y7K4oo4t++Ec=;
 b=rchL46vUPCmKITOaMR9juOK5UT95IXoU61Pb2PelCEB1/VPLQZyd+jDUgj9yiJ/degN8
 0ILQETpQKRwUGBnyAduDo6SgzBWUiym4FSL2E+q6Tjgahxin03T3Yat3F8maDVtlEaRA
 MzQACo+z7/XgRr/j3KhsklXGx1XZ4qWSZZUAc6/kAJVCV1/+YhfMfZlWl5dCLYe8iJHB
 XsQHT8BDg0K4/KqjHXu/ho0+gnUsvkY+uCTYU/XDHLneASwBe+2tKG8quD8jbhZ1JUhl
 wR+5mF5WVry416+Pd6P/ynXS/QlzerbaB/87GAXrsa32Xq6Qr9Xsh3uxTly1EYvX+4Ef Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s94cb8jnt-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 06 May 2019 11:17:16 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9D0F634;
 Mon,  6 May 2019 09:17:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7CAC115C7;
 Mon,  6 May 2019 09:17:15 +0000 (GMT)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 6 May 2019 11:17:15 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 6 May 2019 11:17:00 +0200
Message-ID: <1557134223-4549-10-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557134223-4549-1-git-send-email-patrice.chotard@st.com>
References: <1557134223-4549-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_06:, , signatures=0
Cc: Tom Rini <trini@konsulko.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 09/12] ARM: dts: stm32: Add qspi support for
	stm32f469-disco board
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

Add device tree nodes to support qspi for stm32f469-disco board.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 arch/arm/dts/stm32f469-disco-u-boot.dtsi | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/dts/stm32f469-disco-u-boot.dtsi b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
index a980ac4..3da308e 100644
--- a/arch/arm/dts/stm32f469-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
@@ -23,6 +23,7 @@
 		gpio8 = &gpioi;
 		gpio9 = &gpioj;
 		gpio10 = &gpiok;
+		spi0 = &qspi;
 	};
 
 	soc {
@@ -64,6 +65,19 @@
 			       st,sdram-refcount = < 1292 >;
 		       };
 		};
+
+		qspi: quadspi@A0001000 {
+			compatible = "st,stm32-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xA0001000 0x1000>, <0x90000000 0x10000000>;
+			reg-names = "qspi", "qspi_mm";
+			interrupts = <91>;
+			spi-max-frequency = <108000000>;
+			clocks = <&rcc 0 STM32F4_AHB3_CLOCK(QSPI)>;
+			resets = <&rcc STM32F4_AHB3_RESET(QSPI)>;
+			pinctrl-0 = <&qspi_pins>;
+		};
 	};
 };
 
@@ -205,6 +219,18 @@
 		};
 	};
 
+	qspi_pins: qspi@0 {
+		pins {
+			pinmux = <STM32_PINMUX('F',10, AF9)>, /* CLK */
+				 <STM32_PINMUX('B', 6, AF10)>, /* BK1_NCS */
+				 <STM32_PINMUX('F', 8, AF10)>, /* BK1_IO0 */
+				 <STM32_PINMUX('F', 9, AF10)>, /* BK1_IO1 */
+				 <STM32_PINMUX('F', 7, AF9)>, /* BK1_IO2 */
+				 <STM32_PINMUX('F', 6, AF9)>; /* BK1_IO3 */
+			slew-rate = <2>;
+		};
+	};
+
 	usart3_pins_a: usart3@0	{
 		u-boot,dm-pre-reloc;
 		pins1 {
@@ -227,3 +253,16 @@
 &syscfg {
 	u-boot,dm-pre-reloc;
 };
+
+&qspi {
+	reg = <0xA0001000 0x1000>, <0x90000000 0x1000000>;
+	flash0: n25q128a {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <108000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		reg = <0>;
+	};
+};
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
