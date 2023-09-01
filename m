Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E9F78F69F
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Sep 2023 03:14:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3671EC6A61A;
	Fri,  1 Sep 2023 01:14:16 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC18AC6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 01:14:14 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-79241bb5807so57997939f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 18:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693530853; x=1694135653;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oDtqdLZf1ehGok3vy0L5t9U1SOZfKIlsL1OfFu4aJfQ=;
 b=U8eLkQw5Mo1RrS+59Bc2lebTs35N/eNU0ntkWFeZVdZOm7YdjJSpjzOBUdRn+X5n80
 1Wq9pyW3nJirC02AtE8L3hisXXy2uEZeduij9AE0guaheeflJG7WzByMt7vasCnB9Xfy
 EumiW77Kfjghu5661nnNbiFKbo5XbAUsKxcHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693530853; x=1694135653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDtqdLZf1ehGok3vy0L5t9U1SOZfKIlsL1OfFu4aJfQ=;
 b=BQloY/52l85vVFjhNq5S7Um0+kNA/qhm2J07ZEedtKbimxclp/s7oWvUEfYbuRQocs
 Km3scKUN6u0MfYaN4ymqb2bY+Qs4upbbmQdGxH01El8CBWJfBsBV9F9hzSoi0A5bIF1o
 ZW+sJmRDKu5v/yRhkmkdRrO+15Kdn4kvcTeCvUQmS01riQWeXT3CPYu/q8DimecJLvYL
 nK8C/icTC7z07Z8C+qx2KSmwGHQlrVaITIQZfLogr5MrofM9qCHHUDgCHV4mRWXgyYKz
 zm3yPkZcH2b1O/SDkhDZ/YmeYObOwAwduG6rUUbRg6ZxlRLjtFtMQ/VJD/CpEhiUw39D
 ACww==
X-Gm-Message-State: AOJu0Yz5dWa0/14z7+vVaN/qTLLB0+GDak4aba5Ll+4FmHP0RQ25imSV
 BNGXKVXEkcFyt38DYnnjkTyhMI7qLH9sCBzuLQ4=
X-Google-Smtp-Source: AGHT+IFIBc5POf9+LxinBE69EOReQ/Ese7wh41IPd91pW4xa6QHC4uZO8kp2uuUY5i0XZBL5KzQDgQ==
X-Received: by 2002:a5e:aa03:0:b0:794:d9f6:e234 with SMTP id
 s3-20020a5eaa03000000b00794d9f6e234mr971147ioe.13.1693530853677; 
 Thu, 31 Aug 2023 18:14:13 -0700 (PDT)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 dk8-20020a0566384bc800b0042b279bb086sm712101jab.66.2023.08.31.18.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 18:14:13 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Thu, 31 Aug 2023 19:13:43 -0600
Message-ID: <20230901011357.2482203-6-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901011357.2482203-1-sjg@chromium.org>
References: <20230901011357.2482203-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Brandon Maier <brandon.maier@collins.com>,
 Kautuk Consul <kconsul@ventanamicro.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Sjoerd Simons <sjoerd@collabora.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Michal Simek <michal.simek@amd.com>
Subject: [Uboot-stm32] [PATCH v2 05/14] lmb: Rename LMB_MAX_REGIONS and
	LMB_USE_MAX_REGIONS
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

These are the number of areas within a region, so rename them.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Add new patch to rename LMB_MAX_REGIONS and LMB_USE_MAX_REGIONS

 configs/stm32mp13_defconfig         |  4 ++--
 configs/stm32mp15_basic_defconfig   |  4 ++--
 configs/stm32mp15_defconfig         |  4 ++--
 configs/stm32mp15_trusted_defconfig |  4 ++--
 include/lmb.h                       | 10 +++++-----
 lib/Kconfig                         |  6 +++---
 lib/lmb.c                           |  4 ++--
 7 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 82b62744f6db..98fcfeb5fa61 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -74,5 +74,5 @@ CONFIG_OPTEE=y
 # CONFIG_OPTEE_TA_AVB is not set
 CONFIG_ERRNO_STR=y
 # CONFIG_LMB_USE_MAX_REGIONS is not set
-CONFIG_LMB_MEMORY_REGIONS=2
-CONFIG_LMB_RESERVED_REGIONS=16
+CONFIG_LMB_MEMORY_AREAS=2
+CONFIG_LMB_RESERVED_AREAS=16
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 9ea5aaa7145a..7b5655d957d9 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -189,5 +189,5 @@ CONFIG_WDT_STM32MP=y
 # CONFIG_BINMAN_FDT is not set
 CONFIG_ERRNO_STR=y
 # CONFIG_LMB_USE_MAX_REGIONS is not set
-CONFIG_LMB_MEMORY_REGIONS=2
-CONFIG_LMB_RESERVED_REGIONS=16
+CONFIG_LMB_MEMORY_AREAS=2
+CONFIG_LMB_RESERVED_AREAS=16
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 4d0a81f8a871..643ec201c644 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -165,5 +165,5 @@ CONFIG_WDT_STM32MP=y
 # CONFIG_BINMAN_FDT is not set
 CONFIG_ERRNO_STR=y
 # CONFIG_LMB_USE_MAX_REGIONS is not set
