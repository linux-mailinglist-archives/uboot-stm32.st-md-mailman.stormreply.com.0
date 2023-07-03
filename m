Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C785174604E
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Jul 2023 18:02:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72B56C6B45A;
	Mon,  3 Jul 2023 16:02:39 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D16FC6B453
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 16:02:38 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-991fe70f21bso539826666b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Jul 2023 09:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688400157; x=1690992157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JmOoM4inSCJBR8S0rajelz+DFtakxP3fBnydY/lz0ss=;
 b=RmVZsnOi6/KkDVEl+uZ9mHV5dpFAolVfmMLESlX1zMo1r4p0gOWFIPNj+fUpHUVGXN
 lEC+S5T4tQ1kkchk2ih+yBzggDdOfjgWzqcblEbOIWhGYRp83Ey7YptWgtlb9SKUhgR/
 1ufR3ytemiktbgvxiZCnxpXq6yIisQRVPG1zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688400157; x=1690992157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JmOoM4inSCJBR8S0rajelz+DFtakxP3fBnydY/lz0ss=;
 b=FKLKxNCUu/Ij7FUh9Yhln/iXD3vq2S7V/jujx692AbT9PV4q82Oo8+65ig3rUiXRJ/
 06Dc6JgP6XSoHXzfIRXQAdwRYe6T2qYBGYepelf0P1ijPJhW+BW66ERqlUHJ5KRVL1JN
 vApnuxTE7XTDQdWaRkjoz7l+R6SXDM4HChMlWx2tfEZPAvNpjc5753GiYSlinjalDtLF
 /5ytmRuIV6HInsb0gcuXB91kxbQC3ziWnc5ZZHVY8NLwHU8v36jXWq56xcmafJYVlSAK
 Rl0qeD82dbuU5Jv8o9Rz2y4/W8vz6eIFdJ0QZ8Y7SsZ/pdoY/BC5Z78jUMJnzkGqi+yk
 kCww==
X-Gm-Message-State: ABy/qLZaTeoCQnm1VfgoBGK6lhlQgLJ5uZSq8V3VsTfmZxuf01W683p8
 7rqzFEbTE3/lcMoouXjq3NHXNg==
X-Google-Smtp-Source: APBJJlFKgSxT2hML+dGTMON9Qk9PTJhE3LNWgzaCcATb1SQpmhQF9BvgwGkdnCO+lf1AyRKkRtC0tg==
X-Received: by 2002:a17:906:2c16:b0:982:5fff:ffe9 with SMTP id
 e22-20020a1709062c1600b009825fffffe9mr6504041ejh.41.1688400157481; 
 Mon, 03 Jul 2023 09:02:37 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 k25-20020a17090666d900b00982842ea98bsm12108860ejp.195.2023.07.03.09.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 09:02:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon,  3 Jul 2023 18:02:33 +0200
Message-Id: <20230703160233.2303076-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, michael@amarulasolutions.com,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Subject: [Uboot-stm32] [RESEND PATCH] ARM: dts: stm32: fix display pinmux
	for stm32f746-disco
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
