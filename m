Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D7A42BB9
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Feb 2025 19:39:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F867C78F60;
	Mon, 24 Feb 2025 18:39:44 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 333A6C78F60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 18:39:43 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5e0505275b7so7697985a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 10:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740422383; x=1741027183;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LC9kjCT48lQxaMoZxrlHzoJSbY4yRMQoPJZRgzXaGTg=;
 b=QNT0/K5p67Q/bSCtGdPhB2EXFf7BZLcIe3T/ATcnYHO9Nx12lBbf58EIVaqjgo9MGj
 6JW/Eryl2Q2noU0E0kx80PvvEXXtmHgUli65QfWf8DE8FFLKt5lozIxBw3Aw7eOTQdVz
 cftf1l0jc/1VmNZFGN3/jgADnzKGouBBxyItQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740422383; x=1741027183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LC9kjCT48lQxaMoZxrlHzoJSbY4yRMQoPJZRgzXaGTg=;
 b=tMS0O60pCYnPW1ePFLtEieLzsrTS8rbCEqx7QR7glZPX+aWDrt4PSU4/rSYbMAwXdk
 f0jEmaI4np9kBq52t/B9xMjBqeT4KCiIZgdWJhODCMzRQXSlGKZVH2Yy76PaSWBw5Iz2
 X0nZp0vLrSjnLNoEapYEYXLyq2Lnbjko69Fl1hZ0n9w29hLqSJxHsFxA7zkKSkFCl/Au
 0D7KkThpxVFcLIUfL+3yZ/EVw1y4jzjte4U5dXp9SYasoDAOzt7Z4iv5AbKYsIOAVz40
 yy1pR60/IZr+XMfDaVps50wZzIBrzSdUy0UBQgacLFLnVJSen/p6H5dnn1Y/Ad1rAi/k
 gafA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOHP3pY+dHuuPlwOZMaDO0788oPhVsKtOjwKD/MiuwSHiEEbHu3wVtpU3c24UkrSoUpAwLsLO0tzk1ow==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyoPI3yUD8mSuG4D/h7WiOaItwefeUgrLWNuDbtaj0OE2rzs8/p
 RDL+iRrV8JTE75sRkB7FtmO3rdgSRxslwhWv38QP+dr0/QZ2mOxOowfrTTW37NY=
X-Gm-Gg: ASbGnctFGIqGl3+RN69PtFlA6KJVR2oYTuzwcFqh+z/g59HOEbFqCIKq6omMPvYIgoP
 NWVuY58cXVjpoa4Jmw8qVigBYrwdZg3DW1nPuvLVTrJJvJPyD53doew9I4XdVHFcQq1uHjCO2Vd
 N+Xikv1Pr0I2NHcDwLphEzICoR/ulp36duiHJ1FgT/FMyna0C683OuoQpx6h5WqHIyC8SQG1jgf
 AjhEf8s4wD6Utzoj76ZVoDIjTsnkFk3x48e/bj6d/ZU6nXnlafU6uxKc9O124f1tUNtrtumfrWz
 xAOp1FZvhvUfNtdEhJeLELve56RVzCTV1z6kKpW/vbrghSTpr0Ya4l9zZy0g9EPeSULWe8sTQdL
 kNIS0WtU559benDp85w==
X-Google-Smtp-Source: AGHT+IG17HfJ1pzaw51w3LQoj0MxZAaO0hxEeFcS0SB6EX2xfgBJp632meNMhiLdKvWsxngYMgr+eA==
X-Received: by 2002:a05:6402:e02:b0:5e0:88f4:1bc1 with SMTP id
 4fb4d7f45d1cf-5e0b70cd6dcmr13503818a12.2.1740422382654; 
 Mon, 24 Feb 2025 10:39:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2.196.124.195]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e0a2e25589sm8046911a12.42.2025.02.24.10.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 10:39:41 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 24 Feb 2025 19:39:27 +0100
Message-ID: <20250224183931.313491-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224183931.313491-1-dario.binacchi@amarulasolutions.com>
References: <20250224183931.313491-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Vikas Manocha <vikas.manocha@st.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v2 3/3] board: stm32f746-disco: drop
	board_late_init()
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

The removal of the "st,button1" and "st,led1" compatibles has emptied
the board_late_init(), so let's remove it along with the configuration
that allows its invocation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
- Add Reviewed-by of Patrice Chotard

 board/st/stm32f746-disco/stm32f746-disco.c | 5 -----
 configs/stm32746g-eval_defconfig           | 1 -
 configs/stm32746g-eval_spl_defconfig       | 1 -
 configs/stm32f746-disco_defconfig          | 1 -
 configs/stm32f746-disco_spl_defconfig      | 1 -
 5 files changed, 9 deletions(-)

diff --git a/board/st/stm32f746-disco/stm32f746-disco.c b/board/st/stm32f746-disco/stm32f746-disco.c
index 72f479cea66f..07bc8a5f0a27 100644
--- a/board/st/stm32f746-disco/stm32f746-disco.c
+++ b/board/st/stm32f746-disco/stm32f746-disco.c
@@ -76,11 +76,6 @@ u32 spl_boot_device(void)
 }
 #endif
 
-int board_late_init(void)
-{
-	return 0;
-}
-
 int board_init(void)
 {
 #ifdef CONFIG_ETH_DESIGNWARE
diff --git a/configs/stm32746g-eval_defconfig b/configs/stm32746g-eval_defconfig
index 4346ecd6e42b..bd3a48b20a2b 100644
--- a/configs/stm32746g-eval_defconfig
+++ b/configs/stm32746g-eval_defconfig
@@ -21,7 +21,6 @@ CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
-CONFIG_BOARD_LATE_INIT=y
 CONFIG_SYS_PROMPT="U-Boot > "
 CONFIG_CMD_GPT=y
 CONFIG_CMD_MMC=y
diff --git a/configs/stm32746g-eval_spl_defconfig b/configs/stm32746g-eval_spl_defconfig
index 2756ad5508fc..d47d059d23b1 100644
--- a/configs/stm32746g-eval_spl_defconfig
+++ b/configs/stm32746g-eval_spl_defconfig
@@ -30,7 +30,6 @@ CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
-CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_PAD_TO=0x9000
 CONFIG_SPL_NO_BSS_LIMIT=y
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
index 35a489c34e00..f6fbf83f68f1 100644
--- a/configs/stm32f746-disco_defconfig
+++ b/configs/stm32f746-disco_defconfig
@@ -21,7 +21,6 @@ CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
-CONFIG_BOARD_LATE_INIT=y
 CONFIG_SYS_PROMPT="U-Boot > "
 CONFIG_CMD_GPT=y
 CONFIG_CMD_MMC=y
diff --git a/configs/stm32f746-disco_spl_defconfig b/configs/stm32f746-disco_spl_defconfig
index 6826b1cb7559..dcf077dbfeec 100644
--- a/configs/stm32f746-disco_spl_defconfig
+++ b/configs/stm32f746-disco_spl_defconfig
@@ -30,7 +30,6 @@ CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
-CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_PAD_TO=0x9000
 CONFIG_SPL_NO_BSS_LIMIT=y
 CONFIG_SPL_BOARD_INIT=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
