Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE865719CA
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Jul 2022 14:24:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4E0EC640F7;
	Tue, 12 Jul 2022 12:24:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB2A7C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 12:24:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CBZfu4023675;
 Tue, 12 Jul 2022 14:24:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=tPprqWMabUj7h9wFbGxK6JHIiM91Eypu0SiNXJGveuw=;
 b=mtSsEoTl9z+gSE3otzahxmevHf8Oi5j7sxcJa2GDd8zPcf0tBYvzxm/7ArjTcetSx33x
 CNdf6rtWIBG0MZCbZTC43S7AA1QXIIRC68wtDhdDI/4i+uk8pFUq2+AhvULDb3QNb2wM
 StJCQR9C++Gf+fw2XwSGDCXB2LM8STC/T/5cqSH6y6Lp4K48xpN9I8Iw5FdmqIiXIJCi
 xnVy79w8+GedTBpCN27ZL0hlL3Hdl7htOSlWK3p8MtzoXXVpT5gv7PgvMUZyX5tb5qlf
 T9GwoJI4YIkF6xH/GKAJYg9xNGDxLCJBC5d6Oplojs++eRpvAx6UUQIc/yAcDk2OqiHG Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h94gu9re6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 14:24:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E1A4100034;
 Tue, 12 Jul 2022 14:24:05 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 73AE221BF65;
 Tue, 12 Jul 2022 14:24:05 +0200 (CEST)
Received: from localhost (10.75.127.47) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 12 Jul
 2022 14:24:05 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 12 Jul 2022 14:24:03 +0200
Message-ID: <20220712142352.RESEND.v2.1.Ifa06360115ffa3f3307372e6cdd98ec16759d6ba@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_08,2022-07-12_01,2022-06-22_01
Cc: Tero Kristo <kristo@kernel.org>, Sean Anderson <sean.anderson@seco.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [RESEND PATCH v2] clk: update clk_clean_rate_cache to
	use private clk struct
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

Changes in v2:
- set *clkp = clk when CCF is not activated and when the clock is not found

 drivers/clk/clk-uclass.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index b89c77bf794..5cfa022a6dc 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -544,6 +544,19 @@ ulong clk_round_rate(struct clk *clk, ulong rate)
 	return ops->round_rate(clk, rate);
 }
 
+static void clk_get_priv(struct clk *clk, struct clk **clkp)
+{
+	*clkp = clk;
+
+	/* get private clock struct associated to the provided clock */
+	if (CONFIG_IS_ENABLED(CLK_CCF)) {
+		/* Take id 0 as a non-valid clk, such as dummy */
+		if (clk->id)
+			clk_get_by_id(clk->id, clkp);
+	}
+}
+
+/* clean cache, called with private clock struct */
 static void clk_clean_rate_cache(struct clk *clk)
 {
 	struct udevice *child_dev;
@@ -563,6 +576,7 @@ static void clk_clean_rate_cache(struct clk *clk)
 ulong clk_set_rate(struct clk *clk, ulong rate)
 {
 	const struct clk_ops *ops;
+	struct clk *clkp;
 
 	debug("%s(clk=%p, rate=%lu)\n", __func__, clk, rate);
 	if (!clk_valid(clk))
@@ -572,8 +586,10 @@ ulong clk_set_rate(struct clk *clk, ulong rate)
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
