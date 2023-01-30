Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC00568149D
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jan 2023 16:17:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D6D8C640E6;
	Mon, 30 Jan 2023 15:17:45 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C128DC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 15:17:43 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id i17so5067979ils.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 07:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3A4gSIciR95I6cpBgQNml7gcK1i4a+WTuMf1OdkreI=;
 b=ks4tNvjeSimRyqC0fkvc2veMEGmVVTFyhsyC3i8YMjMxcseg/oafXRurG72av7nkuw
 Crmvik/C0GDxnO1g2F3kjmmy4adlo2lskMvJcd/wxrLbHRsTP+v4vB6VFEdsebm4oM1Q
 BWkL6PJO6isOT6mT64OYclOhSw8OZlrcWZW9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3A4gSIciR95I6cpBgQNml7gcK1i4a+WTuMf1OdkreI=;
 b=GoNxRTJ8wxw3ASG3j8pgDOu3/nayRoqnUrksny9sX1hgc0G6mZKZ5kbCOALh5U2Y0V
 F1JDsUG5L+WXbs3jod9qvD8yzibxINPFrEsJWct3FnlXg6HekI0yzz2hdAnL4PYjOutq
 Lgd3KHeOx2KMaGZ1B9SHsqvByo52JueXwjEqiLZurghZ8Lfen7SxJJCO2KU58ZATclXz
 CDWtVXVGlv7WmWPiKnh1xA/yXne3nzdB5c+I0tneTyN9fcrkLJ50OGfJs5PtNP6AZT+8
 lGlGQXPkPxX3D8pZjTOs2bC9yigebMNYDZQD47NrDHdhaCwJJhZ4SH7wkmOwMPqu7jC2
 f3uA==
X-Gm-Message-State: AO0yUKUu2PAOfLoRkpD5wjw8qSDXuwU3TOIb9GKka1eAdVv974WxpKYq
 uf/PbJ0izguj84Zzqmep9RhaTQ==
X-Google-Smtp-Source: AK7set/FkgY6/PfvE4WO0c3CErqSEpTh6jHcNO4Uhpq9+RoBtXa0pXpcMm8RQAMzbRzzO4vPv46Mrg==
X-Received: by 2002:a05:6e02:1b81:b0:310:a9be:931 with SMTP id
 h1-20020a056e021b8100b00310a9be0931mr17043042ili.10.1675091862770; 
 Mon, 30 Jan 2023 07:17:42 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a92d38d000000b00302bb083c2bsm4103194ilo.21.2023.01.30.07.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 07:17:42 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Mon, 30 Jan 2023 08:15:29 -0700
Message-Id: <20230130151612.212732-129-sjg@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230130151612.212732-102-sjg@chromium.org>
References: <20230130151612.212732-102-sjg@chromium.org>
MIME-Version: 1.0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 128/171] Correct SPL uses of PMIC_STPMIC1
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
no SPL_PMIC_STPMIC1 defined in Kconfig

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 9c4ba407ba0..baa156acf9e 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -1583,7 +1583,7 @@ int stm32prog_pmic_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
 	int result = 0, ret;
 	struct udevice *dev;
 
-	if (!CONFIG_IS_ENABLED(PMIC_STPMIC1)) {
+	if (!IS_ENABLED(CONFIG_PMIC_STPMIC1)) {
 		stm32prog_err("PMIC update not supported");
 
 		return -EOPNOTSUPP;
@@ -1633,7 +1633,7 @@ int stm32prog_pmic_start(struct stm32prog_data *data)
 	int ret;
 	struct udevice *dev;
 
-	if (!CONFIG_IS_ENABLED(PMIC_STPMIC1)) {
+	if (!IS_ENABLED(CONFIG_PMIC_STPMIC1)) {
 		stm32prog_err("PMIC update not supported");
 
 		return -EOPNOTSUPP;
-- 
2.39.1.456.gfc5497dd1b-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
