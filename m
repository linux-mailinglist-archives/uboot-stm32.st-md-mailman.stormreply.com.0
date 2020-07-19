Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BCB2252C5
	for <lists+uboot-stm32@lfdr.de>; Sun, 19 Jul 2020 18:16:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB7ABC36B29
	for <lists+uboot-stm32@lfdr.de>; Sun, 19 Jul 2020 16:16:32 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 322ABC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jul 2020 16:16:32 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id i4so15115789iov.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jul 2020 09:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+EHkv3LvXJjJkYFDByQLoeH3vENtFlRkon6/9Ml+WKo=;
 b=PxXzMmlFY1nTHFgf03BkcwpUsElxUxBUJngscrJDsULmAx5/TNbB+jG8fWGf84KI0C
 DxxYA7e0c8aFIDYQL/Lbk/OeSVv1t6EQJDVxPw43dAGFXzvwWPX9IY6B84QTerWeqXAI
 PKYZ4smAIF88RAJa/P5q0+NQeADWOYlfh6y9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+EHkv3LvXJjJkYFDByQLoeH3vENtFlRkon6/9Ml+WKo=;
 b=fzCC026WTxJJVdYb/QnJOmVaHwOQf3OlaHaEYrBmb8whf6fjGHqpFoyWhNTtnkFPK5
 51x4vQ+zmXHWAoXoYcnvBmhLMs3IALsyOcPJPUnnauChEVeww9m6tbsQKh0PSy6yr1Gy
 xWMbCAcAO1WFCF8uW2kboYTPYTBaHe05yrXs4sf59Tk6900weKqW6tTjGcO4J7QExRJn
 I5mxiJ+xUG5IHT5Co9mICTTq+p4P6YecYDbH1tLIPIvDNz2xRAF50oD6eamegJ9OSeCY
 FaMT0rI1K4keJlgYdgpLoGylt4QsfpdnC+GeNmTvDJL7mfMhQ+XRdnnYFE0O2xhlex4K
 nn9w==
X-Gm-Message-State: AOAM531NKC57SFLtnSEYgv4PgbNl1p+v1jyB4XmJE3PAPIqHmkjsVDvB
 bCGxB4Vxg87KQfw+gFLt3norFQ==
X-Google-Smtp-Source: ABdhPJy4kdSbtMkfIogc2+jNJPjVq48a5JTXPoRRaSrDOH/BWT+k3W9DwKOEDdo7k/jk3g0A65Carg==
X-Received: by 2002:a05:6638:1504:: with SMTP id
 b4mr18577650jat.23.1595175391081; 
 Sun, 19 Jul 2020 09:16:31 -0700 (PDT)
Received: from localhost.localdomain (c-73-14-175-90.hsd1.co.comcast.net.
 [73.14.175.90])
 by smtp.gmail.com with ESMTPSA id c3sm7415632ilj.31.2020.07.19.09.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 09:16:30 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun, 19 Jul 2020 10:15:40 -0600
Message-Id: <20200719161601.495421-11-sjg@chromium.org>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
In-Reply-To: <20200719161601.495421-1-sjg@chromium.org>
References: <20200719161601.495421-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Mike Frysinger <vapier@gentoo.org>,
 Vignesh R <vigneshr@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 10/31] sf: Drop dm.h header file from
	spi_flash.h
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

 arch/arm/mach-k3/sysfw-loader.c                        | 1 +
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c | 1 +
 arch/x86/cpu/ivybridge/sdram.c                         | 1 +
 board/st/common/stm32mp_dfu.c                          | 1 +
 include/spi_flash.h                                    | 3 ++-
 5 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-k3/sysfw-loader.c b/arch/arm/mach-k3/sysfw-loader.c
index 513be09c68..96be069ee8 100644
--- a/arch/arm/mach-k3/sysfw-loader.c
+++ b/arch/arm/mach-k3/sysfw-loader.c
@@ -7,6 +7,7 @@
  */
 
 #include <common.h>
+#include <dm.h>
 #include <image.h>
 #include <log.h>
 #include <spl.h>
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
index 70940f01f3..8aad4be467 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <console.h>
+#include <dm.h>
 #include <dfu.h>
 #include <malloc.h>
 #include <serial.h>
diff --git a/arch/x86/cpu/ivybridge/sdram.c b/arch/x86/cpu/ivybridge/sdram.c
index 99bc48021e..dd6b8753de 100644
--- a/arch/x86/cpu/ivybridge/sdram.c
+++ b/arch/x86/cpu/ivybridge/sdram.c
@@ -10,6 +10,7 @@
  */
 
 #include <common.h>
+#include <dm.h>
 #include <errno.h>
 #include <fdtdec.h>
 #include <init.h>
diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
index 0cda9196f9..38eb0f27c9 100644
--- a/board/st/common/stm32mp_dfu.c
+++ b/board/st/common/stm32mp_dfu.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <blk.h>
+#include <dm.h>
 #include <dfu.h>
 #include <env.h>
 #include <memalign.h>
diff --git a/include/spi_flash.h b/include/spi_flash.h
index b336619487..85cae32cc7 100644
--- a/include/spi_flash.h
+++ b/include/spi_flash.h
@@ -9,10 +9,11 @@
 #ifndef _SPI_FLASH_H_
 #define _SPI_FLASH_H_
 
-#include <dm.h>	/* Because we dereference struct udevice here */
 #include <linux/types.h>
 #include <linux/mtd/spi-nor.h>
 
+struct udevice;
+
 /* by default ENV use the same parameters than SF command */
 #ifndef CONFIG_ENV_SPI_BUS
 # define CONFIG_ENV_SPI_BUS	CONFIG_SF_DEFAULT_BUS
-- 
2.28.0.rc0.105.gf9edc3c819-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
