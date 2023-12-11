Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A2580DDDA
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Dec 2023 23:06:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 989A5C6B458;
	Mon, 11 Dec 2023 22:06:57 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CE34C65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 22:06:57 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a1da1017a09so607472566b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 14:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702332416; x=1702937216;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8kCgG58/2CGYcP5BXXvCFQIN/zvR8qVyaBNkYiWH0cA=;
 b=A8ixVi/KV4ocotnQtjIW7oeAGSrrUfn7IH5xTU0sMjY+/JJ+C4b4ZU91nJWHZAkLqq
 QT0vtaJTNmgBoSs/I6ez5dHjUztMV+POJGI95MRxqr8xzdWzpl4JpCLRNmSV+GfrBM0g
 QxCxnsr6fNsXAeUohw0fKc5weR9CV575YiXGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702332416; x=1702937216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8kCgG58/2CGYcP5BXXvCFQIN/zvR8qVyaBNkYiWH0cA=;
 b=EgeuWEEBxJjfsF0sc0WNo3mzx8awrK7pQm5AwetkQCDXRRWXIt60RZ6FLNte0JpTfc
 qjyGegDRRg4xRtMAUtb3SEeA0RyadHypILQSBX8G51Z2O1YL9ynApQulo8MoDY5qPHGk
 EBNR/VmpWQvdJSKdMGEmZuqj7H2wYPPfz8YhfeWRS4UqNK+gFQmmHzVhMQX80xrOcSnS
 RpIGjqz8Hw1pAlWenhZMvDgeYoaz8Z7cgRKX7MZTrFzonhPV7E2dJTHK8M4qHZHiDwPY
 KpsptcxbEPCx1Sh6KuA1MLtToZxXrmhQagNFyhR0BsIB0SIgT4gWNryBk2Tfi8iswTaa
 FvCg==
X-Gm-Message-State: AOJu0Yw1/9/UUZZpE8SO3gg/nDiFZAAZmfhMIta1dBnZWgl0u8958xgj
 lD3eE1DonWKAeoSEcdYSHqqV8w==
X-Google-Smtp-Source: AGHT+IEREHOM4hTosT3tw4TM39OvOB9OXaDC2Tym6j1JqjFmhtBgOcjOfbLPSXm5xEF1O7+FD76pjQ==
X-Received: by 2002:a17:907:944d:b0:a03:6fd8:f14b with SMTP id
 dl13-20020a170907944d00b00a036fd8f14bmr3416089ejc.28.1702332416666; 
 Mon, 11 Dec 2023 14:06:56 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-54-95-129.retail.telecomitalia.it. [82.54.95.129])
 by smtp.gmail.com with ESMTPSA id
 se13-20020a170907a38d00b00a1f78048f08sm4568276ejc.146.2023.12.11.14.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 14:06:56 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 11 Dec 2023 23:05:53 +0100
Message-ID: <20231211220643.1073606-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211220643.1073606-1-dario.binacchi@amarulasolutions.com>
References: <20231211220643.1073606-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v3 3/6] ARM: dts: stm32: make the DSI clock
	usable by the clock driver
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

(no changes since v2)

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
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
