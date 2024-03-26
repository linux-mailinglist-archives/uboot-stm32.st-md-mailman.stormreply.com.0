Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A088C19A
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Mar 2024 13:08:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CF92C6DD93;
	Tue, 26 Mar 2024 12:08:10 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF7E0CFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 12:08:09 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5281988019;
 Tue, 26 Mar 2024 13:08:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1711454887;
 bh=GOiMcfrTOGy49266VE/APBaSYaCTkHtaS7lh0vKFXaA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vF5thNvUvP1fK1HXq6xCTcrCqzX4g6qrgO+ly2wiZyQrIWiRBn2R+usbhKt+S48qP
 IcE00WT5Xg+pELbTkbpPfahiamPEGDIIWLEtFnOLq91+l0771pWVdkKuVuplEJEQJB
 xcFTyVnMkOzY2YXyx9nqU4mjVfLObCZHZllaTfMgAZfZCKISYrIwFqvqIS8kRdXPWQ
 YBpMvndu7PKxvYNgFWZVPRrnuQx9yxyI/tHxQlFc3RrUMtcdFFp1n3crQiTZE5d80n
 1p5XOJunlJrwZVjgnjhOF36uEy5ihS7SqteZklh7VHzOooY2lmDptewl348ulyHS85
 xk/t8NU9SYogw==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Tue, 26 Mar 2024 13:07:25 +0100
Message-ID: <20240326120745.27581-5-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240326120745.27581-1-marex@denx.de>
References: <20240326120745.27581-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, u-boot@dh-electronics.com,
 Christophe Roullier <christophe.roullier@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 04/11] net: dwc_eth_qos: Scrub ifdeffery
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

Replace ifdef CONFIG_CLK with if (CONFIG_IS_ENABLED(CLK)) to improve code
build coverage. Some of the functions printed debug("%s: OK\n", __func__);
on exit with and without CLK enabled, some did not, make it consistent and
print nothing if CLK is disabled.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christophe Roullier <christophe.roullier@st.com>
Cc: Joe Hershberger <joe.hershberger@ni.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Ramon Fried <rfried.dev@gmail.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
V2: Add RB from Patrice
---
 drivers/net/dwc_eth_qos_stm32.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
index 7520a136ed0..d7ec0c9be36 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -46,21 +46,22 @@
 
 static ulong eqos_get_tick_clk_rate_stm32(struct udevice *dev)
 {
-#ifdef CONFIG_CLK
-	struct eqos_priv *eqos = dev_get_priv(dev);
+	struct eqos_priv __maybe_unused *eqos = dev_get_priv(dev);
+
+	if (!CONFIG_IS_ENABLED(CLK))
+		return 0;
 
 	return clk_get_rate(&eqos->clk_master_bus);
-#else
-	return 0;
-#endif
 }
 
 static int eqos_start_clks_stm32(struct udevice *dev)
 {
-#ifdef CONFIG_CLK
-	struct eqos_priv *eqos = dev_get_priv(dev);
+	struct eqos_priv __maybe_unused *eqos = dev_get_priv(dev);
 	int ret;
 
+	if (!CONFIG_IS_ENABLED(CLK))
+		return 0;
+
 	debug("%s(dev=%p):\n", __func__, dev);
 
 	ret = clk_enable(&eqos->clk_master_bus);
@@ -89,12 +90,10 @@ static int eqos_start_clks_stm32(struct udevice *dev)
 		}
 		eqos->clk_ck_enabled = true;
 	}
-#endif
 
 	debug("%s: OK\n", __func__);
 	return 0;
 
-#ifdef CONFIG_CLK
 err_disable_clk_tx:
 	clk_disable(&eqos->clk_tx);
 err_disable_clk_rx:
@@ -104,20 +103,20 @@ err_disable_clk_master_bus:
 err:
 	debug("%s: FAILED: %d\n", __func__, ret);
 	return ret;
-#endif
 }
 
 static int eqos_stop_clks_stm32(struct udevice *dev)
 {
-#ifdef CONFIG_CLK
-	struct eqos_priv *eqos = dev_get_priv(dev);
+	struct eqos_priv __maybe_unused *eqos = dev_get_priv(dev);
+
+	if (!CONFIG_IS_ENABLED(CLK))
+		return 0;
 
 	debug("%s(dev=%p):\n", __func__, dev);
 
 	clk_disable(&eqos->clk_tx);
 	clk_disable(&eqos->clk_rx);
 	clk_disable(&eqos->clk_master_bus);
-#endif
 
 	debug("%s: OK\n", __func__);
 	return 0;
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
