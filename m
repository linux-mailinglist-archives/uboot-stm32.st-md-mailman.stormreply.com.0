Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A857E129D
	for <lists+uboot-stm32@lfdr.de>; Sun,  5 Nov 2023 09:38:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E1E5C6B479;
	Sun,  5 Nov 2023 08:38:28 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE0E4C6B463
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Nov 2023 08:38:27 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 3E5F5120008;
 Sun,  5 Nov 2023 11:38:27 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 3E5F5120008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1699173507;
 bh=jGTxk10GVXwoChZo8gLhEquVJTx2A3YO3B3jyjhpAwI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=g5AQQm/WVC2o7tvpHHfdu2T5ekUTqQSk097MY2R1FXLebH4Q9olSt5VqdtGoPMO2j
 AdEtjvJhF1n6jynJesvd+6I7eDos27qH75jWaJGaMNSyj2iSxII+D8AM2NTnXkIyR6
 l0i0acIY4a3CWwnkXKl5+rLYDCRoLFWguCkP/K2v+s4Ws26cF7eJX07Wu1pl5/29Ic
 PavgLVXIyCHl9fma+cYLoyOCgfRA510APxKhKBXQtmENnDVeYCPdizFB9B/ZFeJWRD
 YO2TzKwegM2/hCJJi/EM9pi7jXIA1TP7EROcFnJJhSPhrHWvDpyaVJ0KpthK9bIPHn
 xIiZOmeRK8mKw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Sun,  5 Nov 2023 11:38:27 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Sun, 5 Nov 2023 11:38:26 +0300
From: Igor Prusov <ivprusov@sberdevices.ru>
To: <u-boot@lists.denx.de>, Michal Simek <michal.simek@amd.com>, Daniel
 Schwierzeck <daniel.schwierzeck@gmail.com>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Stefan Roese <sr@denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Patrice Chotard <patrice.chotard@foss.st.com>
Date: Sun, 5 Nov 2023 11:38:03 +0300
Message-ID: <20231105083809.3293-3-ivprusov@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105083809.3293-1-ivprusov@sberdevices.ru>
References: <20231105083809.3293-1-ivprusov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181122 [Nov 03 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ivprusov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_smtp_not_equal_from},
 {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;
 p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1; salutedevices.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 100.64.160.123:7.1.2;
 127.0.0.199:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/11/05 03:40:00 #22405617
X-KSMG-AntiVirus-Status: Clean, skipped
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 uboot-stm32@st-md-mailman.stormreply.com, Joel Stanley <joel@jms.id.au>,
 kernel@sberdevices.ru, Igor Prusov <ivprusov@sberdevices.ru>,
 prusovigor@gmail.com
Subject: [Uboot-stm32] [PATCH v6 2/8] clk: ast2600: Move soc_clk_dump
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
