Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LbJEJRnBGpVIAIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 May 2026 13:59:16 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3727532A63
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 May 2026 13:59:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D487C8F289;
	Wed, 13 May 2026 11:59:15 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com
 [74.125.224.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24C4DC01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 11:59:12 +0000 (UTC)
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-65c24be9e4bso7287948d50.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 04:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778673552; cv=none;
 d=google.com; s=arc-20240605;
 b=lZK8e23KM3ukdA3trnm7vAvrTZHZVX5HnvGFMNVtBI+w9DoNCgKOQrZzqOORz6LpZI
 8UryQ+f4AhTP0vC/UleC5g2Dn+x/gh2haEHNudxfmrSruMPY37t6XFznSaOpxW38kvvR
 4rqjGGAx/Lv8BLcF9fn53JpkunNT/t6/OfokRI8y3VdAhH+4/4DL6KGzWhI/g9H951HX
 c4vhvkWvufnyWrIrF67oqcwbkkUZJZVBmuhQxdsNM19gi6Tq6LRNtYMoVCIqnVhNJyxU
 VmV3bS9TyOfV3D06KQ3Da2UNkjFvlhrWNnppjD+hJU/rHvt9U22c+8lfa9/Ic/VmfN1R
 Zxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5vvwS9hoZx8wbN7EvGS9aBvcCYryu1CZA9iR91bh4yo=;
 fh=fqNANyCxB1nedfvgExMyvykLh57OXNIdQExAdDB+zq8=;
 b=cAQ7XO193Fozz4c4M94UAexqL40uHFap2NO2Bz+X5vknhq3r2HYW+g3WQDfSAkcQDC
 0dDB5nSdk9o4QG2RZhXY/EpKosMtVDqpxNBfCE4CJN7bVdc/T7KGFBtXH1Pz1+J8HI1f
 3L+bMeuDcNS4tC9Ea+pHrLo9gAd8lEnsdf97KZeHGLQIblhAkmL4DONmIoGa8SuFP5X7
 GMjP1RiW42hz/2dSE0CIovdawDMKNTPauLcZTkSRfLPpQr3roWGHfH8XvO+b2Bf4720o
 7d8AEKWmialueaAeyzYzt7z9V5DzIrnqVc5Dj+1bL2xB36dRMhagq1BBrU7ilCEqMc+n
 MkCg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778673552; x=1779278352;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5vvwS9hoZx8wbN7EvGS9aBvcCYryu1CZA9iR91bh4yo=;
 b=vTQxTBLM28TlWnkb3W3n2ca8KRCKQnfx/NzH3c/0OSanM/17NEa299xWLF1gPhhBZC
 Qka0QCJFG1Bx0Cx4FDPS6j3jpzWTMFE3behUIlcuhOsH6fueh+9UTwfoFYgqZTvEPHPO
 JhtNdmIecEfYi3cq/QNUp8rDfYEBPPLZG91K9w4sSQSfRAV82qV1qCo7KEcozQdcxKuJ
 zDzpOl+GEsdrP6+sHEmARwBycbIexZriETRf7WrDVsU9TiuW4w1mT4PwyVZmMyJViz9R
 DxlpirJZq/sW+/ggzgNScRaPc3sWJph3Li4zy9L+zrSvi07X6Lv3gOkUcJZjp8zAEDLP
 Gi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778673552; x=1779278352;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5vvwS9hoZx8wbN7EvGS9aBvcCYryu1CZA9iR91bh4yo=;
 b=seMx7r+LZFdOrK1M5INpJXwJqNTy0ZhWWtovQAwi72ZPcGXpHtgS1MkfBKZp7v2qsR
 8bQRTaJj3JCc9h85cZ1MEP4ni8heaM8q/J9Br86U/sipwwh0z8FxPUbm5JtHvGpJhK1B
 UtWCo/eKgPPlyoUQgAQKKFR6cdwj2UJpd2vH0uIv/Q6proy72oHU7MaUcpsv5MTnLRfA
 Av4samW8ZYmyiyPo9sMy7ELK7LYRJAJ5Z5lqGHi+YDbMui/aMhlxT4j2nvtR/QzWmtGL
 PWqK4BBClWz6HT5wxknNcXqT9p3F5qm7MA0IwBaLIMsRHKurdzqvAzdkbCnd2EzBhwvr
 bo8w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zmZISWKZtScZztoAgBgrqcCzmAo2kb1Duu8TjwZqrf7uXNkM1aqmLnIiEvqaNrFwpbw7DguovbQVOzw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyzRZEI6qWXkT53i7LvlK6TdbOWxj4iHj98zZOEeOrklAmx72fl
 W9kUKefFwnvzNZzkX6i+k3W3rvxBlDzKILgGselFO3ejFH43mpbap9K8eoCoNtGmsMve9ZMAbnf
 2gFe7xvYT4xj6qz1SC26gclWZoA3ep4LbesbmaiQMTw==
X-Gm-Gg: Acq92OGxyMjyljes18d2D8EHXpUZPrD1bpcJ37wF9EFEjeFyx00KXz5d5p7YgUBCaxg
 nM0Nj/GzetJSfoatNrKO2HDtr4YvCYBX1Whmx2xHRHJcXqPCY8T3KO4UXGhQLNV01wcKGsLFReV
 jsqpaJ6imsQR7B1WbvgpTM1b7jnra6JDubqKd4tIQu9CGfQGN61j2YYyReNfEP9XHsRO66y0jkG
 0kEIMEAK6jjy+0wmXHX614b80OzogoqWxUxg9j0c/rZvMHHv8wYNHZcQEozT/1racAwZNC51Lxl
 LIsLzOwRIq+HcUB41qLWNonv6CjaVPmLzOrcFaqbAxIaEgmVXNYSWg09EF9YbUIOzVVnjGy6M40
 t6hkcDdnKSe5D3wP2oQyChuWMt1FORVmCNiCoMMJXm6fyta2Z8n+9scip+iaLkexyDC5h24Tgdm
 q0LiqYuwLgCU5YJMs91sVIobr045R9m/iTZbeNK35BlCYSEcR+wp1dWYf4Z9fQeApztU18og8pH
 c9xUJKGZv8pEvix5Mflls3NEWUyHWDjq+1trDGz7U0s05kqVF3oK6sA2CZe/PStGgw+BxnSS07v
 rzOPxBMfUWBAMr69dmqqzx+UlMOAHh6WTgtTnTAfNYAzk1IjxXJpudhnljPKmGlj9p10y5oCxTR
 VTvUXDQ==
X-Received: by 2002:a05:690e:13c2:b0:65d:8f98:6bb4 with SMTP id
 956f58d0204a3-65df62339ecmr2796001d50.29.1778673551660; Wed, 13 May 2026
 04:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260430080627.849636-1-dario.binacchi@amarulasolutions.com>
 <0f23738b-b6cb-44f5-8b89-2f74760f1bf2@foss.st.com>
 <CAC_iWjLe9cv9C=uMjuMJVhLJ7P=RA020PO4GqZ8UjX8z0yfdyw@mail.gmail.com>
 <731224c0-a38a-41d4-959b-1b05d608cf28@foss.st.com>
In-Reply-To: <731224c0-a38a-41d4-959b-1b05d608cf28@foss.st.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 13 May 2026 14:58:35 +0300
X-Gm-Features: AVHnY4JSqFi92mlQlqwc_9IGUCUKe_kjCjl0XoqeTpDN4ss9vDnx31D_M0fzwJg
Message-ID: <CAC_iWjKM1MOLdnd2WyGgAkZwzdZ6_sBvA4HMYnOOQbzXNQzk9A@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Quentin Schulz <quentin.schulz@cherry.de>, u-boot@lists.denx.de,
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
 Padmarao Begari <padmarao.begari@amd.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com, Sughosh Ganu <sughosh.ganu@arm.com>
Subject: Re: [Uboot-stm32] [PATCH v8 0/8] Support metadata-driven A/B boot
	for STM32MP25
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
X-Rspamd-Queue-Id: D3727532A63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:vincent.stehle@arm.com,m:mkorpershoek@kernel.org,m:quentin.schulz@cherry.de,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:dario.binacchi@amarulasolutions.com,m:trini@konsulko.com,m:jerome.forissier@arm.com,m:xypron.glpk@gmx.de,m:javierm@redhat.com,m:john.toomey@amd.com,m:marek.vasut+renesas@mailbox.org,m:ravi@prevas.dk,m:jonathan@joggee.fr,m:michal.simek@amd.com,m:dinesh.maniyam@altera.com,m:kory.maincent@bootlin.com,m:sjg@chromium.org,m:padmarao.begari@amd.com,m:patrick.delaunay@foss.st.com,m:linux-amarula@amarulasolutions.com,m:sughosh.ganu@arm.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ilias.apalodimas@linaro.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,cherry.de,lists.denx.de,st-md-mailman.stormreply.com,amarulasolutions.com,konsulko.com,gmx.de,redhat.com,amd.com,mailbox.org,prevas.dk,joggee.fr,altera.com,bootlin.com,chromium.org,foss.st.com];
	DKIM_TRACE(0.00)[linaro.org:-];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilias.apalodimas@linaro.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.237];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

