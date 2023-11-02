Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F23E87DF230
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Nov 2023 13:20:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4974C6B461;
	Thu,  2 Nov 2023 12:20:37 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8F08C6B45E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Nov 2023 12:20:35 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 5802B120035;
 Thu,  2 Nov 2023 15:20:35 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5802B120035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1698927635;
 bh=WuXesCnXs2xO9MoUr7ZLz5YFmmv9/oihs9pF04dBe90=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=o57iG//PeIRAzYiSFNrsSLTq3MQURf7SPCt9tTmMDXQG1YKjFk6PaGRXeE/uPZj5G
 hBkZ7IJ1DZl/eg0jWyDrdXnT1nZR7X2QCJrARBKlUFeoyQneAIbQMdDOQywHNAMqVB
 CvZc2LebDdSfyi95NJtd7DWFZ+kE7FsuhXGmpHMVL12L1MlhmsDaIIq6RQV/D/9xJL
 Cn4XURg39F6s8wNg6GbGVVZuElki3FPQNpHfbqaQQmnTzK+Das+J3JIQaE0sed5tNg
 Fgv3FbDXW8gLyWwdqjWice0J+8g0fvhoPUYBz7IiZk7fOcxe234OOfpyzQ9QocHJmD
 A3KE3pXxZJOTQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Thu,  2 Nov 2023 15:20:35 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Thu, 2 Nov 2023 15:20:34 +0300
From: Igor Prusov <ivprusov@sberdevices.ru>
To: Michal Simek <michal.simek@amd.com>, Daniel Schwierzeck
 <daniel.schwierzeck@gmail.com>, Lukasz Majewski <lukma@denx.de>, Sean
 Anderson <seanga2@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Chia-Wei
 Wang <chiawei_wang@aspeedtech.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Stefan Roese <sr@denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 2 Nov 2023 15:20:13 +0300
Message-ID: <20231102122017.56995-5-ivprusov@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102122017.56995-1-ivprusov@sberdevices.ru>
References: <20231102122017.56995-1-ivprusov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181076 [Nov 02 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ivprusov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_smtp_not_equal_from},
 {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2;
 salutedevices.com:7.1.1; p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;
 100.64.160.123:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/11/02 06:57:00 #22385341
X-KSMG-AntiVirus-Status: Clean, skipped
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Igor Prusov <ivprusov@sberdevices.ru>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Joel Stanley <joel@jms.id.au>,
 kernel@sberdevices.ru, u-boot-amlogic@groups.io, prusovigor@gmail.com
Subject: [Uboot-stm32] [PATCH v5 4/8] clk: amlogic: Move driver and ops
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

Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/a1.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/meson/a1.c b/drivers/clk/meson/a1.c
index 1075ba7333..e3fa9db7d0 100644
--- a/drivers/clk/meson/a1.c
+++ b/drivers/clk/meson/a1.c
@@ -601,14 +601,6 @@ static int meson_clk_set_parent(struct clk *clk, struct clk *parent_clk)
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
@@ -638,15 +630,6 @@ static const struct udevice_id meson_clk_ids[] = {
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
@@ -727,3 +710,20 @@ int soc_clk_dump(void)
 
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
