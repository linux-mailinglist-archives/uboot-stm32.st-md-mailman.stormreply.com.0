Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 503556F6035
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 May 2023 22:38:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0582FC6B443;
	Wed,  3 May 2023 20:38:09 +0000 (UTC)
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC2A2C64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 20:38:07 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 475975FD70;
 Wed,  3 May 2023 23:38:07 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1683146287;
 bh=/f9VLX1yqJlyrR5I5jboTvaWRi2Di2HM61GCoOTo9b4=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=dWo6pt9+iAfqwT4lo7Vih5FpIxBA3Da0WCN8za7o+S8DMRfJIT3C1aI9R8TuPSDTv
 tohQV6ale4iwrSVPFnepdl16UUn/7rmoRzd9NzgTEKi/FmenxCLi8I6z17Icqgrb8/
 jD2pXyHBnX/k4yK6Ygg1SyvQ+z1N416v6Rhf2ugKVNJaqKhzt2X1h9LM7/FrEUMgwI
 YM2kcKel6SNqhcgwbBMy+fVQ1Z56+gRjrfc/yPNsMmLSFT4hx6OZQvHzHE1+Osh9Z7
 PKKI7RrYFbDs8isU+hpLxkQF1KOTgL5uDjhpJQej9b5jMEySFDo8lphqOx+QzNFQr4
 BPv/UyNGp8gSw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Wed,  3 May 2023 23:38:07 +0300 (MSK)
From: Igor Prusov <ivprusov@sberdevices.ru>
To: Michal Simek <michal.simek@amd.com>, Daniel Schwierzeck
 <daniel.schwierzeck@gmail.com>, Lukasz Majewski <lukma@denx.de>, Sean
 Anderson <seanga2@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Chia-Wei
 Wang <chiawei_wang@aspeedtech.com>, Aspeed BMC SW team
 <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Stefan Roese
 <sr@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>
Date: Wed, 3 May 2023 23:37:20 +0300
Message-ID: <20230503203720.4128156-8-ivprusov@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503203720.4128156-1-ivprusov@sberdevices.ru>
References: <20230503203720.4128156-1-ivprusov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/05/03 17:34:00 #21213138
X-KSMG-AntiVirus-Status: Clean, skipped
Cc: kernel@sberdevices.ru, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, prusovigor@gmail.com,
 Igor Prusov <ivprusov@sberdevices.ru>
Subject: [Uboot-stm32] [RFC PATCH v2 7/7] cmd: clk: Remove __weak from
	soc_clk_dump
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

After introducing dump to clk_ops there is no need to override this
symbol anymore.

Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
---
 cmd/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cmd/clk.c b/cmd/clk.c
index 55fb96e631..54491ac577 100644
--- a/cmd/clk.c
+++ b/cmd/clk.c
@@ -59,7 +59,7 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
 	}
 }
 
-int __weak soc_clk_dump(void)
+int soc_clk_dump(void)
 {
 	struct udevice *dev;
 	const struct clk_ops *ops;
@@ -81,7 +81,7 @@ int __weak soc_clk_dump(void)
 	return 0;
 }
 #else
-int __weak soc_clk_dump(void)
+int soc_clk_dump(void)
 {
 	puts("Not implemented\n");
 	return 1;
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