On Wed, 13 May 2026 at 11:15, Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
>
>
> On 5/13/26 10:00, Ilias Apalodimas wrote:
> > Hi Patrice,
> >
> > Can you please get an Ack from Sughosh before queuing these up? I'll
> > also ping him and see if has time to havea  look
> >
> > Thanks
> > /Ilias
>
> Hi Ilias
>
> Oups, i already submitted the pull request including this series.

Ok, I don't really mind the changes to go in. But I dont have the
bandwidth to have a look, so an ACK from Sughosh would be great

Cheers
/Ilias
>
> Patrice
>
> >
> >
> > On Wed, 13 May 2026 at 08:48, Patrice CHOTARD
> > <patrice.chotard@foss.st.com> wrote:
> >>
> >>
> >>
> >> On 4/30/26 10:06, Dario Binacchi wrote:
> >>> This series, the mainline version of [1], provides the necessary changes
> >>> in U-Boot to support the metadata-driven A/B update flow for STM32MP25
> >>> boards. It implements the logic required to dynamically select the boot
> >>> bank based on FWU metadata.
> >>>
> >>> These changes are designed to be backward compatible while providing
> >>> the necessary infrastructure for the A/B scheme.
> >>>
> >>> The series has been tested on the STM32MP257F-EV1 board.
> >>>
> >>> Additionally, some patches in the series propose changes with
> >>> general-purpose utility:
> >>>
> >>>  1/7 lib: uuid: add partition type GUID for extended bootloader
> >>>  4/7 cmd: part: support lookup by UUID in 'part number'
> >>>  6/7 fwu: add helper to get image GUID by type and bank index
> >>>
> >>> [1] https://github.com/STMicroelectronics/u-boot/pull/6
> >>>
> >>> Changes in v8:
> >>> - Skip the test in case the CONFIG_MCC is not enabled or the mmc
> >>>   device is not found.
> >>> - Add Reviewed-by of Patrice Chotard
> >>> - Skip cmd_test_part tests for configurations where MMC is not enabled
> >>>   or the device is missing
> >>>
> >>> Changes in v7:
> >>> - Add Reviewed-by of Simon Glass for patc 7/8 of "test: dm:
> >>> fwu_mdata: add test for fwu_mdata_get_image_guid"
> >>>
> >>> Changes in v6:
> >>> - Add Reviewed-by of Simon Glass to patch 3/8 "test: cmd: add unit
> >>>   tests for part command"
> >>>
> >>> Changes in v5:
> >>> - Update doc/usage/cmd/part.rst to reflect the changes related to the
> >>>   part command.
> >>> - Add Acked-by of Ilias Apalodimas to patch 6/8 "fwu: add helper to get
> >>>   image GUID by type and bank index"
> >>>
> >>> Changes in v4:
> >>> - Place the part command tests in the cmd suite rather than the dm
> >>>   suite.
> >>> - Order the include files according the U-Boot coding style.
> >>> - Add patch 7/8 test: dm: fwu_mdata: add test for fwu_mdata_get_image_guid
> >>>
> >>> Changes in v3:
> >>> - Wrap lines exceeding 80 columns in test/cmd/part.c file.
> >>> - Combine run_command() and ut_asserteq() -> ut_asserteq(1, run_command(
> >>> - Add kerneldoc comment for fwu_mdata_get_image_guid() above its declaration
> >>>   in fwu.h.
> >>> - Add log_warning() messages to fwu_platform_hook() to catch inconsistent
> >>>   FWU metadata (boot GUID found but root GUID missing or viceversa), as
> >>>   suggested by Simon Glass.
> >>>
> >>> Changes in v2:
> >>> - Add links to the XBOOTLDR specification in the commit message of patch
> >>>    1/7 lib: uuid: add partition type GUID for extended bootloader.
> >>> - Update help for 'part start', 'part size' to mention UUID.
> >>> - Add kerneldoc comment for fwu_mdata_get_image_guid().
> >>> - Pass efi_guid_t by pointer in fwu_mdata_get_image_guid().
> >>> - Add patches:
> >>>    5/7 test: cmd: part: add UUID lookup tests
> >>>    3/7 test: cmd: add unit tests for part command
> >>>    2/7 test: dm: part: add test for part_get_info_by_uuid
> >>>
> >>> Dario Binacchi (8):
> >>>   lib: uuid: add partition type GUID for extended bootloader
> >>>   test: dm: part: add test for part_get_info_by_uuid
> >>>   test: cmd: add unit tests for part command
> >>>   cmd: part: support lookup by UUID
> >>>   test: cmd: part: add UUID lookup tests
> >>>   fwu: add helper to get image GUID by type and bank index
> >>>   test: dm: fwu_mdata: add test for fwu_mdata_get_image_guid
> >>>   board: st: stm32mp25: support dynamic A/B bank bootup
> >>>
> >>>  board/st/stm32mp2/stm32mp2.c          |  32 ++++
> >>>  cmd/part.c                            |  12 +-
> >>>  doc/README.gpt                        |   2 +
> >>>  doc/usage/cmd/part.rst                |   6 +-
> >>>  include/configs/stm32mp25_st_common.h |  15 ++
> >>>  include/fwu.h                         |  11 ++
> >>>  include/part_efi.h                    |   3 +
> >>>  lib/fwu_updates/fwu.c                 |  33 ++++
> >>>  lib/uuid.c                            |   1 +
> >>>  test/cmd/Makefile                     |   1 +
> >>>  test/cmd/part.c                       | 227 ++++++++++++++++++++++++++
> >>>  test/dm/fwu_mdata.c                   |  48 ++++++
> >>>  test/dm/part.c                        |  53 ++++++
> >>>  13 files changed, 437 insertions(+), 7 deletions(-)
> >>>  create mode 100644 test/cmd/part.c
> >>>
> >> For the whole series
> >>
> >> Applied to u-boot-stm32/master
> >>
> >> Thanks
> >> Patrice
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
