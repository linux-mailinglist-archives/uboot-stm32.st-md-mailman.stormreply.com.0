Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0060B7477CD
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Jul 2023 19:31:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81F98C6B45A;
	Tue,  4 Jul 2023 17:31:29 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA6EBC03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jul 2023 17:31:28 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-99364ae9596so298604566b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Jul 2023 10:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688491888; x=1691083888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eDuNISSxUV/7Xf/isKXESsPTyCzZ1yZMoYgPZaKGWr8=;
 b=fm0KiTlubDeX/cYpFHhABHsyB99Y2Wy6Gwy0roNB8dsJ1GF/iLiJ/gYUBvoUxTeQu+
 7Nlm6IAk/D32XxP7I3oz1NPlPV+TXQ48Q1rM4BLKoFYek2hri7sVVLuwRsTJC8sumgmm
 fPGdJD5Nc8wvoie4w9J3zgRgm7RSoyMwGxAik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688491888; x=1691083888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eDuNISSxUV/7Xf/isKXESsPTyCzZ1yZMoYgPZaKGWr8=;
 b=BgXZ9nmKw3YXbMtEh7+r9OIkbeYIhOBGggRtlFata0m+eZ2yqIgFk78+pQWsP7cl1q
 Rowwnnoz2MiH2n07vkNKeuUDI9gtQSLaa8JbrlkTXUsMsJOygCsXDbUEyJT6Z4qUrWxd
 SC6yYQXT3rqD9lfRiJUgWPsSUIicNwaAQwCXh4OgKJ3uS2lFIEXrNHzkRturiv2NSGqc
 /+M+3zOfPYNe0F2er4UYmihofS8iihcMVg13kcJ2ATBJhC7gRY4BzxB21p5i72rUGIjI
 t2hx1PAkJZidA4fEFBr93SwzuawMCOSz6O9Dw1zcVmFHULrtjnoNAVQxigSN17bs8mxR
 78Tg==
X-Gm-Message-State: AC+VfDxzEthNXIM7wOxcPYc3Imk0qXxCJKYYcDSURIFFkHiwJNX6GmE6
 /piuOmgwIKoQVWoO7HRf2qsfHw==
X-Google-Smtp-Source: APBJJlFoVq3QYainEH0Y4MBnyKVHApZF3WiZzku9gQY3CX/B33faNP1fIR6E0Va/FnbkRHL84k3bzw==
X-Received: by 2002:a17:906:1b54:b0:98d:696a:531c with SMTP id
 p20-20020a1709061b5400b0098d696a531cmr9577498ejg.40.1688491888253; 
 Tue, 04 Jul 2023 10:31:28 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 hk18-20020a170906c9d200b0099290e2c163sm8191263ejb.204.2023.07.04.10.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 10:31:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Tue,  4 Jul 2023 19:31:21 +0200
Message-Id: <20230704173121.589620-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v2] board: stm32mp1: add splash screen on dk2
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

Display the STMicroelectronics logo.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>


---

Changes in v2:
- move "splash.h" and "st_logo_data.h" headers before "syscon.h" in order
  to keep includes sorted alphabetically.
- remove "logo" variable and pass "(ulong)stmicroelectronics_uboot_logo_8bit_rle"
  directly to the bmp_display() function.

 board/st/stm32mp1/stm32mp1.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 1a1b1844c8c0..ebd3948d519c 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -31,8 +31,11 @@
 #include <phy.h>
 #include <remoteproc.h>
 #include <reset.h>
+#include <splash.h>
+#include <st_logo_data.h>
 #include <syscon.h>
 #include <usb.h>
+#include <video.h>
 #include <watchdog.h>
 #include <asm/global_data.h>
 #include <asm/io.h>
@@ -684,6 +687,14 @@ int board_init(void)
 	fw_images[0].fw_name = u"STM32MP-FIP";
 	fw_images[0].image_index = 1;
 #endif
+
+	if (IS_ENABLED(CONFIG_CMD_BMP)) {
+		if (board_is_stm32mp15x_dk2()) {
+			bmp_display((ulong)stmicroelectronics_uboot_logo_8bit_rle,
+				    BMP_ALIGN_CENTER, BMP_ALIGN_CENTER);
+		}
+	}
+
 	return 0;
 }
 
-- 
2.32.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
