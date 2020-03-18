Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 131B71896C7
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:23:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA3A5C36B11
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:23:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27C81C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:23:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8IeM6014450; Wed, 18 Mar 2020 09:22:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=FB2XsivTgdNdvVHeF7HWDNkRKRfJLRjhHSVzAb4dPFM=;
 b=HWXf+rLhT30WmIdECdvT6nwGRULbO/Lhav5Lf35pUhyJC5lgfeoYO4jjYdtDdTm5vwmi
 J/g3gsTHRBOeo/nYRHVrFF1gUb/tbJrOdKXOhdxliVCuydpj0pIl6aXpWMKLnU3XjMyW
 6uoo49OGF0jxs925TP2QFoLuZwehUNiah7mTQEF4yrho6xYN/7NXyq2d//KA7+KXFeqr
 nR0i3lqTZIyaUjTUswtmALeSTQWPU0JbaInOQkQ6nP7xcbs6101oOJbZ1fgPgr9z+vnI
 LXWbl16fCxGzrqxdMz70x0sHLuAc6WE3FryqVcROAXaIzxOCVO7jxXBaO9Gq+Vyxr/A+ MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu6xdam59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:22:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07BE4100038;
 Wed, 18 Mar 2020 09:22:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DA00221CA90;
 Wed, 18 Mar 2020 09:22:56 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:22:56 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:22:43 +0100
Message-ID: <20200318082254.7522-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: Marek Vasut <marex@denx.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 00/11] stm32mp1: migrate MTD and DFU
	configuration in Kconfig
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


This serie migrate the dynamically build MTD (CONFIG_SYS_MTDPARTS_RUNTIME)
and the DFU configuration (CONFIG_SET_DFU_ALT_INFO)
previously based on ENV variables to CONFIG_.

These patches reduce the size of the environment and allow to tune
for each target with a specific defconfig file.

This serie also removes the TEE deconfig, replaced by a dynamic
detection based on op-tee driver probe.

This serie depends on previous CONFIG migration proposed in
http://patchwork.ozlabs.org/project/uboot/list/?series=160899
- configs: migrate CONFIG_SET_DFU_ALT_INFO to defconfigs
- configs: migrate CONFIG_SYS_MTDPARTS_RUNTIME to defconfigs



Patrick Delaunay (11):
  board: stm32mp1: move board_get_mtdparts in st common directory
  board: stm32mp1: move set_dfu_alt_info in st common directory
  stm32mp1: dynamically build DFU_ALT_INFO
  stm32mp1: move MTDPART configuration in Kconfig
  board: stm32mp1: reserve memory for OP-TEE in device tree
  stm32mp1: dynamically detect op-tee presence
  board: stm32mp1: use FDT address provided by TF-A at boot time
  configs: stm32mp1: remove optee defconfig
  board: stm32mp1: support boot from spi-nand
  board: stm32mp1: adapt MTD partition for BOOT from NOR or NAND
  doc: stm32mp1: update DFU support example

 arch/arm/dts/stm32mp157a-dk1.dts           |   5 +
 arch/arm/dts/stm32mp157c-ed1.dts           |   5 +
 arch/arm/mach-stm32mp/Kconfig              |  10 -
 arch/arm/mach-stm32mp/Makefile             |   1 +
 arch/arm/mach-stm32mp/boot_params.c        |  45 ++++
 arch/arm/mach-stm32mp/cpu.c                |   4 +
 arch/arm/mach-stm32mp/dram_init.c          |  18 ++
 arch/arm/mach-stm32mp/fdt.c                |  25 ++
 arch/arm/mach-stm32mp/include/mach/stm32.h |   3 +
 arch/arm/mach-stm32mp/spl.c                |   2 +
 board/dhelectronics/dh_stm32mp1/Kconfig    |   1 +
 board/dhelectronics/dh_stm32mp1/Makefile   |   3 +
 board/dhelectronics/dh_stm32mp1/board.c    | 143 +-----------
 board/st/common/Kconfig                    |  64 ++++++
 board/st/common/Makefile                   |   5 +
 board/st/common/stm32mp_dfu.c              | 225 ++++++++++++++++++
 board/st/common/stm32mp_mtdparts.c         | 157 +++++++++++++
 board/st/stm32mp1/MAINTAINERS              |   1 -
 board/st/stm32mp1/stm32mp1.c               | 253 +--------------------
 configs/stm32mp15_optee_defconfig          | 132 -----------
 configs/stm32mp15_trusted_defconfig        |   3 +
 doc/board/st/stm32mp1.rst                  | 147 +++++-------
 include/configs/stm32mp1.h                 |  64 +-----
 23 files changed, 634 insertions(+), 682 deletions(-)
 create mode 100644 arch/arm/mach-stm32mp/boot_params.c
 create mode 100644 board/st/common/stm32mp_dfu.c
 create mode 100644 board/st/common/stm32mp_mtdparts.c
 delete mode 100644 configs/stm32mp15_optee_defconfig

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
