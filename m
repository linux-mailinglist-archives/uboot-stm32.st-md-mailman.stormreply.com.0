Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE66753EC1
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jul 2023 17:25:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B02AC6B459;
	Fri, 14 Jul 2023 15:25:04 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F60EC6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 15:25:03 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 791EB120006;
 Fri, 14 Jul 2023 18:25:02 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 791EB120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1689348302;
 bh=jGTxk10GVXwoChZo8gLhEquVJTx2A3YO3B3jyjhpAwI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=nYdo7lOaP8/eqSVPvxc1IVbce1AzfjfTzcE3kZvdjng8TTuUMtVUd8S1TbhFUO48p
 OMNEUcSRjf759J7mW7yQWjizKIAp/Lx2xE7tHAsH9JPNCoLDyyfQaeUi+SElNKpPCK
 1oz9dZQavbSeTGsuIwpBYGPoEUs+axEhVlv8IV2MoNtKW+KUfhp+JKspq1CLZT+Kyp
 IJtE2tqe5sfNqVFxVP28fqjUu6qIUjp5OGL41U5wIPI7gdqc8yU41EQZpXZ5ZpjFfn
 fhw3tZ6CVS/sxZdj1NJSyjCutuM5HQJBl8rw8ZRpH+HceNFFl+fjAySf1YYoFpN+Fc
 aBIwDRq0+6MJA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Fri, 14 Jul 2023 18:25:02 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 14 Jul 2023 18:24:28 +0300
From: Igor Prusov <ivprusov@sberdevices.ru>
To: Michal Simek <michal.simek@amd.com>, Daniel Schwierzeck
 <daniel.schwierzeck@gmail.com>, Lukasz Majewski <lukma@denx.de>, Sean
 Anderson <seanga2@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Chia-Wei
 Wang <chiawei_wang@aspeedtech.com>, Aspeed BMC SW team
 <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Stefan Roese
 <sr@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>
Date: Fri, 14 Jul 2023 18:24:39 +0300
Message-ID: <20230714152444.24395-3-ivprusov@sberdevices.ru>
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
Subject: [Uboot-stm32] [PATCH v3 2/7] clk: ast2600: Move soc_clk_dump
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
 drivers/clk/aspeed/clk_ast2600.c | 70 ++++++++++++++++----------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/aspeed/clk_ast2600.c b/drivers/clk/aspeed/clk_ast2600.c
index e5ada5b6d4..b3cc8392fa 100644
--- a/drivers/clk/aspeed/clk_ast2600.c
+++ b/drivers/clk/aspeed/clk_ast2600.c
@@ -1104,41 +1104,6 @@ static int ast2600_clk_enable(struct clk *clk)
 	return 0;
 }
 
-struct clk_ops ast2600_clk_ops = {
-	.get_rate = ast2600_clk_get_rate,
-	.set_rate = ast2600_clk_set_rate,
-	.enable = ast2600_clk_enable,
-};
-
-static int ast2600_clk_probe(struct udevice *dev)
-{
-	struct ast2600_clk_priv *priv = dev_get_priv(dev);
-
-	priv->scu = devfdt_get_addr_ptr(dev);
-	if (IS_ERR(priv->scu))
-		return PTR_ERR(priv->scu);
-
-	ast2600_init_rgmii_clk(priv->scu, &rgmii_clk_defconfig);
-	ast2600_init_rmii_clk(priv->scu, &rmii_clk_defconfig);
-	ast2600_configure_mac12_clk(priv->scu);
-	ast2600_configure_mac34_clk(priv->scu);
-	ast2600_configure_rsa_ecc_clk(priv->scu);
-
-	return 0;
-}
-
-static int ast2600_clk_bind(struct udevice *dev)
-{
-	int ret;
-
-	/* The reset driver does not have a device node, so bind it here */
-	ret = device_bind_driver(gd->dm_root, "ast_sysreset", "reset", &dev);
-	if (ret)
-		debug("Warning: No reset driver: ret=%d\n", ret);
-
-	return 0;
-}
-
 struct aspeed_clks {
 	ulong id;
 	const char *name;
@@ -1203,6 +1168,41 @@ int soc_clk_dump(void)
 	return 0;
 }
 
+struct clk_ops ast2600_clk_ops = {
+	.get_rate = ast2600_clk_get_rate,
+	.set_rate = ast2600_clk_set_rate,
+	.enable = ast2600_clk_enable,
+};
+
+static int ast2600_clk_probe(struct udevice *dev)
+{
+	struct ast2600_clk_priv *priv = dev_get_priv(dev);
+
+	priv->scu = devfdt_get_addr_ptr(dev);
+	if (IS_ERR(priv->scu))
+		return PTR_ERR(priv->scu);
+
+	ast2600_init_rgmii_clk(priv->scu, &rgmii_clk_defconfig);
+	ast2600_init_rmii_clk(priv->scu, &rmii_clk_defconfig);
+	ast2600_configure_mac12_clk(priv->scu);
+	ast2600_configure_mac34_clk(priv->scu);
+	ast2600_configure_rsa_ecc_clk(priv->scu);
+
+	return 0;
+}
+
+static int ast2600_clk_bind(struct udevice *dev)
+{
+	int ret;
+
+	/* The reset driver does not have a device node, so bind it here */
+	ret = device_bind_driver(gd->dm_root, "ast_sysreset", "reset", &dev);
+	if (ret)
+		debug("Warning: No reset driver: ret=%d\n", ret);
+
+	return 0;
+}
+
 static const struct udevice_id ast2600_clk_ids[] = {
 	{ .compatible = "aspeed,ast2600-scu", },
 	{ },
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
