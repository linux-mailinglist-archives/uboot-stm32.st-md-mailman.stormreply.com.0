Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6C37D9BAF
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Oct 2023 16:40:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C98CBC6C841;
	Fri, 27 Oct 2023 14:40:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9D37C6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 14:40:56 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39RCPIj6010092; Fri, 27 Oct 2023 16:40:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=selector1; bh=OhraUJN0ELUIERLkVjMV
 X6CnKJzBJsW8cfBKwm8ysXk=; b=64Rz1w44sHbULUZh172R+LB3flnPMZjf5tCi
 58Y/1sDjKUklvZTEHSfbYV1g6EhZcofcoFiiuQ+JrFpKh14nyELJ9bGyTzGFEa0q
 jJOyRN0JBdl49KruEK0dHFt+YIgVahsViIAiRgnn8kHnA9v0d4DdYAgTEEHHf1OI
 ZlzKRA5ks6zG7VpJd6eaBPFqrYm6JLyOpbTskxRAt2/UySrRnWBr2UsA9LxZAeHf
 YP5EhvMbA7mVM5GtFXUJterSDXMz5+KMjZKlJLc7Pqtvu04adnjZcdGuRtvTlrsW
 wfSO+9fn6V6zDVUXKcmlQB4fD8CIf5POlyfbnJvIsof5pDCHvw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tywqq48xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 16:40:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB97E100062;
 Fri, 27 Oct 2023 16:40:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B951623D41E;
 Fri, 27 Oct 2023 16:40:28 +0200 (CEST)
Received: from localhost (10.201.20.38) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 27 Oct
 2023 16:40:28 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Oct 2023 16:39:53 +0200
Message-ID: <20231027144002.1001881-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_13,2023-10-27_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Johan Jonker <jbx6244@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH v1 0/9] Add STM32MP2 SoCs and STM32MP257F-EV
	board support
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


Add STM32MP257F Evaluation board support, it embeds a
STM32MP257FAI SoC, with 4GB of DDR4, TSN switch (2+1 ports),
2*USB typeA, 1*USB2 typeC, SNOR OctoSPI, mini PCIe, STPMIC2
for power distribution ...



Patrice Chotard (8):
  arm: caches: Make DCACHE_DEFAULT_OPTION accessible for ARM64 arch
  stm32mp: dram_init: Get RAM size from DT if no RAM driver found
  stm32mp: dram_init: Limit DDR usage under 4GB boundary for STM32MP
  stm32mp: bsec: Fix AARCH64 compilation warnings
  serial: stm32: Fix AARCH64 compilation warnings
  pinctrl: pinctrl_stm32: Add stm32mp2 support
  ARM: dts: stm32: Add STM32MP257F Evaluation board support
  stm32mp2: initial support

