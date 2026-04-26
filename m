Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIhGB7Uz7mmxrQAAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sun, 26 Apr 2026 17:48:05 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB6846A83A
	for <lists+uboot-stm32@lfdr.de>; Sun, 26 Apr 2026 17:48:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBBEFC87ED8;
	Sun, 26 Apr 2026 15:41:00 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA26AC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2026 15:40:59 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so60096935e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2026 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1777218059; x=1777822859;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=38y71G8u32Iq7qDsma7gZWIJhzWUGr4t+BVMIDD2Oq8=;
 b=YgrUn/dczzLQVFa7re7Zbe8yrnwa7Nr5xWox6Xzt8Etc4eIPNOqGlrVaeXYQz7wm89
 Ej1Ufe+g2Z2ivMCNy+VWOZYEP/bTN3jEl8rs46jUIeXANm4Eu36Kaf5/vCUScTreR8x0
 neusp5JC9cvnjSmRiwLdgm9A6lp/FlSk+N+Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777218059; x=1777822859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38y71G8u32Iq7qDsma7gZWIJhzWUGr4t+BVMIDD2Oq8=;
 b=swPIYj2HHF0+mtr2K8Eeda3VctCRiMpSG18xTBPF1clHmQpo5/eDfDClSnvgiLhuRO
 K8/YuLggY2mJKOpLSymSS4lPncq5WMXgCQ0rvxFATR2DQsPM8eSeZNQzHLCSHTqGG2aq
 aUvaVpxOFUyrdqPhTXAkdEkwAMjge1vFq9AfKRr6cAevKzkJ6SER1XLOLZ1hDy1pB3rC
 KfKQP6QDf8KM7ztONmPkhG3wQgXM/Ra1v4kBx9gJbHebzj1tbeixUQYdluFcj3mkwrTH
 gbi0ApN2acvDfBEQRj9tExqaq106rd0gzpB5Pzgou06qPlDVDi3qBGrxSUxzLIt6eQip
 IeEQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/IKHQ+m9o4kY1o30P3rSyRH1XuJKuR6IQ/gAEcjcpR2MIXDcg0Xx9IOeHjSQjbegoKJ6SEnXckW0cBBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyfae7mOnrYL8/IGi5qlDeAtqwkmhg3THHZAiRwabOns6ur/j3/
 vetqV9OFthHCvjU1Agp022ydUZ0CUjy7Y+BMsyK07RSYQ/tlUWKfVJKxMtYUMdGMFh8=
X-Gm-Gg: AeBDievpgmlVnF3SlHM4T1vuDIaGG41izOLH8ZjLfjYO+98b4x6uVvOvOgVUyzIsNvx
 /TXjbhk5hpAddaPy3C/MT6qDGguhUTaePt+bC7IkyC1ahhyxuWNfEk+xj5XJlmcJ8KrdGj3LGW4
 PiW5GRukqp2tCbk7nW65rhhpzrqhgjPR5dUGOqCIUVCpQPUUgFCVNQvhhOfvgqmzY92BASAla2Y
 ltpvvMVRqoi2l514RHe1opZTgqL+Bf6abX9Jf6uFmpZjc80BQQUTEbwV+Wy+iv3j+NDaQQ5s1HH
 3ISK1LlrIwUVSHMCTn+dJ4o2b4DX7LkgYBrJObJIVwdaOZfm+AQyTwQx9OeqW2ppcGaGHVUhUAX
 yr9ZMEzyGUFN0rBCj/lcz4BC82/RGxYy9G8035f33cfOtSlHpQ4R1GDZKWjtuLvi/QSsTY9dgsj
 fkvy14T2v4WRE7jaA6rzKB9QG24rmy8K2DYMd5vVnNpmhpxP9odiNZA/5VDKU67j/rQgnyRoSuk
 wHrRBUMxwwWX/rdwgJQZUUm1688UMms+Z3F9SIvG/cXAfF1m2Y7psfk9mW07JQE9ZFphg2tdSLb
 uITeTgP62CJ4DcRMjOcoJkuzFLRNcg==
