Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 628AD9BA2BB
	for <lists+uboot-stm32@lfdr.de>; Sat,  2 Nov 2024 23:19:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10A80C71292;
	Sat,  2 Nov 2024 22:19:04 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF154C6DD6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Nov 2024 22:18:56 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-71e49ad46b1so2593152b3a.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 Nov 2024 15:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730585935; x=1731190735;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pny/6aZrMRKa1cJiQSXpo+LyH2LHLfG8xTW7X1mJzQY=;
 b=btW7q2kJOmpfSQl46e/Pj159X8NSScCTOxtbQzHLTvEhC9P/sEZ9fDnlQksxH9RAh3
 MV+WAYLfBcgu4Omtv4/aua5/sW3fULZ91YAKYQ6fUDP1kZ0WUo6RMbr+eOJfH7DrOGuI
 /jATyKj455z1PjwypDbIAVNxL6jZKNxFUim/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730585935; x=1731190735;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pny/6aZrMRKa1cJiQSXpo+LyH2LHLfG8xTW7X1mJzQY=;
 b=LYH4PXDflcJuHN1H/jfT3DlyJVfqSA1l5dv2yyUvKI/kGWHXj1HFv5h+s/hs4+oK+D
 X+xYWXMj4eD4AQtgGXnwYIgMDvnoedXk10VhxtoVAHM67qXbgM0z0uOjlDR7/WrOjueb
 Wp3zR1IAQN/PHDNV82O7dNYSmdaXMwdVJnKEpavkWmh4XkBkfufoZZq1lrqpNco6HSCp
 TQ5KopvsQz14s55czPCPyJMo2HGSJ39/WgFuvrikaUGtbdYSy1zZEqOj7QpaY3jv7nwc
 U0UouAzNJAQduvUFDVePxU+LE8zjmCCYWXQRJPSAQVk7dk+dsUAzQjVk1aeaCmNh1AXd
 HWHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlu/fgJsE7/UjVBcnSbmJM+Ife3qoLT10sJjaqH46UC9wvi98mfv4ci8HNnXr7QsnLZ2WWdx4Rg6lDig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxGuoySxyiZyIdc4Om2DPwElcgGm80l5yqoMa/KPmJvtUX5110K
 BFTIFWE5CqUOA2zBQT8bTNZb4GfVqtcC//GOGZbld1YjQOWCEd34i7xk/i4uPA==
X-Google-Smtp-Source: AGHT+IHGe8V65gtGY5RnTJ65ochndhKXaqi/ybYy6vDG1cXXpq5S8/1BmpJDZWniwNV2Xx38/me+IA==
X-Received: by 2002:a05:6a20:d81b:b0:1d6:e635:5c5e with SMTP id
 adf61e73a8af0-1d9a83ab2e5mr35793588637.9.1730585935142; 
 Sat, 02 Nov 2024 15:18:55 -0700 (PDT)
