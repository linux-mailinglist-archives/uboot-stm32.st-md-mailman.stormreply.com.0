Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CADAED1DF
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jun 2025 02:09:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BEB4C349C6;
	Mon, 30 Jun 2025 00:09:37 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D798C349C5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 00:09:36 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bVmk76DKNz9sdB;
 Mon, 30 Jun 2025 02:09:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751242175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=p16fxjxT+2U/aJ+p9YfeSixyrTPx9A2Spmr/uY1YwMk=;
 b=cLEzb9Lv1GVxD+JgjQTnXLi+G52kk78DjJndQohTUYSQhAPD9JiRLhTTHvbUqiZv2NIsOl
 OqN2sxYEezk4r6HyxAcVcVovhLYnpdvvdv9jdMftwQUguSBgvGDrtVL1n0Rzuqs607/1MB
 NCAbpQlsRlASKOaytwv+xPB4nwX18XWXQZSmGofuJ0EqoA5IyGGzomF43GQbVTy729T4vz
 Nz9weE4lM/NInzeTqydSGWv8JYRBbzod66XX4VR5hLXfdjsCDDX0y66hzHmAmLHiEUFM1d
 s5Wx8KNXRspsdlUbJWy/KP7prKCs6nPpPZZJkHZQEfzbKcVqaIaZO+7B1Zfdbg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751242174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=p16fxjxT+2U/aJ+p9YfeSixyrTPx9A2Spmr/uY1YwMk=;
 b=lPcndAU47jw0YxIwaooynROfhYNfgdvEFBznCZDl9QcTs5DxbLelFme4s6WkWSfp5UOTRK
 7hJMvsRoyRNXGUbLTaHW35fJKihQm7Lwr2mjZVcM54CwGwshU+E82djBQxmT5wwvTMwzOj
 zx4d7p6wFFKIhsfBPHqwfWQII4++g4S8uoUknVWYPCSHOsjePrQQTB5N1x10RlteB/Hqxy
 Ymn5T5Rt4S3A8Nbh5UZzPn2QLZDh6lRmPzj1LtBcqyjAMnrqBuKxH6cJyVJRqHVq+0Ypbh
 /XGo37NcIobYQdoPT3u+xuuL7lPGKQ/o0nhcNincp7h6Zug+urWtpTOEM2wYIQ==
To: u-boot@lists.denx.de
Date: Mon, 30 Jun 2025 02:09:07 +0200
Message-ID: <20250630000926.952277-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: 4xyjssudkwunqdfgow4wa4y151ib8xqq
X-MBO-RS-ID: 613336a11d33d5e10f6
X-Rspamd-Queue-Id: 4bVmk76DKNz9sdB
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Simon Glass <sjg@chromium.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] reset: stm32: Fix header misuse
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

The stm32-reset-core.h is located in drivers/reset/stm32/ , it has to
be included using "stm32-reset-core.h" and not <stm32-reset-core.h> ,
otherwise the build fails. Fix it.

Fixes: 0994a627c278 ("reset: stm32mp25: add stm32mp25 reset driver")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 MAINTAINERS                            | 1 -
 drivers/reset/stm32/stm32-reset-core.c | 2 +-
 drivers/reset/stm32/stm32-reset-mp1.c  | 2 +-
 drivers/reset/stm32/stm32-reset-mp25.c | 2 +-
 drivers/reset/stm32/stm32-reset.c      | 2 +-
 5 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 92119667618..da16816e51c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -730,7 +730,6 @@ F:	include/dt-bindings/clock/stm32fx-clock.h
 F:	include/dt-bindings/clock/stm32mp*
 F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
 F:	include/dt-bindings/reset/stm32mp*
-F:	include/stm32-reset-core.h
 F:	include/stm32_rcc.h
 F:	tools/logos/st.bmp
 F:	tools/stm32image.c
diff --git a/drivers/reset/stm32/stm32-reset-core.c b/drivers/reset/stm32/stm32-reset-core.c
index 7dd92e07e1a..9eeed6536e0 100644
--- a/drivers/reset/stm32/stm32-reset-core.c
+++ b/drivers/reset/stm32/stm32-reset-core.c
@@ -6,7 +6,7 @@
 
 #include <dm.h>
 #include <reset-uclass.h>
-#include <stm32-reset-core.h>
+#include "stm32-reset-core.h"
 #include <stm32_rcc.h>
 #include <dm/device_compat.h>
 #include <linux/iopoll.h>
diff --git a/drivers/reset/stm32/stm32-reset-mp1.c b/drivers/reset/stm32/stm32-reset-mp1.c
index 6863f6e64b7..ce4532561e5 100644
--- a/drivers/reset/stm32/stm32-reset-mp1.c
+++ b/drivers/reset/stm32/stm32-reset-mp1.c
@@ -5,7 +5,7 @@
  */
 
 #include <dm.h>
-#include <stm32-reset-core.h>
+#include "stm32-reset-core.h"
 
 /* Reset clear offset for STM32MP RCC */
 #define RCC_CLR_OFFSET			0x4
diff --git a/drivers/reset/stm32/stm32-reset-mp25.c b/drivers/reset/stm32/stm32-reset-mp25.c
index 91c0336bc58..1cbe5c7f3d5 100644
--- a/drivers/reset/stm32/stm32-reset-mp25.c
+++ b/drivers/reset/stm32/stm32-reset-mp25.c
@@ -5,7 +5,7 @@
  */
 
 #include <dm.h>
-#include <stm32-reset-core.h>
+#include "stm32-reset-core.h"
 #include <stm32mp25_rcc.h>
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
 
diff --git a/drivers/reset/stm32/stm32-reset.c b/drivers/reset/stm32/stm32-reset.c
index 975f67f712a..918e81e588f 100644
--- a/drivers/reset/stm32/stm32-reset.c
+++ b/drivers/reset/stm32/stm32-reset.c
@@ -5,7 +5,7 @@
  */
 
 #include <dm.h>
-#include <stm32-reset-core.h>
+#include "stm32-reset-core.h"
 
 /* Timeout for deassert */
 #define STM32_DEASSERT_TIMEOUT_US	10000
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
