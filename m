Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FFFE63D5
	for <lists+uboot-stm32@lfdr.de>; Sun, 27 Oct 2019 16:54:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABE21C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sun, 27 Oct 2019 15:54:50 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00BECC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Oct 2019 15:54:47 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id w12so7684666iol.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Oct 2019 08:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JR4zO8IYUKiuWg90QawCmaS5NAtT734px/58MnBIV8s=;
 b=iGesvudf0NwwYwixRAjY7C3CHGTYhf2gr/ynTSh8nbneX1G4rFeQKpYRvgHf3SklTi
 ER41abxDmhGTyZem4Gulj+JQut9jWZ7p+uGoXsIt9Zs5viHt9J0Ch4DaCsJm3kf2EMJp
 RC7FUD0J3ejd+visYmIV9yPRRN6BP2mEq8HCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JR4zO8IYUKiuWg90QawCmaS5NAtT734px/58MnBIV8s=;
 b=R2JzoVXAPM11kNczZgbmITgCCwoQww+DS9PoL95r6zVoCCJRzKeOqIScyEOsV6F95H
 l/sWszgzWtefuu2VgxKlzJOUj+epymPuFJlSwjKorn2j68IpZs/1r7xPiJrVjc4tXnlv
 zaPLiRhHtzrN3uLsm7w9zM6Ud/5obZ+600Qkp4yaQydXthDrOchcZ7rdNf6heqXuURy7
 K0IrtKxlNdMH92sf35K7qd7dPWigIWApcHOh4LO/zHKudSlZPfOgnyl7S+7L7oJWYqIf
 +j+5TYLaMUuJcpTWX50bG2C8Is3No2PwKJDANur7hs/duzcJWs8QlynUAbTTjlUZBqXB
 ClMA==
X-Gm-Message-State: APjAAAURKWj7tMvtm+KVIsdLGx0cgMrUyscQEi7f7ZLRmUgzfYHMT91+
 NHheOkI4zt7+OTKeci0xDZNc5w==
X-Google-Smtp-Source: APXvYqyDL36rKAiEK5KSAEh+UbJRTIhAtos61paxV8QdANfCqkhjYjDGCvrRfhDjv0hpoOAeBd4I3w==
X-Received: by 2002:a02:c98c:: with SMTP id b12mr13350598jap.40.1572191686521; 
 Sun, 27 Oct 2019 08:54:46 -0700 (PDT)
Received: from kiwi.bld.corp.google.com ([2620:15c:183:0:8223:87c:a681:66aa])
 by smtp.gmail.com with ESMTPSA id
 n3sm1215070ilm.8.2019.10.27.08.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 08:54:46 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun, 27 Oct 2019 09:53:47 -0600
Message-Id: <20191027155410.187957-7-sjg@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191027155410.187957-1-sjg@chromium.org>
References: <20191027155410.187957-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 07/30] mtd: spi-mem: Drop dm.h header file
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

 drivers/spi/spi-mem-nodm.c | 1 +
 drivers/spi/spi-mem.c      | 5 +++++
 drivers/spi/stm32_qspi.c   | 2 ++
 include/spi-mem.h          | 5 +----
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-mem-nodm.c b/drivers/spi/spi-mem-nodm.c
index 4447d44991..83dde4806e 100644
--- a/drivers/spi/spi-mem-nodm.c
+++ b/drivers/spi/spi-mem-nodm.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
  */
 
+#include <malloc.h>
 #include <spi.h>
 #include <spi-mem.h>
 
diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 7788ab9953..e5a8109058 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -11,6 +11,11 @@
 #include <linux/pm_runtime.h>
 #include "internals.h"
 #else
+#include <common.h>
+#include <dm.h>
+#include <errno.h>
+#include <malloc.h>
+#include <spi.h>
 #include <spi.h>
 #include <spi-mem.h>
 #endif
diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
index 958c394a1a..c8c81396c5 100644
--- a/drivers/spi/stm32_qspi.c
+++ b/drivers/spi/stm32_qspi.c
@@ -9,7 +9,9 @@
 
 #include <common.h>
 #include <clk.h>
+#include <dm.h>
 #include <reset.h>
+#include <spi.h>
 #include <spi-mem.h>
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
diff --git a/include/spi-mem.h b/include/spi-mem.h
index 36814efa86..2f3f0156d0 100644
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
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
