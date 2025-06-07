Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8982AD0C3A
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jun 2025 11:37:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D8A7C36B20;
	Sat,  7 Jun 2025 09:37:39 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B779C36B1F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jun 2025 09:37:38 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ade48b24c97so19489266b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Jun 2025 02:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749289058; x=1749893858;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5EYlXTukM9iQeWq7o7TCfUj4K5UOPJ1hdlXX00ZZ8vA=;
 b=bD8KUmA6YSF/ECMbf5jUrFdb+tRnaM8S0nOCpPdtYFD9kdaFUVaMF5wnsr77EjMtQu
 Ed5dq2Mv1c/eMNOPUWcjECKtI6gNnd3vN/367iWgWuF2JxVoZ0jEH1o3Rg5FvA8lC0ZV
 2zGaZWu4sm2o4+kOfi52f1JX43d+wCYxBILfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749289058; x=1749893858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5EYlXTukM9iQeWq7o7TCfUj4K5UOPJ1hdlXX00ZZ8vA=;
 b=Elj4bNaTUTCK2rXMkVeMIvA17ex/leUv4rR2PWTzoSm1lZy+xQpCJo2FOmWcESa7cM
 VtylBXH7sn3QQWsB+poJ5cs25+m8ImKQU8YWM+aR5lWCpsBtEuWe+LY9smc25GvKYAqp
 djZyW2+PiOFxAAJg9qnq9YGtrOPLSpFBaMlC152kmNic8ZmGlZyD/DQvM0jTywC7rxNB
 plXmxMRWHvfIBm2LpU/fIQXl+rzv+Tkwyx9yyFjzSrJymHp8oDPbNoZQZCl68t7T6Bwk
 QjctshMKmvdTpOXWqt/OiOoYqAIydOhuY5STg67NUQZWTFXQOuVgeYKYjB6r4RR/mK3p
 2IcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwhUPfg3KTb3Sv0vydh5TRVXgASEFZF9+WzcAFjaKZdWk+Bk/2fVw7Dued4ANnYgPiX58XhFGCVU217A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzi+rUaoBNG8cnngnJuIaWBF7ahP8vVa/w+GOeBe+Jy7+7sGFih
 cBTt0UHX5cFzVh+WKi2P2j2UBumU74EkXN2hSIz38rnWylN3DyIu43cBNMG9mMOrhGg=
X-Gm-Gg: ASbGnctlgww2IovGpMatPzhDUQLvTtrQKVEfOiOIHxyhVr1mPLYeDRtEplHvRIgZwxP
 XgZ7aBvBX4zCId+bGd5QQDFSR/sSdgBJ8b+vBVga4DsLK/1/Y6v64Y4qqwwnZNZgTh8c6kmb7oF
 POHXQW4PSIBwJPifvvoJD9zYdTV999luDE6ejxlmyhAtmIwcMODB96tFbgUZ43NdiwFtNBj9UZX
 P+JiEKLoKhkKSIc/p0uJXcosPI9xuT50zvj4H6bjusF7XF6oBtK2+lVCvclgXfLZNx2snMhjr8m
 9d79EaPr4t8PA6ZxL/zqUEL7+kqLDVCTJ2xozo4wErsVNzU7vyUZiRylkbUprjt8KfnTLOqdsaE
 giTGFt0zKOIqmOp5WRDP33wMCbFwq6a8U99SxytHZxnwETg4h83obXM7g4hOAQjTeWOKxN7fJUX
 QLeP2tLlQeofcH5+f11BaiLZA=
X-Google-Smtp-Source: AGHT+IHBkrZFq8Z8CSmDTiG1wug9eS7FjYIuIGhMsLFN1qp3MnnUthlWFGGwra3brbDS0dZrY9jh5Q==
X-Received: by 2002:a17:907:97d6:b0:ad5:c463:8d42 with SMTP id
 a640c23a62f3a-ade1a9164acmr631631366b.12.1749289057793; 
 Sat, 07 Jun 2025 02:37:37 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc38cffsm246524966b.124.2025.06.07.02.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 02:37:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat,  7 Jun 2025 11:37:11 +0200
Message-ID: <20250607093730.2249536-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 3/9] dt-bindings: clock: stm32h7: rename
	USART{7, 8}_CK to UART{7, 8}_CK
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

As stated in the reference manual RM0433, the STM32H743 MCU has
USART1/2/3/6, UART4/5/7/8, and LPUART1. The patches make all the clock
macros for the serial ports consistent with the documentation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20250427074404.3278732-5-dario.binacchi@amarulasolutions.com
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

[ upstream commit: ecab3c40fa49a2073c4c916ebff9496a6b5db7bd ]

---

 dts/upstream/include/dt-bindings/clock/stm32h7-clks.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/dts/upstream/include/dt-bindings/clock/stm32h7-clks.h b/dts/upstream/include/dt-bindings/clock/stm32h7-clks.h
index 6637272b3242..330b39c2c303 100644
--- a/dts/upstream/include/dt-bindings/clock/stm32h7-clks.h
+++ b/dts/upstream/include/dt-bindings/clock/stm32h7-clks.h
@@ -126,8 +126,8 @@
 #define ADC3_CK 128
 #define DSI_CK 129
 #define LTDC_CK 130
-#define USART8_CK 131
-#define USART7_CK 132
+#define UART8_CK 131
+#define UART7_CK 132
 #define HDMICEC_CK 133
 #define I2C3_CK 134
 #define I2C2_CK 135
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
