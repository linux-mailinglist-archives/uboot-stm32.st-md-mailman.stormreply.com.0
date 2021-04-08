Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B75B359044
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 01:17:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA4C5C56639;
	Thu,  8 Apr 2021 23:17:24 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9224C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 23:17:22 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id r193so4006188ior.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Apr 2021 16:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qdNYoSnMrzzXBGBUkgmKMkJhatX/viXkwidu0IulMvw=;
 b=RLl9pd1Iac+vHPvEJ5kyzSngUfc2a0xyyMQBcpFx6sy5Hxr+nTKHewgK1g70o0eZss
 4kI49XuVimtAB/q9uLWXk0myVDXeiIZYG/lC1cinlI5+B12QOGa509tB3QeXkc8Pn+Jh
 xXyQlRRguQwMGlg83zv63wfDl0I7jWppqm2P/jqiqlsTklCBU+JQ8Qpu8VHMk2TFwVPt
 7NDo+FU1n1q02FbOuFFbeBE/DLV7N4EFpWFhuDDRXyLZL88blL+CfvXTVYBegLHU0nlP
 gwwfKRY01vo+FGUwyUYyI698wfqEF0NEMrDDS6tGUaw5Jn6ny7VrXqOC2jwzwMKzLgIe
 OUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qdNYoSnMrzzXBGBUkgmKMkJhatX/viXkwidu0IulMvw=;
 b=UVgGdYZJhNeCvPlw1of5ltxTT7OoI4bmHKnJwRE6k7pMg23DN6SOGNTAyE+teOT5Kq
 nZnYd3kVqYBgut2WYREHNxjGTPy0QqWP0m9sokz9fX+5gY2mQz3EQL5itAGnDTRLjhB6
 14mRn08XviMd2GD6/SvhIxmeHjEFGsUrMYXx0CdIAfiFltKJn2eUOL5wMe6LULwiafik
 2Ylc87RRT3yIcFaV2u8/DlsApLdL5LwGsA6+bjhxc+P5UvnnKeq71cTRc14dXgaq+c1n
 g+oPTycieCLM+rH00MXfdZj2X3ovKQH3Clr0tl4u2ao9UdBnl44emkA2K6bjGCWJF5Sw
 TlRQ==
X-Gm-Message-State: AOAM530o/KJIp1Ej5HmUSpOfMVT+Xa/2o4cAEPg8/1COpoPkfPcNtsSf
 3WzRljFVzNMUVchbacB3pZSW5DlyY4KBU1OGa+U=
X-Google-Smtp-Source: ABdhPJzjnTaZIam0LDE3BYSoIQmkeoOUN6K4oMNEN5w/RawiVK6BZLJx9EuJSNt3ow7/8T46DogyKgP3ypdyXZObWbE=
X-Received: by 2002:a6b:4f09:: with SMTP id d9mr8851972iob.60.1617923841546;
 Thu, 08 Apr 2021 16:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
 <1617352961-20550-8-git-send-email-dillon.minfei@gmail.com>
 <1d4f4067-e38c-fb67-8384-6825c1ffb106@foss.st.com>
In-Reply-To: <1d4f4067-e38c-fb67-8384-6825c1ffb106@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 9 Apr 2021 07:16:45 +0800
Message-ID: <CAL9mu0K61mL1N0_vjhk1eUQV5dMQKOV63pTjdNxE-YVR5uxgDw@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: marex@denx.de, heiko.stuebner@theobroma-systems.com,
 josip.kelecic@sartura.hr, narmstrong@baylibre.com, andre.przywara@arm.com,
 sjg@chromium.org, ioana.ciornei@nxp.com, kever.yang@rock-chips.com,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>, festevam@gmail.com,
 priyanka.jain@nxp.com, patrick.delaunay@foss.st.com, hs@denx.de,
 aford173@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v4 7/7] board: Add rt-thread art-pi board
	support
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

Hi Patrice,

Thanks for the reminder.

