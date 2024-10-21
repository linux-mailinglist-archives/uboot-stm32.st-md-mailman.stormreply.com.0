Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D95CF9A66BF
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2024 13:38:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CD34C78035;
	Mon, 21 Oct 2024 11:38:57 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13A07C7801A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 11:38:50 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539e1543ab8so7206460e87.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 04:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729510729; x=1730115529;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZEN8HPOey7MW6DwzvPu4O9WUdCksTR9VMVqFVb3xNZ8=;
 b=bTAbltMTQN/yOBcuJAoozp5mc3wBn2yCgqWQnudXN4qi6fmg8YFbZIdEFOkShsABxD
 6lJRvyKoWMGIuYk9Pr0HmLdR9oHDbAFyBu3PwMmBGyDpw7HcRCFZXSTkb6xR+Yy+xgaD
 vwy6eqc7EOhYKh8G8mb1FdgS6oQOvlPsBxD4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729510729; x=1730115529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZEN8HPOey7MW6DwzvPu4O9WUdCksTR9VMVqFVb3xNZ8=;
 b=OoHg2kssPueFK8zAM+vA0olacZDFhCBJBZjhDg5zoIdY0qKR9//eTG0JKqS7AlPoVj
 vK1VMehYMHDZSjyd0VP6UIs+rLnYjMnnnIDwNIBgqeArDz/yy58IYGIlQZDt8IB5uPxB
 dCAQ2Xq60j9QtXGclo3HSspMyL4s1CO6wWsRp1trw+wdzudQBVSga6PzS6El6pF/D5iO
 8x3HCbFA7b5/TSkHg9i+jgmzjJvuhYcRTOew+lg+5yi1CsmFTaI0V7SAu/rWIDKZeNMg
 wRi2aMa5q/LD2sQxTko3pnnfsQcjIEGRrORmEjowoA3dsQDK6gx6b66prS0RcB/C8zCr
 VMBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwjOwfukiFHbQsX9TK+9h+YJZxwP8CCQpb+zsG7bw2r1jxCdFglAqWFFVGsc26LBhheQVcLkrnPn5rMQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxZuNDPQFFm6U7Pf2MvN9X5/EC10uo4gok8qOewjhPSfVFjfMj0
 GWc9pAGE1oc3GrYywXWq+307oZbNgiQbycUiSPWzWeEmW1lwftuggwSnnmpWEQ==
X-Google-Smtp-Source: AGHT+IGUg2Cqfl2MoM8QRq+TBBwJOYcXw2g+CtZmGRbNgLiH9QtkyaUD2H3KuXUVZc1es1O4srEmEA==
X-Received: by 2002:a05:6512:15a5:b0:533:483f:9562 with SMTP id
 2adb3069b0e04-53a154c9f5cmr8876503e87.42.1729510728838; 
 Mon, 21 Oct 2024 04:38:48 -0700 (PDT)
Received: from chromium.org (43-114-103-145.static.glaslokaal.nl.
 [145.103.114.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91571ea5sm191604366b.160.2024.10.21.04.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 04:38:48 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Mon, 21 Oct 2024 13:38:08 +0200
Message-ID: <20241021113839.318572-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Wan Yee Lau <wan.yee.lau@intel.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Devarsh Thakkar <devarsht@ti.com>, Sean Edmond <seanedmond@microsoft.com>,
 Sam Edwards <CFSworks@gmail.com>, Sean Anderson <seanga2@gmail.com>,
 Charles Hardin <ckhardin@gmail.com>, Alexander Gendin <agendin@matrox.com>,
 This contributor prefers not to receive mails <noreply@example.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, Johan Jonker <jbx6244@gmail.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Tien Fong Chee <tien.fong.chee@intel.com>,
 Angelo Dureghello <angelo@sysam.it>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
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
 Okhunjon Sobirjonov <okhunjon72@gmail.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Igor Opaniuk <igor.opaniuk@gmail.com>,
 Jens Scharsig <esw@bus-elektronik.de>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Michal Simek <michal.simek@amd.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Samuel Holland <samuel@sholland.org>, Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Richard Weinberger <richard@nod.at>, Artur Rojek <artur@conclusive.pl>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [Uboot-stm32] [PATCH v2 00/25] led: Remove old status-LED code
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

Changes in v2:
- Combine code-removal and defconfig changes
- Add a patch to enable LED and LED_BOOT for these boards
- Add a patch to enable LED and LED_BOOT for these boards
- Enable LED on the 5 affected platforms
- Reorder patches for bisectability

Simon Glass (25):
  eb_cpu5282: Drop status-LED code and enable LED
  vining_fpga: Drop status-LED code
  mx23_olinuxino: Drop status-LED code
  mx23_olinuxino: pinephone: Enable LED
  socfpga_vining_fpga: Enable LED
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
 33 files changed, 21 insertions(+), 1360 deletions(-)
 delete mode 100644 board/st/stm32f429-discovery/led.c
 delete mode 100644 cmd/legacy_led.c
 delete mode 100644 doc/README.LED
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
