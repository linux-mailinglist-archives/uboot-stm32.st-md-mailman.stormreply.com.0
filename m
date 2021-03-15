Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2E533C443
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Mar 2021 18:33:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F672C57B5A;
	Mon, 15 Mar 2021 17:33:38 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF9BBC57B5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 17:33:37 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id bt4so9185872pjb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 10:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vkcQPO8XZknSu5LlLn5rJe3U9HND0YggmwyVraDS/hQ=;
 b=IDexLUE1V6J9kb8oqAVtxze8yCqPNK/rv3YYEZPvfFo3QXSY1yRn/fN4dZyH6hAHI7
 /+vTpkLfaCf5mgS6GP0souT7ogbPhB7hehQFm8zy0T3Xube3xeLWxdqUCrPTcT5FrMv5
 1SkxrzserszoW6gxKv5xIdsr8CUxOJMKX3VTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vkcQPO8XZknSu5LlLn5rJe3U9HND0YggmwyVraDS/hQ=;
 b=L+sRkwo9APfJDSVxGHsz0zlG1vW8s897Gcqje42uP/qEksDrDigokl8jNxaggfBgoo
 aT5Nsv7GAPlxPsjif8yne2Op7AFJMcx4sGNIy2au4tQgaxTTyLn74yo56IYEAfNEsCst
 x1NQr56wi9xdXmyq6AkynCieNYvkE8775Y6hM+a0YxmlZ4DvVOlzYyAvpNwM1zXWljAI
 CRgEWdvNo3ifjlLShDSUoAKgWgR6VM8LblKcppxsWu0LKiWDi5jP8yzNknur/c8Pi9sb
 7jLge0k3GcXFkhFjc+5D+4auP1UHT0/sotJnw2R2+hLg6ssUiBX6LG+GAgdP7SzTK56A
 3Paw==
X-Gm-Message-State: AOAM533vSgrBea4mEr840zuIFrNCb4Ogh4BdBG1JwHF+CDq5s1uvLS4u
 fP8UKkY+YkygTp83Oeohdia4tw==
X-Google-Smtp-Source: ABdhPJzqrzESo/xJTGt6cCY+bPfji7gVYCy9l5zfChGtnXrZ9bzsJYYMJhDo0q9phnEyNbKp91x81w==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id
 q10mr153912pjv.113.1615829616410; 
 Mon, 15 Mar 2021 10:33:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:6f76:4267:118b:2085])
 by smtp.gmail.com with ESMTPSA id y17sm227500pju.50.2021.03.15.10.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:33:36 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Mon, 15 Mar 2021 23:02:50 +0530
Message-Id: <20210315173256.103731-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315173256.103731-1-jagan@amarulasolutions.com>
References: <20210315173256.103731-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v2 3/9] ARM: stm32: Imply SPL_SPI_LOAD
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

SPI Load isn't mandatory for STM32 builds.

Let's imply instead of select it to get rid of build
issues for non-SPI defconfigs.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- collect Patrice r-b

 arch/arm/mach-stm32mp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index f538d7cb83..79ffd5191d 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -16,13 +16,13 @@ config SPL
 	select SPL_REGMAP
 	select SPL_DM_RESET
 	select SPL_SERIAL_SUPPORT
-	select SPL_SPI_LOAD
 	select SPL_SYSCON
 	select SPL_WATCHDOG_SUPPORT if WATCHDOG
 	imply BOOTSTAGE_STASH if SPL_BOOTSTAGE
 	imply SPL_BOOTSTAGE if BOOTSTAGE
 	imply SPL_DISPLAY_PRINT
 	imply SPL_LIBDISK_SUPPORT
+	imply SPL_SPI_LOAD
 
 config SYS_SOC
 	default "stm32mp"
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
