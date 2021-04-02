Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A66352786
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Apr 2021 10:43:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 908E2C58D60;
	Fri,  2 Apr 2021 08:43:04 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFD50C58D5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Apr 2021 08:43:01 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id s21so2420405pjq.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Apr 2021 01:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U+lVEi+Nlbbec98WTktu0IYaWADpYyyAYCg/xrwOcj8=;
 b=Ob/9EzoMbw79zFvCQqAVaDGX9d2lJHQc6ReqRKIP4BVjATnyzR+kbfvvathn0E1Zdy
 x9yh5bLlgz8/0BxRTn4n7r4dcFeg6WYCW9iXrY1kmlI2MrYlgE/GQSCbKW3Ecpq6vRBL
 YIZ2JWqdMRBouSrslSX5mSpQk7rR9HefZSaM6lB6OkjMEYBAOeAk0zl/LMQb3uawUbYk
 iRgAsoAHRsppKwYw4cEoQ1OukTBi9RuBm1ZJDj8v7sZEQYG6e3vtIiAQDKpsttGSpBTX
 vhGTs4yZxA34zGQYjKb1MhAgvFbYVADn37Jw0eyNnWgl1lJt1wQxy8FRkbxDOcZG9vgC
 14Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U+lVEi+Nlbbec98WTktu0IYaWADpYyyAYCg/xrwOcj8=;
 b=iEVYVtCSmz5Pk1GCjIGNRVsJ8VLwyuUw5mZGRBBeALzpMkKigqB4Gutkeu7TkTxgrw
 ON3PWrUKI/Dt3sMTxDvD+/k+7Fvr+UBGkTU2xLDorSzMahqhYAW0fQ/AtvzHmLkAqw0K
 8iD3C+3vzZG72stxJBmtzWmDA7AyxNX2hn7t7VZK1qWbH9oXyewEdQz2K6AHE4gu0RQz
 fF/SAy13WimRMbgWpqfzPVPlx5t+M8jCsnX5kkSTExNA+wIKiWoIGAXouXQagc1k67qj
 yyRW1Ko3C8hZ6/FN3PCTI9xEXuuFQ69wW1AykAPakx7LTEOpPUb0t0gYGsERKGIp/quI
 Bznw==
X-Gm-Message-State: AOAM532nM+5yRONb4nfdvvwor/qZNEiFUhNbNTxsaYFE8dJdbl2VSD9D
 YrZLgpfi8Z7O033fE8I0+8w=
X-Google-Smtp-Source: ABdhPJzWN6qSd14vwjPFta1bC7ldm8HSl7R1I6WDHHjoxoFP0ohXaBY4V0Kyqotv7Akb8h6iTz3N8g==
X-Received: by 2002:a17:902:e986:b029:e6:bffd:f465 with SMTP id
 f6-20020a170902e986b02900e6bffdf465mr11593555plb.35.1617352980553; 
 Fri, 02 Apr 2021 01:43:00 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id fs9sm7359708pjb.40.2021.04.02.01.42.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Apr 2021 01:43:00 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 sjg@chromium.org
Date: Fri,  2 Apr 2021 16:42:37 +0800
Message-Id: <1617352961-20550-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
References: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v4 3/7] ARM: dts: stm32: add new instances for
	stm32h743 MCU
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

Some instances are missing in current support of stm32h743 MCU. This commit
adds usart3/uart4 and sdmmc2 support.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
v4: sync with kernel side commit
link:
https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git/commit/?h=stm32-dt-for-v5.13&id=4e1593391fa38c0a8ec0f314f37ec5543475bf9d

 arch/arm/dts/stm32h743.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
index 8c96698..77a8aef 100644
--- a/arch/arm/dts/stm32h743.dtsi
+++ b/arch/arm/dts/stm32h743.dtsi
@@ -99,6 +99,22 @@
 			clocks = <&rcc USART2_CK>;
 		};
 
+		usart3: serial@40004800 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40004800 0x400>;
+			interrupts = <39>;
+			status = "disabled";
+			clocks = <&rcc USART3_CK>;
+		};
+
+		uart4: serial@40004c00 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40004c00 0x400>;
+			interrupts = <52>;
+			status = "disabled";
+			clocks = <&rcc UART4_CK>;
+		};
+
 		i2c1: i2c@40005400 {
 			compatible = "st,stm32f7-i2c";
 			#address-cells = <1>;
@@ -332,6 +348,20 @@
 			max-frequency = <120000000>;
 		};
 
+		sdmmc2: sdmmc@48022400 {
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x10153180>;
+			reg = <0x48022400 0x400>;
+			interrupts = <124>;
+			interrupt-names	= "cmd_irq";
+			clocks = <&rcc SDMMC2_CK>;
+			clock-names = "apb_pclk";
+			resets = <&rcc STM32H7_AHB2_RESET(SDMMC2)>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <120000000>;
+		};
+
 		exti: interrupt-controller@58000000 {
 			compatible = "st,stm32h7-exti";
 			interrupt-controller;
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
