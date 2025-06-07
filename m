Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E064BAD0C3B
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jun 2025 11:37:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7EE4C36B2A;
	Sat,  7 Jun 2025 09:37:40 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68A53C36B1F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jun 2025 09:37:39 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ad93ff9f714so491132766b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Jun 2025 02:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749289059; x=1749893859;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ttmUHLY08fh/FuLq2G6mP6MFdpRwEDRrcgYPXrhNizk=;
 b=P9iQWbG0IF35T8FUlMKm4vWgiSrVcLwG4nD1v4xLjkVsDIFb04IJWTxq1QZ/mi9IRv
 22OiGE3pY5jZURD04WLiCZPkZ1Jty0EguUXnQx0wBdTkFiMzFumAP2vb2a5CKD6VHsli
 UCz7lu8NkiJITK7bQUqAj6Ytq7naFiwkSK7rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749289059; x=1749893859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ttmUHLY08fh/FuLq2G6mP6MFdpRwEDRrcgYPXrhNizk=;
 b=VJiTnUR7VToHtdtoEPNk3hR3hFgOtuHtMUbxI1AIOV3V8xJbnrRDAo734NgZUfMfI1
 lR28T+hbRFGNDKOubEoQ6cgyqxAMQ0cqkJzEOdz+nb1HUNBz6svJg8Ia5bf/oGA2M25Q
 UQY46gSEkrBIRliAkq1CIdo/vyViBWsSOF6hKCgrgzZHR1gR1/q4pE/ZWjfSLz7sfAIw
 Tp+PJNyQKQm/xn/Pd2p5WXB+TTCK/B3de3UK6OPT5oJSO3Iz7kSOXHJeK0OzFROTar0U
 P04N6HzI9eIOd4NWODnow6Ep4gcwRvv7jQOE1QQavWjg9oY75w1nImWHqRcYvLKKpAeK
 WgzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3XWfOi5IKxjLCFpnv9p4Z2lgYTux1td/jWyYv+wYLZFgflg8ZS+QQvAdmmyQbayNY3mVYzi9JP9dnMQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx6DPXgjmQQY6xnHItAnMucEdpGdvyJo3QcqZFgx9OKM0gjBAOz
 B76Gp5ysLGPqjNJdq69g4/0qfyYGvLDlAzM9WViEOVs2CsGYLwXPn4f1VX4BAzSoZ4c=
X-Gm-Gg: ASbGncvtosufcasaL0Djqi370ouxW10pL6XbfBU5M0aAWjqj33q15xjlFv6miMSw3zd
 gaka/ONP2KBDGyd14cGBFcoA18i0IP29kl8elZKPef1Gr5dNISW7rYA7BTQc9DZBWmWrApiNZlk
 Y2eHSIznkatcNNWaKCwZPku/OkRqjp6sRzkHzz3nllDsaROPu5jd9CcZ0nOiC8gp3lINQJJbxrz
 h52NbWkKu+5wSnYJHpe5ytKaIO0hHsAlZ0ytJbxbXZvPyc1skC84rLvrpsj85u37XOVCpmd9e1J
 8vrkTG9jjizZyzPR7Tnz9NSoVg2ussHJfku1DXVP2xJBKNJ5JJsLjW48nlXC0rzSdoRxqN0kRzb
 efjLs6MeK9u0GkEZYexLiixR+77UZt1xog/W0ccxdQmRkUYRDMyInkqMfpd/+Pnxz8jDmfKcXB5
 w8Iw4g0OVboLaq
X-Google-Smtp-Source: AGHT+IGGJA2vZQ+atvf90Rrht2amcxYEugiItPRofnasHL712epb6JRjIOyADmJAEGQ9pzJjAjtX2Q==
X-Received: by 2002:a17:907:94cc:b0:adb:3345:7594 with SMTP id
 a640c23a62f3a-ade1a9e22camr495051466b.9.1749289058886; 
 Sat, 07 Jun 2025 02:37:38 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc38cffsm246524966b.124.2025.06.07.02.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 02:37:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat,  7 Jun 2025 11:37:12 +0200
Message-ID: <20250607093730.2249536-5-dario.binacchi@amarulasolutions.com>
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
Subject: [Uboot-stm32] [PATCH 4/9] ARM: dts: stm32: add uart8 node for
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Add support for UART8 by applying the settings specified in the
reference manual RM0433.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Link: https://lore.kernel.org/r/20250427074404.3278732-6-dario.binacchi@amarulasolutions.com
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

[ upstream commit: 07aa43adae2363c3734055aeba0789536fa0f8f2 ]

---

 dts/upstream/src/arm/st/stm32h743.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/dts/upstream/src/arm/st/stm32h743.dtsi b/dts/upstream/src/arm/st/stm32h743.dtsi
index b8d4c44c8a82..2f19cfbc57ad 100644
--- a/dts/upstream/src/arm/st/stm32h743.dtsi
+++ b/dts/upstream/src/arm/st/stm32h743.dtsi
@@ -211,6 +211,14 @@
 			};
 		};
 
+		uart8: serial@40007c00 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40007c00 0x400>;
+			interrupts = <83>;
+			status = "disabled";
+			clocks = <&rcc UART8_CK>;
+		};
+
 		usart1: serial@40011000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x40011000 0x400>;
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
