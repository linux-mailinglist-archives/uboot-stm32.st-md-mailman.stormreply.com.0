Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9783F17E1D0
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Mar 2020 14:59:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECF2AC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Mar 2020 13:59:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0B5EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2020 13:59:32 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 029DrwRS018656; Mon, 9 Mar 2020 14:59:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=aWCHS/DM2/ZZE9XNbHlx+LcGO4RwlkN5CiV8M14ftKk=;
 b=fFHmM4qwLaxV7Ky567NKqWPUUq7RY+SVIxTlf3tQaptwGAHQ03r9AV598EBxhd1QaJZt
 NxaUwRbPVkCrHESDYlKmvi3aDZUqP/kChqAMOjZKXYJWcbzfscUDyXYyFnkqOLTTWhqn
 SeIwWlRWKeJ8/O55Gv0fuubmSB9r5rgfj27KZqfi3QTjpJ/oEEQ8Ba9s14kj23e/WJpw
 eeVUPQTX6u6DxRcdHDb7gtXblGRd51EhG+xpxRqMm2FoMdZHZiorHry/yOAa4Dun0u2c
 79y4vQ75WBTI8yEvXmclTOFB1qmPTFsrHT9p1R9MDn2NlRG7EvtWhhlUSKCb8uO1a/FO KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym1mgmnvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2020 14:59:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8590A100034;
 Mon,  9 Mar 2020 14:59:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7980220D8EA;
 Mon,  9 Mar 2020 14:59:27 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 9 Mar 2020 14:59:27 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 9 Mar 2020 14:59:23 +0100
Message-ID: <20200309135923.429-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309135923.429-1-patrick.delaunay@st.com>
References: <20200309135923.429-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_04:2020-03-09,
 2020-03-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] clk: stm32mp1: add SPI5_K support
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

Add clock support for SPI5, as this instance is available on extension
connector of ST board.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/clk/clk_stm32mp1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index 42f9ef4e46..52bd8e96f3 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -95,6 +95,7 @@ DECLARE_GLOBAL_DATA_PTR;
 #define RCC_I2C12CKSELR		0x8C0
 #define RCC_I2C35CKSELR		0x8C4
 #define RCC_SPI2S1CKSELR	0x8D8
+#define RCC_SPI45CKSELR		0x8E0
 #define RCC_UART6CKSELR		0x8E4
 #define RCC_UART24CKSELR	0x8E8
 #define RCC_UART35CKSELR	0x8EC
@@ -304,6 +305,7 @@ enum stm32mp1_parent_sel {
 	_DSI_SEL,
 	_ADC12_SEL,
 	_SPI1_SEL,
+	_SPI45_SEL,
 	_RTC_SEL,
 	_PARENT_SEL_NB,
 	_UNKNOWN_SEL = 0xff,
@@ -527,6 +529,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB1ENSETR, 24, I2C5_K, _I2C35_SEL),
 
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB2ENSETR, 8, SPI1_K, _SPI1_SEL),
+	STM32MP1_CLK_SET_CLR(RCC_MP_APB2ENSETR, 10, SPI5_K, _SPI45_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB2ENSETR, 13, USART6_K, _UART6_SEL),
 
 	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB3ENSETR, 13, VREF, _PCLK3),
@@ -603,6 +606,8 @@ static const u8 dsi_parents[] = {_DSI_PHY, _PLL4_P};
 static const u8 adc_parents[] = {_PLL4_R, _CK_PER, _PLL3_Q};
 static const u8 spi_parents[] = {_PLL4_P, _PLL3_Q, _I2S_CKIN, _CK_PER,
 				 _PLL3_R};
+static const u8 spi45_parents[] = {_PCLK2, _PLL4_Q, _HSI_KER, _CSI_KER,
+				   _HSE_KER};
 static const u8 rtc_parents[] = {_UNKNOWN_ID, _LSE, _LSI, _HSE};
 
 static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
@@ -629,6 +634,7 @@ static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
 	STM32MP1_CLK_PARENT(_DSI_SEL, RCC_DSICKSELR, 0, 0x1, dsi_parents),
 	STM32MP1_CLK_PARENT(_ADC12_SEL, RCC_ADCCKSELR, 0, 0x3, adc_parents),
 	STM32MP1_CLK_PARENT(_SPI1_SEL, RCC_SPI2S1CKSELR, 0, 0x7, spi_parents),
+	STM32MP1_CLK_PARENT(_SPI45_SEL, RCC_SPI45CKSELR, 0, 0x7, spi45_parents),
 	STM32MP1_CLK_PARENT(_RTC_SEL, RCC_BDCR, RCC_BDCR_RTCSRC_SHIFT,
 			    (RCC_BDCR_RTCSRC_MASK >> RCC_BDCR_RTCSRC_SHIFT),
 			    rtc_parents),
@@ -747,6 +753,7 @@ char * const stm32mp1_clk_parent_sel_name[_PARENT_SEL_NB] = {
 	[_DSI_SEL] = "DSI",
 	[_ADC12_SEL] = "ADC12",
 	[_SPI1_SEL] = "SPI1",
+	[_SPI45_SEL] = "SPI45",
 	[_RTC_SEL] = "RTC",
 };
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
