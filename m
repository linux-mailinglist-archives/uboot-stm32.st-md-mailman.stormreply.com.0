Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF10D33D918
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 17:22:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82923C57B5A;
	Tue, 16 Mar 2021 16:22:24 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF178C56632
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 16:22:23 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id n10so22937937pgl.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 09:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=INmsnQxAq8g5OrJ9EkOyCLROnQhkLRWslWjBn0eWgHc=;
 b=qdr27dMfK08ik0YnWxLsccPJNQxb+Wv2TwuuuaTAurc02XTlHB+MbOM+uSmgHujTiS
 Dnm8S8p+ClgVnHDXuCe+XrGKmLj13S0/2DfamDSbxaeasK/tzVF2tzU1bB2IyLYDD0KQ
 My2aH4B1X62RVni+nmGpFBPVyO74jMM2OW0hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=INmsnQxAq8g5OrJ9EkOyCLROnQhkLRWslWjBn0eWgHc=;
 b=FAPNw3wA8ZTmomP9V/jWGr0qvKLlOouS0XQtHL6F+jeYuNW/UBTWAMWuuaMNenNneX
 oioU+Qn4te5HIKlB4IDiPIKJGvunG2bFHXbsAJGmKj6uV3hcRJFrq9ABBIWD/HbNonAM
 cWdHlmbP3kwtc/e9Jke+8XhEfmnGPdYMH2Fw7fwRTqFioPvRuXnHWSi6GIa4UtoJAtst
 vgQ2pMMYAzCbSc8oI/bzd8+cOVueMO3p6xKm5o+vfZ1rgM5LypwxgbvpMOLiAuuqEHG8
 mQz+jbDbNrkioQSDacxplXsjf06WgLR6+4b+/kEvhsm+xHP34uIu13iMlJFuaiTWbreX
 5RxA==
X-Gm-Message-State: AOAM533fP9k4LaVal94pC+urH6iXnskjObXMo6i+i9WLy1p/z5/ghubj
 5OaNnxNcnNqwa+3az0j7W85VkQ==
X-Google-Smtp-Source: ABdhPJxFFoqqDRZ0NvdsRzFsSSzhwKMU4X/yxJUolwyLriX/bZO4KgWK+XhtWX+XfkYX7PIEAD1mLA==
X-Received: by 2002:aa7:980a:0:b029:20c:5402:5de9 with SMTP id
 e10-20020aa7980a0000b029020c54025de9mr227094pfl.18.1615911742150; 
 Tue, 16 Mar 2021 09:22:22 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:9de:273e:6ee1:9865])
 by smtp.gmail.com with ESMTPSA id
 k27sm17678240pfg.95.2021.03.16.09.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 09:22:21 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Tue, 16 Mar 2021 21:51:59 +0530
Message-Id: <20210316162207.35641-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v3 0/8] stm32: Add Engicam STM32MP1 SoM
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

Changes for v3:
- collect Patrick Delaunay r-b
- fixed comments from Patrick Delaunay
Changes for v2:
- add Linux dts commit ids in commit messages
- drop CONFIG_BOARD_EARLY_INIT_F
- order dts files in Makefile
- collect Patrice r-b

Any inputs?
Jagan.

Jagan Teki (8):
  ARM: dts: stm32: Add Engicam i.Core STM32MP1 SoM
  ARM: dts: stm32: Add Engicam i.Core STM32MP1 1X4Gb DDR3
  ARM: stm32: Imply SPL_SPI_LOAD
  board: stm32: Add Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit
  board: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0
  ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 Micro SoM
  board: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 board
  board: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 7" OF

 arch/arm/dts/Makefile                         |   4 +
 .../stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi | 119 +++++++++++
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
 board/engicam/stm32mp1/MAINTAINERS            |  26 +++
 board/engicam/stm32mp1/Makefile               |  10 +
 board/engicam/stm32mp1/spl.c                  |  48 +++++
 board/engicam/stm32mp1/stm32mp1.c             | 125 +++++++++++
 ...stm32mp15-icore-stm32mp1-ctouch2_defconfig |  79 +++++++
 ...tm32mp15-icore-stm32mp1-edimm2.2_defconfig |  79 +++++++
 ...-microgea-stm32mp1-microdev2-of7_defconfig |  79 +++++++
 ...mp15-microgea-stm32mp1-microdev2_defconfig |  79 +++++++
 24 files changed, 1828 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi
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
