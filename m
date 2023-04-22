Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 065096EB982
	for <lists+uboot-stm32@lfdr.de>; Sat, 22 Apr 2023 16:01:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 970C7C65048;
	Sat, 22 Apr 2023 14:01:48 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD20BC0356E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Apr 2023 14:01:46 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-506b20efd4cso4557179a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Apr 2023 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682172106; x=1684764106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WEVYQdP/TKL33uvcoYse3DS7qUmnNm+wz87+H8qEBjk=;
 b=fKzaFYUgQ8yLWoeihJQdmr4pUF5RlS9L/tYQhyEitZFpDYzEAcj4z1Jm6hLojPe01x
 tdnVhM6rjmg4597R6LVQ/p6tnMbUZm5rAspYJpLHb7yCmfoImiJEO745Jo95YeZJLupb
 x8zAY7OdKLUZ0jTf2Uu1OhEFaIiyAapNM9jyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682172106; x=1684764106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WEVYQdP/TKL33uvcoYse3DS7qUmnNm+wz87+H8qEBjk=;
 b=TwaKWch7nZXmLaIlRDFYMCqq+2GS7Jv3ymv64zkN2eAiHOzgKhqom2jCbFYftbLZ1D
 T4EJyaTptTWuIIW0cBV9IRpDzIO4Gyi869kNJ+0VTgt/UE6F+H1uHi6z7ndyal2M255S
 3ZbwS1X32CjLiqVCQQbyRN2T/3wmZpFMC24fdowWsezqub66TkAtQrVxw2sB73bY4dTq
 DTCibS7LtBg+9HPyaz7kyHhstxsC9Ndl9XXRXJRjBOIOa9yL2NmMy4pTI0bRRAzE2SKG
 G0l378mNimdvk7HsxwV9pISEeDi2J9JY+n9nonFzcDS7OymD2ShrwOV1AvWgqMJ5hWzE
 WlqQ==
X-Gm-Message-State: AAQBX9etEa4ycBsPx9yJ8mu3YJ083jIX2+REXNKr5eRRDdcgqxd/4jJG
 NBm4NkH8HAj20oe9JJMMGAAx+A==
X-Google-Smtp-Source: AKy350YHOTLFQMdYY0Irk2ge9QJzaRWR+gSSmoN1eZ/04EwXaQSuwtttIjL150D4jE/MhzgvU67fMA==
X-Received: by 2002:aa7:c6d2:0:b0:506:a7a4:88a9 with SMTP id
 b18-20020aa7c6d2000000b00506a7a488a9mr7958990eds.4.1682172106215; 
 Sat, 22 Apr 2023 07:01:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-99-194.retail.telecomitalia.it. [87.5.99.194])
 by smtp.gmail.com with ESMTPSA id
 k26-20020aa7c39a000000b005068053b53dsm2827353edq.73.2023.04.22.07.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 07:01:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat, 22 Apr 2023 16:01:40 +0200
Message-Id: <20230422140140.616230-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32f746-disco: remove a useless
	comment
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

Commit 8fc78fc73b7f9d ("configs: migrate CONFIG_BMP_16/24/32BPP to defconfigs")
made the comment useless.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 include/configs/stm32f746-disco.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
index 34856d300403..9bf01cac47a4 100644
--- a/include/configs/stm32f746-disco.h
+++ b/include/configs/stm32f746-disco.h
@@ -36,6 +36,4 @@
 #define CFG_SYS_UBOOT_BASE		(CFG_SYS_FLASH_BASE + \
 					 CONFIG_SPL_PAD_TO)
 
-/* For splashcreen */
-
 #endif /* __CONFIG_H */
-- 
2.32.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
