Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B525200D1
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 May 2022 17:13:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29459C5F1EB;
	Mon,  9 May 2022 15:13:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 464AEC5EC6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 May 2022 15:13:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249CVDX0004391;
 Mon, 9 May 2022 17:13:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=S1EFfvKzEJ9a76IFEppvsoFgECL8+CutgRuzNLH1yqo=;
 b=kQO/eGd0T+iI2XIJVVwedNgUHTzWzuj+ejPsE8P05j6awUcaJPSdVtaUy2DnjMq77cs8
 k/ZWkY8oVyFEYbnTCRy6SLIn+mBzTrbLSOVEPOTe/khE9MbDxE0MctgYyw2N0MLcsjDB
 OXrz7CQfVmL3fD9O3P0eGmxYW8zwiywfhuCh4KAY2a2FTMVc4np/e0Qj3lQJeYnPCYUQ
 TJEQySWyJZVe00bT1qPrj8+EC6dqd/GEsZuHv0dNaWD+uT29FYuuPOCEds+uOHDp7tvV
 dA9K5+XSqPc3xs/9HXQ2bh5mehXhJ5MaspxBYPMD15xpowTJAdhi8FhlQ0aSvdEKprpw Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwfngc7aj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 May 2022 17:13:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83C93100038;
 Mon,  9 May 2022 17:13:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7CD7F22A6DD;
 Mon,  9 May 2022 17:13:33 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 9 May 2022 17:13:33
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 9 May 2022 17:13:22 +0200
Message-ID: <20220509171309.2.I3679840747612f44044942f225f344af9a26dcfd@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509171309.1.Ie4f29021d76802af1c22e1df1a6a55ae6a5f55d9@changeid>
References: <20220509171309.1.Ie4f29021d76802af1c22e1df1a6a55ae6a5f55d9@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_04,2022-05-09_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] stm32mp: fdt: update etzpc for STM32MP13x
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

Add support of STM32MP13x the ETZPC part of fdt.c

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/fdt.c | 153 +++++++++++++++++++++++++++++++++++-
 1 file changed, 151 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
index 5d37a44d97..bf2ef66034 100644
--- a/arch/arm/mach-stm32mp/fdt.c
+++ b/arch/arm/mach-stm32mp/fdt.c
@@ -28,12 +28,119 @@
 
 #define ETZPC_RESERVED		0xffffffff
 
+#define STM32MP13_FDCAN_BASE	0x4400F000
+#define STM32MP13_ADC1_BASE	0x48003000
+#define STM32MP13_TSC_BASE	0x5000B000
+#define STM32MP13_CRYP_BASE	0x54002000
+#define STM32MP13_ETH2_BASE	0x5800E000
+#define STM32MP13_DCMIPP_BASE	0x5A000000
+#define STM32MP13_LTDC_BASE	0x5A010000
+
 #define STM32MP15_FDCAN_BASE	0x4400e000
 #define STM32MP15_CRYP2_BASE	0x4c005000
 #define STM32MP15_CRYP1_BASE	0x54001000
 #define STM32MP15_GPU_BASE	0x59000000
 #define STM32MP15_DSI_BASE	0x5a000000
 
