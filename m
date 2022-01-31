Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D88B94A4A57
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jan 2022 16:18:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C7FFC5E2C6;
	Mon, 31 Jan 2022 15:18:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 111DDC5C82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 15:18:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VEnLs3008938;
 Mon, 31 Jan 2022 16:18:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=XCRXHTZs1YCMKpLJFUnys1/ayXxsygOqxGAGDRU+5/8=;
 b=1sOT3SoleO4MBAjiGuaMYK/oI1v6vEV9K3QxInCPB5H1PfCukN06+o7EA6JBOJ4kJ26X
 0102RFpR9q2UUuQg4bTJhJvh80/nrVyNqgrWLVIpFDTScPPzaFLE4wrpHlp8JiZpAxtR
 ElVJsbPXno6afxxIeUhd/9LnSYLjU4V3+t5oCn9m4szQFdgL6bxeiYjwDctLU39r2dBF
 9WrbW4T/Txpcpg4/xRRETfWJXjbd7skoY4ja40DTGNaaGorTgQE7u7EtNwZaEMR841jY
 40YZ5TmLt/W9tv1dTtjhdAd7tyFmNa7wct0BAInjNuDX9YlubqUw+LexUb/Dvga5HhWV Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dwwf3w5yg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 16:18:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 90FD310002A;
 Mon, 31 Jan 2022 16:18:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 86D5B21F0A1;
 Mon, 31 Jan 2022 16:18:26 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 31 Jan 2022 16:18:23
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 31 Jan 2022 16:18:18 +0100
Message-ID: <20220131161811.1.Ifa06360115ffa3f3307372e6cdd98ec16759d6ba@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_06,2022-01-31_01,2021-12-02_01
Cc: Tero Kristo <kristo@kernel.org>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] clk: update clk_clean_rate_cache to use
	private clk struct
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

In clk_clean_rate_cache, clk->rate should update the private clock
struct, in particular when CCF is activated, to save the cached
rate value.

When clk_get_parent_rate is called, the cached information
is read from pclk->rate, with pclk = clk_get_parent(clk).

As the cached is read from private clk data, the update should
be done also on it.

Fixes: 6b7fd3128f7 ("clk: fix set_rate to clean up cached rates for the hierarchy")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/clk/clk-uclass.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index d245b672fa..62393b73e1 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -576,6 +576,21 @@ ulong clk_round_rate(struct clk *clk, ulong rate)
 	return ops->round_rate(clk, rate);
 }
 
+static void clk_get_priv(struct clk *clk, struct clk **clkp)
+{
+	*clkp = NULL;
+
+	/* get private clock struct associated to the provided clock */
+	if (CONFIG_IS_ENABLED(CLK_CCF)) {
+		/* Take id 0 as a non-valid clk, such as dummy */
+		if (clk->id)
+			clk_get_by_id(clk->id, clkp);
+	} else {
+		*clkp = dev_get_clk_ptr(clk->dev);
+	}
+}
+
+/* clean cache, called with private clock struct */
 static void clk_clean_rate_cache(struct clk *clk)
 {
 	struct udevice *child_dev;
@@ -595,6 +610,7 @@ static void clk_clean_rate_cache(struct clk *clk)
 ulong clk_set_rate(struct clk *clk, ulong rate)
 {
 	const struct clk_ops *ops;
+	struct clk *clkp;
 
 	debug("%s(clk=%p, rate=%lu)\n", __func__, clk, rate);
 	if (!clk_valid(clk))
@@ -604,8 +620,10 @@ ulong clk_set_rate(struct clk *clk, ulong rate)
 	if (!ops->set_rate)
 		return -ENOSYS;
 
+	/* get private clock struct used for cache */
+	clk_get_priv(clk, &clkp);
 	/* Clean up cached rates for us and all child clocks */
-	clk_clean_rate_cache(clk);
+	clk_clean_rate_cache(clkp);
 
 	return ops->set_rate(clk, rate);
 }
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
