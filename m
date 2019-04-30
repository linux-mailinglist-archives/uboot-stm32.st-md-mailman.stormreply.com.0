Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEC4FD7B
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 18:08:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0ADEC35E03
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 16:08:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 249CEC36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 16:08:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UFpPfx005729; Tue, 30 Apr 2019 18:08:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=1WXM1drwuXDp2sGCiuYiiVt9N8wFTBYrKBIfQbuUXak=;
 b=USx14C1Bd2NTyhgNIvrMBrPqLu4iqIKimCjDviEgwmBROQkWdsBD4jNAFxdyg/2S8g0q
 hc4X1JIfBWLqs6Ph0FjkIPykcw+DBba2BAwFM1dbWWML+OjoT241H9uemdV0NjNIEE2f
 X/drtfHw4O16nrSd/uEtqn0+ToDA3cePP6jsQuBJIn3bIyTACqZTyJrfzKjfgDbnV5XN
 JHrnJn1fTNwL7MfzYxHkLYyP7TPr9do0HU65lRjb+MJ6VzDaABCpLtjNZNR+YE/cB9b5
 ar68c5T7hhkNtbtUpdJmSh0sBusRMp3OPDdIxEaP+j8UWCpHy/6ao3/m1S4t5ckpp/aC Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s61r0f26p-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Apr 2019 18:08:32 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B54A831;
 Tue, 30 Apr 2019 16:08:30 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C209B2997;
 Tue, 30 Apr 2019 16:08:30 +0000 (GMT)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 30 Apr 2019 18:08:30 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Apr 2019 18:08:27 +0200
Message-ID: <1556640509-27836-2-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556640509-27836-1-git-send-email-patrice.chotard@st.com>
References: <1556640509-27836-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/3] clk: stm32mp1: Add SPI1 clock entry
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

Add missing SPI1 clock needed by SPI1 instance.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 drivers/clk/clk_stm32mp1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index 24859fd..800ded7 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -90,6 +90,7 @@
 #define RCC_PLL4CSGR		0x8A4
 #define RCC_I2C12CKSELR		0x8C0
 #define RCC_I2C35CKSELR		0x8C4
+#define RCC_SPI2S1CKSELR	0x8D8
 #define RCC_UART6CKSELR		0x8E4
 #define RCC_UART24CKSELR	0x8E8
 #define RCC_UART35CKSELR	0x8EC
@@ -298,6 +299,7 @@ enum stm32mp1_parent_sel {
 	_STGEN_SEL,
 	_DSI_SEL,
 	_ADC12_SEL,
+	_SPI1_SEL,
 	_PARENT_SEL_NB,
 	_UNKNOWN_SEL = 0xff,
 };
@@ -519,6 +521,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB1ENSETR, 23, I2C3_K, _I2C35_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB1ENSETR, 24, I2C5_K, _I2C35_SEL),
 
+	STM32MP1_CLK_SET_CLR(RCC_MP_APB2ENSETR, 8, SPI1_K, _SPI1_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB2ENSETR, 13, USART6_K, _UART6_SEL),
 
 	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB3ENSETR, 13, VREF, _PCLK3),
@@ -589,6 +592,8 @@ static const u8 usbo_parents[] = {_PLL4_R, _USB_PHY_48};
 static const u8 stgen_parents[] = {_HSI_KER, _HSE_KER};
 static const u8 dsi_parents[] = {_DSI_PHY, _PLL4_P};
 static const u8 adc_parents[] = {_PLL4_R, _CK_PER, _PLL3_Q};
+static const u8 spi_parents[] = {_PLL4_P, _PLL3_Q, _I2S_CKIN, _CK_PER,
+				 _PLL3_R};
 
 static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
 	STM32MP1_CLK_PARENT(_I2C12_SEL, RCC_I2C12CKSELR, 0, 0x7, i2c12_parents),
@@ -613,6 +618,7 @@ static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
 	STM32MP1_CLK_PARENT(_STGEN_SEL, RCC_STGENCKSELR, 0, 0x3, stgen_parents),
 	STM32MP1_CLK_PARENT(_DSI_SEL, RCC_DSICKSELR, 0, 0x1, dsi_parents),
 	STM32MP1_CLK_PARENT(_ADC12_SEL, RCC_ADCCKSELR, 0, 0x1, adc_parents),
+	STM32MP1_CLK_PARENT(_SPI1_SEL, RCC_SPI2S1CKSELR, 0, 0x7, spi_parents),
 };
 
 #ifdef STM32MP1_CLOCK_TREE_INIT
@@ -727,6 +733,7 @@ char * const stm32mp1_clk_parent_sel_name[_PARENT_SEL_NB] = {
 	[_STGEN_SEL] = "STGEN",
 	[_DSI_SEL] = "DSI",
 	[_ADC12_SEL] = "ADC12",
+	[_SPI1_SEL] = "SPI1",
 };
 
 static const struct stm32mp1_clk_data stm32mp1_data = {
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
