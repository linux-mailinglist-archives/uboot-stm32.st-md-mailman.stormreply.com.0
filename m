Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B71EE68149C
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jan 2023 16:17:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69ADFC640E6;
	Mon, 30 Jan 2023 15:17:18 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69249C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 15:17:16 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id z2so4648598ilq.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 07:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WlO2KkYnnjsIY6HNjeRix6fzog7uIiSVVPtJ169vcXI=;
 b=OtkzUUE4bhSoDbsiBLMnFsqRGGDUs0niosS9m8QC5HmbI8TOj49aUmMUdv9CzeBT5J
 rQQldOF0JH+U/cir3noaBl8QOHLtKoRB1BZKGp4XjX5xdfL6T/qOwkHXSaiwfYKXYaaI
 2AA1KYGywCv2nVwaoVTHGE+aM29y35wxWYaVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WlO2KkYnnjsIY6HNjeRix6fzog7uIiSVVPtJ169vcXI=;
 b=l6UPNrlsyGF52RFpk3jFmBZ73TwA74yet7rRXeoUMTsbgUKxLjyP3WNXxQfAz1+4oq
 EgVz4KHpwa+j08johDn7GzxYCX3ldUaC5LJweZAwhqxz87bUAhjZtpI+HlnLMGXNhVwr
 2UbFoXFoirhq4/inta0Psj5+OQl5TjJIhtLQDSE3C3HgXgj843QGHxu68DaN1U/JD+77
 /ERfpNA/fkZWD37XMCviuDx46S5Xm4gu9NDIIUS9uIkPxj/i4dd9rcWwjcppuGJcaUXw
 Jg12wPK/MF6kHeNCYa8wCMJB1D8doEHI07dIU5G8aW0m0k6BAt5epKEyBV45WZxsFcGF
 P1zg==
X-Gm-Message-State: AO0yUKUh4V3QDb91J02sCno4M4xEUhECCIsz+fhbYz7vsBAbh7pZMS45
 B7Fn0NuQ95d+r0wIeLZqNVR64Q==
X-Google-Smtp-Source: AK7set/dvnzAr0IadVkIn+UHUN04cllZPDwQAIkL2RubgOYPBzb6wNrfx7nBWltZLsVRDi1xNkX7rw==
X-Received: by 2002:a05:6e02:d94:b0:310:c2d5:dfd5 with SMTP id
 i20-20020a056e020d9400b00310c2d5dfd5mr7852436ilj.17.1675091835147; 
 Mon, 30 Jan 2023 07:17:15 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a92d38d000000b00302bb083c2bsm4103194ilo.21.2023.01.30.07.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 07:17:14 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Mon, 30 Jan 2023 08:15:11 -0700
Message-Id: <20230130151612.212732-111-sjg@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230130151612.212732-102-sjg@chromium.org>
References: <20230130151612.212732-102-sjg@chromium.org>
MIME-Version: 1.0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 110/171] Correct SPL uses of MTD
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
no SPL_MTD defined in Kconfig

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 2 +-
 board/st/common/stm32mp_dfu.c                   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 4b75397b1cc..9c4ba407ba0 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -1748,7 +1748,7 @@ static void stm32prog_end_phase(struct stm32prog_data *data, u64 offset)
 		}
 	}
 
-	if (CONFIG_IS_ENABLED(MTD) &&
+	if (IS_ENABLED(CONFIG_MTD) &&
 	    data->cur_part->bin_nb > 1) {
 		if (stm32prog_copy_fsbl(data->cur_part)) {
 			stm32prog_err("%s (0x%x): copy of fsbl failed",
diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
index 19e9c3b2402..079ba15ddb1 100644
--- a/board/st/common/stm32mp_dfu.c
+++ b/board/st/common/stm32mp_dfu.c
@@ -123,7 +123,7 @@ void set_dfu_alt_info(char *interface, char *devstr)
 			board_get_alt_info_mmc(dev, buf);
 	}
 
-	if (CONFIG_IS_ENABLED(MTD)) {
+	if (IS_ENABLED(CONFIG_MTD)) {
 		/* probe all MTD devices */
 		mtd_probe_devices();
 
-- 
2.39.1.456.gfc5497dd1b-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
