Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA7F74A5ED
	for <lists+uboot-stm32@lfdr.de>; Thu,  6 Jul 2023 23:32:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A1C5C6B458;
	Thu,  6 Jul 2023 21:32:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F7E0C04B10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jul 2023 21:32:39 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5B0B8862AE;
 Thu,  6 Jul 2023 23:32:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688679158;
 bh=YGkXl87nNW0Lcj552r9Q/wa98dIw88KcrkXLJU1bbaM=;
 h=From:To:Cc:Subject:Date:From;
 b=k5kQE2Vihd7mymLu3qjd3eRysUVogF21E1lsDsI6irhBAAer3BZeD/FKdiDFIyDsu
 Wny40amHmpFX1DiG8tc6MNnjXWK0EQ9ESEPSvdMOS0zcIOyUWVMo7cg88IxLuiA/gq
 ceZOYEjWnNvP0v2wCqSAYcXg6FMAa2poY0yP+Ny3WUnSprkTj43ykOI/VIiyWNUVnT
 WxESZ2VICOuFXSXWENqhGzA0pUlCG20J1XQuPpY8mI956AZ0Ig1kI8R9ZVNpKybA3L
 iLxcbSI43Nth0BWH2Xx9YEMTwSMJgG1vgGdpl1qR4fk9Tyfn4J5Zowwdyu/gDawifU
 OPl32216jNiyQ==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Thu,  6 Jul 2023 23:32:27 +0200
Message-Id: <20230706213227.113369-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Inhibit PDDS because CSTBYDIS is
	set
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

The PWR_MPUCR CSTBYDIS bit is set, therefore the CA cores can never
enter CStandby state and would always end up in CStop state. Clear
the PDDS bit, which indicates the CA cores can enter CStandby state
as it makes little sense to keep it set with CSTBYDIS also set.

This does however fix a problem too. When both PWR_MPUCR and PWR_MCUCR
PDDS bits are set, then the chip enters CStandby state even though the
PWR_MCUCR CSTBYDIS is set. Clearing the PWR_MPUCR PDDS prevents that
from happening.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/psci.c b/arch/arm/mach-stm32mp/psci.c
index 50e3fc4ae45..79734b5289b 100644
--- a/arch/arm/mach-stm32mp/psci.c
+++ b/arch/arm/mach-stm32mp/psci.c
@@ -754,7 +754,7 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
 	setbits_le32(STM32_RCC_BASE + RCC_MP_CIER, RCC_MP_CIFR_WKUPF);
 
 	setbits_le32(STM32_PWR_BASE + PWR_MPUCR,
-		     PWR_MPUCR_CSSF | PWR_MPUCR_CSTDBYDIS | PWR_MPUCR_PDDS);
+		     PWR_MPUCR_CSSF | PWR_MPUCR_CSTDBYDIS);
 
 	saved_mcudivr = readl(STM32_RCC_BASE + RCC_MCUDIVR);
 	saved_pll3cr = readl(STM32_RCC_BASE + RCC_PLL3CR);
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
