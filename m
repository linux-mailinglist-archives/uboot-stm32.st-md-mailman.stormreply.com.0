Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B95987A2B
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Sep 2024 22:47:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4907C6DD72;
	Thu, 26 Sep 2024 20:47:09 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1345C6B45B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 20:47:02 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6cb35f2aec1so6745446d6.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 13:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727383622; x=1727988422;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xxvWwbKtkXUX7p+oVxlmhMEoMQZ1mWXFT1NL11pr7hg=;
 b=gyczWvjggtWhfywoyJC0A2VJ/X5fza3YGhb813vX86lE0YVz/TzidU3f3qF8VEXdms
 8hIsDaFAYl/lxc3bmY1ct+33PJzFZav6Kqro9m/ggS17rI3KvSM/4BwxAhYesSdTeUCE
 +gHbmnOvRBvUEkUpMLaWbN413bcMHRuWK3+Sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727383622; x=1727988422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xxvWwbKtkXUX7p+oVxlmhMEoMQZ1mWXFT1NL11pr7hg=;
 b=l3fmpnreL8KDPuv2Ckv+x3FDj3boCo+L/LkdVl4t85frhDYXbc0abU0kfP7PlrUuso
 kHeQmw0mKndVp0auaqu3F7fya4sy1WFUj9eLy1BWCQ/b0IhynG3cO7H1CBtKfgdweqlN
 3moZLYtNFULHvsjcjE6nKfpMNq3M+g44/89/VZnOwca6XcXsT62H1eRrahkXWwtGymAc
 Fl6Yuceo3/3GgQQJZuAlZC5jAFI92pMEhhlFoq/nFQI6GpmSRO3zVlILD2P54vvzYb+b
 k0zD/B5yBfWawWqBfkiV+RWdsMFgsRHeSsmK/2Fi7qzmXCZhtIxbS/8wtqr/B5O4jpvd
 R/2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwPrv2Upq3rhJziOZ59C72KdeqryakBqNdWYXOcXiNiKQIKKlY88TnHfFDegwH1mP4ldMirn/bCSc8fQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz0LGW/fcktOhlp+T/freRGXzMQ1Mbu62MOTjNqCkgOdGqrYdwT
 q7ZRqcOwQqQOd00DFise5qWWfuEuVDLmaYxOErEb0XHDJJjBSqnDE4USSp8w7A==
X-Google-Smtp-Source: AGHT+IF08wXICnUmxEcXTUjumMPYSOy7d4ujhp7/5EAY7XiDOu51ta/lHPDxXd/NXbk8xV3L4gheAQ==
X-Received: by 2002:a0c:f411:0:b0:6c5:b857:7837 with SMTP id
 6a1803df08f44-6cb3b5f8127mr15178246d6.13.1727383621801; 
 Thu, 26 Sep 2024 13:47:01 -0700 (PDT)
Received: from chromium.org ([205.220.129.31])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cb3b66cff5sm2538696d6.77.2024.09.26.13.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 13:47:01 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Thu, 26 Sep 2024 22:44:20 +0200
Message-ID: <20240926204455.963584-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Devarsh Thakkar <devarsht@ti.com>, Kever Yang <kever.yang@rock-chips.com>,
 Sean Anderson <seanga2@gmail.com>, Charles Hardin <ckhardin@gmail.com>,
 Alexander Gendin <agendin@matrox.com>,
 This contributor prefers not to receive mails <noreply@example.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, Jens Scharsig <esw@bus-elektronik.de>,
 Tom Rini <trini@konsulko.com>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 AKASHI Takahiro <akashi.tkhro@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Angelo Dureghello <angelo@kernel-space.org>,
 Samuel Holland <samuel@sholland.org>,
 Michael Polyntsov <michael.polyntsov@iopsys.eu>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Wan Yee Lau <wan.yee.lau@intel.com>, Andre Przywara <andre.przywara@arm.com>,
 Huan Wang <alison.wang@nxp.com>, Maxim Moskalets <maximmosk4@gmail.com>,
 Okhunjon Sobirjonov <okhunjon72@gmail.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Igor Opaniuk <igor.opaniuk@gmail.com>,
 Johan Jonker <jbx6244@gmail.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, Richard Weinberger <richard@nod.at>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [Uboot-stm32] [PATCH 00/27] led: Remove old status-LED code
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


Simon Glass (27):
  led: Drop LED_STATUS_BOARD_SPECIFIC
  arm: Drop old LED support
  common: doc: Drop old LED support
  st: stm32f429: Drop old LED code
  led: Make the LED config common
  eb_cpu5282: Drop STATUS_LED
  mx23_olinuxino: Drop STATUS_LED
  pinephone: Drop STATUS_LED
  socfpga_vining_fpga: Drop STATUS_LED
  led: Drop LED_STATUS from Kconfig
  led: Drop the legacy LED command
  misc: Drop gpio_led driver
  pca9551_led: Delete driver
  misc: status_led: Delete driver
  m68k: Drop unused status_led.h header file
  powerpc: Drop status-LED code
  eb_cpu5282: Drop status-LED code
  igep00x0: Drop unused status_led.h header file
  mx23_olinuxino: Drop status-LED code
  vining_fpga: Drop status-LED code
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
 common/board_r.c                             |  16 -
 configs/eb_cpu5282_defconfig                 |   6 -
 configs/eb_cpu5282_internal_defconfig        |   6 -
 configs/mx23_olinuxino_defconfig             |   8 -
 configs/pinephone_defconfig                  |   5 -
 configs/socfpga_vining_fpga_defconfig        |  11 -
 doc/README.LED                               |  77 -----
 drivers/led/Kconfig                          | 342 +------------------
 drivers/misc/Kconfig                         |  13 -
 drivers/misc/Makefile                        |   3 -
 drivers/misc/gpio_led.c                      | 106 ------
 drivers/misc/pca9551_led.c                   | 170 ---------
 drivers/misc/status_led.c                    | 124 -------
 drivers/timer/mpc83xx_timer.c                |   5 -
 include/configs/eb_cpu5282.h                 |   6 -
 include/status_led.h                         | 102 ------
 net/bootp.c                                  |   7 -
 net/net.c                                    |  33 --
 33 files changed, 11 insertions(+), 1336 deletions(-)
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
