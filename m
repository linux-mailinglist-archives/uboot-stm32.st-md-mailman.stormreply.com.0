Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCEKGEC/AGoCMQEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sun, 10 May 2026 19:24:16 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0C450565D
	for <lists+uboot-stm32@lfdr.de>; Sun, 10 May 2026 19:24:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8AF3C87EC3;
	Sun, 10 May 2026 17:17:47 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 492A1CFAC40
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 May 2026 17:17:47 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gD8gZ2f0vz9trC;
 Sun, 10 May 2026 19:17:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1778433466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h95iAmUrYmIQGfHD/OOdajo7oc2aU4j+2dEcBLetKko=;
 b=gPKnUzvyTB8beQjD1afbZymB/nXTqS+k+bWPKKZhZP6Ysqztzk/5V4Vh/LpZ7Ahs8Ihbz5
 l5fRef6r4/xtnsSnJX9oLOT/AbmUVfO+QBMEouPjraP4OYbqcSuZ3sSJaGB2+IdBuGtjwa
 xTEAsfM3PO65RXjC3Pf5n0bU1H6KZTKI9+JdLW9fSNvLAGCE7jcfyeAOsuG95h5jFyRb6b
 wScR8MBCFEmnEEgZ4HFspAIbqJi2I3jFZQs5equMWSuuLTrknUt9tpZO3rFktLttdiJIre
 1j9WK3GH7zt8ROSjHd5OPWU5k5m0xXbAnlNw5WdRhoWZcU39ORvKM6jIcnJv/Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1778433464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h95iAmUrYmIQGfHD/OOdajo7oc2aU4j+2dEcBLetKko=;
 b=M4bl6TphxiAC7jCR+JnTEXYTwaIPucRlvBHzwv3TBUEmRgYQbX9zApJNfUeHQhgrBSTitg
 wbwVIiWNdkLWabjyL3pqj5pTiRqQUxT0kmuxZ9NaDNTcG0yYYT0O9Zm6HHJVxYK8oe5dhL
 yzLyT7zOe+7WZsM1vQONRF5A+orYUrnOjmcyEB9t6LQ6YjBaukda8YpLMTYdr/8Ix/J5zW
 1IRd1Uijqv2S+b0ehkarUZUr59sy2RJKf4t9y3xqGzwA/QNxtep0g5P8L0N5+CuEw2C+GX
 Kj36ludxSXXR/RUU/jUsFShSNFdidz2LpmMpiLbdAsCT7cXbMrGuoOeI+urXpA==
To: u-boot@lists.denx.de
Date: Sun, 10 May 2026 19:17:04 +0200
Message-ID: <20260510171723.56866-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260510171723.56866-1-marek.vasut+renesas@mailbox.org>
References: <20260510171723.56866-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: u4gqoh8ez9xxn769en59foemubbjsaie
X-MBO-RS-ID: 8537b3bfc5576dd47f5
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: [Uboot-stm32] [PATCH 09/11] video: stm32: Staticize and constify
	driver ops
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
X-Rspamd-Queue-Id: 0A0C450565D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[mailbox.org : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[mailbox.org:s=mail20150812];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:ag.dev.uboot@gmail.com,m:marek.vasut@mailbox.org,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[mailbox.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[konsulko.com,mailbox.org,st-md-mailman.stormreply.com,foss.st.com,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	NEURAL_SPAM(0.00)[0.261];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:mid,konsulko.com:email,denx.de:email,stormreply.com:email,stormreply.com:url,st.com:email]
X-Rspamd-Action: no action

Set the ops structure as static const. The structure is not accessible
from outside of this driver and is not going to be modified at runtime.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Anatolij Gustschin <ag.dev.uboot@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 drivers/video/stm32/stm32_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
index 5c4d8d2aab5..29c57a4ff89 100644
--- a/drivers/video/stm32/stm32_dsi.c
+++ b/drivers/video/stm32/stm32_dsi.c
@@ -511,7 +511,7 @@ err_reg:
 	return ret;
 }
 
-struct video_bridge_ops stm32_dsi_ops = {
+static const struct video_bridge_ops stm32_dsi_ops = {
 	.attach = stm32_dsi_attach,
 	.set_backlight = stm32_dsi_set_backlight,
 };
-- 
2.53.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
