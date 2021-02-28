Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DA7327339
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Feb 2021 16:52:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E016C56630;
	Sun, 28 Feb 2021 15:52:54 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B09AAC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 15:52:52 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id p21so9819111pgl.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 07:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ROIwMOfBM9kCmIV7vpMS1uwKtzLbPjg6qr86zPXKJRw=;
 b=Roly490y/OcsQq1ueHBHS8uJBHcfSC7qS+YX3vABl130GNCqmOAnKTRelmkVjqcWxL
 ynERQ5DHPOU3P9/CDoDIY3+VK11Zg0wrqbtTzkGMKFwtDW8SigJ6lu7++2vvG6H8KcV2
 nlZ5KJ7NDxUyW/JNcqxpsqrUPSWQWRwbwwFng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ROIwMOfBM9kCmIV7vpMS1uwKtzLbPjg6qr86zPXKJRw=;
 b=UstMDYyN3Z7SUqljid7JAUCgnRvgJdV+I5CQAowSGj20z1YFpeipWWsC2JcoS3UMdM
 rboLP5U6qLBrGW5cxsmuve42i3L16vwJWfaQwzSzRSuPlmp1U0oJzKeiKswBl2Y6DCIh
 VnrL7QYmFUrJXKv96xagves7FsL+8tZxR/8eUrKj0rPNUBMT9US0P0+UNedfc2L381rq
 De2EuJaEzpsn/cuMR9LKyOQbxatskg9rBgwmVcgFigA+TOnzRnNMT5NyeZYmiuXsxQaK
 Cf0zXI3SdKZZCwadSmMLH9CkibQZhgZFMBjj9sMQKEC+0g5SPpzpP1COR4ApeYlJz2Z0
 E//Q==
X-Gm-Message-State: AOAM531qQdVTrj9e52ECPc62+NdmtUdg/SMUeCuG/FMueV/gBcj2dfEk
 X/r2szSvZ1iGTN/xb2zFj182vA==
X-Google-Smtp-Source: ABdhPJwElN8CVGVDw3plELtTA+at3NXaF7kKR9/My5wHoZq4v5vQFoH+pj5xGpk1dwZRxF0bIiC9sg==
X-Received: by 2002:a65:5b87:: with SMTP id i7mr10062248pgr.278.1614527571363; 
 Sun, 28 Feb 2021 07:52:51 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id o18sm14725779pjq.44.2021.02.28.07.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 07:52:51 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Sun, 28 Feb 2021 21:22:20 +0530
Message-Id: <20210228155226.77904-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228155226.77904-1-jagan@amarulasolutions.com>
References: <20210228155226.77904-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 3/9] ARM: stm32: Imply SPL_SPI_LOAD
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

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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
