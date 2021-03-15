Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCA733C440
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Mar 2021 18:33:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ED66C56632;
	Mon, 15 Mar 2021 17:33:27 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABF82C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 17:33:26 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id o16so3890557pgu.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 10:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TjcGLHYmTFaDOG44tdqmhaRUvcwQkOMn1gw1d4xYJnE=;
 b=oz6EmloO5r5ls/DQax5FtzkM1Ov369BNDNnzf39tv45h4JI+KMM4zjb0CRTPXviGGx
 KFodp04nZOM9yXCIVWqIgJcHLLcSv26luw8k96WB97Bk3KJ4twZMEQObxFvS9OUqj8//
 9/VK2n7Y34gE55UalX22mZ0nshxQr9lWViQrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TjcGLHYmTFaDOG44tdqmhaRUvcwQkOMn1gw1d4xYJnE=;
 b=iBsbxXBybAa153i49SmdZ2eIXCK6a5umxH5ldpI/xP+3sk5t6luTrSRdrJxt8gxz2f
 vThI9CAcZKOkUHcnh8FkuH5SQOvSjo1F4TSFssNWQJo3SDtDqi3h9fmOC5GBvHVzgWj4
 vg/GRj3hY0RpqqqO6fe+nlG15Zzlf0DqyPuzWMFGk5gDYagKWbFloA2Mh/xjADsKFODu
 Hls6PnV8BBRBDK+AviXH+3fqXTVW/g+U/28yAp/HLxv3+yKaOwqiTAThrRQg5vxmEO2g
 IgiVF4EWcQIq2k2FXhAFQjW2ceCmGVObc98ktUTTyeIT9KrRuk8CfEPLPdivirwYDMIf
 p9Bg==
X-Gm-Message-State: AOAM531xqJi+olDVIZQC47iM79FrJ86NCQHcZsZANsnRek47CtwpvYa8
 asQmdju11MJ9uKeszqRBYhqaxA==
X-Google-Smtp-Source: ABdhPJwLnX4zRvGc16c5uIgiTpbEwHLQ320A34xpdwN6SNSI2D6oD7Xs21sNlxsu/3OkxVkLPVy/sg==
X-Received: by 2002:a63:3182:: with SMTP id x124mr176548pgx.317.1615829605173; 
 Mon, 15 Mar 2021 10:33:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:6f76:4267:118b:2085])
 by smtp.gmail.com with ESMTPSA id y17sm227500pju.50.2021.03.15.10.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:33:24 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Mon, 15 Mar 2021 23:02:47 +0530
Message-Id: <20210315173256.103731-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v2 0/9] stm32: Add Engicam STM32MP1 SoM
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

Patch series for Engicam i.Core and MicroGEA SoM and it's
associated carrier board dts(i) support.

Changes for v2:
- add Linux dts commit ids in commit messages
- drop CONFIG_BOARD_EARLY_INIT_F
- order dts files in Makefile
- collect Patrice r-b

Any inputs?
Jagan.

Jagan Teki (9):
  ARM: dts: stm32: Add Engicam i.Core STM32MP1 SoM
  ARM: dts: stm32: Add Engicam i.Core STM32MP1 1X4Gb DDR3
  ARM: stm32: Imply SPL_SPI_LOAD
  board: stm32: Add Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit
  board: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0
  ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 Micro SoM
  ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 1X4Gb DDR3
  board: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 board
  board: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 7" OF

 arch/arm/dts/Makefile                         |   4 +
 .../stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi | 119 +++++++++++
 ...m32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi | 121 +++++++++++
 ...2mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi |  51 +++++
 .../stm32mp157a-icore-stm32mp1-ctouch2.dts    |  47 +++++
 ...mp157a-icore-stm32mp1-edimm2.2-u-boot.dtsi |  51 +++++
 .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   |  47 +++++
 .../stm32mp157a-icore-stm32mp1-u-boot.dtsi    | 146 +++++++++++++
 arch/arm/dts/stm32mp157a-icore-stm32mp1.dtsi  | 196 ++++++++++++++++++
 ...rogea-stm32mp1-microdev2.0-of7-u-boot.dtsi |  51 +++++
 ...157a-microgea-stm32mp1-microdev2.0-of7.dts | 154 ++++++++++++++
 ...-microgea-stm32mp1-microdev2.0-u-boot.dtsi |  51 +++++
 ...32mp157a-microgea-stm32mp1-microdev2.0.dts |  55 +++++
 .../stm32mp157a-microgea-stm32mp1-u-boot.dtsi | 118 +++++++++++
 .../dts/stm32mp157a-microgea-stm32mp1.dtsi    | 148 +++++++++++++
 arch/arm/mach-stm32mp/Kconfig                 |  54 ++++-
 board/engicam/stm32mp1/Kconfig                |  12 ++
 board/engicam/stm32mp1/MAINTAINERS            |  24 +++
 board/engicam/stm32mp1/Makefile               |  10 +
 board/engicam/stm32mp1/spl.c                  |  48 +++++
 board/engicam/stm32mp1/stm32mp1.c             | 125 +++++++++++
 ...stm32mp15-icore-stm32mp1-ctouch2_defconfig |  79 +++++++
 ...tm32mp15-icore-stm32mp1-edimm2.2_defconfig |  79 +++++++
 ...-microgea-stm32mp1-microdev2-of7_defconfig |  79 +++++++
 ...mp15-microgea-stm32mp1-microdev2_defconfig |  79 +++++++
 25 files changed, 1947 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi
 create mode 100644 arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi
 create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
 create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
 create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1.dtsi
 create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
 create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
 create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1.dtsi
 create mode 100644 board/engicam/stm32mp1/Kconfig
 create mode 100644 board/engicam/stm32mp1/MAINTAINERS
 create mode 100644 board/engicam/stm32mp1/Makefile
 create mode 100644 board/engicam/stm32mp1/spl.c
 create mode 100644 board/engicam/stm32mp1/stm32mp1.c
 create mode 100644 configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
 create mode 100644 configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
 create mode 100644 configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
 create mode 100644 configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
