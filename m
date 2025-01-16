Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81202A1352D
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Jan 2025 09:19:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDAD1C78F85;
	Thu, 16 Jan 2025 08:19:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF947C78F7C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 08:19:05 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G7ousG032376;
 Thu, 16 Jan 2025 09:18:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 S3go9EjNv14sgE44bj2lpQM0b0e2qSokFbbEIm9jAPc=; b=H9btcOpyGYcgNXL2
 8aal9ixxcuZZdNhACZIoZwnOmQNxFnxf7VgzYqphOjwLyMrtzcE4T8eF2M2wV43o
 XwxycvWp3/VQ88NDMtdj+80eLj4dIxMllx1L1nrGLUPLmKWqdOxZGuT8rP+OeO8c
 mytSMLrlZQ48UvGwohREwkOrnD1rOd2sIVg5VSCoRdRfaG34hUkAIfJspFz7weHu
 kCP7fG36fyXLdlFT0fttiZ2Qcix6wUQBMZBg/Xt4g7wqOixWCu52at95lfeviGbO
 idtDEv7qwJYYoe694XLIWz4hnIHcm4EIVLLWpL+c8sfl5bJAjZjS21V8+gq8vLGD
 q4PX6Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 446m8s9u1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2025 09:18:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A799F40045;
 Thu, 16 Jan 2025 09:18:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C6C328C111;
 Thu, 16 Jan 2025 09:17:42 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 16 Jan
 2025 09:17:42 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 16 Jan 2025 09:17:30 +0100
Message-ID: <20250116081738.2511223-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250116081738.2511223-1-patrice.chotard@foss.st.com>
References: <20250116081738.2511223-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_03,2025-01-16_01,2024-11-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v2 1/9] ARM: dts: sti: Add fixed clock for
	ehci and ohci nodes in stih410-b2260.dtsi
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

On STi platforms, all clocks are enabled by BOOTROM, so CONFIG_CLK is
not set as no clock driver for STI exists.

As ehci-generic and ohci-generic drivers are used on platforms where
CONFIG_CLK is set, clk_get_bulk() returns-ENOSYS in case of
stih410-b2260.
To avoid this error, add fixed clocks for ehci and ohci nodes for
stih410-b2260 to fix the following errors:

Bus usb@9a03c00: ohci_generic usb@9a03c00: Failed to get clocks (ret=-19)
Port not available.
Bus usb@9a03e00: ehci_generic usb@9a03e00: Failed to get clocks (ret=-19)
Port not available.
Bus usb@9a83c00: ohci_generic usb@9a83c00: Failed to get clocks (ret=-19)
Port not available.
Bus usb@9a83e00: ehci_generic usb@9a83e00: Failed to get clocks (ret=-19)
Port not available.
scanning bus dwc3@9900000 for devices... 1 USB Device(s) found
       scanning usb for storage devices... 0 Storage Device(s) found

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>
---

(no changes since v1)

 arch/arm/dts/stih410-b2260-u-boot.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/dts/stih410-b2260-u-boot.dtsi b/arch/arm/dts/stih410-b2260-u-boot.dtsi
index 3b080ac7a1b..e9d7ec92281 100644
--- a/arch/arm/dts/stih410-b2260-u-boot.dtsi
+++ b/arch/arm/dts/stih410-b2260-u-boot.dtsi
@@ -14,20 +14,30 @@
 			};
 		};
 
+		clk_usb: clk-usb {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <100000000>;
+		};
+
 		ohci0: usb@9a03c00 {
 			compatible = "generic-ohci";
+			clocks = <&clk_usb>;
 		};
 
 		ehci0: usb@9a03e00 {
 			compatible = "generic-ehci";
+			clocks = <&clk_usb>;
 		};
 
 		ohci1: usb@9a83c00 {
 			compatible = "generic-ohci";
+			clocks = <&clk_usb>;
 		};
 
 		ehci1: usb@9a83e00 {
 			compatible = "generic-ehci";
+			clocks = <&clk_usb>;
 		};
 	};
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
