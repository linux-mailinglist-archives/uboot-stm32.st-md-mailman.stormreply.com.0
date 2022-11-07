Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C4E6203DA
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Nov 2022 00:37:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6217C64110;
	Mon,  7 Nov 2022 23:37:05 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2606C5EC6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Nov 2022 23:37:03 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id o13so6690723ilc.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Nov 2022 15:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bcZ69vFcvXce7woRfo+Od3OSL1f+TOSEl32EcU6WQkM=;
 b=MTFPND9oePWjPS4zQ0veOUEPfhlZq1zyOxOzENdIKHULR97FlURT5agkSQ1op90L41
 cdBBkSsGIsNlh2qU7usy7BJDkCiRiawyJD4B2qv9mc8GA1wbvRS+PstdME4n5d1LZHp0
 CYxMvO2QhnrdmcTUo5gsoAo7paoRMTFq4WNBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bcZ69vFcvXce7woRfo+Od3OSL1f+TOSEl32EcU6WQkM=;
 b=C4NAeOm6pLIqMZws8DnLkWcO3HmddV3kQhA98EaA8inZAMXiKIuDCLwAJUNTlJ0cXc
 mdXLtYdrwrvIcxDw76cH8rWtFg+Gzu+zr4tBXklEeoTj2kKWiykPcf6ql+LpGz2ypfy3
 RpIIIzEyS6+k833PYWAxqQGT0GBtedFb36PEsptfHerOq2O4z1Q2zkZu/Wa4nqpb6lm7
 7U53hbFwHDLAoyAYk2TuHrZ044i8TS+K2gx5aJVBat2DGTu18R+cYO3HoO0WidX/6HHV
 v7XgXtiHc1uMXCRW+dxoIjByULlfvJ21nAk0E5c7upjiv6J2Oc85N6zh/AE17NFvH/0e
 uqOQ==
X-Gm-Message-State: ANoB5pmMsKugVAgPWZ+7/FCUHA6tcjoLFh8X2XSJ1du5w0SaaJX4MVyn
 w5Von78Mz46tvMMTIaxqZDZ7UPh+6lEvhxWq/vSwnw==
X-Google-Smtp-Source: AA0mqf7ZKcAWE9onYptqLyH9bTQIKhEkEGYWwPZOYY55kZiGmUahBPbzGMgzvJNWQWT99qA5HZKCE7HoCF0P821SxOk=
X-Received: by 2002:a92:609:0:b0:302:57b:e951 with SMTP id
 x9-20020a920609000000b00302057be951mr7126722ilg.43.1667864222334; 
 Mon, 07 Nov 2022 15:37:02 -0800 (PST)
MIME-Version: 1.0
References: <20221104224844.467576-1-sjg@chromium.org>
 <24ff452a-e787-1816-0c70-5e3c931bda7e@gmx.de>
In-Reply-To: <24ff452a-e787-1816-0c70-5e3c931bda7e@gmx.de>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 7 Nov 2022 16:35:55 -0700
Message-ID: <CAPnjgZ3-EGARntQYTVsg0=yjkWvpiggq2HMLt=7ghtRx3RxQnw@mail.gmail.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Steven Lawrance <steven.lawrance@softathome.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Stefan Roese <sr@denx.de>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, Tom Rini <trini@konsulko.com>,
 Sean Anderson <sean.anderson@seco.com>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 Andre Przywara <andre.przywara@arm.com>, Andrew Scull <ascull@google.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Artem Lapkin <email2tema@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Andrew Davis <afd@ti.com>,
 John Keeping <john@metanate.com>, Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v2 00/25] bootstd: Add a boot menu
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

Hi Heinrich,

On Mon, 7 Nov 2022 at 12:15, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 11/4/22 23:48, Simon Glass wrote:
> > So far standard boot lacks a boot menu, although it is possible to create
> > a rudimentary one using the existing 'bootmenu' command.
> >
> > Even then, this text-based menu offer only basic functionality and does
> > not take full advantage of the displays which are common on many devices.
> >
> > This series provides a 'bootflow menu' command which allows the user to
> > select from the available bootflows. An attempt is made to show the name
> > of the available operating systems, by reading more information into the
> > bootflow. A logo can be read also, where supported, so that this can be
> > presented to the user when an option is highlighted.
> >
> > Full use is made of TrueType fonts, if enabled. For cases where only a
> > serial console is available, it falls back to a simple text-based menu.
>
> Please, add the link to your design document
>
> https://docs.google.com/document/d/1VQeApnLlH6xKm_OI36AhWkJLUEd9OXEvIJXB8aM2de8/edit?resourcekey=0-DwgHpR2S8vJEJzvvwPb-AQ#heading=h.17wg41voij6q
> is broken.

