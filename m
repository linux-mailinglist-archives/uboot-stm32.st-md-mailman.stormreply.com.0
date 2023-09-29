Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C525C7B317B
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 Sep 2023 13:34:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79749C6B474;
	Fri, 29 Sep 2023 11:34:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDD2BC6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Sep 2023 11:34:38 +0000 (UTC)
Received: from crub.agik.hopto.org (pd95f1e86.dip0.t-ipconnect.de
 [217.95.30.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3F58D86488;
 Fri, 29 Sep 2023 13:34:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1695987278;
 bh=5jCc3vyeeGFcUgfJHdd6MzvWY9u2M05i95aA3O971tk=;
 h=From:To:Cc:Subject:Date:From;
 b=aXCItqUW6/DrP6UwhaH5TeuadKRt5DbDSedmY/0lOAtefe1Zt/B0giEcGqdLvzp82
 x9FHSyW4HXiq9LceEqXjEGTBqsgcY9Y6tUDg1etj4NLWKJPVB8MMdNVfDIW5eBGYvT
 SGKtEzGHH4a5sYGqnpkOOJqINsEB3+u02wF6kd63QKLdBiVqWnv7W4MeQoUH1IYL8R
 3yZ4sjVKvG3EXPDowzLHFNzAeqO/KK/HgeMoX1u5lyRSEZt/gb5jni4WomahDdPtPr
 tv6Z0ls9ddTXbRMhg3KN8nKkLYjrUTHHqtG1P+lAdwMEs4sfD/4rIKWdoPxOevBsUx
 FK11fjKrAsYjA==
From: Anatolij Gustschin <agust@denx.de>
To: u-boot@lists.denx.de
Date: Fri, 29 Sep 2023 13:34:37 +0200
Message-Id: <20230929113437.26081-1-agust@denx.de>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 lukma@denx.de, seanga2@gmail.com
Subject: [Uboot-stm32] [PATCH] clk: stm32mp1: Add support for USART1 clock
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Add USART1 clock parents and mux configuration. This allows
support for configuring the USART1 as the serial console in
SPL and U-Boot via device tree. Without this patch the SPL
with usart1 serial console enabled crashes because it can
not find the clock specified in the device tree for usart1.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/clk/stm32/clk-stm32mp1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index 6150287694..f3ac8c7583 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -72,6 +72,7 @@ DECLARE_GLOBAL_DATA_PTR;
 #define RCC_PLL2CSGR		0xA4
 #define RCC_I2C46CKSELR		0xC0
 #define RCC_SPI6CKSELR		0xC4
+#define RCC_UART1CKSELR		0xC8
 #define RCC_CPERCKSELR		0xD0
 #define RCC_STGENCKSELR		0xD4
 #define RCC_DDRITFCR		0xD8
@@ -317,6 +318,7 @@ enum stm32mp1_parent_sel {
 	_SPI45_SEL,
 	_SPI6_SEL,
 	_RTC_SEL,
+	_UART1_SEL,
 	_PARENT_SEL_NB,
 	_UNKNOWN_SEL = 0xff,
 };
@@ -557,6 +559,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 0, SPI6_K, _SPI6_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 2, I2C4_K, _I2C46_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 3, I2C6_K, _I2C46_SEL),
+	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 4, USART1_K, _UART1_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 8, RTCAPB, _PCLK5),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 16, BSEC, _UNKNOWN_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 20, STGEN_K, _STGEN_SEL),
@@ -602,6 +605,8 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
 static const u8 i2c12_parents[] = {_PCLK1, _PLL4_R, _HSI_KER, _CSI_KER};
 static const u8 i2c35_parents[] = {_PCLK1, _PLL4_R, _HSI_KER, _CSI_KER};
 static const u8 i2c46_parents[] = {_PCLK5, _PLL3_Q, _HSI_KER, _CSI_KER};
+static const u8 uart1_parents[] = {_PCLK5, _PLL3_Q, _HSI_KER, _CSI_KER,
+					_PLL4_Q, _HSE_KER};
 static const u8 uart6_parents[] = {_PCLK2, _PLL4_Q, _HSI_KER, _CSI_KER,
 					_HSE_KER};
 static const u8 uart24_parents[] = {_PCLK1, _PLL4_Q, _HSI_KER, _CSI_KER,
@@ -659,6 +664,7 @@ static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
 	STM32MP1_CLK_PARENT(_RTC_SEL, RCC_BDCR, RCC_BDCR_RTCSRC_SHIFT,
 			    (RCC_BDCR_RTCSRC_MASK >> RCC_BDCR_RTCSRC_SHIFT),
 			    rtc_parents),
+	STM32MP1_CLK_PARENT(_UART1_SEL, RCC_UART1CKSELR, 0, 0x7, uart1_parents),
 };
 
 #ifdef STM32MP1_CLOCK_TREE_INIT
@@ -786,6 +792,7 @@ char * const stm32mp1_clk_parent_sel_name[_PARENT_SEL_NB] = {
 	[_SPI1_SEL] = "SPI1",
 	[_SPI45_SEL] = "SPI45",
 	[_RTC_SEL] = "RTC",
+	[_UART1_SEL] = "UART1",
 };
 
 static const struct stm32mp1_clk_data stm32mp1_data = {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
