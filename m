Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A8033AC59
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Mar 2021 08:35:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DE5BC56632;
	Mon, 15 Mar 2021 07:35:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFA04C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 07:35:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12F7S0o5006083; Mon, 15 Mar 2021 08:35:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : subject : to
 : cc : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=uK+8ajNbbcl91MbBsuBt0PSCtuh4hDbqJGsCZrq3fuA=;
 b=g0qoBpM60d9u0rE7Ct8d/QmiRSDR3D1iw+x1WswZSMTcKLL+9G6WH1WPzx8Z6kA2CSrC
 7adqBj9yc5ZRbai5Iqbw+Ul/JCv8TgoPFVDM7ZG+idlQ8Y6Oi2BUMSK00Mv5FrVysMns
 p279JHRQTNhZEIHvXURwnzGP0Aoz0DIIp8lAimGMeYiUIh05aw6m+41Ue/KMwMnuLkB6
 HwwMo+kbuJ9S63nmS+fzz9pkmC7vG1NydscRvVebr1piD6m7S3ZI3PennLKYkLS9yVcp
 HYEw5YrOtPs8m7zsU8Bm9IlckjX1Y16BgdhPKp2/lAbQ5XetC0Ah7RVjIPUJPhSJuolw iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 378pqksf88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 08:35:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A9FE100034;
 Mon, 15 Mar 2021 08:35:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 519D921FE86;
 Mon, 15 Mar 2021 08:35:50 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 15 Mar
 2021 08:35:49 +0100
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Message-ID: <47b59500-0dc8-7ae1-6042-1a2b55a40b79@foss.st.com>
Date: Mon, 15 Mar 2021 08:35:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_03:2021-03-15,
 2021-03-15 signatures=0
Cc: Marek Vasut <marex@denx.de>, Etienne CARRIERE <etienne.carriere@st.com>,
 "patrice.chotard@st.com" <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.07 =
 u-boot-stm32-20210312
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

Hi Tom

Please pull the STM32 related patches for u-boot/master, v2021.07: u-boot-stm32-20210312

CI status: https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/6732


he following changes since commit c5219c4a18f2b27547ecd799914f94e48b0fa86f:

  Prepare v2021.04-rc3 (2021-03-01 22:46:41 -0500)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20210312

for you to fetch changes up to b076cbe8aa2b3c29a3acc89fbea9fb7676f15fa7:

  doc: stm32mp1: Use u-boot.itb if CONFIG_SPL_LOAD_FIT=y (2021-03-12 15:25:55 +0100)

----------------------------------------------------------------
- Add WATCHDOG_RESET() in MTD framework and STM32 QSPI driver
- stm32mp1_trusted_defconfig rely on SCMI support
- Remove the nand MTD configuration for NOR boot in stm32mp1 board
- STM32programmer update
- Bsec: manage clock when present in device tree
- stm32mp15: move bootdelay configuration in defconfig
- Update for stm32 dsi and dw_mipi_dsi
- STM32 MCU's cleanup
- Fix compilation issue depending on SYS_DCACHE_OFF and SYS_ICACHE_OFF flags
- Update stm32mp1 doc

----------------------------------------------------------------
Etienne Carriere (2):
      ARM: dts: stm32mp1: explicit clock reference needed by RCC clock driver
      clk: stm32mp1: gets root clocks from fdt

Marek Vasut (1):
      doc: stm32mp1: Use u-boot.itb if CONFIG_SPL_LOAD_FIT=y

Patrice Chotard (7):
      mtd: spi-nor: Add WATCHDOG_RESET() in spi_nor_core callbacks
      spi: stm32_qspi: Add WATCHDOG_RESET in _stm32_qspi_read_fifo()
      mtd: nand: Add WATCHDOG_RESET() in nanddev_mtd_erase()
      mtd: spinand: Add WATCHDOG_RESET() in spinand_mtd_read/write()
      configs: stm32: Remove BOARD_EARLY_INIT_F and BOARD_LATE_INIT for stm32 boards
      board: st: Remove board_early_init_f and board_late_init callbacks for stm32 boards
      arm: stm32mp: Fix compilation issue when SYS_DCACHE_OFF and/or SYS_DCACHE_SYS are enabled

