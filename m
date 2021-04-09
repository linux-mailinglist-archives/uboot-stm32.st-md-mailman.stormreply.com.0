Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3694E35965A
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 09:28:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF743C56639;
	Fri,  9 Apr 2021 07:28:56 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C914FC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 07:28:54 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 mj7-20020a17090b3687b029014d162a65b6so4538570pjb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Apr 2021 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0x1eGrC1vykGd7fpRCIj4RoQp79KunIb6L6o6Zry7yQ=;
 b=W9fYPOPf0QVB/HIx7YMCODV5tN9Nl8k1MQkYIpVbMsxp3YdFTRLU4rTanPdFLx5x6o
 8/NkOc31elUlfnPJ6k9SJSktr0R/AFGK4+sU0IyDjsDZN/paHIAXrIof7uYPvubdsQ3s
 e5yH7QZgSo2ZAooEXwfpruXRhnXhhDNiDgO6eQ1atl1+5YWVJeyxhLA81nMx3eFowXni
 vcC3Y9ANgno+4rg79s61PZh7od4wFqh+QhIGTOe7+rnzZwVcqSJIzpQ5HvCPjKo8VDtB
 5kgyGqKSie+/SoQfqL1Y1sIjDiLWkfVcNOvjaHR0U9oP8KNSuektJzUN4cZZgLZR7iQv
 MdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0x1eGrC1vykGd7fpRCIj4RoQp79KunIb6L6o6Zry7yQ=;
 b=NEBjYcO2gpDemU9NnBpXfSu1qUr5tglSlTayO6k6CkwaGLM3cGo7K0+8RKNgmc+N2f
 FSGPVdmjReb0OUNkVeP5h58pSZsnQpcWytrPi57awVMqsjqHcUYac3Lh0pmSOuuylWGz
 XjeWGAVjU+3gaUkCkkC8rohT1HfNibfkNRWcnBlfUQzAgmmsfV48JLRaLVZzBmhEulZ6
 VLoK893Yd+vLxVENmOEZebJLZGrc4yh3m4CMhkDT5RShqMGo+ZkX9W35AAhATfJTNCpR
 3LAbOrV/t+sG2Ek2FuiY/WsDTviHGyJO3D830tZcncuQlSsd3WbmheYpyj81KJPlWJ44
 dyZw==
X-Gm-Message-State: AOAM5300eq/lLpoowZ5SA9kWFax3sdgaGtU7dsY4DbExUeUEK0bxLagG
 Z6CVYw08u+Bz7NMlzFjyQ7w=
X-Google-Smtp-Source: ABdhPJx2qA3yOkBIz6np2+PXjwLc3WxLZmtK+FMQ7d2NcZg3vN5zun4v3hZ4mkN5C9+xtwaeNINJqg==
X-Received: by 2002:a17:90a:7344:: with SMTP id
 j4mr12045472pjs.223.1617953333045; 
 Fri, 09 Apr 2021 00:28:53 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id j3sm1344432pfc.49.2021.04.09.00.28.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Apr 2021 00:28:52 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 sjg@chromium.org
Date: Fri,  9 Apr 2021 15:28:39 +0800
Message-Id: <1617953326-3110-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v5 0/7] Add rt-thread art-pi board support
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
changes in v5:
- remove "for STMicroelectronics." from Author(s) description

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
