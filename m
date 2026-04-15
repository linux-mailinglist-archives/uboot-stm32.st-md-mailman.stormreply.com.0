Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAzdC+HZ32lJZgAAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2026 20:33:05 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B41AD4071CD
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2026 20:33:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CB94C3F944;
	Wed, 15 Apr 2026 18:33:04 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 856C4C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 18:33:02 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso70794275e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 11:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1776277982; x=1776882782;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l3dsxgHdTRh48jhXtZr4KYgKydq1Ij5NciYZkY2qac8=;
 b=K6NziM1xffWnD0JV0eudMPXzmCvxGQGIp4kn4Z7fXiSevKik3KRrg0WUh9SqXbLGXF
 Z1uTy5QitBByaudz7psKd4ddqHcMU8onlSGdW7AqccuD3L0nqzITmWY8LnEMhzCtzr8b
 CMI2szSgUhTO+Vf1U4+44RppVudtHeNjKyXvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776277982; x=1776882782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l3dsxgHdTRh48jhXtZr4KYgKydq1Ij5NciYZkY2qac8=;
 b=nQlB5ejeeIWDfncL0XE3mtFnn00dPRg1nGXYLV/asm6aKBPsB9KXmdOybtZUERccfw
 Qr204beMRkTPDLn8KBaoD7evCdcZkladqBcNX9Psp1d4hhN5GJKumeROf/PYkbKYWpQB
 l+Amkiz/eIN3S3JTbfp/ruTPwksyY66fxhyMcseBnS+q5WiETbmqpcu4yBnxrBRjEPvi
 nhEUcPgdejTvZvvvTknxDwzOTq25Kz/Ao+gHkqNxfJdoGDnltMJgox1uSJe8utKMePWP
 D59CxPVuVL3t5z+aiHz3ESR6HD5OBzNXrP0Cwe20E7i3iz0uLMzlt6FcwQVo6aqXZuu1
 XT1A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+UEM+n6p5XmJhF+yiwmTx5GUUW4aa5KKZw2e8oQoDwNgWQ+NIraLBWf6AqPMOdezlYRgsy4wOlLIQd8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwIq1cU9iegPsUVApQC7LT/UEj7kGMlG52TPLDi1Od9iY/dtFmF
 JX21Qx0WHNxQJmaD/Pv7QWZrtPIiNrJTSOY1r8flTHrtQ1hdRXZ4tIuFHcYyCCY6sYI=
X-Gm-Gg: AeBDiet16aKO0JrHwW8l8GZ5UpLpNRt0iR575nD/DOQlQKUooQW5Mk4vkuZ0YQ7Xjeg
 Ze397d5b/+jIMa9MFi8dQaseJuqHD2c/kEjuW0SuuXWGtzt9DdTFPgV/yeLEf9VohJgufYWN17q
 EgmqrDEMJxmUWeNqoZRv+hvy7QkdcUe6DDHEAYC67NvNnXja2KeK+FfLlxKPLzndIeFwoAJVXpQ
 DSL9JUZIcs3EE/pFEU6UvEApTfBki+543T9I5PxnERcwrp+tWmXYIUwL8xzppBIVkWjqz3oFrlV
 O999wO9MYpkKIw0GIiQRNyuKG+JVC6jc8y1+UV4TPtP2F9il28Eg8cqyxJkFeKdshEPeaUCmqec
 wmAuAmeMH4+cxySEMuW9qeUKNUA86UKkOyuCxi4EMocLm4tHNPIzfoeGV5xdb0c3bmpbZMJB1KG
 jMXlExhp/h3vIGSdX33u3h4/IPw+5txrUOybc8Wa3hTv7U8hkvBdsYq//q14g2wXSpWa+J7bdim
 5ou6FQodDvUAIDv++eKyPBhRclcgUT1RcHcldaGYnujq/PW4q9JiCFWKw==
X-Received: by 2002:a05:600c:64c9:b0:488:c40b:c8b9 with SMTP id
 5b1f17b1804b1-488d67b8d4emr337238575e9.3.1776277981605; 
 Wed, 15 Apr 2026 11:33:01 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.40.93])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f0e72980sm34953115e9.5.2026.04.15.11.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2026 11:33:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Wed, 15 Apr 2026 20:31:27 +0200
