Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLx2EPogn2lcZAQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 17:19:06 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE52419A6D6
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 17:19:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A750CC87EC3;
	Wed, 25 Feb 2026 16:19:05 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2A36C87EC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 16:19:04 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id
 5b1f17b1804b1-48370174e18so38282205e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 08:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1772036344; x=1772641144;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pcxa8RuAuQ0nAmPNS8KBumLjBig8XfBZxlRBMDFBXrY=;
 b=gLTw/5MaLTo/hqMjswhmE6XC/mG2ZAFmy9pdiWUHMn9P7ybXkFsN+nM7lvF1q7PXsE
 X1/eQ2HBjnqRSyh40nydk9wbFIAFg+wBEKkYkxD3RwurN1STi0XUTKoNyn7n910ww5PJ
 8NVVfQdbEv1FMN48HaXIryZvZiEKaxSZGFFdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772036344; x=1772641144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Pcxa8RuAuQ0nAmPNS8KBumLjBig8XfBZxlRBMDFBXrY=;
 b=fOcbFhZ7WeXxjHbludAm1d1HNs5CUoV3XxtxAC7qR3a2SxuL/Q7ux+GnUT0wNSRPmv
 MJqLA/0l+x4pTy5rOgIuHcv1GpqGAwHYoEEJj+Nw0H72KbZedtEFGXQhiTYT1B/XgjuT
 dYqH8kgMRXt2Tmw0aP2WzBHcnY1ieIJq/aeF5fhCjExFA9GQpJhZuJKJeVYGjGR4iboq
 tQeJYsWhjDGrehvaOKI9b56Tw5rCk/1SoKuH1pHHNGD6eoOO3Msnb1nDvd68yG904bmn
 KyspZsQ+Jkq/bhXbh4dsvdX1FB//EMdV4F/spO05oqzRQ3yr2Jrlehyi6oRqm6+CQQlY
 AwiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZDB7o88pFzGUls94crXlUwVhziAIRvke27HMc4cGVuNTv5vqAwaS7/r/N9GkESWFctAe6WvHilX8qiA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzGFpfSmWLJLTZJ5jv7z7OIwabflsASoGSpflyXHm2UG2mqqCzG
 aJQUjvJsX70of066jlo0vQvORb6Fxwz25KBufHjExL+2WO+Z/45I74NvbgyWbroN2+E=
X-Gm-Gg: ATEYQzxomtSAB0PSJEukGNnYxbvzkXShInIyXtmvP/zGK4uraxYdbiobX1w12s2+nyB
 hyOpHcKog+QtOyfOiaSyewiDh3HNPweC0+rClAQveMfQsaoijM8oR0XgQ+H8+R4dZiXqxEngWCy
 gYegQ9uDao//DvUW6Gp7gwFiUAmnT3TWUdT4dgU8n0gthehKP93KFy0qL4Ug24r0P+SFtWMJGJ7
 msNB+maeV1zRc8//bEjKLNORghyjTIeQ4GsmrCaDGcwtv4GXRzHWd1j/izO7QOUlPUdmd+rFcWT
 cPLPJxJP6odFw5Wt5qhdOCd+LN1zPwqWHrWNJ2Rgq9tqpkdk/GgySc5+bTQFSNZA/NuBFQSaFjd
 37TaJ71NGMCHguGw1So3J6dtGHZuFz2PPFWcH5wsSmiid+9LIe6ILtQ+m+L9dSPjtoPG5bTtweS
 rmLRDEQIulo17m22Kj7SkzHhVbaKk0tP159HerTIEC7sCHd6eEJW//FYfqfAh5JT2zYr0huN3jH
 g+WwCDkEZ+bZgUumH6Ph6TwPtZTMBfMJKUDdCDT6Mcb1Otg
X-Received: by 2002:a05:600c:c172:b0:47e:e779:36d with SMTP id
 5b1f17b1804b1-483c219fcd7mr14401395e9.23.1772036343971; 
 Wed, 25 Feb 2026 08:19:03 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.111])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd6f19f5sm186562265e9.1.2026.02.25.08.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 08:19:03 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Wed, 25 Feb 2026 17:16:56 +0100
Message-ID: <20260225161851.2475274-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225161851.2475274-1-dario.binacchi@amarulasolutions.com>
References: <20260225161851.2475274-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v3 5/9] spi: stm32: clean up buffer length
	assignment
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
	NEURAL_HAM(-0.00)[-0.986];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: DE52419A6D6
X-Rspamd-Action: no action

Remove redundant divisions by using the already available xferlen
variable for setting the rx/tx buffer lengths.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v3:
- Add Reviewed-by tag of Patrice Chotard

 drivers/spi/stm32_spi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/stm32_spi.c b/drivers/spi/stm32_spi.c
index a1f31cf653c7..adba97915cd3 100644
--- a/drivers/spi/stm32_spi.c
+++ b/drivers/spi/stm32_spi.c
@@ -404,8 +404,8 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
 
 	priv->tx_buf = dout;
 	priv->rx_buf = din;
-	priv->tx_len = priv->tx_buf ? bitlen / 8 : 0;
-	priv->rx_len = priv->rx_buf ? bitlen / 8 : 0;
+	priv->tx_len = priv->tx_buf ? xferlen : 0;
+	priv->rx_len = priv->rx_buf ? xferlen : 0;
 
 	mode = SPI_FULL_DUPLEX;
 	if (!priv->tx_buf)
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
