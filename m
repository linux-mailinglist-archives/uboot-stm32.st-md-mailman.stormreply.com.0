Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A8EE0B36
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2019 20:10:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36E7BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2019 18:10:20 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BC2CC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 18:10:17 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id 1so10247420iou.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 11:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+twEtW0LwAhQp+QaFF7JoTnBkHBy0gBcAwHC+NNR5dw=;
 b=k4phBnPwrz9WsLczj63gbSBlM1kausXywYhOKnOHAoVI0BBgyT8AgvvNfRyczbJISI
 jaXT4YSOTuB+2OlEW14Cjh/jngmtLYcTDhly1YMCFMgvI3DSwNGg9JWOqYM4i5UVxQKe
 Uff17qu8aOXR8GqqPoFXUnW4NQT4bxRTn0Ic8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+twEtW0LwAhQp+QaFF7JoTnBkHBy0gBcAwHC+NNR5dw=;
 b=YygiNYDdCdIGHUXafWkVgiPSU6P4wRZHA7T6UxoJV+LrAhjcj77rqXh0BIrS6IG5tj
 L1Lss/p/vuv+RG9R05B9IAQbznYCPAu7Uol+FRAwQac7RUxS2HJVt7Ct5SOJMhBLfHrU
 C9I2I6TPVTtkB9CaHeMZD5KCIor2q9lZQIoFrBqgAfIs28wKo8unj957R0GV0jhVCS0a
 49nB2PZDYrdwBKfg+e5YCYApJeJsRxiyE7gejB3qSNaYtjEop29IZY/irX0CZeD0x7id
 DEjUo/GYw2lUSv1TCXQXF9QvJiLPPEfoMssiz04z4jIoT5QbovEJ0xrx+IkfhliF/9/3
 k6Xw==
X-Gm-Message-State: APjAAAXlsulW2IVBn3BRoKc3lEsG8WN98QpZFe03twQvDrnWJq6kJtOr
 IVfJUxix2+Hnu3An5VNDkuahINRW+RW2yhaH3rboMQ==
X-Google-Smtp-Source: APXvYqy0YDbIgIykfDzLVED2Bh5d7n2DGCYA7n+fsT/b6do7J6Sau6AY96ynhzMLXLcXeNhHdr+hWnPhhBK9Fy0+SlQ=
X-Received: by 2002:a5e:d917:: with SMTP id n23mr5201592iop.28.1571767816487; 
 Tue, 22 Oct 2019 11:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190913224242.21054-1-frieder.schrempf@kontron.de>
 <20190913224242.21054-2-frieder.schrempf@kontron.de>
 <CAMty3ZCZgL4wrZpwXcPLZAaGzG2uMHs2zftoPkjSV8b2geNw8g@mail.gmail.com>
 <7dc4a580-c49f-7371-56f2-a2d56198a060@kontron.de>
 <fc9cb551-87ab-a8ce-c719-c7fc498c13da@kontron.de>
In-Reply-To: <fc9cb551-87ab-a8ce-c719-c7fc498c13da@kontron.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 22 Oct 2019 23:40:05 +0530
Message-ID: <CAMty3ZCiKYYozP60mVVDNtih6WXVC7tFv6Pp75gRDMQD+jqGCA@mail.gmail.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, "lukma@denx.de" <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 2/3] stm32mp1: configs: Add
	CONFIG_SPL_SPI_FLASH_MTD
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

On Tue, Oct 22, 2019 at 6:23 PM Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:
>
> Hi Jagan,
>
> On 17.10.19 08:42, Frieder Schrempf wrote:
> > Hi Jagan,
> >
> > On 16.10.19 18:34, Jagan Teki wrote:
> >> On Sat, Sep 14, 2019 at 4:18 AM Schrempf Frieder
> >> <frieder.schrempf@kontron.de> wrote:
> >>>
> >>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>>
> >>> As SPI_FLASH_MTD is used in SPL and U-Boot proper, we enable both,
> >>> now that a separate option for SPL was introduced.
> >>>
> >>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>> ---
> >>>   configs/stm32mp15_basic_defconfig | 3 ++-
> >>>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/configs/stm32mp15_basic_defconfig
> >>> b/configs/stm32mp15_basic_defconfig
> >>> index 09785b5dc1..390319657f 100644
> >>> --- a/configs/stm32mp15_basic_defconfig
> >>> +++ b/configs/stm32mp15_basic_defconfig
> >>> @@ -7,10 +7,10 @@ CONFIG_TARGET_STM32MP1=y
> >>>   CONFIG_SPL_SPI_FLASH_SUPPORT=y
> >>>   CONFIG_SPL_SPI_SUPPORT=y
> >>>   # CONFIG_ARMV7_VIRT is not set
> >>> +CONFIG_SPL_TEXT_BASE=0x2FFC2500
> >>>   CONFIG_DISTRO_DEFAULTS=y
> >>>   CONFIG_FIT=y
> >>>   CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> >>> -CONFIG_SPL_TEXT_BASE=0x2FFC2500
> >>
> >> Unrelated change wrt to commit message?
> >
> > Yes, this is unrelated, but that's what 'menuconfig' and 'savedefconfig'
> > gave me as output. So I would think it's ok. If you don't think so, feel
> > free to remove this change or let me know if I should remove it.
>
> In patchwork all three patches of this series are marked with "Changes
> Requested". Can you please let me know what needs to be fixed?

Thought you might drop that unrelated change and send next version,
but anyway I have changed and

Applied to u-boot-spi/master
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
