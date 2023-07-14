Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CB2753EC2
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jul 2023 17:25:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 181B1C6B45B;
	Fri, 14 Jul 2023 15:25:04 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F5FCC6B452
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 15:25:03 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id A1F3612000E;
 Fri, 14 Jul 2023 18:25:02 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A1F3612000E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1689348302;
 bh=ZHtDJNhvfijQXbWls33yL7dh/dJM/+t9Re8NULhwrKc=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=Kee6YSaadF8QbXDnddCYP7dzKy4dA0fwda512GPXuchDHQ6YVwLKPaMgCKkU7FDpg
 LQg8aAljkga3U2YNntumESVH10lGfbXzgfZinQFVWIYsbVBn7WDNtHX0C3W6LCgrD7
 QJ7U6w1TZsMhlaZaHqANWrWm23vlLrnL5BpUW67GVz9T29dJMiBvEaRBXiwjLPLPNp
 VgjlJN0bNQUIW0+sPoqP4ISbmKmhcrn98s4pXBfFzIlMYsjjEmRNHJkdKHzqnOZx0P
 doSej69DBc/Lj6A4CFRVKyf2wSXr0WfzGwkD70N1QcW3PDzKe+1nM5fEhlxwS00WBu
 wUhuFApgcoVPw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Fri, 14 Jul 2023 18:25:02 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 14 Jul 2023 18:24:29 +0300
From: Igor Prusov <ivprusov@sberdevices.ru>
To: Michal Simek <michal.simek@amd.com>, Daniel Schwierzeck
 <daniel.schwierzeck@gmail.com>, Lukasz Majewski <lukma@denx.de>, Sean
 Anderson <seanga2@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Chia-Wei
 Wang <chiawei_wang@aspeedtech.com>, Aspeed BMC SW team
 <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Stefan Roese
 <sr@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>
Date: Fri, 14 Jul 2023 18:24:40 +0300
Message-ID: <20230714152444.24395-4-ivprusov@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714152444.24395-1-ivprusov@sberdevices.ru>
References: <20230714152444.24395-1-ivprusov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178633 [Jul 14 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: IVPrusov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 523 523
 523027ce26ed1d9067f7a52a4756a876e54db27c,
 {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;
 100.64.160.123:7.1.2; p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress:
 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/07/14 10:15:00 #21613471
X-KSMG-AntiVirus-Status: Clean, skipped
Cc: kernel@sberdevices.ru, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, prusovigor@gmail.com,
 Igor Prusov <ivprusov@sberdevices.ru>
Subject: [Uboot-stm32] [PATCH v3 3/7] clk: k210: Move soc_clk_dump function
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
