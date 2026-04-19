Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJLJOejp5Gm0bwEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sun, 19 Apr 2026 16:42:48 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D2B424674
	for <lists+uboot-stm32@lfdr.de>; Sun, 19 Apr 2026 16:42:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ED0BC87ED6;
	Sun, 19 Apr 2026 14:32:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3BBDC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Apr 2026 14:32:55 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso10671735e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Apr 2026 07:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1776609175; x=1777213975;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SkM7z/RI8tzs7t4yVAlnuLnFIB/0Nbr6u3YHDWU9clc=;
 b=AI/9o3uwFeLrRJmHxnXCXlnsdgM+6Fj8VUKV3Vn+6ZvZ1WB40O2pfAIYZperq3rYnt
 mvqzUbPNPoOcgEwr5joL3mcFDGIl1oe42cuVrqtBW/2pMEhVcxVeqzxMtCcHAHTBB9RL
 bzuYeKr8Rp1K8fvpkhTb3sbPA++nHTxw0XQTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776609175; x=1777213975;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SkM7z/RI8tzs7t4yVAlnuLnFIB/0Nbr6u3YHDWU9clc=;
 b=l5jeqbg0IlQSY/RJkc3Y0DTVSUlEc6nrAhnNJtlGvfwX2Lv+z1lP68f6F23kVAMQHi
 S7khIxST8xd5pVm+gZut7klxlH5wH3ftE7lhTo9lDYowqBN+IXj+Vt4SASxQqaomgmzd
 FjB9vsDd5S1QFLvTwlt/udVINsc3FYG2qereU4tyCXGy0eNYYWUBk4smPC1pAJNqqUo+
 K9YbqEg3dhRY9ZQCZOw1boBYGDa3/BHS3okxgD8L2r+DMVH751+FSgSRcmeR3ntNj9ca
 pAFx0rZ6MRw3n4+i/kT6vmQYQpmy/qa/HgQyzuxkoYg6JitnjCEy49rv7TmuEaHkUbG/
 eEkA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/f1yoz/++DclJz2U5PdZosEE8q7QIUlVEhov/dlFGs9F2eUkMIecQisHDjpP1mPOzJ24HzK2Rj9p3xfA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzpLSKr1W5mJ5xrAmGYwIWjMqwPskW7XgHG+PH1JGYm1jR0GdNO
 MwEfDOJzDH9DyM0L8hXyo4Poga71VE3hSpoM12G1GfZstVNSXbISfuQNBIMCewTstjg=
X-Gm-Gg: AeBDievUi+pCvA/eN0K8lQw3NndGAJ+LSRzMzSNKFHoe13AK9INE9NNm7P6d37Vc2a2
 Qb23aemsTiiXsQFwBx/Lquru1IulJf/7LXUbikChgiDVFPKW3IW+OcvykMAMAj6qS9NYEKPKJSI
 rquVoA4bMPY4B1HAYwaNYG5Hb39jfKXSFCURH+/Ds8soO6A9oun6uCc1pqV7ywtF+VhWuE3yns9
 xhTlNA9IY1+ScrD6jk83JbK8YwOZdkn/yd4wl/3pDBiU90ofxW72zc+sHmLzluxpAh8C48T0M57
 UuF6R/DfRuuSkzSIGlXEtjlcZiPieyhHopSyXtHjdpOhAKNAaV34gGmLaz+Mbpq1s0t/NQJ+z4j
 I31Dvx6ZQoC3+TazHUqr2EPm3c0+BbKDj9BhVJC+63lfHJFtu0CIVUJlYgOhfVhw1BadBY6gcgU
 MY04+gVVmA7EMRITtfm/cszkBey6g3iy4GZ/0cA1LTz6FGeKPBYpQbVYYrq0l4gc7o68RhmqynU
 UUi3CFrMqvL/hJANQoIyAuLOjNUyBLSrolYdAmD4aGlWDqsulQsHxkWelQuCJKKghxBDXdEtLNl
 LGxF9K+IMwTmUgT77LnDtm/dJCLrIEGj
X-Received: by 2002:a05:600c:8183:b0:488:b187:3c with SMTP id
 5b1f17b1804b1-488fb765ab5mr158660815e9.14.1776609175076; 
 Sun, 19 Apr 2026 07:32:55 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-20-97-39.retail.telecomitalia.it. [79.20.97.39])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb755938sm86864245e9.3.2026.04.19.07.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2026 07:32:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun, 19 Apr 2026 16:31:40 +0200
Message-ID: <20260419143247.437733-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Uboot-stm32] [PATCH v4 0/8] Support metadata-driven A/B boot for
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
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:vincent.stehle@arm.com,m:mkorpershoek@kernel.org,m:quentin.schulz@cherry.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:dario.binacchi@amarulasolutions.com,m:trini@konsulko.com,m:jerome.forissier@arm.com,m:xypron.glpk@gmx.de,m:javierm@redhat.com,m:john.toomey@amd.com,m:marek.vasut+renesas@mailbox.org,m:ravi@prevas.dk,m:michal.simek@amd.com,m:dinesh.maniyam@altera.com,m:kory.maincent@bootlin.com,m:sjg@chromium.org,m:ilias.apalodimas@linaro.org,m:padmarao.begari@amd.com,m:patrick.delaunay@foss.st.com,m:linux-amarula@amarulasolutions.com,m:sughosh.ganu@arm.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,cherry.de,st-md-mailman.stormreply.com,amarulasolutions.com,konsulko.com,gmx.de,redhat.com,amd.com,mailbox.org,prevas.dk,altera.com,bootlin.com,chromium.org,linaro.org,foss.st.com];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	NEURAL_HAM(-0.00)[-0.032];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,amarulasolutions.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 72D2B424674
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

Changes in v4:
- Place the part command tests in the cmd suite rather than the dm
  suite.
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
 include/configs/stm32mp25_st_common.h |  15 ++
 include/fwu.h                         |  11 ++
 include/part_efi.h                    |   3 +
 lib/fwu_updates/fwu.c                 |  33 ++++
 lib/uuid.c                            |   1 +
 test/cmd/Makefile                     |   1 +
 test/cmd/part.c                       | 209 ++++++++++++++++++++++++++
 test/dm/fwu_mdata.c                   |  48 ++++++
 test/dm/part.c                        |  53 +++++++
 12 files changed, 416 insertions(+), 4 deletions(-)
 create mode 100644 test/cmd/part.c

-- 
2.43.0

base-commit: e3405917a1806971d9e72a94186b299f05581e1a
branch: fwupdate-ab
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
