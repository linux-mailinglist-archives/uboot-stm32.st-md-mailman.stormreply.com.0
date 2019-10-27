Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9E0E63D6
	for <lists+uboot-stm32@lfdr.de>; Sun, 27 Oct 2019 16:55:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFBCCC36B0A
	for <lists+uboot-stm32@lfdr.de>; Sun, 27 Oct 2019 15:55:29 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DC22C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Oct 2019 15:55:28 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id q1so7756345ion.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Oct 2019 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dicecm7+4fu8xeOyPARsm2XTm8EEK6mjhQw//W8q96o=;
 b=TagF1I9TwGrTiPd/b+WeJrUNiHPyJa9EaytnqBCrTKmuPf80QtKSi0feTy/OUIWVDr
 GBJRqE21Kb0e9EyMYV9abIWhgkzNPxQ/qA8OFyvjqLR/NXRsGn2lYGLL6NizjCWTX3Wy
 n6XmtAXOv7Ubyh89FK6ydI6fzkCFRsSdnuV/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dicecm7+4fu8xeOyPARsm2XTm8EEK6mjhQw//W8q96o=;
 b=Dg0C7ioPbo0JfUnlO/5sPiVlhDH9pD68AA5b+yqalac+G1sgV8AfPPvmLYozCuQ3b8
 4cRklWaGNnLKWXhq2iuoBIikwmsslj3vYGO0sdBLmKxWH7ONISmYtmETyuKo2tbRuMZr
 iv4n7EqhUBzwaarV0Jom9Aeac8VenKUrDRu2jaGPuLgG7Gcgankvgi1nj/3kKSYZtKQk
 V+gjsnAoDJCDTz6zK+n9Cn3ZqJDsPU68FV/kuRZJNhZIJn9io0xAipkVE8tualspW0N6
 ixJpYbbaSc4rFuhOQkThUsUuIBaKMSjbvzjy4MhVqwBlwx7Muen6oHQcrW0uYY/rPf8F
 q0SQ==
X-Gm-Message-State: APjAAAUsNLsqHaCdBiFoSEC62qDUyUOLlvYf0mjzJjzE9bDuxhTLbvVH
 xEnnxCxIpUnrLeQ2meJCuisHDw==
X-Google-Smtp-Source: APXvYqyo48wGOUmFODpfphvUAKjaCm7luBjAcmqOaXHwqFtHb0VAh+ltVtqWsSBki/vWkcgFX8MMkQ==
X-Received: by 2002:a6b:cf13:: with SMTP id o19mr12817142ioa.182.1572191727291; 
 Sun, 27 Oct 2019 08:55:27 -0700 (PDT)
Received: from kiwi.bld.corp.google.com ([2620:15c:183:0:8223:87c:a681:66aa])
 by smtp.gmail.com with ESMTPSA id
 n3sm1215070ilm.8.2019.10.27.08.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 08:55:26 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun, 27 Oct 2019 09:54:06 -0600
Message-Id: <20191027155410.187957-26-sjg@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191027155410.187957-1-sjg@chromium.org>
References: <20191027155410.187957-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 26/30] adc: Drop dm.h header file
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

Drop the common.h inclusion also.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 drivers/adc/stm32-adc-core.c | 1 +
 drivers/adc/stm32-adc-core.h | 4 ++--
 drivers/adc/stm32-adc.c      | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/adc/stm32-adc-core.c b/drivers/adc/stm32-adc-core.c
index 04b6a8a2f5..d61c23b91a 100644
--- a/drivers/adc/stm32-adc-core.c
+++ b/drivers/adc/stm32-adc-core.c
@@ -7,6 +7,7 @@
  */
 
 #include <common.h>
+#include <dm.h>
 #include <asm/io.h>
 #include <power/regulator.h>
 #include "stm32-adc-core.h"
diff --git a/drivers/adc/stm32-adc-core.h b/drivers/adc/stm32-adc-core.h
index ba0e10e6cc..05968dbcc8 100644
--- a/drivers/adc/stm32-adc-core.h
+++ b/drivers/adc/stm32-adc-core.h
@@ -26,9 +26,9 @@
 #define STM32_ADC_MAX_ADCS		3
 #define STM32_ADCX_COMN_OFFSET		0x300
 
-#include <common.h>
 #include <clk.h>
-#include <dm.h>
+
+struct udevice;
 
 /**
  * struct stm32_adc_common - stm32 ADC driver common data (for all instances)
diff --git a/drivers/adc/stm32-adc.c b/drivers/adc/stm32-adc.c
index 029338e4af..c928980e1d 100644
--- a/drivers/adc/stm32-adc.c
+++ b/drivers/adc/stm32-adc.c
@@ -8,6 +8,7 @@
 
 #include <common.h>
 #include <adc.h>
+#include <dm.h>
 #include <asm/io.h>
 #include <linux/iopoll.h>
 #include "stm32-adc-core.h"
-- 
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
