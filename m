Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B47C45EAAFB
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 17:26:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6680DC0D2BB;
	Mon, 26 Sep 2022 15:26:33 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83236C035BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 15:26:31 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id d64so8646633oia.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:references:in-reply-to:from:sender
 :mime-version:from:to:cc:subject:date;
 bh=jwBNWxUgKxtlBbqTFxBMe3YB31Zrk0u3utYx+XlsvuU=;
 b=cYNVEClJJfg3KT1b1VjD/aSLaXtK7HdLdvOQvRJoKIa5qOahyjqpC+io06qbuLupFf
 JrsMiGXb61CF3wRXKZtaIvZX+8eDcLLo/auUbQWzGp1Xc1Xq4bEXo6yHTzqARHFiQ1lf
 yyBgwjcH09sfgB5CA5C9Iu0FuPtiqoEsuq/EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:references:in-reply-to:from:sender
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=jwBNWxUgKxtlBbqTFxBMe3YB31Zrk0u3utYx+XlsvuU=;
 b=T50gxT6jhMuAmoSNvnmgO3IV9DUlGOYkrH/SS9SJo+P7jD3AUdwWvFpuXP88AT0q2e
 T+n+YbKRog/dlsGuR5FcFUofB3pvJonG2D+N/44w6Nb0NoOnCE1qQbW6YVycVOns3oI4
 9FVWvjPOkj+srpAa5IS6agMqAltwH9+Uhnnt254PRFohYWMpgHYoYfjngSlOj0WDZjHC
 xg1paHoS8CjjIq46McFbI/a7qT0xI+fxRbJcriv1ZVZM5BJwo6E5YjbOj1l31/qwulry
 Ar6Bhq3HZ6ksFeT29LVZO00nwf7oDzxh6ql/xb3VmZc3ORXow/SdIsJOSRqt8gN9TqJ5
 Um9A==
X-Gm-Message-State: ACrzQf2cc0gxEf+mH2EhymUlPLXJeOHmPYW6q0zsOsuWnczrnfuy1tu7
 P/fRuGzbeaj/nqrD3/vmvnsu6hEou8KtWXjEaOOlPQ==
X-Google-Smtp-Source: AMsMyM7R9eCK3Zg23Gkb62wJpXdnv2ao7qRFPVJm369lkiJeD1GdCmmFPEHuGuQiq6SfnIRGpviP4V+CLkDIGVJ8dxs=
X-Received: by 2002:a05:6808:f0a:b0:350:61ee:8306 with SMTP id
 m10-20020a0568080f0a00b0035061ee8306mr14923017oiw.170.1664205990093; Mon, 26
 Sep 2022 08:26:30 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Sep 2022 10:26:28 -0500
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <20220917150009.91460-2-sjg@chromium.org>
References: <20220917150009.91460-2-sjg@chromium.org>
 <20220917150009.91460-1-sjg@chromium.org>
Date: Mon, 26 Sep 2022 10:26:27 -0500
X-Google-Sender-Auth: YXJTv1DnIJXdcYPhdVs5BwCgs9w
Message-ID: <CAPnjgZ0akLLGtqKaiBZjk2CnHFrBNOtd-cKv-f2LmQVaagTMuw@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Peng Fan <peng.fan@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>,
 Gary Bisson <gary.bisson@boundarydevices.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>, Stefan Roese <sr@denx.de>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, Tom Rini <trini@konsulko.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ricardo Salveti <ricardo@foundries.io>, Ramon Fried <rfried.dev@gmail.com>,
 Marek Vasut <marex@denx.de>, schspa <schspa@gmail.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Max Merchel <Max.Merchel@tq-group.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 1/1] blk: Rename if_type to uclass_id
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

Use the word 'uclass' instead of 'if_type' to complete the conversion.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v4:
- Fix comments from Takahiro Akashi missed on the previous revision

Changes in v3:
- Drop previously applied patches
- Rebase on -next after EFI changes

Changes in v2:
- Use conv_uclass_id() instead of the confusing uclass_id_to_uclass_id()

 board/st/common/stm32mp_dfu.c |   2 +-
 cmd/bcb.c                     |   4 +-
 cmd/blk_common.c              |  18 ++---
 cmd/lsblk.c                   |   2 +-
 cmd/mmc.c                     |   4 +-
 common/spl/spl_sata.c         |   2 +-
 common/spl/spl_usb.c          |   2 +-
 common/usb_storage.c          |   6 +-
 disk/disk-uclass.c            |   8 +-
 disk/part.c                   |  14 ++--
 doc/usage/partitions.rst      |   2 +-
 drivers/ata/sata.c            |   2 +-
 drivers/block/blk-uclass.c    | 145 +++++++++++++++++-----------------
 drivers/block/blk_legacy.c    |  58 +++++++-------
 drivers/block/ide.c           |   8 +-
 drivers/block/sandbox.c       |   8 +-
 drivers/mmc/mmc-uclass.c      |   2 +-
 drivers/mmc/mmc_legacy.c      |   8 +-
 drivers/net/fsl_enetc.c       |  12 +--
 drivers/net/fsl_enetc.h       |   2 +-
 drivers/scsi/scsi.c           |   6 +-
 drivers/virtio/virtio_blk.c   |   2 +-
 drivers/xen/pvblock.c         |   2 +-
 fs/fat/fat.c                  |   2 +-
 include/blk.h                 | 122 ++++++++++++++--------------
 include/efi_loader.h          |   4 +-
 lib/efi_loader/efi_disk.c     |  12 +--
 lib/efi_loader/efi_var_file.c |   4 +-
 28 files changed, 231 insertions(+), 232 deletions(-)

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
