Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E8728378
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jun 2023 17:17:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38B54C65E58;
	Thu,  8 Jun 2023 15:17:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 245FDC65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 15:17:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358DZbgU007586; Thu, 8 Jun 2023 17:16:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=e3yya2jyuWPoWk7i05mukKOdao/z4LuM6uItdp9PmXs=;
 b=0TzXqOHnrg0EIUH/4eqLId5NEdlXqWTPf/u+mnxiemsQX+QcIgafxqh4zZ1121yFrKVN
 7/bRlB5jYLI5Sl/rtDsx6Ol3GAdpvsvzowYr5o3hczlJT6HXmfJoRnPATqdbxDcBIsDv
 yZDNjhMbqFVs2k0zB6VDRnd5eB6r4v9RJg+OclKe2J3T5dXQQDkgQlalv5C/G12tJA1w
 QJpXYecPm87lSMvXyPJs40SXCoBvyi96DMSNtVn/yBom1pVp8Es+1HxCrPrCklDToJEc
 ABgjSY2pkXpVyzBuIjH1yJs3tpV7WjTcJ0t1WYQ6TYiXCNrCznK4sNclQQb052XKEMfp Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3cax2ahh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 17:16:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B1C710002A;
 Thu,  8 Jun 2023 17:16:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3261B21A231;
 Thu,  8 Jun 2023 17:16:53 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 17:16:52 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jun 2023 17:16:36 +0200
Message-ID: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_11,2023-06-08_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 00/12] stm32mp1: use U-Boot device tree to
	configure MTD partitions
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


Add the MTD partitions subnode in U-Boot device tree for all stm32mp13
and stm32mp15 boards and no more rely on mtdids and mtdparts variables
or CONFIG_SYS_MTDPARTS_RUNTIME.

