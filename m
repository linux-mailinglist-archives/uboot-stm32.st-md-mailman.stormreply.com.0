Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB99BCEEE
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Nov 2024 15:18:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66F13C71287;
	Tue,  5 Nov 2024 14:18:25 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2038FC71280
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 14:18:18 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2fb51f39394so45793871fa.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Nov 2024 06:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730816297; x=1731421097;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B8/1rrncbtaVYrVuI47vQflZIOSS+jJo/pj4Vokq6FQ=;
 b=WMiahUIlMChIqU4VJzR1tAYDylWeqbu2o2DVDsD5YVnvQehU2RtIEgIZe12/0mdCyK
 Wef5/5Ch1n0lSMiMRC6tWPtD6G2hS2Arw0BCVnCOGb84FwdLyQM4QhHfWkeuy93jHMqV
 IpxuMpax2E62tqvEU0tiItiu6nmw/dnRCwB2SZltq6VZ3DhDJ2LYM4TTpX39JXV7kMUT
 UikjB+5tXWJrVKdZg7HG4yYgoIp8x626CQ8jfKquXofEoZq/9jP3pkiZlRBCo4q+Utfk
 qbnfy6sIYzJMHhd/uydwySrRdBWqfUOL095sseqFzqCsta89YNdAWpjare5LFuMdBAHV
 FWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730816297; x=1731421097;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B8/1rrncbtaVYrVuI47vQflZIOSS+jJo/pj4Vokq6FQ=;
 b=HP/yFiBoEiJv6aVCADtLLxym0arYjeJ+5MYK8lpBms27bncwLTthxeiGoTi3Dtw1H8
 XBVc5s45BoFB74dq080rCTYS540g1jTVyUv/f27OjsrH7hBju5vSa6ScRWxAgZ7cqIRW
 LYm18FOo/O4fQhMzjaUMNKxZ74Dfgo3w7kcqwHHxo8tQ+Dhj7LCg0fwl4ZDqEx3RBOv6
 s1S1EvQkK+de1Jeq9P2HxsKxnuQzNAF3uqX7hZLaz8/6LhuqNNcK35ztsEBaIeTGhqny
 a3bdxeD7ccdzvYjaQ0wS+6YHCqlMx37su8DyFkuoQYCmn5BlPdVTEQMBWReOU8y0ETVA
 KNUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOeVv0Gu9Af2Msan5pM5IYQ2mmFZJLoYpj7zJkAtsmZjVKaQSOQmw4Yq4OCtuFWLCxORbvNtWx0onYjg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwwMnVJubjWgw48U/5/MQYRuUz+8olFtj80Irh2h1XybHHnMgNd
 asi6rgl0XYm7ymmxtFZWrHc8pKKAW22HOQpAUGkoYzbI+UhRwf3VvSh2UE9tc4IJeffK8iXFzIL
 uUCx1KLVOx4C0E/rRhq48yIfVGbM=
X-Google-Smtp-Source: AGHT+IFR3u9G4Brkza8zFIJwpSli83HjLaKrHBaFzotHgeScNAaI8f3AHjEqMhw1IaIjf88FSBaYgdNaduLYrONp9gQ=
X-Received: by 2002:a2e:bc1d:0:b0:2fa:d317:b777 with SMTP id
 38308e7fff4ca-2fcbdf6882emr182698661fa.2.1730816296976; Tue, 05 Nov 2024
 06:18:16 -0800 (PST)
MIME-Version: 1.0
References: <20241103003322.626036-1-sjg@chromium.org>
In-Reply-To: <20241103003322.626036-1-sjg@chromium.org>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 5 Nov 2024 14:18:05 +0000
Message-ID: <CALeDE9MfWEAb91uzQPa6_jSo6beJv_GNHTY2TeKnSzFm6V97gw@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Wan Yee Lau <wan.yee.lau@intel.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Devarsh Thakkar <devarsht@ti.com>, Sean Edmond <seanedmond@microsoft.com>,
 Sean Anderson <seanga2@gmail.com>, Charles Hardin <ckhardin@gmail.com>,
 Alexander Gendin <agendin@matrox.com>,
 This contributor prefers not to receive mails <noreply@example.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Tien Fong Chee <tien.fong.chee@intel.com>,
 Angelo Dureghello <angelo@sysam.it>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Doug Zobel <douglas.zobel@climate.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Angelo Dureghello <angelo@kernel-space.org>,
 Ramon Fried <rfried.dev@gmail.com>, Christian Marangi <ansuelsmth@gmail.com>,
 Michael Polyntsov <michael.polyntsov@iopsys.eu>, Marek Vasut <marex@denx.de>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Wolfgang Denk <wd@denx.de>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Enric Balletbo i Serra <eballetbo@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Alison Wang <alison.wang@nxp.com>,
 Maxim Moskalets <maximmosk4@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Igor Opaniuk <igor.opaniuk@gmail.com>,
 Jens Scharsig <esw@bus-elektronik.de>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Samuel Holland <samuel@sholland.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, Mario Six <mario.six@gdsys.cc>,
 Richard Weinberger <richard@nod.at>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 00/25] led: Remove old status-LED code
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

