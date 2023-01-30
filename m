Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E676813CD
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jan 2023 15:53:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C24D1C640E6;
	Mon, 30 Jan 2023 14:53:15 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44949C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 14:53:14 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id i17so5033530ils.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 06:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gFCGnzLv42k2VQkXimdcerZbAjN5WMlMXm83YAXRL9Y=;
 b=WdROdAkjMSByHnLcb01n7qcSCQF+ue8IBgrdizIReP7gpq/4P9q5N5P2wMcHd4QzCe
 9YPuxtfa0VuFlz/bXRGwdO5TtDM7ut1KtePZo8ScpN9miN1E0xxRHfKXKiNNANtsVeJY
 SvWx/PgcZsO6LaQj3jrj+gT4d8wf7r/32MzM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gFCGnzLv42k2VQkXimdcerZbAjN5WMlMXm83YAXRL9Y=;
 b=mSIp1n52s1D+yDOUnSKxbYF+rYljy64uDHtA13c245Esd4VnSG60RZkhq/Pbjjb5PU
 NSaNu0Bvx7+AGRwJw0lPPFlxYsvBL553qzmH/zZDHlmF8oz8rtwq7EBP9epAszodEmr7
 cxhPotIi51vfdoy0ogLdM8paW7Lxii+nGi5CzabpvaqBsWQosQIDl8YM4ZK5rzWS2jnz
 YdxijXtmxXXKDKupXLZU6y9O554Q05FKSj/fm/mLmXcd8OtPmJ0anlMlsgL67aICFRV0
 XQrZgq+e5gJ+qAczXtulGPHSvZBGy+b4nuB8tCpNQ1gtWJPtQy/XxZIQKFdAt8MvC2Zd
 m9dA==
X-Gm-Message-State: AO0yUKW1H0VRPKMhyK5XNi95R3B51jHGaoCl7a1/GdYy+jnNSaMTKdvC
 ZTduv//UK2NP5fBaYXUK3Z6e+Q==
X-Google-Smtp-Source: AK7set8Qmr7X6ySAdNuX6DZEVAwLsPH+FKmhdZu6bRv7y0824BLrIOk1QF2vrnxPJc/g8QFKDpov5g==
X-Received: by 2002:a05:6e02:1a09:b0:310:b57c:ab34 with SMTP id
 s9-20020a056e021a0900b00310b57cab34mr12798834ild.30.1675090393054; 
 Mon, 30 Jan 2023 06:53:13 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a926b12000000b0030bfdb6ef60sm4008830ilc.58.2023.01.30.06.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:53:12 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Mon, 30 Jan 2023 07:41:14 -0700
Message-Id: <20230130144324.206208-42-sjg@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230130144324.206208-1-sjg@chromium.org>
References: <20230130144324.206208-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 041/171] Correct SPL use of CMD_BOOTZ
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
no SPL_CMD_BOOTZ defined in Kconfig

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index c9f99259054..61caf27bc58 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -150,7 +150,7 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 		/* Try bootm for legacy and FIT format image */
 		if (genimg_get_format(uimage) != IMAGE_FORMAT_INVALID)
 			do_bootm(cmdtp, 0, 4, bootm_argv);
-		else if (CONFIG_IS_ENABLED(CMD_BOOTZ))
+		else if (IS_ENABLED(CONFIG_CMD_BOOTZ))
 			do_bootz(cmdtp, 0, 4, bootm_argv);
 	}
 	if (data->script)
-- 
2.39.1.456.gfc5497dd1b-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
