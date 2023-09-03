Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C344790DF5
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:48:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 327C5C6B457;
	Sun,  3 Sep 2023 20:48:59 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03C53C6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:48:58 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-9a2a4a5472dso365024566b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693774137; x=1694378937;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0tFSdaOfLgjvu5lT2Mze0e90IV6aw9wvzp074I8xHsk=;
 b=Iei8g3uSRLJBJlbwzUHpIcLNlapPSDuEAn+W+l/ygG7S/D/Qj+65vv9FYG7cGVnwNS
 AFItOp4RayxwFkCPNdxlSH6PpIEeQxQqurQ3j7Y5FLdlA1GztIVmK8ND/akyf95gf3Fh
 ia2/kd5VDWC73iMBiR6z8+XYqPFpddbX9PXHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693774137; x=1694378937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0tFSdaOfLgjvu5lT2Mze0e90IV6aw9wvzp074I8xHsk=;
 b=NVryNi+l11pyDCgTgeNby4u7z7L3tGXFbv6z12KuIFUJz6QBRW2u5gqI+u/SerE4UX
 6MhiJZR7y0BegMwahhikDEBwzBvO0sBwuzb5B7v2Z4R0pJC+/5f10PtJAmV8CCUhSF7O
 DKPe8qeIdpvnZGAsGr3OwRBlJtwBV4nCRS//jAt66b8kJKS+oNsmTMrEeg0N8CuwPr0o
 90bBbEn17ZsOWB5oM/am1+ddpInQ6Mv1pL3H9cXY/K62Ird5BO1d9zYfkqM8hPbWDINa
 aAhG9J3QgUe7Gmz4lMWqbusYu3r7gQYsNIgFQOESErCVI1iPBjtOQfr+FO7Z/SrL0gXH
 jnsw==
X-Gm-Message-State: AOJu0Yw6I9Ng/hdAyXXEWdhXuVPBGIhMsx/XWG8shLiVb/v/lzCsVtvi
 bnj61OqoHzub3vwvlGi9xdL6IQ==
X-Google-Smtp-Source: AGHT+IHohTEO5zEvbbTV4Uc5AoidRRR95vDt995kYR8twHTCoCq3KWUHb/hScez+nzBjwmiPcD72RA==
X-Received: by 2002:a17:907:3e1f:b0:9a5:9b93:d60d with SMTP id
 hp31-20020a1709073e1f00b009a59b93d60dmr11300128ejc.36.1693774137676; 
 Sun, 03 Sep 2023 13:48:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a170906131600b0099d9b50d786sm5182466ejb.199.2023.09.03.13.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:48:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:48:43 +0200
Message-Id: <20230903204849.660722-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
References: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 04/10] ARM: dts: stm32: use RCC macro for CRC
	node on stm32f746
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

commit 7a5f349e592c254f3c1ac34665b6c3905576efc2 Linux upstream.

The patch replaces the number 12 with the appropriate numerical constant
already defined in the file stm32f7-rcc.h.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
---

 arch/arm/dts/stm32f746.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/dts/stm32f746.dtsi b/arch/arm/dts/stm32f746.dtsi
index dc5c257fb5fb..7b4bd805c998 100644
--- a/arch/arm/dts/stm32f746.dtsi
+++ b/arch/arm/dts/stm32f746.dtsi
@@ -526,7 +526,7 @@
 		crc: crc@40023000 {
 			compatible = "st,stm32f7-crc";
 			reg = <0x40023000 0x400>;
-			clocks = <&rcc 0 12>;
+			clocks = <&rcc 0 STM32F7_AHB1_CLOCK(CRC)>;
 			status = "disabled";
 		};
 
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
