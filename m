Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED00E2252C4
	for <lists+uboot-stm32@lfdr.de>; Sun, 19 Jul 2020 18:16:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4093C36B29
	for <lists+uboot-stm32@lfdr.de>; Sun, 19 Jul 2020 16:16:26 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E74B3C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jul 2020 16:16:24 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id v6so15163323iob.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jul 2020 09:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M9O+8ovzwWkVPrRIiaGYfmrY/QrI1AA6KjZBqSfQe6I=;
 b=f9rjBMfGJ5QJS+8GUiLKB4fMnbvMAsARFjQsBm+77ZvVzr09bfAOekNhauC3blpvcp
 Fa2jcgouBlWyivE3kSl0pFjY5dM9/cSuF8vh2+PKY6khuYPS2wmim3cix4RWNJFrPHeE
 PqLjF99aFdRzJTpK/YzurGquBcq269ZZlnvdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M9O+8ovzwWkVPrRIiaGYfmrY/QrI1AA6KjZBqSfQe6I=;
 b=V2xM/S17rmUDab6b29pjSZetMUdbStRGkskx1AapV5F+Eb5CxvVEhSIAj4+A5ciTNg
 wRMaRRYpLy/SwR1Eqaw/P7Rvdge8zZL6OzYK9l/NddkfjM887qI6YBB0TRQyRjfMyOdO
 iGoH4tZ/dsBsgl+aCWziugeaSaHcAKHn8XewnuS6w+ktpFtpBDRUnNwbtPbDsSff+l54
 GsKNz9AsxgT7H1NOMY7WjCjOOl1UXoojXKjBAac4hIGTGtKIrW2zUuk2h7tiyVdjpdvb
 5GlROBducITEyEUK+z4iSWWcmPk8wR2UyJktyiAIOyYhTb7MsjifBMAL+GtiMIK+TWB9
 1ExQ==
X-Gm-Message-State: AOAM5311XqldT7a/QR7kXctICfdCZBU3G3mq7N6q+WKfBbioNuE7Teps
 qDwymYBDFkTirPfFCiO0QVpQCQ==
X-Google-Smtp-Source: ABdhPJxBo6QJimw2+PEYZ3oUo64E40qTbIvR6Y1A15OgziH9CKwmNH5XcaOT0ff88SuTkHkbloRsvA==
X-Received: by 2002:a05:6602:1611:: with SMTP id
 x17mr12354942iow.32.1595175383770; 
 Sun, 19 Jul 2020 09:16:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-14-175-90.hsd1.co.comcast.net.
 [73.14.175.90])
 by smtp.gmail.com with ESMTPSA id c3sm7415632ilj.31.2020.07.19.09.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 09:16:23 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun, 19 Jul 2020 10:15:34 -0600
Message-Id: <20200719161601.495421-5-sjg@chromium.org>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
In-Reply-To: <20200719161601.495421-1-sjg@chromium.org>
References: <20200719161601.495421-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 04/31] mtd: spi-mem: Drop dm.h header file
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

This header file should not be included in other header files. Remove it
and use a forward declaration instead.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 drivers/spi/spi-mem.c    | 7 ++++++-
 drivers/spi/spi-sifive.c | 1 +
 drivers/spi/stm32_qspi.c | 2 ++
 include/spi-mem.h        | 5 +----
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index d344701aeb..c095ae9505 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -13,9 +13,14 @@
 #include <linux/pm_runtime.h>
 #include "internals.h"
 #else
-#include <dm/device_compat.h>
+#include <common.h>
+#include <dm.h>
+#include <errno.h>
+#include <malloc.h>
+#include <spi.h>
 #include <spi.h>
 #include <spi-mem.h>
+#include <dm/device_compat.h>
 #endif
 
 #ifndef __UBOOT__
diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index 0e0ce25abb..c7345d9042 100644
--- a/drivers/spi/spi-sifive.c
+++ b/drivers/spi/spi-sifive.c
@@ -10,6 +10,7 @@
 #include <dm.h>
 #include <dm/device_compat.h>
 #include <malloc.h>
+#include <spi.h>
 #include <spi-mem.h>
 #include <wait_bit.h>
 #include <asm/io.h>
diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
index 001f0703e3..a53b941410 100644
--- a/drivers/spi/stm32_qspi.c
+++ b/drivers/spi/stm32_qspi.c
@@ -9,8 +9,10 @@
 
 #include <common.h>
 #include <clk.h>
+#include <dm.h>
 #include <log.h>
 #include <reset.h>
+#include <spi.h>
 #include <spi-mem.h>
 #include <dm/device_compat.h>
 #include <linux/bitops.h>
diff --git a/include/spi-mem.h b/include/spi-mem.h
index 893f7bd733..ca0f55c8fd 100644
--- a/include/spi-mem.h
+++ b/include/spi-mem.h
@@ -11,10 +11,7 @@
 #ifndef __UBOOT_SPI_MEM_H
 #define __UBOOT_SPI_MEM_H
 
-#include <common.h>
-#include <dm.h>
-#include <errno.h>
-#include <spi.h>
+struct udevice;
 
 #define SPI_MEM_OP_CMD(__opcode, __buswidth)			\
 	{							\
-- 
2.28.0.rc0.105.gf9edc3c819-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
