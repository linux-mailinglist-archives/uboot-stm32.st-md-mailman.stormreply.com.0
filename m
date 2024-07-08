Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0936A92A16E
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Jul 2024 13:44:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0C4AC6DD96;
	Mon,  8 Jul 2024 11:44:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8C27C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2024 11:43:58 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3ED4E886F0;
 Mon,  8 Jul 2024 13:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720439038;
 bh=pFos5dthmBQ8aWDdYOEHpJBAdqmUEX0q6stsFS39s+c=;
 h=From:To:Cc:Subject:Date:From;
 b=VukovIlduOef0qDa6ZNsZgtctmbEZMv7Vl50c03xjy+FALG9eWbshwijZj5VECNkn
 6OvdBLro8fuKHzNhj3L+yLeRk9b1DF94PQ8KpO3oD8h4HYAn91JiUllXlx7RykiUvF
 ZpQ8jKEPW/XpA6vD9t7fRhkM+XiL+LA6mYeM2z73Plk5y178tAv6JL+akZIarb9uRV
 eSzECjaW+/ucds4be5Ojh3BuK6W2LpdbaGTuVpg5gGOpSbnLpcgLCciIViObM1klNb
 u7iRsGSun+wupQO/MWzmebLHPYZFVHG6sP7jlfcZGgWUxQA/1pMOma6dKPLwezOpiv
 6Lx5pyyftrkog==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon,  8 Jul 2024 13:43:23 +0200
Message-ID: <20240708114344.18354-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Fix secure_waitbits() mask check
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

Do not apply bitwise AND to register value and expected value, only
apply bitwise AND to register value and mask, and only then compare
the result with expected value that the function polls for.

Fixes: b49105320a5b ("stm32mp: psci: Implement PSCI system suspend and DRAM SSR")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/stm32mp1/psci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/psci.c b/arch/arm/mach-stm32mp/stm32mp1/psci.c
index e99103910d9..ffdafea464d 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/psci.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/psci.c
@@ -393,8 +393,7 @@ static int __secure secure_waitbits(u32 reg, u32 mask, u32 val)
 	asm volatile("mrrc p15, 0, %Q0, %R0, c14" : "=r" (start));
 	for (;;) {
 		tmp = readl(reg);
-		tmp &= mask;
-		if ((tmp & val) == val)
+		if ((tmp & mask) == val)
 			return 0;
 		asm volatile("mrrc p15, 0, %Q0, %R0, c14" : "=r" (end));
 		if ((end - start) > delay)
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
