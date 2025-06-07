Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C44EAD0C3D
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jun 2025 11:37:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2857C36B20;
	Sat,  7 Jun 2025 09:37:42 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D64CFC36B2B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jun 2025 09:37:41 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ad89ee255easo511119966b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Jun 2025 02:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749289061; x=1749893861;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C6pe1sGeZYPbw5LjCW/P3QOGfvex7RX1OdUznHaZ37E=;
 b=WaAWpzeUF2b5IgS9jLSl5dVHpJIKSMOuq5pSOOa7UHK/WVFokHqSpvUi54ALCacJKg
 UWdfn8JboofuC2VnjBJvrHVO2GORQkvRhOkK+Nm+8cUiitesgljQ9lv88dfHlLhE0MMF
 JNl0b0rmwgiZMapyw/ITh1yW/y7ZUzicfRjK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749289061; x=1749893861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C6pe1sGeZYPbw5LjCW/P3QOGfvex7RX1OdUznHaZ37E=;
 b=fKVEuYIw/PsHi1EWQK1aq685QGXajFXkarFOEyeOFK0ZByU4X5Z3qlfcbB2yHgAxPw
 25kPTJcp7frXe4N3CGxbtvfDN+j2duJf+3K7pgBSKzf6BG6/+ynKD/WDwb2IO33188ka
 v8kViqAsP17kaCHUKAWEa0QuRfrmKMwGXqxNp9GtNl+k4iof71PiN3X3gs+I2H+U8UfB
 fGQRgoVHS2fpHE9N6R/L2LAboJbS6xOROgcjXlC09RZ4UITgfEszsmHKI+i4uGQN1GZz
 HY5SNUrHSWx4s8blhbto2Uk371PK5pvQKI3bgSDyW1RSp5gt42YzuZa4HBuPgOpd3nQj
 Tv0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8diZwacrlLjhLUtv1yrz1buwbdRbhsFC+ck1uC0RkeIUdPyuHsWdcg2kR0k2YGTB3ApDSH/JJ5R2RIA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzVqRdebhPFVv3M4AC8j313ktmDofM3SW0sZ0TsUbSrlPtMVO9R
 /XG52UMd3/ViG7ZzBm1L7Lp3gNzVRrCPic/AzBfjDTqPIgSlHfM1f86UhHaMD/Vqo7E=
X-Gm-Gg: ASbGncvrzIXjdNkuDsPWqx0k0G9hRnCWCiDhDLGCyxp4qmoVXgmxqG2sgwZMdTrJGHJ
 DA483hiSdd8MbumvDyIKLLe0h45rPFj/mcVkD4eG04jRINpB4y+nllyes1R2lfnSwVjFXKozC89
 NSPYoa7SlBVZR9At93KKvAO6SED8tuGX3IDqR1grKLmkoF/Pd5Pg4XaBq8/Amo1Mona+WfwBKtk
 J7aFNPBUT6krxwMYeIsXY0I1s/oAJZHc6Ekt6EI55BddS2LoTk17+lD2e6ssWIPQlKo4anRhRhX
 qMV3QwTLxPEiMD2t9dEz8sJQ1ntmnPBX+VRUboRN7rklOFz7Nny8pkUOqy1O/W5Ucsx0C9YF3GS
 W1cySScdauuD1Y855O3FtcMh6A73uYEaaleRwLDa2oBO13D3QQEdFOjyLj45JIioD2NdBi6JO83
 m60wq06pevoV4L
X-Google-Smtp-Source: AGHT+IFwVSYrTQDJCLZAew5ao0+tmd5AX1pMskv+F8AJUY4/thMMJtYDVGo4cERls+jKTi2OYKWNzA==
X-Received: by 2002:a17:907:7f0b:b0:ad8:9257:5724 with SMTP id
 a640c23a62f3a-ade1a9061f1mr564872766b.24.1749289061256; 
 Sat, 07 Jun 2025 02:37:41 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc38cffsm246524966b.124.2025.06.07.02.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 02:37:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat,  7 Jun 2025 11:37:14 +0200
Message-ID: <20250607093730.2249536-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Sumit Garg <sumit.garg@kernel.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 6/9] ARM: dts: stm32: add an extra pin map for
	USART1 on stm32h743
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

Add an additional pin map configuration for using the USART1 controller
on the stm32h743 MCU.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Link: https://lore.kernel.org/r/20250427074404.3278732-8-dario.binacchi@amarulasolutions.com
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

[ upstream commit: 8e71dfe46a4a1e9505b1a327470f879b63388968 ]

---

 dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi b/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi
index 96022afd0168..8a6db484383d 100644
--- a/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi
+++ b/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi
@@ -237,6 +237,19 @@
 		};
 	};
 
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 9, AF7)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 10, AF7)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
 	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
