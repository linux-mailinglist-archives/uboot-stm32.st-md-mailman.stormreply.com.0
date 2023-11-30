Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7AE7FF294
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Nov 2023 15:40:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D729DC6B47D;
	Thu, 30 Nov 2023 14:40:41 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD2FBC6B47A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 14:40:40 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a02ba1f500fso150381866b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 06:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701355240; x=1701960040;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nHtB/gjCqoaGx3nMaIVB0z7NCcHI/Pzgwo1G9q5/xWU=;
 b=WgN9Y/g4CJiRV1Fyws01817dxQk5iHuHJaOFW5uPCUzdIKHHFKjqhQCFP7a9BAvHu6
 1dUpKp8xa8iv4+jgGv61jh7JXVfL3CJ/8Zu0qFhmWDSgXCTTi/oPYTq6ZtOlC7jlK3UE
 W6KzK6vKqT+nBL6I1uT9Qrru8p27AfCV+FVxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701355240; x=1701960040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nHtB/gjCqoaGx3nMaIVB0z7NCcHI/Pzgwo1G9q5/xWU=;
 b=RpvtXzCH/hiVqoTHV3+W5tqn9pXKCSN+K0UGfShQ4lWPGCkYgwRd5PXsaZHZYKH1+D
 JSbabLzy4N7LaloxFsBEpWmiW4+zmnkDPOxcaGtLRijxmENwws8mAG/I6y6Y2rCnWjKb
 bvBGS9QC5L6bNuheYehXk+EQtDBUL4NjHjtaj5fwvo+hJc582+xs/Q/o1shfMg/svnkW
 7CarEfKznZJwSsboyESie22DrxJiGHrLCwRLX1IElDVojCagLLjD1WIoP6/z4Aose9If
 GpO7okT4VnRbNdn3so9nEofY7+juN8t1S7RcjsmBVCq2gaCHx7ccZUXTANU/3jfmj4To
 RZxQ==
X-Gm-Message-State: AOJu0YwjahhQ8u6+ZOp8eOw+doBYM0WrZ4QbJIkILa23TbZtl28O+8E8
 /9uH6oyhV+bkApmDPvAIbj3ggA==
X-Google-Smtp-Source: AGHT+IGH+tpbxu5/Iz+WVP1mjeVt7A/I9rdfSN22nQ12xWfWAYbhlSJ5UPNKMBB+0/lesec7E0/7Aw==
X-Received: by 2002:a17:906:7e05:b0:9ae:74d1:4b45 with SMTP id
 e5-20020a1709067e0500b009ae74d14b45mr17412283ejr.65.1701355240337; 
 Thu, 30 Nov 2023 06:40:40 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:d1eb:b106:516d:db0a])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a1709064a9500b00a18399ff790sm733470eju.215.2023.11.30.06.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:40:40 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Thu, 30 Nov 2023 15:40:02 +0100
Message-ID: <20231130144033.1850298-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130144033.1850298-1-dario.binacchi@amarulasolutions.com>
References: <20231130144033.1850298-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [RESEND RFC PATCH v2 1/5] ARM: dts: stm32f469-disco:
	sync with Linux 6.5
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

Sync the devicetree with linux 6.5 for stm32f746-disco board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
- Add Patrice Chotard's Reviewed-by tag.

 arch/arm/dts/stm32f469-disco.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/dts/stm32f469-disco.dts b/arch/arm/dts/stm32f469-disco.dts
index 6e0ffc1903be..c9acabf0f530 100644
--- a/arch/arm/dts/stm32f469-disco.dts
+++ b/arch/arm/dts/stm32f469-disco.dts
@@ -119,7 +119,7 @@
 		};
 	};
 
-	panel-dsi@0 {
+	panel@0 {
 		compatible = "orisetech,otm8009a";
 		reg = <0>; /* dsi virtual channel (0..3) */
 		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
@@ -138,7 +138,7 @@
 	status = "okay";
 
 	port {
-		ltdc_out_dsi: endpoint@0 {
+		ltdc_out_dsi: endpoint {
 			remote-endpoint = <&dsi_in>;
 		};
 	};
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
