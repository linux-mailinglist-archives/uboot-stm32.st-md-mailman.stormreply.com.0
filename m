Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB4261A4C8
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Nov 2022 23:48:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC990C65043;
	Fri,  4 Nov 2022 22:48:57 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FEEAC65040
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 22:48:56 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id p141so4928941iod.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Nov 2022 15:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lUr/vDZ/YX9e73A0iuqEcLtoIiSuQUGCZhMZ/D8nS5E=;
 b=k0jdN3PcYh9EViGDpybdqOxyH+3JElLarHy4ajPSyb+NjiaMN6luduhNQPvmcA1Xom
 Xs0I/XGUrT2k62erRpDSU+LOVNAqqnxEH66P941G6/xKPXcip27t5KjmqC+Y6IHHytB9
 pGZgL1RLTZEUKJosoCYh4TYq9OfQ+PhxBQP9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lUr/vDZ/YX9e73A0iuqEcLtoIiSuQUGCZhMZ/D8nS5E=;
 b=no55Y8DQydVT1a7Vyrx5ohOjkUctQQQ4ybrRHci+e/m2to2ycwSuPnU5fmYZpnNrRB
 oCazQRpcQGmXPzc0ch1RIWLFGToXe5W0Ye0NDygav0hEFq5xv5OKEVNZ+1A4WU6pO3bj
 KpSOnGk0WzLmB8MJSAQnfCFGx4IEyTj3IgNeBf1jvcs+G+/9DKa9lNqOr4iU8yS6SUjV
 YDErbR0ON7FwAI+Y2OJ7Qsdtvgaa6aYgF78r3mp+GA3y8ZPslS2px2YCm6cjd1Xx5w7N
 wv2I2zTPOIMb1FxFVmsT+WBib9BI1Gi4+H4SBnqV5EtlhHLYnhfnIVRspKDndk1/07sL
 dwhg==
X-Gm-Message-State: ACrzQf2XImXcC/BX5+57P/y+qj1XwYzKiN4Wr8OJVKrV1Dg8QLl+UhLP
 3pT8zz89pJfX+HR/rvu7yZL1Ww==
X-Google-Smtp-Source: AMsMyM5yGn6RkypOej1shkMDTwYnhklPkGP85V6pBFju6xOgbCSBKpSDAf7QrF5XACsBRZsum1tXzQ==
X-Received: by 2002:a02:a49:0:b0:375:496b:b233 with SMTP id
 70-20020a020a49000000b00375496bb233mr21083016jaw.78.1667602135292; 
 Fri, 04 Nov 2022 15:48:55 -0700 (PDT)
Received: from sjg1.roam.corp.google.com
 (c-67-190-102-125.hsd1.co.comcast.net. [67.190.102.125])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a05663800d800b003734c4d01d2sm95189jao.61.2022.11.04.15.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 15:48:54 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Fri,  4 Nov 2022 16:48:18 -0600
Message-Id: <20221104224844.467576-1-sjg@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
MIME-Version: 1.0
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Steven Lawrance <steven.lawrance@softathome.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Stefan Roese <sr@denx.de>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 Andre Przywara <andre.przywara@arm.com>, Andrew Scull <ascull@google.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Andrew Davis <afd@ti.com>, John Keeping <john@metanate.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Artem Lapkin <email2tema@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 00/25] bootstd: Add a boot menu
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

So far standard boot lacks a boot menu, although it is possible to create
a rudimentary one using the existing 'bootmenu' command.

Even then, this text-based menu offer only basic functionality and does
not take full advantage of the displays which are common on many devices.

This series provides a 'bootflow menu' command which allows the user to
select from the available bootflows. An attempt is made to show the name
of the available operating systems, by reading more information into the
bootflow. A logo can be read also, where supported, so that this can be
presented to the user when an option is highlighted.

Full use is made of TrueType fonts, if enabled. For cases where only a
serial console is available, it falls back to a simple text-based menu.

All of this is implementing using a new 'expo' construct, a collection of
scenes (like menu screens) which can be navigated by the user to view
information and select options. This is fairly general and should be able
to cope with a wider array of use cases, with less hacking of the menu
code, such as is currently needed for CMD_BOOTEFI_BOOTMGR.

Of course it would be possible to enhance the existing menu rather than
creating a new setup. Instead it seems better to make the existing menu
use expo, if code space permits. It avoids the event-loop problem and
should be more extensible, given its loosely coupled components and use of
IDs instead of pointers. Further motivation is provided in the
documentation.

For now the CLI keypress-decoding code is split out to be used by the new
menu. The key codes defined by menu.h are reused also.

This is of course just a starting point. Some ideas for future work are
included in the documentation.

Changes in v2:
- Drop the _add suffix on expo creation function
- Fix 'touse' typo
- Fix pylint warning in mkdir_cond()
- Put strings in a separate structure referenced by ID
- Rebase to master
- Rename vidconsole_get_font() to vidconsole_get_font_size()
- Update for new API

