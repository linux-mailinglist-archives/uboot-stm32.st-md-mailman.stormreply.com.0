Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAA852F083
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 18:25:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2798C03FD1;
	Fri, 20 May 2022 16:25:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4C48C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 16:25:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KFFgQ8004615;
 Fri, 20 May 2022 18:25:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=cJcK3VVy/7QDWLHbKlqPYa84AIhOs28i97G6lpapvvU=;
 b=FxiVFdTzRphhiKl9qaqxSyudOh/7FzgZNZoIZSW+xv9Pjya/jSzhsSTiCELBAcJB159K
 ICBj08QI4R7rJOyQdtx6hB/LXxNqWjelksfLsA0OwGeRKDQuBSV48jVVenRI6VaLwGuf
 jSZg6Il5EBIgS6Z1QgRofedf1D7SaWCwdNtNRWV2hlPJ7Ucrw9dC9aXx1VSoxUdwC+1M
 aJpkDOM9vIL+U8gAses/bts5rCbsQw4pGuKrUBs9gtBRJC4EylZcTaLTo72K8LkUMdXs
 /NlBzPA3vU68TB2MmukPr4IQD5q1WNBl6nzyuHQr8LAoe17TuoeQo4mbMtwOiu3rOROt qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23s257tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 18:25:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2E3810002A;
 Fri, 20 May 2022 18:25:10 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3F3223D411;
 Fri, 20 May 2022 18:25:10 +0200 (CEST)
Received: from localhost (10.75.127.44) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 18:25:09 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 20 May 2022 18:24:38 +0200
Message-ID: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@denx.de>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rayagonda
 Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Vikas Manocha <vikas.manocha@st.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Kamil Lulko <kamil.lulko@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Sinthu Raja <sinthu.raja@ti.com>, Dillon Min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 00/16] stm32mp: add STM32MP13x support
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


Changes in v2:
- fix commit message
- fix several typo issue in comments reported by Patrice and Marek
- fix typo in commit message
- fix typo error in commit message and in rst file

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
 doc/board/st/stm32mp1.rst                     | 183 +++++---
 .../memory-controllers/st,stm32mp1-ddr.txt    |  49 ++-
 drivers/mmc/stm32_sdmmc2.c                    |  14 +-
 drivers/pinctrl/pinctrl_stm32.c               |   1 +
 drivers/ram/stm32mp1/stm32mp1_ram.c           |  28 +-
 include/configs/stm32mp13_common.h            | 106 +++++
 include/configs/stm32mp13_st_common.h         |  17 +
 include/configs/stm32mp15_common.h            |   4 +-
 38 files changed, 1993 insertions(+), 584 deletions(-)
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
