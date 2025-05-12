Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B1EAB3DF6
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 May 2025 18:45:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BABB3C7A82D;
	Mon, 12 May 2025 16:45:08 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71EEBC7A82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 16:45:07 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Zx57R10rrz9sy9;
 Mon, 12 May 2025 18:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747068307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aczK3CBUG8ChsLDwMgi0hgIR1BnC6epYbhlJBR4C9iw=;
 b=gs0qV7cNNwz4264/kUzlA8DnmQhewDRowmPyxz5xaWRsOdCNylOj5u65FRf6wFjZKGAc4T
 SAZ+R7NkMKMB5KJAZaqjAhYZMor7jI0tjxetyaKmdQEK+MaObVNxI0AVRhYTRuslr0BpX5
 oIKyzoezBk1yd1MkQpICPF9oryeRTHLY34CStBV3SYScya0HqArl8iDilSC6jzn6P7yZRp
 HvtJEjKs6PH5dhh8UEEhtFcPqUqKvZQDqdQcfPSIlEfdgG4u8Q9+FZP7q8leHVA9sMbrpb
 /bY4s5QMaOg6d+xwB7MXyPgfkCBymntJmJozNzw+C1kK8g9vcFQnDNAi0c9Bng==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747068305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aczK3CBUG8ChsLDwMgi0hgIR1BnC6epYbhlJBR4C9iw=;
 b=HrOejWc+SFx8wEb7xa1b0NsI0tYkjZwk5w1nYSsGTxBJNyzoXGTM75l/nmtoEvX6fFMe5x
 EvR5kjkoMuuSeHHGLgUAuiZvUAxUiEM2hMuhE1rhTbydL7zmlBc0gRsq/1FOVGm4m+paeu
 BeiK8g3fTjivtfMpGrmQa3tcKvbUKDtq8mdhIUP2NXuQhJmVH/2brOPRPtE+QQzbN4XkYm
 K99tj9uYO8RBlftOou8dad6GelNj+3mrEFMIDyGvmIA3qKPcDj0EJNvn5ySfUVjc9A0r04
 wi49SYwPTbBIj5bQrDKLO8tqb+L8RXUvd0xfIxgCssug6H7k/6XmPKnW98T3iQ==
To: u-boot@lists.denx.de
Date: Mon, 12 May 2025 18:44:53 +0200
Message-ID: <20250512164456.147764-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: xapnii7n1d3nyxwh86pp5s5hns88diz3
X-MBO-RS-ID: 130eaad637865cf2d4c
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Fix DBGMCU macro on STM32MP13xx
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

The DBGMCU block is available at address 0x50081000 both on STM32MP13xx
and on STM32MP15xx . There is no reason to limit the DBGMCU macro being
set only on STM32MP15xx , remove the ifdeffery.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/include/mach/stm32.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 47b459b75d1..dfba57e7dc4 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -78,9 +78,7 @@ enum forced_boot_mode {
 #define STM32_RCC_BASE			0x50000000
 #define STM32_PWR_BASE			0x50001000
 #define STM32_SYSCFG_BASE		0x50020000
-#ifdef CONFIG_STM32MP15X
 #define STM32_DBGMCU_BASE		0x50081000
-#endif
 #define STM32_FMC2_BASE			0x58002000
 #define STM32_IWDG2_BASE		0x5A002000
 #define STM32_DDRCTRL_BASE		0x5A003000
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