Patrick Delaunay (13):
      scmi: Include device_compat.h
      scmi: define LOG_CATEGORY
      scmi: cosmetic: reorder include files
      configs: stm32mp1_trusted_defconfig rely on SCMI support
      board: st: remove the nand MTD configuration for NOR boot in stm32mp1 board
      stm32mp: stm32prog: Add Kconfig file for stm32prog command
      stm32mp: stm32prog: Add CONFIG_CMD_STM32PROG_SERIAL and _USB
      stm32mp: stm32prog: reactivate console and display serial error
      stm32mp: stm32prog: replace alias by serial device sequence number
      stm32mp: bsec: manage clock when present in device tree
      configs: stm32mp15: move bootdelay configuration in defconfig
      video: stm32: remove all child of DSI bridge when its probe failed
      board: stm32mp1: use CONFIG_SYS_MMC_ENV_DEV when available

Yannick Fertre (2):
      video: dw_mipi_dsi: missing device to log debug
      video: dw_mipi_dsi: update log of dphy_enable

 arch/arm/dts/stm32mp151.dtsi                       |  4 ++
 arch/arm/mach-stm32mp/Kconfig                      | 18 +------
 arch/arm/mach-stm32mp/Makefile                     |  2 +-
 arch/arm/mach-stm32mp/bsec.c                       | 10 ++++
 arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig        | 34 ++++++++++++
 arch/arm/mach-stm32mp/cmd_stm32prog/Makefile       |  8 +--
 .../arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c |  4 +-
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h    | 23 +++++++-
 .../mach-stm32mp/cmd_stm32prog/stm32prog_serial.c  | 29 +++-------
 arch/arm/mach-stm32mp/cpu.c                        | 28 ++++++----
 board/st/common/stm32mp_dfu.c                      |  9 ++--
 board/st/common/stm32mp_mtdparts.c                 | 16 ++----
 board/st/stm32f429-discovery/stm32f429-discovery.c |  5 --
 .../st/stm32f429-evaluation/stm32f429-evaluation.c |  5 --
 board/st/stm32f469-discovery/stm32f469-discovery.c |  5 --
 board/st/stm32f746-disco/stm32f746-disco.c         |  5 --
 board/st/stm32h743-disco/stm32h743-disco.c         | 10 ----
 board/st/stm32h743-eval/stm32h743-eval.c           | 10 ----
 board/st/stm32mp1/stm32mp1.c                       |  8 ++-
 configs/stm32f429-discovery_defconfig              |  1 -
 configs/stm32f429-evaluation_defconfig             |  1 -
 configs/stm32f469-discovery_defconfig              |  1 -
 configs/stm32f746-disco_defconfig                  |  1 -
 configs/stm32f769-disco_defconfig                  |  2 -
 configs/stm32h743-disco_defconfig                  |  2 -
 configs/stm32h743-eval_defconfig                   |  2 -
 configs/stm32mp15_basic_defconfig                  |  2 +
 configs/stm32mp15_dhcom_basic_defconfig            |  1 +
 configs/stm32mp15_dhcor_basic_defconfig            |  1 +
 configs/stm32mp15_trusted_defconfig                |  4 ++
 doc/board/st/stm32mp1.rst                          | 16 ++++--
 drivers/clk/clk_stm32mp1.c                         | 62 ++++++++--------------
 drivers/firmware/scmi/mailbox_agent.c              |  4 +-
 drivers/firmware/scmi/sandbox-scmi_agent.c         |  2 +
 drivers/firmware/scmi/sandbox-scmi_devices.c       |  2 +
 drivers/firmware/scmi/scmi_agent-uclass.c          |  5 +-
 drivers/firmware/scmi/smccc_agent.c                |  3 ++
 drivers/firmware/scmi/smt.c                        |  2 +
 drivers/mtd/nand/core.c                            |  2 +
 drivers/mtd/nand/spi/core.c                        |  3 ++
 drivers/mtd/spi/spi-nor-core.c                     |  3 ++
 drivers/spi/stm32_qspi.c                           |  2 +
 drivers/video/dw_mipi_dsi.c                        |  9 ++--
 drivers/video/stm32/stm32_dsi.c                    |  3 ++
 include/configs/stm32mp1.h                         |  1 -
 45 files changed, 193 insertions(+), 177 deletions(-)
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
