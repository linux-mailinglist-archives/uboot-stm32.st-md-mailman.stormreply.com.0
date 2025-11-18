Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C317C6BF72
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Nov 2025 00:17:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CB37C62D20;
	Tue, 18 Nov 2025 23:17:40 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2875CC628DE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 23:17:38 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dB0rd4zNcz9t3Y;
 Wed, 19 Nov 2025 00:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763507857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yiVi0rh36drxwi21hFZJAr0KONLvnhhDTwyyQWZELSM=;
 b=WrgAjiVLvzbPZzdzk3afwxMIXdWeovIl72fJOe9bNOIVLvGRpO20/d3L5mAHuSm2IFvleP
 BRA+GacIDyzOCua1SbDBn9aL+cJkVnPICJ1YYJpRUbMXTZQyBf6q+g3VDClDT/tGLgTDs5
 nB7l/NwOq4cKNtTjyjkWSp4jBVZimpTBd1ulnUGLvrGvqER5UIodqApT2z1j/hIdmToBOQ
 Tqsx676X6eE1bcHP5VtjzOx7j5a+9ToKL84xJV9xcAp6Q8NlQR6POs0dHIYLKEu75/nP5b
 eqPMpqhSboKLQz6Jw8njJ76PzKcdMkoHkrnR6noT9zaupHuHlqjjoRZiUVZt3A==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763507855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yiVi0rh36drxwi21hFZJAr0KONLvnhhDTwyyQWZELSM=;
 b=ADjX+mqRd1iHfKmgyOc19ehS93MikhO5LMcZwUTNp8acSQE5EPfRVCCUu9kl7EMrJD+XQF
 SRS0bdU30eDLCERchMpp2L3RkxfPOY/+tpNqQxRsd6Yb8d5gyD954ETCOYJbJ19cBDGFBB
 UWTRJnsjPIEM2biTBepgD5F44z4TzW5mcUow3VLPhyV4JgYLjW/f50G0KlOtw9g0S60b+t
 ZKF1peYBZTyWz9cnzyX5r9oFjClIuGFyCPH1SlP5xop3YqoZTov23KmWiKo2HZ5+EhziCC
 06XGBKj6wME4nXHdCs06Yrf8KOwc4YLIoxXGZFKS0PdQz6KvE36exqoLKjAcfw==
To: u-boot@lists.denx.de
Date: Wed, 19 Nov 2025 00:17:23 +0100
Message-ID: <20251118231732.577952-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 0de87997018ed30639e
X-MBO-RS-META: axxofmqsssdzjpzwdup3xusxz4yrcs5p
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Add missing build of debug UART
	init code on DH STM32MP1 DHSOM
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

Commit c37a6684818d ("stm32mp: fix compilation issue with DEBUG_UART")
split the debug UART initialization code into two files, but failed to
update other non-ST boards. This did not lead to noticeable breakage
until debug UART is enabled, which is not the default. Update the
Makefile accordingly to allow debug UART to work.

Fixes: c37a6684818d ("stm32mp: fix compilation issue with DEBUG_UART")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 board/dhelectronics/dh_stm32mp1/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
index 2f4a301d1a0..429e01453bb 100644
--- a/board/dhelectronics/dh_stm32mp1/Makefile
+++ b/board/dhelectronics/dh_stm32mp1/Makefile
@@ -3,6 +3,8 @@
 # Copyright (C) 2018, STMicroelectronics - All Rights Reserved
 #
 
+obj-$(CONFIG_DEBUG_UART_BOARD_INIT) += ../../st/stm32mp1/debug_uart.o
+
 obj-$(CONFIG_PMIC_STPMIC1) += ../../st/common/stpmic1.o
 obj-y += board.o
 
-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