On Sun, 3 Nov 2024 at 00:34, Simon Glass <sjg@chromium.org> wrote:
>
> There has been an LED framework in U-Boot which uses driver model for
> about 9 years now. Recent work is underway to improve it and provide
> more features. It is probably a good time to drop the old code, which
> is only used by 5 boards:

I don't believe, from what I can tell, they are feature comparable, at
the very least I have not been able to get the Pinephone working with
this so as it stands I still don't think this patch set is ready yet.

>    ./tools/qconfig.py -f LED_STATUS
>    5 matches
>    eb_cpu5282 eb_cpu5282_internal mx23_olinuxino pinephone
>    socfpga_vining_fpga
>
> This series attempts that.
>
> The new /options node provides a way to provide U-Boot settings, and
> LEDs are implemented there. For now I have brought into the options
> schema from upstream. We can update it once the LED additions land
> there.
>
> Changes in v3:
> - Update commit message
> - Combine removal and enable patches
> - Combine removal and enable patches
> - Combine removal and enable patches
>
> Changes in v2:
> - Combine code-removal and defconfig changes
> - Add a patch to enable LED and LED_BOOT for these boards
> - Enable LED on the 5 affected platforms
> - Reorder patches for bisectability
> - Add dt-schema bindings for LED
>
> Simon Glass (25):
>   eb_cpu5282: Drop status-LED code and enable LED
>   vining_fpga: Drop status-LED code and use LED
>   mx23_olinuxino: Drop status-LED code and use LED
>   pinephone: Drop status-LED code and use LED
>   led: Drop LED_STATUS_BOARD_SPECIFIC
>   arm: Drop old LED support
>   common: doc: Drop old LED support
>   st: stm32f429: Drop old LED code
>   led: Make the LED config common
>   led: Drop LED_STATUS from Kconfig
>   led: Drop the legacy LED command
>   misc: Drop gpio_led driver
>   pca9551_led: Delete driver
>   misc: status_led: Delete driver
>   m68k: Drop unused status_led.h header file
>   powerpc: Drop status-LED code
>   igep00x0: Drop unused status_led.h header file
>   sunxi: Drop status-LED code
>   common: Drop status-LED code in board_r
>   image: Drop unused status_led.h header file
>   ide: Drop unused status_led.h header file
>   mpc83xx: Drop status-LED code
>   net: Drop status-LED code
>   led: Drop status_led header file
>   doc: Add devicetree bindings for options
>
>  arch/arm/lib/crt0.S                          |   4 -
>  arch/m68k/lib/bootm.c                        |   3 -
>  arch/powerpc/lib/interrupts.c                |   6 -
>  board/BuS/eb_cpu5282/eb_cpu5282.c            |  20 --
>  board/isee/igep00x0/igep00x0.c               |   1 -
>  board/olimex/mx23_olinuxino/mx23_olinuxino.c |   7 -
>  board/softing/vining_fpga/socfpga.c          |   4 -
>  board/st/stm32f429-discovery/Makefile        |   1 -
>  board/st/stm32f429-discovery/led.c           |  39 ---
>  board/sunxi/board.c                          |   6 -
>  boot/image.c                                 |   4 -
>  cmd/Makefile                                 |   1 -
>  cmd/ide.c                                    |   4 -
>  cmd/legacy_led.c                             | 185 ----------
>  common/board_f.c                             |  22 --
>  common/board_r.c                             |  27 --
>  configs/eb_cpu5282_defconfig                 |   8 +-
>  configs/eb_cpu5282_internal_defconfig        |   8 +-
>  configs/mx23_olinuxino_defconfig             |  10 +-
>  configs/pinephone_defconfig                  |   7 +-
>  configs/socfpga_vining_fpga_defconfig        |  13 +-
>  doc/README.LED                               |  77 -----
>  doc/device-tree-bindings/options.yaml        |  79 +++++
>  doc/device-tree-bindings/options/u-boot.yaml | 136 ++++++++
>  drivers/led/Kconfig                          | 342 +------------------
>  drivers/misc/Kconfig                         |  13 -
>  drivers/misc/Makefile                        |   3 -
>  drivers/misc/gpio_led.c                      | 106 ------
>  drivers/misc/pca9551_led.c                   | 170 ---------
>  drivers/misc/status_led.c                    | 124 -------
>  drivers/timer/mpc83xx_timer.c                |   5 -
>  include/configs/eb_cpu5282.h                 |   6 -
>  include/status_led.h                         | 115 -------
>  net/bootp.c                                  |   7 -
>  net/net.c                                    |  33 --
>  35 files changed, 236 insertions(+), 1360 deletions(-)
>  delete mode 100644 board/st/stm32f429-discovery/led.c
>  delete mode 100644 cmd/legacy_led.c
>  delete mode 100644 doc/README.LED
>  create mode 100644 doc/device-tree-bindings/options.yaml
>  create mode 100644 doc/device-tree-bindings/options/u-boot.yaml
>  delete mode 100644 drivers/misc/gpio_led.c
>  delete mode 100644 drivers/misc/pca9551_led.c
>  delete mode 100644 drivers/misc/status_led.c
>  delete mode 100644 include/status_led.h
>
> --
> 2.43.0
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
