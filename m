Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 069EBA96C3B
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 15:14:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD355C78034;
	Tue, 22 Apr 2025 13:14:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E21E1C6C83D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 13:14:07 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MBJ4Gp016394;
 Tue, 22 Apr 2025 15:14:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 x/7UWwbnKfddCdZ5luLzOerKNYyfGmXbAiF6c5eXT08=; b=EePjrBFUKQ2SVlkF
 m2xTrcXAo8lNxFTxjfYC5r6REnrhldGqy5Rb8cAIY6O4rJVKQ6FGui+KK+P3CPXL
 OlKPu5UTpqp+qZAr2lrGfeufZ1Vt7cKypZjdGmuMShlUo54oJAlURdzWeTzOtnAg
 Slx278D/75n/vVN6hpC3Q6FNsPXz8+hj0s1XtFly87b1hk3CDBxkb3gH047ayfkg
 OoXl9ceUw5nOTvefbulQtfHQluM1qbSTpm1EWQ0osYZ2Yr0B2saNPvvA4PTdHJZ9
 kzHthWBVRLKg7EeJZY7cLsnPDiIKy3sgTn6NfhfVsuQqo7DKtJUFqEr1S11JX7Gq
 p4HjOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46418matys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 15:14:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7F99540052;
 Tue, 22 Apr 2025 15:13:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2CE076F1894;
 Tue, 22 Apr 2025 15:12:41 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 15:12:40 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 22 Apr 2025 15:12:24 +0200
Message-ID: <20250422131229.415020-9-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422131229.415020-1-patrice.chotard@foss.st.com>
References: <20250422131229.415020-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 08/13] clk: stm32mp1: fix DSI clock setting
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

DSI is the peripheral clock, while DSI_K is an internal kernel clock.
Even though they get the same register and same bit set to be gated,
resulting in the same behavior.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 drivers/clk/stm32/clk-stm32mp1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index 4044edfb768..9cb69a01f7f 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -551,6 +551,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
 	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB4ENSETR, 0, LTDC_PX, _PLL4_Q),
 	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB4ENSETR, 4, DSI_PX, _PLL4_Q),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB4ENSETR, 4, DSI_K, _DSI_SEL),
+	STM32MP1_CLK_SET_CLR(RCC_MP_APB4ENSETR, 4, DSI, _DSI_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB4ENSETR, 8, DDRPERFM, _UNKNOWN_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB4ENSETR, 15, IWDG2, _UNKNOWN_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB4ENSETR, 16, USBPHY_K, _USBPHY_SEL),
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