-CONFIG_LMB_MEMORY_REGIONS=2
-CONFIG_LMB_RESERVED_REGIONS=16
+CONFIG_LMB_MEMORY_AREAS=2
+CONFIG_LMB_RESERVED_AREAS=16
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 0a7d8624858d..2a8162a870c5 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -165,5 +165,5 @@ CONFIG_WDT_STM32MP=y
 # CONFIG_BINMAN_FDT is not set
 CONFIG_ERRNO_STR=y
 # CONFIG_LMB_USE_MAX_REGIONS is not set
-CONFIG_LMB_MEMORY_REGIONS=2
-CONFIG_LMB_RESERVED_REGIONS=16
+CONFIG_LMB_MEMORY_AREAS=2
+CONFIG_LMB_RESERVED_AREAS=16
diff --git a/include/lmb.h b/include/lmb.h
index 92332eb63069..d963ac28d9ac 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -46,11 +46,11 @@ struct lmb_area {
  *
  * case 2. CONFIG_LMB_USE_MAX_REGIONS is not defined, the size of each
  *         region is configurated *independently* with
- *         => CONFIG_LMB_MEMORY_REGIONS: struct lmb.memory_regions
- *         => CONFIG_LMB_RESERVED_REGIONS: struct lmb.reserved_regions
+ *         => CONFIG_LMB_MEMORY_AREAS: struct lmb.memory_regions
+ *         => CONFIG_LMB_RESERVED_AREAS: struct lmb.reserved_regions
  *         lmb_region.region is only a pointer to the correct buffer,
  *         initialized in lmb_init(). This configuration is useful to manage
- *         more reserved memory regions with CONFIG_LMB_RESERVED_REGIONS.
+ *         more reserved memory regions with CONFIG_LMB_RESERVED_AREAS.
  */
 
 /**
@@ -87,8 +87,8 @@ struct lmb {
 	struct lmb_region memory;
 	struct lmb_region reserved;
 #if !IS_ENABLED(CONFIG_LMB_USE_MAX_REGIONS)
-	struct lmb_area memory_areas[CONFIG_LMB_MEMORY_REGIONS];
-	struct lmb_area reserved_areas[CONFIG_LMB_RESERVED_REGIONS];
+	struct lmb_area memory_areas[CONFIG_LMB_MEMORY_AREAS];
+	struct lmb_area reserved_areas[CONFIG_LMB_RESERVED_AREAS];
 #endif
 };
 
diff --git a/lib/Kconfig b/lib/Kconfig
index 42e559ad0b51..53f1332a8f83 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -1082,7 +1082,7 @@ config LMB_USE_MAX_REGIONS
 	  Define the number of supported memory regions in the library logical
 	  memory blocks.
 	  This feature allow to reduce the lmb library size by using compiler
-	  optimization when LMB_MEMORY_REGIONS == LMB_RESERVED_REGIONS.
+	  optimization when LMB_MEMORY_AREAS == LMB_RESERVED_AREAS.
 
 config LMB_MAX_REGIONS
 	int "Number of memory and reserved regions in lmb lib"
@@ -1092,7 +1092,7 @@ config LMB_MAX_REGIONS
 	  Define the number of supported regions, memory and reserved, in the
 	  library logical memory blocks.
 
-config LMB_MEMORY_REGIONS
+config LMB_MEMORY_AREAS
 	int "Number of memory regions in lmb lib"
 	depends on !LMB_USE_MAX_REGIONS
 	default 8
@@ -1101,7 +1101,7 @@ config LMB_MEMORY_REGIONS
 	  memory blocks.
 	  The minimal value is CONFIG_NR_DRAM_BANKS.
 
-config LMB_RESERVED_REGIONS
+config LMB_RESERVED_AREAS
 	int "Number of reserved regions in lmb lib"
 	depends on !LMB_USE_MAX_REGIONS
 	default 8
diff --git a/lib/lmb.c b/lib/lmb.c
index 2669868f0dda..f4321d10118b 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -111,8 +111,8 @@ void lmb_init(struct lmb *lmb)
 	lmb->memory.max = CONFIG_LMB_MAX_REGIONS;
 	lmb->reserved.max = CONFIG_LMB_MAX_REGIONS;
 #else
-	lmb->memory.max = CONFIG_LMB_MEMORY_REGIONS;
-	lmb->reserved.max = CONFIG_LMB_RESERVED_REGIONS;
+	lmb->memory.max = CONFIG_LMB_MEMORY_AREAS;
+	lmb->reserved.max = CONFIG_LMB_RESERVED_AREAS;
 	lmb->memory.area = lmb->memory_areas;
 	lmb->reserved.area = lmb->reserved_areas;
 #endif
-- 
2.42.0.283.g2d96d420d3-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