Received: from chromium.org ([205.220.129.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ee45a0081esm4386286a12.59.2024.11.02.15.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 15:18:54 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sat,  2 Nov 2024 16:16:58 -0600
Message-ID: <20241102221737.547938-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Wan Yee Lau <wan.yee.lau@intel.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Devarsh Thakkar <devarsht@ti.com>, Sean Edmond <seanedmond@microsoft.com>,
 Dmitry Rokosov <ddrokosov@salutedevices.com>,
 Sean Anderson <seanga2@gmail.com>, Charles Hardin <ckhardin@gmail.com>,
 This contributor prefers not to receive mails <noreply@example.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
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
 Samuel Holland <samuel@sholland.org>, Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, Mario Six <mario.six@gdsys.cc>,
 Richard Weinberger <richard@nod.at>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [Uboot-stm32] [PATCH v3 00/25] led: Remove old status-LED code
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

There has been an LED framework in U-Boot which uses driver model for
about 9 years now. Recent work is underway to improve it and provide
more features. It is probably a good time to drop the old code, which
is only used by 5 boards:

   ./tools/qconfig.py -f LED_STATUS
   5 matches
   eb_cpu5282 eb_cpu5282_internal mx23_olinuxino pinephone
   socfpga_vining_fpga

This series attempts that.

The new /options node provides a way to provide U-Boot settings, and
LEDs are implemented there. For now I have brought into the options
schema from upstream. We can update it once the LED additions land
there.

Changes in v3:
- Update commit message
- Combine removal and enable patches
- Combine removal and enable patches
- Combine removal and enable patches

Changes in v2:
- Combine code-removal and defconfig changes
- Add a patch to enable LED and LED_BOOT for these boards
- Enable LED on the 5 affected platforms
- Reorder patches for bisectability
- Add dt-schema bindings for LED

Simon Glass (25):
  eb_cpu5282: Drop status-LED code and enable LED
  vining_fpga: Drop status-LED code and use LED
  mx23_olinuxino: Drop status-LED code and use LED
  pinephone: Drop status-LED code and use LED
  led: Drop LED_STATUS_BOARD_SPECIFIC
  arm: Drop old LED support
  common: doc: Drop old LED support
  st: stm32f429: Drop old LED code
  led: Make the LED config common
  led: Drop LED_STATUS from Kconfig
  led: Drop the legacy LED command
  misc: Drop gpio_led driver
  pca9551_led: Delete driver
  misc: status_led: Delete driver
  m68k: Drop unused status_led.h header file
  powerpc: Drop status-LED code
  igep00x0: Drop unused status_led.h header file
  sunxi: Drop status-LED code
  common: Drop status-LED code in board_r
  image: Drop unused status_led.h header file
  ide: Drop unused status_led.h header file
  mpc83xx: Drop status-LED code
  net: Drop status-LED code
  led: Drop status_led header file
  doc: Add devicetree bindings for options

 arch/arm/lib/crt0.S                          |   4 -
 arch/m68k/lib/bootm.c                        |   3 -
 arch/powerpc/lib/interrupts.c                |   6 -
 board/BuS/eb_cpu5282/eb_cpu5282.c            |  20 --
 board/isee/igep00x0/igep00x0.c               |   1 -
 board/olimex/mx23_olinuxino/mx23_olinuxino.c |   7 -
 board/softing/vining_fpga/socfpga.c          |   4 -
 board/st/stm32f429-discovery/Makefile        |   1 -
 board/st/stm32f429-discovery/led.c           |  39 ---
 board/sunxi/board.c                          |   6 -
 boot/image.c                                 |   4 -
 cmd/Makefile                                 |   1 -
 cmd/ide.c                                    |   4 -
 cmd/legacy_led.c                             | 185 ----------
 common/board_f.c                             |  22 --
 common/board_r.c                             |  27 --
 configs/eb_cpu5282_defconfig                 |   8 +-
 configs/eb_cpu5282_internal_defconfig        |   8 +-
 configs/mx23_olinuxino_defconfig             |  10 +-
 configs/pinephone_defconfig                  |   7 +-
 configs/socfpga_vining_fpga_defconfig        |  13 +-
 doc/README.LED                               |  77 -----
 doc/device-tree-bindings/options.yaml        |  79 +++++
 doc/device-tree-bindings/options/u-boot.yaml | 136 ++++++++
 drivers/led/Kconfig                          | 342 +------------------
 drivers/misc/Kconfig                         |  13 -
 drivers/misc/Makefile                        |   3 -
 drivers/misc/gpio_led.c                      | 106 ------
 drivers/misc/pca9551_led.c                   | 170 ---------
 drivers/misc/status_led.c                    | 124 -------
 drivers/timer/mpc83xx_timer.c                |   5 -
 include/configs/eb_cpu5282.h                 |   6 -
 include/status_led.h                         | 115 -------
 net/bootp.c                                  |   7 -
 net/net.c                                    |  33 --
 35 files changed, 236 insertions(+), 1360 deletions(-)
 delete mode 100644 board/st/stm32f429-discovery/led.c
 delete mode 100644 cmd/legacy_led.c
 delete mode 100644 doc/README.LED
 create mode 100644 doc/device-tree-bindings/options.yaml
 create mode 100644 doc/device-tree-bindings/options/u-boot.yaml
 delete mode 100644 drivers/misc/gpio_led.c
 delete mode 100644 drivers/misc/pca9551_led.c
 delete mode 100644 drivers/misc/status_led.c
 delete mode 100644 include/status_led.h

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
