Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBCD9F276F
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Dec 2024 00:30:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5117AC78015;
	Sun, 15 Dec 2024 23:30:50 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE333C71292
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Dec 2024 23:30:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F0EBA1049AF74; Mon, 16 Dec 2024 00:30:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1734305442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MusT4ZOIorBrONsjspVDd8/qpNsLs43bOaUjTSRfAjM=;
 b=Jz9462vT8cn4jGP4I7Lhvyp5yc+G1flgtW4kHNjnE+by0DhSO9RrSt3FWqw9snKleysV3W
 IA0DeWypbz3GOFT3BPHiZ2c1hX0b9fl9pp0X15XPpQ0Nki4VeP6YJmvf/mL/7LJFtF7cA4
 7M2URqpbKMkMF74YT2fcbOuq3CFmyNAEKVn71JMQEcif3fZ3Era31JjdD1Vw4YhNRe/FGe
 oPvLDGjSbAH5ToFBu9UPhSaHX3KspSgXRr6IqcBEzXFCTEgFR16x0jBN52uuB7e5T0xhdb
 /Thit0xmv35rEeNcIPQriNG5f27Hd2HIuDCYNcpvTQmWQaU879dmtm7OITbmWw==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 16 Dec 2024 00:29:13 +0100
Message-ID: <20241215233011.569287-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241215233011.569287-1-marex@denx.de>
References: <20241215233011.569287-1-marex@denx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: [Uboot-stm32] [PATCH 2/4] ARM: dts: stm32: Reinstate
	SPL_SYS_MMCSD_RAW_MODE on DH STM32MP15xx DHSOM
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

Commit 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options")
broke booting from SD card on STM32MP15xx , reinstate raw mode SD
boot configuration options and select the correct raw mode partition
for STM32MP15xx to fix SD boot on STM32MP15xx DHSOM.

Fixes: 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options")
Reported-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
NOTE: For 2025.01
---
Cc: Igor Opaniuk <igor.opaniuk@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 configs/stm32mp15_dhsom.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
index efc149577ea..04ee9bfc444 100644
--- a/configs/stm32mp15_dhsom.config
+++ b/configs/stm32mp15_dhsom.config
@@ -57,11 +57,14 @@ CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_STACK=0x30000000
 CONFIG_SPL_SYS_MALLOC=y
 CONFIG_SPL_SYS_MALLOC_SIZE=0x1d00000
+CONFIG_SPL_SYS_MMCSD_RAW_MODE=y
 CONFIG_SPL_TEXT_BASE=0x2FFC2500
 CONFIG_SPL_USB_GADGET=y
 CONFIG_STM32_ADC=y
 CONFIG_SYSRESET_SYSCON=y
 CONFIG_SYS_BOOTCOUNT_ADDR=0x5C00A14C
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=0x3
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
 CONFIG_SYS_MALLOC_F_LEN=0x3000
 CONFIG_SYS_PBSIZE=1050
 CONFIG_PREBOOT="run dh_preboot"
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