What happens when you click that? It works for me.

>
> in future version of this series.
>
> The series leaves us with duplicate code in
>
> bootmenu_choice_entry() and eficonfig_choice_entry() as well as
> bootmenu_loop() and bootmenu_autoboot_loop().

Yes OK, but that is the case today and my series actually removes some
duplicated code, so perhaps that could be cleaned up later?

>
> The bootmenu command relies heavily on ANSI sequences but VIDEO_ANSI is
> disabled by default for CONFIG_EFI_LOADER=n which means that the
> bootmenu command will not work anymore.

Does it not work, or does it just work but in a serial fashion? I
don't see ANSI codes as being necessary to show a menu.

>
> >
> > All of this is implementing using a new 'expo' construct, a collection of
>
> Expo is not an English word. Expo is typically used as name of trade
> fairs. Transaction probably is the right word to use here.

That is debatable I think. Transaction is quite generic and appears in
U-Boot >400 times. I think it will just be confusing, like the word
'metadata' used in the FWU stuff.

Expo is short for exposition. My use of it is somewhat archaic
perhaps, but even for the meaning you mention, a public exposition is
not a bad description of what is provided here.

I am not 100% convinced about 'expo' either. Do you have any other ideas?

>
> Files expo.c and scene.c are in boot/ which does not match a generic GUI
> feature. They should be placed in lib/.

Yes I was wondering about that, but thought that boot/ made at least
some sense since the menu will only ever be used for booting...?

I can move it, but I am a little nervous about that, since lib/
normally has utility libraries. Perhaps lib/expo would be better?

Regards,
Simon