When these variables are absent, the required OF fallback is performed in
mtd_probe_devices() with commit dc339bf784f0 ("mtd: add support for parsing
partitions defined in OF").

To allow dynamically configuration of MTD partitioning for Linux kernel,
the MTD partitioning is only defined in U-Boot device tree and copied
in Linux kernel device tree.

This serie also disable CMD_MTDPARTS as it is strongly encouraged to
no more use this command.

Marek, I modify the dhcom/dhcor boardd in the last patch of the serie
but if you prefer I can drop this patch.

For "stm32mp157c-ev1.dts" used by stm32mp15_trusted_defconfig

* nand0
  - type: NAND flash
  - block size: 0x40000 bytes
  - min I/O: 0x1000 bytes
  - OOB size: 224 bytes
  - OOB available: 118 bytes
  - ECC strength: 8 bits
  - ECC step size: 512 bytes
  - bitflip threshold: 6 bits
  - 0x000000000000-0x000040000000 : "nand0"
	  - 0x000000000000-0x000000200000 : "fsbl"
	  - 0x000000200000-0x000000600000 : "fip1"
	  - 0x000000600000-0x000000a00000 : "fip2"
	  - 0x000000a00000-0x000040000000 : "UBI"
* nor0
  - device: flash@0
  - parent: spi@58003000
  - driver: jedec_spi_nor
  - path: /soc/spi@58003000/flash@0
  - type: NOR flash
  - block size: 0x10000 bytes
  - min I/O: 0x1 bytes
  - 0x000000000000-0x000004000000 : "nor0"
	  - 0x000000000000-0x000000040000 : "fsbl1"
	  - 0x000000040000-0x000000080000 : "fsbl2"
	  - 0x000000080000-0x000000480000 : "fip"
	  - 0x000000480000-0x000000500000 : "u-boot-env"
	  - 0x000000500000-0x000004000000 : "nor-user"


For "stm32mp157c-ev1-scmi.dts" the device tree file used by
stm32mp15_defconfig, with TF-A BL2 and OP-TEE including a SCMI server
for secure resources (when TZEN=1), the default STMicroelectronics
configuration.

I align the NOR and NAND layout on EV1 boards with the STMicroelectronics
recommendations used in OpenSTLinux V4.0:
with support of TF-A BL2 firmware update, required 2 "metadata" partition
for redundancy and 2 FIPs for A/B update.

* nand0
  - type: NAND flash
  - block size: 0x40000 bytes
  - min I/O: 0x1000 bytes
  - OOB size: 224 bytes
  - OOB available: 118 bytes
  - ECC strength: 8 bits
  - ECC step size: 512 bytes
  - bitflip threshold: 6 bits
  - 0x000000000000-0x000040000000 : "nand0"
	  - 0x000000000000-0x000000080000 : "fsbl1"
	  - 0x000000080000-0x000000100000 : "fsbl2"
	  - 0x000000100000-0x000000180000 : "metadata1"
	  - 0x000000180000-0x000000200000 : "metadata2"
	  - 0x000000200000-0x000000600000 : "fip-a1"
	  - 0x000000600000-0x000000a00000 : "fip-a2"
	  - 0x000000a00000-0x000000e00000 : "fip-b1"
	  - 0x000000e00000-0x000001200000 : "fip-b2"
	  - 0x000001200000-0x000040000000 : "UBI"
* nor0
  - device: flash@0
  - parent: spi@58003000
  - driver: jedec_spi_nor
  - path: /soc/spi@58003000/flash@0
  - type: NOR flash
  - block size: 0x10000 bytes
  - min I/O: 0x1 bytes
  - 0x000000000000-0x000004000000 : "nor0"
	  - 0x000000000000-0x000000040000 : "fsbl1"
	  - 0x000000040000-0x000000080000 : "fsbl2"
	  - 0x000000080000-0x0000000c0000 : "metadata1"
	  - 0x0000000c0000-0x000000100000 : "metadata2"
	  - 0x000000100000-0x000000500000 : "fip-a"
	  - 0x000000500000-0x000000900000 : "fip-b"
	  - 0x000000900000-0x000000980000 : "u-boot-env"
	  - 0x000000980000-0x000004000000 : "nor-user"



Patrice Chotard (5):
  stm32mp: stm32prog: Remove usage of "mtdparts" function
  arm: dts: stm32: Add partitions in flash0 and nand node for
    stm32mp15xx-ev1
  configs: stm32mp: Disable SYS_MTDPARTS_RUNTIME for stm32mp15 and
    stm32mp13
  stm32mp: stm32prog: Remove tee_detected from stm32prog_data struct
  configs: stm32mp1: disable CMD_MTDPARTS

Patrick Delaunay (7):
  fdt_support: include dm/ofnode.h
  fdt_support: add fdt_copy_fixed_partitions function
  dfu: mtd: remove direct call of mtdparts_init function
  arm: dts: stm32: Align stm32mp15xx-*-scmi-u-boot.dtsi file
  board: stm32mp1: use fdt_copy_fixed_partitions
  board: st: remove board_mtdparts_default
  arm: dts: stm32: Add partitions in flash0 and nand node for
    stm32mp15xx-dhcom/dhcor

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |   1 +
 arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi |   7 +
 arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi | 125 +++++++++++++
 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi      |  98 +++++++++-
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi    |  27 +++
 arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi    |  27 +++
 .../cmd_stm32prog/cmd_stm32prog.c             |   9 -
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    |  53 ++----
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   3 -
 .../arm/mach-stm32mp/include/mach/stm32prog.h |   4 -
 board/st/common/Kconfig                       |  66 -------
 board/st/common/Makefile                      |   1 -
 board/st/common/stm32mp_mtdparts.c            | 177 ------------------
 board/st/stm32mp1/stm32mp1.c                  |  16 +-
 common/fdt_support.c                          |  75 +++++++-
 configs/stm32mp13_defconfig                   |   3 -
 configs/stm32mp15_basic_defconfig             |   3 -
 configs/stm32mp15_defconfig                   |   7 +-
 configs/stm32mp15_dhcom_basic_defconfig       |   3 -
 configs/stm32mp15_dhcor_basic_defconfig       |   3 -
 configs/stm32mp15_trusted_defconfig           |   3 -
 drivers/dfu/Kconfig                           |   1 -
 drivers/dfu/dfu_mtd.c                         |  34 ++--
 include/fdt_support.h                         |   8 +
 24 files changed, 407 insertions(+), 347 deletions(-)
 delete mode 100644 board/st/common/stm32mp_mtdparts.c

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
