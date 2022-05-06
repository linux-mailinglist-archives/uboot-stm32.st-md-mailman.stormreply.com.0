Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F8D51D9E5
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 16:06:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2C6EC628B1;
	Fri,  6 May 2022 14:06:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CCB3C628AB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 14:06:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246Bd1RM010864;
 Fri, 6 May 2022 16:06:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=VRQoHDkvmieQhRlSfKQGkznj3EpuDEpudgsammmdwhs=;
 b=N+/h98qVv/mx4hFjMnqVBSzbooFUkDGD/BMWE4cr4kVnIknyBCJtcAMSBXYxDIrx+KOU
 g185sHSSWPvRVo5tEiAqYXxvl7Q3KpO8F2/oGMOusra7zwiqjoSDyd+30nMKSzQHjDLn
 X9ZaBU8Ix7H80XAWVsSVtQ8pepLC2/H6nantnhspyjgAWM1oSrF4Vw9QR8iOWD//F9DJ
 RGM1u9RNP7WSjBe6sDrqYnAZaemzoFGZATFyJ6YZgPvxdqjbTexl8kDf+GqGHhzsR9jJ
 l0Rc7hj03MvIyBq9t0e2nDIjgIjWN+mBkFRX7jMmLFrtcKq3AVbmDnrL0oT8HTqF/A+c EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fvygu2cm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 16:06:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF71510002A;
 Fri,  6 May 2022 16:06:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F68F2194F2;
 Fri,  6 May 2022 16:06:26 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 6 May 2022 16:06:25
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 May 2022 16:06:07 +0200
Message-ID: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@denx.de>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Tim Harvey <tharvey@gateworks.com>
Subject: [Uboot-stm32] [PATCH 00/16] stm32mp: add STM32MP13x support
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


Add the minimal support of the new STM32MP13x in mach-stm32mp
to allow boot from SD Card.

STM32MP13x is a single Cortex-A7 MPU aimed at various applications.
The discovery board is supported with stm32mp13_defconfig and the
device tree stm32mp135f-dk.dts.

The supported boot sequence is:
- TF-A BL2
- OP-TEE
- U-Boot
- Linux Kernel

The console over UART and boot from SD Card is functional
with this serie.

The RCC driver, with support of reset and clock, is not yet provided
today and the SCMI is not yet activated in device tree as in Linux
kernel.



Patrick Delaunay (16):
  ARM: dts: stm32: add STM32MP13 SoCs support
  configs: stm32mp1: move SUPPORT_SPL in STM32MP15x
  arm: stm32mp: move the get_otp helper function in bsec
  arm: stm32mp: move code for STM32MP15x
  arm: stm32mp: add choice for STM32MP SOC family
  arm: stm32mp: add sub config Kconfig.15x
  arm: stm32mp: add CONFIG_STM32MP15_PWR
  arm: stm32mp: add support of STM32MP13x
  arm: stm32mp: support 2 MAC address for STM32MP13
  pinctrl: stm32: add support of STM32MP135
  board: stm32pm1: add stm32mp13 board support
  ram: stm32mp1: add support of STM32MP13x
  mmc: stm32_sdmmc2: make reset property optional
  arm: dts: stm32mp: add stm32mp13 device tree for U-Boot
  configs: add stm32mp13 defconfig
  doc: st: stm32mp1: add STM32MP13x support

 arch/arm/Kconfig                              |   1 -
 arch/arm/dts/Makefile                         |   3 +
 arch/arm/dts/stm32mp13-pinctrl.dtsi           | 123 ++++++
 arch/arm/dts/stm32mp13-u-boot.dtsi            |  91 ++++
 arch/arm/dts/stm32mp131.dtsi                  | 358 ++++++++++++++++
 arch/arm/dts/stm32mp133.dtsi                  |  37 ++
 arch/arm/dts/stm32mp135.dtsi                  |  12 +
 arch/arm/dts/stm32mp135f-dk-u-boot.dtsi       |  30 ++
 arch/arm/dts/stm32mp135f-dk.dts               |  57 +++
 arch/arm/dts/stm32mp13xc.dtsi                 |  17 +
 arch/arm/dts/stm32mp13xf.dtsi                 |  17 +
 arch/arm/mach-stm32mp/Kconfig                 | 146 ++-----
 arch/arm/mach-stm32mp/Kconfig.13x             |  57 +++
 arch/arm/mach-stm32mp/Kconfig.15x             | 135 ++++++
 arch/arm/mach-stm32mp/Makefile                |   5 +-
 arch/arm/mach-stm32mp/bsec.c                  |  17 +
 arch/arm/mach-stm32mp/cpu.c                   | 392 ++----------------
 arch/arm/mach-stm32mp/fdt.c                   |  11 +-
 arch/arm/mach-stm32mp/include/mach/stm32.h    |  26 ++
 .../arm/mach-stm32mp/include/mach/sys_proto.h |  34 +-
 arch/arm/mach-stm32mp/spl.c                   |   1 +
 arch/arm/mach-stm32mp/stm32mp13x.c            | 135 ++++++
 arch/arm/mach-stm32mp/stm32mp15x.c            | 350 ++++++++++++++++
 board/st/stm32mp1/Kconfig                     |  15 +
 board/st/stm32mp1/MAINTAINERS                 |   4 +
 board/st/stm32mp1/stm32mp1.c                  |  27 +-
 configs/stm32mp13_defconfig                   |  54 +++
 configs/stm32mp15_basic_defconfig             |   6 +-
 configs/stm32mp15_defconfig                   |   6 +-
 configs/stm32mp15_trusted_defconfig           |   8 +-
 doc/board/st/stm32mp1.rst                     | 181 +++++---
 .../memory-controllers/st,stm32mp1-ddr.txt    |  49 ++-
 drivers/mmc/stm32_sdmmc2.c                    |  14 +-
 drivers/pinctrl/pinctrl_stm32.c               |   1 +
 drivers/ram/stm32mp1/stm32mp1_ram.c           |  28 +-
 include/configs/stm32mp13_common.h            | 106 +++++
 include/configs/stm32mp13_st_common.h         |  17 +
 include/configs/stm32mp15_common.h            |   4 +-
 38 files changed, 1992 insertions(+), 583 deletions(-)
 create mode 100644 arch/arm/dts/stm32mp13-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp13-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp131.dtsi
 create mode 100644 arch/arm/dts/stm32mp133.dtsi
 create mode 100644 arch/arm/dts/stm32mp135.dtsi
 create mode 100644 arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp135f-dk.dts
 create mode 100644 arch/arm/dts/stm32mp13xc.dtsi
 create mode 100644 arch/arm/dts/stm32mp13xf.dtsi
 create mode 100644 arch/arm/mach-stm32mp/Kconfig.13x
 create mode 100644 arch/arm/mach-stm32mp/Kconfig.15x
 create mode 100644 arch/arm/mach-stm32mp/stm32mp13x.c
 create mode 100644 arch/arm/mach-stm32mp/stm32mp15x.c
 create mode 100644 configs/stm32mp13_defconfig
 create mode 100644 include/configs/stm32mp13_common.h
 create mode 100644 include/configs/stm32mp13_st_common.h

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
