Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3821B7766
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 15:48:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B64BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 13:48:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F323FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 13:48:12 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ODlRkQ001162; Fri, 24 Apr 2020 15:48:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=cFYkGibbsRHZwQ+RX7IEqiWktAJIA5umPcgsJdYeU9I=;
 b=sZuMJH2klpDptjQw59UWx3rumV2hU/9XAfbjfzKeFWT3gb/l8FXrUbBkQEPf4KCAn8bY
 VtkhMkacgkIpjNrP39ipNXnSuQxpMdIJ7v2RnOQf5tzZUNvtmYRSN5tyudGodAHqygIE
 Eby4UxkzwPyzC6ROdea1iqerJ6lSUZK/6Nw2nmwDeMyixd22dVprUH0UgTWEXz0VXEct
 6JvAvZppis1R2KF6HAyO/Pl291sqjC0ShibAqF3OcuaTHfxPmf61mfl9M5lYuVCm/Yyy
 v6TfP6lhSbW2UjF5wBL2Yx16RI5i7sUI/LC/bX0UrVKQ4UMsXQDaNtA48k2+9qBwHhat sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqawuck1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 15:48:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 048B810002A;
 Fri, 24 Apr 2020 15:48:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF10E2C38A8;
 Fri, 24 Apr 2020 15:48:05 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Apr 2020 15:48:05 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Apr 2020 15:47:57 +0200
Message-ID: <20200424154751.1.Ic2e6fdeb2c6943f077579212f2625f0532a16ceb@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_06:2020-04-24,
 2020-04-24 signatures=0
Cc: Lionel Debieve <lionel.debieve@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH] clk: stm32mp1: fix CK_MPU calculation
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

From: Lionel Debieve <lionel.debieve@st.com>

When the CK_MPU used PLL1_MPUDIV, the current rate is
wrong. The clock must use stm32mp1_mpu_div as a shift
value. Fix the check value used to enter PLL_MPUDIV.

Signed-off-by: Lionel Debieve <lionel.debieve@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/clk/clk_stm32mp1.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index 50df8425bf..0d0ea43fd2 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -954,10 +954,11 @@ static ulong stm32mp1_clk_get(struct stm32mp1_clk_priv *priv, int p)
 		case RCC_MPCKSELR_PLL:
 		case RCC_MPCKSELR_PLL_MPUDIV:
 			clock = stm32mp1_read_pll_freq(priv, _PLL1, _DIV_P);
-			if (p == RCC_MPCKSELR_PLL_MPUDIV) {
+			if ((reg & RCC_SELR_SRC_MASK) ==
+			    RCC_MPCKSELR_PLL_MPUDIV) {
 				reg = readl(priv->base + RCC_MPCKDIVR);
-				clock /= stm32mp1_mpu_div[reg &
-							  RCC_MPUDIV_MASK];
+				clock >>= stm32mp1_mpu_div[reg &
+					RCC_MPUDIV_MASK];
 			}
 			break;
 		}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
