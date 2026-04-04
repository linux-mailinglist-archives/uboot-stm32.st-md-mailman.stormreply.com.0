Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ClnHA4w0WlaGQcAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sat, 04 Apr 2026 17:36:46 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0D739BA32
	for <lists+uboot-stm32@lfdr.de>; Sat, 04 Apr 2026 17:36:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6C31C87ECD;
	Sat,  4 Apr 2026 15:26:54 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63A7BC87EC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Apr 2026 15:26:53 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43cfce3a195so1660709f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 Apr 2026 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775316413; x=1775921213;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IY0IgVlmnddhQ9ALEN+0fIKmuZ2Q12FXzs7AS6INRAw=;
 b=lL/LGhG31yrpNxl/4Wuo4gu1Ys78Iy5jJiPhX0xGUKo9DEWvk4B73aaO+R7GYulpve
 ZT7J3O8C77EytVsZzWK5CSjHWh/9157Z56K4yLSucsRuvdA6nweX9zII1WC1urE6+2ih
 hR5pphUmcU+q4JOEon7POsqipe/8oUUmy4bQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775316413; x=1775921213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IY0IgVlmnddhQ9ALEN+0fIKmuZ2Q12FXzs7AS6INRAw=;
 b=gu0Zptdiue8BN6/IWCmgRatckpOy4WwEZFldhRLpumzX9+PfQIWdqIkie+ii0vydRk
 ISB58GtLGVTYoHPXUNp8EJ81StkieX41a62IrsAVKohbFRYsIeZyxVQuN4vSQlWlANPr
 L6+rB3mfQLU0CX6r4OJyRv+lKFm46jKs2xmYENo9lL7Xi7zYwVFW0LYjUQtrilDqGeUP
 pVGnNRX3nA/VaZwbDJEZNASNu9Vq8w6aS7c/t6Y4+gMjZk21wm5pLiumgqYmYtbk9BX4
 uC/M47C/VvONkokpqJxxYoWQp3iXaWx29FDrUoI2VvIeLFcQnK03ZIv08arlGXL4PuWI
 WK7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1WFarx2C5uKsh38rsfbHmF7RyvhzEt3t4lNFraL9QlG0pLQZid9Mzp8vPctqqNKLvp+zzyJp1aty/eA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxOtg6QzuwbJHxgTTpK9lsERA2rsgPIA+uitFmrYxHvcRYQmPWl
 +eOSQvqG0WvEHeoMeq81VwXq/6Fx+JGlqvA4sTgsvwuwWCnEZiMT3lYcrJu6nF3W1BE=
X-Gm-Gg: AeBDieunnYmHOUKTmBFMOQrBPiZIpK2Ix2aWEPi0wi/u5PIynUjmZSRD3ovweXIXBDa
 3DBFO+83R/whNthtvXsQyxQM2oxeRQj23GqQN5cJUDSYq0nr5aBe7/QSZkT2n4sjRX63Q09T1fx
 XckJFATOFKVvWL0j5QX04KvBj7xchDoIuMHtu3Vt8G6JX/p1AQ6IpvQ9nOx4GMV7FWpcLjXI10/
 IMcdS18BrEoJptG78ktWzVoPH+L/2qEXSVkKzLDRWKg73JbrZimshj7lsUxDXqzDXlyzE3Qld8K
 AUjwKPtjN6vtibZ/Jx1OLt40pgL/9OpqHEYmqNQ4wSZlgKDGkj/YP4bwNBqDuTpOfWGSqM6KESi
 odEptp8u0+YbIRU7liqJ8dxL57rWqsw9FqCTqRAWL2TCJtzdgOa90VsFqgYly6hip/jUc7Jn5c/
 Tg8ZRaBmMir6gwUVFOmkjNqr8gYDNtbW9YqL4FOTm86QQjw5DzJzKRdbfn7fo1mlpkp1mnJ8qTN
 /1uFdeBwyZSrRPcaJDf4Ge2hfUd3Wlfz4nXAptYYcXobfDK8hDRxMvMk8tf7JaELta7Rden+mwn
 7xjw5UErxgvoWxdeoty5fVq754gIWoRXO7E=
X-Received: by 2002:a05:6000:40ca:b0:43b:8f38:3b88 with SMTP id
 ffacd0b85a97d-43d292e7101mr10522763f8f.25.1775316412511; 
 Sat, 04 Apr 2026 08:26:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-100-184.retail.telecomitalia.it. [87.9.100.184])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f1a99sm28059462f8f.32.2026.04.04.08.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2026 08:26:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat,  4 Apr 2026 17:23:27 +0200
Message-ID: <20260404152640.3297713-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Jerome Forissier <jerome.forissier@arm.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Rasmus Villemoes <ravi@prevas.dk>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sughosh Ganu <sughosh.ganu@arm.com>, Padmarao Begari <padmarao.begari@amd.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Michal Simek <michal.simek@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Dinesh Maniyam <dinesh.maniyam@altera.com>
Subject: [Uboot-stm32] [PATCH v2 0/7] Support metadata-driven A/B boot for
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
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:vincent.stehle@arm.com,m:jerome.forissier@arm.com,m:mkorpershoek@kernel.org,m:xypron.glpk@gmx.de,m:ravi@prevas.dk,m:ilias.apalodimas@linaro.org,m:javierm@redhat.com,m:sughosh.ganu@arm.com,m:padmarao.begari@amd.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:michal.simek@amd.com,m:quentin.schulz@cherry.de,m:patrick.delaunay@foss.st.com,m:sjg@chromium.org,m:dario.binacchi@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:dinesh.maniyam@altera.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[konsulko.com,mailbox.org,arm.com,kernel.org,gmx.de,prevas.dk,linaro.org,redhat.com,amd.com,st-md-mailman.stormreply.com,cherry.de,foss.st.com,chromium.org,amarulasolutions.com,altera.com];
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
	NEURAL_HAM(-0.00)[-0.863];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 0D0D739BA32
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

 board/st/stm32mp2/stm32mp2.c          |  25 ++++
 cmd/part.c                            |  12 +-
 doc/README.gpt                        |   2 +
 include/configs/stm32mp25_st_common.h |  15 ++
 include/fwu.h                         |   3 +
 include/part_efi.h                    |   3 +
 lib/fwu_updates/fwu.c                 |  33 +++++
 lib/uuid.c                            |   1 +
 test/cmd/Makefile                     |   1 +
 test/cmd/part.c                       | 204 ++++++++++++++++++++++++++
 test/dm/part.c                        |  53 +++++++
 11 files changed, 348 insertions(+), 4 deletions(-)
 create mode 100644 test/cmd/part.c

-- 
2.43.0

base-commit: 4dc4080805fac1b1ed7606ce3bc8fb44a6d59d5e
branch: fwupdate-ab
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
