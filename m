Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 640B25EF2EB
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Sep 2022 12:01:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28063C640FF;
	Thu, 29 Sep 2022 10:01:16 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D4F4C640FE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 10:01:14 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id j188so1114457oih.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 03:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=wfL8EkXN2Obld+a1ZchtD6jaTDC3WwRJ+IoEhhkIfmg=;
 b=bZOb1rZyvuCUXY6+0GPr77XylSP3cr+Rqoe2k7x9/UA9fEcwgJRdNaxRZESYe1MgU+
 2hiZvhh2nL8reCdOGHibTseFXa04+xFL7cRVkxv1a1H1NI//yy4PENV3BY69GnU1LmOq
 bjUqIB+4ch7iDqz7dosFrkM19PrKXE6IysHC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=wfL8EkXN2Obld+a1ZchtD6jaTDC3WwRJ+IoEhhkIfmg=;
 b=m0TsqV+sh2BZDhTsoUPhA6ajZ6VIjmMaoi6vxyIa1Hd/MYQarmZzFoLNyAewsjGinf
 ZGDmdZd8DZYCpXYWWxDnJcFdx/P6MbAkvXCXwzNV7dImunzWLVTHOgiazrl+UZdmVdJt
 HFH29Yn2/TBoj2ogS3ZNoloi+mBaWsXPk8PYgBdCX1MsshE53VcYQDEeXQ2+gaZJtTpe
 4h/bZI2xU4YoSgzYaZ4R6Is57H9f7QMVHNjyQ5pVuR6pPVcjBkZAd8BvKHeEWHuzTS3v
 SGNQyYpUC2gnYOdQQmmjFk6rDMMHo8vYkWd6RA4Em0EUQ4Qcq0FwJuNNzwjSHHO27N5/
 epDw==
X-Gm-Message-State: ACrzQf1BQusVOcu+O1XrZzkIA2g6UelVS6Tot/dtzddmLOCOSqq0acgb
 5LFvGLn9npXaiw0AoAwv7bdA1RS4vA4ZGVBZJjmY+Q==
X-Google-Smtp-Source: AMsMyM4EyYWUzy6KAu12Xgyx0vQNBkP0r0MMwze71HTwka+ax0SlH5no032m+tFePKWFijdKuoQFbHNY/rPuzDLHwbI=
X-Received: by 2002:a05:6808:d53:b0:351:1cab:9c29 with SMTP id
 w19-20020a0568080d5300b003511cab9c29mr1151333oik.64.1664445672921; Thu, 29
 Sep 2022 03:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664093812.git.msuchanek@suse.de>
 <cover.1664314042.git.msuchanek@suse.de>
In-Reply-To: <cover.1664314042.git.msuchanek@suse.de>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Sep 2022 04:00:55 -0600
Message-ID: <CAPnjgZ22op9HKiz6FX_GZcwHoQHWXy3Cnjw9rKoJAuxeN0kFRw@mail.gmail.com>
To: Michal Suchanek <msuchanek@suse.de>
Cc: Peng Fan <peng.fan@nxp.com>, Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>, Eddie James <eajames@linux.ibm.com>,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 "moderated list:ARM STM STM32MP" <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Vyacheslav Bocharov <adeep@lexina.in>,
 Samuel Holland <samuel@sholland.org>,
 Samuel Dionne-Riel <samuel@dionne-riel.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Diego Rondini <diego.rondini@kynetics.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ramon Fried <rfried.dev@gmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 Jason Liu <jason.hui.liu@nxp.com>, Heiko Schocher <hs@denx.de>,
 Anatolij Gustschin <agust@denx.de>, Ovidiu Panait <ovpanait@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Mark Kettenis <kettenis@openbsd.org>,
 Matthias Brugger <mbrugger@suse.com>, Andrew Scull <ascull@google.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 =?UTF-8?B?VmlrdG9yIEvFmWl2w6Fr?= <viktor.krivak@gmail.com>,
 Tomas Hlavacek <tmshlvck@gmail.com>, Michal Simek <michal.simek@amd.com>,
 =?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Joe Hershberger <joe.hershberger@ni.com>, Alexander Dahl <ada@thorsis.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sean Anderson <sean.anderson@seco.com>, Tom Warren <twarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v5 00/15] Do not stop uclass iteration on
	error
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

Hi Michal,

On Tue, 27 Sept 2022 at 15:38, Michal Suchanek <msuchanek@suse.de> wrote:
>
> Hello,
>
> this patch series fixes the simple uclass iterators to be usable for
> iterating uclasses even if some devices fail to probe.
>
> Before this series when a probe error happens an error is returned
> without any device pointer, and iteration cannot continue to devices
> that happen to be after the failing device in the uclass list.
>
> This is rarely expected, nor clearly documented, and for the most part
> not useful in any way.
>
> All but the last patch are new in v4 removing problematic iterator use.

