Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E93186EB985
	for <lists+uboot-stm32@lfdr.de>; Sat, 22 Apr 2023 16:02:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC36CC65048;
	Sat, 22 Apr 2023 14:02:43 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7926C0356E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Apr 2023 14:02:41 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-506c04dd879so4554032a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Apr 2023 07:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682172161; x=1684764161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CuGmcrV8zvOoX0beJnYUe2t7Fw/qc0NrO9YKi+mp+Hg=;
 b=Msm3jpGwbMvDV9NAqphCIPu1hheMqE93RrG6UPz0IutfGqChYRto7XgrZOaVruktJP
 9BLmI2FzRxPyk+EcMU0abNeIKcv+DLRf8/GuFtgxUBfwF9R1nYrm+qRsdwel8p653Ko0
 qXIevNsI/u2Tp9pRT7rPIiYIDi45ekG8ynRWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682172161; x=1684764161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CuGmcrV8zvOoX0beJnYUe2t7Fw/qc0NrO9YKi+mp+Hg=;
 b=CQI1iKOszF+6aJ/xpQNYvCOQRPkucQGLmBW3D2OLzNqOUipnFJkRkEni1+U+W/HJEf
 xxl2EIp7lovY3nRW3atiUpqE7nhGNzc9qhM7vX+YJbf2SW8lEc1P+UvzNPzRsMIHQOkn
 8o6fZOYIqM+/dLsXLNwTy89QqCxbkVemoTLhj0GssYhMURqg6rUBA3klRjANl92Wsx7t
 GoANsOjzYGTTv332uOM4O1x1dS9DxadQrU00v34phnA6Tlb4gi0M+dGqXB9BGxwTESUt
 xH9lymyGz8mlnw/IBvUkJ2wDMO0+eN+UvVVbbqFPE0XtFTXIqj0tPc8HDUenJv/H2z7I
 99DA==
X-Gm-Message-State: AAQBX9f9AhXX9SH7bQdJgkB+WJLfU6F6AWR51YrG9fKMzlwrwz3N06UO
 DcPlKQgwvnG3we7fmYf/hjpzZA==
X-Google-Smtp-Source: AKy350bJl5yWrNGXxRv6AHXxgc+HNd3HdtGnLFoqB3ZSKVCILm2Ws4mEdPanihvrxJnx1ENlkPHaCg==
X-Received: by 2002:a17:906:63d1:b0:94f:cee:56f2 with SMTP id
 u17-20020a17090663d100b0094f0cee56f2mr5015182ejk.4.1682172161270; 
 Sat, 22 Apr 2023 07:02:41 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-99-194.retail.telecomitalia.it. [87.5.99.194])
 by smtp.gmail.com with ESMTPSA id
 sd14-20020a170906ce2e00b0094f5d1bbb21sm3294928ejb.102.2023.04.22.07.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 07:02:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat, 22 Apr 2023 16:02:36 +0200
Message-Id: <20230422140236.616419-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32f769-disco: remove the
	dsi_host node
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

The node has become useless, as described in the
commit 754815b854258 ("video: stm32: remove the compatible "synopsys, dw-mipi-dsi" support")

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/dts/stm32f769-disco-u-boot.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
index b5198fddff7c..2c823cce98b4 100644
--- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
@@ -28,11 +28,6 @@
 		button-gpio = <&gpioa 0 0>;
 	};
 
-	dsi_host: dsi_host {
-		compatible = "synopsys,dw-mipi-dsi";
-		status = "okay";
-	};
-
 	led1 {
 		compatible = "st,led1";
 		led-gpio = <&gpioj 5 0>;
-- 
2.32.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