+static const u32 stm32mp13_ip_addr[] = {
+	0x50025000,		/* 0 VREFBUF APB3 */
+	0x50021000,		/* 1 LPTIM2 APB3 */
+	0x50022000,		/* 2 LPTIM3 APB3 */
+	STM32MP13_LTDC_BASE,	/* 3 LTDC APB4 */
+	STM32MP13_DCMIPP_BASE,	/* 4 DCMIPP APB4 */
+	0x5A006000,		/* 5 USBPHYCTRL APB4 */
+	0x5A003000,		/* 6 DDRCTRLPHY APB4 */
+	ETZPC_RESERVED,		/* 7 Reserved*/
+	ETZPC_RESERVED,		/* 8 Reserved*/
+	ETZPC_RESERVED,		/* 9 Reserved*/
+	0x5C006000,		/* 10 TZC APB5 */
+	0x58001000,		/* 11 MCE APB5 */
+	0x5C000000,		/* 12 IWDG1 APB5 */
+	0x5C008000,		/* 13 STGENC APB5 */
+	ETZPC_RESERVED,		/* 14 Reserved*/
+	ETZPC_RESERVED,		/* 15 Reserved*/
+	0x4C000000,		/* 16 USART1 APB6 */
+	0x4C001000,		/* 17 USART2 APB6 */
+	0x4C002000,		/* 18 SPI4 APB6 */
+	0x4C003000,		/* 19 SPI5 APB6 */
+	0x4C004000,		/* 20 I2C3 APB6 */
+	0x4C005000,		/* 21 I2C4 APB6 */
+	0x4C006000,		/* 22 I2C5 APB6 */
+	0x4C007000,		/* 23 TIM12 APB6 */
+	0x4C008000,		/* 24 TIM13 APB6 */
+	0x4C009000,		/* 25 TIM14 APB6 */
+	0x4C00A000,		/* 26 TIM15 APB6 */
+	0x4C00B000,		/* 27 TIM16 APB6 */
+	0x4C00C000,		/* 28 TIM17 APB6 */
+	ETZPC_RESERVED,		/* 29 Reserved*/
+	ETZPC_RESERVED,		/* 30 Reserved*/
+	ETZPC_RESERVED,		/* 31 Reserved*/
+	STM32MP13_ADC1_BASE,	/* 32 ADC1 AHB2 */
+	0x48004000,		/* 33 ADC2 AHB2 */
+	0x49000000,		/* 34 OTG AHB2 */
+	ETZPC_RESERVED,		/* 35 Reserved*/
+	ETZPC_RESERVED,		/* 36 Reserved*/
+	STM32MP13_TSC_BASE,	/* 37 TSC AHB4 */
+	ETZPC_RESERVED,		/* 38 Reserved*/
+	ETZPC_RESERVED,		/* 39 Reserved*/
+	0x54004000,		/* 40 RNG AHB5 */
+	0x54003000,		/* 41 HASH AHB5 */
+	STM32MP13_CRYP_BASE,	/* 42 CRYPT AHB5 */
+	0x54005000,		/* 43 SAES AHB5 */
+	0x54006000,		/* 44 PKA AHB5 */
+	0x54000000,		/* 45 BKPSRAM AHB5 */
+	ETZPC_RESERVED,		/* 46 Reserved*/
+	ETZPC_RESERVED,		/* 47 Reserved*/
+	0x5800A000,		/* 48 ETH1 AHB6 */
+	STM32MP13_ETH2_BASE,	/* 49 ETH2 AHB6 */
+	0x58005000,		/* 50 SDMMC1 AHB6 */
+	0x58007000,		/* 51 SDMMC2 AHB6 */
+	ETZPC_RESERVED,		/* 52 Reserved*/
+	ETZPC_RESERVED,		/* 53 Reserved*/
+	0x58002000,		/* 54 FMC AHB6 */
+	0x58003000,		/* 55 QSPI AHB6 */
+	ETZPC_RESERVED,		/* 56 Reserved*/
+	ETZPC_RESERVED,		/* 57 Reserved*/
+	ETZPC_RESERVED,		/* 58 Reserved*/
+	ETZPC_RESERVED,		/* 59 Reserved*/
+	0x30000000,		/* 60 SRAM1 MLAHB */
+	0x30004000,		/* 61 SRAM2 MLAHB */
+	0x30006000,		/* 62 SRAM3 MLAHB */
+	ETZPC_RESERVED,		/* 63 Reserved*/
+	ETZPC_RESERVED,		/* 64 Reserved*/
+	ETZPC_RESERVED,		/* 65 Reserved*/
+	ETZPC_RESERVED,		/* 66 Reserved*/
+	ETZPC_RESERVED,		/* 67 Reserved*/
+	ETZPC_RESERVED,		/* 68 Reserved*/
+	ETZPC_RESERVED,		/* 69 Reserved*/
+	ETZPC_RESERVED,		/* 70 Reserved*/
+	ETZPC_RESERVED,		/* 71 Reserved*/
+	ETZPC_RESERVED,		/* 72 Reserved*/
+	ETZPC_RESERVED,		/* 73 Reserved*/
+	ETZPC_RESERVED,		/* 74 Reserved*/
+	ETZPC_RESERVED,		/* 75 Reserved*/
+	ETZPC_RESERVED,		/* 76 Reserved*/
+	ETZPC_RESERVED,		/* 77 Reserved*/
+	ETZPC_RESERVED,		/* 78 Reserved*/
+	ETZPC_RESERVED,		/* 79 Reserved*/
+	ETZPC_RESERVED,		/* 80 Reserved*/
+	ETZPC_RESERVED,		/* 81 Reserved*/
+	ETZPC_RESERVED,		/* 82 Reserved*/
+	ETZPC_RESERVED,		/* 83 Reserved*/
+	ETZPC_RESERVED,		/* 84 Reserved*/
+	ETZPC_RESERVED,		/* 85 Reserved*/
+	ETZPC_RESERVED,		/* 86 Reserved*/
+	ETZPC_RESERVED,		/* 87 Reserved*/
+	ETZPC_RESERVED,		/* 88 Reserved*/
+	ETZPC_RESERVED,		/* 89 Reserved*/
+	ETZPC_RESERVED,		/* 90 Reserved*/
+	ETZPC_RESERVED,		/* 91 Reserved*/
+	ETZPC_RESERVED,		/* 92 Reserved*/
+	ETZPC_RESERVED,		/* 93 Reserved*/
+	ETZPC_RESERVED,		/* 94 Reserved*/
+	ETZPC_RESERVED,		/* 95 Reserved*/
+};
+
 static const u32 stm32mp15_ip_addr[] = {
 	0x5c008000,	/* 00 stgenc */
 	0x54000000,	/* 01 bkpsram */
@@ -163,8 +270,10 @@ static int stm32_fdt_fixup_etzpc(void *fdt, int soc_node)
 	int offset, shift;
 	u32 addr, status, decprot[ETZPC_DECPROT_NB];
 
-	if (IS_ENABLED(CONFIG_STM32MP13x))
-		return 0;
+	if (IS_ENABLED(CONFIG_STM32MP13x)) {
+		array = stm32mp13_ip_addr;
+		array_size = ARRAY_SIZE(stm32mp13_ip_addr);
+	}
 
 	if (IS_ENABLED(CONFIG_STM32MP15x)) {
 		array = stm32mp15_ip_addr;
@@ -253,6 +362,43 @@ static void stm32_fdt_disable_optee(void *blob)
 	}
 }
 
