Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B101896E9
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:25:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D71AC36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:25:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59AB2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:25:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8IJxx021557; Wed, 18 Mar 2020 09:25:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=WHQWVKuh7ji9ILitiCtX1PZYqNWrVEu2rzSM8Qu9lWE=;
 b=FZ14b3u0pewVd5D9mDi0VIxrqB7MM1FgZLhDS9275FWATvPzOrGfJPP10VcAFIJybW2V
 Gs82ofYUGcFhwT+9m30P9g7YgZmOnjMemPkYksOAy34o9S0CppqVUM0f26Bf1cWCR4gv
 DiSk3hlceVAEZXOCnfnCUTgIORI7dOUTSBHsGL2JsvcwVPFHQLJ1K9B0msJxeyk6IV4B
 2jotsVnCEC6x21PImd5JsmreiMD101RxvtmzojVxhm2fL8G7zywREgpyjxQkb8SPLlzj
 EXNDit/857U8L6++5HJp1qR3itfEiXEfEhUXVfYOCPBv4YARzJ595jNlEg60xbQRwGjv CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95uj38y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:25:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 355BE100038;
 Wed, 18 Mar 2020 09:25:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2026E21CA95;
 Wed, 18 Mar 2020 09:25:06 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:25:05 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:24:45 +0100
Message-ID: <20200318082503.8025-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: Marek Vasut <marex@denx.de>, Brad Campbell <bradjc5@gmail.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [Uboot-stm32] [PATCH 00/18] stm32mp1: add command stm32prog
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


Add a specific command stm32prog for STM32MP soc family
witch allows to update the devices on the board with the
STMicroelectronics tool STM32CubeProgrammer
(http://www.st.com/STM32CubeProg).

This command use the same UART STM32 protocol than MCU STM32
with or USB with DFU protocol v1.1 (MCU ST extension are no supported).

The executed actions are based on a tab separated value file
with a stm32 header (see
https://wiki.st.com/stm32mpu/wiki/STM32CubeProgrammer_flashlayout).

This FlashLayout file is loaded in DDR by TF-A during during a
serial boot or in a virtual device by stm32prog command
and is parsed by U-Boot (see "AN5275: USB DFU/USART protocols used
in STM32MP1 Series bootloaders" for details).

Regards
Patrick



Patrick Delaunay (18):
  usb: gadget: g_dnl: add function g_dnl_set_product
  dfu: add prototype for dfu_transaction_initiate/cleanup
  stm32mp: add function get_cpu_dev
  stm32mp: add the command stm32prog
  stm32mp: stm32prog: add flash layout parsing
  stm32mp: stm32prog: add MMC device
  stm32mp: stm32prog: add support of boot partition for eMMC device
  stm32mp: stm32prog: add upport of partial update
  stm32mp: stm32prog: add MTD devices support
  stm32mp: stm32prog: adapt the MTD partitions
  stm32mp: stm32prog: add support of ssbl copy
  stm32mp: stm32prog: add support for delete option in flashlayout
  stm32mp: stm32prog: add otp update support
  stm32mp: stm32prog: add pmic NVM update support
  stm32mp: stm32prog: add serial link support
  stm32mp: stm32prog: enable videoconsole
  stm32mp: stm32prog: support for script
  stm32mp: stm32prog: add support of RAM target

 arch/arm/mach-stm32mp/Kconfig                 |   17 +
 arch/arm/mach-stm32mp/Makefile                |    1 +
 arch/arm/mach-stm32mp/cmd_stm32prog/Makefile  |    9 +
 .../cmd_stm32prog/cmd_stm32prog.c             |  192 ++
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 1745 +++++++++++++++++
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  185 ++
 .../cmd_stm32prog/stm32prog_serial.c          |  993 ++++++++++
 .../cmd_stm32prog/stm32prog_usb.c             |  230 +++
 arch/arm/mach-stm32mp/cpu.c                   |   11 +-
 .../arm/mach-stm32mp/include/mach/stm32prog.h |   16 +
 .../arm/mach-stm32mp/include/mach/sys_proto.h |    5 +
 board/st/common/stm32mp_dfu.c                 |   20 +
 board/st/common/stm32mp_mtdparts.c            |   14 +-
 configs/stm32mp15_basic_defconfig             |    7 +-
 configs/stm32mp15_trusted_defconfig           |    7 +-
 drivers/usb/gadget/g_dnl.c                    |    8 +
 include/dfu.h                                 |    3 +
 include/g_dnl.h                               |    1 +
 18 files changed, 3445 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/Makefile
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
 create mode 100644 arch/arm/mach-stm32mp/include/mach/stm32prog.h

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
