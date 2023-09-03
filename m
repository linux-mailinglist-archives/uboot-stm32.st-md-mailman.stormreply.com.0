Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7FA790DE4
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:34:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22AD0C6B455;
	Sun,  3 Sep 2023 20:34:00 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AFB8C6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:33:58 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2b962c226ceso12778981fa.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693773238; x=1694378038;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MEeomf7ZPFQybaRfXvdW6XL/l95ik8glYfxOcn+2XI4=;
 b=EOTEGgiWkuH3K1Ut55midB+LczxzJG6nUMotis5lOyhKNQFvS1oVJN2wl/uN9rObfs
 FJnZsGvhg3SBUDpi7KXZAbopWShR+v4Afts3izsAN2NKDLiwrZXWubZg8nBjAWaTl48j
 ioCQuJOuKEX1jhzlbWQEIjFgrvnhyBcjpJ9w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693773238; x=1694378038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MEeomf7ZPFQybaRfXvdW6XL/l95ik8glYfxOcn+2XI4=;
 b=BznizoJD5Zh9R5GyEqp4VWWNF6t5F+w3Cao7YH/cysXlssaro49fohRzsRYC9bV6cA
 M85UUE2XMlyWpar8ga5McNbyvNQQyF0b1lkOj35QzS/vJsfTFlO24H9B0J20VoRXiOAM
 vS9oYACJde0AE4ruOcsdlXUf8o+VWJNqvaJAof5N+HHkBq+Hr765GyOBhcrBijFhHx+B
 iE8wLaN5GhyFd11Dz0OKVVfpGzTIAuxU6fAmh93iMKZ/fYDoTIhJmOe4UTIEqeCF2SbK
 wkmAwKti9W+hORifsFoGJ1THFOnDmpDQxKawulbE/t61euck2ejb5bCzw0NRLkNNKp9t
 FFSw==
X-Gm-Message-State: AOJu0YzpwwkShvZd2PHjYH0HdfQSo8zx5EFR8jBUNKLZiiZ6QtP2TfDk
 hjRvYgo4cX1iAc5v1mCkp5zaCA==
X-Google-Smtp-Source: AGHT+IEoaCH60V/tG+PSeJ1dGrxbWfPcKes0xUV84X+2vQ2YNzEGdX0F4JbShW1vPAmLZSJ/dspgcQ==
X-Received: by 2002:a2e:b70d:0:b0:2bd:133c:58ff with SMTP id
 j13-20020a2eb70d000000b002bd133c58ffmr5294506ljo.48.1693773237816; 
 Sun, 03 Sep 2023 13:33:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 pw9-20020a17090720a900b0098884f86e41sm5103232ejb.123.2023.09.03.13.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:33:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:33:51 +0200
Message-Id: <20230903203352.658691-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903203352.658691-1-dario.binacchi@amarulasolutions.com>
References: <20230903203352.658691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 2/3] ARM: dts: stm32: add pin map for CAN
	controller on stm32f4
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

commit 559a6e75b4bcf0fc9e41d34865e72cf742f67d8e Linux upstream.

Add pin configurations for using CAN controller on stm32f469-disco
board. They are located on the Arduino compatible connector CN5 (CAN1)
and on the extension connector CN12 (CAN2).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Link: https://lore.kernel.org/all/20230328073328.3949796-5-dario.binacchi@amarulasolutions.com
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---

 arch/arm/dts/stm32f4-pinctrl.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/dts/stm32f4-pinctrl.dtsi b/arch/arm/dts/stm32f4-pinctrl.dtsi
index 46815c965d59..0adc41b2a46c 100644
--- a/arch/arm/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/dts/stm32f4-pinctrl.dtsi
@@ -412,6 +412,36 @@
 					slew-rate = <2>;
 				};
 			};
+
+			can1_pins_a: can1-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 9, AF9)>; /* CAN1_TX */
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 8, AF9)>; /* CAN1_RX */
+					bias-pull-up;
+				};
+			};
+
+			can2_pins_a: can2-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 13, AF9)>; /* CAN2_TX */
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 5, AF9)>; /* CAN2_RX */
+					bias-pull-up;
+				};
+			};
+
+			can2_pins_b: can2-1 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 13, AF9)>; /* CAN2_TX */
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 12, AF9)>; /* CAN2_RX */
+					bias-pull-up;
+				};
+			};
 		};
 	};
 };
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
