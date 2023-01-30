Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AABAD6813F0
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jan 2023 15:58:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D1D8C62EFE;
	Mon, 30 Jan 2023 14:58:31 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 427F9C65E6E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 14:58:29 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id z2so4621442ilq.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 06:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gppPPtWucEaEcxTnREYnWKobU3Xpnb5iDsz83gRFHMU=;
 b=CtzbXr5dvaQox9pJF3YC72AfEcPKoWBbeOyquZF0JnmGxJMypfG1EsHcWPCCWC6Y1B
 MoqmIUnLzr1OA5GhH5KL9q4U97gfj+4MW1HlAStiNJFGRY40WNk0HihFn8gO63E/dvSm
 tMtPqiguS7VmuI2qKDhcZNEwHN59aBZ1HGob8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gppPPtWucEaEcxTnREYnWKobU3Xpnb5iDsz83gRFHMU=;
 b=FfffY/7FDZDV5G8otDO4QnCwk0Cto13X03HXSRMeEGoWP3wmVbDauEhHXeJ2sdvFdh
 2t20ZScirqc5yfamAWTjxm1Se1/kz6JtxMHCBqrLC3bkboSEXG2Zt5Nd7PcfL+J9G72g
 nklQPLdGHhWbkxqHoPB+ZLMPVHNbNuS4tn1JCP1L7YzNfbdx9HL4x4hbWLm53iNhaNpq
 RuS4BFl0MZFqcKjvC3YHdbppaG0pQ2mKjG3c8xR4/4aBGESK24mhpKTjdTRdcfe3TGdi
 EX1tbA6Te61X6bIGKd6TnJ/IOM3oLaakKtaKPLmk6GqqcIglAPj5Gxia+HfO1+CxL5gl
 Pjww==
X-Gm-Message-State: AO0yUKU6jtmLLjMcWS74cOU/U9/HFftKRl6wksK6Zw6rifWYFPXB/XqW
 kuWR+JpELSTAA3JbPt2BK9iQwlskcCL+rPv+
X-Google-Smtp-Source: AK7set+HU+XyaGF/YFU9SssZjYv6jwKXYBF3211dwyn4xZhh2D/7wmJq8R8mQRXtr4GW4ATRwd0fng==
X-Received: by 2002:a05:6e02:1b05:b0:310:fa98:25cf with SMTP id
 i5-20020a056e021b0500b00310fa9825cfmr2155102ilv.19.1675090708273; 
 Mon, 30 Jan 2023 06:58:28 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a926b12000000b0030bfdb6ef60sm4008830ilc.58.2023.01.30.06.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:58:28 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Mon, 30 Jan 2023 07:42:03 -0700
Message-Id: <20230130144324.206208-91-sjg@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230130144324.206208-1-sjg@chromium.org>
References: <20230130144324.206208-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 090/171] Correct SPL use of FDT_SIMPLEFB
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
no SPL_FDT_SIMPLEFB defined in Kconfig

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 board/st/stm32mp1/stm32mp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 7cff9e3d860..5e89192ec03 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -930,7 +930,7 @@ int ft_board_setup(void *blob, struct bd_info *bd)
 		if (IS_ENABLED(CONFIG_FDT_FIXUP_PARTITIONS))
 			fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
 
-	if (CONFIG_IS_ENABLED(FDT_SIMPLEFB))
+	if (IS_ENABLED(CONFIG_FDT_SIMPLEFB))
 		fdt_simplefb_enable_and_mem_rsv(blob);
 
 	return 0;
-- 
2.39.1.456.gfc5497dd1b-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
