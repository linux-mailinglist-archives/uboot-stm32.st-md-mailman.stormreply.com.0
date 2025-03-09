Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8051BA5804A
	for <lists+uboot-stm32@lfdr.de>; Sun,  9 Mar 2025 03:06:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B9F5C78F62;
	Sun,  9 Mar 2025 02:06:41 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5C8AC78F60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Mar 2025 02:06:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C477610382F00; Sun,  9 Mar 2025 03:06:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1741485998; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=xni/w+Kq967GihZxUuDRlLaRnQF6yNCYBcsqPUN1oi0=;
 b=TEo8LjeiMDoSZbMZ+ILRx1JmvnU+V1YDWr7y/JFyB1TNlJSbnvajqWJBjlXxGGMypnOnAH
 iEpBvma1pVuYWhwvPDxpI0vqCt5+OFa3pv+uP1iHwd1RZiDR3nBi0BMHJMo3075E2KksiE
 t3nwKFhFh4RzBfmI//m0Bx+vIbITatDsNKoNHz11h1V/HUMnV8LaZrJM4rATT+sG6sMb+k
 MljRhWI5y35f59E5nP09UviJ1t1wHnmVJHkJRrH5XVlq4R6TxUa1XFryS21QEyvIOntLai
 oaVU2quqyjmQpXyusmnrBUt+fI2LoF8yTLir0uSq+eOrPmLP4jm84p9AVjDg9g==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sun,  9 Mar 2025 03:05:54 +0100
Message-ID: <20250309020623.1605623-1-marex@denx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Lukasz Majewski <lukma@denx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32mp: Fix dram_bank_mmu_setup() for
	ram_top=0
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

On STM32MP15xx with 1 GiB of DRAM, the gd->ram_top becomes 0,
because DRAM base 0xc0000000 + DRAM size 0x40000000 leads to
gd->ram_top overflow which resets it to 0. Handle this special
case simply by checking for gd->ram_top being zero, and if it
is, assume there is no addr >= gd->ram_top .

This fixes boot hang on STM32MP15xx with 1 GiB of DRAM.

Fixes: 25fb58e88aba ("ARM: stm32mp: Fix dram_bank_mmu_setup() for LMB located above ram_top")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Marek Vasut <marex@denx.de>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/stm32mp1/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
index cb1b84c9af9..d5eaf6711b6 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
@@ -82,7 +82,7 @@ void dram_bank_mmu_setup(int bank)
 		option = DCACHE_DEFAULT_OPTION;
 		if (use_lmb &&
 		    (lmb_is_reserved_flags(i << MMU_SECTION_SHIFT, LMB_NOMAP) ||
-		    addr >= gd->ram_top)
+		     (gd->ram_top && addr >= gd->ram_top))
 		   )
 			option = 0; /* INVALID ENTRY in TLB */
 		set_section_dcache(i, option);
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
