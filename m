Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UssbL3LERmoNdQsAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 02 Jul 2026 22:05:06 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 498CF6FCABF
	for <lists+uboot-stm32@lfdr.de>; Thu, 02 Jul 2026 22:05:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=chromium.org header.s=google header.b=QA3J72HF;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=chromium.org (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0055C8F26B;
	Thu,  2 Jul 2026 20:05:05 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC262C6C858
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2026 20:05:04 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-6989c0ec3c5so3985061a12.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2026 13:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783022704; cv=none;
 d=google.com; s=arc-20260327;
 b=cB96jlVV2ghpb3sBkRmy2HT/W1W9fZI+WsXVQbr14Br+l2Gn2khUzcYt0HCuu4twlD
 l8OE2nKbGCaIkrB6mlOmbDb/NUDz/2XBsnTFj1X2p4IBHynJxuX8H1ryVGgXswcWNIVO
 6KCzvulkmzalUzF0YEGyawJ0njlUE2OXnj8OG4G7W0mWtT4I7bv5A675PQOHCtTWbaSg
 RawRigNLbWQfrUsmMK8VQQStsX3iicgOGL4d9kjY0+0IZY0j0P+64EqjXDRixzpjZBvS
 IeAytEPAwYJMPfazXpSxon6jm67X+1prlVYp6PTxwY62MiII/oSiukUdAJukUS94rZOz
 8hWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=lCPCamKDz7DE1PgjAh6FHU2TcwAO3uhrJXXGvyqlfHo=;
 fh=ffYdOt71qGAsXegN4pxOCY6G1WcpEqXUq0DYrBAochA=;
 b=Cu8cJIodVl7t29FTHDo7DbuB4QRyHpwdQmbUlSIse/F1TbZpfkE40NLX1mDvvB9+3I
 li21JMO8UqarTQ+6mWbMr5dJWqv7TcstIv06dauU0JEV8askW7M4ZZM8SR9j5cgCQY99
 TOsWA5thtGkaVXO9flxidBFjoirSJfvLtE+rBC9udzE8zQ61P0HQtJ2KocHl1k5MNLUL
 j23O8X3ccoJa7YKtxhgSRjxB+FJfEk6krdoEJQU9mC7ZZ1ldQPaIiDzO+k9u3HhmEe0S
 gTI6n68RJq2IioCUcGMRmHIGE8kUdp9g0JsGPgY8II6+qFBkvOZtpW7CONwyP3dV6SJg
 mK1g==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1783022704; x=1783627504;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lCPCamKDz7DE1PgjAh6FHU2TcwAO3uhrJXXGvyqlfHo=;
 b=QA3J72HFasUSoYvN0eee2eEBqVm0dCOFwbAn+9wwZnQoXT/Q5rajBddJ17qSZrY399
 Pc3gmB6BsclCHUMGxcEap9bxIcQOb9xEMlv/2x24MytINDJV8C3RjmCSWQ6vlXuusapj
 JyqJIv8VlXdmJQTYBKDUy0Na2Sn1SPGD+uBFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783022704; x=1783627504;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCPCamKDz7DE1PgjAh6FHU2TcwAO3uhrJXXGvyqlfHo=;
 b=hR5uur/i+Olcj/1mhwf1kxFw86vRT3DFmAugcpdJEkT/jcoVDeV3Eo2Pmz0c42LNLV
 +2mavj6zgiL+kceas8bZKCDjm9TA4LdqcLD3gbaTFsCoaPb4YGER1oHd7VUJbx8n10JM
 V5mwdg3pb79UY6HCSMsU0lQ8CHBsA3UCSqx3qPFqKxq71AD8dLm5RFIobWy80EPbRxWH
 KAMwmG9VLwqii8OReMgQ241OCYNyhJXtVX6P8Lh8mzyGwB1qdk4XYndsB9x6BfDypWT7
 RDsRml7ZpO7OFJwdwc1HKnmYfrVt/2N32dM3abQtyiTdH8+lp6Yq9dvLkSrhHdP+jkpx
 pDLQ==
X-Gm-Message-State: AOJu0Yw3cWZExu5mdDzsKJ8+5Xc97XJxvPusi67x+/VixE053SUTm2bi
 8dfcHklOYDxQbTUeCPQqaKRTJkih9bICcZ4ccTnBZc6XliPw5D5HBZUTMirMnYroU5gREZCDM0i
 1RPjTQPNt4xcNFKL06sxLCWc6yYNsC/1AIEHVInXW
X-Gm-Gg: AfdE7clMvSiOHmZH9FgBTGZPg2bt5Kl3S9SkQVQZ4co8Ajj+wcrys6fcnNKE00fiVi0
 ebKrujBqyaE6CzODKXJ+1pmJAM2bjKsdGrt5eemIRiFj52yD2nJtaBnEhXeKdBSRNJaSx889KK0
 jsOpzALzOjXAkhXjO+KFCvpqPZS5EQW6PUexrSBPZqWCqqD+09poouJN5+uAwT3roekREKk9t+N
 0XmL3c0N5bNKO/LM1vtpPAgwYqZtdZwYuGjirAzmnZWYrRY1FfKu8puHtQX/0dFh9mALwHycKjO
 qsb7B5nk
X-Received: by 2002:a05:6402:5242:b0:698:52b4:c2c8 with SMTP id
 4fb4d7f45d1cf-6989f374a6dmr3913057a12.34.1783022704060; Thu, 02 Jul 2026
 13:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
In-Reply-To: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 2 Jul 2026 21:04:49 +0100
X-Gm-Features: AVVi8CdHBemV85vij_24H1xlHuBRW43HjiwTSvDYoP8YE0Qqq_E-n2R2erGg0to
Message-ID: <CAFLszTj4f3SUdsf19JEenHJai7L9cPN_68gJjPbMHOPfqfKusA@mail.gmail.com>
To: anshuld@ti.com
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] treewide: Kconfig: use bool instead of
	tristate
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[chromium.org:s=google];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anshuld@ti.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:-];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,stormreply.com:url,stormreply.com:email,ti.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 498CF6FCABF

