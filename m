Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7F880DDDB
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Dec 2023 23:07:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2BB5C6B458;
	Mon, 11 Dec 2023 22:07:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69EBAC65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 22:06:59 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-40c3ceded81so25260005e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 14:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702332419; x=1702937219;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D+DeLLzvFUt8bF9r3f6NRU00M1E5EfRpOIcrIGfseE0=;
 b=Yt4A2ywXqmk9Jy8T24x6YZunfSArqyXuqTDMSDnObqNWqZiZYHLu0FzkZGVjCfOvZn
 FjGMR+hDKi48mXkrvYBhIhtXiHSo8lMhS4Hprf4UXXXaybYejlCt/prPM+Ty3XY510G8
 QiqRv4GJOqzDkgS3bNiu/ku+Y/QsLdvCJBnLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702332419; x=1702937219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D+DeLLzvFUt8bF9r3f6NRU00M1E5EfRpOIcrIGfseE0=;
 b=h02ga7oVM5p9G/lOQeSQgyfSOSonDkfH7MLy4vB2lhmK5/HIRAkcRL6YAUlkIrCyTi
 rbmSRqbZrbRlmReLGPBaUMSJr9QcEwDXZ1ZjXElaIa7nQsjlINYD28xaOBUEQgaLH1pj
 ToD+M6G0c/z50XfCiXr1JiarGsJikFpnxDVMYZLRbifqkkLqm5gjLG9ouS9MMMQCpStT
 TpkKQ12kvRkaxUJ9RnqFbMtxcZX2EGY2Fbe22WnPJyWposyp5MjML6DmIekwZ+zse1ZR
 Z6mKjU2S6dYzKAyD9E1PkIFUDUb69oRIf0WhGiyCvgiPk6+ZkHcSbmsN/vjyg/EFm+0P
 rzuA==
X-Gm-Message-State: AOJu0YyO9rnxSF1EDdulKdvR1pSOcifws4yn//fEr6jmAOjxCfIFigB7
 kldphgnIR1FX4REN/o36TqRaZQ==
X-Google-Smtp-Source: AGHT+IFzlChAzMT/mG36n57XD0mq/fmyCuYmJaZaX/g+ONZIW283Y8w8dWl0hD1eH+lHxlK2qJADqA==
X-Received: by 2002:a1c:4b0b:0:b0:40b:5e21:ec37 with SMTP id
 y11-20020a1c4b0b000000b0040b5e21ec37mr2300235wma.105.1702332418877; 
 Mon, 11 Dec 2023 14:06:58 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-54-95-129.retail.telecomitalia.it. [82.54.95.129])
 by smtp.gmail.com with ESMTPSA id
 se13-20020a170907a38d00b00a1f78048f08sm4568276ejc.146.2023.12.11.14.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 14:06:58 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 11 Dec 2023 23:05:54 +0100
Message-ID: <20231211220643.1073606-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211220643.1073606-1-dario.binacchi@amarulasolutions.com>
References: <20231211220643.1073606-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v3 4/6] ARM: dts: stm32: support MIPI DSI on
	stm32f469-disco board
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

Unlike Linux, the DSI driver requires the LTDC clock to be properly
probed. Hence, the changes made to the DSI node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/dts/stm32f469-disco-u-boot.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/dts/stm32f469-disco-u-boot.dtsi b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
index 8e781c5a7b23..47ba9fa4a783 100644
--- a/arch/arm/dts/stm32f469-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
@@ -92,7 +92,9 @@
 
 &dsi {
 	clocks = <&rcc 0 STM32F4_APB2_CLOCK(DSI)>,
+		 <&rcc 0 STM32F4_APB2_CLOCK(LTDC)>,
 		 <&clk_hse>;
+	clock-names = "pclk", "px_clk", "ref";
 };
 
 &gpioa {
@@ -140,6 +142,8 @@
 };
 
 &ltdc {
+	bootph-all;
+
 	clocks = <&rcc 0 STM32F4_APB2_CLOCK(LTDC)>;
 };
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
