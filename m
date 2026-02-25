Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHMBDvIgn2lcZAQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 17:18:58 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D3019A6CF
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 17:18:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A391C87EC4;
	Wed, 25 Feb 2026 16:18:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0EDFC87EC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 16:18:56 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso77178985e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 08:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1772036336; x=1772641136;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=87tZXl2A99AxHhfTppqdnkU1d7h0JgGf/Rr9i4VdH+4=;
 b=DXartv0drG7j72Djpal2SrU3PDihrlqp7HbO4WKGXQCPTBUY1Kx8fSKrb9OHK1GjmK
 adH6GtnN5fzs7575lWxvutZNfVfejZ3zmtLoTxIH8L8ALiEj8XGfxUlDDF5vf33Ddjg4
 X8MDHHmrunSabrLw/Oz87Ye1heWpxSSEdhX+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772036336; x=1772641136;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87tZXl2A99AxHhfTppqdnkU1d7h0JgGf/Rr9i4VdH+4=;
 b=vqB1QclJ8rC16cd4EFDJZ4La5u1A6Cizn7w25daKMg1EUvRpphz08jzupWPWFTpGWQ
 YqwRfve/NdiuMrXgRPVA/hUIzMRPjeuYmXYPptZQsUpwLN73OyLSF+uPUATEyuZSY9Tb
 UZOgEPiB0yeeA+hkSyNsON1PjZ6kPZxIMWEdeHobIEV7bgVjiLS6FgNDPO0R6bs4RsiM
 n5mm8BHf2rHt+kc9m97Pg7gsz5w/tA1+edeD5JzKPBwWKfFpWSy4ZkK7INNjfF30SJ/f
 rqsJDjFnbLbDQ30e2KnCQoE5m3sjYRmw1dNKGS7MaI4I5h+Sp3Xw8sAgwg5E4tWMb7lq
 1iUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/QTMv8W1sSJDz3E0b79W1FJgkhg1ABJ+9gbF1HI3d63ucfcTmXEui/maM+NnreUc8cn8zSWG8lEhVMQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyZ3l7FGWz0G7kDxInxojeBUM/OZDpDcEaeawgQ9VRdjok2Jk8q
 vCHSDJI9WA2zY6RRYG26EdKhp4uA3ux9d2Dz58wu5FJ2C1ZUG/uimyz1kSP+Y/OClccHZqsKQIj
 BZJNU
X-Gm-Gg: ATEYQzzmjyBc2sYkIlMXkGhA15yMiJ+ogKA+NV4dHkDi3Y87cO2b/iyiNbL1wPiYf8D
 mcz0EiXSbkvlLNpH5ulgmnfuhxRaeljWh6lv6g4Qo6tggV9PE1/kN+m30jiuQ5DWdPgpRBZRYcy
 cc1DI993gJvMAMaxPNEuxhjKf75FmF0xJYBlF2aZRR9gI+L43JNiCjgRZMEHkMDLmJvxahyUHB/
 ZzuPl3J2OzhTU98LDjz7t0SewcePansbsf+Bc0d89Ld0m8GJ6BRQsMXcU6OtVDuq2XVd6oeM7B3
 Hc4yVY+4RstwtBMjZ+RyRmx7pz5+2rhXDkXBJvWtI1K2bzG5KH/TXqzHpy5XlSdy+Y2f3QkLOOF
 2wdZJ/ETPo0rpyZvUg3lZxoKU9CL8d8ZE7QplEdIojGDzXHx5FY224rhTVxbqplhieudLPmfYD2
 BFpqJaWZPG3yT1LH9aqkZvTS1oJceJOMz3ay0k10Q+QM2V67E2LwWSFCJZ3ROvXTsnFkYiQRVIo
 mwSTpkeYPS92tAB6Z8aZjTctL76q2z+1hY3Nrcg9nnEq/pLRbfkzrgi2xc=
X-Received: by 2002:a05:600c:5488:b0:483:71f7:2797 with SMTP id
 5b1f17b1804b1-483c217cb60mr17933945e9.14.1772036336164; 
 Wed, 25 Feb 2026 08:18:56 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.111])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd6f19f5sm186562265e9.1.2026.02.25.08.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 08:18:55 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Wed, 25 Feb 2026 17:16:51 +0100
Message-ID: <20260225161851.2475274-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Uboot-stm32] [PATCH v3 0/9] video: support Rocktech
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	NEURAL_HAM(-0.00)[-0.250];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: D3D3019A6CF
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

Changes in v3:
- Use struct spi_slave data to access wordlen parameter instead
  of driver private data.
- Move the stm32_spi_is_enabled() helper to the new patch
  "spi: stm32: add stm32_spi_is_enabled() helper"
- Insert blank lines to separate code in ilitek-ili9806e.c

Changes in v2:
- Rplace tristate with bool in drivers/video/Kconfig

Dario Binacchi (9):
  spi: add support for bits-per-word setting
  spi: sandbox_spi: support wordlen setup
  test: spi: add sandbox_spi_get_wordlen interface
  test: dm: spi: add testcase for spi_set_wordlen()
  spi: stm32: clean up buffer length assignment
  spi: stm32: add stm32_spi_is_enabled() helper
  spi: stm32: add support for bits-per-word setting
  spi: stm32: extend support to STM32MP25
  video: support Rocktech RK050HR345-CT106A panel

 arch/sandbox/include/asm/test.h |   8 +
 drivers/spi/sandbox_spi.c       |  17 ++
 drivers/spi/spi-uclass.c        |  22 +-
 drivers/spi/stm32_spi.c         |  71 ++++++-
 drivers/video/Kconfig           |   8 +
 drivers/video/Makefile          |   1 +
 drivers/video/ilitek-ili9806e.c | 356 ++++++++++++++++++++++++++++++++
 include/spi.h                   |  14 ++
 test/dm/spi.c                   |  16 ++
 9 files changed, 502 insertions(+), 11 deletions(-)
 create mode 100644 drivers/video/ilitek-ili9806e.c

-- 
2.43.0

base-commit: 4f70106beafe30df8b0528a3d8b2543cd48fe241
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
