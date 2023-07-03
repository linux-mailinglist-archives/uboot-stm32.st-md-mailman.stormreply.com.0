Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 878197460B5
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Jul 2023 18:28:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21B5BC6B45A;
	Mon,  3 Jul 2023 16:28:03 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FF3CC6B458
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 16:28:00 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-98de21518fbso531434666b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Jul 2023 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688401680; x=1690993680;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gxTaFpTeCRtXTWXkpbqQo0hgrZ/RtnTjkOgYO7+575o=;
 b=MbUQ9zW4qdxrCaCHIANEyRfm9qgkOQ6nKnVpggEKSuZVclLXB7hbk1NFy4DUCrJ7wQ
 OwYLj/0QDOLNaQckXHT8Cq2z3hihzSc0zoRDae4pDNvTr+7q0iDTbn/lT3EqCifFQfnE
 Lqxu08Umz9FTRW8nW0JJ9sLWObuyTnbjRSdto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688401680; x=1690993680;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gxTaFpTeCRtXTWXkpbqQo0hgrZ/RtnTjkOgYO7+575o=;
 b=MXdATK+wK9jh/w9qctVWJbHvYthkVVDfy0dXb9R2HoTlPscVwyBPVQQxg8zT4k67BW
 pT2qb1YDoCJzSd++4BpcW7hSfgn82u/A7X2b291Tlj3ssoMT0UycD0kqqU09qwfvXfgB
 ER4vTPQeJICMDS04aA3hK6SnBUq9YOjhdzABHPk/dGtCpNjz1UvgnKnGfvgi9dKxuvKD
 zuYKnw/6P0dWiI9fpSKjKJhVwSzRmJ+tKO/hM9XF797pY8bXOnlFtrSZgc8+8Hz+mcrO
 0EUjmUgvJaXH8Wu3GpyGC1NVZFTxBP3oRavudEW4ZvO+T5FKc9kRQ0QsoEeUBcV3bLlZ
 mdCQ==
X-Gm-Message-State: ABy/qLa/zzbL22A7oe9pygdiBB5muuyl/DUW/zK/cUHkL99jiOnxbQB/
 xamVkMLrHoZOrQp9a9FP7w388g==
X-Google-Smtp-Source: APBJJlEo8KXZ3qzDWpsBIuOMmVny4pfwDs+nOBO0OIgrnciV2Znd5bvs9HvhqWg0Z2pLAQ1hec3mqw==
X-Received: by 2002:a17:906:5904:b0:98e:3b89:5dc6 with SMTP id
 h4-20020a170906590400b0098e3b895dc6mr7389056ejq.48.1688401680380; 
 Mon, 03 Jul 2023 09:28:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a170906549000b00988dbbd1f7esm12163220ejo.213.2023.07.03.09.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 09:27:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon,  3 Jul 2023 18:27:54 +0200
Message-Id: <20230703162754.2341117-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH] board: stm32mp1: add splash screen on dk2
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

 board/st/stm32mp1/stm32mp1.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 1a1b1844c8c0..c8c2a83b2acf 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -32,7 +32,10 @@
 #include <remoteproc.h>
 #include <reset.h>
 #include <syscon.h>
+#include <splash.h>
+#include <st_logo_data.h>
 #include <usb.h>
+#include <video.h>
 #include <watchdog.h>
 #include <asm/global_data.h>
 #include <asm/io.h>
@@ -684,6 +687,15 @@ int board_init(void)
 	fw_images[0].fw_name = u"STM32MP-FIP";
 	fw_images[0].image_index = 1;
 #endif
+
+	if (IS_ENABLED(CONFIG_CMD_BMP)) {
+		if (board_is_stm32mp15x_dk2()) {
+			ulong logo =
+				(ulong)stmicroelectronics_uboot_logo_8bit_rle;
+			bmp_display(logo, BMP_ALIGN_CENTER, BMP_ALIGN_CENTER);
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
