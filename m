Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC787AFA2
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8ED7BC35E03
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F6D5C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHFmSv001887; Tue, 30 Jul 2019 19:17:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=X9s2vL18hV0SZD+I6nTps91OR6uJhgLOELTTjRTxMLw=;
 b=sNTbZOKnlKHZHbLkcgy8brMEujVigpGZPmRVyxADcD/c0Q1tCAv/9zEqo0Ru8CmHB+jY
 v/is03kiLCrREUcAfa/hgU0FgnDr7B6Luha+uK0N1iIYD3uUuH9QRj/cuEqcLd7dfrJe
 R5WDhOgJ2NeWWni6HYAXj/KpXKuG2xbSDZ03b3l+EnJhx1UNfwx+Bab0ukWj3Bz2WgO9
 U95xCNisSb99RTsAjqzNKdlR0Gk5/sqBDcz9UV0cgBIRbqHc3H4eQU8hO4da8qJNIedQ
 vUFq7+p5jAZwczYX1Zy9Jf0NRcQMEK3DIYhJdpOn6X+1BTnfEOBOoS9bUaq+1Xhq2J5x 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4acwc-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B27931;
 Tue, 30 Jul 2019 17:17:53 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7412CCEA01;
 Tue, 30 Jul 2019 19:17:53 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:53 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:52
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:54 +0200
Message-ID: <1564507016-16570-47-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 46/48] stm32mp1: clk: remove debug traces
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

Remove many debug trace.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/clk/clk_stm32mp1.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index 5806d48..359c2b9 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -759,9 +759,6 @@ static ulong stm32mp1_clk_get_fixed(struct stm32mp1_clk_priv *priv, int idx)
 		return 0;
 	}
 
-	debug("%s: clk id %d = %x : %ld kHz\n", __func__, idx,
-	      (u32)priv->osc[idx], priv->osc[idx] / 1000);
-
 	return priv->osc[idx];
 }
 
@@ -863,8 +860,6 @@ static ulong  pll_get_fref_ck(struct stm32mp1_clk_priv *priv,
 	src = selr & RCC_SELR_SRC_MASK;
 
 	refclk = stm32mp1_clk_get_fixed(priv, pll[pll_id].refclk[src]);
-	debug("PLL%d : selr=%x refclk = %d kHz\n",
-	      pll_id, selr, (u32)(refclk / 1000));
 
 	return refclk;
 }
@@ -889,9 +884,6 @@ static ulong pll_get_fvco(struct stm32mp1_clk_priv *priv,
 	divm = (cfgr1 & (RCC_PLLNCFGR1_DIVM_MASK)) >> RCC_PLLNCFGR1_DIVM_SHIFT;
 	divn = cfgr1 & RCC_PLLNCFGR1_DIVN_MASK;
 
-	debug("PLL%d : cfgr1=%x fracr=%x DIVN=%d DIVM=%d\n",
-	      pll_id, cfgr1, fracr, divn, divm);
-
 	refclk = pll_get_fref_ck(priv, pll_id);
 
 	/* with FRACV :
@@ -908,7 +900,6 @@ static ulong pll_get_fvco(struct stm32mp1_clk_priv *priv,
 	} else {
 		fvco = (ulong)(refclk * (divn + 1) / (divm + 1));
 	}
-	debug("PLL%d : %s = %ld\n", pll_id, __func__, fvco);
 
 	return fvco;
 }
@@ -921,17 +912,13 @@ static ulong stm32mp1_read_pll_freq(struct stm32mp1_clk_priv *priv,
 	ulong dfout;
 	u32 cfgr2;
 
-	debug("%s(%d, %d)\n", __func__, pll_id, div_id);
 	if (div_id >= _DIV_NB)
 		return 0;
 
 	cfgr2 = readl(priv->base + pll[pll_id].pllxcfgr2);
 	divy = (cfgr2 >> RCC_PLLNCFGR2_SHIFT(div_id)) & RCC_PLLNCFGR2_DIVX_MASK;
 
-	debug("PLL%d : cfgr2=%x DIVY=%d\n", pll_id, cfgr2, divy);
-
 	dfout = pll_get_fvco(priv, pll_id) / (divy + 1);
-	debug("        => dfout = %d kHz\n", (u32)(dfout / 1000));
 
 	return dfout;
 }
@@ -1574,9 +1561,6 @@ static void stgen_config(struct stm32mp1_clk_priv *priv)
 
 		/* need to update gd->arch.timer_rate_hz with new frequency */
 		timer_init();
-		pr_debug("gd->arch.timer_rate_hz = %x\n",
-			 (u32)gd->arch.timer_rate_hz);
-		pr_debug("Tick = %x\n", (u32)(get_ticks()));
 	}
 }
 
@@ -1882,7 +1866,6 @@ static int pll_set_output_rate(struct udevice *dev,
 	if (div > 128)
 		div = 128;
 
-	debug("fvco = %ld, clk_rate = %ld, div=%d\n", fvco, clk_rate, div);
 	/* stop the requested output */
 	clrbits_le32(pllxcr, 0x1 << div_id << RCC_PLLNCR_DIVEN_SHIFT);
 	/* change divider */
@@ -1915,6 +1898,9 @@ static ulong stm32mp1_clk_set_rate(struct clk *clk, unsigned long clk_rate)
 	}
 
 	p = stm32mp1_clk_get_parent(priv, clk->id);
+#ifdef DEBUG
+	debug("%s: parent = %d:%s\n", __func__, p, stm32mp1_clk_parent_name[p]);
+#endif
 	if (p < 0)
 		return -EINVAL;
 
@@ -1932,6 +1918,7 @@ static ulong stm32mp1_clk_set_rate(struct clk *clk, unsigned long clk_rate)
 		return result;
 	}
 #endif
+
 	case _PLL4_Q:
 		/* for LTDC_PX and DSI_PX case */
 		return pll_set_output_rate(clk->dev, _PLL4, _DIV_Q, clk_rate);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
