Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EFF8A44A3
	for <lists+uboot-stm32@lfdr.de>; Sun, 14 Apr 2024 20:38:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74AF9C6B444;
	Sun, 14 Apr 2024 18:38:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B12CAC69063
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Apr 2024 18:38:56 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B8B9288059;
 Sun, 14 Apr 2024 20:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713119936;
 bh=vvbY4rgNYy0L0mmDHyHQv92j8o1c/3R7HzJfmAN2n3M=;
 h=From:To:Cc:Subject:Date:From;
 b=Yfm93qsvnxCr5TiVsVYWGNaJnQU/o5sQ0KK35KQpaYFpNXpvnqfFVp7ESh+Nxgd3l
 WPrAN+jSrTEUMhbfX1rbZBWgBwKezeEZiftdXYwr+BUWD5LEfTvQRITxDOIV3AAYEN
 B25D3ah9M3bS8Aka/4uXwnTK/C5C5g/zg17loOPfQOsHQetwvnQ00gitvRhr1oBCWC
 Fp2Gmbykrn8pPBV9bUHyCCbAoy0w4FBChQ0BL0hgF3gD2YPeJJTIDA4VucdP+PcZt2
 5ZNtrXoSizuGFDzuUVYFTYNGl2tyhUxb9t1+0U1NrMllMu5NpvvFhJOB2CXJIKsakD
 KLqDkk/uf9Ccw==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sun, 14 Apr 2024 20:38:31 +0200
Message-ID: <20240414183843.146985-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Igor Opaniuk <igor.opaniuk@foundries.io>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Drop superfluous Makefile entry
	for ecdsa_romapi.o
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

The source file is in arch/arm/mach-stm32mp/ecdsa_romapi.c and not
in arch/arm/mach-stm32mp/stm32mp1/ecdsa_romapi.c . There are two
Makefile entries in each subdirectory. Drop the bogus one and keep
only the correct one, the one in arch/arm/mach-stm32mp/Makefile .

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/stm32mp1/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/Makefile b/arch/arm/mach-stm32mp/stm32mp1/Makefile
index 857148747ef..ebae50f66c9 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/Makefile
+++ b/arch/arm/mach-stm32mp/stm32mp1/Makefile
@@ -8,7 +8,6 @@ obj-y += cpu.o
 obj-$(CONFIG_STM32MP13X) += stm32mp13x.o
 obj-$(CONFIG_STM32MP15X) += stm32mp15x.o
 
-obj-$(CONFIG_STM32_ECDSA_VERIFY) += ecdsa_romapi.o
 ifdef CONFIG_SPL_BUILD
 obj-y += spl.o
 obj-y += tzc400.o
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
