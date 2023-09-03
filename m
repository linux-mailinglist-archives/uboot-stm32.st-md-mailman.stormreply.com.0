Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD9E790DF6
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:49:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B60DC6B44F;
	Sun,  3 Sep 2023 20:49:01 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E5E4C6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:48:59 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so124946366b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693774138; x=1694378938;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j7MgzMUgLOIoOxHVOIHBX1f8KoDdp05bomfoJMS2h+Q=;
 b=YsNUcGMYhWOi24yVU5/sZaeTeoTEpPdPrcbAZtsV0J8qlkOE7TtOf0ZcgiN4DVEZaB
 YC4UZEfi0AwncmuEBvilcnXOtG5Zyo4Vk4xnMs7GKb6DGB9iu6T9u+vgFqCshGuU4s1U
 GQqWp+Ykf8x3rWAVV7i9lbeeMce6XedZv0vEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693774138; x=1694378938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j7MgzMUgLOIoOxHVOIHBX1f8KoDdp05bomfoJMS2h+Q=;
 b=dEwxSSSK8lovj7nXJBj3nbX2A4phBKn3bd5X9+lTovdXe0wbDAPPIruAIV1j8wEJuU
 GZ3gk6p7pwypZSm5Yo0VssuaKj2SK45n9PHBe8Ha6AARj/UnWPDtEiwjXMNSw20urC3T
 eLcbdc4sq2nO/bFKauTF2dBqWyIgAFos1sb7K5KmWj9RLd52znXIIwgeCH3/1ZSpAGW/
 L2fEuhOIrOVQ5zCRYb4Tm4VcpqJM2w7hMgbDaoDugRFQs7UyCQ/HtZZADiUizJIIRX08
 hts+6yFj7lb9qAynxciuPaD2tml49hNp6uMNaS+UMsrLnjF3t2N64BMfmEzTrKxHt3/0
 cl+w==
X-Gm-Message-State: AOJu0Ywc5RMJVhHmJxizmcg0gY4WxWm8dyzc5d9VoPLHXaAb9q+MgJr4
 hA0y49R9TERdk/A4QDkc8gHGhrc+DgBKZgM9K8TjaA==
X-Google-Smtp-Source: AGHT+IFkPVaiHP4mgGp02Yh3rtCCcpTINMxvW8wPiTNv1OzzRWb3emrQJGcy3G7CrBp12ziHbWT0Pg==
X-Received: by 2002:a17:907:7751:b0:9a2:28dc:4168 with SMTP id
 kx17-20020a170907775100b009a228dc4168mr6119502ejc.61.1693774138798; 
 Sun, 03 Sep 2023 13:48:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a170906131600b0099d9b50d786sm5182466ejb.199.2023.09.03.13.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:48:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:48:44 +0200
Message-Id: <20230903204849.660722-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
References: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 05/10] ARM: dts: stm32: add pin map for i2c3
	controller on stm32f7
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

commit 0637e66f8250c61f75042131fcb7f88ead2ad436 Linux upstream.

Add pin configurations for using i2c3 controller on stm32f7.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
---

 arch/arm/dts/stm32f7-pinctrl.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/dts/stm32f7-pinctrl.dtsi b/arch/arm/dts/stm32f7-pinctrl.dtsi
index 000278ec2c58..607fe42f4f46 100644
--- a/arch/arm/dts/stm32f7-pinctrl.dtsi
+++ b/arch/arm/dts/stm32f7-pinctrl.dtsi
@@ -172,6 +172,16 @@
 				};
 			};
 
+			i2c3_pins_a: i2c3-0 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 8, AF4)>, /* I2C3_SDA */
+						 <STM32_PINMUX('H', 7, AF4)>; /* I2C3_SCL */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
 			usbotg_hs_pins_a: usbotg-hs-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 4, AF10)>, /* OTG_HS_ULPI_NXT */
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
