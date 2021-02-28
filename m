Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F608327334
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Feb 2021 16:52:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 089D3C56630;
	Sun, 28 Feb 2021 15:52:44 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EE3BC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 15:52:42 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id l2so9856423pgb.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 07:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ugy2h0S1aGGXuTan78hJuvXs9Eh5q5BlSi9gEr5xyKU=;
 b=o/ZazXC02hS9XxOhAoWYnv8Ubo+xYw/HSFvlTtX3NcTP908yMnodinxTvyBoJ69I7B
 0YdfmgDPofyb3Qptrevn1hpFZRLDhreM1eyH27Y2rjQ/tTWdgcg/t1qe51a8oiisfZxe
 QJ46vItiH+45yBUODlZZrTFJrx/SOndn6LSYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ugy2h0S1aGGXuTan78hJuvXs9Eh5q5BlSi9gEr5xyKU=;
 b=ItnVufyZ128yGrMgKZaskJbsc0BnvGroRHEKd7YvRzNZruToC/B9z3JNogVVmwuVd1
 xXjAs2SavK9LNaLdfvE056WjHiwIHgKxWOmQCdR6UnqFMnN6m7cE9bWShMne8eUmxWcU
 01POnTMfK511FiSk4+wIbCs/smHz5URZRAiqkTKkTHDFNzbmCZZekR42TfUszLpZT6JQ
 1X5jKG2Stawq+7XOV2aAqgdrzNsipNuIba1bmKTvR+n8ULDdt1C6WWgsF2n65BVz63a0
 2wsxqahI092oWMgNy1B6uTKeYQSUAI2BaBkVLpRDr1OOmx/mIfAqSb44wzANQZrQHHjq
 fAEQ==
X-Gm-Message-State: AOAM532klQzvZGQXrNg8hzPPZrzyUxAsKN60tf21+nnhnCvqpCOgpJe4
 qVrkZNdvl3bugta9D/C+CyvpLQ==
X-Google-Smtp-Source: ABdhPJyqsSSch4y65Mys6a/9nL/fG4LSVPeKabM1g4aepITEjdB1mi2crM7akktyEODlEeMXcSzpmg==
X-Received: by 2002:a05:6a00:1a08:b029:1cd:404e:a70c with SMTP id
 g8-20020a056a001a08b02901cd404ea70cmr11401319pfv.33.1614527561005; 
 Sun, 28 Feb 2021 07:52:41 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id o18sm14725779pjq.44.2021.02.28.07.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 07:52:40 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Sun, 28 Feb 2021 21:22:17 +0530
Message-Id: <20210228155226.77904-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 0/9] stm32: Add Engicam STM32MP1 SoM
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

Patch series for Engicam i.Core and MicroGEA SoM and it's associated
carrier board dts(i) support.

patch 1: for i.Core STM32MP1 SoM dtsi

patch 2: i.Core DDR3 config

patch 3: for SPL_SPI_LOAD build fix

patch 4 - 5: i.Core STM32MP1 with EDIMM2.2 and C.Touch 2.0 carriers.

patch 6: for MicroGEA STM32MP1 Micro SoM dtsi

patch 7: MicroGEA DDR3 config

patch 8 - 9: MicroGEA STM32MP1 with MicroDev 2.0 and 7" OF carriers.

Note: dts(i) patches are Linux Mailing list.

Any inputs?
Jagan.

Jagan Teki (9):
  ARM: dts: stm32: Add Engicam i.Core STM32MP1 SoM
  ARM: dts: stm32: Add Engicam i.Core STM32MP1 1X4Gb DDR3
  ARM: stm32: Imply SPL_SPI_LOAD
  board: stm32: Add Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit
  board: stm32:  Add Engicam i.Core STM32MP1 C.TOUCH 2.0
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
 board/engicam/stm32mp1/stm32mp1.c             | 131 ++++++++++++
 ...stm32mp15-icore-stm32mp1-ctouch2_defconfig |  80 +++++++
 ...tm32mp15-icore-stm32mp1-edimm2.2_defconfig |  80 +++++++
 ...-microgea-stm32mp1-microdev2-of7_defconfig |  80 +++++++
 ...mp15-microgea-stm32mp1-microdev2_defconfig |  80 +++++++
 25 files changed, 1957 insertions(+), 1 deletion(-)
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
