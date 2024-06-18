Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 713CB90DF80
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2024 00:58:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13F7FC71282;
	Tue, 18 Jun 2024 22:58:01 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9822C6B460
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 22:57:53 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 08F8987B1A;
 Wed, 19 Jun 2024 00:57:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718751473;
 bh=mHdGbAfL7loFwPRWsGcPODHrjm6hndIyYhu9UP1rfQw=;
 h=From:To:Cc:Subject:Date:From;
 b=AtZBfWII4DbI6Zllq53rxDR27cFjLow36BgOL/j6WMZ9PiMzclbnlwzXhbj3BaAud
 /T5foupZV0EnT8N5RcpnjaP611NbdC0QBrd5taoJStrPm3gtjhORnn7WsyKnfeD1YO
 woVzi9AIvRAS3jY84MSJAvRfU/V6Yc3r0DkEtTHWbJ9OYfU97rMgTiUxhIMXzRiaFc
 JNqPNRTxHbJBLmVqwBucbR9JddPSLEYD9kQbKSpXNM11PAv454gjw+TZg56YeOYIt1
 Q2ZqcEEudTiSEg6nxD7ez+ZHrzfXxkuF2Cu9ji9MzdKD8b/1MlbAkfB1LChIYNokvb
 w3N1DxC+2MAsA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Wed, 19 Jun 2024 00:57:25 +0200
Message-ID: <20240618225736.154959-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Fix TAMP_SMCR BKP..PROT fields on
	STM32MP15xx
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

Update the TAMP_SMCR BKP..PROT fields to put first 10 registers
into protection zone 1 and next 5 into zone 2. This fixes use of
boot counter which is often in zone 3 and has to be updated from
Linux, which runs in NS.

Fixes: 73f7fc944cf6 ("ARM: stm32: Initialize TAMP_SMCR BKP..PROT fields on STM32MP15xx")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
index f096fe538d8..ca202bec8ee 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
@@ -148,8 +148,8 @@ static void security_init(void)
 	 */
 	clrsetbits_le32(TAMP_SMCR,
 			TAMP_SMCR_BKPRWDPROT | TAMP_SMCR_BKPWDPROT,
-			FIELD_PREP(TAMP_SMCR_BKPRWDPROT, 0x20) |
-			FIELD_PREP(TAMP_SMCR_BKPWDPROT, 0x20));
+			FIELD_PREP(TAMP_SMCR_BKPRWDPROT, 0x0A) |
+			FIELD_PREP(TAMP_SMCR_BKPWDPROT, 0x0F));
 
 	/* GPIOZ: deactivate the security */
 	writel(BIT(0), RCC_MP_AHB5ENSETR);
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
