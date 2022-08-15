Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA508595393
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Aug 2022 09:18:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94946C640F6;
	Tue, 16 Aug 2022 07:18:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DE71C5F1F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Aug 2022 11:19:10 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id s23so3702260wmj.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Aug 2022 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Zzw0tD28lKrfnnhC+ucdnirdxcYSjaljiNw88J/r6bU=;
 b=Q6yyano4XU0c73B9xJW/14fzFFvegD1SoAK84Jjs3FBYlC0HvUvz6dQqxSqyMLg6BR
 3no9dEf/8YQIFfiA8u0JW7JwCTW3LAOfqeYZqXx5B6F4PoFif2rUvQh5IKxT3vpMT2vz
 rrP16jUHiSVcfT9LC1WdN3QzQpllpcQz9P58Dtipt9GTdu/tNKHXy4XGdHSM3Ygbh06u
 C1wvqZfPRGttEnRncLgab3GU827AYGPuJ3QwLv6TQo5jRMTqn37T3nlBGlxPNKsHns5q
 bVlHpeVOEwGzSnlIaAMonO/12XLctJX4nMDA1T/5wPklmlJZw5HH7KXTWr/5BwUjCJnD
 Hijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Zzw0tD28lKrfnnhC+ucdnirdxcYSjaljiNw88J/r6bU=;
 b=B+KsmnZf72rDmCpORYdH/CzNtyShOs2ua7I/mZyH1swYr7xi6URTpPCBQnM8JHnWNA
 ua2lskxhu812QotLFepMMiXP4TZRrkXPUqvF7+XNKHvXPiE1gtu8c+xgAwg1WadndXRx
 nFimODkzM2QyPcN4lp40cGcQSepoxNbNcrmu3ZQ7hVSdmVsS8TzOmWpUAiRyHYmizSHn
 Azb61hWGBGU6qP1j8KYFzeJceDsW7JaVduJcBMMTEHwHoAK6LegX2kLMYg00i2RKquGo
 3bDkDITn4fEnUighgerllYybZDT543kDNTxPvNiJzvoT/aaLdCmuC15NFQud8JAUrP9u
 9/Lg==
X-Gm-Message-State: ACgBeo0w8t6/15uYgmSTirzeYr/sg1Cdykxqfvtc4loE8RZdYg/nam0g
 ZzSm92KlyAB1muvT+QW21sRIKUpxer/oKA==
X-Google-Smtp-Source: AA6agR41DMiYGe5S8eNhBzB1SgbbsNwrIkoaeqz6xaRJ6Q8sQfnRLlCjAkFlrRJEEywHe9mBy85lUA==
X-Received: by 2002:a05:600c:23ce:b0:3a5:c1b1:f952 with SMTP id
 p14-20020a05600c23ce00b003a5c1b1f952mr12534795wmb.137.1660562349563; 
 Mon, 15 Aug 2022 04:19:09 -0700 (PDT)
Received: from localhost.localdomain (78.red-83-60-92.dynamicip.rima-tde.net.
 [83.60.92.78]) by smtp.gmail.com with ESMTPSA id
 p15-20020adf9d8f000000b00223654e0eccsm9100656wre.9.2022.08.15.04.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 04:19:09 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge@foundries.io>
To: jorge@foundries.io, hs@denx.de, patrick.delaunay@foss.st.com,
 patrice.chotard@foss.st.com
Date: Mon, 15 Aug 2022 13:19:04 +0200
Message-Id: <20220815111905.4090289-1-jorge@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Aug 2022 07:18:16 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH 1/2] i2c: stm32f7: fix clearing the control
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
