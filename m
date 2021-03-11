Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3D7336C93
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Mar 2021 07:55:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15154C5718B;
	Thu, 11 Mar 2021 06:55:33 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29AD7C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 06:44:07 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id s7so9726237plg.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 22:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=jpFXg5tKy9goDSxfHFU4g7/Z/q4cY6jMSsbe2De7hXo=;
 b=b02h/YRR+mWutPYA0e/nJI4BCJTK2tEguQc+nKxmq2hTTIPIUHrO0Eu4NulAhGZ28M
 xbdEmQtb7AlrZI8bGZQnXTFRnV5C3xY5ervFFWdlqZi0GqcmJWMqlHTopmkIRaLhBnfk
 qI9tQ+KNFeK/Og9uckZ9d/6g41QOmeHzmOTr9emjNqKxrQhhTYEW7A4QT36VSS13ujUf
 wdYHfg4fdqJnmTGa2ZHgEo2Q949rcOiri3g1ltb3vTrDG6Nv7qPvjwwjFQ9p0VCbCgji
 kmYhVCO1rxbplfF4IuA/MYgCFnmcQk4/MyMGRJp8LrvB1WchREs5QBG+fOcFmecZLKDy
 eO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jpFXg5tKy9goDSxfHFU4g7/Z/q4cY6jMSsbe2De7hXo=;
 b=JLehQXS8Dq9To8q6fndqzNfVOPkrXaA2/pIbIWNduznQFy3IniOAhDiLioZqdTAIKt
 SvjtdbIsZMIsKQrQ9SfNzrCt8zjDIZyh/vaL+iLYnLUuAjcljvYF+zK62ToI6+SBgRxt
 dw/FmXBRQ8W5jBdHrHjxni8A49Z9083KXM2JEbZLom6tHCZF8xkENrVwRU/gc/BXNEwP
 sTi4CQTbyIYCahC55/wG0FmMVZ/SJE4+9QdcRdmTIg3Jkxv9W6dSbU+fiia3oaRpIVem
 vDBqbm/Dcv/0ubP7fCpe4gnX3qUih9pm6QsKY1deSOTpQ9Lac7wlDmoWU6bVuTMPZuKq
 F+mQ==
X-Gm-Message-State: AOAM533dyYen7lmT62ChwNshVgAbvTHGf4hT43r8q3zh4vMGEyWOWSrA
 HAHFoOBV4/8crRvqjMM3LlE=
X-Google-Smtp-Source: ABdhPJyv9eEGMyxU+ZAYjlECletaV7+btaE7bdzCBiL57fCknWs5wn38h9ciuI+Z7eIZqRHblNsXNg==
X-Received: by 2002:a17:90a:5b11:: with SMTP id
 o17mr7745652pji.32.1615445046527; 
 Wed, 10 Mar 2021 22:44:06 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id i17sm1446652pfq.135.2021.03.10.22.44.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Mar 2021 22:44:06 -0800 (PST)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Thu, 11 Mar 2021 14:43:56 +0800
Message-Id: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 11 Mar 2021 06:55:30 +0000
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH 0/4] Add rt-thread art-pi board support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

These patches aim to adds u-boot support on art-pi board.

the board resources:
- stm32h750xbh6 128k flash, 1024k sram
- 32MiB sdram
- 16MiB spi flash
- 8MiB qspi flash
- onboard wifi, bt, fm

the detail board information can be found at:
https://art-pi.gitee.io/website/

dillon min (4):
  ARM: dts: stm32: split sdram pin & timing parameter into specific
    board dts
  ARM: dts: stm32: Add RT-Thread art-pi board support
  board: Add rt-thread art-pi board support
  ram: stm32: fix strsep failed on read only memory

 arch/arm/dts/Makefile                        |   3 +-
 arch/arm/dts/stm32h7-u-boot.dtsi             |  95 --------
 arch/arm/dts/stm32h743.dtsi                  |   8 +
 arch/arm/dts/stm32h743i-disco-u-boot.dtsi    |  98 ++++++++
 arch/arm/dts/stm32h743i-eval-u-boot.dtsi     |  98 ++++++++
 arch/arm/dts/stm32h750-pinctrl.dtsi          | 319 +++++++++++++++++++++++++++
 arch/arm/dts/stm32h750.dtsi                  |   5 +
 arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi   |  81 +++++++
 arch/arm/dts/stm32h750i-art-pi.dts           |  75 +++++++
 arch/arm/mach-stm32/stm32h7/Kconfig          |   4 +
 board/st/stm32h750-art-pi/Kconfig            |  19 ++
 board/st/stm32h750-art-pi/MAINTAINERS        |   7 +
 board/st/stm32h750-art-pi/Makefile           |   6 +
 board/st/stm32h750-art-pi/stm32h750-art-pi.c |  58 +++++
 configs/stm32h750-art-pi_defconfig           |  51 +++++
 drivers/ram/stm32_sdram.c                    |   3 +
 include/configs/stm32h750-art-pi.h           |  48 ++++
 include/dt-bindings/memory/stm32-sdram.h     |   2 +
 18 files changed, 884 insertions(+), 96 deletions(-)
 create mode 100644 arch/arm/dts/stm32h750-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32h750.dtsi
 create mode 100644 arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32h750i-art-pi.dts
 create mode 100644 board/st/stm32h750-art-pi/Kconfig
 create mode 100644 board/st/stm32h750-art-pi/MAINTAINERS
 create mode 100644 board/st/stm32h750-art-pi/Makefile
 create mode 100644 board/st/stm32h750-art-pi/stm32h750-art-pi.c
 create mode 100644 configs/stm32h750-art-pi_defconfig
 create mode 100644 include/configs/stm32h750-art-pi.h

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
