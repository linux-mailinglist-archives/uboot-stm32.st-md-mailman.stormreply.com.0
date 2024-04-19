Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 260088AB703
	for <lists+uboot-stm32@lfdr.de>; Sat, 20 Apr 2024 00:03:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF184C6DD9B;
	Fri, 19 Apr 2024 22:03:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EE96C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 22:03:50 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 096B8884EB;
 Sat, 20 Apr 2024 00:03:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713564229;
 bh=bwL/s5ptFcdr3ehhR4P+83rS3mT4uufOnY6YGs8tudI=;
 h=From:To:Cc:Subject:Date:From;
 b=T1rUKJE9pztiuPJHEX/daeq3i6ql0MqX3QukXYkf+tk5rO1zEJuUwAoqs73w0BAbZ
 +OqbGH2w0dwwF/tNfTkPw70U8XffGDQeCRyNTUXfSLs34tmt2CIfPkUIMKbZp4unhY
 6tfTi09HSaaIGaVc8/+BiXfg0CQCp9eDdxnpXxmuo/oB8DpamSD1KZr0/TjuJZfSa0
 veVtINwydqblxO8iLlJK4//XQteOok7QYodDC/Tv5c7BirwWc3+u+fgUvqsphxJS5Q
 N+xIZh8Rbrv02VXNmxLu+wDYQcL6yYtZxFmMd9q1wRiIKAgMoo0K7hh8JVcZlGyUaU
 3RX7eqwhBZVlA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat, 20 Apr 2024 00:03:09 +0200
Message-ID: <20240419220331.277574-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Igor Opaniuk <igor.opaniuk@foundries.io>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Ping IWDG on exit from PSCI
	suspend code
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

Make sure the OS would not get any spurious IWDG pretimeout IRQ
right after the system wakes up. This may happen in case the SoC
got woken up by another source than the IWDG pretimeout and the
pretimeout IRQ arrived immediately afterward, but too late to be
handled by the suspend main loop. In case either of the IWDG is
enabled, ping it first and then return to the OS.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/stm32mp1/psci.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/psci.c b/arch/arm/mach-stm32mp/stm32mp1/psci.c
index 4f2379df45f..e99103910d9 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/psci.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/psci.c
@@ -808,6 +808,27 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
 	writel(SYSCFG_CMPENR_MPUEN, STM32_SYSCFG_BASE + SYSCFG_CMPENSETR);
 	clrbits_le32(STM32_SYSCFG_BASE + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
 
+	/*
+	 * Make sure the OS would not get any spurious IWDG pretimeout IRQ
+	 * right after the system wakes up. This may happen in case the SoC
+	 * got woken up by another source than the IWDG pretimeout and the
+	 * pretimeout IRQ arrived immediately afterward, but too late to be
+	 * handled by the main loop above. In case either of the IWDG is
+	 * enabled, ping it first and then return to the OS.
+	 */
+
+	/* Ping IWDG1 and ACK pretimer IRQ */
+	if (gic_enabled[4] & BIT(22)) {
+		writel(IWDG_KR_RELOAD_KEY, STM32_IWDG1_BASE + IWDG_KR);
+		writel(IWDG_EWCR_EWIC, STM32_IWDG1_BASE + IWDG_EWCR);
+	}
+
+	/* Ping IWDG2 and ACK pretimer IRQ */
+	if (gic_enabled[4] & BIT(23)) {
+		writel(IWDG_KR_RELOAD_KEY, STM32_IWDG2_BASE + IWDG_KR);
+		writel(IWDG_EWCR_EWIC, STM32_IWDG2_BASE + IWDG_EWCR);
+	}
+
 	/*
 	 * The system has resumed successfully. Rewrite LR register stored
 	 * on stack with 'ep' value, so that on return from this PSCI call,
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