+static void stm32mp13_fdt_fixup(void *blob, int soc, u32 cpu, char *name)
+{
+	switch (cpu) {
+	case CPU_STM32MP131Fxx:
+	case CPU_STM32MP131Dxx:
+	case CPU_STM32MP131Cxx:
+	case CPU_STM32MP131Axx:
+		stm32_fdt_disable(blob, soc, STM32MP13_FDCAN_BASE, "can", name);
+		stm32_fdt_disable(blob, soc, STM32MP13_ADC1_BASE, "adc", name);
+		fallthrough;
+	case CPU_STM32MP133Fxx:
+	case CPU_STM32MP133Dxx:
+	case CPU_STM32MP133Cxx:
+	case CPU_STM32MP133Axx:
+		stm32_fdt_disable(blob, soc, STM32MP13_LTDC_BASE, "ltdc", name);
+		stm32_fdt_disable(blob, soc, STM32MP13_DCMIPP_BASE, "dcmipp",
+				  name);
+		stm32_fdt_disable(blob, soc, STM32MP13_TSC_BASE, "tsc", name);
+		break;
+	default:
+		break;
+	}
+
+	switch (cpu) {
+	case CPU_STM32MP135Dxx:
+	case CPU_STM32MP135Axx:
+	case CPU_STM32MP133Dxx:
+	case CPU_STM32MP133Axx:
+	case CPU_STM32MP131Dxx:
+	case CPU_STM32MP131Axx:
+		stm32_fdt_disable(blob, soc, STM32MP13_CRYP_BASE, "cryp", name);
+		break;
+	default:
+		break;
+	}
+}
+
 static void stm32mp15_fdt_fixup(void *blob, int soc, u32 cpu, char *name)
 {
 	u32 pkg;
@@ -342,6 +488,9 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 	cpu = get_cpu_type();
 	get_soc_name(name);
 
+	if (IS_ENABLED(CONFIG_STM32MP13x))
+		stm32mp13_fdt_fixup(blob, soc, cpu, name);
+
 	if (IS_ENABLED(CONFIG_STM32MP15x)) {
 		stm32mp15_fdt_fixup(blob, soc, cpu, name);
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
