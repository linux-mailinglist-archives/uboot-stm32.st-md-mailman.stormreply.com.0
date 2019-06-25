Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9BD527FC
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 11:24:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39F09D12B83
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 09:24:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2C6ED12B81
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 09:24:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P9COZb020017; Tue, 25 Jun 2019 11:24:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=J3H/lTMhipyqSEOyoUa3VGcseM6/c0Jko/x/tNKfELs=;
 b=KgQHdKRmcATRREse6BfSnlOaQz9dLDxUrndxoGtmK/Bjcn/dtQSWZXuu7zSaIiUBbyOq
 jrFUFNPd5/wA5tauHiWtKAxOzmpovzGRURm2ZMmY2Y8AZ6Sp2V3ILLOMwRhK/yBeT7Xy
 Kew3fBTE1R3rGPGwDVnWFQfU5A9Hz3CNnfkcehGNJH1fA9wnVOU5SHCRc1fyW0NV2eZA
 GvOUJP63FN6UDGMXfsbZZ9XAFp5qZGgvhXvqFZiqAiajoFSkZgX7+1KktxtHJBSkG0Q5
 h7wB+mBHX+EVgBVw2rPE7xhs81cmqcHSLhaBCFuNiScMT5UGhUshdAu6dT1ePrP5Ryu6 hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t9d2jghna-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 11:24:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0018834;
 Tue, 25 Jun 2019 09:24:18 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1BA31637;
 Tue, 25 Jun 2019 09:24:18 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 25 Jun
 2019 11:24:18 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 25 Jun 2019 11:24:18
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <patrick.delaunay@st.com>, <patrice.chotard@st.com>, <sjg@chromium.org>
Date: Tue, 25 Jun 2019 11:24:00 +0200
Message-ID: <20190625092401.4573-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190625092401.4573-1-benjamin.gaignard@st.com>
References: <20190625092401.4573-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_06:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] clk: stm32mp1: Add RTC clock entry
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

From: Patrick Delaunay <patrick.delaunay@st.com>

Add RTCAPB and RTC clock support.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
 drivers/clk/clk_stm32mp1.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index f295e4864b..97d4a34deb 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -300,6 +300,7 @@ enum stm32mp1_parent_sel {
 	_DSI_SEL,
 	_ADC12_SEL,
 	_SPI1_SEL,
+	_RTC_SEL,
 	_PARENT_SEL_NB,
 	_UNKNOWN_SEL = 0xff,
 };
@@ -534,6 +535,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB4ENSETR, 16, USBPHY_K, _USBPHY_SEL),
 
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 2, I2C4_K, _I2C46_SEL),
+	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 8, RTCAPB, _PCLK5),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 20, STGEN_K, _STGEN_SEL),
 
 	STM32MP1_CLK_SET_CLR_F(RCC_MP_AHB2ENSETR, 5, ADC12, _HCLK2),
@@ -569,6 +571,8 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
 	STM32MP1_CLK_SET_CLR(RCC_MP_AHB6ENSETR, 24, USBH, _UNKNOWN_SEL),
 
 	STM32MP1_CLK(RCC_DBGCFGR, 8, CK_DBG, _UNKNOWN_SEL),
+
+	STM32MP1_CLK(RCC_BDCR, 20, RTC, _RTC_SEL),
 };
 
 static const u8 i2c12_parents[] = {_PCLK1, _PLL4_R, _HSI_KER, _CSI_KER};
@@ -594,6 +598,7 @@ static const u8 dsi_parents[] = {_DSI_PHY, _PLL4_P};
 static const u8 adc_parents[] = {_PLL4_R, _CK_PER, _PLL3_Q};
 static const u8 spi_parents[] = {_PLL4_P, _PLL3_Q, _I2S_CKIN, _CK_PER,
 				 _PLL3_R};
+static const u8 rtc_parents[] = {_UNKNOWN_ID, _LSE, _LSI, _HSE};
 
 static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
 	STM32MP1_CLK_PARENT(_I2C12_SEL, RCC_I2C12CKSELR, 0, 0x7, i2c12_parents),
@@ -619,6 +624,9 @@ static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
 	STM32MP1_CLK_PARENT(_DSI_SEL, RCC_DSICKSELR, 0, 0x1, dsi_parents),
 	STM32MP1_CLK_PARENT(_ADC12_SEL, RCC_ADCCKSELR, 0, 0x1, adc_parents),
 	STM32MP1_CLK_PARENT(_SPI1_SEL, RCC_SPI2S1CKSELR, 0, 0x7, spi_parents),
+	STM32MP1_CLK_PARENT(_RTC_SEL, RCC_BDCR, RCC_BDCR_RTCSRC_SHIFT,
+			    (RCC_BDCR_RTCSRC_MASK >> RCC_BDCR_RTCSRC_SHIFT),
+			    rtc_parents),
 };
 
 #ifdef STM32MP1_CLOCK_TREE_INIT
@@ -734,6 +742,7 @@ char * const stm32mp1_clk_parent_sel_name[_PARENT_SEL_NB] = {
 	[_DSI_SEL] = "DSI",
 	[_ADC12_SEL] = "ADC12",
 	[_SPI1_SEL] = "SPI1",
+	[_RTC_SEL] = "RTC",
 };
 
 static const struct stm32mp1_clk_data stm32mp1_data = {
-- 
2.15.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
