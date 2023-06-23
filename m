Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2296873B85F
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Jun 2023 15:05:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD1ABC65E42;
	Fri, 23 Jun 2023 13:05:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8087C65048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 13:05:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35NCAmCh024484; Fri, 23 Jun 2023 15:05:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=qPkoGlMychrZD7X/3j9VtwZDTa3Y+rB2RkUvOHA7iao=;
 b=QM8vNXq45lTb8vdHK2AWnYMCEVpjsViPvVbpFcRtBphx1PkKVo07BbmsW42Dq0P0cpWU
 ZSWJTuJiRo7YdWGOaH1rBDZVuch4fUkMyyHH33Kcx+Yr+UBwuLGDTVyI2mlLUGOET/Kt
 eeftlrJb1CHnACIV/blNcpp5XSoSkLVkW74ru4yOZC3Xrx/fUxx3X28QjZ20RpP8NBAx
 VXvXFCgKO6YZGDYdyPxMuL3efM70I61wX0JYqYJ/vpliFx5C21nWLOz4iLbelHpvGjB+
 qsXzcy6//iBSOzaVGmsx4Cru2fSuLoEPkJIO7khD7BtjMMo33RDHe+t5urqdl3eaDBYj wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rd8bp1r7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 15:05:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 99ADA100078;
 Fri, 23 Jun 2023 15:05:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80645227EE3;
 Fri, 23 Jun 2023 15:05:24 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 23 Jun
 2023 15:05:24 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 23 Jun 2023 15:05:16 +0200
Message-ID: <20230623150449.1.I2f1f79c3a6283502490ee63fc158237bd43efa2f@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_06,2023-06-22_02,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sean Anderson <seanga2@gmail.com>, Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH] clk: stm32mp1: remove error for disabled
	clock in stm32mp1_clk_get_parent
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

To disabled a clock in clock tree initialization for a mux of STM32MP15,
the selected clock source index is set with the latest possible index for
the number of bit used. Today this valid configuration cause a error
in U-Boot messages, for example with CLK_ETH_DISABLED, when this clock
is not needed for the used ETH PHY without crystal:

   no parents defined for clk id 123

This patch change the level of this message to avoid this trace for
valid clock tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/clk/stm32/clk-stm32mp1.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index 4f4524fcb2c6..615028769495 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -881,7 +881,8 @@ static int stm32mp1_clk_get_parent(struct stm32mp1_clk_priv *priv,
 		return sel[s].parent[p];
 	}
 
-	log_err("no parents defined for clk id %d\n", (u32)id);
+	/* clock is DISABLED when the clock src is not in clk_parent[] range */
+	log_debug("no parents defined for clk id %d\n", (u32)id);
 
 	return -EINVAL;
 }
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