Patrick Delaunay (1):
  stm32mp: dram_init: Fix AARCH64 compilation warnings

 arch/arm/Kconfig                              |   2 +-
 arch/arm/dts/Makefile                         |   3 +
 arch/arm/dts/stm32mp25-pinctrl.dtsi           |  38 +++
 arch/arm/dts/stm32mp25-u-boot.dtsi            | 102 +++++++
 arch/arm/dts/stm32mp251.dtsi                  | 285 ++++++++++++++++++
 arch/arm/dts/stm32mp253.dtsi                  |  23 ++
 arch/arm/dts/stm32mp255.dtsi                  |   9 +
 arch/arm/dts/stm32mp257.dtsi                  |   9 +
 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi      |  20 ++
 arch/arm/dts/stm32mp257f-ev1.dts              |  55 ++++
 arch/arm/dts/stm32mp25xc.dtsi                 |   8 +
 arch/arm/dts/stm32mp25xf.dtsi                 |   8 +
 arch/arm/dts/stm32mp25xxai-pinctrl.dtsi       |  83 +++++
 arch/arm/dts/stm32mp25xxak-pinctrl.dtsi       |  71 +++++
 arch/arm/dts/stm32mp25xxal-pinctrl.dtsi       |  71 +++++
 arch/arm/include/asm/system.h                 |  16 +-
 arch/arm/mach-stm32mp/Kconfig                 |  26 +-
 arch/arm/mach-stm32mp/Kconfig.25x             |  43 +++
 arch/arm/mach-stm32mp/Makefile                |  15 +-
 arch/arm/mach-stm32mp/bsec.c                  |  29 +-
 arch/arm/mach-stm32mp/dram_init.c             |  17 +-
 arch/arm/mach-stm32mp/include/mach/stm32.h    | 141 +++++----
 .../arm/mach-stm32mp/include/mach/sys_proto.h |  26 ++
 arch/arm/mach-stm32mp/stm32mp1/Makefile       |  20 ++
 arch/arm/mach-stm32mp/{ => stm32mp1}/cpu.c    |   0
 arch/arm/mach-stm32mp/{ => stm32mp1}/fdt.c    |   0
 arch/arm/mach-stm32mp/{ => stm32mp1}/psci.c   |   0
 .../{ => stm32mp1}/pwr_regulator.c            |   0
 arch/arm/mach-stm32mp/{ => stm32mp1}/spl.c    |   0
 .../mach-stm32mp/{ => stm32mp1}/stm32mp13x.c  |   0
 .../mach-stm32mp/{ => stm32mp1}/stm32mp15x.c  |   0
 arch/arm/mach-stm32mp/{ => stm32mp1}/tzc400.c |   0
 arch/arm/mach-stm32mp/stm32mp2/Makefile       |   9 +
 arch/arm/mach-stm32mp/stm32mp2/arm64-mmu.c    |  68 +++++
 arch/arm/mach-stm32mp/stm32mp2/cpu.c          | 108 +++++++
 arch/arm/mach-stm32mp/stm32mp2/fdt.c          |  16 +
 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c   | 194 ++++++++++++
 arch/arm/mach-stm32mp/syscon.c                |   4 +-
 board/st/stm32mp2/Kconfig                     |  13 +
 board/st/stm32mp2/MAINTAINERS                 |   9 +
 board/st/stm32mp2/Makefile                    |   6 +
 board/st/stm32mp2/stm32mp2.c                  |  52 ++++
 configs/stm32mp25_defconfig                   |  52 ++++
 drivers/pinctrl/pinctrl_stm32.c               |   2 +
 drivers/serial/serial_stm32.c                 |  23 +-
 drivers/serial/serial_stm32.h                 |   2 +-
 include/configs/stm32mp25_common.h            |  24 ++
 include/dt-bindings/pinctrl/stm32-pinfunc.h   |   3 +
 48 files changed, 1597 insertions(+), 108 deletions(-)
 create mode 100644 arch/arm/dts/stm32mp25-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp25-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp251.dtsi
 create mode 100644 arch/arm/dts/stm32mp253.dtsi
 create mode 100644 arch/arm/dts/stm32mp255.dtsi
 create mode 100644 arch/arm/dts/stm32mp257.dtsi
 create mode 100644 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp257f-ev1.dts
 create mode 100644 arch/arm/dts/stm32mp25xc.dtsi
 create mode 100644 arch/arm/dts/stm32mp25xf.dtsi
 create mode 100644 arch/arm/dts/stm32mp25xxai-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp25xxak-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp25xxal-pinctrl.dtsi
 create mode 100644 arch/arm/mach-stm32mp/Kconfig.25x
 create mode 100644 arch/arm/mach-stm32mp/stm32mp1/Makefile
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/cpu.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/fdt.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/psci.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/pwr_regulator.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/spl.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/stm32mp13x.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/stm32mp15x.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/tzc400.c (100%)
 create mode 100644 arch/arm/mach-stm32mp/stm32mp2/Makefile
 create mode 100644 arch/arm/mach-stm32mp/stm32mp2/arm64-mmu.c
 create mode 100644 arch/arm/mach-stm32mp/stm32mp2/cpu.c
 create mode 100644 arch/arm/mach-stm32mp/stm32mp2/fdt.c
 create mode 100644 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
 create mode 100644 board/st/stm32mp2/Kconfig
 create mode 100644 board/st/stm32mp2/MAINTAINERS
 create mode 100644 board/st/stm32mp2/Makefile
 create mode 100644 board/st/stm32mp2/stm32mp2.c
 create mode 100644 configs/stm32mp25_defconfig
 create mode 100644 include/configs/stm32mp25_common.h

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
