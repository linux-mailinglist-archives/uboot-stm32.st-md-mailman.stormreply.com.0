Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD7C790E02
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:57:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15A19C6B455;
	Sun,  3 Sep 2023 20:57:10 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED065C6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:57:08 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-500cefc3644so1375962e87.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693774628; x=1694379428;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8TYglP+cNP848xbNNC8t1ng0fe7mgor003HF4vz/ysA=;
 b=ehqlEmYiWcqn6tZOtOZWzSbSLV2J3POo5CAM+mv59tjaGrs8dC2scYDayu2zu5DA+B
 XFLMPtsEQxJTsuB1e+/uXk51DRRwYCvOoabwqIM12n24iQJCq2wLwRW+1Ysjc5qmGRNY
 2uv7xCFp8AmEhav3jSbCxPy5JbfQfPyHaFE+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693774628; x=1694379428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8TYglP+cNP848xbNNC8t1ng0fe7mgor003HF4vz/ysA=;
 b=Sa5k1H72kz4VPEYeIRmzVrIQASFicziVLwBTPHV6TBJMkDob2wE8RGblK/08Z58DH5
 3pETpL2jD/wkCZmrQSGv/4GJpnOAfDkSjUHXPoQ8WXXTnSClmRwOpCLbqWWQf0JRJSjZ
 eoREOd7U0gzj4EWLWxYnKGwjwxvCrQYcfkU722koOXcMYXCk/N0GHK51L/3TnJ+2hH1Q
 Rdluodcg2j2rbMQbzQONHw0xyQPEEhzznv+glFUXs1VRP3yAxu57p7+bt4+sqxTffCZ+
 h0+J4HMv89YCZ3T15dlFvyY25/3ZGSE2EgtxopeLx4/G2u/BExdC03l8mlqGVbKWj+Kz
 KOUA==
X-Gm-Message-State: AOJu0YxjikfyOu0r+pkoyJ05GGlj8QIMrnRdMtjHd4r7k9PmyMyipV+p
 LSWaXT+zRK/8DFazhEVyqInSNw==
X-Google-Smtp-Source: AGHT+IERULHX1blFhlVfjwrLUxJH/Ugf4m6bQMl7Uvcza6EVO74BjT4aB4HHkDRxrbXTKWAMATHnlA==
X-Received: by 2002:a05:6512:110a:b0:4fe:21f2:a04a with SMTP id
 l10-20020a056512110a00b004fe21f2a04amr6193023lfg.8.1693774628229; 
 Sun, 03 Sep 2023 13:57:08 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 v22-20020aa7d9d6000000b0052568bf9411sm4850232eds.68.2023.09.03.13.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:57:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:57:00 +0200
Message-Id: <20230903205703.662080-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903205703.662080-1-dario.binacchi@amarulasolutions.com>
References: <20230903205703.662080-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [RFC PATCH 2/5] ARM: dts: stm32: make the LTDC clock
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
---

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
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
