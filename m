Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3j6uMo5/mWndUQMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sat, 21 Feb 2026 10:49:02 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5029F16C893
	for <lists+uboot-stm32@lfdr.de>; Sat, 21 Feb 2026 10:49:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 371F6C87EDD;
	Sat, 21 Feb 2026 09:43:06 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FF2FC87ED6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Feb 2026 09:43:05 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso20127565e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Feb 2026 01:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1771666985; x=1772271785;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2I0WIwQmrmNMS5z4W7A+IyZgO6lMfDS/49I6LdDnFY=;
 b=En6xq3KihXl6/BZWz3lyifm9ua+bcoUfvjzHzoBacilCVa+5D/elhzj2a0Ul7sbXgu
 ECKPsXU+pDWPwcyxbrP5qsyDDTBUecj0BMU3BYP5PbpG0N8xYUy/mLTLoJuNN7MO+x1O
 mB6hiL0ji5KFLwr+f8+0bv5J0JmpLFRaqjv+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771666985; x=1772271785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z2I0WIwQmrmNMS5z4W7A+IyZgO6lMfDS/49I6LdDnFY=;
 b=owJcJEJ/F0lF1/Cm0++QMXAeKg1bJQqJ8H4Diw9N3GzHPtTH6Lsv1JVFFrHIs3WPB7
 a1din56pNAyXYz5JmYNPma8an+T9904bCJCgfYxy3uqs+Wor5bKvZKny0fXQ9TKEmGJs
 xDqfJE+zKX4b5wubWBmZV6sgv7DgVnUMekFNL2q20fr6QJO6qnH58/Y+VjIkASCpz/Lp
 8Ae79B33Sc60SAN8sNJ2NbsQ5oLd//LUO6bNqMiP14hiQHOGYBuBqZJfalNag+jjz3tc
 e89LVXCNwZNY7ktmWRUKSuqRULwvI4C7NyQJecrAv5EoAzQ85nmNvFVdiaOI5jeFbgIW
 wY9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS7O0WBMJeVlnGUdn60cHnDEg9q7+HDIhQXzURjMFDAp8xlMgGRi+yetIGhzbdNiFFbspI7PLp/FMCBA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxAVAFrgVaxrgk0oHKCI40YPnVBEmDbIWA2/WS3B+ebnkeX6y7d
 wJPjrLGruLgDxWKO9QRbMgXE2iLzF06nR/JQNiuapMdKyCn0a4W4oZt3o9tqunC08Yo=
X-Gm-Gg: AZuq6aKVXdSbMAI8svw4mKDfZOOQ0qUEFgpaVbytn3WMsKPQ2mp3aKWI0rZv887+cEV
 fN0Z+xVDGq51ItM30BTzilIRo2bopA9aWUYC63EbppRowA2TBorqgRBVv+kd6WzdeduPy2kR7Mi
 FjDCcF07jkU4Dq5BddhkhVduKYrbDsPe23sXUF2SQ3WEbggN7G8yVG/f4fOCeDfgVxX99KBPC8s
 ffkNfUiitRPOfZkzzoEMIAbC+eZ89yBFfI/DdwnpNDBNXeGh9oxtGxYkOSKfkW5VELlUKZRtdCL
 Ta5CA2a6IsmV2VIuzt1OV4F5g9SVqKDUPh3Q01l8EIbJcCvyIW0oGOFJzyTGd0YfNlhtBsHdvr3
 yMNmkU6QH1XNf4VkaQxv6umaOuscFsX4gG4xg+xah+WNK5nVRYE9msym/gHh+Ns75QgNh0TQ4QR
 zd/NH2wjxEV5eNcaN/Ti+pXELEsXc6pQgKSHx+NTyBxNm2VoniWlECrHU3UN2SZU7L5k9MjXEZR
 seVwGdGIqDN9VrSYckngYVj0iUabk3+rslvRVtpAchGWw5YS1Tra2o5tKNRoD/xvCG2NidcH4rk
 ztNS/W+KBCUyHrIugTYhep2fBVqSHJP+3dc=
X-Received: by 2002:a05:600c:c8a:b0:483:71f7:2782 with SMTP id
 5b1f17b1804b1-483a95fc09emr38949375e9.12.1771666984641; 
 Sat, 21 Feb 2026 01:43:04 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a42f3968sm42694225e9.19.2026.02.21.01.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Feb 2026 01:43:04 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat, 21 Feb 2026 10:42:19 +0100
Message-ID: <20260221094252.3103034-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260221094252.3103034-1-dario.binacchi@amarulasolutions.com>
References: <20260221094252.3103034-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v2 5/8] spi: stm32: clean up buffer length
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,amarulasolutions.com:mid,amarulasolutions.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 5029F16C893
X-Rspamd-Action: no action

Remove redundant divisions by using the already available xferlen
variable for setting the rx/tx buffer lengths.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

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
