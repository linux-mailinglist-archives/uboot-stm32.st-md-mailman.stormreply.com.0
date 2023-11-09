Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A537E68ED
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Nov 2023 11:55:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA688C6C837;
	Thu,  9 Nov 2023 10:55:36 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0466FC6B47A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Nov 2023 10:55:36 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 7AB90120040;
 Thu,  9 Nov 2023 13:55:35 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7AB90120040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1699527335;
 bh=J7SZxu/xyp9ytMfVs9epm1TQ96SN7qBo1wcwdrpgXRc=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=ow3JGN3YnXu8Dl0a5k3UX5ZqYRpq0GnmyGBRHhLR9aK8crGcE430WLZvasVh46rKy
 vh+puCGf52n+recZAye/B96DIM0BgJne7HOUCYYKSLDwpunTDV4rcuWVlKusgPZHAa
 qzSFdtE9sTLws8fox759HxDzaOW6DdCuTRcBGxwIbTXT1io471GksfEFNheVoouadG
 0aq9Eov8/XI/vBEwAXE+cx0bczytWK9a6rcINg3ckBpJxW1dfn5CjQGYoztZhU8Q7x
 lAOw1ji7s1HrjZvvbQoZBvXWvwVFw4TiaOs7pVVNt0WUMp3AzrX7dYksnMmKh1d7NO
 IViChJVj2ICnQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Thu,  9 Nov 2023 13:55:35 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Thu, 9 Nov 2023 13:55:35 +0300
From: Igor Prusov <ivprusov@sberdevices.ru>
To: <u-boot@lists.denx.de>, Michal Simek <michal.simek@amd.com>, Daniel
 Schwierzeck <daniel.schwierzeck@gmail.com>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Stefan Roese <sr@denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 9 Nov 2023 13:55:12 +0300
Message-ID: <20231109105516.24892-5-ivprusov@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109105516.24892-1-ivprusov@sberdevices.ru>
References: <20231109105516.24892-1-ivprusov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181238 [Nov 09 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ivprusov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_smtp_not_equal_from},
 {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 100.64.160.123:7.1.2;
 salutedevices.com:7.1.1; 127.0.0.199:7.1.2;
 p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: n,
 {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch},
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/11/09 07:10:00 #22435383
X-KSMG-AntiVirus-Status: Clean, skipped
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 uboot-stm32@st-md-mailman.stormreply.com, Joel Stanley <joel@jms.id.au>,
 kernel@sberdevices.ru, Igor Prusov <ivprusov@sberdevices.ru>,
 prusovigor@gmail.com
Subject: [Uboot-stm32] [PATCH v7 4/8] clk: amlogic: Move driver and ops
	structs
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

Move driver and ops structs to avoid forward declaration after switching
to dump in clk_ops.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
---
 drivers/clk/meson/a1.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/meson/a1.c b/drivers/clk/meson/a1.c
index d0f5bb3753..c91357ec27 100644
--- a/drivers/clk/meson/a1.c
+++ b/drivers/clk/meson/a1.c
@@ -607,14 +607,6 @@ static int meson_clk_set_parent(struct clk *clk, struct clk *parent_clk)
 	return meson_mux_set_parent_by_id(clk, parent_clk->id);
 }
 
-static struct clk_ops meson_clk_ops = {
-	.disable	= meson_clk_disable,
-	.enable		= meson_clk_enable,
-	.get_rate	= meson_clk_get_rate,
-	.set_rate	= meson_clk_set_rate,
-	.set_parent	= meson_clk_set_parent,
-};
-
 static int meson_clk_probe(struct udevice *dev)
 {
 	struct meson_clk *priv = dev_get_priv(dev);
@@ -644,15 +636,6 @@ static const struct udevice_id meson_clk_ids[] = {
 	{ }
 };
 
-U_BOOT_DRIVER(meson_clk) = {
-	.name		= "meson-clk-a1",
-	.id		= UCLASS_CLK,
-	.of_match	= meson_clk_ids,
-	.priv_auto	= sizeof(struct meson_clk),
-	.ops		= &meson_clk_ops,
-	.probe		= meson_clk_probe,
-};
-
 static const char *meson_clk_get_name(struct clk *clk, int id)
 {
 	const struct meson_clk_info *info;
@@ -733,3 +716,20 @@ int soc_clk_dump(void)
 
 	return 0;
 }
+
+static struct clk_ops meson_clk_ops = {
+	.disable	= meson_clk_disable,
+	.enable		= meson_clk_enable,
+	.get_rate	= meson_clk_get_rate,
+	.set_rate	= meson_clk_set_rate,
+	.set_parent	= meson_clk_set_parent,
+};
+
+U_BOOT_DRIVER(meson_clk) = {
+	.name		= "meson-clk-a1",
+	.id		= UCLASS_CLK,
+	.of_match	= meson_clk_ids,
+	.priv_auto	= sizeof(struct meson_clk),
+	.ops		= &meson_clk_ops,
+	.probe		= meson_clk_probe,
+};
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
