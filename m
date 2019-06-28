Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C7759C6A
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 15:03:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A8C9C20B47
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 13:03:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B992C20B43
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 13:03:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5SD1bWv013092; Fri, 28 Jun 2019 15:03:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Sq9Kc8XQe9GHNJpN7dDOc++o7g+DT6+pKF9JO7MtLL4=;
 b=d3jbKYRP6jmf2Q+Q4/QvxSo6gLchfMZGlzz5JoZtYpgw6ViHNPxrZ/0K2m5FPvXZKSDm
 UlYcbtwFAs7GAAYEKw/1NHIJ/D/dNyiN5y097qQumao0zdi2m2SQKyNYSgj+O60QBQt9
 Bmmz31eafuuhy/d3tT8p4MudfaEIylgyioLo4wgVaD8tHRyK+mONPbPo5E0xO0sTgl9t
 TA0/q4FhzQyiw94QTARK0qAOOi/i1gCo8S0ds7Tso7u9VbhmxNXOq0k96XUkiB7IRu+u
 ysMHFaRgHwY6ClG/1dS/u29k1L8RafD6Akiawsrpfqid0KWxnBnvJBp5v+0OGeqR6Kny NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2gx0n4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 28 Jun 2019 15:03:20 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DDAFD34;
 Fri, 28 Jun 2019 13:03:19 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B04362937;
 Fri, 28 Jun 2019 13:03:19 +0000 (GMT)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 28 Jun 2019 15:03:19 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Jun 2019 15:03:01 +0200
Message-ID: <20190628130301.18094-5-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628130301.18094-1-patrice.chotard@st.com>
References: <20190628130301.18094-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_05:, , signatures=0
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <Patrick.delaunay@st.com>, Rick Chen <rick@andestech.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 4/4] doc: device-tree-bindings: alignment with
	v5.2-rc6 for spi-stm32-qspi.txt
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

Align doc/device-tree-bindings/spi/spi-stm32-qspi.txt with kernel v5.2-rc6

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

---

 .../spi/spi-stm32-qspi.txt                    | 71 ++++++++++---------
 1 file changed, 38 insertions(+), 33 deletions(-)

diff --git a/doc/device-tree-bindings/spi/spi-stm32-qspi.txt b/doc/device-tree-bindings/spi/spi-stm32-qspi.txt
index cec3e1250c..adeeb63e84 100644
--- a/doc/device-tree-bindings/spi/spi-stm32-qspi.txt
+++ b/doc/device-tree-bindings/spi/spi-stm32-qspi.txt
@@ -1,39 +1,44 @@
-STM32 QSPI controller device tree bindings
---------------------------------------------
+* STMicroelectronics Quad Serial Peripheral Interface(QSPI)
 
 Required properties:
-- compatible		: should be "st,stm32-qspi".
-- reg			: 1. Physical base address and size of SPI registers map.
-			  2. Physical base address & size of mapped NOR Flash.
-- spi-max-frequency	: Max supported spi frequency.
-- status		: enable in requried dts.
-
-Connected flash properties
---------------------------
-- spi-max-frequency	: Max supported spi frequency.
-- spi-tx-bus-width	: Bus width (number of lines) for writing (1-4)
-- spi-rx-bus-width	: Bus width (number of lines) for reading (1-4)
-- memory-map		: Address and size for memory-mapping the flash
+- compatible: should be "st,stm32f469-qspi"
+- reg: the first contains the register location and length.
+       the second contains the memory mapping address and length
+- reg-names: should contain the reg names "qspi" "qspi_mm"
+- interrupts: should contain the interrupt for the device
+- clocks: the phandle of the clock needed by the QSPI controller
+- A pinctrl must be defined to set pins in mode of operation for QSPI transfer
+
+Optional properties:
+- resets: must contain the phandle to the reset controller.
+
+A spi flash (NOR/NAND) must be a child of spi node and could have some
+properties. Also see jedec,spi-nor.txt.
+
+Required properties:
+- reg: chip-Select number (QSPI controller may connect 2 flashes)
+- spi-max-frequency: max frequency of spi bus
+
+Optional property:
+- spi-rx-bus-width: see ./spi-bus.txt for the description
 
 Example:
-	qspi: quadspi@A0001000 {
-		compatible = "st,stm32-qspi";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0xA0001000 0x1000>, <0x90000000 0x10000000>;
-		reg-names = "QuadSPI", "QuadSPI-memory";
-		interrupts = <92>;
+
+qspi: spi@a0001000 {
+	compatible = "st,stm32f469-qspi";
+	reg = <0xa0001000 0x1000>, <0x90000000 0x10000000>;
+	reg-names = "qspi", "qspi_mm";
+	interrupts = <91>;
+	resets = <&rcc STM32F4_AHB3_RESET(QSPI)>;
+	clocks = <&rcc 0 STM32F4_AHB3_CLOCK(QSPI)>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_qspi0>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-rx-bus-width = <4>;
 		spi-max-frequency = <108000000>;
-		status = "okay";
-
-		qflash0: n25q128a {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "micron,n25q128a13", "jedec,spi-nor";
-			spi-max-frequency = <108000000>;
-			spi-tx-bus-width = <4>;
-			spi-rx-bus-width = <4>;
-			memory-map = <0x90000000 0x1000000>;
-			reg = <0>;
-		};
+		...
 	};
+};
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
