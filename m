Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 263E97FF295
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Nov 2023 15:40:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFBB3C6C856;
	Thu, 30 Nov 2023 14:40:42 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C7CAC6B47F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 14:40:42 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a00a9c6f283so146179966b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 06:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701355242; x=1701960042;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJf5mHPlhnOmzg+lkJJXHrUWrAapNUPp+/I6FVPwS4Y=;
 b=Kg2tUcALSKtOOh4cKYQ5Q5z0IeMcmLncuBrjnu09PizcGA39bOd7mhADBYIrCDv0GG
 o9tWaoAhzmibkkCfAbWPEmnetcSPFXBi73Fhl9hv4teJJcFsIqRl2Gw7NLqsV/qZXCuv
 z6WePAuBsULb7onb7u69yl3LAaZ4Af90hc/jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701355242; x=1701960042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XJf5mHPlhnOmzg+lkJJXHrUWrAapNUPp+/I6FVPwS4Y=;
 b=xRBGbGo6u4n6kGIx9PkglU2PY/exkKCzzRwLBIs5qV/y6h2+EAMOx9pMh9S6fpKfMM
 tuluwr7FZuPquPSwQ7ezxCDVUeah7N+1woO1D8OuUatkMpjCgX5Zta5XV9cS8EtrFa8A
 tSO5P+xhtgDdN8zxZGMOvBh22Zb6yTP9XbqCMoofLreN76FU7RdBVVQOU71pjMTb1qQC
 lK/bCw8Fh7qU8UOU5Q3CH/12zUqage1mrtJ6nez4ZaKALOCAigtGrSrirMy8Wrl6hawT
 xBVvUeCjXqmbubW2qxmm9q6P+Il/fYZfxRMbpE7FXtsJyPcJlAUYDaSstpep87uuPMyS
 GtmA==
X-Gm-Message-State: AOJu0Yy6VSCe9dx4qZt0PmR4yXNEUYWXwQg5F0sfOVbPHSiq5RiMNG0/
 TbZiQLA4XSFSIQSpAORzNt7tYQ==
X-Google-Smtp-Source: AGHT+IGUPOBJfuvQbUjMYV5306BpwsYU58Tx+lQuNj6CTgJ18BY6A7ryEMRRbyK8AVxX5vILAivGJA==
X-Received: by 2002:a17:906:bc8a:b0:9b2:d554:da0e with SMTP id
 lv10-20020a170906bc8a00b009b2d554da0emr15166130ejb.69.1701355241693; 
 Thu, 30 Nov 2023 06:40:41 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:d1eb:b106:516d:db0a])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a1709064a9500b00a18399ff790sm733470eju.215.2023.11.30.06.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:40:41 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Thu, 30 Nov 2023 15:40:03 +0100
Message-ID: <20231130144033.1850298-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130144033.1850298-1-dario.binacchi@amarulasolutions.com>
References: <20231130144033.1850298-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [RESEND RFC PATCH v2 2/5] ARM: dts: stm32: make the
	LTDC clock usable by the clock driver
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
