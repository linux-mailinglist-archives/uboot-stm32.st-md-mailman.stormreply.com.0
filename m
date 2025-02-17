Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D73E6A38B24
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Feb 2025 19:14:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B9DDC78F8B;
	Mon, 17 Feb 2025 18:14:51 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DBD5C78F86
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 18:14:47 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-abb90c20baeso217714866b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 10:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739816086; x=1740420886;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nVeYERuBLpaoP3rJO6LPZRy7aF+Q3PWiJkTgunLLnoc=;
 b=bTUFpz6HdhEq8WmEQnWWX2M2NBYCmG+nfqkUbnXWk+gP6IwtvzrEC53SvSTBHJfurp
 duuE7ERiNUn+oPQzBbWj3RSdeVGwOizImAZf0JZjcWQXHDE9lc5ta+x1hoIFK2RqElx8
 U/JCfMGIlPtM5YzcVapZF7NPP7XK+PLVF2GdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739816086; x=1740420886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nVeYERuBLpaoP3rJO6LPZRy7aF+Q3PWiJkTgunLLnoc=;
 b=Bb6yXnGVgUq5bgH9w3hf0dtyTxIGwj5bfHPUl4hMi/FpBT+vwXs9xiTS69D+oQZGba
 m5T0Fw5E3JEGPec3BiQOhX1dyTLM0fC6cZVW0bnihsIBaGtUHxcxrxCj/UQwDJvnbG/8
 I4gI/j46qME7+Jg8DgJQJvYsR7XOj2uDgS7j+1jbhEkK9FtF4OF/pMbjFqvEINP/hSah
 zXMd7P4h5ckkVsvNRdbKKO+zXJdYi33aNcWVs2ilsLtqA/IagSJMVXoHh1SieJNmwy45
 FYphPIp/Nvm5sXyoxXU/of6R2BA2pxalGRhSIE3+pIWs9s/DtyD6sWCaRCZBOM2EmxJ5
 OCKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUBgRPEyjWbFRMfD1vfeJQnCxF8o3iSm5LipJxjqOyDQObFSaNCqcl3O9efT2S67fpMxriea+iYQxzsA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyhn3kqaUgWUeY514rx2N6JNTsQD1RvG2bGl7ygqCsC+OEDumb0
 berFBYrkMoHMbWvvvs48JMn2UR2giNa3W3TyxMZAmE6fw4IJE83R5unWKiToRuXOpgZKz5MnChl
 F
X-Gm-Gg: ASbGnctJeqeDLMaCikbhYhqRuYTMG4vwnRV1wRgelx9kC4/d3aU3n91UtXz2RQWUw8e
 +ypBoR9Jv2vnXURhaAp6eTlVQB23s85EEoDtWNvf+e66HxaQRpdveWaturEZIEI/3rg5z7Ai67A
 S1Arxosz36qsnoTS7Zd8IXh3dPpo2oytYik6r6RKl68LRUkab+zn68Qn7ekYHYobfvxRlXQE389
 06pdgH8hP8Rg5fkkAvNmBNjsQ6r3d3dSzlmWa3lC7esMS605jBRAUrU0mL4JY/Gx6nPrHOa2oD+
 NrA+X8Aj7plFwgi+dJnv7D1oRQNnCs+GFFMpVYhn7ujC5ZUkdytuKJnLNi3s4taHC1Y8N4E38YI
 vrObe9g1xqhev5CbFW3zGsKd/e3JHSVj1An6vZyNEKegJvu3mo/hH
X-Google-Smtp-Source: AGHT+IFpRSFVJ77aIdRK9ud3VReP0o/FClyibIft/D3q1bNce8/4xFGIkBGNo+vre05mVAIiYu9YxA==
X-Received: by 2002:a17:906:318e:b0:ab7:5fcd:d4d9 with SMTP id
 a640c23a62f3a-abb70d96dc0mr847037066b.43.1739816086451; 
 Mon, 17 Feb 2025 10:14:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-4-36-33.retail.telecomitalia.it. [87.4.36.33])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa99f283sm113616666b.32.2025.02.17.10.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 10:14:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 17 Feb 2025 19:14:35 +0100
Message-ID: <20250217181439.1157972-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217181439.1157972-1-dario.binacchi@amarulasolutions.com>
References: <20250217181439.1157972-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Vikas Manocha <vikas.manocha@st.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 3/3] board: stm32f746-disco: drop
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
---

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