Thank you for taking this on. It has been bugging me for about 6
years. It is not an easy task and you have dug in and carefully looked
at each situation and how to fix it.

Regards,
Simon


>
> v5:
>
> Split off patches that can be applied independently
>
> Fix uclass_foreach_dev_probe, pci_sriov_init, and sysinfo_get to work
> after the uclass_first_device_err change.
>
> Document that uclass_first_device_err and uclass_first_device_check can
> return non-activated device on error.
>
> Consolidate multiple similar cleanups into one patch.
>
> Thanks
>
> Michal
>
> Michal Suchanek (15):
>   dm: core: Fix uclass_probe_all to really probe all devices
>   dm: treewide: Do not opencode uclass_probe_all()
>   dm: pci: Fix device PCI iteration
>   bootstd: Fix listing boot devices
>   usb: ether: Fix error handling in usb_ether_init
>   stdio: Fix class iteration in stdio_add_devices()
>   video: ipuv3: Fix error handling when getting the display
>   w1: Fix bus counting in w1_get_bus
>   cmd: List all uclass devices regardless of probe error
>   dm: treewide: Use uclass_first_device_err when accessing one device
>   dm: treewide: Use uclass_next_device_err when accessing second device
>   dm: blk: Do not use uclass_next_device_err
>   dm: core: Switch uclass_*_device_err to use uclass_*_device_check
>   dm: treewide: Do not use the return value of simple uclass iterator
>   dm: core: Do not stop uclass iteration on error
>
>  arch/arm/mach-k3/j721s2_init.c            |  2 +-
>  arch/arm/mach-omap2/am33xx/board.c        |  4 +-
>  arch/x86/cpu/broadwell/cpu.c              |  4 +-
>  arch/x86/cpu/intel_common/cpu.c           |  4 +-
>  arch/x86/lib/pinctrl_ich6.c               |  4 +-
>  board/atmel/common/mac_eeprom.c           |  2 +-
>  board/intel/cougarcanyon2/cougarcanyon2.c |  4 +-
>  boot/bootdev-uclass.c                     |  7 +--
>  cmd/adc.c                                 | 22 ++++-----
>  cmd/demo.c                                | 16 ++++---
>  cmd/gpio.c                                | 15 ++++--
>  cmd/pmic.c                                | 15 +++---
>  cmd/regulator.c                           | 13 +++---
>  cmd/virtio.c                              |  9 ++--
>  common/stdio.c                            | 33 ++++++-------
>  drivers/block/blk-uclass.c                | 16 +++----
>  drivers/core/uclass.c                     | 56 ++++++++++++-----------
>  drivers/cpu/cpu-uclass.c                  | 20 ++------
>  drivers/dma/dma-uclass.c                  |  7 ++-
>  drivers/gpio/gpio-uclass.c                | 14 +++---
>  drivers/mmc/omap_hsmmc.c                  |  2 +-
>  drivers/pci/pci-uclass.c                  | 26 ++++-------
>  drivers/serial/serial-uclass.c            |  2 +-
>  drivers/serial/serial_bcm283x_mu.c        |  2 +-
>  drivers/serial/serial_bcm283x_pl011.c     |  2 +-
>  drivers/sysinfo/sysinfo-uclass.c          | 10 +++-
>  drivers/sysreset/sysreset_ast.c           |  2 +-
>  drivers/usb/gadget/ether.c                | 11 ++---
>  drivers/video/exynos/exynos_fb.c          | 24 ++++------
>  drivers/video/imx/mxc_ipuv3_fb.c          |  9 ++--
>  drivers/video/mali_dp.c                   |  2 +-
>  drivers/video/stm32/stm32_dsi.c           |  6 ++-
>  drivers/video/tegra124/dp.c               |  7 +--
>  drivers/virtio/virtio-uclass.c            | 15 +-----
>  drivers/w1/w1-uclass.c                    | 29 ++++++------
>  include/dm/uclass.h                       | 49 ++++++++++----------
>  lib/acpi/acpi_table.c                     |  2 +-
>  lib/efi_loader/efi_gop.c                  |  2 +-
>  net/eth-uclass.c                          |  6 ++-
>  test/boot/bootmeth.c                      |  2 +-
>  test/dm/acpi.c                            | 14 +++---
>  test/dm/core.c                            | 27 +++--------
>  test/dm/devres.c                          |  4 +-
>  test/dm/i2c.c                             |  8 ++--
>  test/dm/test-fdt.c                        | 27 ++++++++---
>  test/dm/virtio_device.c                   |  8 ++--
>  test/dm/virtio_rng.c                      |  2 +-
>  test/fuzz/cmd_fuzz.c                      |  2 +-
>  test/fuzz/virtio.c                        |  2 +-
>  test/test-main.c                          | 11 +----
>  50 files changed, 269 insertions(+), 313 deletions(-)
>
> --
> 2.37.3
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
