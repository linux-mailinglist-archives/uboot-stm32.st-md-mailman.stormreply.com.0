Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B73BD07CF5
	for <lists+uboot-stm32@lfdr.de>; Fri, 09 Jan 2026 09:28:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 297FCC8F288;
	Fri,  9 Jan 2026 08:28:24 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A7A3C8F283
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 02:17:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E5F610B030; Thu,  8 Jan 2026 03:17:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1767838627; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=0Qt7l6OG7mZBuPmoER87AzE5iYWoeaHOp0jbpJhzDNk=;
 b=jVvZl8tV+NBqRMm5JpkxKf9ZdgdrqIlh82Reu4ZhP3m6VzokEarKtCZ7KQMV39IrI2/LgE
 dv9kC/x6DTFtz/Tz/rCrFfqzW7SBbWPNLkM9KmeiWcUIiJ66jdB7MTaY+R28v3QO+kb2UZ
 9ckTFchGDLKzMLx1fwB4UuC1pW/5rUrJFjpBucDntZ8hYnxEJOV85Qf/sDS9101IYjnwzu
 6955hNTk0Sd27vd5zPguzpGTgkInGnSoYPNgl3QQdzmdB0dXm1TlS4vaqqn2uh5nsKHwcy
 PpA3gjU6SQvPYMlqp/Gce912wcj5SBcVT+ZH9kv/X0xtRwlfbd+EwRW7qUtbDw==
From: Marek Vasut <marex@nabladev.com>
To: u-boot@lists.denx.de
Date: Thu,  8 Jan 2026 03:16:51 +0100
Message-ID: <20260108021705.518243-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Fri, 09 Jan 2026 08:28:23 +0000
Cc: Marek Vasut <marex@nabladev.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>, u-boot@dh-electronics.com,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Reinstate missing SPL configs for
	DH STM32MP15xx DHSOM
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

Re-enable missing configs for DH STM32MP15xx DHSOM, to allow those
devices to successfully boot again.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 configs/stm32mp15_dhsom.config | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
index d5ecbac29e0..24420372e3f 100644
--- a/configs/stm32mp15_dhsom.config
+++ b/configs/stm32mp15_dhsom.config
@@ -38,7 +38,13 @@ CONFIG_WATCHDOG_AUTOSTART=y
 CONFIG_SPI_FLASH_MACRONIX=y
 CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_SPI_FLASH_STMICRO=y
-CONFIG_SPL_LEGACY_IMAGE_FORMAT=y
-CONFIG_SPL_TEXT_BASE=0x2FFC2500
 CONFIG_SPL_BLOCK_CACHE=y
+CONFIG_SPL_DM_REGULATOR=y
+CONFIG_SPL_DM_REGULATOR_STPMIC1=y
+CONFIG_SPL_DM_USB_GADGET=y
+CONFIG_SPL_HAVE_INIT_STACK=y
+CONFIG_SPL_LEGACY_IMAGE_FORMAT=y
 CONFIG_SPL_MMC=y
+CONFIG_SPL_SYS_MMCSD_RAW_MODE=y
+CONFIG_SPL_TEXT_BASE=0x2FFC2500
+CONFIG_SPL_USB_GADGET=y
-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
