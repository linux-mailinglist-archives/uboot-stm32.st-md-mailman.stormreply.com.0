Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LUmBfwgn2lcZAQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 17:19:08 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA68D19A6DD
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 17:19:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2CB7C87EC4;
	Wed, 25 Feb 2026 16:19:07 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23C56C87EC4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 16:19:06 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48374014a77so72686715e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 08:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1772036345; x=1772641145;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GkJhvi1974w4+hMGdr7GktoYxy4wpW/zeqmFApZg+vA=;
 b=QYy1GHCCbe584ycseMukNN9Yh7vpPJyu6fGTLY7N9ihP0bry1z4l0TnBp2kfvkLo9N
 tbx3ou9bEdsCvsZMHM2ZshqkYEmcM+1F911ct7zvdqltBXnB73PVx68ffAg5pZp/SL60
 hyuNGMajUpH9/bY7aXhHu7nZ4R6zU4gFr3uGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772036345; x=1772641145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GkJhvi1974w4+hMGdr7GktoYxy4wpW/zeqmFApZg+vA=;
 b=E3EMOc6iSSPZvZhmUvDziTKubcpvVA4XKeGqyEU8/27B7+Yc0yW4/SnktJqOa2oSCS
 Pk8kLMqcqiyyci6KzKJVP5Dz6vGFv9MVhbesXnxH4zIHuEFe05A+hMEbJ+mWOesa+aQW
 6+ldFMVYDiz1l6J3vZlVUP4D5qblaNg5ggcHL36hhCXVAxIcIL4gpApLLnHVIkj3C2kx
 aB18CmB143VFCS2AawZB4VstOqXgEklkSzhzzBQRRW5XIgC9nyd+QSzZOH3VjThI8ddQ
 LNx8/DN5feY/brChTsTfnKc/G/wuRHD/RezIwo9CAkLI8OhZbTxrpGKCvfhfS0gHwU9k
 p4gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt5nH7co8AztfFfDtek+NlpE0oUQSMFB69+GaCKLAKZscwalLYs5eX8hL9Ba/eBoOUAqAf4Kc2agQpRA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx9ZZn9mK3UUH50sKakeMLMyXbYGoQWXd5X2aSfhYHaU/B/8UqE
 jQL1srJYLF7idjlt43xWciov37u/miXGr55zWuEctJtKSxnZ3Jea9AMFsLUwCWNqqeI=
X-Gm-Gg: ATEYQzyv35OYZJ9YHY3c+I9jbcEgCLuGRqyhhb5pAeWp0y6MPWNMQn5nULU2omN7PZB
 9t5ouJ5paVSWygIPKQwdlJ53X3chhc04SKrOZZSSizEMzytr4Xseq5+FLrJsUPWwkil3lSAmDGQ
 4ap5jyNNfJdCucGBcttgiyWmJ27T3YOFHVnzvWckflNXDpfd6LNHsbqI8qRdWT8WjrI5nxCIf+V
 uQ9tpyZziet+QeoqKTc0GYkrBnatgEs87edp4sVt+4mTOkTb744Ji1B6+NpWTOk1ufIvSfP5CWi
 S/yxMh8Lx/I83Jqfpix1KfSFXHMzZRaBXk2VNQZN93bT/X7ZWSthTpnlpYnTBdbnrqJ+oDGKZBt
 XhDzyjkyoUfxbjelnspLDm6HkDfIXsraOonDdeOgSrQr/FeIbI9Idft/dL+bhX2IfSlqxpj2/yU
 16AnyVSTMwtEwP8picib5u8NgmiSNnVlwYWkkKQcu5jOZ0OkteVKThlvS3xi23bz4zfJSm7FAlB
 OfWX7U/+LjM3Rf1Wa+4BXIyEklaCV7aqNtDF0RTOx+unOKx
X-Received: by 2002:a05:600c:4f4b:b0:477:a54a:acba with SMTP id
 5b1f17b1804b1-483a95e1f34mr292230325e9.17.1772036345446; 
 Wed, 25 Feb 2026 08:19:05 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.111])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd6f19f5sm186562265e9.1.2026.02.25.08.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 08:19:05 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Wed, 25 Feb 2026 17:16:57 +0100
Message-ID: <20260225161851.2475274-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225161851.2475274-1-dario.binacchi@amarulasolutions.com>
References: <20260225161851.2475274-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v3 6/9] spi: stm32: add stm32_spi_is_enabled()
	helper
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:jagan@amarulasolutions.com,m:patrick.delaunay@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,amarulasolutions.com:mid,amarulasolutions.com:email]
X-Rspamd-Queue-Id: EA68D19A6DD
X-Rspamd-Action: no action

Add a helper to check the SPE (SPI Enable) bit and replace the
open-coded bitwise check in stm32_spi_stopxfer() with this helper to
improve readability and consistency.

This is also a preparatory step for future driver updates that require
checking the SPI enable state across different code paths.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(Added in v3)

 drivers/spi/stm32_spi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/stm32_spi.c b/drivers/spi/stm32_spi.c
index adba97915cd3..70eb8735e03d 100644
--- a/drivers/spi/stm32_spi.c
+++ b/drivers/spi/stm32_spi.c
@@ -192,6 +192,11 @@ static void stm32_spi_read_rxfifo(struct udevice *bus)
 	log_debug("%d bytes left\n", priv->rx_len);
 }
 
+static bool stm32_spi_is_enabled(void __iomem *base)
+{
+	return !!(readl(base + STM32_SPI_CR1) & SPI_CR1_SPE);
+}
+
 static int stm32_spi_enable(void __iomem *base)
 {
 	log_debug("\n");
@@ -245,9 +250,7 @@ static void stm32_spi_stopxfer(struct udevice *dev)
 
 	dev_dbg(dev, "\n");
 
-	cr1 = readl(base + STM32_SPI_CR1);
-
-	if (!(cr1 & SPI_CR1_SPE))
+	if (!stm32_spi_is_enabled(base))
 		return;
 
 	/* Wait on EOT or suspend the flow */
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
