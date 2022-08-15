Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C7B595397
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Aug 2022 09:18:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF1BFC640FE;
	Tue, 16 Aug 2022 07:18:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE3F7C04003
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Aug 2022 14:52:16 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j1so9365269wrw.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Aug 2022 07:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vQ6O8+7cXkxjpGaa2UKlRXQwGR4xK1zKxtcGOYvx+tY=;
 b=Lm6qjlSDeeday8vFVLmM9yQj4TKFPjoZX/ds8lNYiMFURRjuBqZvStYJ1DmLp/PCcx
 fq1ehT2/eTQSlmKstw8Ft0wmFUXqpLztqmbOH4Rpxn6b1Mi/KHzAoUJS0UgJ3CrDxNds
 HdBZ+Z7+YOxRR0NKGeucjQOMc7DlZMq6oeCS/bGk1O+NjePZtvav2KWW3GAcIXjctBzo
 sYxjSivja2b0VU43kZ2i1Bci95CXWN0+2uZjaURrgD29K/vEbTNRFMktF7JhMUgv9wHv
 7u5dwCUkIty/weDhRMgHTw2XHMVblfvo6auI+1wHZwg8yfDZ8phH1J/IMpVIAMrN19BJ
 U4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vQ6O8+7cXkxjpGaa2UKlRXQwGR4xK1zKxtcGOYvx+tY=;
 b=ozTj7TjXStDPT/XJabi8XtfOvA4I10Jec4ojGWaS4HM+9bWZKjslh6Fs9Jfi815T2P
 9Z1/wiDGZPDDr7hiMZRhLq2x76vNfe3kniEJoIhXyLee0WKcjsSF7O5NQglqDiw2fD1p
 MmRjesEMSbXobfAGa4+DBluUOKSQURqFb0rt/PRpkaCFVuPqmP0OpLH46M/2bKt32r+r
 3R/L4JVXWNCleD6ckE1/uz3ihNt3SzPso1dA6+kj6/UHQ/zXZdJrGW8NnGWklr9iFrrm
 oWjaufMRi/5bnBK0QtGQuzcveSCQecrOBx9xExhE7x43tgAIlXbOfTEON5w0NBiSlGkY
 C4LA==
X-Gm-Message-State: ACgBeo3eAaeL6RpIbqTrr6lo0HtmYLzOziYxYL+pr8wpvkSHhgrqE/S3
 tN5PJJDuPt8Yyny9we/P+4JOx7q+Rnm49g==
X-Google-Smtp-Source: AA6agR7OIHVOSCdFtktRWa9KjLAjNlH4k3RFI7nVa3QzLNMKEyAsy/kU7G6zmwTs+Ru189lHcWllAw==
X-Received: by 2002:a05:6000:184a:b0:222:cdc3:257c with SMTP id
 c10-20020a056000184a00b00222cdc3257cmr8817858wri.604.1660575136360; 
 Mon, 15 Aug 2022 07:52:16 -0700 (PDT)
Received: from localhost.localdomain (78.red-83-60-92.dynamicip.rima-tde.net.
 [83.60.92.78]) by smtp.gmail.com with ESMTPSA id
 g6-20020a5d4886000000b0021e9fafa601sm7502114wrq.22.2022.08.15.07.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 07:52:15 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge@foundries.io>
To: jorge@foundries.io, hs@denx.de, patrick.delaunay@foss.st.com,
 patrice.chotard@foss.st.com, oleksandr.suvorov@foundries.io
Date: Mon, 15 Aug 2022 16:52:11 +0200
Message-Id: <20220815145211.31342-2-jorge@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815145211.31342-1-jorge@foundries.io>
References: <20220815145211.31342-1-jorge@foundries.io>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Aug 2022 07:18:16 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCHv2 2/2] i2c: stm32f7: do not set the STOP
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

Sending the stop condition without waiting for transfer complete
has been found to lock the bus (BUSY) when NACKF is raised.

Tested accessing the NXP SE05X I2C device.
https://www.nxp.com/docs/en/application-note/AN12399.pdf

Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
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
