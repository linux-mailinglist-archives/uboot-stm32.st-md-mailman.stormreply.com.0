Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE179B4783D
	for <lists+uboot-stm32@lfdr.de>; Sun,  7 Sep 2025 01:00:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1425FC32E8F;
	Sat,  6 Sep 2025 23:00:40 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD26EC32E8E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Sep 2025 23:00:38 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cK7wk1lp2z9tH5;
 Sun,  7 Sep 2025 01:00:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757199638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DwwUfYI6YryrpkT0AoFQqO53S9ymw2mfw4dALZH3OdM=;
 b=FrJGCXdPN9yMR5GkfZevyAWlXXget3JZZWntrPIpbLc53gZgCUtIOPy/6tMz19S4dVMMmz
 jDtk5kAp5lwUJyCbU860tahblAgnkkW0P8YsHj9jJ5ZdC44J89/zWYknN+KtBkjbAgbksA
 E/7U84ijlPkEXiknxI428xE4kGs+E2J6erQHfcmxQdo1r5gBMseeT87yevxGCtngfTxSIN
 1qUDAFPf6N/QsMXTN+UsXpQcP4b1vUgmEZluxGfrQXXSBIUt5G7bO71oHTos0NwEtk+0SL
 mtNq/oqJHuxbOvXUNGspesilF1Tqe18PIj6ptGmt9yg3WeuvHNB7pWEEpv7qiw==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=THs6Eejj;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757199636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DwwUfYI6YryrpkT0AoFQqO53S9ymw2mfw4dALZH3OdM=;
 b=THs6Eejjk1eZ4LIvh+kl46QfEib6Tlx9Pty18jek54INjKYUj/vdadjQyeubnmPD11oOa7
 WR0Ce/Iv+sYkywEBaJgsJNGWMP0ZEkYZnfQG/N8UI4tluvQUM+rHoMfgq2IEOgtqLdaBZs
 ZMjrcUY4Iv4K6NuhTqeW6/ZkADfutAfuLcrGRaxw97DQET8//0QNoBbgvLfb9Emf0IUQV7
 9/gGmCq29Wz0e0zXl7vzwdN+0s1yq/SuruFFKLhN6CmMyez3dkNjoZ4Z41AQkRsnaU/Gsx
 kYGuc4tdKmxtlxDW1uTDOtJhbs0tZEgm4HUrioMGXx6rRPnU6hXkT6VI0VOYjw==
To: u-boot@lists.denx.de
Date: Sun,  7 Sep 2025 01:00:01 +0200
Message-ID: <20250906230016.582577-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 86b09d4c094d02b3955
X-MBO-RS-META: 9duyijuqttiogg89he47yp4nt88rbzyk
X-Rspamd-Queue-Id: 4cK7wk1lp2z9tH5
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] clk: stm32: Pass udevice pointer to
	clk_register_composite()
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

The clk_register_composite() does clk_resolve_parent_clk() look up,
which requires valid udevice pointer. Do not pass NULL, pass a valid
device pointer to prevent hang on registering ck_usbo_48m clock on
STM32MP13xx.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Sean Anderson <seanga2@gmail.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 drivers/clk/stm32/clk-stm32-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index a0ae89d0912..858f122db1a 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -309,7 +309,7 @@ clk_stm32_register_composite(struct udevice *dev,
 		gate_ops = &clk_stm32_gate_ops;
 	}
 
-	clk = clk_register_composite(NULL, cfg->name,
+	clk = clk_register_composite(dev, cfg->name,
 				     parent_names, num_parents,
 				     mux_clk, mux_ops,
 				     div_clk, div_ops,
-- 
2.50.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
