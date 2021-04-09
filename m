Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC90935965E
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 09:29:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92A93C56639;
	Fri,  9 Apr 2021 07:29:09 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94EFBC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 07:29:07 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id bg21so2477307pjb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Apr 2021 00:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=22Yj40BvHmYRX+ww41/Nr1ueDQzAJWYkW3qkeVFuDzo=;
 b=vfEbvT3WeyFGJ2jGeOemjKyvxDPlWtiv5kt7Kqwy7P/b6mqupK6+RN8ftK0bNYnEnc
 tl/vLs2BRBsYxxQImeg2IlmhjOfJT4jbSvbpNJo236QpOf+4tnNuBiGSy2f2Vtbj92Fx
 8GICcbwwZjdV5R2KHGsvu3KBJfIDQ/r7KBIj++MdY+RJxWC04JOPJuiWnGF6jUx5Qg/b
 93i71UIkOufC9pubCnngKhID05CU1ROU+aAsufSRwCe5wnAHM1HfO7rsjrlk98iQSOY6
 /DOozW+jk92TkAuswSOStKknx71P487fbvLBdECxvI20SiP2RgW7u+IZTSjbISp8D2pf
 eQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=22Yj40BvHmYRX+ww41/Nr1ueDQzAJWYkW3qkeVFuDzo=;
 b=UIuTh9R52zUZbwlOGux/kO3XZ9DYHZRo/hGWJV7267J9BfQpSiP+mJ1qqueBKOZd4J
 QUYy3XP225MC9ADnjm5uCkZ0FRY8bUUuHaMDItCubdr5mNrdjc+ft/iIYmLg2o7LiUjo
 +digmgT9hLAi7rG0vVYbNDLmpYHQQfOPp3aEKMfIuRxAgDbnPhrU2cHo/HJbH5MH8A0K
 opXhKcyCO4Y93+Hbitxa8YivFf5XXwxh2ErvUd0432Wx1dXXpmxXWXAeO2xnE6vE1Fb8
 HtQcRtZWkgwfmoPi0Pq52qFMJtQmgjP3kOA61BF8tG7MEUVmewDgBk/DVWtSsbIbW2HM
 3ZRA==
X-Gm-Message-State: AOAM533n3Wz11DJ4YoD3bYRIt7gA034Wgv8cki0vjbU/h6XY1ruKyqzM
 9ByVznTM2uQr5dbbGRxQrnM=
X-Google-Smtp-Source: ABdhPJw+liMSGLtmdZKhUx2RDxKdhAyNnd3h4yXeOGaowY3dDJ76ezzxUZ4rJVolnIQS6xas05jKog==
X-Received: by 2002:a17:902:c948:b029:e9:8f01:fa8e with SMTP id
 i8-20020a170902c948b02900e98f01fa8emr6913545pla.37.1617953346213; 
 Fri, 09 Apr 2021 00:29:06 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id j3sm1344432pfc.49.2021.04.09.00.29.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Apr 2021 00:29:05 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 sjg@chromium.org
Date: Fri,  9 Apr 2021 15:28:42 +0800
Message-Id: <1617953326-3110-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617953326-3110-1-git-send-email-dillon.minfei@gmail.com>
References: <1617953326-3110-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v5 3/7] ARM: dts: stm32: add new instances for
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

Some instances are missing in current support of stm32h743 MCU. This commit
adds usart3/uart4 and sdmmc2 support.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
v5: no changes

 arch/arm/dts/stm32h743.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
index 8c96698..77a8aef 100644
--- a/arch/arm/dts/stm32h743.dtsi
+++ b/arch/arm/dts/stm32h743.dtsi
@@ -99,6 +99,22 @@
 			clocks = <&rcc USART2_CK>;
 		};
 
+		usart3: serial@40004800 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40004800 0x400>;
+			interrupts = <39>;
+			status = "disabled";
+			clocks = <&rcc USART3_CK>;
+		};
+
+		uart4: serial@40004c00 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40004c00 0x400>;
+			interrupts = <52>;
+			status = "disabled";
+			clocks = <&rcc UART4_CK>;
+		};
+
 		i2c1: i2c@40005400 {
 			compatible = "st,stm32f7-i2c";
 			#address-cells = <1>;
@@ -332,6 +348,20 @@
 			max-frequency = <120000000>;
 		};
 
+		sdmmc2: sdmmc@48022400 {
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x10153180>;
+			reg = <0x48022400 0x400>;
+			interrupts = <124>;
+			interrupt-names	= "cmd_irq";
+			clocks = <&rcc SDMMC2_CK>;
+			clock-names = "apb_pclk";
+			resets = <&rcc STM32H7_AHB2_RESET(SDMMC2)>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <120000000>;
+		};
+
 		exti: interrupt-controller@58000000 {
 			compatible = "st,stm32h7-exti";
 			interrupt-controller;
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
