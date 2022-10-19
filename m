Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97013604317
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Oct 2022 13:25:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6297FC64101;
	Wed, 19 Oct 2022 11:25:13 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A9EFC63326
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 11:25:11 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id y17so8976217ilq.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 04:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dbLUijRxE43sc13hEA7Zmzk8NlGLuhvlz2lDe4dsIMg=;
 b=B7WSLzHThXZrzmnUQ1Y45JMhiZxRIbgC/9vZU97E+HIS0VPyUH+A9G/46VVIgBCK10
 W7XcY2DkiccVthBHez6S3eHC/DZlgIV/XEHEDOkzIZNlqF2ydosUitXHzQkdtRvmzFVC
 J1NkaDXHuPIGG4+Z7fztgYvOYF3PZJlL3bOHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dbLUijRxE43sc13hEA7Zmzk8NlGLuhvlz2lDe4dsIMg=;
 b=x5fRyjYDkM4EESsO5qdX35wb3b2KH0vUgj+REyto6ma9SwU11GJblF2lgLfnq5Btt9
 WE5STff+fNDOQxA3CoJOkRaAGjz7uvBUC5El+0vmnwtlWYvpNr6uTuRaC8XgIHc1GsAi
 ep/5niadNX8D0xx6bSP6EpvftKAHHu38bD7oGwNAH38FnpZfGrCVEwRaDywRMrmeLAIp
 UJQMu+J9Q2WDyW8UpxCvWZK7qeIYMxevwBUbEOMgTa0hmZ4GmnYSn2gzGptaLS5IDe6A
 xS7TeQGNIU6JJekrDRaW8529JbzF91l/J7AvWPrJQuqIfqoZAuM2612/uUw6TsBqMdJn
 IpYg==
X-Gm-Message-State: ACrzQf2FXOEEevS0F0s1yY+VToahKMpDXmIoXjtcNk3wn/ncje5zMO33
 w3YVkZXFE9BbletO9NwO3WiVCw==
X-Google-Smtp-Source: AMsMyM7v/LVGyFtGwL/k2DRnQgQN8P7sSoyRxLeYthfGA5a9rLD9JCjM390KNIe5yJ7Mi3R2KOwdIw==
X-Received: by 2002:a05:6e02:1563:b0:2fc:76f1:6c25 with SMTP id
 k3-20020a056e02156300b002fc76f16c25mr5154987ilu.62.1666178710928; 
 Wed, 19 Oct 2022 04:25:10 -0700 (PDT)
Received: from sjg1.roam.corp.google.com
 (c-67-190-102-125.hsd1.co.comcast.net. [67.190.102.125])
 by smtp.gmail.com with ESMTPSA id
 g34-20020a022722000000b003634aa4a55asm2041156jaa.82.2022.10.19.04.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 04:25:10 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Wed, 19 Oct 2022 05:23:51 -0600
Message-Id: <20221019112356.1042065-35-sjg@chromium.org>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221019112356.1042065-1-sjg@chromium.org>
References: <20221019112356.1042065-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Anatolij Gustschin <agust@denx.de>, Vikas Manocha <vikas.manocha@st.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Artem Lapkin <email2tema@gmail.com>,
 Zhaofeng Li <hello@zhaofeng.li>, uboot-stm32@st-md-mailman.stormreply.com,
 Matthias Brugger <mbrugger@suse.com>, Ramon Fried <rfried.dev@gmail.com>,
 Andrew Scull <ascull@google.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 Simon Glass <sjg@chromium.org>, Tom Warren <twarren@nvidia.com>
Subject: [Uboot-stm32] [PATCH 34/39] video: Drop use of the lcd header file
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

This file is being removed so drop remaining references to it.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 board/aristainetos/aristainetos.c          | 4 +++-
 board/l+g/vinco/vinco.c                    | 1 -
 board/nvidia/harmony/harmony.c             | 1 -
 board/raspberrypi/rpi/rpi.c                | 1 -
 board/st/stm32f746-disco/stm32f746-disco.c | 1 -
 boot/pxe_utils.c                           | 1 -
 common/splash.c                            | 5 ++---
 drivers/serial/sandbox.c                   | 1 -
 8 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/board/aristainetos/aristainetos.c b/board/aristainetos/aristainetos.c
index 514cb60d5ba..770f3d7d0d5 100644
--- a/board/aristainetos/aristainetos.c
+++ b/board/aristainetos/aristainetos.c
@@ -9,6 +9,8 @@
  * Author: Fabio Estevam <fabio.estevam@freescale.com>
  */
 
