Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3495F7FF296
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Nov 2023 15:40:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB278C6A61A;
	Thu, 30 Nov 2023 14:40:44 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84E59C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 14:40:43 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-50bc22c836bso1542449e87.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 06:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701355243; x=1701960043;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kyXGBY2KLW4rJ8Eqx6QRH4TAKJ0k23of0ltCNtobbA=;
 b=mCXryt0otsqTQBKdwLfGlmYSlgN+ZppYS00ibradxihXSiagOO7TMlKjtYQfyptZ0K
 +fptZ3eA2NQPvDil/1yHV1+QuSNFreM48EtB1dqerb2DjOEZlSsdZGZPFCB69xP34Jc+
 lkVbQZNEHSwHfE6WboVXcUvZjPIoSzmEKny8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701355243; x=1701960043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2kyXGBY2KLW4rJ8Eqx6QRH4TAKJ0k23of0ltCNtobbA=;
 b=HzbPLzpEOiRCNwy7uvlq8eZqXXjOlztLxD2EDviNuKVwj4KUD+sTlgmCxEZSFblGGk
 p8kYllw40GeZPmhBAnFUqVaZs8HQi6buwlpa9Vcte4atp+A0R25OnqmMO3YurM+pIstU
 yyELr57ePj4Xsauh29Zxis6FShdCH8w50JKb+L/BseoviNvV+b+Ld3duBFGxtSGxJu/a
 w0R7eJIuuAjr0l13iX/UYL2qy0fy4zPafErSevncdzHVNibCZurqNxp/d1icrbyHHUb3
 Gs7l9ue0U/GKVvxvo/uZqB/PAsEjGrLEdPEL+FhG3lpnelmIWvm+apo27/4XtWonJvyZ
 wcIg==
X-Gm-Message-State: AOJu0Yxk7fig8yHZGXCSDA3BdtstlpyLDnHVdeHRt1NWe8dZOavpLkVx
 jyvuldTq6WsNbM/SCE4KINC5KA==
X-Google-Smtp-Source: AGHT+IHhbWIpPKb9YSkM/5UYy2HkiuJdxxVzu4jJ+0QMLX/7uHXceuYpiJJqIC8FKbs+lmKR5H/s2w==
X-Received: by 2002:ac2:51b2:0:b0:50b:cb84:8ccc with SMTP id
 f18-20020ac251b2000000b0050bcb848cccmr1525885lfk.54.1701355242842; 
 Thu, 30 Nov 2023 06:40:42 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:d1eb:b106:516d:db0a])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a1709064a9500b00a18399ff790sm733470eju.215.2023.11.30.06.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:40:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Thu, 30 Nov 2023 15:40:04 +0100
Message-ID: <20231130144033.1850298-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130144033.1850298-1-dario.binacchi@amarulasolutions.com>
References: <20231130144033.1850298-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [RESEND RFC PATCH v2 3/5] ARM: dts: stm32: make the
	DSI clock usable by the clock driver
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
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
