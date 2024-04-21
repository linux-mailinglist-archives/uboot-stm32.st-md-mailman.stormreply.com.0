Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1997F8AC1FE
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Apr 2024 01:10:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8C60C6DD67;
	Sun, 21 Apr 2024 23:10:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49816C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Apr 2024 23:10:15 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 56FF3882F3;
 Mon, 22 Apr 2024 01:10:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713741014;
 bh=C10VULq8FO1HmFruzxcEdUjsbxnwdh+DizpYP/hxkCc=;
 h=From:To:Cc:Subject:Date:From;
 b=E7eZ2oxN7ssJxCZ+pRLO2ubC7DPkVuQKjT6KawON+zSvwJp3JAM8jR6d5qD0jvI0Y
 9fkv+yibVGPqPcLfH8ftmKzcbXstfm74xB+Q4kbce2ZGTZVNHDhuJ60O/3V7Ewnole
 a54BoCor/kmT11ZYHdvq8tuZe1UKZCzpLxio2jM/FKM44ZNPT0caA8+O3rH3d7LNRR
 oGrGbDVi0CRCQqc0djt6OzklRBvGpmkXkkfZoPWBZfdSYVCFtY7AVpOiPFr8WITn6L
 iAMR9JD/8s3adcWL4sBbgkPCtryGN/3meP+NJTvpzRWSP7kjoYiaq7sCdGPYY0VN3l
 blB9I4l9f7CPg==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 22 Apr 2024 01:09:47 +0200
Message-ID: <20240421230954.193773-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: u-boot@dh-electronics.com, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: add eth1 and eth2 support on
	stm32mp13
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

From: Christophe Roullier <christophe.roullier@st.com>

Add both ethernet MACs based on GMAC SNPS IP on stm32mp13.

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
Cc: Christophe Roullier <christophe.roullier@st.com>
Cc: Joe Hershberger <joe.hershberger@ni.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Ramon Fried <rfried.dev@gmail.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp131.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 arch/arm/dts/stm32mp133.dtsi | 30 +++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
index 159ba8f8c9c..ad331b73d18 100644
--- a/arch/arm/dts/stm32mp131.dtsi
+++ b/arch/arm/dts/stm32mp131.dtsi
@@ -1328,6 +1328,37 @@
 			status = "disabled";
 		};
 
+		eth1: eth1@5800a000 {
+			compatible = "snps,dwmac-4.20a", "st,stm32mp13-dwmac";
+			reg = <0x5800a000 0x2000>;
+			reg-names = "stmmaceth";
+			interrupts-extended = <&intc GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 68 1>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			clock-names = "stmmaceth",
+				      "mac-clk-tx",
+				      "mac-clk-rx",
+				      "ethstp",
+				      "eth-ck";
+			clocks = <&rcc ETH1MAC>,
+				 <&rcc ETH1TX>,
+				 <&rcc ETH1RX>,
+				 <&rcc ETH1STP>,
+				 <&rcc ETH1CK_K>;
+			st,syscon = <&syscfg 0x4 0xff0000>;
+			snps,mixed-burst;
+			snps,pbl = <2>;
+			snps,axi-config = <&stmmac_axi_config_1>;
+			snps,tso;
+			status = "disabled";
+
+			stmmac_axi_config_1: stmmac-axi-config {
+				snps,wr_osr_lmt = <0x7>;
+				snps,rd_osr_lmt = <0x7>;
+				snps,blen = <0 0 0 0 16 8 4>;
+			};
+		};
+
 		usbh_ohci: usb@5800c000 {
 			compatible = "generic-ohci";
 			reg = <0x5800c000 0x1000>;
@@ -1404,6 +1435,12 @@
 			ts_cal2: calib@5e {
 				reg = <0x5e 0x2>;
 			};
+			ethernet_mac1_address: mac1@e4 {
+				reg = <0xe4 0x6>;
+			};
+			ethernet_mac2_address: mac2@ea {
+				reg = <0xea 0x6>;
+			};
 		};
 
 		/*
diff --git a/arch/arm/dts/stm32mp133.dtsi b/arch/arm/dts/stm32mp133.dtsi
index df451c3c2a2..5cd5bde9535 100644
--- a/arch/arm/dts/stm32mp133.dtsi
+++ b/arch/arm/dts/stm32mp133.dtsi
@@ -64,5 +64,35 @@
 				};
 			};
 		};
+
+		eth2: eth2@5800e000 {
+			compatible = "snps,dwmac-4.20a", "st,stm32mp13-dwmac";
+			reg = <0x5800e000 0x2000>;
+			reg-names = "stmmaceth";
+			interrupts-extended = <&intc GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clock-names = "stmmaceth",
+				      "mac-clk-tx",
+				      "mac-clk-rx",
+				      "ethstp",
+				      "eth-ck";
+			clocks = <&rcc ETH2MAC>,
+				 <&rcc ETH2TX>,
+				 <&rcc ETH2RX>,
+				 <&rcc ETH2STP>,
+				 <&rcc ETH2CK_K>;
+			st,syscon = <&syscfg 0x4 0xff000000>;
+			snps,mixed-burst;
+			snps,pbl = <2>;
+			snps,axi-config = <&stmmac_axi_config_2>;
+			snps,tso;
+			status = "disabled";
+
+			stmmac_axi_config_2: stmmac-axi-config {
+				snps,wr_osr_lmt = <0x7>;
+				snps,rd_osr_lmt = <0x7>;
+				snps,blen = <0 0 0 0 16 8 4>;
+			};
+		};
 	};
 };
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
