Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ED76F3E31
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 May 2023 09:09:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C183C6A614;
	Tue,  2 May 2023 07:09:40 +0000 (UTC)
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4456C69073
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 20:38:22 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 25BA45FD18;
 Thu, 27 Apr 2023 23:38:22 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1682627902;
 bh=ZHtDJNhvfijQXbWls33yL7dh/dJM/+t9Re8NULhwrKc=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=TFY1olxxB15S88T4ZV2UCqMPAPmS1uMgPMz2Py74p82ETjEW57OpzxXj6nbo08ADM
 5W4Gx/aXMX0sIVAhPsdC/9N/vA0fIIz75CtwqhaoltT8Qj+Qg2/65V5jS7EWXAU9FH
 ZvrhPB1X3FBoLTHLE5Hv1UkI5ifJAZX0U1VQAILxmbCRtCp4q37apwYUXKybw5JVP7
 31T1rPtAyNpAJiVmvsgLYci45EMeVBV5Ob47tY82bQmftvRo3CW59zcISrhZHtoZO+
 0MkgvhX1PVi5GWfd1G5t1jfdq6EJeFg2GHa3o2fXfc4FRVxWy2ijhTp8K1wexlVhPA
 0Z1xvWcOmaELA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Thu, 27 Apr 2023 23:38:22 +0300 (MSK)
From: Igor Prusov <ivprusov@sberdevices.ru>
To: Michal Simek <michal.simek@amd.com>, Daniel Schwierzeck
 <daniel.schwierzeck@gmail.com>, Lukasz Majewski <lukma@denx.de>, Sean
 Anderson <seanga2@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Chia-Wei
 Wang <chiawei_wang@aspeedtech.com>, Aspeed BMC SW team
 <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Stefan Roese
 <sr@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>
Date: Thu, 27 Apr 2023 23:37:22 +0300
Message-ID: <20230427203726.11835-4-ivprusov@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230427203726.11835-1-ivprusov@sberdevices.ru>
References: <20230427203726.11835-1-ivprusov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/04/27 14:43:00 #21175431
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Tue, 02 May 2023 07:09:38 +0000
Cc: kernel@sberdevices.ru, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, prusovigor@gmail.com,
 Igor Prusov <ivprusov@sberdevices.ru>
Subject: [Uboot-stm32] [RFC PATCH v1 3/7] clk: k210: Move soc_clk_dump
	function
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

Move clock dump function to avoid forward declaration after switching to
dump in clk_ops.

Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
---
 drivers/clk/clk_k210.c | 92 +++++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/clk/clk_k210.c b/drivers/clk/clk_k210.c
index c534cc07e0..2f17152021 100644
--- a/drivers/clk/clk_k210.c
+++ b/drivers/clk/clk_k210.c
@@ -1238,52 +1238,6 @@ static int k210_clk_request(struct clk *clk)
 	return 0;
 }
 
-static const struct clk_ops k210_clk_ops = {
-	.request = k210_clk_request,
-	.set_rate = k210_clk_set_rate,
-	.get_rate = k210_clk_get_rate,
-	.set_parent = k210_clk_set_parent,
-	.enable = k210_clk_enable,
-	.disable = k210_clk_disable,
-};
-
-static int k210_clk_probe(struct udevice *dev)
-{
-	int ret;
-	struct k210_clk_priv *priv = dev_get_priv(dev);
-
-	priv->base = dev_read_addr_ptr(dev_get_parent(dev));
-	if (!priv->base)
-		return -EINVAL;
-
-	ret = clk_get_by_index(dev, 0, &priv->in0);
-	if (ret)
-		return ret;
-
-	/*
-	 * Force setting defaults, even before relocation. This is so we can
-	 * set the clock rate for PLL1 before we relocate into aisram.
-	 */
-	if (!(gd->flags & GD_FLG_RELOC))
-		clk_set_defaults(dev, CLK_DEFAULTS_POST_FORCE);
-
-	return 0;
-}
-
-static const struct udevice_id k210_clk_ids[] = {
-	{ .compatible = "canaan,k210-clk" },
-	{ },
-};
-
-U_BOOT_DRIVER(k210_clk) = {
-	.name = "k210_clk",
-	.id = UCLASS_CLK,
-	.of_match = k210_clk_ids,
-	.ops = &k210_clk_ops,
-	.probe = k210_clk_probe,
-	.priv_auto = sizeof(struct k210_clk_priv),
-};
-
 #if IS_ENABLED(CONFIG_CMD_CLK)
 static char show_enabled(struct k210_clk_priv *priv, int id)
 {
@@ -1342,3 +1296,49 @@ int soc_clk_dump(void)
 	return 0;
 }
 #endif
+
+static const struct clk_ops k210_clk_ops = {
+	.request = k210_clk_request,
+	.set_rate = k210_clk_set_rate,
+	.get_rate = k210_clk_get_rate,
+	.set_parent = k210_clk_set_parent,
+	.enable = k210_clk_enable,
+	.disable = k210_clk_disable,
+};
+
+static int k210_clk_probe(struct udevice *dev)
+{
+	int ret;
+	struct k210_clk_priv *priv = dev_get_priv(dev);
+
+	priv->base = dev_read_addr_ptr(dev_get_parent(dev));
+	if (!priv->base)
+		return -EINVAL;
+
+	ret = clk_get_by_index(dev, 0, &priv->in0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Force setting defaults, even before relocation. This is so we can
+	 * set the clock rate for PLL1 before we relocate into aisram.
+	 */
+	if (!(gd->flags & GD_FLG_RELOC))
+		clk_set_defaults(dev, CLK_DEFAULTS_POST_FORCE);
+
+	return 0;
+}
+
+static const struct udevice_id k210_clk_ids[] = {
+	{ .compatible = "canaan,k210-clk" },
+	{ },
+};
+
+U_BOOT_DRIVER(k210_clk) = {
+	.name = "k210_clk",
+	.id = UCLASS_CLK,
+	.of_match = k210_clk_ids,
+	.ops = &k210_clk_ops,
+	.probe = k210_clk_probe,
+	.priv_auto = sizeof(struct k210_clk_priv),
+};
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
