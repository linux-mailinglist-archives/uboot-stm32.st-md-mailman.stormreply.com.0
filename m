Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOc8MV5Pl2liwwIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Feb 2026 18:58:54 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 676EB161712
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Feb 2026 18:58:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB16DC8F273;
	Thu, 19 Feb 2026 17:51:46 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A97A3CFAC40
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 17:51:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so9771765e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 09:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1771523505; x=1772128305;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cy4KkJttvJ9loTxMFwuXAS6gYR0rkuPozqGdtP6/ELg=;
 b=FIo2aow5Ng8dgnYYRYFqOhTAJaMYhDI2DY0wYuwL9OZ6pIiSvunDpcw7HleRmb3c3i
 zkjZpkh2uSRw03g7GXVyYoa+hvUYQug9I2uYazbNmbwNs4DxMNxBU4361eWLZbbMarxm
 qRUBumAuVEQirRe3979TwJP6ZyG6Km92r2HGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771523505; x=1772128305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cy4KkJttvJ9loTxMFwuXAS6gYR0rkuPozqGdtP6/ELg=;
 b=aPUaPpkppKgBqEIbHyz/jUsjLcmLgpQIvQtqBxjI1jt3nWZcUHlKtcnM/IKum5lIdN
 Cp+ga+eS5TkxK+KvBIejszVrCxGg6ux7afl/HmKUGEndMtPtCNJQUe8M0oj9GL6N6QCO
 4Al+5o5viiatH1fbbogz4yutyCDd0J0GO0eRKAJggSUY/GynreOZ3bu/9UJigEEX16FS
 /f/6xR/I7jVep50Pn0CXeS3jE0HIg+u4Ekt0lkgogA3cEezXjPb9ntZa9XQBI6ixVlLi
 O3+dd9qnWx8XwyO5dCxWN0JkCAtKqcrI0J3izy0CTTxKTbMxYJ1RerGu1bakB7tjAeYe
 7SQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU2hIWC0SvOpxoIy/7E10t8dADBZynHuOiaw9VcAGDtRSVGWqCMCh0eqpHK+cjpPCn/6VJ1Qi59zVOmQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwjxYZ1S8iEhk2sptlEGj/z7iHkyuyBfI6j4v9pYVY8MjI89PbV
 wvSjWJayphodldoFPiiQcioMZ5Zcj81yMc3T3c3JnAzZn+goLHMIcZQZ7X1rqfibHLE=
X-Gm-Gg: AZuq6aI3hkJU8tmr6XQ5poptfOhaHUGwsGslq3SOTV6CHoMvVFI19/RW8CbrKc1H7Km
 /dLml9fMFpkWz/bvYVUBQloldML+Umws85UZTrZP0rYVPs8MtwURWNwHecrRDNMJ/7HTdNBjMJx
 hBZPW4eFVk1VjwJnKW+VrQPu5y+tpws+VtbEykvttXFOTTrIYsCe+Sn34gRiWVvcgMF/RFoXAm0
 Y1sT+kLQ3/wGrTPnzyRZt4RLONLvAucd1axjvVwlGG2nil9HN6IUPR30X2NGpxEe4fFFhoYPyCw
 DvpfsYGC/PutQgQ9sOhjJOtVwkf7wHCS6iuIHXjkJIhLswFgkH6TXDMs/uykGhQSvW3rRnvK1lX
 4lKPdqfhmvs2se8cCNBjj9BvajG6iXMX1B+qf3+Pdu9N9mqcDUeSIu7P75HjhLgSIJ4CMrx+Tjm
 pvD2eP3NTKjYb5yELXF59+H9sJKx+XOTEz9cmrtmLtxt8RRNH2+gSg84GkqNAez7rtQ8R9nF8eh
 o18LvXfnNfQyCSCbKoMHGm0sZDmSGb9c3nDn/mowKbVFGrojGEG1RCePFB8unf/PDFcbQyDCfds
 B+8hQQl6RBgVyJHFz/zt73nH
X-Received: by 2002:a05:600c:4e16:b0:47e:e981:78b4 with SMTP id
 5b1f17b1804b1-483a008dcc2mr46366975e9.12.1771523504939; 
 Thu, 19 Feb 2026 09:51:44 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31b0e63sm35485005e9.2.2026.02.19.09.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:51:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Thu, 19 Feb 2026 18:51:11 +0100
Message-ID: <20260219175130.2839234-1-dario.binacchi@amarulasolutions.com>
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
 Peter Robinson <pbrobinson@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 0/8] video: support Rocktech RK050HR345-CT106A
	panel
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
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:andrew.goodbody@linaro.org,m:uboot-stm32@st-md-mailman.stormreply.com,m:xypron.glpk@gmx.de,m:sjg@chromium.org,m:clamor95@gmail.com,m:simon.glass@canonical.com,m:ag.dev.uboot@gmail.com,m:dsimic@manjaro.org,m:ansuelsmth@gmail.com,m:alpernebiyasak@gmail.com,m:agraf@csgraf.de,m:ion@agorria.com,m:miquel.raynal@bootlin.com,m:patrick.delaunay@foss.st.com,m:pbrobinson@gmail.com,m:dario.binacchi@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:jagan@amarulasolutions.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[konsulko.com,linaro.org,st-md-mailman.stormreply.com,gmx.de,chromium.org,gmail.com,canonical.com,manjaro.org,csgraf.de,agorria.com,bootlin.com,foss.st.com,amarulasolutions.com];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	GREYLIST(0.00)[pass,body];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 676EB161712
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

base-commit: 7dca54ef4c44c82bdc6716ac6cdc84c22c66e9ed
branch: RK050HR345-CT106A-ON-SPI
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
