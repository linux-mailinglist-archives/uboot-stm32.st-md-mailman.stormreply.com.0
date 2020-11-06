Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9823C2A9B72
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61B53C3FAE2;
	Fri,  6 Nov 2020 18:02:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A862C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6Hw7Uh013730; Fri, 6 Nov 2020 19:02:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Mg+EBuWmfNVZsUpj3K1XZFLmUOE1GSgOrXWTit/L0dQ=;
 b=0wZzwwmGE6v2stQUJmvUVvKTCR+rnurV9E3ai3CoqVryOJsB11F1nZslCGodg+LTkB0e
 BEJ0qhs1Xrpr8Al44oFCDrb7Wr5nXT48+FgTx8fLNq/wckdMXze0i6eG1vVHAdzLBzL+
 FZMAXpOWJRN+CKK3JDLf6yZRhcqZAhrvAvzD7j24NTGbng9oidLKGA69pBgoFRXIDbKw
 rvhT+7hVYT9YjQjTd/fHR+wZwjNfH4gRLRcsdjC1OP15aB68XoWdMx94Her5JqA4XVDo
 F2f8bHqArhhKnvB2z+YjyUV3YEehyc2FnmhrTHTa3TLP8KE2RDtpWYh/ZYXdbDoOTcU/ Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw1xg8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF4E210002A;
 Fri,  6 Nov 2020 19:02:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 98B6C24B21F;
 Fri,  6 Nov 2020 19:02:04 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:03
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:28 +0100
Message-ID: <20201106180201.31784-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Anatolij Gustschin <agust@denx.de>,
 Christophe Kerello <christophe.kerello@st.com>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Yannick Fertre <yannick.fertre@st.com>
Subject: [Uboot-stm32] [PATCH v2 00/33] stm32: enable logging features
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


V2 of previous patchset [1],
I just rebase the serie and solved the compilation issue.

This patch-set migrates several stm32 drivers to API compatible with
logging features (use dev_...() or log_...() function) and activate
the logging features in STM32MP15 boards.

The size of U-Boot increased by 37kB (851096 to 889592 on STM32MP157C-EV1
board for trusted defconfig) but the boot time don't change drastically.

For example on STM32MP157C-EV1 board, trusted boot

1/ Before LOG patchset

STM32MP> bootstage report
Timer summary in microseconds (9 records):
       Mark    Elapsed  Stage
          0          0  reset
    621,283    621,283  board_init_f
    800,946    179,663  board_init_r
  1,272,726    471,780  id=64
  1,298,092     25,366  id=65
  1,299,997      1,905  main_loop
  1,310,785     10,788  id=175

Accumulated time:
                57,678  dm_f
                69,883  dm_r

After this serie :

STM32MP> bootstage report
Timer summary in microseconds (9 records):
       Mark    Elapsed  Stage
          0          0  reset
    626,031    626,031  board_init_f
    806,187    180,156  board_init_r
  1,280,935    474,748  id=64
  1,306,580     25,645  id=65
  1,308,484      1,904  main_loop
  1,319,262     10,778  id=175

Accumulated time:
                57,763  dm_f
                69,843  dm_r

=> cost 9ms

2/ With LOG activated at level 8
   and bootstage info in __log() function)

+ CONFIG_LOG_MAX_LEVEL=8
+ CONFIG_LOG_DEFAULT_LEVEL=6

STM32MP> bootstage report
Timer summary in microseconds (10 records):
       Mark    Elapsed  Stage
          0          0  reset
    641,076    641,076  board_init_f
    829,569    188,493  board_init_r
  1,339,783    510,214  id=64
  1,372,315     32,532  id=65
  1,374,182      1,867  main_loop
  1,544,359    170,177  id=175

Accumulated time:
                25,087  log
                63,300  dm_f
                73,424  dm_r

=> cost is 70ms

3/ after log patchset [2], I gain 20ms

STM32MP> bootstage report
Timer summary in microseconds (10 records):
       Mark    Elapsed  Stage
          0          0  reset
    644,372    644,372  board_init_f
    827,695    183,323  board_init_r
  1,323,756    496,061  id=64
  1,354,157     30,401  id=65
  1,356,050      1,893  main_loop
  1,366,785     10,735  id=175

Accumulated time:
                24,837  log
                59,676  dm_f
                70,916  dm_r

PS: accumulated time is strange here

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=207758
[2] http://patchwork.ozlabs.org/project/uboot/list/?series=212739&state=*


Changes in v2:
- solve rebase conflict
- Add dm/device_compat.h
- Solve merge conflict
- Add dm/device_compat.h
- Add dm/device_compat.h
- Solve merge conflict
- Add dm/device_compat.h

