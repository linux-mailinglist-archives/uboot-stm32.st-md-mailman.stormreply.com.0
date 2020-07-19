Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 072D82252C6
	for <lists+uboot-stm32@lfdr.de>; Sun, 19 Jul 2020 18:16:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4D24C36B29
	for <lists+uboot-stm32@lfdr.de>; Sun, 19 Jul 2020 16:16:44 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C306DC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jul 2020 16:16:43 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id q74so15210884iod.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jul 2020 09:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uXdr1zvmQRcM+JMlvmwnC82o1Qat0kvfG9TEgke6SUo=;
 b=nmPxUh9vansr/LE8G5pFqeBn96xB/SIywHQBLIFVU0CdvtEWVFQj3y45R+cvPloydm
 D9spipYfidfwjyM/56PmIP272ZTUMyJqi3HUgQwp+cSfNoLXzko05W5xaVp9kJz6j+4i
 xj25k/Ce9gC0TU0zB/QtHeJkipppMhqFMxsCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uXdr1zvmQRcM+JMlvmwnC82o1Qat0kvfG9TEgke6SUo=;
 b=elpYyu4W3SV1dv4b35S9d5QKYVX4JLCXunoUazEpJKRfmA+EsOiDZkR9UoQiDDQsNa
 GZV2TC7jvbsS96hYujrEs3dbAA+FpU8Zj2G0tKJ9yzQjUxUa0jlCLaTe4kqk/qZ6fo+t
 LY/u0xHKsjV6Z3ixpAPt8kLdFi4Zykn3/D0hVMjjlBeL/RDr/tgs541qZv5mjJEQuV8d
 NyNT2/co9/C293vTBlFzLM9iK7dBcP3ruikNG90ykU8iXeHdzdgKJz7kb7UJQMEjwJRp
 InR9VT8kvv3soSsFgfq7PmaEnRmBdiPjp7COESNdjtnA/Q47VEUM2B38QoXveklj8kio
 nUVA==
X-Gm-Message-State: AOAM530bT0f+vwuuQSB+pnazyOJtsdlsHGSDAm40rg1OOJZHMSljwBdg
 HATs0iS9+Bg+T1lEiYhUmTh/AvFxHfR1sw==
X-Google-Smtp-Source: ABdhPJyrJ2RT8xFfynanxLkOGeHfeFdf1xHorxkO9X51vSUva49sa7xknJnuL2bqLfWrArJsjAFYyw==
X-Received: by 2002:a5e:9b0e:: with SMTP id j14mr19153803iok.169.1595175402713; 
 Sun, 19 Jul 2020 09:16:42 -0700 (PDT)
Received: from localhost.localdomain (c-73-14-175-90.hsd1.co.comcast.net.
 [73.14.175.90])
 by smtp.gmail.com with ESMTPSA id c3sm7415632ilj.31.2020.07.19.09.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 09:16:42 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun, 19 Jul 2020 10:15:52 -0600
Message-Id: <20200719161601.495421-23-sjg@chromium.org>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
In-Reply-To: <20200719161601.495421-1-sjg@chromium.org>
References: <20200719161601.495421-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 22/31] adc: Drop dm.h header file
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
index 31bbb6f9d6..f20c46fb36 100644
--- a/drivers/adc/stm32-adc-core.c
+++ b/drivers/adc/stm32-adc-core.c
@@ -7,6 +7,7 @@
  */
 
 #include <common.h>
+#include <dm.h>
 #include <asm/io.h>
 #include <dm/device_compat.h>
 #include <linux/bitops.h>
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
index b12f894a9b..3f0ed48846 100644
--- a/drivers/adc/stm32-adc.c
+++ b/drivers/adc/stm32-adc.c
@@ -8,6 +8,7 @@
 
 #include <common.h>
 #include <adc.h>
+#include <dm.h>
 #include <asm/io.h>
 #include <dm/device_compat.h>
 #include <linux/bitops.h>
-- 
2.28.0.rc0.105.gf9edc3c819-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
