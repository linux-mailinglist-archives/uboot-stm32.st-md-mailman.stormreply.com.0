Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16654A9C9F7
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Apr 2025 15:17:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3B12C78F8C;
	Fri, 25 Apr 2025 13:17:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46B59C78F88
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 13:17:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P7e3cb018344;
 Fri, 25 Apr 2025 15:17:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=2moUp4asTjELZFIUy0Hu59
 ZpOwu8it7/XwNfcHyfNi8=; b=j5hQpLV6i7pSxbHuaPdISCINsEYluDQuUezpz/
 tBL7SDIV3qTlcB5oHpUl2bitBs6HmX2lljMy//0OZaMBeJ8WH0xUwpsOQIthtP17
 v4Hic5H8NpsFV6IgVryhvoe8MmmzTRVwPV5yB1M9p78MqytZmtCOmVmnwTejGkPb
 HhGlpKThhTsYD4ACLy45ycPgD4QX/Yp4zpkKcf37EXwqYKK+AgKyDdXt1SHQoL1W
 LnDJ1HUxjSP8M1SVO9+bYxKoamEuC0k11DeUA8rzpkZ2yrwKJwegRqgWuFjLlHnS
 sq1aS2G6UbTfvE62EcWmYr3jPWXxR1Uh6FFepgeG1gVVDYBw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjvc910-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 15:17:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B40D340060;
 Fri, 25 Apr 2025 15:16:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D1EF9118AA;
 Fri, 25 Apr 2025 15:15:36 +0200 (CEST)
Received: from localhost (10.252.18.92) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 15:15:35 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 25 Apr 2025 15:15:11 +0200
Message-ID: <20250425131533.392747-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.18.92]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 00/22] arm: stm32mp: STM32MP25 machine
	update
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


This series is updating STM32MP25 machine/board support:
  _ update cmd_stm32key.
  _ update cmd_stm32prog.
  _ update STM32MP25 configs.
  _ add leds and buttons support.
  _ add boot_mode support (USB/PXE/MMC/NOR/NAND).
  _ add bootcmd support.
  _ enable MMC support.

Currently, it misses clock,reset and regulator support for STM32MP25
which will be added in a next step due to dependencies with OP-TEE.
For example, due to OP-TEE dependencies, all MMC support is ready
but not functional.


Changes in v2:
  - Enable DISTRO_DEFAULT and BOOTCOMMAND flags

Patrice Chotard (14):
  configs: stm32mp25: add MMC support
  configs: stm32mp25: add bootcmd for stm32mp25 platform
  board: st: stm32mp2: add env_get_location()
  board: st: stm32mp2: add mmc_get_env_dev()
  ARM: dts: stm32: add "u-boot,mmc-env-partition" for
    stm32mp257f-ev1-u-boot
  configs: stm32mp25: add support of NAND and NOR boot
  configs: stm32mp25: add USB host boot support
  configs: stm32mp25: add PXE boot support
  ARM: dts: stm32: add sdmmc1 fixed clock for stm32mp257f-ev1-u-boot
  arm: stm32mp: increase EARLY_TLB_SIZE to 0x10000
  arm: stm32mp: disable console for UART serial boot
  arm: stm32mp: fix package IDs for stm32mp25
  arm: stm32mp: cmd_stm32key: update command for stm32mp25x
  configs: stm32mp25: enable DISTRO_DEFAULT and BOOTCOMMAND

Patrick Delaunay (8):
  arm: stm32mp: add boot_mode support for STM32MP25
  board: st: stm32mp2: add led support
  board: st: stm32mp2: add user button support
  board: st: stm32mp2: change bootcmd for ST boards
  arm: stm32mp: implement new STM32MP25 revision ID system
  arm: stm32mp: add helper function stm32mp_is_closed()
  arm: stm32mp: stm32prog: PTA BSEC is not supported on closed device
  arm: stm32mp: stm32prog: add support rootfs-a for OTA

 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi      |  16 +
 arch/arm/mach-stm32mp/cmd_stm32key.c          | 286 +++++++++++++++---
 arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig   |   2 +
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    |   6 +-
 arch/arm/mach-stm32mp/include/mach/stm32.h    |  16 +
 .../arm/mach-stm32mp/include/mach/sys_proto.h |  24 +-
 arch/arm/mach-stm32mp/stm32mp2/cpu.c          | 170 ++++++++++-
 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c   |  31 +-
 board/st/stm32mp2/Kconfig                     |   2 +-
 board/st/stm32mp2/MAINTAINERS                 |   1 +
 board/st/stm32mp2/stm32mp2.c                  | 140 ++++++++-
 configs/stm32mp25_defconfig                   |  32 +-
 include/configs/stm32mp25_common.h            | 102 +++++++
 include/configs/stm32mp25_st_common.h         |  51 ++++
 14 files changed, 811 insertions(+), 68 deletions(-)
 create mode 100644 include/configs/stm32mp25_st_common.h

-- 
2.25.1

base-commit: 9f0aa284eb916cec4d5ea93bade537c5c32c74cd
branch: upstream_STM32MP25_machine_update_v2
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
