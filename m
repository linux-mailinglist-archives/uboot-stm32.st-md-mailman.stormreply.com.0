Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDqGJoWenmkZWgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 08:02:29 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CCC192CC5
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 08:02:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6E49C8F284;
	Wed, 25 Feb 2026 07:02:28 +0000 (UTC)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04F77C8F281
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 07:02:26 +0000 (UTC)
Received: from LT03.fritz.box (ip-005-147-080-091.um06.pools.vodafone-ip.de
 [5.147.80.91])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 283D73FC45; 
 Wed, 25 Feb 2026 07:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1772002946;
 bh=rf77atkwg82ubF6PBF+S89ySVYYepR5k2RAIhItnZ68=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=fAFUio0Go36go6++QRkezZVQeCDrCcfDUfg0YGc2nuWISBs/0VClkG/Ng27jJ5PYS
 Lpx30PQtWm5yLKX0iKtY039Jhafqqoorf77uXQ9lt9OxhtkzS3pFmJ0eRFasTZC1Xj
 IV7LRW4IQapU1PIF21clWFZbDJu8mvpL0/LU2cE00fQs/y0QdtCMk8z29rBZn7tstP
 e/DGKVQtJgUMHIGfbzASIkLfMM/QGDgG417Av+epWyNol2mZvtwzhOQD0Fa1tBAzg5
 rwJmVNrCKV0JWz4MrfWco4Bx5gQ3WvDrosfPc+3NUrhIv3qobgYOYZOUrkrijipDNO
 3wWhn2JJzecPOWHhDiXNYem0+3tAlWtX48TcPKEcRFmK2T8n6ZiRkw9D1RNXmp10xL
 peaHaVIpI1lejOgnOcZZGRtJjvl6GDXRrojX7kcPLbKs4iHZXUR3V655d2Na5586EC
 aeDJN4f4Isv6jdppeK8s7T4YX1K0VLr09l90Hu82rIcTTPDb8DMepdhTlmFEqIp2Dj
 llt4wkmQVJc0LwCS2O5Xv0O2+BTdGgeN/nePjTUJIAxtz8FLouzlZoE8Ookt4Wkme+
 Wo4BLpxeebf2DOUbdaIcxyDVVG8f9+q+yubPjueGpNb5E+EAt4Ep4+ioLGXowk/Y1G
 O6BkI273PQUBbQb2MpMvkoJU=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Tom Rini <trini@konsulko.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 25 Feb 2026 08:02:24 +0100
Message-ID: <20260225070224.49099-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Cc: Marek Vasut <marek.vasut@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>, u-boot@lists.denx.de,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 1/1] arm/mach-stm32: don't select non-existent
	STM32_RESET
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:trini@konsulko.com,m:patrick.delaunay@foss.st.com,m:patrice.chotard@foss.st.com,m:marek.vasut@mailbox.org,m:cheick.traore@foss.st.com,m:u-boot@lists.denx.de,m:fabrice.gasnier@foss.st.com,m:heinrich.schuchardt@canonical.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lionel.debieve@foss.st.com,m:michael@amarulasolutions.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[heinrich.schuchardt@canonical.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.994];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[heinrich.schuchardt@canonical.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[uboot-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,canonical.com:mid,canonical.com:email]
X-Rspamd-Queue-Id: 34CCC192CC5
X-Rspamd-Action: no action

Symbol CONFIG_STM32_RESET does not exist.
Don't select it.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/arm/mach-stm32/Kconfig   | 3 ---
 arch/arm/mach-stm32mp/Kconfig | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index de9d8547e61..1c6de559142 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -10,7 +10,6 @@ config STM32F4
 	select PINCTRL_STM32
 	select RAM
 	select STM32_RCC
-	select STM32_RESET
 	select STM32_SDRAM
 	select STM32_SERIAL
 	select STM32_TIMER
@@ -27,7 +26,6 @@ config STM32F7
 	select PINCTRL_STM32
 	select RAM
 	select STM32_RCC
-	select STM32_RESET
 	select STM32_SDRAM
 	select STM32_SERIAL
 	select STM32_TIMER
@@ -47,7 +45,6 @@ config STM32H7
 	select RAM
 	select REGMAP
 	select STM32_RCC
-	select STM32_RESET
 	select STM32_SDRAM
 	select STM32_SERIAL
 	select STM32_TIMER
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 2716844b259..8ade36e4fbb 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -50,7 +50,6 @@ config STM32MP13X
 	select OF_BOARD_SETUP
 	select PINCTRL_STM32
 	select STM32_RCC
-	select STM32_RESET
 	select STM32_SERIAL
 	select SUPPORT_SPL if !TFABOOT
 	select SYS_ARCH_TIMER
@@ -72,7 +71,6 @@ config STM32MP15X
 	select OF_BOARD_SETUP
 	select PINCTRL_STM32
 	select STM32_RCC
-	select STM32_RESET
 	select STM32_SERIAL
 	select SUPPORT_SPL
 	select SYS_ARCH_TIMER
@@ -91,7 +89,6 @@ config STM32MP23X
 	select OF_BOARD
 	select PINCTRL_STM32
 	select STM32_RCC
-	select STM32_RESET
 	select STM32_SERIAL
 	select STM32MP_TAMP_NVMEM
 	select SYS_ARCH_TIMER
@@ -117,7 +114,6 @@ config STM32MP25X
 	select OF_BOARD
 	select PINCTRL_STM32
 	select STM32_RCC
-	select STM32_RESET
 	select STM32_SERIAL
 	select SYS_ARCH_TIMER
 	select TFABOOT
-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