Message-ID: <20260415183250.3031030-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Tom Rini <trini@konsulko.com>, Jerome Forissier <jerome.forissier@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 John Toomey <john.toomey@amd.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Rasmus Villemoes <ravi@prevas.dk>, Michal Simek <michal.simek@amd.com>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Padmarao Begari <padmarao.begari@amd.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com, Sughosh Ganu <sughosh.ganu@arm.com>
Subject: [Uboot-stm32] [PATCH v3 0/7] Support metadata-driven A/B boot for
	STM32MP25
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,cherry.de,st-md-mailman.stormreply.com,amarulasolutions.com,konsulko.com,gmx.de,redhat.com,amd.com,mailbox.org,prevas.dk,altera.com,bootlin.com,chromium.org,linaro.org,foss.st.com];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:vincent.stehle@arm.com,m:mkorpershoek@kernel.org,m:quentin.schulz@cherry.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:dario.binacchi@amarulasolutions.com,m:trini@konsulko.com,m:jerome.forissier@arm.com,m:xypron.glpk@gmx.de,m:javierm@redhat.com,m:john.toomey@amd.com,m:marek.vasut+renesas@mailbox.org,m:ravi@prevas.dk,m:michal.simek@amd.com,m:dinesh.maniyam@altera.com,m:kory.maincent@bootlin.com,m:sjg@chromium.org,m:ilias.apalodimas@linaro.org,m:padmarao.begari@amd.com,m:patrick.delaunay@foss.st.com,m:linux-amarula@amarulasolutions.com,m:sughosh.ganu@arm.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	NEURAL_SPAM(0.00)[0.239];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: B41AD4071CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series, the mainline version of [1], provides the necessary changes
in U-Boot to support the metadata-driven A/B update flow for STM32MP25
boards. It implements the logic required to dynamically select the boot
bank based on FWU metadata.

These changes are designed to be backward compatible while providing
the necessary infrastructure for the A/B scheme.

The series has been tested on the STM32MP257F-EV1 board.

Additionally, some patches in the series propose changes with
general-purpose utility:

 1/7 lib: uuid: add partition type GUID for extended bootloader
 4/7 cmd: part: support lookup by UUID in 'part number'
 6/7 fwu: add helper to get image GUID by type and bank index

[1] https://github.com/STMicroelectronics/u-boot/pull/6

Changes in v3:
- Wrap lines exceeding 80 columns in test/cmd/part.c file.
- Combine run_command() and ut_asserteq() -> ut_asserteq(1, run_command(
- Add kerneldoc comment for fwu_mdata_get_image_guid() above its declaration
  in fwu.h.
- Add log_warning() messages to fwu_platform_hook() to catch inconsistent
  FWU metadata (boot GUID found but root GUID missing or viceversa), as
  suggested by Simon Glass.

Changes in v2:
- Add links to the XBOOTLDR specification in the commit message of patch
   1/7 lib: uuid: add partition type GUID for extended bootloader.
- Update help for 'part start', 'part size' to mention UUID.
- Add kerneldoc comment for fwu_mdata_get_image_guid().
- Pass efi_guid_t by pointer in fwu_mdata_get_image_guid().
- Add patches:
   5/7 test: cmd: part: add UUID lookup tests
   3/7 test: cmd: add unit tests for part command
   2/7 test: dm: part: add test for part_get_info_by_uuid

Dario Binacchi (7):
  lib: uuid: add partition type GUID for extended bootloader
  test: dm: part: add test for part_get_info_by_uuid
  test: cmd: add unit tests for part command
  cmd: part: support lookup by UUID
  test: cmd: part: add UUID lookup tests
  fwu: add helper to get image GUID by type and bank index
  board: st: stm32mp25: support dynamic A/B bank bootup

 board/st/stm32mp2/stm32mp2.c          |  32 ++++
 cmd/part.c                            |  12 +-
 doc/README.gpt                        |   2 +
 include/configs/stm32mp25_st_common.h |  15 ++
 include/fwu.h                         |  11 ++
 include/part_efi.h                    |   3 +
 lib/fwu_updates/fwu.c                 |  33 +++++
 lib/uuid.c                            |   1 +
 test/cmd/Makefile                     |   1 +
 test/cmd/part.c                       | 205 ++++++++++++++++++++++++++
 test/dm/part.c                        |  53 +++++++
 11 files changed, 364 insertions(+), 4 deletions(-)
 create mode 100644 test/cmd/part.c

-- 
2.43.0

base-commit: 70fd0c3bb7c26d42f24d10145dd5f3168ac92eac
branch: fwupdate-ab
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
