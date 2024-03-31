Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC0989355E
	for <lists+uboot-stm32@lfdr.de>; Sun, 31 Mar 2024 20:22:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6311DC6C820;
	Sun, 31 Mar 2024 18:22:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 559D3C6B476
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 Mar 2024 18:22:14 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 725468780A;
 Sun, 31 Mar 2024 20:22:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1711909333;
 bh=DpScHbl4tuYg7q6NIUnvud+jkVbKAW3Egvpwp4B1zdw=;
 h=From:To:Cc:Subject:Date:From;
 b=EvkVkNphTa4vIDNLUma+iRD/YIjerp0Ou//VYK/GQWV5kAlmihrhqXEFtKm/GJqlc
 zWStM1ioY+znmjHUr/cYOOSWCRPUYiESP3Ex1INeUPije3fERmp15se2m/FIeNXgfX
 wHDwCejBWa/SdodRPwQuxb4u413M5xAVhHa8Id/4eAglSylB5VmIr0plkRdgw2rXla
 ciiPoOAqi4nvagqXCtpEhpoXWhY65awhrBJrfwMR7gefh4eDg2xFRIkWMPqn8e5myV
 N6YmYmlR3ukkAsROinAKv7zMWXFhd6OKG7Pr/R+dwlkVZkMJxi6kmSJdXIMvjIt3Z7
 oMT5B9KxfiTcA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sun, 31 Mar 2024 20:21:47 +0200
Message-ID: <20240331182202.335923-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Jump to ep on successful resume
	in PSCI suspend code
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

In case the system has resumed successfully, the PSCI suspend resume
code has to jump to the 'ep' successful resume entry point code path,
otherwise the code has to jump to content of the LR register, which
points to failed resume code path.

To implement this distinction, rewrite LR register stored on stack
with 'ep' value in case of a successful resume, which is really in
every case unless some catastrophic failure occurred during suspend.

Without this change, Linux counts every resume as failed in
/sys/power/suspend_stats/fail

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/psci.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/mach-stm32mp/psci.c b/arch/arm/mach-stm32mp/psci.c
index 8cdeb0ab3f2..4f2379df45f 100644
--- a/arch/arm/mach-stm32mp/psci.c
+++ b/arch/arm/mach-stm32mp/psci.c
@@ -703,6 +703,8 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
 {
 	u32 saved_mcudivr, saved_pll3cr, saved_pll4cr, saved_mssckselr;
 	u32 gicd_addr = stm32mp_get_gicd_base_address();
+	u32 cpu = psci_get_cpu_id();
+	u32 sp = (u32)__secure_stack_end - (cpu << ARM_PSCI_STACK_SHIFT);
 	bool iwdg1_wake = false;
 	bool iwdg2_wake = false;
 	bool other_wake = false;
@@ -805,4 +807,16 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
 
 	writel(SYSCFG_CMPENR_MPUEN, STM32_SYSCFG_BASE + SYSCFG_CMPENSETR);
 	clrbits_le32(STM32_SYSCFG_BASE + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
+
+	/*
+	 * The system has resumed successfully. Rewrite LR register stored
+	 * on stack with 'ep' value, so that on return from this PSCI call,
+	 * the code would jump to that 'ep' resume entry point code path
+	 * instead of the previous 'lr' register content which (e.g. with
+	 * Linux) points to resume failure code path.
+	 *
+	 * See arch/arm/cpu/armv7/psci.S _smc_psci: for the stack layout
+	 * used here, SP-4 is PC, SP-8 is LR, SP-12 is R7, and so on.
+	 */
+	writel(ep, sp - 8);
 }
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
