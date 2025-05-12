Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E007AB3D14
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 May 2025 18:11:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE8B3C7A82D;
	Mon, 12 May 2025 16:11:58 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8A5EC78F9B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 16:11:57 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Zx4P90vd8z9stB;
 Mon, 12 May 2025 18:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747066317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6GT4pVPGub7tDbc58g9+FPybqSJRKW5wJe3U8q8RXcU=;
 b=gIxY1Xnym2APo+KqHIjHKfyPvNBwn466iFweNRiPsalw9U2B+RDiGfrc3B+efsMNdGVE9F
 uWOKUHaVaphN2m9zQEkfORlqYEB1lDVI5LH9PRhHVnBhdyMI+5bLPmJIJci/AupcBzOORp
 flyL6cTcozPH2fABgJimAKFv1w8xo/F3SSej62u4IrINcJDC56KvyibljxfEN4GWhSvyaE
 MxZBF3q/R83yJPQd5SY0r+9Yv4Eej0xVNilBiwo8Rh5ATvQUf+XhyzlKaErISPN9GapxNR
 M4gzAEOL/1HtzHfhjVk8VEn5yZwLcL9I5qIHLWNI4tt2b4ACqiVx8htVaYhhZA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747066315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6GT4pVPGub7tDbc58g9+FPybqSJRKW5wJe3U8q8RXcU=;
 b=n34/+hDB2rWIBC9Kbm2EvQYDvqIjobmGyOuv/+QDiucqS56stA4fIdoO2MBL4vkz6rbep+
 mQr+72OJW7rMcYdHrzaeiSfPHcaC7h/SaEtVJesbeP0LZEDBwVKNhmj/SAieNMr53wHK21
 S/3v1QSk+523M1ajKZS3X2Tajkk4pGP9hXc4lempGn++MyeK6UHpCgdNy35y1kQ5RMIG+a
 v4GDlL+ecCX5Kq1sCPHoMWCCdRX2ti/hTkU7PELp1te4yu7W8kPFs8zQJeS85iySTwUodD
 U9cnZ377X/XF/32EnJqRO/ziD2nmBhf9uRSR2Wiyax8f7h1SYSICBS0y6xXaSg==
To: u-boot@lists.denx.de
Date: Mon, 12 May 2025 18:11:37 +0200
Message-ID: <20250512161146.146658-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: ebfkdpkztm9g8nukfibbxq3sfh5jos7u
X-MBO-RS-ID: 566b448db9e56e532bc
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Drop unnecessary space
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

Drop a space after tab, no functional change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
index 4f1d783649b..caeeeca863c 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
@@ -67,7 +67,7 @@
 #define BOOTROM_PARAM_ADDR	0x2FFC0078
 #define BOOTROM_MODE_MASK	GENMASK(15, 0)
 #define BOOTROM_MODE_SHIFT	0
-#define BOOTROM_INSTANCE_MASK	 GENMASK(31, 16)
+#define BOOTROM_INSTANCE_MASK	GENMASK(31, 16)
 #define BOOTROM_INSTANCE_SHIFT	16
 
 /* Device Part Number (RPN) = OTP_DATA1 lower 8 bits */
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
