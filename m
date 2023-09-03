Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB64790DE3
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:33:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A9E8C6B452;
	Sun,  3 Sep 2023 20:33:59 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9356CC6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:33:57 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2bcb89b476bso11344431fa.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693773237; x=1694378037;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lh96Iey4yAoEHu7XCgWJfV+h34vE2+RDbtaaReeMa64=;
 b=CfRwYZ5uc7T9XPFZFIvJVzqp4t9WJ2IcZoITXSoP9DiPGd8p7bjJ7nimx+32GT4RQy
 V/TFc8GhnfagERNCOXGJhRYCslq1X9/JFNjo9V3N4noqvjG9VN8nRDe8DQ8KhSbu3ZzK
 fAD714QGN0bWUfe+I2mBSX/zwziDPSA16JpmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693773237; x=1694378037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lh96Iey4yAoEHu7XCgWJfV+h34vE2+RDbtaaReeMa64=;
 b=VqvnN8NVy12wtKcFIJGxAsAmRX3GTPdrskOH+Wy0kJHteMSsNqoRMGQVZYxmLUdNYq
 lYCHSsuRQY9YuZXwuQ/VKSvjPjaQzHqbZb1P0h6HbKFQ6sxf9kxef7ddrwraOGt4E+0m
 EADgT+ShHS6HkBZThXA46GjchpogBgWNXSYzmxYpqXoia7S1hBdzUzzbB+4Qn+TLrti1
 +9nH+b0i4wpSqDXmyqrLFRt78kCWgaxsZkXja6sq9cClYBDlK1YjmPDtrkCodlUbIJzO
 tKQHSLv3qiDfmsFfFcpt0qqGJ1ky7dU7QEATch2cS0kaHI79zXkAe5/1ZsuuIiCnrVwY
 BHXw==
X-Gm-Message-State: AOJu0YwasvWQc7FAk3uGW/kydWez7sbEQoYcBeo8Inn/XWLTwyNhEyse
 9ZH9zV/X7dgzSUyxGGMoK1ZUlA==
X-Google-Smtp-Source: AGHT+IFfdPxJq5lkz0w02Xvm418xGGltjK4JarH5VlCRw8GX+R8/zZL3g4AJlKx9zJGD3XIeVxYlEA==
X-Received: by 2002:a2e:b16e:0:b0:2bc:fd50:573a with SMTP id
 a14-20020a2eb16e000000b002bcfd50573amr5982198ljm.6.1693773236717; 
 Sun, 03 Sep 2023 13:33:56 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 pw9-20020a17090720a900b0098884f86e41sm5103232ejb.123.2023.09.03.13.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:33:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:33:50 +0200
Message-Id: <20230903203352.658691-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903203352.658691-1-dario.binacchi@amarulasolutions.com>
References: <20230903203352.658691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 1/3] ARM: dts: stm32: add CAN support on
	stm32f429
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

commit 7355ad1950f41e755e6dc451834be3b94f82acd4 Linux upstream.

Add support for bxcan (Basic eXtended CAN controller) to STM32F429. The
chip contains two CAN peripherals, CAN1 the primary and CAN2 the secondary,
that share some of the required logic like clock and filters. This means
that the secondary CAN can't be used without the primary CAN.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Link: https://lore.kernel.org/all/20230328073328.3949796-4-dario.binacchi@amarulasolutions.com
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---

 arch/arm/dts/stm32f429.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/dts/stm32f429.dtsi b/arch/arm/dts/stm32f429.dtsi
index e5b13aca40c0..22225104fca8 100644
--- a/arch/arm/dts/stm32f429.dtsi
+++ b/arch/arm/dts/stm32f429.dtsi
@@ -321,6 +321,35 @@
 			status = "disabled";
 		};
 
+		can1: can@40006400 {
+			compatible = "st,stm32f4-bxcan";
+			reg = <0x40006400 0x200>;
+			interrupts = <19>, <20>, <21>, <22>;
+			interrupt-names = "tx", "rx0", "rx1", "sce";
+			resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
+			st,can-primary;
+			st,gcan = <&gcan>;
+			status = "disabled";
+		};
+
+		gcan: gcan@40006600 {
+			compatible = "st,stm32f4-gcan", "syscon";
+			reg = <0x40006600 0x200>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
+		};
+
+		can2: can@40006800 {
+			compatible = "st,stm32f4-bxcan";
+			reg = <0x40006800 0x200>;
+			interrupts = <63>, <64>, <65>, <66>;
+			interrupt-names = "tx", "rx0", "rx1", "sce";
+			resets = <&rcc STM32F4_APB1_RESET(CAN2)>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN2)>;
+			st,gcan = <&gcan>;
+			status = "disabled";
+		};
+
 		dac: dac@40007400 {
 			compatible = "st,stm32f4-dac-core";
 			reg = <0x40007400 0x400>;
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
