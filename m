Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D40782DAEC
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 15:06:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2A49C6B457;
	Mon, 15 Jan 2024 14:06:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C76DC6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 14:06:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40FD9K8W001957; Mon, 15 Jan 2024 15:06:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=8eY7nKn
 r9IBrD9VQrU7vygOoAiO1M/PiLEOXM8K0nGM=; b=tXBB5MbsUwJbSSrENc+5rKq
 SrNPbv1E0shmdke4U/FI8WpFEvY/KUh0fxdK7bUD+o4IozuCHRPC+xkIaFnHDnhU
 n9HqlAbJRLkdBzXb/sdlotmcNw4bRISECW29v6R46/t3erLjr1zLqJnAIEnpqBAB
 Lti7y1RT4F32+ULYYldB6O8VwofjeB7Du7ka06+qsC/oo4G5o5V5NvT2krWu83Q6
 vLIBMnRzzH9zIFkWW8Rt1UHOZLoeUqgrElg0xv0WGaER0Ex3ttXgULLYtPT6392X
 /X11Gj35DZ+SQs8NTcm/kg/s77MlTS3nXjBs1Em2jOKPI55Ddr6BcixMG+GYcDw=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmddru0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 15:06:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77FE610002A;
 Mon, 15 Jan 2024 15:06:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 693EC29865B;
 Mon, 15 Jan 2024 15:06:04 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 15:06:04 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jan 2024 15:05:43 +0100
Message-ID: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Svyatoslav Ryhel <clamor95@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Hai Pham <hai.pham.ud@renesas.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Lukasz Majewski <lukma@denx.de>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 00/14] stm32: add bsec and OTP support to
	stm32mp25
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


Add BSEC support to STM32MP25 SoC family with SoC information:
- SERIAL number with UUID (BSEC_OTP_DATA5)
- RPN = Device part number (BSEC_OTP_DATA9)
- PKG = package data register (Bits 2:0 of BSEC_OTP_DATA122)

and with board information for STMicroelectronics boards
- BOARD identifier:  OTP246
- MAC address: OTP247 and after


Changes in v2:
- fix CONFIG name with 'x': TARGET_ST_STM32MP15x TARGET_ST_STM32MP13x
- add "arm: Rename STM32MP13x"
- add "arm: Rename STM32MP15x"

Patrice Chotard (1):
  stm32mp: add setup_serial_number for stm32mp25

Patrick Delaunay (12):
  arm64: dts: st: add bsec support to stm32mp25
  stm32mp: bsec: add driver data
  stm32mp: bsec: add support of stm32mp25
  configs: stm32mp25: add support of fuse command
  stm32mp: add soc.c file
  smt32mp: add setup_mac_address for stm32mp25
  stm32mp: stm32prog: add support of stm32mp25
  stm32mp: activate the command stboard for stm32mp25 boards
  board: st: stm32mp2: add checkboard
  board: st: stm32mp2: display the board identification
  arm: Rename STM32MP13x
  arm: Rename STM32MP15x

Yann Gautier (1):
  arm: stm32mp: add Rev.B support for STM32MP25

 arch/arm/dts/Makefile                         |   4 +-
 arch/arm/dts/stm32mp15-u-boot.dtsi            |   2 +-
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |   4 +-
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      |   4 +-
 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi      |   4 +-
 arch/arm/dts/stm32mp25-u-boot.dtsi            |   4 +
 arch/arm/dts/stm32mp251.dtsi                  |  16 +++
 arch/arm/mach-stm32mp/Kconfig                 |   8 +-
 arch/arm/mach-stm32mp/Kconfig.13x             |   4 +-
 arch/arm/mach-stm32mp/Kconfig.15x             |   6 +-
 arch/arm/mach-stm32mp/Makefile                |   5 +-
 arch/arm/mach-stm32mp/bsec.c                  |  45 +++++--
 arch/arm/mach-stm32mp/cmd_stm32key.c          |  20 +--
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  12 +-
 arch/arm/mach-stm32mp/include/mach/stm32.h    |  22 ++--
 .../arm/mach-stm32mp/include/mach/sys_proto.h |   1 +
 arch/arm/mach-stm32mp/soc.c                   | 118 ++++++++++++++++++
 arch/arm/mach-stm32mp/stm32mp1/Makefile       |   4 +-
 arch/arm/mach-stm32mp/stm32mp1/cpu.c          |  96 +-------------
 arch/arm/mach-stm32mp/stm32mp1/fdt.c          |  10 +-
 arch/arm/mach-stm32mp/stm32mp2/cpu.c          |  14 +--
 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c   |   3 +
 board/st/common/Kconfig                       |   2 +-
 board/st/common/cmd_stboard.c                 |   2 +
 board/st/stm32mp1/Kconfig                     |   4 +-
 board/st/stm32mp1/stm32mp1.c                  |   6 +-
 board/st/stm32mp2/stm32mp2.c                  |  37 ++++++
 configs/stm32mp13_defconfig                   |   4 +-
 configs/stm32mp15_basic_defconfig             |   2 +-
 configs/stm32mp15_defconfig                   |   2 +-
 configs/stm32mp15_trusted_defconfig           |   4 +-
 configs/stm32mp25_defconfig                   |   1 +
 drivers/clk/stm32/Kconfig                     |   4 +-
 33 files changed, 297 insertions(+), 177 deletions(-)
 create mode 100644 arch/arm/mach-stm32mp/soc.c

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
