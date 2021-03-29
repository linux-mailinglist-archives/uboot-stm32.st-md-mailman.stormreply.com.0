Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6560534C218
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Mar 2021 05:05:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0832BC5719C;
	Mon, 29 Mar 2021 03:05:03 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1833AC5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 03:04:59 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id s21so5334244pjq.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Mar 2021 20:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6+Wvlb71QTKfRe8VC6A3xB6OhW9ingJz5Q9jUmjWUBc=;
 b=myEEbu4oudvwBpk37Romv0YZ/RNB3lzHFF/RgPsiVDFmRO37ZpG7ULJmVpyS82IeU/
 jzA616IgSySw1dHfHdEaTXX1w+odz3k20hV8Px2llcSqRTuw+CV00EapO0XpGbrj5fe9
 apxqoVrOysXMDS+jsuDUekJklhFlhZat+xVbPUXo2QVmERBC5+m3ilBo9yvsZHVmPmLE
 2CxA20ELumu0PltM7oqmFBTUdc1hg3LekyKLeT4NEtHKlgkLBQQuWOeD6bgfFXUD2k0b
 oFtVmjRza874/VaVEvdIWRcd80DuJyD3uW8oHtQat+objgDlpFANTo0R10oPd/cHDpDK
 zz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6+Wvlb71QTKfRe8VC6A3xB6OhW9ingJz5Q9jUmjWUBc=;
 b=gdc66o5++KgRFxiF9YvDkSrlyDfbur1Wke9hrcsad7drI4GSKrDVyQPBFcuWPcLt6j
 wAJ1bidzCfQaHJZZ1K3Uz5E4djAoPXvR6uayFC9qgczlWF6mhRq8c4bnE6/ODvC1+Q7Z
 fUVrGa1Kl+ITzYxqNIDt4fX3B0HEXcTPor+wGZ83XWV9mwDxCDr2bTi0DKlaMXmkX/YH
 Y4eV27cX9mIlHGAnqVvGkh/Q2Tn0+pP9A/xWAk5OE/Xmyh87t3pmUvaOSza+opdgISCN
 knZsdrs2nME/bg3t6DPbH67V3uuDvrsy6IQ21tTy0qIB3dJ43cL/GXwF5X+xlqQeO2wy
 AhvA==
X-Gm-Message-State: AOAM530pqraS4tKQ0kZHSncq6MnZIWhwD4Oq3mKckJKd2NGJI7bOkhN2
 W0xOGsANbejzsNUMHi5O5Os=
X-Google-Smtp-Source: ABdhPJz7UVLjqa2DeSF5lGZNLl+Uf8QjbzTjW0tz/06mHjkel4ixgrLVDZWP/PZtM8OqcqUA5UfKzg==
X-Received: by 2002:a17:902:74c1:b029:e6:ef44:51ee with SMTP id
 f1-20020a17090274c1b02900e6ef4451eemr26395004plt.14.1616987097821; 
 Sun, 28 Mar 2021 20:04:57 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id a204sm15331914pfd.106.2021.03.28.20.04.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Mar 2021 20:04:57 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Mon, 29 Mar 2021 11:04:45 +0800
Message-Id: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 0/6] Add rt-thread art-pi board support
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

dillon min (6):
  ARM: dts: stm32: split sdram pin & timing parameter into specific
    board dts
  ARM: dts: stm32: Add RT-Thread art-pi board support
  board: Add rt-thread art-pi board support
  ram: stm32: fix strsep failed on read only memory
  dt-bindings: pinctrl: stm32: Add st,stm32h750-pinctrl for stm32h750
    soc
  pinctrl: stm32: Add st,stm32h750-pinctrl compatible string

 arch/arm/dts/Makefile                              |   3 +-
 arch/arm/dts/stm32h7-pinctrl.dtsi                  | 340 +++++++++++++++++++++
 arch/arm/dts/stm32h7-u-boot.dtsi                   | 100 +-----
 arch/arm/dts/stm32h743-pinctrl.dtsi                | 307 +------------------
 arch/arm/dts/stm32h743.dtsi                        | 168 +++++++++-
 arch/arm/dts/stm32h743i-disco-u-boot.dtsi          |  98 ++++++
 arch/arm/dts/stm32h743i-eval-u-boot.dtsi           |  98 ++++++
 arch/arm/dts/stm32h750-pinctrl.dtsi                |  11 +
 arch/arm/dts/stm32h750.dtsi                        |   5 +
 arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi         |  81 +++++
 arch/arm/dts/stm32h750i-art-pi.dts                 | 188 ++++++++++++
 arch/arm/mach-stm32/stm32h7/Kconfig                |   4 +
 board/st/stm32h750-art-pi/Kconfig                  |  19 ++
 board/st/stm32h750-art-pi/MAINTAINERS              |   7 +
 board/st/stm32h750-art-pi/Makefile                 |   6 +
 board/st/stm32h750-art-pi/stm32h750-art-pi.c       |  58 ++++
 configs/stm32h750-art-pi_defconfig                 |  51 ++++
 .../pinctrl/st,stm32-pinctrl.txt                   |   1 +
 drivers/pinctrl/pinctrl_stm32.c                    |   1 +
 drivers/ram/stm32_sdram.c                          |   3 +
 include/configs/stm32h750-art-pi.h                 |  48 +++
 include/dt-bindings/memory/stm32-sdram.h           |   2 +
 22 files changed, 1198 insertions(+), 401 deletions(-)
 create mode 100644 arch/arm/dts/stm32h7-pinctrl.dtsi
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
