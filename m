Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE270352783
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Apr 2021 10:42:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70505C58D60;
	Fri,  2 Apr 2021 08:42:50 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A7BAC58D5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Apr 2021 08:42:49 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso2291770pjh.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Apr 2021 01:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=GaCAW5XLqvm44v5M5otcm8HJlBnR/yTWmP2hYO0aAqs=;
 b=sWvzFqT8mg+sT7eiYnKFKkiUkNGrjJdmt+Tdlxf1XJoby/6mLu2DwO/Wc3FcDUQAnq
 UDbF7qaEe1FbZhJhhmPEAPuwo4j+tYVnvAf6ozGbigOJI1Q5C/+WWiaJGhxD/hYSiHIJ
 thKCZB9um7LxNkZ2xCGKk+FVNFBUPa1gvMWPFrM9u3EORDZILscH975wTenFK+IYzX/2
 t3IXgVquf8jPgzNrKZyOv/RY3cEccH5nhAw8Yxpy/lxmVjzKgER1NwDBDuphrOtKIT/y
 WlFUGrhIBn9Rfqu9iYmhfN5h4+OTz3HQIjGIAkPbMrjo3qdqPssSrN2/+xCU305nJ1hL
 7IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GaCAW5XLqvm44v5M5otcm8HJlBnR/yTWmP2hYO0aAqs=;
 b=JCSV0/V6xPfgAKuWJeGVMcMoNXqIoMlrGoaHCoKXoClz3Q+4C03F3VydSL7qX7vEYb
 mEwAWLBtnD5tzbRPnvZWCjhLy3Mg+wuCZ9aDv1dqxMzpf6ZTcYaQmn/lj0jvZcPQ6H85
 n6qmn5Pk1bRH02lsI8CW5irVrWEhz98CFdR9aIkNKMYc0uh9jdRUVHB7QWaB5ADwR44C
 FRbutt8eQMFXv2HXbE+und1vqMdnxUZJ1Gp6O3cHHEX5ztAPR7FNU1me5w0yQ5JM9WPM
 wyzOPgMIDJtEOm2NY7cyp7V79UK/N7E8osXDUvQ+LhboYCq2VvSFtGi5C5psN9kOjywM
 WLjA==
X-Gm-Message-State: AOAM532ZE+pUVjgGfqMBABW83om2yLKiQ2sBbIY/PzfDF2EVIGPG/cR1
 KwGh7iizlAcFKPxu5lEWYbU=
X-Google-Smtp-Source: ABdhPJxJA7TxWW18tTc77PrB/cOjBDZGxKUUX8FYu20hIEo2CPtRx8cakjHe7ZQZL7U4RP0wDDxwIA==
X-Received: by 2002:a17:90a:a503:: with SMTP id
 a3mr12826127pjq.235.1617352967943; 
 Fri, 02 Apr 2021 01:42:47 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id fs9sm7359708pjb.40.2021.04.02.01.42.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Apr 2021 01:42:47 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 sjg@chromium.org
Date: Fri,  2 Apr 2021 16:42:34 +0800
Message-Id: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v4 0/7] Add rt-thread art-pi board support
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

---
changes in v4:
- sync with kernel side device tree submit
- use strlcpy in stm32_sdram.c
- update CONFIG_BOOTARGS, remove rdinit=/linuxrc, to use kernel's devtmpfs
- remove unused st,stm32h750-pinctrl from patch v3

changes in v3:
two mirror changes in [PATCH v3 2/6], others same to version 2
- remove "for STMicroelectronics." from arch/arm/dts/stm32h750-pinctrl.dtsi
- correct misspelling parameters
you can found detail patch v2 information at link:
https://patchwork.ozlabs.org/project/uboot/list/?series=236009

changes in v2:
- fix wrong author/date in previous submit
- sync with kernel device tree files
- add st,stm32h750-pinctrl in doc and pinctrl driver

*** BLURB HERE ***

dillon min (7):
  ARM: dts: stm32: split sdram pin & timing parameter into specific
    board dts
  ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to support stm32h750
  ARM: dts: stm32: add new instances for stm32h743 MCU
  ARM: dts: stm32: fix i2c node typo in stm32h743, update dmamux1
    register
  ARM: dts: stm32: add support for art-pi board based on stm32h750xbh6
  ram: stm32: fix strsep failed on read only memory
  board: Add rt-thread art-pi board support

 arch/arm/dts/Makefile                        |   3 +-
 arch/arm/dts/stm32h7-pinctrl.dtsi            | 274 ++++++++++++++++++++++++
 arch/arm/dts/stm32h7-u-boot.dtsi             | 100 +--------
 arch/arm/dts/stm32h743-pinctrl.dtsi          | 306 ---------------------------
 arch/arm/dts/stm32h743.dtsi                  | 178 +++++++++++++++-
 arch/arm/dts/stm32h743i-disco-u-boot.dtsi    |  98 +++++++++
 arch/arm/dts/stm32h743i-disco.dts            |   2 +-
 arch/arm/dts/stm32h743i-eval-u-boot.dtsi     |  98 +++++++++
 arch/arm/dts/stm32h743i-eval.dts             |   2 +-
 arch/arm/dts/stm32h750.dtsi                  |   5 +
 arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi   |  81 +++++++
 arch/arm/dts/stm32h750i-art-pi.dts           | 188 ++++++++++++++++
 arch/arm/mach-stm32/stm32h7/Kconfig          |   4 +
 board/st/stm32h750-art-pi/Kconfig            |  19 ++
 board/st/stm32h750-art-pi/MAINTAINERS        |   7 +
 board/st/stm32h750-art-pi/Makefile           |   6 +
 board/st/stm32h750-art-pi/stm32h750-art-pi.c |  58 +++++
 configs/stm32h750-art-pi_defconfig           |  51 +++++
 drivers/ram/stm32_sdram.c                    |   3 +
 include/configs/stm32h750-art-pi.h           |  48 +++++
 include/dt-bindings/memory/stm32-sdram.h     |   2 +
 21 files changed, 1126 insertions(+), 407 deletions(-)
 create mode 100644 arch/arm/dts/stm32h7-pinctrl.dtsi
 delete mode 100644 arch/arm/dts/stm32h743-pinctrl.dtsi
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
