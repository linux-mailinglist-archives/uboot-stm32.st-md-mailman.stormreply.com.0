Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ekVAV9Pl2mXwwIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Feb 2026 18:58:55 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D377161713
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Feb 2026 18:58:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08207C8F274;
	Thu, 19 Feb 2026 17:52:12 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D7C0CFAC40
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 17:52:10 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso10837245e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 09:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1771523530; x=1772128330;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VXul22mgOqTPFmE2l0Bw7pi4t5Fuo2IMZYSpgl/+DvU=;
 b=ovNvUyHqrR63FNBGD4CosFVV79FuyZd8TagT+KiizH5iYt3/IPpGJJa8sBsYzIl3YD
 rU9oeyq8t9cb1dxKVW3BpL6/b5NZdLYlqrNIzmMnyQaTG0gkVPbYIASws+MiDeseAr7i
 fRopHVIBrmyREx/fTdmtb7wygxYo0eL/0nJWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771523530; x=1772128330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VXul22mgOqTPFmE2l0Bw7pi4t5Fuo2IMZYSpgl/+DvU=;
 b=ab/KpXDDKTfyJPEM3H3EpYZKsfUKMs8DkAYQ1q5L2i4/c+1XbNTfGqn8P38dgkb0h3
 RQSrC6OrERiffeVp4rDLD8Vnuq6Y6rn/yjQpHsSLgXzIEFzLpXLmm2u7h4G7ooQ/Vz4v
 4uWvjCGqtPNSPanyOD6y7HsYCSnQ0+Cza5K5AZ4195v8V5IfeiqagzSKqSoEqsRa6P/K
 R66HFDwiHyxL6ZkQ/3+Vdm8aCVQb2RqIICnyQ8/QQun0PenK8PG8nE8VNhd6ACfSUKTf
 WW07Lb5M9th1s3G30jMf5ZQED/r42j2B3F95mWtsV4BrREB79TqOOsPCSWhzPwERQ8aC
 M4Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRv+SHgWQADTOUiHY8MuNz64sAmbXDv4Hg5tRlOVSKqCg+YkeDyo4GQIFmCLWpKlEeRLWghA1psxHgXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxGWb9LsqSu8sAywZJHNjAVZX0PC9OUplEqMCnn49EZqNNP41u9
 IuaKe+XiX6TzZgyeXvKRUJC8zvXdy/ydfFxj2wQlx5MEZ+pvC6T1sXVqC+dX8XKKYbI=
X-Gm-Gg: AZuq6aKFNxQhIjNFsXqEYNyR+mI5qvtZPHye8IFGPJi+/z/SwZWXfya+ehYWm7lpqC1
 98zSM/Keo8gDbMTj+2Rso8I24DZqdfuV7MriSa3EKDli0pWbYoLrB1sklDMrrIvFOi6G7uiq/yM
 5TxIEuzbYgqOqgyWWR3Q9e+dHktNsy/pOjqx1pEXLrrpbz9Cww6MSjFU063Ir6dXIx7LZda14rn
 B/2TJTov/9lQyuVOSxu5GRz5XDSe9gM9yFN+siRzuIGtcMK2BTvRPWuKuLDjAYYaMrJAV0xwvEp
 DL6KAkoyR0DVBi2qrRX1xfz7wrFrArqGgFNnt8ZFGZrxXYA3MtJ1Z0IwVT90XWP5J+FyNv66oPc
 WSsr6UG0u1lLC1Kuc7LOubF5oJhUdzpf1GIAnQNlLMGz9hMQhAuaKsOYpuZwcI0PGKylm6+Yds2
 FgBDb9ljFiM/IYZCaACzTG6/e/DWPFC1W4IK4xVpU8/N3ZUFbYZ8qfdHb0Ctwynnd5ztPXsPakI
 EXo1zpX0IV0GqAduarxkHn5fPNK07/8j8g8exjw4SzppIXpAm8roRUaSwXNeUr0QnMJl/w/+1nl
 1fVeiioEFZveSYjcNScgd6/3
X-Received: by 2002:a05:600c:6912:b0:483:709e:f22d with SMTP id
 5b1f17b1804b1-4837108fc46mr374253345e9.27.1771523529890; 
 Thu, 19 Feb 2026 09:52:09 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31b0e63sm35485005e9.2.2026.02.19.09.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:52:09 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Thu, 19 Feb 2026 18:51:16 +0100
Message-ID: <20260219175130.2839234-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219175130.2839234-1-dario.binacchi@amarulasolutions.com>
References: <20260219175130.2839234-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 5/8] spi: stm32: clean up buffer length
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:jagan@amarulasolutions.com,m:patrick.delaunay@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.970];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,amarulasolutions.com:mid,amarulasolutions.com:email]
X-Rspamd-Queue-Id: 6D377161713
X-Rspamd-Action: no action

Remove redundant divisions by using the already available xferlen
variable for setting the rx/tx buffer lengths.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

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
