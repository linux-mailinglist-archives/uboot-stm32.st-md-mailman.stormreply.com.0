Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF396813DC
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jan 2023 15:55:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECF79C6506E;
	Mon, 30 Jan 2023 14:55:24 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D735C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 14:55:23 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id l7so3318722ilf.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 06:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hQ9+ucXDt5wGffcElxuCf+nCKHvgH8CAXdTumnH1Zhs=;
 b=IRKTYkd69P9edk/LNqDNAo0SK2cCZGv2EMPNxQv7xtFcW+jd6NRmeWn+QTHI6UCfVO
 DXeDjJRYCu7yK44Y1usyarJWFeYGPCgOkUcMtfWtHM1KKZ/0OWYAelH3WK9tEzebB4/+
 QE4oyqU1N93dytX9l68USbYIOg/P43/3/h6q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hQ9+ucXDt5wGffcElxuCf+nCKHvgH8CAXdTumnH1Zhs=;
 b=aPBkpoKiVfT9hvMxdyACAKTl/MqBc+6ttupCujl2z4FBALv+goFyVKq+ghhFm1IqkM
 m0NGWdQzGzhylCrFw3mj1QhcNvSHjgc2DyFnv1UrXA0ArYvszn+2il7D9JByTbWF3VQv
 2B92QpKTnuPU6kzEQlJpd9NKQ/YQ0o3+OBs2wnXGfPSQqErW0Lb/k5WkCQFGwv021tX6
 BHzhsJc0rv6elZWhN/Rz7s9pNxxwImYW0LnXjmgZzrH4bqTg18XcJ7OfwWCV/36PgB/9
 lx5BCSpMe35AB7TeTq6u9sl9+HFzu3DZwNuVLkHp89j2OPOFw3rrS0N0yeMXI1RfojYv
 eV4Q==
X-Gm-Message-State: AO0yUKXIwkPfWLq03o9yHaCwigJ/Nfrg9so6JqYg5XqgaP+7hUAhcd1u
 w8O5AE4CGGbb6yANYgIkGBS/LA==
X-Google-Smtp-Source: AK7set95AAqVHeWih+o44taG80+Izo4PQry9novZqSIOtyICgSmf7cKQdwaQDYu2OOZoaAO04C1SAw==
X-Received: by 2002:a05:6e02:20c2:b0:30d:771c:db3e with SMTP id
 2-20020a056e0220c200b0030d771cdb3emr7187743ilq.9.1675090522594; 
 Mon, 30 Jan 2023 06:55:22 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a926b12000000b0030bfdb6ef60sm4008830ilc.58.2023.01.30.06.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:55:22 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Mon, 30 Jan 2023 07:41:32 -0700
Message-Id: <20230130144324.206208-60-sjg@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230130144324.206208-1-sjg@chromium.org>
References: <20230130144324.206208-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 059/171] Correct SPL use of CMD_STBOARD
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
no SPL_CMD_STBOARD defined in Kconfig

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 board/st/stm32mp1/stm32mp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 4536c1c673c..914f900ac86 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -129,7 +129,7 @@ int checkboard(void)
 		 fdt_compat && fdt_compat_len ? fdt_compat : "");
 
 	/* display the STMicroelectronics board identification */
-	if (CONFIG_IS_ENABLED(CMD_STBOARD)) {
+	if (IS_ENABLED(CONFIG_CMD_STBOARD)) {
 		ret = uclass_get_device_by_driver(UCLASS_MISC,
 						  DM_DRIVER_GET(stm32mp_bsec),
 						  &dev);
-- 
2.39.1.456.gfc5497dd1b-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
