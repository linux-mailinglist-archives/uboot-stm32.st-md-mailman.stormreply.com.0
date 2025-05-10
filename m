Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7493FAB2190
	for <lists+uboot-stm32@lfdr.de>; Sat, 10 May 2025 08:53:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 086A1C7A82A;
	Sat, 10 May 2025 06:53:25 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3266CC7A827
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 May 2025 06:53:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D69E1048C2EC; 
 Sat, 10 May 2025 08:53:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1746860001; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=NEh//dowW1jPWMv1h+gaF6OZx0be15GKB1n3eRXb/cg=;
 b=G30QAzlPLKWz5TC5VBsnsbxUHymNdaao+nTiZL3jVB6LCBD7XVsSmzGuT0OLECY+SBXkc2
 kaiGbi8OTUmrupE7G9y77UYFDojnsAiaBgr9MH4l16LQ817cnrCnZFF4RC+iAyNJYi/ABk
 /Oj3ZTUKL+wQ5CqtY3jpB/kOjtnyvc8V/3GDNVBHxmT31yc69+lrfRJHJo602M5JxqjJIU
 RAX44rGJf5RSD4aeK7U6bTARr03z4S8aHTc6b4aFOzBc/f3/ctv/KKZdUK6ELZnJhIoViJ
 oDDgDmY8DunreVQPpsaehDjJFGS4ytbitp9PlQ31MJTjIyprLRpN9mp3XGHt8Q==
From: Lukasz Majewski <lukma@denx.de>
To: Tom Rini <trini@konsulko.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Marek Vasut <marex@denx.de>
Date: Sat, 10 May 2025 08:52:56 +0200
Message-Id: <20250510065256.267546-1-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: [Uboot-stm32] [PATCH] ARM: stm32mp: Correct sign extension for
	memory address in dram_bank_mmu_setup()
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

On a system based on stm32mp157c, with 1GiB SDRAM (starting from
0xC0000000) and CONFIG_PHYS_64BIT enabled (so the phys_addr_t becomes
'unsigned long long') the mainline u-boot hangs.

It is caused by marking for this memory region the TLB entry as invalid
in the dram_bank_mmu_setup().

To be more specific the condition of 'addr >= gd->ram_top' is met
in this case.

The reason for it is that the 'addr' variable in that function has sign
extension from 'int' typed i automatic variable:
addr = i << MMU_SECTION_SHIFT;

For example i = 0xc01 causes addr = 0xffffffffc0000000 as int typed i
variable (with MSB bit set) is sign extended to unsigned long long addr.

The proposed fix is to change i type from 'int' to 'unsigned int', so the
sign extension will not take place and addr = 0xc0000000, which is smaller
than gd->ram_top = 0x100000000.

This change shall be safe as i shall not be negative as it represents the
SDRAM areas (in granularity of 1MiB areas).

Fixes: 25fb58e88aba ("ARM: stm32mp: Fix dram_bank_mmu_setup() for LMB located above ram_top")

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 arch/arm/mach-stm32mp/stm32mp1/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
index d5eaf6711b6..0ed5eda47d0 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
@@ -51,7 +51,7 @@ u32 get_bootauth(void)
 void dram_bank_mmu_setup(int bank)
 {
 	struct bd_info *bd = gd->bd;
-	int	i;
+	unsigned int i;
 	phys_addr_t start;
 	phys_addr_t addr;
 	phys_size_t size;
-- 
2.39.5

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
