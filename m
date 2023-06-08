Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A21728384
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jun 2023 17:18:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5838CC65E58;
	Thu,  8 Jun 2023 15:18:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90B05C65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 15:17:59 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358BLsYv013849; Thu, 8 Jun 2023 17:17:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=T8nYlJbnOiHzq7+bmRLsh70CbPqn+oVlEXHMsXfXvVI=;
 b=pEjAv/Lbvaah6OFDL2AXGPACoFqOtATSBnymvmKAs6S0Iw7WRcEcL3DmPQpJdkbLea+Z
 991bVoj4uE98GO9SdO1EIpiEaGjNMDpLJimtxUIXZuMbaSJoGAvPERe2rlLTw2s5bdop
 2RgJaFzqtnSznHD5xlvaC6VFlX6/IxIxo1xGm/usY/sHpnZrU1j+6tpLPsaArQMvukBN
 Af1qawd6ANkU2l0EuiwqR7vznxjdTV4Wdiicmqgt126192833kkWV5pzyPPKOWC+ENP3
 1yd4Xyqc/ITadj0QYyycPkbLYANrEnRWDxLIfeO04+ebpgY2aZjOXAEOwD+Doa1kQfj9 BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3atmb3ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 17:17:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB8AC10002A;
 Thu,  8 Jun 2023 17:17:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4D7821B507;
 Thu,  8 Jun 2023 17:17:57 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 17:17:57 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jun 2023 17:16:41 +0200
Message-ID: <20230608171614.5.I06644b2492806114746756df78585e311967e3bc@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_11,2023-06-08_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 05/12] arm: dts: stm32: Align
	stm32mp15xx-*-scmi-u-boot.dtsi file
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

Update "secure" version of STM32 boards based on SCMI when RCC_TZCR.TZEN=1
stm32mp15xx-*-scmi-u-boot.dtsi with latest patches on files
stm32mp15xx-*-u-boot.dtsi.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |  1 +
 arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi |  7 ++++
 arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi | 40 +++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index cff3f49948e4..2623cebf21a4 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -12,6 +12,7 @@
 		i2c3 = &i2c4;
 		usb0 = &usbotg_hs;
 	};
+
 	config {
 		u-boot,boot-led = "heartbeat";
 		u-boot,error-led = "error";
diff --git a/arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi
index 5a8fc15ab2b7..ae93497cd5a8 100644
--- a/arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi
@@ -4,3 +4,10 @@
  */
 
 #include "stm32mp157a-dk1-scmi-u-boot.dtsi"
+
+/ {
+	fwu-mdata {
+		compatible = "u-boot,fwu-mdata-gpt";
+		fwu-mdata-store = <&sdmmc1>;
+	};
+};
diff --git a/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi
index 71a94f9130a6..eef717946b5f 100644
--- a/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi
@@ -14,4 +14,44 @@
 		spi0 = &qspi;
 		usb0 = &usbotg_hs;
 	};
+
+	fwu-mdata {
+		compatible = "u-boot,fwu-mdata-gpt";
+		fwu-mdata-store = <&sdmmc1>;
+	};
+};
+
+&flash0 {
+	bootph-pre-ram;
+};
+
+&qspi {
+	bootph-pre-ram;
+};
+
+&qspi_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk1_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk2_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
