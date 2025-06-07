Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3AFAD0C3C
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jun 2025 11:37:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7BE5C36B2A;
	Sat,  7 Jun 2025 09:37:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0E6CC36B29
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jun 2025 09:37:40 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-acb39c45b4eso423531966b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Jun 2025 02:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749289060; x=1749893860;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tbVZTpqHnxGSfG31CEf3LRpU+FuZj/pllfnfJuL/RqU=;
 b=R9ervMZJ27/So2JXk6onJw3kFcRUAsvJM5kJ3stURwk0m/uOSfbSUrqr5Bn8KHit2l
 64HKFLo/N2/9lXbIO467nh75tEA8FfiEOf6o8yFu3NoDGtcTYU7deer+uY7Ks9B+9a6n
 hfBkHrm6LBwT/8czKKpzFv17RrCc1qr+TrQaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749289060; x=1749893860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tbVZTpqHnxGSfG31CEf3LRpU+FuZj/pllfnfJuL/RqU=;
 b=vmvQHRAs64zS5ZpDj0mUVb0E9pF9yRmfbEA6771qa6tVyOdpJ1Ex+PVcZsu1+atvDw
 b58PSbj1xoWvtDPf1bGzt5B5IhYXrUsddGWV2fiRyzzBUaQvPqpVQ466rTypBTh6HWAd
 oLHaCUvvZaL9hNDveXuV+LgWy30TkP/Yhx/SW0HzhXV3MsgwhKeYTWetY4iWinmaBUNp
 r6rRaCqKvRszXzsN4g1UQr7H9sCV4ZxtLGD4IEZiKh5e6ublBrGXYhUJpvF2GYtpCbHt
 tSt63bTabcolqzA3LB2sHchCyZwxsaWKufAErgAeDTZtAUONbEU25n+/MxyUqV/bAKhA
 Qm4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsIVrwJi2ixpqVKxEWhRgQvZEVf5yGh+PxCxxxEz8M1GR3lqpChaL3/gZA82Ph26cLqaxvN8nx+uympw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YysVmb43/l9CauaM9365pLsHPK6WhQnFS4qr9qx2NA1jp1luMkh
 vEBPLsyziLQ8KY5RSKiCULt4oFXFeDnxG/4imDRHBSyJTCMB51p3UeaygvslxsU0p3c=
X-Gm-Gg: ASbGncsecPRaYAloVw9rjbOTOgYRgc7yvD24x4GDue6x/piox6wdBvHG+wp+SvT9Xmp
 mwNfVIIjI1Iz42MkuJecWywN6zzuRar09bZ1I4DNXRRSBArJd7/ZWZMSQhymQ9z65AwynRf5W7h
 9qEPMEJbq9cusR10TlEXHtxsbjeJRCI3xClpiOdNuf+9wGuBhGSIg+tTX26Ba/ceq0ivHqBUaZI
 Y+TvN8e6/+Vj8pt55Nphs6ZbFzyrGzkls3F3Qs9gdCPsejwq5HziZb1A1BmD5eMoC1l0rCDxChP
 iMFZbRGwkM97zX+bQQgx1ZxhYyILam/T2d8qUpaxk2JcD526BPKQECcIdFYZTTNCixucAdi8RL3
 ztTv24s0z7XQKMoqL+L97mNQK5MkK9/MZy8yOM9M4q90ftzevXV/QwnNFoPpPZMocvtW76Y4loa
 QVQrng2Gb66sFc+fCk3limBZ8=
X-Google-Smtp-Source: AGHT+IHRmly90CF17mit3Opcizty27WODVU8ooPwCNDfcI3PXQ0FjS1SrU5q298TxhVHYipdKQHOLg==
X-Received: by 2002:a17:907:3eaa:b0:ade:6e9:8ad4 with SMTP id
 a640c23a62f3a-ade1aa8eff5mr602044866b.33.1749289060102; 
 Sat, 07 Jun 2025 02:37:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc38cffsm246524966b.124.2025.06.07.02.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 02:37:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat,  7 Jun 2025 11:37:13 +0200
Message-ID: <20250607093730.2249536-6-dario.binacchi@amarulasolutions.com>
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
Subject: [Uboot-stm32] [PATCH 5/9] ARM: dts: stm32: add pin map for UART8
	controller on stm32h743
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

Add a pin map configuration for using the UART8 controller on the
stm32h743 MCU.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Link: https://lore.kernel.org/r/20250427074404.3278732-7-dario.binacchi@amarulasolutions.com
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

[ upstream commit: 47d16ab94b8e5e85aedba3cd22cfdf3877bf1dfb ]

---

 dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi b/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi
index ad00c1080a96..96022afd0168 100644
--- a/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi
+++ b/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi
@@ -211,6 +211,19 @@
 		};
 	};
 
+	uart8_pins_a: uart8-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('J', 8, AF8)>; /* UART8_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('J', 9, AF8)>; /* UART8_RX */
+			bias-disable;
+		};
+	};
+
 	usart1_pins_a: usart1-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
