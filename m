Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EBD5909EA
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Aug 2022 03:35:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B79BEC04005;
	Fri, 12 Aug 2022 01:35:12 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFE15C04005
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Aug 2022 01:35:11 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-31f41584236so189747407b3.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Aug 2022 18:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc; bh=TVs6ZqJcrAYkaQ15SWHvLw4WKnItVvcLax4uMBvDFZg=;
 b=aQHVZXDuUADkJF5Qh9G1A5S4VWkCbfg8uPmUCVskz7GhK0fcEjQ4qiPugLiwDqlQMK
 fKssnnFEY02o8mGlSQPwD9TbrVsc+eRGnMV8CCDqEzDPgoeOBvO88fwWhPSFpjxirGuA
 XlivQASxe0T0mhq1eAKXVEGMp4COSbRJUFfwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=TVs6ZqJcrAYkaQ15SWHvLw4WKnItVvcLax4uMBvDFZg=;
 b=CBjzo9BssNX9azVAEv38myvgj28KSzEkq8RfxnUcTQY/nlEyBhS5NkoVz2jCRcGU21
 THHKfIA3HVFRyqYv0r2YiFP085VTclj9Lg7OzW87tnCgyuTIdLiolK6s6duTjezHF6SR
 ZLfRueeCH52lXS3nYPszpA+dKKsH27yWYLL/ghM2d/XTnQFgKHDT1KrXeHq72OKHogrV
 44tJZ1fG06trmFoAwIbPKLirvSkEXGm/THtz9CFN5GxIg7w5SMCgTSh5Ped+TarjVERS
 5lBDtyZXlogJGzMBIS/zYpGIOs3TV3RrPpkHyGAtckgHEkw5kRNQfTT8Bvi41yBuJC8A
 G73w==
X-Gm-Message-State: ACgBeo3jVf5bQSFSpe1bwwjgmbgdcWmqmG6ev1jhxTvWvRqOiL80dvME
 nmDvDHuCyVnOJ5SWqMMxIvx2DEA77vjMXDzI+Un45Q==
X-Google-Smtp-Source: AA6agR7DI66FPzYkI5D+9YpSHE7PhE5lujeItEuf+xerCcwdkt3SqDJwg5JVCaHIk3c7ym/x+OoJcFUQ5tYk699usKg=
X-Received: by 2002:a81:8315:0:b0:31f:6023:7526 with SMTP id
 t21-20020a818315000000b0031f60237526mr1876887ywf.328.1660268110579; Thu, 11
 Aug 2022 18:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220807154708.1418967-1-sjg@chromium.org>
 <20220807154708.1418967-22-sjg@chromium.org>
 <20220808010541.GB44816@laputa>
In-Reply-To: <20220808010541.GB44816@laputa>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 11 Aug 2022 19:34:59 -0600
Message-ID: <CAPnjgZ0hLL5D9mgbEsq_w_skKg_fXpemsx=_j_Ym8eUQrFUyuQ@mail.gmail.com>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Simon Glass <sjg@chromium.org>, 
 U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Anastasiia Lukianenko <vicooodin@gmail.com>, 
 Andrew Scull <ascull@google.com>, Aswath Govindraju <a-govindraju@ti.com>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Denys Drozdov <denys.drozdov@toradex.com>, Fabio Estevam <festevam@denx.de>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Gary Bisson <gary.bisson@boundarydevices.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, 
 Jens Wiklander <jens.wiklander@linaro.org>,
 Joe Hershberger <joe.hershberger@ni.com>, 
 Judy Wang <wangjudy@microsoft.com>, Loic Poulain <loic.poulain@linaro.org>, 
 Lukasz Majewski <lukma@denx.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "Marek Beh??n" <kabel@kernel.org>, Marek Vasut <marex@denx.de>, 
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Max Merchel <Max.Merchel@tq-group.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>,
 "Pali Roh??r" <pali@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
 Philippe Schenker <philippe.schenker@toradex.com>,
 Sean Anderson <sean.anderson@seco.com>, 
 Stefan Roese <sr@denx.de>, Tony Dinh <mibodhi@gmail.com>,
 Wolfgang Denk <wd@denx.de>, 
 "Ying-Chun Liu (PaulLiu)" <paul.liu@linaro.org>, schspa <schspa@gmail.com>, 
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 21/23] blk: Switch over to using uclass IDs
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

