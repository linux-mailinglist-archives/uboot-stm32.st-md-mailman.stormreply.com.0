Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B579671F03F
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jun 2023 19:06:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 749D6C6B443;
	Thu,  1 Jun 2023 17:06:08 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01DEFC6B442
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jun 2023 17:06:07 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5162d2373cdso1489972a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Jun 2023 10:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685639167; x=1688231167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JmOoM4inSCJBR8S0rajelz+DFtakxP3fBnydY/lz0ss=;
 b=B97xl/QS5RaX5oCnlPW8y4felgrjWkjoY1N4QoeXIvi0FFdhhYaZbESNlHybCrejbj
 u57T2/8rMEZbMLeyJF0xzsEDsnhvdADlT0tg/ERJ4QPaQwkuYXCeQzWfmZsSNIal5VdD
 Y5w9uHDsfAppPypaccsrDuJ2klCWcl99TXy7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685639167; x=1688231167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JmOoM4inSCJBR8S0rajelz+DFtakxP3fBnydY/lz0ss=;
 b=AdIWS4blaK4KDsdYO/rFE4q2aSM2auEZf8g9FeqjTXu1DRV4sEYkaRmY8sU1Hyvzuk
 9cMgc7ThQGy8azWj1T7Hdfx4rn1591W6PborBj9aRfZZuPoEo6EBFYxt5M5IHxfC8G9+
 dWdKONyIQUx6jlCUjJaZUE6oHGwUOALsNQih1eFJOJ5up8ig9Nqd7Prz50DYFyPDj7Gi
 CHHNrmDOcz9qXlrk2y9mnVGOGNaIGNg6q4SkeNxLboDrmCw82BumahxanH6zHElodLIY
 9ctHyX7MsNeJw/HluIRCYu1Ib/cEm4NsLxyZK8Aus2/djAXFHa+AhS8PoBVsdx0CW2A1
 B++A==
X-Gm-Message-State: AC+VfDzaKPulSlQYFY5RhAREU1QU9a4XM8dWKegHJJ78h/tjnw19kXHW
 cG7FXImiGujoGzIhfGAkzZNcAsP2SpqJpTFCe3iJ6w==
X-Google-Smtp-Source: ACHHUZ7XR6Qwlp4UbWqDHF/mHgqvSdeyYXa1NuKTqqeKU8KvY7sYkV0EHZSY37O/eyFxMcNXpoFhSA==
X-Received: by 2002:aa7:c2c8:0:b0:514:8df2:b6e6 with SMTP id
 m8-20020aa7c2c8000000b005148df2b6e6mr386981edp.15.1685639167464; 
 Thu, 01 Jun 2023 10:06:07 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 c10-20020aa7c98a000000b0050bc6983041sm7228323edt.96.2023.06.01.10.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 10:06:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Thu,  1 Jun 2023 19:06:02 +0200
Message-Id: <20230601170602.2845768-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, michael@amarulasolutions.com,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: fix display pinmux for
	stm32f746-disco
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

As reported by the datasheet (DocID027590 Rev 4) for PG12:
- AF9  -> LCD_B4
- AF14 -> LCD_B1

So replace AF14 with AF9 for PG12 in the dts.

Fixes: fe63d3cfb77ef ("ARM: dts: stm32: Sync DT with v4.20 kernel for stm32f7")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/dts/stm32f746-disco-u-boot.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
index 19b5451db441..522cffb1ac9f 100644
--- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
@@ -169,7 +169,7 @@
 	ltdc_pins: ltdc@0 {
 		pins {
 			pinmux = <STM32_PINMUX('E', 4, AF14)>, /* B0 */
-				 <STM32_PINMUX('G',12, AF14)>, /* B4 */
+				 <STM32_PINMUX('G',12, AF9)>,  /* B4 */
 				 <STM32_PINMUX('I', 9, AF14)>, /* VSYNC */
 				 <STM32_PINMUX('I',10, AF14)>, /* HSYNC */
 				 <STM32_PINMUX('I',14, AF14)>, /* CLK */
-- 
2.32.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
