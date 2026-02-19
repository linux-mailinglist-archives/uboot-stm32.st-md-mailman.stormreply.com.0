Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id U4dpAl9Pl2mYwwIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Feb 2026 18:58:55 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72682161714
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Feb 2026 18:58:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F3AAC8F276;
	Thu, 19 Feb 2026 17:52:19 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CBF6CFAC40
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 17:52:18 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so8459535e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 09:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1771523538; x=1772128338;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/L2k49Axo36HmTk3ychvt4IfhkRbfJbkWri6gh4E9Y=;
 b=cMZanm9r3epkCKSPdc7Ka10+tpMsuy9Rup1o+Gm+5/X5Sl6JGhIb9VzRefBwgF/DEu
 ZyTp0LgKym4Jnabd7I+4GT37nm6IZBaxqlc7kRT4aCJk459DehGTZ8T75CzFP2+8o8rD
 0IhKaLuMIV/TyD7QQj5ZOo21kB4yAbWEJ1j+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771523538; x=1772128338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m/L2k49Axo36HmTk3ychvt4IfhkRbfJbkWri6gh4E9Y=;
 b=nS2wCaTiodMZBVQUe9PJDrf30NkagYLqsVnSbIMUD+IngabZRMzOwlc7sC5bYTP25Q
 i3gCIQ99wyY5VVSVNqehFgUFb6cbllfXCPjpNYsd/Z3/GgGKnrX0t56t5oJrzqqqk7M/
 3uMpUBqotM8qwd3LMBJ3wNDks+SPtlYhTW7BNkGiXFvi4mYbr2pRNG9sBz0+bkPJgKdS
 gUG/4AS/28glmMp9sBJnORy5EU+YQ78eHsAMeZnw9H60wstbHrqJM1dcinHTGyG28KEw
 ssgIAH59fCiVcLWaRjeahlYINWUK9lWJkjTDIiOlSfLNsVA2lJBqSut75l4BAobQRc3E
 /UAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ4rXZgvZL0xcfOPwelX8sd427PXt07QMCGX+/Q9exvDzdKJf/0LQhS9M3wGbImcth1AIFv11vbLv6rA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwJ/DLq80AvhwlYpMPu3G9w6dguhgBMfFJEB4G8d76evUZqfkMX
 994E0b5IiEoMYujt6Q+nSmTWZj+DDvT537B89owGZ8I8Qj/xiwDunJTxnEszj446Ph1GCFxHQd4
 h3z39
X-Gm-Gg: AZuq6aJIvak609ZcC57pApjqpENcGEo9N5P12PQ99HezLV1csD5gQc6sWKjEuqrGLkz
 bVGWcBTmevMPthbPYAc4uBLTalhBfFvjszkGGoWPjVLTHMOsvBV3dpRSmOCmkASiV5BOMv/8T1l
 Lf7aFlASTILRocx1kciMCSjb37qhi6sR2XPaajahwIBbwzqQjzTzIFIiDcgRTzKSRCTebzQ+OqI
 sWNA3U9VK+PGvwhfWwiqq0Jd+S0+QuZMK7vdMj7oNvHFY431GHFDxfV0MDBp3AGVAZkSwgs3wxp
 2MPmIK2safvpLfiu1qOl9FaWJW03hOhxYCVmjVmhzsv2wAr4hqOHUC7Hb15Sp3eTbzlBRZyV0Rg
 FKzkN6r4SfYSP8dHwMLxdhttICX4pgBgaol4yYhlIlhITDG32S70mtNG7iM5e7gJWkpFWylpC4i
 i4fwAfOHAtCRQWDPv8GOlDy1LgFwISK+rOdLLKv5yoK2TSCj+FfJevcfZimyl2a9V1zQFMKq1/z
 2Y/TL1uWQ1tA9o5JSJiLF1o46l8qsn2aWiKSq4Wsfrj5kZSkOskmZ04DjKGhc2RaHdo0fqWiQtU
 /MZrl+bjtxKlStct/DUBBYoQ
X-Received: by 2002:a05:600c:4e45:b0:47e:e48b:506d with SMTP id
 5b1f17b1804b1-48379bab48bmr391159925e9.16.1771523537844; 
 Thu, 19 Feb 2026 09:52:17 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31b0e63sm35485005e9.2.2026.02.19.09.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:52:17 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Thu, 19 Feb 2026 18:51:18 +0100
Message-ID: <20260219175130.2839234-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219175130.2839234-1-dario.binacchi@amarulasolutions.com>
References: <20260219175130.2839234-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 7/8] spi: stm32: extend support to STM32MP25
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
	NEURAL_HAM(-0.00)[-0.972];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:mid,amarulasolutions.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 72682161714
X-Rspamd-Action: no action

The SPI IP in this platform is fully compatible with the current driver
implementation, requiring only a new compatible string.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/spi/stm32_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/stm32_spi.c b/drivers/spi/stm32_spi.c
index 39ea69c68174..903cc3702807 100644
--- a/drivers/spi/stm32_spi.c
+++ b/drivers/spi/stm32_spi.c
@@ -686,6 +686,7 @@ static const struct dm_spi_ops stm32_spi_ops = {
 };
 
 static const struct udevice_id stm32_spi_ids[] = {
+	{ .compatible = "st,stm32mp25-spi", },
 	{ .compatible = "st,stm32h7-spi", },
 	{ }
 };
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
