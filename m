Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8C3AD0C39
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jun 2025 11:37:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 943F1C36B2B;
	Sat,  7 Jun 2025 09:37:37 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AD23C36B2B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jun 2025 09:37:37 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ade30256175so209036366b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Jun 2025 02:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749289056; x=1749893856;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vIZOBsaFYYEjxcHR9lV+uTimm4H/Ly/1YE4Yh6CRGkY=;
 b=pF2TQJUQnCypzvsjc9lFubKvC3RNqmXJXn92sCkEiLKv4Hp4i8pbeW+087wXhaAhMm
 c9Ot6dLi6XtfuN6JNiZerQu6hrqv2jshOnLB38y546L415r8a6LLHUoXZakhMO6to4S9
 Ieqp3BaK0XVhQ8wO7/MURwyz9iC+yBYFCxAWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749289056; x=1749893856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vIZOBsaFYYEjxcHR9lV+uTimm4H/Ly/1YE4Yh6CRGkY=;
 b=fGL8RxUdj1agusnf3NYqk0DH4DXB/uK47vvoA2sHgY3/puCj/j8NzZGPvahkbefT1N
 cu6eTwbAc3WPG8rgMYWD5/6KxO8nfLTTN61ESU75vTPf8PVlpCZgAwJFPBbGNZBNNuCz
 +RR8zXQZLhvH2S4zz2aEgvhKGP3SUqZqnpK2dgwFXdgU/zNNx+ETJrEc4JjirdK1vuk+
 DpR3KT6ldXcHTKcCeRULe5LUcihebACYQUTEOQRhm/v2hIh/X8IYKAsssWLQQVM+aNeY
 og/Kn5LxzHlUzez6rzA1Jq+/dIf9zp9NLGraiUQ8b1fQAg4FIX2dV6Sa9xb5e494HFWh
 xZww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvDkZMkiKLdgHWB2iQp1FhWStFbh08b2zkAhqss2/3a4hixuPlh8sEdXRKZcVgxMIIAW4NKZqcx9HIOg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwilrUo0001OUTVykS/zqV4xWiYt+57HRG5QhzxcPagAPw0hLan
 ElH+7/wtlRnEvGVa3PuMMyUBfb5W/gmyPap2agZSVqEJaYgegvX6O4bCABXXLUnDx6qRvRdsdbL
 xv8Ms
X-Gm-Gg: ASbGncsIuI/DuIGoIkIt1ufZ9uOwCqvwWwaK2xNIFSQEXZkWSWUubEtT5cHq5NLiZa6
 x99/LdTxAJTF5xa4a383FNgymOI/wEY0N6XabJv7Ko33/flDQcV310p/CCgiK7/WIBV/tNJe3Ud
 thDw54EGoWT0dG3IMDYjsRM/nGJL7EJ3mXzgTlFtNqQfjeEG7idjO6mttX3IIPwGpbcxOd8an/C
 mTe2CvO8zJx5Ft6CX3L6Msp/nJg4VZr9ovIaFDONAiHD2+t/wQadWwFB/zwkHmsNJeKv9VLaoqK
 ir/GQy5BtfRSPJce4CcJG4UHTz1pAo/qO2iBBHBiQ0tT1AMijxSEih4GYg5w654nHxfYg+nMLYQ
 q21Lo9ogaOEhXL4rrgUGrqpDqlkF1TYAnmNeFgf3cKwSVZALDFLly7xed+ekWV3v7I7Othl4Abn
 dVY/9pwR5P9yAh
X-Google-Smtp-Source: AGHT+IFAdqnB+dLeUsyPjUsfpZI5jwFPAUcSwSLXQx8GQZPR2e3lgnPNhna3Qs6fUHoedNIahRsZhQ==
X-Received: by 2002:a17:907:805:b0:ade:3bec:ea40 with SMTP id
 a640c23a62f3a-ade3becfd3bmr193018566b.10.1749289056123; 
 Sat, 07 Jun 2025 02:37:36 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc38cffsm246524966b.124.2025.06.07.02.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 02:37:35 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat,  7 Jun 2025 11:37:10 +0200
Message-ID: <20250607093730.2249536-3-dario.binacchi@amarulasolutions.com>
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
Subject: [Uboot-stm32] [PATCH 2/9] dt-bindings: arm: stm32: add compatible
	for stm32h747i-disco board
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

The board includes an STM32H747XI SoC with the following resources:
 - 2 Mbytes Flash
 - 1 MByte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20250427074404.3278732-3-dario.binacchi@amarulasolutions.com
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

[upstream commit: 815d49f61ea049075482161f897aa13e1ae30cbb ]

---

 dts/upstream/Bindings/arm/stm32/stm32.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/dts/upstream/Bindings/arm/stm32/stm32.yaml b/dts/upstream/Bindings/arm/stm32/stm32.yaml
index b6c56d4ce6b9..a0660a0b494f 100644
--- a/dts/upstream/Bindings/arm/stm32/stm32.yaml
+++ b/dts/upstream/Bindings/arm/stm32/stm32.yaml
@@ -42,6 +42,10 @@ properties:
               - st,stm32h743i-disco
               - st,stm32h743i-eval
           - const: st,stm32h743
+      - items:
+          - enum:
+              - st,stm32h747i-disco
+          - const: st,stm32h747
       - items:
           - enum:
               - st,stm32h750i-art-pi
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
