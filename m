Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D77595396
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Aug 2022 09:18:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8532C640FC;
	Tue, 16 Aug 2022 07:18:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D501AC04003
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Aug 2022 14:52:15 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id bv3so9354584wrb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Aug 2022 07:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Zzw0tD28lKrfnnhC+ucdnirdxcYSjaljiNw88J/r6bU=;
 b=UMLpyIpyUDybuYEvC9FJhrDVyfr7gjc7PRzlJvOGcjEC3w/3dIxanyi/ggeyaaqDwW
 vWZfwnmU+xrLPtLuT3k7y+VFfl0iIu5dhfyH61xO6R8ZEzq7F1J3Egr82YtTN6F52bs5
 R4kOR7J5yfBA1Yec1WMLz0JeAkurl/Vr7VizZ7JUxwETaHalXuQH377hiCf6He+di1o6
 vWQ4zpQGFpqjwpOGH1rCiLEotjyPsjlGxvef20LB4nCplZZIKqcf2QxlVMQg0hIrFWuj
 22laDMMOXmsx/YWGzuOcFUhCq9kXVP2kY4YwRWf1DPWzOUqqCJDtm9IITvESUXwjjjX+
 NoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Zzw0tD28lKrfnnhC+ucdnirdxcYSjaljiNw88J/r6bU=;
 b=IQKFIJFq4Kgu8AI+e1VaUgBNnWysx9xT3KasnJbam+dr+Afyvk5Q14HITTNoVDzXPP
 44dGOqb8RCbGJlmXG2O7NFKHB8ZyXw133h4LIB6WWTKtwHsyQXuOIR0NubvmOw2yNip9
 rKrLRIe+r4hruiF1W53IIg6/wgGjVTU86r/Im08dtjjG2PeaoJ6NvkclpJZ8ugBAYlku
 7stSnxlU5MRWcZj+Gfb4na3NZ/0fqnLnX7XGC/Wh9HUy2eT7bOdcS0CcKc6gOQRWk03I
 K04QU8qyOoNyY1Tx4T04A761zW/iBDh03J2JixprGXhtxY/S7YjYWiaBst85kx3Hz6HO
 FePA==
X-Gm-Message-State: ACgBeo0e59tPtATXTxnOXlDQNkpTeYGsTvjjCKgvsVduoslo9xD6pSB6
 umeAbOAm/gQJBlXWCU2wr5rS8Q==
X-Google-Smtp-Source: AA6agR7wgtB6kl9T7DPiY1Wa1KP5zEELO9bN5fIkIsCyorqMJpM5J7QAJ4JosVE0uxJaW2iNOhBGmg==
X-Received: by 2002:a5d:6a06:0:b0:224:f83a:b30f with SMTP id
 m6-20020a5d6a06000000b00224f83ab30fmr4666551wru.282.1660575135323; 
 Mon, 15 Aug 2022 07:52:15 -0700 (PDT)
Received: from localhost.localdomain (78.red-83-60-92.dynamicip.rima-tde.net.
 [83.60.92.78]) by smtp.gmail.com with ESMTPSA id
 g6-20020a5d4886000000b0021e9fafa601sm7502114wrq.22.2022.08.15.07.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 07:52:14 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge@foundries.io>
To: jorge@foundries.io, hs@denx.de, patrick.delaunay@foss.st.com,
 patrice.chotard@foss.st.com, oleksandr.suvorov@foundries.io
Date: Mon, 15 Aug 2022 16:52:10 +0200
Message-Id: <20220815145211.31342-1-jorge@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Aug 2022 07:18:16 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCHv2 1/2] i2c: stm32f7: fix clearing the control
	register
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

Bits should be set to 0, not 1.

Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
---
 drivers/i2c/stm32f7_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index bf2a6c9b4b..3a727e68ac 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -413,7 +413,7 @@ static int stm32_i2c_check_end_of_message(struct stm32_i2c_priv *i2c_priv)
 		setbits_le32(&regs->icr, STM32_I2C_ICR_STOPCF);
 
 		/* Clear control register 2 */
-		setbits_le32(&regs->cr2, STM32_I2C_CR2_RESET_MASK);
+		clrbits_le32(&regs->cr2, STM32_I2C_CR2_RESET_MASK);
 	}
 
 	return ret;
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
