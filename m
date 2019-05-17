Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5485218DE
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 May 2019 15:08:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75883C54512
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 May 2019 13:08:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28A63C29037
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2019 13:08:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HD72oT003558; Fri, 17 May 2019 15:08:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4QOdnlbLkjr9tmWCrGoA2zdYGZ47aOch85tzJV8DL9E=;
 b=bLoCc7lhmDsSIt1Pc5ldwNmw0L1N3S2qKe6oEDLuDKB3+t55xqa8wh1oZQdULxCrwJbl
 Rh6dcGgOVAW99KEPC3VmlhLOseyLzVMqBbdxgzAVGJC8XYfKsSBhQtXgqTMRGSp0/DR9
 tr6JWQEh6fIqrbo+ngd5xPHD+niDiO5fo/sG2ejQNom1sBXENG0wGPL9NPZmBBbZ5Bb1
 ZgsFoStpP3ylflifZm/yX0zoTgQSMiu5pHkJrXhoyliS8Q3YvrtLx3SjiYyy5wnYK3aW
 5y0mjrUEv+G25v6C29wT8l1hs4wKqX9j3qCxko6ymWiIatL3YkMcWbiXGj1lhbj/qHBz Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdkv0dv38-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 17 May 2019 15:08:52 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8430431;
 Fri, 17 May 2019 13:08:51 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7026E2B19;
 Fri, 17 May 2019 13:08:51 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 17 May
 2019 15:08:51 +0200
Received: from localhost (10.201.22.222) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 17 May 2019 15:08:50
 +0200
From: Christophe Roullier <christophe.roullier@st.com>
To: Christophe Roullier <christophe.roullier@st.com>, <u-boot@lists.denx.de>
Date: Fri, 17 May 2019 15:08:42 +0200
Message-ID: <20190517130847.13144-2-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517130847.13144-1-christophe.roullier@st.com>
References: <20190517130847.13144-1-christophe.roullier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.222]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_07:, , signatures=0
Cc: Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v2 1/6] stm32mp1: clk: use the correct
	identifier for ethck
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

ETHCK_K is the identifier the kernel clock for ETH in kernel
binding, selected by ETHKSELR / gated by ETHCKEN = BIT(7).
U-Boot driver need to use the same identifier, so change ETHCK
to ETHCK_K.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---

Changes in v2: None

 drivers/clk/clk_stm32mp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index 24859fd054e..422176f3dde 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -555,7 +555,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
 
 	STM32MP1_CLK_SET_CLR(RCC_MP_AHB5ENSETR, 0, GPIOZ, _UNKNOWN_SEL),
 
-	STM32MP1_CLK_SET_CLR(RCC_MP_AHB6ENSETR, 7, ETHCK, _ETH_SEL),
+	STM32MP1_CLK_SET_CLR(RCC_MP_AHB6ENSETR, 7, ETHCK_K, _ETH_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_AHB6ENSETR, 8, ETHTX, _UNKNOWN_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_AHB6ENSETR, 9, ETHRX, _UNKNOWN_SEL),
 	STM32MP1_CLK_SET_CLR_F(RCC_MP_AHB6ENSETR, 10, ETHMAC, _ACLK),
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