Patrick Delaunay (33):
  arm: stm32mp: migrate trace to log macro
  arm: stm32mp: migrate cmd_stm32prog to log macro
  arm: stm32mp: bsec: migrate trace to log macro
  pinctrl: stm32: migrate trace to log macro
  gpio: stm32-gpio: migrate trace to dev and log macro
  remoproc: stm32: migrate trace to log macro
  ram: stm32: migrate trace to log macro
  ram: stm32mp1: migrate trace to dev or log macro
  mmc: stm32_sdmmc2: migrate trace to dev and log macro
  timer: stm32: migrate trace to log macro
  hwspinlock: stm32: migrate trace to log macro
  rtc: stm32: migrate trace to log macro
  watchdog: stm32mp: migrate trace to dev macro
  power: regulator: stm32-verfbuf: define LOG_CATEGORY
  misc: rcc: migrate trace to dev macro
  misc: rcc: keep the rcc device name for subnode
  clk: stm32mp1: migrate trace to dev and log macro
  clk: clk_stm32f: migrate trace to dev and log macro
  clk: clk_stm32h7: migrate trace to dev and log macro
  reset: stm32-reset: migrate trace to dev and log macro
  mailbox: stm32-ipcc: migrate trace to dev and log macro
  i2c: stm32f7_i2c: migrate trace to dev and log macro
  phy: stm32-usbphyc: migrate trace to dev and log macro
  spi: stm32_spi: migrate trace to dev and log macro
  spi: stm32_qspi: migrate trace to dev and log macro
  mtd: stm32_fmc2: migrate trace to dev and log macro
  memory: stm32-fmc2: migrate trace to dev and log macro
  serial: stm32: define LOG_CATEGORY
  video: stm32_ltdc: migrate trace to dev and log macro
  video: stm32_dsi: migrate trace to dev and log macro
  board: st: stm32mp1: migrate trace to dev and log macro
  board: st: common: migrate trace to dev and log macro
  configs: stm32mp15: enable LOG features

 arch/arm/mach-stm32mp/boot_params.c           |   8 +-
 arch/arm/mach-stm32mp/bsec.c                  |  38 +++--
 arch/arm/mach-stm32mp/cmd_stm32key.c          |   3 +-
 .../cmd_stm32prog/cmd_stm32prog.c             |   4 +-
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 112 ++++++-------
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   2 +-
 .../cmd_stm32prog/stm32prog_serial.c          |  24 +--
 .../cmd_stm32prog/stm32prog_usb.c             |  14 +-
 arch/arm/mach-stm32mp/cpu.c                   |  18 ++-
 arch/arm/mach-stm32mp/dram_init.c             |   8 +-
 arch/arm/mach-stm32mp/fdt.c                   |  17 +-
 arch/arm/mach-stm32mp/pwr_regulator.c         |   2 +
 arch/arm/mach-stm32mp/spl.c                   |  16 +-
 board/st/common/stm32mp_dfu.c                 |   3 +-
 board/st/common/stm32mp_mtdparts.c            |   5 +-
 board/st/common/stpmic1.c                     |   5 +-
 board/st/common/stusb160x.c                   |   2 +
 board/st/stm32mp1/stm32mp1.c                  | 134 ++++++++--------
 configs/stm32mp15_basic_defconfig             |   2 +
 configs/stm32mp15_trusted_defconfig           |   1 +
 drivers/clk/clk_stm32f.c                      |  39 ++---
 drivers/clk/clk_stm32h7.c                     |  70 +++++----
 drivers/clk/clk_stm32mp1.c                    | 147 +++++++++---------
 drivers/gpio/stm32_gpio.c                     |   4 +-
 drivers/hwspinlock/stm32_hwspinlock.c         |   2 +
 drivers/i2c/stm32f7_i2c.c                     |  74 ++++-----
 drivers/mailbox/stm32-ipcc.c                  |  16 +-
 drivers/memory/stm32-fmc2-ebi.c               |  30 ++--
 drivers/misc/stm32_rcc.c                      |  10 +-
 drivers/mmc/stm32_sdmmc2.c                    |  84 +++++-----
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        |  40 +++--
 drivers/phy/phy-stm32-usbphyc.c               |  18 ++-
 drivers/pinctrl/pinctrl_stm32.c               |  30 ++--
 drivers/power/regulator/stm32-vrefbuf.c       |   2 +
 drivers/ram/stm32_sdram.c                     |  10 +-
 drivers/ram/stm32mp1/stm32mp1_ddr.c           |  36 +++--
 drivers/ram/stm32mp1/stm32mp1_interactive.c   |   4 +-
 drivers/ram/stm32mp1/stm32mp1_ram.c           |  38 +++--
 drivers/ram/stm32mp1/stm32mp1_tests.c         |  19 ++-
 drivers/ram/stm32mp1/stm32mp1_tuning.c        | 124 +++++++--------
 drivers/remoteproc/stm32_copro.c              |   3 +-
 drivers/reset/stm32-reset.c                   |  13 +-
 drivers/rtc/stm32_rtc.c                       |   3 +
 drivers/serial/serial_stm32.c                 |   3 +
 drivers/spi/stm32_qspi.c                      |  46 +++---
 drivers/spi/stm32_spi.c                       |  31 ++--
 drivers/timer/stm32_timer.c                   |   2 +
 drivers/video/stm32/stm32_dsi.c               |  18 ++-
 drivers/video/stm32/stm32_ltdc.c              |  33 ++--
 drivers/watchdog/stm32mp_wdt.c                |   9 +-
 50 files changed, 732 insertions(+), 644 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