Hi Takahiro,

On Sun, 7 Aug 2022 at 19:05, AKASHI Takahiro <takahiro.akashi@linaro.org> wrote:
>
> My comment below is not directly related to the change, but
>
> On Sun, Aug 07, 2022 at 09:47:06AM -0600, Simon Glass wrote:
> > We currently have an if_type (interface type) and a uclass id. These are
> > closely related and we don't need to have both.
> >
> > Drop the if_type values and use the uclass ones instead.
> >
> > Maintain the existing, subtle, one-way conversion between UCLASS_USB and
> > UCLASS_MASS_STORAGE for now, and add a comment.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> >  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    |  4 +-
> >  board/toradex/common/tdx-cfg-block.c          |  4 +-
> >  cmd/bcb.c                                     |  4 +-
> >  cmd/ide.c                                     |  2 +-
> >  cmd/mmc.c                                     |  8 +--
> >  cmd/mvebu/bubt.c                              |  2 +-
> >  cmd/nvme.c                                    |  4 +-
> >  cmd/pvblock.c                                 |  2 +-
> >  cmd/sata.c                                    |  4 +-
> >  cmd/scsi.c                                    |  2 +-
> >  cmd/usb.c                                     |  2 +-
> >  cmd/virtio.c                                  |  2 +-
> >  common/spl/spl_sata.c                         |  2 +-
> >  common/spl/spl_usb.c                          |  2 +-
> >  common/usb_storage.c                          |  8 +--
> >  disk/part.c                                   | 52 ++++++++--------
> >  doc/develop/uefi/uefi.rst                     |  2 +-
> >  drivers/ata/dwc_ahsata.c                      |  2 +-
> >  drivers/ata/fsl_sata.c                        |  2 +-
> >  drivers/ata/sata.c                            |  2 +-
> >  drivers/ata/sata_mv.c                         |  2 +-
> >  drivers/ata/sata_sil.c                        |  2 +-
> >  drivers/block/blk-uclass.c                    | 62 ++++++++++---------
> >  drivers/block/efi_blk.c                       |  2 +-
> >  drivers/block/ide.c                           |  8 +--
> >  drivers/block/sandbox.c                       | 12 ++--
> >  drivers/dfu/dfu_mmc.c                         |  6 +-
> >  drivers/mmc/mmc-uclass.c                      | 10 +--
> >  drivers/mmc/mmc_legacy.c                      |  6 +-
> >  drivers/mmc/mmc_write.c                       |  4 +-
> >  drivers/nvme/nvme.c                           |  2 +-
> >  drivers/scsi/scsi.c                           | 10 +--
> >  drivers/tee/optee/rpmb.c                      |  4 +-
> >  drivers/virtio/virtio_blk.c                   |  4 +-
> >  drivers/xen/pvblock.c                         |  6 +-
> >  env/mmc.c                                     |  4 +-
> >  include/blk.h                                 | 18 +-----
> >  include/mmc.h                                 |  2 +-
> >  lib/efi_driver/efi_block_device.c             |  4 +-
> >  lib/efi_loader/efi_disk.c                     |  4 +-
> >  test/dm/blk.c                                 | 24 +++----
> >  41 files changed, 150 insertions(+), 158 deletions(-)
> >


> > diff --git a/disk/part.c b/disk/part.c
> > index 2bcc6f4f403..75aff7eba5a 100644
> > --- a/disk/part.c
> > +++ b/disk/part.c
> > @@ -121,34 +121,34 @@ void dev_print (struct blk_desc *dev_desc)
> >       }
>
> This function misses out the case of IF_TYPE_EFI_MEDIA and fails to handle it.

OK I will add a patch for it.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