On Thu, Apr 8, 2021 at 9:53 PM Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
> Hi Dillon
>
> 2 minor remarks below, Once fixed, you can add my
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> Thanks
> Patrice
>
> On 4/2/21 10:42 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > All these files are add for support rt-thread art-pi board
> > - add board/st/stm32h750-art-pi, defconfig, header support for u-boot
> >
> > for more information about art-pi, please goto:
> > https://art-pi.gitee.io/website/
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> > v4: update CONFIG_BOOTARGS, remove rdinit=/linuxrc, to use kernel's devtmpfs
> >
> >  arch/arm/mach-stm32/stm32h7/Kconfig          |  4 ++
> >  board/st/stm32h750-art-pi/Kconfig            | 19 +++++++++
> >  board/st/stm32h750-art-pi/MAINTAINERS        |  7 ++++
> >  board/st/stm32h750-art-pi/Makefile           |  6 +++
> >  board/st/stm32h750-art-pi/stm32h750-art-pi.c | 58 ++++++++++++++++++++++++++++
> >  configs/stm32h750-art-pi_defconfig           | 51 ++++++++++++++++++++++++
> >  include/configs/stm32h750-art-pi.h           | 48 +++++++++++++++++++++++
> >  7 files changed, 193 insertions(+)
> >  create mode 100644 board/st/stm32h750-art-pi/Kconfig
> >  create mode 100644 board/st/stm32h750-art-pi/MAINTAINERS
> >  create mode 100644 board/st/stm32h750-art-pi/Makefile
> >  create mode 100644 board/st/stm32h750-art-pi/stm32h750-art-pi.c
> >  create mode 100644 configs/stm32h750-art-pi_defconfig
> >  create mode 100644 include/configs/stm32h750-art-pi.h
> >
> > diff --git a/arch/arm/mach-stm32/stm32h7/Kconfig b/arch/arm/mach-stm32/stm32h7/Kconfig
> > index 55e6217..70233a4 100644
> > --- a/arch/arm/mach-stm32/stm32h7/Kconfig
> > +++ b/arch/arm/mach-stm32/stm32h7/Kconfig
> > @@ -6,7 +6,11 @@ config TARGET_STM32H743_DISCO
> >  config TARGET_STM32H743_EVAL
> >       bool "STM32H743 Evaluation board"
> >
> > +config TARGET_STM32H750_ART_PI
> > +     bool "STM32H750 ART Pi board"
> > +
> >  source "board/st/stm32h743-eval/Kconfig"
> >  source "board/st/stm32h743-disco/Kconfig"
> > +source "board/st/stm32h750-art-pi/Kconfig"
> >
> >  endif
> > diff --git a/board/st/stm32h750-art-pi/Kconfig b/board/st/stm32h750-art-pi/Kconfig
> > new file mode 100644
> > index 0000000..c31b984
> > --- /dev/null
> > +++ b/board/st/stm32h750-art-pi/Kconfig
> > @@ -0,0 +1,19 @@
> > +if TARGET_STM32H750_ART_PI
> > +
> > +config SYS_BOARD
> > +     string
> > +     default "stm32h750-art-pi"
> > +
> > +config SYS_VENDOR
> > +     string
> > +     default "st"
> > +
> > +config SYS_SOC
> > +     string
> > +     default "stm32h7"
> > +
> > +config SYS_CONFIG_NAME
> > +     string
> > +     default "stm32h750-art-pi"
> > +
> > +endif
> > diff --git a/board/st/stm32h750-art-pi/MAINTAINERS b/board/st/stm32h750-art-pi/MAINTAINERS
> > new file mode 100644
> > index 0000000..9578833
> > --- /dev/null
> > +++ b/board/st/stm32h750-art-pi/MAINTAINERS
> > @@ -0,0 +1,7 @@
> > +STM32H750 ART PI BOARD
> > +M:   Dillon Min <dillon.minfei@gmail.com>
> > +S:   Maintained
> > +F:   board/st/stm32h750-art-pi
> > +F:   include/configs/stm32h750-art-pi.h
> > +F:   configs/stm32h750-art-pi_defconfig
> > +F:   arch/arm/dts/stm32h7*
> > diff --git a/board/st/stm32h750-art-pi/Makefile b/board/st/stm32h750-art-pi/Makefile
> > new file mode 100644
> > index 0000000..a06de87
> > --- /dev/null
> > +++ b/board/st/stm32h750-art-pi/Makefile
> > @@ -0,0 +1,6 @@
> > +# SPDX-License-Identifier: GPL-2.0+
> > +#
> > +# Copyright (C) 2021, RT-Thread - All Rights Reserved
> > +# Author(s): Dillon Min, <dillon.minfei@gmail.com> for RT-Thread.
> > +
> > +obj-y        := stm32h750-art-pi.o
> > diff --git a/board/st/stm32h750-art-pi/stm32h750-art-pi.c b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> > new file mode 100644
> > index 0000000..c374dd3
> > --- /dev/null
> > +++ b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> > @@ -0,0 +1,58 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2021, STMicroelectronics - All Rights Reserved
> > + * Author(s): Dillon Min <dillon.minfei@gmail.com> for STMicroelectronics.
>
> As you are not member of STMicroelectronics company, remove the "for STMicroelectronics."
Okay, I will fix this. thanks
>
> > + */
> > +
> > +#include <common.h>
> > +#include <dm.h>
> > +#include <init.h>
> > +#include <log.h>
> > +#include <asm/global_data.h>
> > +
> > +DECLARE_GLOBAL_DATA_PTR;
> > +
> > +int dram_init(void)
> > +{
> > +     struct udevice *dev;
> > +     int ret;
> > +
> > +     ret = uclass_get_device(UCLASS_RAM, 0, &dev);
> > +     if (ret) {
> > +             debug("DRAM init failed: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     if (fdtdec_setup_mem_size_base() != 0)
> > +             ret = -EINVAL;
> > +
> > +     return ret;
> > +}
> > +
> > +int dram_init_banksize(void)
> > +{
> > +     fdtdec_setup_memory_banksize();
> > +
> > +     return 0;
> > +}
> > +
> > +int board_early_init_f(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +u32 get_board_rev(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +int board_late_init(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +int board_init(void)
> > +{
> > +     gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
> > +     return 0;
> > +}
> > diff --git a/configs/stm32h750-art-pi_defconfig b/configs/stm32h750-art-pi_defconfig
> > new file mode 100644
> > index 0000000..447af5b
> > --- /dev/null
> > +++ b/configs/stm32h750-art-pi_defconfig
> > @@ -0,0 +1,51 @@
> > +CONFIG_ARM=y
> > +CONFIG_ARCH_STM32=y
> > +CONFIG_SYS_TEXT_BASE=0x90000000
> > +CONFIG_SYS_MALLOC_F_LEN=0xF00
> > +CONFIG_NR_DRAM_BANKS=1
> > +CONFIG_ENV_SIZE=0x2000
> > +CONFIG_STM32H7=y
> > +CONFIG_TARGET_STM32H750_ART_PI=y
> > +CONFIG_DEFAULT_DEVICE_TREE="stm32h750i-art-pi"
> > +CONFIG_DISTRO_DEFAULTS=y
> > +CONFIG_BOOTDELAY=3
> > +CONFIG_AUTOBOOT_KEYED=y
> > +CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
> > +CONFIG_AUTOBOOT_STOP_STR=" "
> > +# CONFIG_USE_BOOTCOMMAND is not set
> > +CONFIG_DEFAULT_FDT_FILE="stm32h750i-art-pi"
> > +# CONFIG_DISPLAY_CPUINFO is not set
> > +CONFIG_BOARD_EARLY_INIT_F=y
> > +CONFIG_BOARD_LATE_INIT=y
> > +CONFIG_SYS_PROMPT="U-Boot > "
> > +CONFIG_CMD_GPT=y
> > +CONFIG_CMD_MMC=y
> > +# CONFIG_CMD_SETEXPR is not set
> > +CONFIG_CMD_CACHE=y
> > +CONFIG_CMD_TIMER=y
> > +CONFIG_CMD_EXT4_WRITE=y
> > +# CONFIG_ISO_PARTITION is not set
> > +CONFIG_OF_CONTROL=y
> > +CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> > +# CONFIG_NET is not set
> > +CONFIG_DM_MMC=y
> > +CONFIG_STM32_SDMMC2=y
> > +# CONFIG_PINCTRL_FULL is not set
> > +CONFIG_OF_LIBFDT_OVERLAY=y
> > +CONFIG_BAUDRATE=2000000
> > +CONFIG_USE_BOOTARGS=y
> > +CONFIG_BOOTARGS="console=ttySTM0,2000000 root=/dev/ram loglevel=8"
> > +CONFIG_BOOTCOMMAND="bootm 90080000"
> > +CONFIG_REQUIRE_SERIAL_CONSOLE=y
> > +CONFIG_SERIAL_PRESENT=y
> > +CONFIG_DM_SERIAL=y
> > +CONFIG_STM32_SERIAL=y
> > +CONFIG_FIT=y
> > +CONFIG_FIT_EXTERNAL_OFFSET=0x0
> > +CONFIG_FIT_ENABLE_SHA256_SUPPORT=y
> > +CONFIG_FIT_FULL_CHECK=y
> > +CONFIG_FIT_PRINT=y
> > +CONFIG_LEGACY_IMAGE_FORMAT=y
> > +CONFIG_SUPPORT_RAW_INITRD=y
> > +CONFIG_USE_BOOTCOMMAND=y
> > +CONFIG_DM_DMA=y
> > diff --git a/include/configs/stm32h750-art-pi.h b/include/configs/stm32h750-art-pi.h
> > new file mode 100644
> > index 0000000..43dc79a
> > --- /dev/null
> > +++ b/include/configs/stm32h750-art-pi.h
> > @@ -0,0 +1,48 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright (C) 2021, STMicroelectronics - All Rights Reserved
> > + * Author(s): Dillon Min <dillon.minfei@gmail.com> for STMicroelectronics.
>
> As you are not member of STMicroelectronics company, remove the "for STMicroelectronics."
Okay, I will fix this. thanks
>
> > + */
> > +
> > +#ifndef __CONFIG_H
> > +#define __CONFIG_H
> > +
> > +#include <config.h>
> > +#include <linux/sizes.h>
> > +
> > +/* For booting Linux, use the first 16MB of memory */
> > +#define CONFIG_SYS_BOOTMAPSZ         (SZ_16M + SZ_8M)
> > +
> > +#define CONFIG_SYS_FLASH_BASE                0x90000000
> > +#define CONFIG_SYS_INIT_SP_ADDR              0x24040000
> > +
> > +/*
> > + * Configuration of the external SDRAM memory
> > + */
> > +#define CONFIG_SYS_LOAD_ADDR         0xC1800000
> > +#define CONFIG_LOADADDR                      0xC1800000
> > +
> > +#define CONFIG_SYS_HZ_CLOCK          1000000
> > +
> > +#define CONFIG_CMDLINE_TAG
> > +#define CONFIG_SETUP_MEMORY_TAGS
> > +#define CONFIG_INITRD_TAG
> > +#define CONFIG_REVISION_TAG
> > +
> > +#define CONFIG_SYS_MAXARGS           16
> > +#define CONFIG_SYS_MALLOC_LEN                (1 * 1024 * 1024)
> > +
> > +#define BOOT_TARGET_DEVICES(func) \
> > +     func(MMC, mmc, 0)
> > +
> > +#include <config_distro_bootcmd.h>
> > +#define CONFIG_EXTRA_ENV_SETTINGS                            \
> > +                     "kernel_addr_r=0xC0008000\0"            \
> > +                     "fdtfile=stm32h750i-art-pi.dtb\0"       \
> > +                     "fdt_addr_r=0xC0408000\0"               \
> > +                     "scriptaddr=0xC0418000\0"               \
> > +                     "pxefile_addr_r=0xC0428000\0" \
> > +                     "ramdisk_addr_r=0xC0438000\0"           \
> > +                     BOOTENV
> > +
> > +#endif /* __CONFIG_H */
> >
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
