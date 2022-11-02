Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E32AC61641A
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Nov 2022 14:54:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAC9DC6411E;
	Wed,  2 Nov 2022 13:54:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E60DC64116
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Nov 2022 13:54:34 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A2BIMGH031075; Wed, 2 Nov 2022 14:54:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=F1RTWQRr35D3P4mcikAqDUs27vFCe5i93+rtutWZBL0=;
 b=XIpcn73c9K/xgajmsiipaMwMaccoZfdWqBcKT63gfTI+Vmr7ViGkuMRPsrM5I0XXeiVj
 eHZj/RGKCe0bg1qz7p4/nO+i46ruWASJbackp+ZZCmPdJXy6CAetzKqe9sKWOuaDsdHj
 QMHA8UbFfuCpu4rwNuYfV2qU44OHBBOHIvqO/fuLQf83rzgf+1Gs6Rb++ZRqlBf/D9gE
 M8iFkTG5wuB6UyyzRtv+nK5lR8DSl24dAsF78aC4UcXcQANgZzQTNQaaTDjweB2RcQ4E
 G0s+z8/DC38GdKIOiLLrFWsFriR/PMc5VzhdjXZvHKuaVIDVj2GSkQl1DsredvO2wfnz 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kkqjcrufy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 14:54:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB991100034;
 Wed,  2 Nov 2022 14:54:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AEA7A2291CD;
 Wed,  2 Nov 2022 14:54:25 +0100 (CET)
Received: from localhost (10.201.20.201) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 2 Nov
 2022 14:54:24 +0100
From: Yann Gautier <yann.gautier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 2 Nov 2022 14:53:49 +0100
Message-ID: <20221102135349.102615-2-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102135349.102615-1-yann.gautier@foss.st.com>
References: <20221102135349.102615-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.201]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_10,2022-11-02_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32: Drop MMCI interrupt-names
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

From: Marek Vasut <marex@denx.de>

The pl18x MMCI driver does not use the interrupt-names property,
the binding document has been updated to recommend this property
be unused, remove it.
Backport of Marek's Linux patch:
https://lore.kernel.org/linux-arm-kernel/20221013221242.218808-3-marex@denx.de/

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Yann Gautier <yann.gautier@foss.st.com>
Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---

 arch/arm/dts/stm32h743.dtsi  | 2 --
 arch/arm/dts/stm32mp131.dtsi | 2 --
 arch/arm/dts/stm32mp151.dtsi | 3 ---
 3 files changed, 7 deletions(-)

diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
index ceb629c4fa..c490d0a571 100644
--- a/arch/arm/dts/stm32h743.dtsi
+++ b/arch/arm/dts/stm32h743.dtsi
@@ -339,7 +339,6 @@
 			arm,primecell-periphid = <0x10153180>;
 			reg = <0x52007000 0x1000>;
 			interrupts = <49>;
-			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC1_CK>;
 			clock-names = "apb_pclk";
 			resets = <&rcc STM32H7_AHB3_RESET(SDMMC1)>;
@@ -353,7 +352,6 @@
 			arm,primecell-periphid = <0x10153180>;
 			reg = <0x48022400 0x400>;
 			interrupts = <124>;
-			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC2_CK>;
 			clock-names = "apb_pclk";
 			resets = <&rcc STM32H7_AHB2_RESET(SDMMC2)>;
diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
index a1c6d0d00b..661d329b45 100644
--- a/arch/arm/dts/stm32mp131.dtsi
+++ b/arch/arm/dts/stm32mp131.dtsi
@@ -231,7 +231,6 @@
 			arm,primecell-periphid = <0x20253180>;
 			reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
 			clocks = <&clk_pll4_p>;
 			clock-names = "apb_pclk";
 			cap-sd-highspeed;
@@ -245,7 +244,6 @@
 			arm,primecell-periphid = <0x20253180>;
 			reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
 			clocks = <&clk_pll4_p>;
 			clock-names = "apb_pclk";
 			cap-sd-highspeed;
diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
index f0fb022fc6..8bbb1aef2e 100644
--- a/arch/arm/dts/stm32mp151.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -1102,7 +1102,6 @@
 			arm,primecell-periphid = <0x00253180>;
 			reg = <0x48004000 0x400>;
 			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC3_K>;
 			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC3_R>;
@@ -1435,7 +1434,6 @@
 			arm,primecell-periphid = <0x00253180>;
 			reg = <0x58005000 0x1000>;
 			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC1_K>;
 			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC1_R>;
@@ -1450,7 +1448,6 @@
 			arm,primecell-periphid = <0x00253180>;
 			reg = <0x58007000 0x1000>;
 			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC2_K>;
 			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC2_R>;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
