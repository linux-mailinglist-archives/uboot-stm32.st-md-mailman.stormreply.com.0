Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 628B0790DE5
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:34:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BF15C6B452;
	Sun,  3 Sep 2023 20:34:01 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FBC6C6B454
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:33:59 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2bce552508fso11583271fa.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693773239; x=1694378039;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sD2hlYlCgVuW77uU7td9BkSqqVZKqgGImD1ny70Cgk8=;
 b=UzD2Yud2MX6lREwrIeKUL0I5FvY42aijpphjFRDE6FMrZx/b7YtiatvOr/NPy+Q+l5
 APMzLCG/rYL/FjJ2+J5hDzcuHtuhcnL4H+AURF2nwxh+L8Q4b7OXVP7tWy6MzCjmPjug
 6U8TfBV77+iV4Y2WWKsa0Vrn8EsTXscAtmbx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693773239; x=1694378039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sD2hlYlCgVuW77uU7td9BkSqqVZKqgGImD1ny70Cgk8=;
 b=lHkOZNeQ897lilMqlVeabb1RlIqUBYM1L26JuxlU7C3FCvBmC/jOSGWxJjnvahHXaL
 SVzAi434IN7hjuoHNwwv1frZzuJ8lwy8nilA1PWabdrEIPJ6pQBs1Y5OjDys3FrfgN57
 fgiDqyTFNX21mRx94d9LlZORn3XX2tiGJgO3fJcI6CtN9J6P/ljDOJFOreLX5gxN2IwV
 vfruHqVY8STNABI1amHbFEvHEH6yKKQHbCSjFgoQHzv+j0PCdkJnc/DtZKBYx9Bwyjnk
 Sp5jDSotN66iBDRErd0mBhNtdgNcQnhTmz4X1j6tIlEdL2KuKs7SyhLO0q5qFUcoCN/Z
 Vu9g==
X-Gm-Message-State: AOJu0Yzfi1DI8h0Xw8Iv1eoTUlQ5cXrXWZaZHstvF7G03EkslQCWDF3E
 KxxCDVw+Sq7QNyGZfoPKuji5VQ==
X-Google-Smtp-Source: AGHT+IHbt/tGXxwRItjjCYYthkLlY11NA6kxY6S3nYRYgum6PIYquSnkon8xKeF5RcI5LoHQFUpKHQ==
X-Received: by 2002:a2e:a401:0:b0:2bb:a14c:f6de with SMTP id
 p1-20020a2ea401000000b002bba14cf6demr5821058ljn.21.1693773238951; 
 Sun, 03 Sep 2023 13:33:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 pw9-20020a17090720a900b0098884f86e41sm5103232ejb.123.2023.09.03.13.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:33:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:33:52 +0200
Message-Id: <20230903203352.658691-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903203352.658691-1-dario.binacchi@amarulasolutions.com>
References: <20230903203352.658691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32f429: put can2 in
	secondary mode
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

commit 6b443faa313c519db755ff90be32758fd9c66453 Linux upstream.

This is a preparation patch for the upcoming support to manage CAN
peripherals in single configuration.

The addition ensures backwards compatibility.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Link: https://lore.kernel.org/all/20230427204540.3126234-3-dario.binacchi@amarulasolutions.com
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>

---

 arch/arm/dts/stm32f429.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/dts/stm32f429.dtsi b/arch/arm/dts/stm32f429.dtsi
index 22225104fca8..8133ea15b036 100644
--- a/arch/arm/dts/stm32f429.dtsi
+++ b/arch/arm/dts/stm32f429.dtsi
@@ -346,6 +346,7 @@
 			interrupt-names = "tx", "rx0", "rx1", "sce";
 			resets = <&rcc STM32F4_APB1_RESET(CAN2)>;
 			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN2)>;
+			st,can-secondary;
 			st,gcan = <&gcan>;
 			status = "disabled";
 		};
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
