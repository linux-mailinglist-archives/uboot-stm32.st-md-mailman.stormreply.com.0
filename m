Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4866833D921
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 17:22:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E6A6C57B78;
	Tue, 16 Mar 2021 16:22:36 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B67CBC57B5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 16:22:33 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so3859813pjb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 09:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YzZKBH1J//EL0EHQ8l2ESnAMpxuILjG/T7wE0rLIt4s=;
 b=H/TcHSGVzl1b2I7bXmjZbnkyNTEf3+GrngYHKVFgNkQDK2ezsWGTVObXXPKaRZSMgo
 njnxRqY2QKhTpQbfJl9DCLS+aysFlN4SnsxHUpD19xoe2xynVwm2WdY+Bg90qJexpKL4
 oku9927A/6o3euBiULj2J5/iGU45R9BwGE7w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YzZKBH1J//EL0EHQ8l2ESnAMpxuILjG/T7wE0rLIt4s=;
 b=OD4x44jR6Uv7x3bT/ky9CYjl0zUAZfHM7fIFTjhSrD2tWuzWhdk4BS+SZPUdppyLF4
 NWXJUk8pqSay4Z1ZRAPWG1LWmCjIeLol5NVFziRlkhoBuYtFdzKgSAcDrrxJ56X4hReR
 AnfJfxive1p2L/JNjmJ/XctN6S9Lr6aS9GSPxqWTZ37VnfQ4a/9s1lYuOIRzk/wpG0z7
 fmrAE58HoJc4MAvBnBPpy8HRpL7fnKAInWOcsZbMskgAMbe6PV6t7q/TQqFMbypShvhH
 SQL6yo6xxFs6bGMp3jXBZNVOJsB89+NbV6rNZQC6Tct4vMQi5KhnQ9BZhAz8uetDBTCK
 wZeA==
X-Gm-Message-State: AOAM533QLfHhAL9+yxNJheNhttYMdidf2BGFFNnDcUmTpIB9SFy8G2g8
 IUh6+fzAdAM9jpZOf7fua3mUHw==
X-Google-Smtp-Source: ABdhPJwgZ5kIth7JK1MheNWLWghtPJFUqd1SplqS1yvdJBpu4msTWMXCM4lv+JAnpp+LPGGbMm45gA==
X-Received: by 2002:a17:90a:7c48:: with SMTP id e8mr430022pjl.89.1615911752380; 
 Tue, 16 Mar 2021 09:22:32 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:9de:273e:6ee1:9865])
 by smtp.gmail.com with ESMTPSA id
 k27sm17678240pfg.95.2021.03.16.09.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 09:22:32 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Tue, 16 Mar 2021 21:52:02 +0530
Message-Id: <20210316162207.35641-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316162207.35641-1-jagan@amarulasolutions.com>
References: <20210316162207.35641-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v3 3/8] ARM: stm32: Imply SPL_SPI_LOAD
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

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- add if SPL_SPI_SUPPORT
- collect Patrice r-b
Changes for v2:
- collect Patrice r-b

 arch/arm/mach-stm32mp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index f538d7cb83..c61eb424c1 100644
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
+	imply SPL_SPI_LOAD if SPL_SPI_SUPPORT
 
 config SYS_SOC
 	default "stm32mp"
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