Simon Glass (25):
  sandbox: Enable mmc command and legacy images
  cli: Move readline character-processing to a state machine
  bootmenu: Add a few comments
  menu: Rename KEY_... to BKEY_...
  menu: Update bootmenu_autoboot_loop() to return the code
  menu: Update bootmenu_loop() to return the code
  menu: Use a switch statement
  menu: Make use of CLI character processing
  image: Add a function to find a script in an image
  image: Move common image code to image_board and command
  video: Enable VIDEO_ANSI by default only with EFI
  video: truetype: Rename the metrics function
  video: Fix unchnaged typo
  video: Add font functions to the vidconsole API
  bootstd: Read the Operating System name for distro/scripts
  bootstd: Allow reading a logo for the OS
  menu: Factor out menu-keypress decoding
  expo: Add basic implementation
  expo: Add support for scenes
  expo: Add support for scene menus
  expo: Add basic tests
  bootstd: Support creating a boot menu
  bootstd: Add a test for the bootstd menu
  bootstd: Support setting a theme for the menu
  expo: Add documentation

 .../cmd_stm32prog/cmd_stm32prog.c             |   2 +-
 arch/sandbox/dts/test.dts                     |  11 +
 boot/Kconfig                                  |  12 +
 boot/Makefile                                 |   3 +
 boot/bootflow.c                               |   1 +
 boot/bootflow_internal.h                      |  47 ++
 boot/bootflow_menu.c                          | 284 +++++++++
 boot/bootmeth-uclass.c                        |  69 ++-
 boot/bootmeth_distro.c                        |  36 ++
 boot/bootmeth_script.c                        |  40 +-
 boot/bootstd-uclass.c                         |   2 +
 boot/expo.c                                   | 170 ++++++
 boot/image-board.c                            | 133 +++++
 boot/scene.c                                  | 414 ++++++++++++++
 boot/scene_internal.h                         | 123 ++++
 boot/scene_menu.c                             | 390 +++++++++++++
 cmd/bootflow.c                                |  44 +-
 cmd/bootmenu.c                                |  19 +-
 cmd/eficonfig.c                               |  38 +-
 cmd/font.c                                    |  11 +-
 cmd/source.c                                  | 140 +----
 common/Makefile                               |   6 +-
 common/cli_getch.c                            | 208 +++++++
 common/cli_readline.c                         | 150 +----
 common/command.c                              |  19 +
 common/menu.c                                 | 157 +++--
 configs/sandbox_defconfig                     |   2 +
 configs/sandbox_flattree_defconfig            |   2 +
 configs/snow_defconfig                        |   4 +
 configs/tools-only_defconfig                  |   2 +
 doc/develop/expo.rst                          | 188 ++++++
 doc/develop/index.rst                         |   1 +
 drivers/usb/gadget/f_sdp.c                    |   2 +-
 drivers/video/Kconfig                         |   7 +-
 drivers/video/console_truetype.c              |  37 +-
 drivers/video/vidconsole-uclass.c             |  33 ++
 include/bootflow.h                            |  40 ++
 include/bootmeth.h                            |  16 +
 include/bootstd.h                             |   4 +
 include/cli.h                                 |  74 +++
 include/command.h                             |  12 +
 include/expo.h                                | 521 +++++++++++++++++
 include/image.h                               |  17 +-
 include/menu.h                                |  77 ++-
 include/video.h                               |   2 +-
 include/video_console.h                       |  75 ++-
 test/boot/Makefile                            |   2 +
 test/boot/bootflow.c                          | 130 +++++
 test/boot/expo.c                              | 539 ++++++++++++++++++
 test/cmd/font.c                               |   6 +-
 test/py/tests/bootstd/armbian.bmp.xz          | Bin 0 -> 1384 bytes
 test/py/tests/bootstd/mmc4.img.xz             | Bin 0 -> 7072 bytes
 test/py/tests/test_android/test_avb.py        |   2 +
 test/py/tests/test_ut.py                      | 218 ++++++-
 54 files changed, 4075 insertions(+), 467 deletions(-)
 create mode 100644 boot/bootflow_internal.h
 create mode 100644 boot/bootflow_menu.c
 create mode 100644 boot/expo.c
 create mode 100644 boot/scene.c
 create mode 100644 boot/scene_internal.h
 create mode 100644 boot/scene_menu.c
 create mode 100644 common/cli_getch.c
 create mode 100644 doc/develop/expo.rst
 create mode 100644 include/expo.h
 create mode 100644 test/boot/expo.c
 create mode 100644 test/py/tests/bootstd/armbian.bmp.xz
 create mode 100644 test/py/tests/bootstd/mmc4.img.xz

-- 
2.38.1.431.g37b22c650d-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
