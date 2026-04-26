Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RiucBJQz7mmxrQAAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sun, 26 Apr 2026 17:47:32 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B58646A823
	for <lists+uboot-stm32@lfdr.de>; Sun, 26 Apr 2026 17:47:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 465DFC32EB0;
	Sun, 26 Apr 2026 15:47:31 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AADE9C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2026 15:47:29 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-43fde5b81a1so7059822f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2026 08:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1777218449; x=1777823249;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ay5BWKMwp9o/rxZeYsRX2pfTyaEApr2HS5FZb4AfA/Y=;
 b=f0lzHp8IgTnVMuZWvv7P3tLrF2iKx12Mm5tI/FgsgJqDKeWq4S361gNtzP+j/5xt97
 XxqefNCoPoYYpe3eROgQKN6qJFimB8Wk3buABP/dv5UnryR9g7JH+lUtOmmCcRKsYlfe
 mqrPqiw2cBcf0O1YlctYoj+oQ5NgBeln3OTKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777218449; x=1777823249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ay5BWKMwp9o/rxZeYsRX2pfTyaEApr2HS5FZb4AfA/Y=;
 b=FIq0BUs+0oUEwZLyRNbIYtg7554v3JADHzrFddZGFe2w2QbepPsoZ45YFcoSnGVC8V
 stFsmZRL+w4KIak/jc60dfCKYhPSgbymxAfeGLcvwzZ1pvA2d3uyuMY5q2Gal7zNeH9Y
 eIBvZJpTB0LsYqb2MSDnPSDM1/kJi6cVX7b2cAlu62XTSc1d15uS1ZvWVhZaUJWxpiuY
 Psg8jdcONBVNc1m/4QrQfOyGJKpEtNs03WKTt+7fVsGUVoRvzCGqux6NfavZ0dv60VmG
 fFqcdgujG/ENNb37H/Q/GeT+WM4xEetiKhWgSw3POlVCBMjNPadU0xomPj9Ixj7Avuwq
 +bYw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+FZqVfqU+Hgf0ZoO7yvfugSpzkKAT1QxVqzYL4VjyX16RqaHiRydW6U8U/xnCMGBkbdxcn5BRwfmn0fw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywst0xbIk0HCl/R3R3EmpptFRrZY2Avrz6hWHS272mRZz2AncE3
 CVEmp5DNUrApVBu99qVJDVaXNqCg2tBFT2zIB4i7kcshlnPN058bNsnGW+ry3u8802Q=
X-Gm-Gg: AeBDieuvz/4jTjmz/zC+tI8wo3+igeQbzeR7KVEyJNAjZwwwnGMypOshuEBp8R3U2lg
 5G2nAH7BPzRmfIPOuOxmdX9fczlQ+znRWV+0kb8rOwpXxeWdymLe+zZzVA4b4czQ7HRyLtZP/6v
 EfqLclDZhE9Vh333kmjHwHPPgc+f7AcoMDOFLB6qgg1X7TBtPoNIpzfVGxpeKJDgQIYhiYnCBnJ
 AaPfSobncv7TJTquow65Y4Sszk+x6ik/AxbgFjsY/U7bAWDfeG+C6/HpW8n2kmt9avwNwM1g9bW
 G8TNYg+SoF2CKoNaIcfs8/DD5zDri8XRcmjbzlEW3XR2iwXFiso7ewm4EYP8IVcj1rsFT6SrpFu
 n3lsmfzaeWKnwzNHMvrM/ijxAb5Kq0bQDl4paDC/peh1GHC1GAVII6OksFZXSN9pVL0+bmf7/6F
 4gZdoMz8mlBpdOGvJafZibBsulkV2+lxumBBs6yHjl4i+RyavOhUWHRcw2a/PhqC94MiQU6T4dV
 5ZcRupMn6uWICq0ftRjM/FXAKeg3BBRht9LVGbZOFkeswFyrXb6k2gMTnkkph9W9z+9Lxhjk0XM
 Xw5o/gGzIR2qxcSXT7Nuy6nG0seMfQ==
X-Received: by 2002:a05:6000:25c4:b0:43b:8f56:1e1d with SMTP id
 ffacd0b85a97d-43fe3dc10demr61510778f8f.13.1777218448919; 
 Sun, 26 Apr 2026 08:47:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-82-56-22-134.retail.telecomitalia.it. [82.56.22.134])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44123d23e0bsm34489985f8f.15.2026.04.26.08.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 08:47:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun, 26 Apr 2026 17:46:53 +0200
Message-ID: <20260426154724.2042569-1-dario.binacchi@amarulasolutions.com>
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
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Rasmus Villemoes <ravi@prevas.dk>, Jonathan GUILLOT <jonathan@joggee.fr>,
 Michal Simek <michal.simek@amd.com>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Padmarao Begari <padmarao.begari@amd.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 linux-amarula@amarulasolutions.com, Sughosh Ganu <sughosh.ganu@arm.com>
Subject: [Uboot-stm32] [PATCH v7 0/8] Support metadata-driven A/B boot for
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
X-Rspamd-Queue-Id: 9B58646A823
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
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:vincent.stehle@arm.com,m:mkorpershoek@kernel.org,m:quentin.schulz@cherry.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:dario.binacchi@amarulasolutions.com,m:trini@konsulko.com,m:jerome.forissier@arm.com,m:xypron.glpk@gmx.de,m:javierm@redhat.com,m:marek.vasut+renesas@mailbox.org,m:ravi@prevas.dk,m:jonathan@joggee.fr,m:michal.simek@amd.com,m:dinesh.maniyam@altera.com,m:kory.maincent@bootlin.com,m:sjg@chromium.org,m:ilias.apalodimas@linaro.org,m:padmarao.begari@amd.com,m:patrick.delaunay@foss.st.com,m:bmeng.cn@gmail.com,m:linux-amarula@amarulasolutions.com,m:sughosh.ganu@arm.com,m:marek.vasut@mailbox.org,m:bmengcn@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,cherry.de,st-md-mailman.stormreply.com,amarulasolutions.com,konsulko.com,gmx.de,redhat.com,mailbox.org,prevas.dk,joggee.fr,amd.com,altera.com,bootlin.com,chromium.org,linaro.org,foss.st.com,gmail.com];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]

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

Changes in v7:
- Add Reviewed-by of Simon Glass for patc 7/8 of "test: dm:
  fwu_mdata: add test for fwu_mdata_get_image_guid".

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
