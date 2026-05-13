Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO6PFNAvBGo/FAIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 May 2026 10:01:20 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F13F752F3FA
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 May 2026 10:01:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D863C8F289;
	Wed, 13 May 2026 08:01:04 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com
 [74.125.224.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A80FC01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 08:01:03 +0000 (UTC)
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-656d749109cso3734228d50.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 01:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778659262; cv=none;
 d=google.com; s=arc-20240605;
 b=kH2I3QlSeM/qZo5616T10kQACyqazNIgKAseDCbJLowl598WBDIjXiQigm82pGlHDp
 27/BhIydRFTlhIiQ5r66q99JtDQnL1KRxhY2WZOe3u039SqLCaun+0ReTCJNwCOTOcVf
 uiYOmj3sO3AlREXZGQErxNziqGXd0pWdz1Ai2tT54K7U9/DaiinGIIeuwOotlKGbEEiK
 u1EZJa32EN9Khg6YblcNpaYKbmNqZ0YEQyIdYAXp4wBj2+6AHRdm/sia8Q1C5WTGvCEv
 ZZlVzJHcCtLy/lbk9Pt7cEky7hqUboW2AMHWHI6OVr+UfoBbePMpSjNdZJCCRXw3PpYC
 5A9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=xxcIO+CWAuVR9+qO2DURnno8/2vnP3jUmz8qVpdtAsU=;
 fh=WmccD5h92Qm3nuu6AbWnE3xuFMXuc2bVFYrc6BB8CqM=;
 b=e1YJ53cREt3R9jVHfcSHRoTE1PPyI3r1t06D+yIp2MBoMIZkPyAmrejk6Zq7YfhqT2
 ZdBvzBkkNyxiWGOQmj2d9DxXmn/j/26sw63kX9+S2Bn6nEE7/DX9RICK0erTvVnNix1u
 cVqFtOTAnNWG9m2DH16LNGm+L6nGILLv/7B0ELscIrFriXcqA7jq4VETWUgkuekP64y9
 rqpE0haAnLTezF9wRmT79dVbPTW2IAsQ5Nd1uGJXWoUboPo8IBC6UvhqdmZ9AuVXYIzY
 H9t8z20ypFPfIN2tEfJJJ4c0iFsf6fdWPOk3OJrg92kLgTiJPxXKzw9qxRJhMGWmHnVm
 F0zQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778659262; x=1779264062;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xxcIO+CWAuVR9+qO2DURnno8/2vnP3jUmz8qVpdtAsU=;
 b=gz8c9PAqlgLhP4J9wtfxVwJvov4LPQ4/VeEjNu1bwStPKwI2bFqUmSshF+oJ9kKwyA
 hQnCqLHVaaa+7coVXC/0x+ibALb6rM3Lf5LJO4Rtw6KXqG2mSZdSSYQTVTo+A9eNyKyI
 Nr6aZvZ7dtcPvQeRzp/raBKGJi+OAy7Gq+AmDF9dYsIXW2fjohZAsAs1zYu1OPVpjrQU
 /uZRngFEFkjB3PD3X64kWAQ86vSjP7pICdus89Cw3kKd4X9KHEqOx77mNx0KnaGjzBpA
 Lo0CplG0hANJwweRLPQL14I9ujYGLIyfi2V/W39TFp85KddhZzRmLWQ19sfAjjbbi/WA
 5h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778659262; x=1779264062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xxcIO+CWAuVR9+qO2DURnno8/2vnP3jUmz8qVpdtAsU=;
 b=WjUK0PXF/TDhr5A6mBUwpMWojX4/AXgc3avkNOBB0SYMlLdzxpJI7HPVksdaLPK/gS
 l3Xu6abyJ+UDdeeAeH9DLgWRLMDCr6zBRLM4RJTBrqS3Tg9LRxJMZwE2nnqtrifJ6L5O
 3yNMdXUBb3ZO3oHIFDsS+oSbtltDBLbOzcYz1uZt2Kklom5VCDxJYiDr8UWgyGiLbO8B
 PVKFR9MHCxBeBzX5C2DLTjN0C3zmkCh4/htlcnrxcqPj7yDkioyCcmrwSQe4BpSUwseI
 nj7BBPeT1lp08nx2De12sU4iqALvo0PqijJCQLmrgJCKdwQvgdT5eZQtoMkguBhQWE+u
 c9WA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8QYfJoN7bStvvGyTkDTOlq5BEIhMrZx9ncHk9ulMtIVpcBQeFWFKFlbtvmhVCaGqEQPX/BwC9E19jblA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyxzl1bZGLl+u9XJ0OmvAav1f7LGvhk6ixNwacnZhiPPZ8Ccp4O
 LH1IIEm8LxceUrZbpwRUY0yuKZpLrYiS2uMzoHbiEs5QYet9LB65dmBq8GauXbLi1IaUGYBYLsu
 uTOoWJAg8NTfabYn/2Bw5locLemay0ZW9xrHwrgpBIQ==
X-Gm-Gg: Acq92OFRNf+kbgecs01elVTAoklj2fGJdPZj9j8pPicgygh9kOcYNbaCq/BnYJTBudk
 LUSqEesdeihYXu+thMJuNW08ps7K0BrifDwMbH32JR3RMwBCxgSrUrA4kuRcMebS/As/pqI2yrz
 28SbNgu1dSrq/KIVs/7eo8q8bNC1Ud/HsV1CI7xXHEKsa3zmszSVE5XjkW/6wyHlgWELUtg9Bze
 kl35gUjzuOmUv2wHtY0wxAJauQks3siVd/Hyq8U/xQPw+Sd7AgYArPDP02ZIrRjE39jb0hz/9yZ
 6dXpAsZriQ3knsiiQ4J6sFIIYNIKdTuKU6ouE3sl2+r2vAo3URzD8ypgtloa8H3/TJ8Lg2ls3nF
 OE2qgM/99bztnWz+vPnBOYuzmVrCPljIq5//ABqwjaFmzb3oGAcx7p6mEQLurra6mEKNFAFE7L1
 OQOzRKwL/SSiVE0OSRWIIRoFL0+D32ikz467McwM9Lqyqp02UglaURAIFV+tF6M3eSGNm5Nxy9T
 riDD+zKXT/kzRZUiSxjrTwr8JWC9X3J3OnD9UhFCXHGpGJLz5NZF10Fow+aoUvukpmtqyc14K2H
 lERB6siSchqBlmwJ4N1ifBlfT/Ow9Ya2K0sFRanjMyCu0gnob8vskqPdjeLiidpkVhPC5LFMIcN
 8Sy2ZZA==
X-Received: by 2002:a05:690e:4004:b0:64a:d479:bfbe with SMTP id
 956f58d0204a3-65df61ca569mr2108795d50.11.1778659261713; Wed, 13 May 2026
 01:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260430080627.849636-1-dario.binacchi@amarulasolutions.com>
 <0f23738b-b6cb-44f5-8b89-2f74760f1bf2@foss.st.com>
In-Reply-To: <0f23738b-b6cb-44f5-8b89-2f74760f1bf2@foss.st.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 13 May 2026 11:00:25 +0300
X-Gm-Features: AVHnY4JCrPj9noh6o4V2feG93XVsyMWAzChQXHJfQqGWJv7l67L1Kqd48UhO7j8
Message-ID: <CAC_iWjLe9cv9C=uMjuMJVhLJ7P=RA020PO4GqZ8UjX8z0yfdyw@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@arm.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Jerome Forissier <jerome.forissier@arm.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Rasmus Villemoes <ravi@prevas.dk>,
 Jonathan GUILLOT <jonathan@joggee.fr>,
 Javier Martinez Canillas <javierm@redhat.com>,
 John Toomey <john.toomey@amd.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Michal Simek <michal.simek@amd.com>,
 Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Simon Glass <sjg@chromium.org>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>
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
X-Rspamd-Queue-Id: F13F752F3FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:sughosh.ganu@arm.com,m:kory.maincent@bootlin.com,m:marek.vasut+renesas@mailbox.org,m:vincent.stehle@arm.com,m:jerome.forissier@arm.com,m:padmarao.begari@amd.com,m:mkorpershoek@kernel.org,m:xypron.glpk@gmx.de,m:ravi@prevas.dk,m:jonathan@joggee.fr,m:javierm@redhat.com,m:john.toomey@amd.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:michal.simek@amd.com,m:trini@konsulko.com,m:quentin.schulz@cherry.de,m:patrick.delaunay@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:sjg@chromium.org,m:dinesh.maniyam@altera.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[st.com:query timed out,stormreply.com:query timed out];
	FORGED_SENDER(0.00)[ilias.apalodimas@linaro.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	ASN_FAIL(0.00)[89.6.209.52.asn.rspamd.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[23];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[st.com:query timed out];
	FREEMAIL_CC(0.00)[bootlin.com,mailbox.org,arm.com,amd.com,kernel.org,gmx.de,prevas.dk,joggee.fr,redhat.com,lists.denx.de,st-md-mailman.stormreply.com,konsulko.com,cherry.de,foss.st.com,amarulasolutions.com,chromium.org,altera.com];
	DKIM_TRACE(0.00)[linaro.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[stormreply.com:query timed out,st.com:query timed out];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilias.apalodimas@linaro.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	NEURAL_SPAM(0.00)[0.647];
	RSPAMD_EMAILBL_FAIL(0.00)[patrice.chotard.foss.st.com:query timed out,uboot-stm32.st-md-mailman.stormreply.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

Hi Patrice,

Can you please get an Ack from Sughosh before queuing these up? I'll
also ping him and see if has time to havea  look

Thanks
/Ilias


On Wed, 13 May 2026 at 08:48, Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
>
>
> On 4/30/26 10:06, Dario Binacchi wrote:
> > This series, the mainline version of [1], provides the necessary changes
> > in U-Boot to support the metadata-driven A/B update flow for STM32MP25
> > boards. It implements the logic required to dynamically select the boot
> > bank based on FWU metadata.
> >
> > These changes are designed to be backward compatible while providing
> > the necessary infrastructure for the A/B scheme.
> >
> > The series has been tested on the STM32MP257F-EV1 board.
> >
> > Additionally, some patches in the series propose changes with
> > general-purpose utility:
> >
> >  1/7 lib: uuid: add partition type GUID for extended bootloader
> >  4/7 cmd: part: support lookup by UUID in 'part number'
> >  6/7 fwu: add helper to get image GUID by type and bank index
> >
> > [1] https://github.com/STMicroelectronics/u-boot/pull/6
> >
> > Changes in v8:
> > - Skip the test in case the CONFIG_MCC is not enabled or the mmc
> >   device is not found.
> > - Add Reviewed-by of Patrice Chotard
> > - Skip cmd_test_part tests for configurations where MMC is not enabled
> >   or the device is missing
> >
> > Changes in v7:
> > - Add Reviewed-by of Simon Glass for patc 7/8 of "test: dm:
> > fwu_mdata: add test for fwu_mdata_get_image_guid"
> >
> > Changes in v6:
> > - Add Reviewed-by of Simon Glass to patch 3/8 "test: cmd: add unit
> >   tests for part command"
> >
> > Changes in v5:
> > - Update doc/usage/cmd/part.rst to reflect the changes related to the
> >   part command.
> > - Add Acked-by of Ilias Apalodimas to patch 6/8 "fwu: add helper to get
> >   image GUID by type and bank index"
> >
> > Changes in v4:
> > - Place the part command tests in the cmd suite rather than the dm
> >   suite.
> > - Order the include files according the U-Boot coding style.
> > - Add patch 7/8 test: dm: fwu_mdata: add test for fwu_mdata_get_image_guid
> >
> > Changes in v3:
> > - Wrap lines exceeding 80 columns in test/cmd/part.c file.
> > - Combine run_command() and ut_asserteq() -> ut_asserteq(1, run_command(
> > - Add kerneldoc comment for fwu_mdata_get_image_guid() above its declaration
> >   in fwu.h.
> > - Add log_warning() messages to fwu_platform_hook() to catch inconsistent
> >   FWU metadata (boot GUID found but root GUID missing or viceversa), as
> >   suggested by Simon Glass.
> >
> > Changes in v2:
> > - Add links to the XBOOTLDR specification in the commit message of patch
> >    1/7 lib: uuid: add partition type GUID for extended bootloader.
> > - Update help for 'part start', 'part size' to mention UUID.
> > - Add kerneldoc comment for fwu_mdata_get_image_guid().
> > - Pass efi_guid_t by pointer in fwu_mdata_get_image_guid().
> > - Add patches:
> >    5/7 test: cmd: part: add UUID lookup tests
> >    3/7 test: cmd: add unit tests for part command
> >    2/7 test: dm: part: add test for part_get_info_by_uuid
> >
> > Dario Binacchi (8):
> >   lib: uuid: add partition type GUID for extended bootloader
> >   test: dm: part: add test for part_get_info_by_uuid
> >   test: cmd: add unit tests for part command
> >   cmd: part: support lookup by UUID
> >   test: cmd: part: add UUID lookup tests
> >   fwu: add helper to get image GUID by type and bank index
> >   test: dm: fwu_mdata: add test for fwu_mdata_get_image_guid
> >   board: st: stm32mp25: support dynamic A/B bank bootup
> >
> >  board/st/stm32mp2/stm32mp2.c          |  32 ++++
> >  cmd/part.c                            |  12 +-
> >  doc/README.gpt                        |   2 +
> >  doc/usage/cmd/part.rst                |   6 +-
> >  include/configs/stm32mp25_st_common.h |  15 ++
> >  include/fwu.h                         |  11 ++
> >  include/part_efi.h                    |   3 +
> >  lib/fwu_updates/fwu.c                 |  33 ++++
> >  lib/uuid.c                            |   1 +
> >  test/cmd/Makefile                     |   1 +
> >  test/cmd/part.c                       | 227 ++++++++++++++++++++++++++
> >  test/dm/fwu_mdata.c                   |  48 ++++++
> >  test/dm/part.c                        |  53 ++++++
> >  13 files changed, 437 insertions(+), 7 deletions(-)
> >  create mode 100644 test/cmd/part.c
> >
> For the whole series
>
> Applied to u-boot-stm32/master
>
> Thanks
> Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
