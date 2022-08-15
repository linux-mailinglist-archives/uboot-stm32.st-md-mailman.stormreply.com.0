Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D519D595394
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Aug 2022 09:18:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B4F8C640F8;
	Tue, 16 Aug 2022 07:18:17 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24266C5F1F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Aug 2022 11:19:11 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id bv3so8714088wrb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Aug 2022 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=q9U2TW0e/frdyYfbR2WnwVv2Dl/KqCNwmzRTIzSwHcc=;
 b=fhNLfI95VJ4hXHUbdz+02CffloFuJijcnDILziP9K2PCfQ1FbhlxXGELYVFOfF/GJ3
 sCtIxNW4HxNxJ/0NTpUGNEM/DEzlaWHLwFEEkA96BjksdMpLAgfPGTeQwmY52HCISc0E
 swmyWJdInt9XgVKKGGUo3aJEH6CvbllN00YmdHB5rHYQF23e4JDDSs80/cumFLLb8t7n
 Sk9Q4SzopYjqKQKMsQCrkTjCi4O1AylYk3BejxdNPv8PnScKZ79nJSFfpxRqn5g95MjP
 MRXDOVgQX1CHvYFypgETQfil5c0TImsRHSDeYwGAbkwjU7c4m/oK72RgcR75DdBtQjgH
 d6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=q9U2TW0e/frdyYfbR2WnwVv2Dl/KqCNwmzRTIzSwHcc=;
 b=fopP/v4NsMOgri2jIuzStBRkjalTJpwZMuJKYZ+paO3CcZr6Sou9art8wvq8hpedw5
 +0C3gxi+v784/T2wYQYhlkWAweVCPiXpsnV6m5U3SoJS2SouxDOcs5rCEG/jlqOxKovG
 Vn96Nkn1Dg6YTwEHBumdV9+VlGev0nMvDpd8AEh0Zr1zp3Vd822K4i/CVych/dgFyiVh
 zrdQr/snhFWXt1XCCMEex2WzNJ8/YgUWJG1UKiqJjcFACopxPMx3ru84gE+G3K1JV/xF
 WbV5/qP7YydxixNYr5tSFsfC3DHz7mmOSeUjpO25H3HjnnDZgsBmYympQ0g5Li1Ox0kR
 pMdQ==
X-Gm-Message-State: ACgBeo0R6HeLu1on458ekamy8UM6H5LadYbzLIgde1B1Duu1yfN/dyiT
 +OpxOhFxGBcWyqiWahnpCTszhA==
X-Google-Smtp-Source: AA6agR6LFhQYzjGTUbuG25Kv3Nad60tNau8NWHKD6iiDdgHBfJR2Rop0ULj2yZhio8fUgpkDOLm9dQ==
X-Received: by 2002:a05:6000:4083:b0:21f:fb6:9293 with SMTP id
 da3-20020a056000408300b0021f0fb69293mr8316496wrb.303.1660562350757; 
 Mon, 15 Aug 2022 04:19:10 -0700 (PDT)
Received: from localhost.localdomain (78.red-83-60-92.dynamicip.rima-tde.net.
 [83.60.92.78]) by smtp.gmail.com with ESMTPSA id
 p15-20020adf9d8f000000b00223654e0eccsm9100656wre.9.2022.08.15.04.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 04:19:10 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge@foundries.io>
To: jorge@foundries.io, hs@denx.de, patrick.delaunay@foss.st.com,
 patrice.chotard@foss.st.com
Date: Mon, 15 Aug 2022 13:19:05 +0200
Message-Id: <20220815111905.4090289-2-jorge@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815111905.4090289-1-jorge@foundries.io>
References: <20220815111905.4090289-1-jorge@foundries.io>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Aug 2022 07:18:16 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH 2/2] i2c: stm32f7: do not set the STOP
	condition on error
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

Sending the stop condition without waiting for TC has been
found to lock the bus.

Tested accessing the the NXP SE05X I2C device.

Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
---
 drivers/i2c/stm32f7_i2c.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index 3a727e68ac..14827e5cec 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -485,9 +485,11 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
 		}
 	}
 
-	/* End of transfer, send stop condition */
-	mask = STM32_I2C_CR2_STOP;
-	setbits_le32(&regs->cr2, mask);
+	if (!ret) {
+		/* End of transfer, send stop condition */
+		mask = STM32_I2C_CR2_STOP;
+		setbits_le32(&regs->cr2, mask);
+	}
 
 	return stm32_i2c_check_end_of_message(i2c_priv);
 }
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
