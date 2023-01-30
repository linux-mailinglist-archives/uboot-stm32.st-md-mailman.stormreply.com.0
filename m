Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A556813DD
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jan 2023 15:55:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03A6BC65E6E;
	Mon, 30 Jan 2023 14:55:26 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A92DC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 14:55:24 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id d10so5176494ilc.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 06:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=smwjvcpqrNDxSYvgO8hh3+CR7mBdORbhCBy07vxsWxQ=;
 b=bETgSFZVgZ056rujRiOFO3D+2cjwI82JUK82YXEgw09K/oAjgxlO3OsnRnpJpnIvbB
 /WDkIFEUK5JgJ9BKOH6az2mKrseGENRJJ//UcNrD0hgZja7SN8oJ1qa/zn8/TM1NS1QK
 gju3mGE5ckXRA/UeWtlptX93R1wO/MTjobpOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=smwjvcpqrNDxSYvgO8hh3+CR7mBdORbhCBy07vxsWxQ=;
 b=Rn0bOKk9lO3hewEcSTC1THaELT6CgaVkRtLe6xxth8F7KVyhbmnAx3vYBy5jKMthsR
 x0+e7LxgrEtP7By3IXCnprq7KWPh8x9M5mcDvRI32ckgCGzx/JaTaQKIVN0lJE7fuUKu
 2Fb0qBqJXWEuDfXJirn3uKRKVGrm/LWajFPmu7TB5aC5bYfpT4Yw6J3mlitC1IkPSAs9
 Yzz+bN5Ag+ir2aCh2BN69bN1SQwu23GSAieNmpxMwOD/GZOtQNaM3f5AAXNzYXsIDGvw
 6ScjvD7H69UJX5aoWOdYNP7IY944QLsy0wr6ZQtCVRkMhf0EaZtSB2/qbeoVTtG6EZTt
 PDJw==
X-Gm-Message-State: AO0yUKXbWt/wHKi8Kx9wLQ/0F9bU0nc9J0sDyMu/YNPXrtL0o8t0yiHb
 0FKQqjnfmo6sK/jHMqA3NzWKonUJqd8h14Zj
X-Google-Smtp-Source: AK7set863swyODHjUOkx3+TaTihjig+oMM5I1JBrQIs/XxhRYxnkJLC/KrHnbgWiTVuRUwIVOKGRMQ==
X-Received: by 2002:a05:6e02:1c21:b0:310:eb06:cccf with SMTP id
 m1-20020a056e021c2100b00310eb06cccfmr4325910ilh.8.1675090523528; 
 Mon, 30 Jan 2023 06:55:23 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a926b12000000b0030bfdb6ef60sm4008830ilc.58.2023.01.30.06.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:55:23 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Mon, 30 Jan 2023 07:41:33 -0700
Message-Id: <20230130144324.206208-61-sjg@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230130144324.206208-1-sjg@chromium.org>
References: <20230130144324.206208-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 060/171] Correct SPL use of CMD_STM32PROG
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
no SPL_CMD_STM32PROG defined in Kconfig

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 board/st/common/stm32mp_mtdparts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
index bc2ce600287..b866dd5038c 100644
--- a/board/st/common/stm32mp_mtdparts.c
+++ b/board/st/common/stm32mp_mtdparts.c
@@ -96,7 +96,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	case BOOT_SERIAL_UART:
 	case BOOT_SERIAL_USB:
 		serial = true;
-		if (CONFIG_IS_ENABLED(CMD_STM32PROG)) {
+		if (IS_ENABLED(CONFIG_CMD_STM32PROG)) {
 #ifdef CONFIG_STM32MP15X_STM32IMAGE
 			tee = stm32prog_get_tee_partitions();
 #endif
-- 
2.39.1.456.gfc5497dd1b-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
