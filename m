Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0247BCF24
	for <lists+uboot-stm32@lfdr.de>; Sun,  8 Oct 2023 17:46:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFB9FC6B444;
	Sun,  8 Oct 2023 15:46:02 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A0A9C6B463
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Oct 2023 15:46:01 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-9b96c3b4be4so638927066b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Oct 2023 08:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696779961; x=1697384761;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTx7xiY1gVrYaN4UWiDJPmdtqAhZcB13UK7nV6rDAms=;
 b=SSmO7qlNpnvc36w+ckJR7PTbrrqTqaZY5mhvdOp0xOtX5f61XApRyWoTgZ5AJ1uSl3
 HHPFDMPC3bqiW7+VRGtgh/fozsXDpGqU3qhZqh2pIhEIqoVWWP8KDvYLJYwc0tlc9uZ8
 G6c+j1fSyz4YSKMeSR/BNuBxOSqC1gwqopeLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696779961; x=1697384761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eTx7xiY1gVrYaN4UWiDJPmdtqAhZcB13UK7nV6rDAms=;
 b=C9D6YEFCuLwkuCGRN0Pwa1StN1wINT8yod0Ett0n1KREfgv5n66UBYCGk7W+i7PYB7
 DfB0/iOPRMrThNnowBwqvS4YuencBqOX6mnCb+l9XorYDdI1JrY6iu7QmWXiKzQfLcrp
 vj/ilHR2uhvDAJTEhfNljGGaj4KVeevYkyayMxFLQVTtv48auS815Hutr8+eZvY1lI9O
 a/OFd7Y1WRlrAo64MlLa4uX6+ONyh1WCzTFeEd7EEUlgn+pZwNr5LuUZj8NSLmxDfTZD
 FKymOGvEuLtwM5AlDyGxop0ykSnoupsY9rQZW996Uh6UyBu6OScYljCkPMFdby72diCm
 OQLA==
X-Gm-Message-State: AOJu0YwVfDIRQOzTMZ7FGzDT1oo8phq4mFlK+57P2LoRyythKhkyE9dF
 5f8fnMzQqKY51wS/BshUvtMldw==
X-Google-Smtp-Source: AGHT+IF/Va05jr10Og4exGS3OYwpKdaRUHqEKmD0iV40UumPiPXyBQg+aFF2064T4091RMuwVOGo3Q==
X-Received: by 2002:a17:906:2932:b0:994:522f:3f4a with SMTP id
 v18-20020a170906293200b00994522f3f4amr10705904ejd.29.1696779961136; 
 Sun, 08 Oct 2023 08:46:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-50-102-159.retail.telecomitalia.it. [79.50.102.159])
 by smtp.gmail.com with ESMTPSA id
 lc11-20020a170906f90b00b009b9aa8fffdasm5623981ejb.131.2023.10.08.08.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 08:46:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  8 Oct 2023 17:44:55 +0200
Message-ID: <20231008154538.1622772-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231008154538.1622772-1-dario.binacchi@amarulasolutions.com>
References: <20231008154538.1622772-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [RFC PATCH v2 3/5] ARM: dts: stm32: make the DSI
	clock usable by the clock driver
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

As described in [1], the "clocks" property contains "a phandle to the
clock device node, an index selecting between gated clocks (0) and other
clocks (1), and an index specifying the clock to use." The current version
of the clock driver, unlike the kernel, is currently able to properly
handle nodes with "clocks" properties with an index set to 0.

This patch is preparatory for future developments that require the use
of the DSI clock.

[1] Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
- Add Patrice Chotard's Reviewed-by tag.

 arch/arm/dts/stm32f469-disco-u-boot.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/dts/stm32f469-disco-u-boot.dtsi b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
index dcc70369cd0d..8e781c5a7b23 100644
--- a/arch/arm/dts/stm32f469-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
@@ -90,6 +90,11 @@
 	bootph-all;
 };
 
+&dsi {
+	clocks = <&rcc 0 STM32F4_APB2_CLOCK(DSI)>,
+		 <&clk_hse>;
+};
+
 &gpioa {
 	bootph-all;
 };
-- 
2.42.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