>
> Best regards
>
> Heinrich
>
> > scenes (like menu screens) which can be navigated by the user to view
> > information and select options. This is fairly general and should be able
> > to cope with a wider array of use cases, with less hacking of the menu
> > code, such as is currently needed for CMD_BOOTEFI_BOOTMGR.
> >
> > Of course it would be possible to enhance the existing menu rather than
> > creating a new setup. Instead it seems better to make the existing menu
> > use expo, if code space permits. It avoids the event-loop problem and
> > should be more extensible, given its loosely coupled components and use of
> > IDs instead of pointers. Further motivation is provided in the
> > documentation.
> >
> > For now the CLI keypress-decoding code is split out to be used by the new
> > menu. The key codes defined by menu.h are reused also.
> >
> > This is of course just a starting point. Some ideas for future work are
> > included in the documentation.
> >
> > Changes in v2:
> > - Drop the _add suffix on expo creation function
> > - Fix 'touse' typo
> > - Fix pylint warning in mkdir_cond()
> > - Put strings in a separate structure referenced by ID
> > - Rebase to master
> > - Rename vidconsole_get_font() to vidconsole_get_font_size()
> > - Update for new API
> >
> > Simon Glass (25):
> >    sandbox: Enable mmc command and legacy images
> >    cli: Move readline character-processing to a state machine
> >    bootmenu: Add a few comments
> >    menu: Rename KEY_... to BKEY_...
> >    menu: Update bootmenu_autoboot_loop() to return the code
> >    menu: Update bootmenu_loop() to return the code
> >    menu: Use a switch statement
> >    menu: Make use of CLI character processing
> >    image: Add a function to find a script in an image
> >    image: Move common image code to image_board and command
> >    video: Enable VIDEO_ANSI by default only with EFI
> >    video: truetype: Rename the metrics function
> >    video: Fix unchnaged typo
> >    video: Add font functions to the vidconsole API
> >    bootstd: Read the Operating System name for distro/scripts
> >    bootstd: Allow reading a logo for the OS
> >    menu: Factor out menu-keypress decoding
> >    expo: Add basic implementation
> >    expo: Add support for scenes
> >    expo: Add support for scene menus
> >    expo: Add basic tests
> >    bootstd: Support creating a boot menu
> >    bootstd: Add a test for the bootstd menu
> >    bootstd: Support setting a theme for the menu
> >    expo: Add documentation
> >
> >   .../cmd_stm32prog/cmd_stm32prog.c             |   2 +-
> >   arch/sandbox/dts/test.dts                     |  11 +
> >   boot/Kconfig                                  |  12 +
> >   boot/Makefile                                 |   3 +
> >   boot/bootflow.c                               |   1 +
> >   boot/bootflow_internal.h                      |  47 ++
> >   boot/bootflow_menu.c                          | 284 +++++++++
> >   boot/bootmeth-uclass.c                        |  69 ++-
> >   boot/bootmeth_distro.c                        |  36 ++
> >   boot/bootmeth_script.c                        |  40 +-
> >   boot/bootstd-uclass.c                         |   2 +
> >   boot/expo.c                                   | 170 ++++++
> >   boot/image-board.c                            | 133 +++++
> >   boot/scene.c                                  | 414 ++++++++++++++
> >   boot/scene_internal.h                         | 123 ++++
> >   boot/scene_menu.c                             | 390 +++++++++++++
> >   cmd/bootflow.c                                |  44 +-
> >   cmd/bootmenu.c                                |  19 +-
> >   cmd/eficonfig.c                               |  38 +-
> >   cmd/font.c                                    |  11 +-
> >   cmd/source.c                                  | 140 +----
> >   common/Makefile                               |   6 +-
> >   common/cli_getch.c                            | 208 +++++++
> >   common/cli_readline.c                         | 150 +----
> >   common/command.c                              |  19 +
> >   common/menu.c                                 | 157 +++--
> >   configs/sandbox_defconfig                     |   2 +
> >   configs/sandbox_flattree_defconfig            |   2 +
> >   configs/snow_defconfig                        |   4 +
> >   configs/tools-only_defconfig                  |   2 +
> >   doc/develop/expo.rst                          | 188 ++++++
> >   doc/develop/index.rst                         |   1 +
> >   drivers/usb/gadget/f_sdp.c                    |   2 +-
> >   drivers/video/Kconfig                         |   7 +-
> >   drivers/video/console_truetype.c              |  37 +-
> >   drivers/video/vidconsole-uclass.c             |  33 ++
> >   include/bootflow.h                            |  40 ++
> >   include/bootmeth.h                            |  16 +
> >   include/bootstd.h                             |   4 +
> >   include/cli.h                                 |  74 +++
> >   include/command.h                             |  12 +
> >   include/expo.h                                | 521 +++++++++++++++++
> >   include/image.h                               |  17 +-
> >   include/menu.h                                |  77 ++-
> >   include/video.h                               |   2 +-
> >   include/video_console.h                       |  75 ++-
> >   test/boot/Makefile                            |   2 +
> >   test/boot/bootflow.c                          | 130 +++++
> >   test/boot/expo.c                              | 539 ++++++++++++++++++
> >   test/cmd/font.c                               |   6 +-
> >   test/py/tests/bootstd/armbian.bmp.xz          | Bin 0 -> 1384 bytes
> >   test/py/tests/bootstd/mmc4.img.xz             | Bin 0 -> 7072 bytes
> >   test/py/tests/test_android/test_avb.py        |   2 +
> >   test/py/tests/test_ut.py                      | 218 ++++++-
> >   54 files changed, 4075 insertions(+), 467 deletions(-)
> >   create mode 100644 boot/bootflow_internal.h
> >   create mode 100644 boot/bootflow_menu.c
> >   create mode 100644 boot/expo.c
> >   create mode 100644 boot/scene.c
> >   create mode 100644 boot/scene_internal.h
> >   create mode 100644 boot/scene_menu.c
> >   create mode 100644 common/cli_getch.c
> >   create mode 100644 doc/develop/expo.rst
> >   create mode 100644 include/expo.h
> >   create mode 100644 test/boot/expo.c
> >   create mode 100644 test/py/tests/bootstd/armbian.bmp.xz
> >   create mode 100644 test/py/tests/bootstd/mmc4.img.xz
> >
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
