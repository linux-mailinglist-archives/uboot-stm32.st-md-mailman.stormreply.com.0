Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDBF5A09C3
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Aug 2022 09:18:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C56FFC640F9;
	Thu, 25 Aug 2022 07:18:55 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E92A7C6410C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 15:56:14 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id s23so8973440wmj.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=y4bfuOeB6+agywo7UJ8kDQhw11NRvOfumnXn5XLy9K8=;
 b=HS0cSQcFMcTqQtbfIAfQTPGBP3lDSpl7OPQau7msnKxDrpfknTER287b3sfOvXFZkq
 q+8oKtqw6vYJOBb9UswIOqygqTgas72tZFGsblzSBhBVPuPwk3uy1W9Q2YLDPALs1gEe
 wc3zyI6E34fqLgHMfMlSs3uDtwKZZ+bsJtZvIbNM9prJYoPxp8pjeOIvYo20Fyl6X8V3
 XGlYLZKN4jR7Eqs7boMuWxcP6J5jwSXsCqgRzZrq7b5K3WiPgi2myr5bExR9Ly4Gpbia
 /EMKZwJEUikGf+TTLEWO+bb+2QehBSQwH7/zYdtl0uUAqHMiZKqAmCJXFQvVgZoU7ZJh
 Fp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=y4bfuOeB6+agywo7UJ8kDQhw11NRvOfumnXn5XLy9K8=;
 b=M1KJWtukJTm0Nlhb6DYWWqG8XNeLpahHuEiAMn/zeh6+DNt1ioYX1lr06n2CyTTovD
 +bkITh5SLlEh8phdsNoxVIWsjzxFRRc+rg5o/RS9O+1n6x5BQE1ZKg9XyhzPmMOD2fmp
 rt1tR8w0ZlIiudtQtRV1ZdF3KyWKSiFPSAO8lLj7YQiBH60P8mYd7ePBiB8CCHXGAS9m
 4zI8nndTGEebL4i7KQX8AH0Iaqka/vBRkr4Ci9+fqBVVgYal+r2x/NnBrCLw1vtSwNNp
 NZp8+JT+Y0iNLDs+y7xMZKbHbuAMrL+/VW7n38pjgurFqJMwL96yj8H3aNl5IT5zkq5v
 M+Rw==
X-Gm-Message-State: ACgBeo2EfNpN+ggrvNdeW+RshIXXVVj6vP+HtMEEbXzPl38FJKBcIOmw
 aWRliAi9IKzkqB8FfBVE1qzaog==
X-Google-Smtp-Source: AA6agR544m7kJ2w9zNqsmrfh37/uaS1RueM5SFUqvkagOtxDMwLtlk1DuW3yLNI1XDxFThzfc76JAg==
X-Received: by 2002:a05:600c:29ca:b0:3a6:75fe:82af with SMTP id
 s10-20020a05600c29ca00b003a675fe82afmr5840934wmd.3.1661356574425; 
 Wed, 24 Aug 2022 08:56:14 -0700 (PDT)
Received: from localhost.localdomain (78.red-83-60-92.dynamicip.rima-tde.net.
 [83.60.92.78]) by smtp.gmail.com with ESMTPSA id
 z1-20020a05600c0a0100b003a2f2bb72d5sm3509208wmp.45.2022.08.24.08.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:56:13 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge@foundries.io>
To: jorge@foundries.io, patrice.chotard@foss.st.com, hs@denx.de,
 patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io
Date: Wed, 24 Aug 2022 17:56:10 +0200
Message-Id: <20220824155610.3835981-1-jorge@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 25 Aug 2022 07:18:54 +0000
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
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

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
