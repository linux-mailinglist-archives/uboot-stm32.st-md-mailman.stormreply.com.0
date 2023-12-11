Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A2B80DDD9
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Dec 2023 23:06:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E5BAC6B458;
	Mon, 11 Dec 2023 22:06:54 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B510FC65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 22:06:53 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5510479806dso2517945a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 14:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702332413; x=1702937213;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zuFLBuUt6rSAkdj6yel2bAXH3CEy4Y9k9K7PWe/PI08=;
 b=FlwKaqTw9JfwUM2uwMlGZrSySg6rL3uZBbqQSz14vWgp0+SW3a69jSozjViEOhbT+t
 pOcrkXP+0miGT7qXmNEtSgTCA+zvkD3NmnyckhW8/iymzy4pKS2m4Xnyn5/t6yrQsq8G
 Wm/pVaX1gdC7t5zTEs3qL6Y7lmaV40QKzN4+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702332413; x=1702937213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zuFLBuUt6rSAkdj6yel2bAXH3CEy4Y9k9K7PWe/PI08=;
 b=OQrhW5B4H+NXKnoenE87pYypnRpOrMkulyXnk1oItTiHEd2MaPuz0YPNN4HiWWHda3
 6E10vLD+RI1yQayVLy52pruNZftyo61FFG5c8zogCoOYgs7ZCHxEjHLujOrJbkfRd7An
 RzZMsBPe9yu9foedYnkW5KdYlA9F7JeuM/v3UnAlNm5lFG0CSkaOoWl5Uunv40iBlWfQ
 bAIt49UW9/FL5h3FUPwnX7ejVrOmI5NXXDWGEkAmWOzLhinNlcgpkKx6MX3xH1Mz0u+x
 6bzrjw6MLHOShbcE3sfIbBrkXwsPTHXCdO6DQAt2dJD07CC6y6zQ1VNSzoWgCVKNYkwp
 uurA==
X-Gm-Message-State: AOJu0YzcLGXNfXFA+ExtAoTeg2GA/tyUYNW/2KbrboO7euOiEYinM9of
 r0/NFKtqP8kDjoCNgT50nrkzOKGZn84CM57tPMsNeg==
X-Google-Smtp-Source: AGHT+IHaq2m4Nxwx1ntmSKZUv5UsntnBZB1BDqLTvxi/+Y/TmCH84Q/6kEaxRWfcY36eDOa6naFm8g==
X-Received: by 2002:a17:907:cbc8:b0:a19:d40a:d1e3 with SMTP id
 vk8-20020a170907cbc800b00a19d40ad1e3mr1762406ejc.175.1702332413313; 
 Mon, 11 Dec 2023 14:06:53 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-54-95-129.retail.telecomitalia.it. [82.54.95.129])
 by smtp.gmail.com with ESMTPSA id
 se13-20020a170907a38d00b00a1f78048f08sm4568276ejc.146.2023.12.11.14.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 14:06:53 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 11 Dec 2023 23:05:52 +0100
Message-ID: <20231211220643.1073606-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211220643.1073606-1-dario.binacchi@amarulasolutions.com>
References: <20231211220643.1073606-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v3 2/6] ARM: dts: stm32: make the LTDC clock
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
of the LTDC clock.

[1] Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

(no changes since v2)

Changes in v2:
- Add Patrice Chotard's Reviewed-by tag.

 arch/arm/dts/stm32f469-disco-u-boot.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/dts/stm32f469-disco-u-boot.dtsi b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
index c07e2022e4a8..dcc70369cd0d 100644
--- a/arch/arm/dts/stm32f469-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
@@ -134,6 +134,10 @@
 	bootph-all;
 };
 
+&ltdc {
+	clocks = <&rcc 0 STM32F4_APB2_CLOCK(LTDC)>;
+};
+
 &pinctrl {
 	bootph-all;
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
