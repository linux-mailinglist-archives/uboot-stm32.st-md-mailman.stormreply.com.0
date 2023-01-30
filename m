Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C1368149E
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jan 2023 16:18:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89EA1C640E6;
	Mon, 30 Jan 2023 15:18:00 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF2FBC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 15:17:58 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id i6so1361741ilq.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 07:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gDoOh0Zs1aplwts5VnMq76uHdzkMThwMgUr9BKa/G7k=;
 b=c5mhqzZH5DnbUIgU/0/NdxS2coIZKGgefcze9I2Rbzgmq+mj3EJegrWw6p2KRtWvvR
 ZbHTFUc8vV8ivU2OkIL2eeeFz1aFHCpfyGdkxAbnRrJxrHNoXtU6Y5EUhy1j+io+6ku7
 OV19UF+dsGcEM1dkoWZm4AHfsUpVVkYN+tVIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gDoOh0Zs1aplwts5VnMq76uHdzkMThwMgUr9BKa/G7k=;
 b=vAa3e/YU1TMwrr1J6JgY+lrg1g4QC8j6R0fBDqEUyOIBaOgOAozQki+AGuz0SBqQ0t
 kv/wWYy3OXxcJDCFDLiBejlM/toH13dtqZ3ol97q/kgP91l8rIuPDvOqcZuLA2fO84io
 4cIUFizF3V64ViEIq5LI/TzFgUhCSuPC+8wpfGuRcV6CaC+bzZfsNeYk2qTvTFEnYFRV
 cnAT6j1mk8vOAcnCWGDYsE99HfeKuRh9tXcW5JN4tTaCyfveLyIjPgjmnfBBolK0wWk9
 SBEKxhgTlXdE6t1X/sBjeHJ9vVZ080h+ReNFzcL7aRJ3JR2zkJq+6Di7nmR54ynCVCnD
 q+Hg==
X-Gm-Message-State: AFqh2kq7sqvFetf+aaPWOjBsr71MJwmsfrn1awLYf/QWMqoTPCTNmUNv
 sI86G43DQ1eLRV9jR51eCNvdmw==
X-Google-Smtp-Source: AMrXdXszr10qYq5IjkeUYQAzy69IbTKC62Q/uSEV1EsEyRPK4OxruKXrbLjO8SYPaBtGi6tRDibJkA==
X-Received: by 2002:a05:6e02:1a0b:b0:30f:526d:3e31 with SMTP id
 s11-20020a056e021a0b00b0030f526d3e31mr33877467ild.3.1675091877700; 
 Mon, 30 Jan 2023 07:17:57 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a92d38d000000b00302bb083c2bsm4103194ilo.21.2023.01.30.07.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 07:17:57 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Mon, 30 Jan 2023 08:15:47 -0700
Message-Id: <20230130151612.212732-147-sjg@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230130151612.212732-102-sjg@chromium.org>
References: <20230130151612.212732-102-sjg@chromium.org>
MIME-Version: 1.0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 146/171] Correct SPL use of
	STM32MP15X_STM32IMAGE
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

This converts 1 usage of this option to the non-SPL form, since there is
no SPL_STM32MP15X_STM32IMAGE defined in Kconfig

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/mach-stm32mp/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
index 218d9ef282a..c21c5c42fe1 100644
--- a/arch/arm/mach-stm32mp/fdt.c
+++ b/arch/arm/mach-stm32mp/fdt.c
@@ -505,7 +505,7 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 		 * under CONFIG_STM32MP15X_STM32IMAGE only for compatibility
 		 * when FIP is not used by TF-A
 		 */
-		if (CONFIG_IS_ENABLED(STM32MP15X_STM32IMAGE) &&
+		if (IS_ENABLED(CONFIG_STM32MP15X_STM32IMAGE) &&
 		    !tee_find_device(NULL, NULL, NULL, NULL))
 			stm32_fdt_disable_optee(blob);
 	}
-- 
2.39.1.456.gfc5497dd1b-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