+#include <common.h>
+#include <bmp_layout.h>
 #include <command.h>
 #include <image.h>
 #include <init.h>
@@ -33,12 +35,12 @@
 #include <i2c.h>
 #include <micrel.h>
 #include <miiphy.h>
-#include <lcd.h>
 #include <led.h>
 #include <power/pmic.h>
 #include <power/regulator.h>
 #include <power/da9063_pmic.h>
 #include <splash.h>
+#include <video.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
diff --git a/board/l+g/vinco/vinco.c b/board/l+g/vinco/vinco.c
index db1075a594a..d47c7b5f1eb 100644
--- a/board/l+g/vinco/vinco.c
+++ b/board/l+g/vinco/vinco.c
@@ -24,7 +24,6 @@
 #include <asm/arch/sama5d4.h>
 #include <atmel_hlcdc.h>
 #include <atmel_mci.h>
-#include <lcd.h>
 #include <mmc.h>
 #include <net.h>
 #include <netdev.h>
diff --git a/board/nvidia/harmony/harmony.c b/board/nvidia/harmony/harmony.c
index dd56a39cafb..52236792e24 100644
--- a/board/nvidia/harmony/harmony.c
+++ b/board/nvidia/harmony/harmony.c
@@ -5,7 +5,6 @@
  */
 
 #include <common.h>
-#include <lcd.h>
 #include <asm/io.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/funcmux.h>
diff --git a/board/raspberrypi/rpi/rpi.c b/board/raspberrypi/rpi/rpi.c
index 00afb352bd1..8603c93de77 100644
--- a/board/raspberrypi/rpi/rpi.c
+++ b/board/raspberrypi/rpi/rpi.c
@@ -11,7 +11,6 @@
 #include <fdt_support.h>
 #include <fdt_simplefb.h>
 #include <init.h>
-#include <lcd.h>
 #include <memalign.h>
 #include <mmc.h>
 #include <asm/gpio.h>
diff --git a/board/st/stm32f746-disco/stm32f746-disco.c b/board/st/stm32f746-disco/stm32f746-disco.c
index 2ab23f2f4f7..4cfb29ef428 100644
--- a/board/st/stm32f746-disco/stm32f746-disco.c
+++ b/board/st/stm32f746-disco/stm32f746-disco.c
@@ -7,7 +7,6 @@
 #include <common.h>
 #include <dm.h>
 #include <init.h>
-#include <lcd.h>
 #include <log.h>
 #include <miiphy.h>
 #include <phy_interface.h>
diff --git a/boot/pxe_utils.c b/boot/pxe_utils.c
index d5c215ae2c1..3fdd14d1cdb 100644
--- a/boot/pxe_utils.c
+++ b/boot/pxe_utils.c
@@ -12,7 +12,6 @@
 #include <log.h>
 #include <malloc.h>
 #include <mapmem.h>
-#include <lcd.h>
 #include <net.h>
 #include <fdt_support.h>
 #include <video.h>
diff --git a/common/splash.c b/common/splash.c
index 0e520cc1030..f31ab4fe1d7 100644
--- a/common/splash.c
+++ b/common/splash.c
@@ -24,7 +24,7 @@
 #include <display_options.h>
 #include <env.h>
 #include <splash.h>
-#include <lcd.h>
+#include <video.h>
 
 static struct splash_location default_splash_locations[] = {
 	{
@@ -149,8 +149,7 @@ void splash_display_banner(void)
 
 /*
  * Common function to show a splash image if env("splashimage") is set.
- * Is used for both dm_video and lcd video stacks. For additional
- * details please refer to doc/README.splashprepare.
+ * For additional details please refer to doc/README.splashprepare.
  */
 #if defined(CONFIG_SPLASH_SCREEN) && defined(CONFIG_CMD_BMP)
 int splash_display(void)
diff --git a/drivers/serial/sandbox.c b/drivers/serial/sandbox.c
index 13b54921c41..f122e3f7c36 100644
--- a/drivers/serial/sandbox.c
+++ b/drivers/serial/sandbox.c
@@ -12,7 +12,6 @@
 #include <common.h>
 #include <console.h>
 #include <dm.h>
-#include <lcd.h>
 #include <os.h>
 #include <serial.h>
 #include <video.h>
-- 
2.38.0.413.g74048e4d9e-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
