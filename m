Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB+kKo5/mWnLUQMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sat, 21 Feb 2026 10:49:02 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B7B16C894
	for <lists+uboot-stm32@lfdr.de>; Sat, 21 Feb 2026 10:49:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BB65C87EDB;
	Sat, 21 Feb 2026 09:42:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71E78C87ED6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Feb 2026 09:42:57 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-483abed83b6so1200225e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Feb 2026 01:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1771666977; x=1772271777;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9PO6pVCLnxYeObBpmYmSx5Qlk/y9vxXwkd9KZsfV4mA=;
 b=klof7hlQdzk2nVfyswqEIJhKBniz/+0fGeXkYhl8CSlOZPYh1CQuVWO63f/8xPdnUD
 b18zpSc0N0Xg+RYW3GwnRsVG90LpKmWHx0byhwCx8dKtRHZ7RjLUWMzcmq2yElBJQVG4
 xL69nrYh6Av1KpZ2mUgYkH2QAFaqYXZdGbMMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771666977; x=1772271777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9PO6pVCLnxYeObBpmYmSx5Qlk/y9vxXwkd9KZsfV4mA=;
 b=BGIu7GCePnvQmrmmK01gEKjMywYs6g8rQ2Wi4gl8RgkJkHurkhupJi4Pb0j/vAGh1Q
 dHVVc487bsasJrqeXFxL1BRl5f+CczwlqYBjZFPov054V3N0Nvb6fqCJZokZ0GdKP8rR
 gR0Pabns/svmEgVK06FU8NmCKvzS2YUysUgBQKkZKm2eM3OTRhl5FH2eKWiqO5T1flBS
 xLqU0kgTklePtoX6zSvK1ixmQsMG2G/NDFl+ssNnZQtu230IxeYpmCYflXhBlkvegndp
 ZH6q6CVlmPwsa9ZkUe6TI0eOku1MXz8x/NJvW8hIwbUsDsS6uEXDLXm+Jq79zKKnUdmy
 a1GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM29jazUr+IYVB2lNQ9hQHLDO6Yq0lzzpby1y21OM/myuPbp2KqoaQ0ajkfC2uhrhpbF4emz0aG6mlzw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzZIkFLdY7I6HX++/yibEanoBa5kgeDQIalgbUU5PR//Nw/HprH
 g8wdoau9UEIjFuKOj3ZDJdzyTwJPiBBmsXj/9c512sOgmoQ0WiFWCcGMMrGNz/Gd3aQ=
X-Gm-Gg: AZuq6aKg/hykSP+1QYn/uWDNhQr5s6SksuhlnCz42u7A2CvtHotcrkmEJ0Fx2PMWfgv
 X9YKOizDKnQBn/jlhwXSyDEMzN3NG1dyvQew+bKmpk50aTbQdsffpG2KRPr1QubgQQ5ajxQwNAc
 Rubg0YoDiV1NFwPNHZlH0hSzoKPbZJIB+5WV5E+ZnB4FvUqwEWQdxbUKz+dgL7/X3zPfOpQGyjB
 6ktDdcGpEtfs7kRUg9JYE6owq3kEnYq4p6zvKlznsf+WCs0ccIrL+PeTnxr65PPn9a64WZ5RRLN
 qFYDlbSvX9QklqohOOyZ7fEdAx+UaDq8nhqATG+5AddWRkDQ+nK4VqyTa4wUmmGsGMLDHPjOGhi
 fQbggA+ApQ3jfBK2jLkZArkiHMwoDnaGzvj9Y6M1EB4RBabWBDqLiA/rM60GYWXUcBQz1RHifo9
 RD+7+hTZe7ouh2q/ffdD3e9cphvb8hbl1LEiRlF1yZgFefLoN3Dk/rNgbjAodQJjkh2bCDGXAH8
 uWcKYxWGG89do+OJO/iOEaxlNrZUCf2RUNXIUSLLPxgVeCgTr/lS0Ubv8Qj88Wq09OtW++L73Cj
 UlgpJHhV4nZ27JXnJXccgscr
X-Received: by 2002:a05:600c:c4ac:b0:483:7ce6:1efb with SMTP id
 5b1f17b1804b1-483a95e252amr36537005e9.17.1771666976743; 
 Sat, 21 Feb 2026 01:42:56 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a42f3968sm42694225e9.19.2026.02.21.01.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Feb 2026 01:42:55 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat, 21 Feb 2026 10:42:14 +0100
Message-ID: <20260221094252.3103034-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Andrew Goodbody <andrew.goodbody@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Simon Glass <simon.glass@canonical.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Ion Agorria <ion@agorria.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v2 0/8] video: support Rocktech
	RK050HR345-CT106A panel
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:andrew.goodbody@linaro.org,m:uboot-stm32@st-md-mailman.stormreply.com,m:xypron.glpk@gmx.de,m:sjg@chromium.org,m:clamor95@gmail.com,m:simon.glass@canonical.com,m:ag.dev.uboot@gmail.com,m:dsimic@manjaro.org,m:ansuelsmth@gmail.com,m:alpernebiyasak@gmail.com,m:agraf@csgraf.de,m:ion@agorria.com,m:miquel.raynal@bootlin.com,m:patrick.delaunay@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:jagan@amarulasolutions.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[konsulko.com,linaro.org,st-md-mailman.stormreply.com,gmx.de,chromium.org,gmail.com,canonical.com,manjaro.org,csgraf.de,agorria.com,bootlin.com,foss.st.com,amarulasolutions.com];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,amarulasolutions.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 55B7B16C894
X-Rspamd-Action: no action

This series adds support for the Rocktech RK050HR345-CT106A panel.
The initialization of this panel requires a 9-bit word length
configuration. To support this, I have extended the STM32 SPI driver
(including support for the STM32MP25 SoC) to implement the set_wordlen
operation.

To properly validate these changes and ensure the SPI uclass correctly
handles the word length propagation, I have also implemented the
corresponding logic in the sandbox driver and added a dedicated unit
test.

I have grouped these patches together to provide a complete overview of
the implementation and its verification.

Changes in v2:
- Rplace tristate with bool in drivers/video/Kconfig

Dario Binacchi (8):
  spi: add support for bits-per-word setting
  spi: sandbox_spi: support wordlen setup
  test: spi: add sandbox_spi_get_wordlen interface
  test: dm: spi: add testcase for spi_set_wordlen()
  spi: stm32: clean up buffer length assignment
  spi: stm32: add support for bits-per-word setting
  spi: stm32: extend support to STM32MP25
  video: support Rocktech RK050HR345-CT106A panel

 arch/sandbox/include/asm/test.h |   8 +
 drivers/spi/sandbox_spi.c       |  21 ++
 drivers/spi/spi-uclass.c        |  19 ++
 drivers/spi/stm32_spi.c         |  67 +++++-
 drivers/video/Kconfig           |   8 +
 drivers/video/Makefile          |   1 +
 drivers/video/ilitek-ili9806e.c | 354 ++++++++++++++++++++++++++++++++
 include/spi.h                   |  12 ++
 test/dm/spi.c                   |  16 ++
 9 files changed, 499 insertions(+), 7 deletions(-)
 create mode 100644 drivers/video/ilitek-ili9806e.c

-- 
2.43.0

base-commit: 30b8c03d8c8f500b3e4cc51f7b7abf573180ea51
branch: RK050HR345-CT106A-ON-SPI
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