X-Received: by 2002:a05:600c:3e8f:b0:48a:65a5:751f with SMTP id
 5b1f17b1804b1-48a65a57799mr154552245e9.31.1777218059218; 
 Sun, 26 Apr 2026 08:40:59 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-82-56-22-134.retail.telecomitalia.it. [82.56.22.134])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891bb3d121sm802593765e9.14.2026.04.26.08.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 08:40:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun, 26 Apr 2026 17:40:32 +0200
Message-ID: <20260426154054.2040932-1-dario.binacchi@amarulasolutions.com>
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
 Rasmus Villemoes <ravi@prevas.dk>, Jonathan GUILLOT <jonathan@joggee.fr>,
 Michal Simek <michal.simek@amd.com>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Padmarao Begari <padmarao.begari@amd.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 linux-amarula@amarulasolutions.com, Sughosh Ganu <sughosh.ganu@arm.com>
Subject: [Uboot-stm32] [PATCH v6 0/8] Support metadata-driven A/B boot for
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
X-Rspamd-Queue-Id: BCB6846A83A
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:vincent.stehle@arm.com,m:mkorpershoek@kernel.org,m:quentin.schulz@cherry.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:dario.binacchi@amarulasolutions.com,m:trini@konsulko.com,m:jerome.forissier@arm.com,m:xypron.glpk@gmx.de,m:javierm@redhat.com,m:john.toomey@amd.com,m:marek.vasut+renesas@mailbox.org,m:ravi@prevas.dk,m:jonathan@joggee.fr,m:michal.simek@amd.com,m:dinesh.maniyam@altera.com,m:kory.maincent@bootlin.com,m:sjg@chromium.org,m:ilias.apalodimas@linaro.org,m:padmarao.begari@amd.com,m:patrick.delaunay@foss.st.com,m:bmeng.cn@gmail.com,m:linux-amarula@amarulasolutions.com,m:sughosh.ganu@arm.com,m:marek.vasut@mailbox.org,m:bmengcn@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,cherry.de,st-md-mailman.stormreply.com,amarulasolutions.com,konsulko.com,gmx.de,redhat.com,amd.com,mailbox.org,prevas.dk,joggee.fr,altera.com,bootlin.com,chromium.org,linaro.org,foss.st.com,gmail.com];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,amarulasolutions.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]

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

Changes in v6:
- Add Reviewed-by of Simon Glass to patch 3/8 "test: cmd: add unit
  tests for part command"

Changes in v5:
- Update doc/usage/cmd/part.rst to reflect the changes related to the
  part command.
- Add Acked-by of Ilias Apalodimas to patch 6/8 "fwu: add helper to get
  image GUID by type and bank index"

Changes in v4:
- Place the part command tests in the cmd suite rather than the dm
  suite.
- Order the include files according the U-Boot coding style.
- Add patch 7/8 test: dm: fwu_mdata: add test for fwu_mdata_get_image_guid

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

Dario Binacchi (8):
  lib: uuid: add partition type GUID for extended bootloader
  test: dm: part: add test for part_get_info_by_uuid
  test: cmd: add unit tests for part command
  cmd: part: support lookup by UUID
  test: cmd: part: add UUID lookup tests
  fwu: add helper to get image GUID by type and bank index
  test: dm: fwu_mdata: add test for fwu_mdata_get_image_guid
  board: st: stm32mp25: support dynamic A/B bank bootup

 board/st/stm32mp2/stm32mp2.c          |  32 ++++
 cmd/part.c                            |  12 +-
 doc/README.gpt                        |   2 +
 doc/usage/cmd/part.rst                |   6 +-
 include/configs/stm32mp25_st_common.h |  15 ++
 include/fwu.h                         |  11 ++
 include/part_efi.h                    |   3 +
 lib/fwu_updates/fwu.c                 |  33 ++++
 lib/uuid.c                            |   1 +
 test/cmd/Makefile                     |   1 +
 test/cmd/part.c                       | 209 ++++++++++++++++++++++++++
 test/dm/fwu_mdata.c                   |  48 ++++++
 test/dm/part.c                        |  53 +++++++
 13 files changed, 419 insertions(+), 7 deletions(-)
 create mode 100644 test/cmd/part.c

-- 
2.43.0

base-commit: 9f61fd5b80a43ae20ba115e3a2933d47d720ab82
branch: fwupdate-ab
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