On 2026-06-25T03:17:06, Anshul Dalal <anshuld@ti.com> wrote:
> treewide: Kconfig: use bool instead of tristate
>
> U-Boot does not support modules, so having tristate options is useless.
>
> Therefore this patch does a blind replace of all tristate options to
> bool tree-wide.
>
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Reviewed-by: Heiko Schocher <hs@nabladev.com>
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Reviewed-by: Neha Malcom Francis <n-francis@ti.com>
>
> board/st/common/Kconfig      | 2 +-
>  cmd/Kconfig                  | 4 ++--
>  drivers/cache/Kconfig        | 2 +-
>  drivers/clk/Kconfig          | 2 +-
>  drivers/firmware/Kconfig     | 2 +-
>  drivers/i2c/Kconfig          | 6 +++---
>  drivers/i2c/muxes/Kconfig    | 6 +++---
>  drivers/i3c/Kconfig          | 2 +-
>  drivers/i3c/master/Kconfig   | 2 +-
>  drivers/memory/Kconfig       | 2 +-
>  drivers/misc/Kconfig         | 2 +-
>  drivers/mmc/Kconfig          | 4 ++--
>  drivers/mtd/nand/Kconfig     | 2 +-
>  drivers/net/phy/Kconfig      | 4 ++--
>  drivers/spi/Kconfig          | 2 +-
>  drivers/ufs/Kconfig          | 2 +-
>  drivers/usb/cdns3/Kconfig    | 6 +++---
>  drivers/usb/musb-new/Kconfig | 2 +-
>  drivers/usb/tcpm/Kconfig     | 4 ++--
>  19 files changed, 29 insertions(+), 29 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
