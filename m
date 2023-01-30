Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 888666813EC
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jan 2023 15:58:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EB0CC65E6E;
	Mon, 30 Jan 2023 14:58:23 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F319C6506E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 14:58:22 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id l7so3322693ilf.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 06:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BFsO0alo2JE9frNCgesCYVd7uihhKEokzoQY1rU8Qr8=;
 b=AilDCboIk65/2AUcUjP7V85G8SK/8Etm/e96a5tIh7ndqEnvFsJkPriKz5SFdjJAyy
 dKCzBafYOTfIKa64ZbFmcapN0XnoQP+iR5WnxY/WmXHcGVBATZaAszhn1a2MufKdBy+K
 2WkQpqk8RvTPiQw5ywCqOd+wUTbH34swTFHmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BFsO0alo2JE9frNCgesCYVd7uihhKEokzoQY1rU8Qr8=;
 b=xkZwuDc0ol7DCIlf7b6jfzta3UTUgX4sy1Dwa5JEDm5AeJRYopfc+dxVgJ8msAoCal
 fUjC2zH7T7CthzJ3+TJVcX6jTB4E/ix7QmcVQW9v5cU62Aq4Jfx+1ZCS170XYmBmg+Dc
 XbVzWUGhViA6AlGocdfrnBQVgiZtreIxgWsOeoSIJGsWPp690BZKF4IQ3kNPtEvFTfcj
 yFVkcdrrKPIOjc/V3oipi3Z6+sN9MlKNTjA/D1VKvnRK//1HB4G1dkKjyhwckdmFtAiL
 Aqmhjz42Xo+GqlOQZTGkYSJnDpgWeTEFOdBWhiIr6syhGxHYmxSGIizfLgSM+mhfFKB8
 vASg==
X-Gm-Message-State: AO0yUKVKIyvMhMgrCtpHBPJnUrw2NrpKJUvxC7F3fi5SDio8DK5zVuYh
 SlfA4RBBJqcykODlB+SDjdni+g==
X-Google-Smtp-Source: AK7set+++LuHC/rsU7Cx8Ac5o3OyNKsXrX1oO68Jan+0ya4fiJ5QJjlRSvW3a//Ixr1b8qsdYBxt3Q==
X-Received: by 2002:a05:6e02:1cad:b0:310:fdd5:c1ec with SMTP id
 x13-20020a056e021cad00b00310fdd5c1ecmr1593044ill.22.1675090701121; 
 Mon, 30 Jan 2023 06:58:21 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a926b12000000b0030bfdb6ef60sm4008830ilc.58.2023.01.30.06.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:58:20 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Mon, 30 Jan 2023 07:41:54 -0700
Message-Id: <20230130144324.206208-82-sjg@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230130144324.206208-1-sjg@chromium.org>
References: <20230130144324.206208-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 081/171] Correct SPL uses of ENV_IS_IN_UBI
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

This converts 2 usages of this option to the non-SPL form, since there is
no SPL_ENV_IS_IN_UBI defined in Kconfig

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 board/engicam/stm32mp1/stm32mp1.c | 2 +-
 board/st/stm32mp1/stm32mp1.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/engicam/stm32mp1/stm32mp1.c b/board/engicam/stm32mp1/stm32mp1.c
index 0a3e580f5b4..5223e9bae8d 100644
--- a/board/engicam/stm32mp1/stm32mp1.c
+++ b/board/engicam/stm32mp1/stm32mp1.c
@@ -68,7 +68,7 @@ enum env_location env_get_location(enum env_operation op, int prio)
 
 	case BOOT_FLASH_NAND:
 	case BOOT_FLASH_SPINAND:
-		if (CONFIG_IS_ENABLED(ENV_IS_IN_UBI))
+		if (IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
 			return ENVL_UBI;
 		else
 			return ENVL_NOWHERE;
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index b9fc240d5b6..7cff9e3d860 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -831,7 +831,7 @@ enum env_location env_get_location(enum env_operation op, int prio)
 
 	case BOOT_FLASH_NAND:
 	case BOOT_FLASH_SPINAND:
-		if (CONFIG_IS_ENABLED(ENV_IS_IN_UBI))
+		if (IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
 			return ENVL_UBI;
 		else
 			return ENVL_NOWHERE;
-- 
2.39.1.456.gfc5497dd1b-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
