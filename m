Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2560061FE1F
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Nov 2022 20:02:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C344AC6410B;
	Mon,  7 Nov 2022 19:02:03 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EECEC04003
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Nov 2022 19:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1667847686; bh=a0hK4nvReMDBhSa8AxhtamKcyGIF7ZYFTQXBQPueook=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=EzPCOPyDdBS3DDAgY/WiN7Gxg6yf4KgHAKQ/+4earjQ80jt1fCw3Iyd0OVzaC92gl
 miiOxNzccMa/y+44inUIEpAYQDsSnlDrJlfR+TllDH7diEJ/ihnoV71I/ogU4YqUP5
 3RKp+4L62+TWITmttYHi6YPuOygU/xZzdL+8g1BMQCREjjcbSnK8gpihUM065mGhIV
 /TC+H5449uNWiPEeJTxWIAqnrLZL6KVOmmqqmrhZ5KKOZfea1iaxMswa6/uQgll849
 SjxP6LIPcSh7Q05E3u/75Qy1LPfUIPexr8T3YwQ9QNsH8cesFMh0yyZvvmpZFxhBb/
 3skGRoYaJs0vA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.67] ([84.118.157.2]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McH9i-1pQMGH3D5w-00ciRt; Mon, 07
 Nov 2022 20:01:25 +0100
Message-ID: <24ff452a-e787-1816-0c70-5e3c931bda7e@gmx.de>
Date: Mon, 7 Nov 2022 20:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>
References: <20221104224844.467576-1-sjg@chromium.org>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20221104224844.467576-1-sjg@chromium.org>
X-Provags-ID: V03:K1:UcMkkgb9fD3MzWAADor4oMru5v+8TxkS7qzRTtxFDKd1Mh2tqmg
 X/irwM0G9wac8URUfeeRLfSwyeNG4b8/EpB/t4YQP6r2VycbE7TriwWRbu0upq3ALzEszEW
 +efb99F1Ypws4fFuvbDJF1vEzXo9dX3xukClTs20H5RDnvU+2+Sx7goQCzMdfNNFbh7FAuS
 sjtWjbweR44XBEW/DtNjw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GsDsonGbp1E=;C/dJwCqfv8wX2D3EQRsvW7EPtTo
 vzneJwKJiRn6eb/hJ6o95/TVVg1IeWHrlQqJ61CGUSalGWvN7DGUT0zitFYE4lcOGaIIt7Ckl
 3SmnsxGYdxXDmQWw4yCd2GscMNca3rGiJYrSPC4lbfdTidLw/d5n7CITF1oKo+qGC5P4fJoDD
 7Ssyaf7ftp+Bq7aCKNWDaGb60rtlTW3NkOYTCYxJn0KwtMRGD0PF+lFd3UIs6IvPz1VHdCky8
 pvXvfLjWy4o5jzytiKr79szGHOfU2TsQGPpVdnWQTcGu0wAxHgJo42sP1TmnnE/vjH3Vq8ixM
 xCWObawcxqz3gzuHcuAIV3Fvegm1ORecXnj/YEcBgt77yaVMpmFD6N6kn3UjF7PLraI7z2rXV
 BbO7UgDRFSctD+nCZZvrJd6nc2PbN49Le0+qDFBO86CpnwFk63tgEfyqjgl8IBuLvRvTru3ep
 aCdR/AoGFcUvk9+zI6MCZhI9PLlBdUD4X4DDtzczHR46rZqyyTwtGApazOsw4if30zt06Jn4r
 Z6Vwu8/yIkLSrTc7Fz4r/qX7CptFN09SHfHKAKzTuQevm1SvglIrrSYT7lHCQh64J4w0/m3za
 yPRJD34CzegKglJjaLPrd4VwWjzGmw0PYCFnqH4UmGQdGH8oYlo4Vt/va2yhogRGiYPALvTEF
 UP4u77XlSZ/I+rrp9ePyui3EuK3uB06QdvototQ1GqE804NxfV4lJYzL4j7hxwZbgv0YJMVAt
 iBI2q8q7wLuRBdCrekPoYXVFw8U4AQNFHNklXH+YbOhICJtiFnNJ5JZ/5AdNyCDVpksIU5v3G
 B9gEVrCjBpGIxdjkWXzJG+O7GmK9U4PUDcRqbfOunjmyrfJnPJzCr2PGJX0+940/1q97wP9C1
 +z+gYGR7SR07qCkMlhIG1Cgx159v0yNcH8/hytVwML/b9snYxK2wuv8xdn9a5A4c5q6S9eho0
 5xNWAwxv+8M6RPZxXSws0LLiQI0=
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Steven Lawrance <steven.lawrance@softathome.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Stefan Roese <sr@denx.de>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>, Tom Rini <trini@konsulko.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 11/4/22 23:48, Simon Glass wrote:
> So far standard boot lacks a boot menu, although it is possible to create
> a rudimentary one using the existing 'bootmenu' command.
>
> Even then, this text-based menu offer only basic functionality and does
> not take full advantage of the displays which are common on many devices.
>
> This series provides a 'bootflow menu' command which allows the user to
> select from the available bootflows. An attempt is made to show the name
> of the available operating systems, by reading more information into the
> bootflow. A logo can be read also, where supported, so that this can be
> presented to the user when an option is highlighted.
>
> Full use is made of TrueType fonts, if enabled. For cases where only a
> serial console is available, it falls back to a simple text-based menu.

Please, add the link to your design document

https://docs.google.com/document/d/1VQeApnLlH6xKm_OI36AhWkJLUEd9OXEvIJXB8aM2de8/edit?resourcekey=0-DwgHpR2S8vJEJzvvwPb-AQ#heading=h.17wg41voij6q
is broken.

in future version of this series.

The series leaves us with duplicate code in

bootmenu_choice_entry() and eficonfig_choice_entry() as well as
bootmenu_loop() and bootmenu_autoboot_loop().

The bootmenu command relies heavily on ANSI sequences but VIDEO_ANSI is
disabled by default for CONFIG_EFI_LOADER=n which means that the
bootmenu command will not work anymore.

>
> All of this is implementing using a new 'expo' construct, a collection of

Expo is not an English word. Expo is typically used as name of trade
fairs. Transaction probably is the right word to use here.

Files expo.c and scene.c are in boot/ which does not match a generic GUI
feature. They should be placed in lib/.

Best regards

Heinrich

> scenes (like menu screens) which can be navigated by the user to view
> information and select options. This is fairly general and should be able
> to cope with a wider array of use cases, with less hacking of the menu
> code, such as is currently needed for CMD_BOOTEFI_BOOTMGR.
>
> Of course it would be possible to enhance the existing menu rather than
> creating a new setup. Instead it seems better to make the existing menu
> use expo, if code space permits. It avoids the event-loop problem and
> should be more extensible, given its loosely coupled components and use of
> IDs instead of pointers. Further motivation is provided in the
> documentation.
>
> For now the CLI keypress-decoding code is split out to be used by the new
> menu. The key codes defined by menu.h are reused also.
>
> This is of course just a starting point. Some ideas for future work are
> included in the documentation.
>
> Changes in v2:
> - Drop the _add suffix on expo creation function
> - Fix 'touse' typo
> - Fix pylint warning in mkdir_cond()
> - Put strings in a separate structure referenced by ID
> - Rebase to master
> - Rename vidconsole_get_font() to vidconsole_get_font_size()
> - Update for new API
>
> Simon Glass (25):
>    sandbox: Enable mmc command and legacy images
>    cli: Move readline character-processing to a state machine
>    bootmenu: Add a few comments
>    menu: Rename KEY_... to BKEY_...
>    menu: Update bootmenu_autoboot_loop() to return the code
>    menu: Update bootmenu_loop() to return the code
>    menu: Use a switch statement
>    menu: Make use of CLI character processing
>    image: Add a function to find a script in an image
>    image: Move common image code to image_board and command
>    video: Enable VIDEO_ANSI by default only with EFI
>    video: truetype: Rename the metrics function
>    video: Fix unchnaged typo
>    video: Add font functions to the vidconsole API
>    bootstd: Read the Operating System name for distro/scripts
>    bootstd: Allow reading a logo for the OS
>    menu: Factor out menu-keypress decoding
>    expo: Add basic implementation
>    expo: Add support for scenes
>    expo: Add support for scene menus
>    expo: Add basic tests
>    bootstd: Support creating a boot menu
>    bootstd: Add a test for the bootstd menu
>    bootstd: Support setting a theme for the menu
>    expo: Add documentation
>
>   .../cmd_stm32prog/cmd_stm32prog.c             |   2 +-
>   arch/sandbox/dts/test.dts                     |  11 +
>   boot/Kconfig                                  |  12 +
>   boot/Makefile                                 |   3 +
>   boot/bootflow.c                               |   1 +
>   boot/bootflow_internal.h                      |  47 ++
>   boot/bootflow_menu.c                          | 284 +++++++++
>   boot/bootmeth-uclass.c                        |  69 ++-
>   boot/bootmeth_distro.c                        |  36 ++
>   boot/bootmeth_script.c                        |  40 +-
>   boot/bootstd-uclass.c                         |   2 +
>   boot/expo.c                                   | 170 ++++++
>   boot/image-board.c                            | 133 +++++
>   boot/scene.c                                  | 414 ++++++++++++++
>   boot/scene_internal.h                         | 123 ++++
>   boot/scene_menu.c                             | 390 +++++++++++++
>   cmd/bootflow.c                                |  44 +-
>   cmd/bootmenu.c                                |  19 +-
>   cmd/eficonfig.c                               |  38 +-
>   cmd/font.c                                    |  11 +-
>   cmd/source.c                                  | 140 +----
>   common/Makefile                               |   6 +-
>   common/cli_getch.c                            | 208 +++++++
>   common/cli_readline.c                         | 150 +----
>   common/command.c                              |  19 +
>   common/menu.c                                 | 157 +++--
>   configs/sandbox_defconfig                     |   2 +
>   configs/sandbox_flattree_defconfig            |   2 +
>   configs/snow_defconfig                        |   4 +
>   configs/tools-only_defconfig                  |   2 +
>   doc/develop/expo.rst                          | 188 ++++++
>   doc/develop/index.rst                         |   1 +
>   drivers/usb/gadget/f_sdp.c                    |   2 +-
>   drivers/video/Kconfig                         |   7 +-
>   drivers/video/console_truetype.c              |  37 +-
>   drivers/video/vidconsole-uclass.c             |  33 ++
>   include/bootflow.h                            |  40 ++
>   include/bootmeth.h                            |  16 +
>   include/bootstd.h                             |   4 +
>   include/cli.h                                 |  74 +++
>   include/command.h                             |  12 +
>   include/expo.h                                | 521 +++++++++++++++++
>   include/image.h                               |  17 +-
>   include/menu.h                                |  77 ++-
>   include/video.h                               |   2 +-
>   include/video_console.h                       |  75 ++-
>   test/boot/Makefile                            |   2 +
>   test/boot/bootflow.c                          | 130 +++++
>   test/boot/expo.c                              | 539 ++++++++++++++++++
>   test/cmd/font.c                               |   6 +-
>   test/py/tests/bootstd/armbian.bmp.xz          | Bin 0 -> 1384 bytes
>   test/py/tests/bootstd/mmc4.img.xz             | Bin 0 -> 7072 bytes
>   test/py/tests/test_android/test_avb.py        |   2 +
>   test/py/tests/test_ut.py                      | 218 ++++++-
>   54 files changed, 4075 insertions(+), 467 deletions(-)
>   create mode 100644 boot/bootflow_internal.h
>   create mode 100644 boot/bootflow_menu.c
>   create mode 100644 boot/expo.c
>   create mode 100644 boot/scene.c
>   create mode 100644 boot/scene_internal.h
>   create mode 100644 boot/scene_menu.c
>   create mode 100644 common/cli_getch.c
>   create mode 100644 doc/develop/expo.rst
>   create mode 100644 include/expo.h
>   create mode 100644 test/boot/expo.c
>   create mode 100644 test/py/tests/bootstd/armbian.bmp.xz
>   create mode 100644 test/py/tests/bootstd/mmc4.img.xz
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
