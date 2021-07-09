Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2843C2364
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Jul 2021 14:24:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25E14C32EA6;
	Fri,  9 Jul 2021 12:24:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 658FCC424BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jul 2021 12:24:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169CDA59007888; Fri, 9 Jul 2021 14:24:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=T9Ts3bRakefbaQRVsPbGijXSHRMbBhacY84S94Ex2mA=;
 b=EVrMRWYX31JEs/93wFSmCmAgwzOIGbnm3EjgjieyM/V71472NiTig8WFquMY65RHuZmr
 VM2unnTSG6vvA17HzDz38k+RfTVZhnsBpqqJbDkytLpvatddYbgnDyiEnjvraKpg8iXB
 lz5hP3bHeoRPG08VHZDczLrBKInkgt2n2YtTN2C2e3LbCh4DycKWhERHi+ghRPpzXXtG
 AUHU9wbej4msmtG2UgrS416Xrtb+8dQvgBCUU1fhPiSkStVjFj53+QydEGNW0kx3ZUSX
 Wc+/ibFD+fwFb2vv3TsV/UWqxopseaAVCwAtbpNTMme5H+aPgk2Sar0NM1C97eRARfgZ Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39pk0ss8mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 14:24:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B5BB310002A;
 Fri,  9 Jul 2021 14:24:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F2842238B0;
 Fri,  9 Jul 2021 14:24:36 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul 2021 14:24:36
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 9 Jul 2021 14:24:34 +0200
Message-ID: <20210709142429.1.I9f0b06646bc5c9c2a673537caa8f5364e39793b3@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_05:2021-07-09,
 2021-07-09 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH] clk: stm32mp1: add support of missing SPI
	clocks
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

Add the missing SPI clock even if these instances are not available
on STMicroelectronics boards: SPI2_K, SPI3_K, SPI4_K, SPI6_K.

With this patch, the SPI2 / SPI3 / SPI4 / SPI6 instances can be used on
customer design without the clock driver error:
  stm32mp1_clk_get_id: clk id 131 not found

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/clk/clk_stm32mp1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index 0c0ef366a1..599c2e7095 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -73,6 +73,7 @@ DECLARE_GLOBAL_DATA_PTR;
 #define RCC_PLL2FRACR		0xA0
 #define RCC_PLL2CSGR		0xA4
 #define RCC_I2C46CKSELR		0xC0
+#define RCC_SPI6CKSELR		0xC4
 #define RCC_CPERCKSELR		0xD0
 #define RCC_STGENCKSELR		0xD4
 #define RCC_DDRITFCR		0xD8
@@ -103,6 +104,7 @@ DECLARE_GLOBAL_DATA_PTR;
 #define RCC_I2C12CKSELR		0x8C0
 #define RCC_I2C35CKSELR		0x8C4
 #define RCC_SPI2S1CKSELR	0x8D8
+#define RCC_SPI2S23CKSELR	0x8DC
 #define RCC_SPI45CKSELR		0x8E0
 #define RCC_UART6CKSELR		0x8E4
 #define RCC_UART24CKSELR	0x8E8
@@ -313,7 +315,9 @@ enum stm32mp1_parent_sel {
 	_DSI_SEL,
 	_ADC12_SEL,
 	_SPI1_SEL,
+	_SPI23_SEL,
 	_SPI45_SEL,
+	_SPI6_SEL,
 	_RTC_SEL,
 	_PARENT_SEL_NB,
 	_UNKNOWN_SEL = 0xff,
@@ -524,6 +528,8 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
 	STM32MP1_CLK(RCC_DDRITFCR, 9, DDRPHYCAPB, _UNKNOWN_SEL),
 	STM32MP1_CLK(RCC_DDRITFCR, 10, DDRPHYCAPBLP, _UNKNOWN_SEL),
 
+	STM32MP1_CLK_SET_CLR(RCC_MP_APB1ENSETR, 11, SPI2_K, _SPI23_SEL),
+	STM32MP1_CLK_SET_CLR(RCC_MP_APB1ENSETR, 12, SPI3_K, _SPI23_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB1ENSETR, 14, USART2_K, _UART24_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB1ENSETR, 15, USART3_K, _UART35_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB1ENSETR, 16, UART4_K, _UART24_SEL),
@@ -536,6 +542,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB1ENSETR, 24, I2C5_K, _I2C35_SEL),
 
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB2ENSETR, 8, SPI1_K, _SPI1_SEL),
+	STM32MP1_CLK_SET_CLR(RCC_MP_APB2ENSETR, 9, SPI4_K, _SPI45_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB2ENSETR, 10, SPI5_K, _SPI45_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB2ENSETR, 13, USART6_K, _UART6_SEL),
 
@@ -548,6 +555,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB4ENSETR, 15, IWDG2, _UNKNOWN_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB4ENSETR, 16, USBPHY_K, _USBPHY_SEL),
 
+	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 0, SPI6_K, _SPI6_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 2, I2C4_K, _I2C46_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 3, I2C6_K, _I2C46_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 8, RTCAPB, _PCLK5),
@@ -612,10 +620,13 @@ static const u8 usbo_parents[] = {_PLL4_R, _USB_PHY_48};
 static const u8 stgen_parents[] = {_HSI_KER, _HSE_KER};
 static const u8 dsi_parents[] = {_DSI_PHY, _PLL4_P};
 static const u8 adc_parents[] = {_PLL4_R, _CK_PER, _PLL3_Q};
+/* same parents for SPI1=RCC_SPI2S1CKSELR and SPI2&3 = RCC_SPI2S23CKSELR */
 static const u8 spi_parents[] = {_PLL4_P, _PLL3_Q, _I2S_CKIN, _CK_PER,
 				 _PLL3_R};
 static const u8 spi45_parents[] = {_PCLK2, _PLL4_Q, _HSI_KER, _CSI_KER,
 				   _HSE_KER};
+static const u8 spi6_parents[] = {_PCLK5, _PLL4_Q, _HSI_KER, _CSI_KER,
+				  _HSE_KER, _PLL3_Q};
 static const u8 rtc_parents[] = {_UNKNOWN_ID, _LSE, _LSI, _HSE};
 
 static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
@@ -642,7 +653,9 @@ static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
 	STM32MP1_CLK_PARENT(_DSI_SEL, RCC_DSICKSELR, 0, 0x1, dsi_parents),
 	STM32MP1_CLK_PARENT(_ADC12_SEL, RCC_ADCCKSELR, 0, 0x3, adc_parents),
 	STM32MP1_CLK_PARENT(_SPI1_SEL, RCC_SPI2S1CKSELR, 0, 0x7, spi_parents),
+	STM32MP1_CLK_PARENT(_SPI23_SEL, RCC_SPI2S23CKSELR, 0, 0x7, spi_parents),
 	STM32MP1_CLK_PARENT(_SPI45_SEL, RCC_SPI45CKSELR, 0, 0x7, spi45_parents),
+	STM32MP1_CLK_PARENT(_SPI6_SEL, RCC_SPI6CKSELR, 0, 0x7, spi6_parents),
 	STM32MP1_CLK_PARENT(_RTC_SEL, RCC_BDCR, RCC_BDCR_RTCSRC_SHIFT,
 			    (RCC_BDCR_RTCSRC_MASK >> RCC_BDCR_RTCSRC_SHIFT),
 			    rtc_parents),
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
