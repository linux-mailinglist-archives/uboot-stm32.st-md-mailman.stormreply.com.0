Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B95DF3B705D
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Jun 2021 12:04:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B143C58D78;
	Tue, 29 Jun 2021 10:04:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B460C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jun 2021 10:04:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15T9woiV016468; Tue, 29 Jun 2021 12:04:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=SB/uhHmY5/Hhrrc7yoqnAb77+n5MqFlZ4irxzWNMT3s=;
 b=b1p2pWd9POXg9nnf9KCtrgmOqmdEByJhXuB+hWsWnpjwomqly/UQH10t+zEy2YnWnV7W
 8XYZpxGy22IUsaTppIdqYtfy/9DFOf6/L0u5jBudSzCdQaiv7qo+9aFxnLgF4YETrKKN
 XpamPO7Hu5bZ8S4aIm+qWLZBpe6usFBLdp8XJolL3T6W4rn7kV39bK2XtJLci9fzfBa9
 TfHloXlpJC59Nun7QRGwnLdpoR7c1YhSNNxoyZgg5/4VDL3U0uaBOygAySnvX/yaLtmK
 QQt5HOpiXd24uQ8NCL3rGPePHYOOFJlcpjABiGzE5tjzEKf0y3/r8QjNlyiDnGps5tG0 iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39fxbnhddd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 12:04:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8BA2F10002A;
 Tue, 29 Jun 2021 12:04:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 77F9221ED39;
 Tue, 29 Jun 2021 12:04:25 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun 2021 12:04:25
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 29 Jun 2021 12:04:22 +0200
Message-ID: <20210629120417.1.I711fb255292d0f086a2632041897c48c163403bd@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_05:2021-06-25,
 2021-06-29 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH 1/2] clk: stm32mp1: add support of SYSCFG clock
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

Add the support of SYSCFG clock used by syscon driver
to prepare the clock management of STM32MP_SYSCON_SYSCFG.

This clock is already defined in kernel device tree,
stm32mp151.dtsi but not yet supported in the syscon driver:

syscfg: syscon@50020000 {
	compatible = "st,stm32mp157-syscfg", "syscon";
	reg = <0x50020000 0x400>;
	clocks = <&rcc SYSCFG>;
};

It is safe to support this clock in U-Boot driver with
RCC_MC_APB3ENSETR, Bit 11 SYSCFGEN: SYSCFG peripheral clocks
enable.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/clk/clk_stm32mp1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index 0c0ef366a1..48c9514ba0 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -540,6 +540,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB2ENSETR, 13, USART6_K, _UART6_SEL),
 
 	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB3ENSETR, 13, VREF, _PCLK3),
+	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB3ENSETR, 11, SYSCFG, _UNKNOWN_SEL),
 
 	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB4ENSETR, 0, LTDC_PX, _PLL4_Q),
 	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB4ENSETR, 4, DSI_PX, _PLL4_Q),
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
