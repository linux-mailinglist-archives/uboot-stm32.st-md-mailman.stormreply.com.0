Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1AB790DF8
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:49:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C9E9C6B457;
	Sun,  3 Sep 2023 20:49:03 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 606F5C6B452
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:49:01 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so3615361a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693774141; x=1694378941;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vIMwPnf2KQnrkWiWwfMYgbkvgGlWh3QijdH1mDNaSoA=;
 b=QxLzE9fAX2JJMPMxmshPuTsRPZHv22if/7GPDFiSd4hB93s5FqCsBdJvulrYRhr/+8
 BdkmcAQLgkWBOGlNZgsQp4mB7qbm2HxHmTYyxW6BJUAe7XgCAESuhui7d5GZaY+sZJI8
 1L8uVIFN80u6WM0w7Q02eDH8oh9MojsQMvrpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693774141; x=1694378941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vIMwPnf2KQnrkWiWwfMYgbkvgGlWh3QijdH1mDNaSoA=;
 b=DRRAmRuJ5s1T0Uz7n8Wp6aYSk0haJufdl6q1CSLb8gdlQiI4WHi4zZMEGt0nbT09tS
 rQadNkGTmYO8uMOWzDYc5ZEhibWENpkfWbj1Mi1x0QDIckGKDLnGJQKCv1rYototAvnP
 8XO9hXQfxJKt1xFKAT3kUJDFN0C4ZIaP/Zdtkc3aWhkWt4fKcizNQgqATy/fjSXkoTMb
 rvzkg47QePXytUQg6ufj4oIhLs9RpiZWJVKC4sTzmU1loen/ZGe+4AEE94A1/mAp2StP
 ah9FcrAIrNwptKRGD7OcRAVtTzTxhnDouk5aiVFQEua3PNXNFHWyyGWMZWIIDOCp+E8Y
 wyLw==
X-Gm-Message-State: AOJu0YzhibgR3/w15STpK2obBBTiyWfgpR9icESdfelFlXqYX7AaVdJV
 vHmfUrWa3tZbpnu82bNTRW2iDw==
X-Google-Smtp-Source: AGHT+IHFZ2TerddQ2KyFdUXs9W3CyQPLsWEmXdbNuNAwv/44LIhK8VGc+0aAnkpjhdTr2zurT+Ok+A==
X-Received: by 2002:a17:906:76c9:b0:9a1:fc1e:19b8 with SMTP id
 q9-20020a17090676c900b009a1fc1e19b8mr8754101ejn.29.1693774141061; 
 Sun, 03 Sep 2023 13:49:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a170906131600b0099d9b50d786sm5182466ejb.199.2023.09.03.13.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:49:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:48:46 +0200
Message-Id: <20230903204849.660722-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
References: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 07/10] ARM: dts: stm32: add ltdc support on
	stm32f746 MCU
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

The patch applies the changes from Linux commit 008ef8b3a1a00 ("Add LTDC
(Lcd-tft Display Controller) support") and removes the same settings
from stm32f746-disco-u-boot.dtsi.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/dts/stm32f746-disco-u-boot.dtsi | 18 ++++++------------
 arch/arm/dts/stm32f746.dtsi              | 10 ++++++++++
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
index 522cffb1ac9f..3c2b9fc59512 100644
--- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
@@ -63,19 +63,13 @@
 			};
 		};
 	};
+};
 
-	soc {
-		ltdc: display-controller@40016800 {
-			compatible = "st,stm32-ltdc";
-			reg = <0x40016800 0x200>;
-			resets = <&rcc STM32F7_APB2_RESET(LTDC)>;
-			clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
-			pinctrl-0 = <&ltdc_pins>;
-
-			status = "okay";
-			bootph-all;
-		};
-	};
+&ltdc {
+	clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
+	pinctrl-0 = <&ltdc_pins>;
+	status = "okay";
+	bootph-all;
 };
 
 &fmc {
diff --git a/arch/arm/dts/stm32f746.dtsi b/arch/arm/dts/stm32f746.dtsi
index 7b4bd805c998..79dad3192e15 100644
--- a/arch/arm/dts/stm32f746.dtsi
+++ b/arch/arm/dts/stm32f746.dtsi
@@ -518,6 +518,16 @@
 			};
 		};
 
+		ltdc: display-controller@40016800 {
+			compatible = "st,stm32-ltdc";
+			reg = <0x40016800 0x200>;
+			interrupts = <88>, <89>;
+			resets = <&rcc STM32F7_APB2_RESET(LTDC)>;
+			clocks = <&rcc 1 CLK_LCD>;
+			clock-names = "lcd";
+			status = "disabled";
+		};
+
 		pwrcfg: power-config@40007000 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
