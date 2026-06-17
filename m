Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2VgjEtULMmoguAUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Jun 2026 04:52:05 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2126962FF
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Jun 2026 04:52:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=mailbox.org header.s=mail20150812 header.b=j058IUi1;
	dkim=fail ("body hash did not verify") header.d=mailbox.org header.s=mail20150812 header.b=g0tcTLbF;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=mailbox.org (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC3F9C7129F;
	Wed, 17 Jun 2026 02:45:19 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C3A1C5F1CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2026 02:45:19 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gg7WL0QYJz9t8w;
 Wed, 17 Jun 2026 04:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1781664318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JIMKv+LK9izpLO3BZ7zSsO06uEpMHLzxg2QuXK8wk7M=;
 b=j058IUi1f2oehBKZXlauJy9YleYmreqeOzsVEJrKI5RpTuLtRnGWTA507fC3g3nGomZKb/
 ypd0ZDaBhoQQGf2cj2+TUsh/3nzd8B0PELaK0H/BmTYmIHJT7B7biio35nyNjobMe2hs9g
 8MQkU9obI5TihGLm5ijmMDhZ2sZ+zqJUndBhskt9XU4atOt2IcyMacBV4pKZRlh/LpLGPV
 twhIIp55VMUDc13S5v2PNWu1cvVYfUPc9S387zBShoHTlCDvbj4yMn0DgEgJthukO6IlWv
 PTotWsZ8SpfIEreZ5OBMeajHXuEMyVlLv5QIJHX70qiPj8C7uf6gmI9G3o+pOA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1781664315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JIMKv+LK9izpLO3BZ7zSsO06uEpMHLzxg2QuXK8wk7M=;
 b=g0tcTLbFW7XLiXUqEXy2A+/WyW/Vq+Hn5sKL7jdy2bHFF2tWqcYB5zFQnTmLMxNQtdj5Hk
 65VTV1sJoYgsQF5Mzoxs6yVUyG30UGpV9tJLqi6Pxs9NAdZQMDNj4tVoRL/LJyPaDjRDUC
 D/HVdvGhx5bC3SUc28DMxJ8TBlrqXNHkW34OjG7bPZPgKlk5WZMwo4o92aWNGhUtYUusxq
 OA9m4IZoW1EbgvmVKsj/Mp/RcmpcupKQtSNT6MeajWmfuU1n/ObdGTPnCKC5LujTwKOkyf
 GK/MjE4xhWLbJH7e3VrJ7wqr/wVj7VFCrnQpcHL4UYarz/F13NGhgkq9F5fhTg==
To: u-boot@lists.denx.de
Date: Wed, 17 Jun 2026 04:44:59 +0200
Message-ID: <20260617024511.153241-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 85f19840fc23ae310bf
X-MBO-RS-META: u3zwc9gsbsugpzz9u7d6ba18trimw9m8
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH] MAINTAINERS: Replace STM32 and STPMIC with N:
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
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[renesas];
	URIBL_MULTI_FAIL(0.00)[stm-ict-prod-mailman-01.stormreply.prv:server fail,st-md-mailman.stormreply.com:server fail];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:uboot-stm32@st-md-mailman.stormreply.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[mailbox.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,konsulko.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,mailbox.org:email,mailbox.org:mid,mailbox.org:from_mime,denx.de:url,denx.de:email,st.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD2126962FF

Use N: to match on all stm/stm32/stpmic1 files, drop the large list of
entries which represent the same set of relevant files and miss a
few in the process.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: uboot-stm32@st-md-mailman.stormreply.com
Cc: u-boot@lists.denx.de
---
 MAINTAINERS | 36 +-----------------------------------
 1 file changed, 1 insertion(+), 35 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index edab1622bc4..c862b206a85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -623,46 +623,12 @@ M:	Patrice Chotard <patrice.chotard@foss.st.com>
 L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
 T:	git https://source.denx.de/u-boot/custodians/u-boot-stm.git
 S:	Maintained
-F:	arch/arm/mach-stm32mp/
 F:	doc/board/st/
-F:	drivers/adc/stm32-adc*
-F:	drivers/clk/stm32/
-F:	drivers/gpio/stm32_gpio.c
-F:	drivers/hwspinlock/stm32_hwspinlock.c
-F:	drivers/i2c/stm32f7_i2c.c
-F:	drivers/mailbox/stm32-ipcc.c
-F:	drivers/memory/stm32-omm.c
-F:	drivers/misc/stm32mp_fuse.c
-F:	drivers/misc/stm32_rcc.c
-F:	drivers/mmc/stm32_sdmmc2.c
-F:	drivers/mtd/nand/raw/stm32_fmc2_nand.c
-F:	drivers/phy/phy-stm32-usbphyc.c
-F:	drivers/pinctrl/pinctrl_stm32.c
-F:	drivers/power/pmic/stpmic1.c
-F:	drivers/power/regulator/stm32-vrefbuf.c
-F:	drivers/power/regulator/stpmic1.c
-F:	drivers/ram/stm32mp1/
-F:	drivers/remoteproc/stm32_copro.c
-F:	drivers/reset/stm32/
 F:	drivers/rng/optee_rng.c
-F:	drivers/rng/stm32_rng.c
-F:	drivers/rtc/stm32_rtc.c
-F:	drivers/serial/serial_stm32.*
-F:	drivers/spi/stm32_ospi.c
-F:	drivers/spi/stm32_qspi.c
-F:	drivers/spi/stm32_spi.c
-F:	drivers/video/stm32/stm32_ltdc.c
-F:	drivers/video/stm32/stm32_lvds.c
-F:	drivers/watchdog/stm32mp_wdt.c
-F:	include/dt-bindings/clock/stm32fx-clock.h
-F:	include/dt-bindings/clock/stm32mp*
-F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
-F:	include/dt-bindings/reset/stm32mp*
-F:	include/stm32_rcc.h
 F:	tools/logos/st.bmp
-F:	tools/stm32image.c
 N:	stm
 N:	stm32
+N:	stpmic
 
 ARM SUNXI
 M:	Andre Przywara <andre.przywara@arm.com>
-- 
2.53.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
