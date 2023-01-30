Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DAE6813E1
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jan 2023 15:55:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1078AC640E6;
	Mon, 30 Jan 2023 14:55:31 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03C27C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 14:55:30 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id i6so1329759ilq.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mjw6+I5HSu8KAilzlhSizZRmxsEmZfjRLdHFJ650kwY=;
 b=DV7p7N5A6bCnDS/pLvmA6Nk3sgCjq5NcSA6R5S7eKWyvqZFMQ9LvFSxVwNKi513u1Z
 lqYNMaXW4lhwYKi0OTLP+5szet3LliglU9ZN92qXsa/98v3SUCKuwGXFCuDyrI7nOeyb
 6BMkrjY6ftE7UX160tEPFw4KBhmdmh7fp+yyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mjw6+I5HSu8KAilzlhSizZRmxsEmZfjRLdHFJ650kwY=;
 b=Sd+armr9wNwPlFrVexotFaPpnoVvx360k1AQV3s0F7J15Pdl5oaCwFG5S5yTh1pCdc
 WxHWzRiL8l7BY9YtweIFoRa2nqNcTfhgF/CI8SXEuFOqwhjm26O0RbKqUnvhVS3fJmi3
 R+JYS8pJdiGNW7FJH3f5XCm9vOqb8lUwfFOUTcQ4kLRaqneljn7E92NilzMwMDqqkXaz
 N7GZ9llYwrJ7iX84ckrm3qdp4G+5CU3v1hqsuJ05+LIn/V47ed6EYEK6OBpMICsj4Bdg
 o7xradg50Mu6zA8PTKwgdcAILYJZ6vpxcmJ/3KqUvqcuEhqISo0CxDX7b8RkkHWX1Hm+
 Tuzw==
X-Gm-Message-State: AO0yUKVhp+BvLrM2nzi/M9JhjIXa1cCN19w4dKM71KSZhv/QJ4lX/NIV
 qVWoFJe43fNh8cPGhjE95NH/6u87Yi9jmq9h
X-Google-Smtp-Source: AK7set/bi+D/U2oqABCEIcFaECati99tHqgYG/yCEsEDG7Jw+XvDRsr00B2jP8kZXmQvIWaZfEr9Mg==
X-Received: by 2002:a05:6e02:2199:b0:30d:b3c3:f94c with SMTP id
 j25-20020a056e02219900b0030db3c3f94cmr8249672ila.2.1675090528998; 
 Mon, 30 Jan 2023 06:55:28 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a926b12000000b0030bfdb6ef60sm4008830ilc.58.2023.01.30.06.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:55:28 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Mon, 30 Jan 2023 07:41:39 -0700
Message-Id: <20230130144324.206208-67-sjg@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230130144324.206208-1-sjg@chromium.org>
References: <20230130144324.206208-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 066/171] Correct SPL uses of DFU_VIRT
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

This converts 3 usages of this option to the non-SPL form, since there is
no SPL_DFU_VIRT defined in Kconfig

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 board/st/common/stm32mp_dfu.c | 2 +-
 drivers/dfu/Makefile          | 2 +-
 include/dfu.h                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
index 0096f71dfc1..19e9c3b2402 100644
--- a/board/st/common/stm32mp_dfu.c
+++ b/board/st/common/stm32mp_dfu.c
@@ -159,7 +159,7 @@ void set_dfu_alt_info(char *interface, char *devstr)
 	puts("DFU alt info setting: done\n");
 }
 
-#if CONFIG_IS_ENABLED(DFU_VIRT)
+#if IS_ENABLED(CONFIG_DFU_VIRT)
 #include <dfu.h>
 #include <power/stpmic1.h>
 
diff --git a/drivers/dfu/Makefile b/drivers/dfu/Makefile
index dfbf64da667..df88f4be59a 100644
--- a/drivers/dfu/Makefile
+++ b/drivers/dfu/Makefile
@@ -10,4 +10,4 @@ obj-$(CONFIG_$(SPL_)DFU_NAND) += dfu_nand.o
 obj-$(CONFIG_$(SPL_)DFU_RAM) += dfu_ram.o
 obj-$(CONFIG_$(SPL_)DFU_SF) += dfu_sf.o
 obj-$(CONFIG_$(SPL_)DFU_WRITE_ALT) += dfu_alt.o
-obj-$(CONFIG_$(SPL_)DFU_VIRT) += dfu_virt.o
+obj-$(CONFIG_DFU_VIRT) += dfu_virt.o
diff --git a/include/dfu.h b/include/dfu.h
index 07922224ef1..06efbf4b208 100644
--- a/include/dfu.h
+++ b/include/dfu.h
@@ -495,7 +495,7 @@ static inline int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr,
 }
 #endif
 
-#if CONFIG_IS_ENABLED(DFU_VIRT)
+#if IS_ENABLED(CONFIG_DFU_VIRT)
 int dfu_fill_entity_virt(struct dfu_entity *dfu, char *devstr,
 			 char **argv, int argc);
 int dfu_write_medium_virt(struct dfu_entity *dfu, u64 offset,
-- 
2.39.1.456.gfc5497dd1b-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
