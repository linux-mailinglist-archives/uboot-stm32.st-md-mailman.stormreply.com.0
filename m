Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3937242719E
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB02BC597B3;
	Fri,  8 Oct 2021 19:57:01 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08206C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:01 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 u5-20020a4ab5c5000000b002b6a2a05065so2109650ooo.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a2oEw/KeBlbGy7fEBlFWhOLwuFFuj3t/KwNzVgVmiQI=;
 b=TySmbWiemTL4TugxmU9oCdy0FpQOoAZFDb5gWeRH/Yvm+VJ+9UR/lxbOXQqmZJiT+u
 BIeohG2rgoNhnHIzHuK57UJGE7k88KV1aeuY9JENCtAsiNb2qhvmuupuvXLJjsEqH/XA
 8l6fQsMkQLKRV7pnNWCsQJxEo4St5OPg5mlS5wtiJTNiqeBO9mJEGq1Kq3jwC6KUwcJF
 YG2EgTJL8eLfhCQdpM6KD3bAuHql64XXIYnl+JxfrX+k3FQOmqK28gIearLAhjd6qbU4
 mPZN2T3p8u4R8zh9ObqOuyQ1vQPGpyPsIU/qAuJws3KVDGqfM5d5bNqRumQXQwpNFI49
 8XTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a2oEw/KeBlbGy7fEBlFWhOLwuFFuj3t/KwNzVgVmiQI=;
 b=XIrS6aXMUSaCGFR91n95yJNs4/WGW2AhO8FrkB9QWcmgAnbzLVRvo8U7Q6rHpBKPTV
 qPBmyoYwaQhslgJwjofRqNsiSOyoDW5uZRskYg9P51n2xFIO46rH9yABy4TRUPDge2XV
 I77Zw7qqwhP8+Sf2v0A74pSA2gAv0t2Szd9gjDbc1obangIg8570rd+17SgtGBCoBmat
 t5TfE7PrksjL5hnHQUfDl02DYS8DYLPWLEbBxHtFgQ15pbtZHdBmz8oXIcgvRCLRmL1V
 4v6wZuc2Emmt1ow9ZuNbeC/jP47nEcgRbnKbKWHDQOG00vX0xpiuMAqp/g1pLqs8VylO
 dZ5Q==
X-Gm-Message-State: AOAM530JkVJii/q/ttXhEY1jDs+vfnkOJ2s1ouMnRNNstgRh3YyxnvIP
 hKCCQd8B4fvRVxMDogKUtg4=
X-Google-Smtp-Source: ABdhPJy/MQiLJWrBwZ1C3IczNQ9DBvAWF4E8LMfyRf4qpR1Qkwi7vOyQoharGBmyIwc8Yv1CopB2YA==
X-Received: by 2002:a4a:970a:: with SMTP id u10mr9354252ooi.74.1633723019904; 
 Fri, 08 Oct 2021 12:56:59 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:56:59 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:43 -0500
Message-Id: <20211008195655.46046-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008195655.46046-1-mr.nuke.me@gmail.com>
References: <20211008195655.46046-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 01/13] spl: Untagle spl_start_uboot() from
	spl_mmc.c
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

The symbol spl_start_uboot() is provided in spl_mmc.c, but it may also
be provided by platform code.

Fireworks can be created with the following combination:

    CONFIG_SPL_OS_BOOT is not set
    CONFIG_SPL_MMC=y
    ARCH provides spl_start_uboot()

A weak implementation of spl_start_uboot() exists in spl/spl.c, so
leverage that one and stop defining the symbol in spl_mmc.c. We need
the symbol because spl_start_uboot() is called in spl_mmc.c
irrespective of the Falcon mode being activated.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 common/spl/spl.c     | 10 ++++++----
 common/spl/spl_mmc.c |  4 ----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/common/spl/spl.c b/common/spl/spl.c
index a9304d4148..6232a23c9e 100644
--- a/common/spl/spl.c
+++ b/common/spl/spl.c
@@ -87,15 +87,17 @@ __weak int dram_init_banksize(void)
  * 0 to not start u-boot
  * positive if u-boot should start
  */
-#ifdef CONFIG_SPL_OS_BOOT
 __weak int spl_start_uboot(void)
 {
-	puts(SPL_TPL_PROMPT
-	     "Please implement spl_start_uboot() for your board\n");
-	puts(SPL_TPL_PROMPT "Direct Linux boot not active!\n");
+	if (IS_ENABLED(CONFIG_SPL_OS_BOOT)){
+		puts(SPL_TPL_PROMPT
+		     "Please implement spl_start_uboot() for your board\n");
+		puts(SPL_TPL_PROMPT "Direct Linux boot not active!\n");
+	}
 	return 1;
 }
 
+#ifdef CONFIG_SPL_OS_BOOT
 /*
  * Weak default function for arch specific zImage check. Return zero
  * and fill start and end address if image is recognized.
diff --git a/common/spl/spl_mmc.c b/common/spl/spl_mmc.c
index d52f8a3eef..a9a588b04f 100644
--- a/common/spl/spl_mmc.c
+++ b/common/spl/spl_mmc.c
@@ -252,10 +252,6 @@ static int mmc_load_image_raw_os(struct spl_image_info *spl_image,
 	return 0;
 }
 #else
-int spl_start_uboot(void)
-{
-	return 1;
-}
 static int mmc_load_image_raw_os(struct spl_image_info *spl_image,
 				 struct mmc *mmc)
 {
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
