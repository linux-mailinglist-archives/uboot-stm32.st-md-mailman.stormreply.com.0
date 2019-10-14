Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0CCD5C68
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 09:28:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45F98C36B09
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 07:28:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C9A4C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 07:28:25 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7QT8J006828; Mon, 14 Oct 2019 09:28:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=GSQpFxh5O9LRYWKqEL87LkTCGDwkhqk0/4pqJu78DL0=;
 b=NkcMiCHQRAQaWth/+o8JbOAY2MvbaTQ9I/oRYo9hDr42vRCE5NQ1qNCFcoJ6uBvxll44
 yEAMOY5xFhhbg34kdynHyxuOQF9scJmZC0DLI9bbfd4A+WXh2Mbwsm1OKUxzKKhANBV0
 n7i1jmQjC5hJCGUG4fAKUe9YwPcXj3FPWBxLbFlbhgbaI7BJbirKQOg8Zh0lgVUB4Cyw
 TiN91jvGb1CxVVg1uPdTAxdwpRzJA9SleI3eEPK3aqaWsg501y4UPIphyu4J4J8RHl9n
 059AMwRP82tH9/MR03czEJDbi6jrqS8djYB70rsF44m7mXt25tpQVBeiAW7Y2Dqdp0OK sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vk4a10umm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 09:28:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9125E10002A;
 Mon, 14 Oct 2019 09:28:20 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 77CD32ADFD2;
 Mon, 14 Oct 2019 09:28:20 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 09:28:20 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 09:28:19
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 09:27:57 +0200
Message-ID: <20191014072812.21843-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: [Uboot-stm32] [PATCH v3 00/15] dfu: update dfu stack and add MTD
	backend
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


This serie based on v2019.10 propose updates on the DFU stack:
- add capability to have several DFU backend running in parallel
- add MTD backend for update of NAND, NOR or SPI-NAND
- add VIRTUAL backend for board/command specific behavior
- add some weak callback

This v2 patchset:
+ solves compilation for dependancy with CONFIG_CMD_MTDPARTS
+ solves bad block management for NAND in the erase loops
  (copied from MTD command), the previous was functional only on
  SPI-NAND. But I detect issue for NAND; when bad block is
  detected fail_addr is not updated.
  See the complete analysis on the issue (reproduced in MTD
  command) in http://patchwork.ozlabs.org/patch/1165056/
  "cmd: mtd: solve bad block support in erase command"
  The better solution is a MTD backport from Linux, but udpate the
  loop is functional for SPI-NAND and NAND.

To test the new features and as example, I update the stm32mp1
board to use the new features; I test them with the command
"dfu 0" (for test I have dependency with patch
 http://patchwork.ozlabs.org/patch/1162076/)

The expected target of the dfu part for this serie is v2020.01.
I will merge the stm32mp1 part when they will be accepted by dfu
maintainers.

This serie prepares the DFU backend for the coming 'stm32prog' command
and for STM32CubeProgrammer on stm32mp1 platform.
This STMicroelectronics tool is based on DFU protocol and allows to
update all the boot devices and the OTPs on the ST boards
(so several DFU target in parallel, including spi nand).

Build result for dfu_v3 branch can be found in
https://travis-ci.org/patrickdelaunay/u-boot/builds/596684593

only one error for sheevaplug, but not reproduced on my side

     arm:  +   sheevaplug
+u-boot.kwb exceeds file size limit:
+  limit:  524288 bytes
+  actual: 524320 bytes
+  excess: 32 bytes

$> tools/buildman/buildman sheevaplug

boards.cfg is up to date. Nothing to do.
Building current source for 1 boards (1 thread, 12 jobs per thread)
       arm:  w+   sheevaplug
+===================== WARNING ======================
+This board does not use CONFIG_DM_MMC. Please update
+the board to use CONFIG_DM_MMC before the v2019.04 release.
+Failure to update by the deadline may result in board removal.
+See doc/driver-model/MIGRATION.txt for more info.
+====================================================
+This board does not use CONFIG_DM_USB. Please update
+the board to use CONFIG_DM_USB before the v2019.07 release.
+This board does use CONFIG_MVSATA_IDE which is not
+ported to driver-model (DM) yet. Please update the storage
+controller driver to use CONFIG_AHCI before the v2019.07
+release.
+This board does not use CONFIG_DM_ETH (Driver Model
+for Ethernet drivers). Please update the board to use
+CONFIG_DM_ETH before the v2020.07 release. Failure to
+update by the deadline may result in board removal.
+See doc/driver-model/migration.rst for more info.
    0    1    0 /1      sheevaplug

Regards

Patrick


Changes in v3:
- Add CONFIG_DFU_SF_PART and solve compilation issue,
  dependancy with CONFIG_MTDPARTS
- update bad block support in erase loop
- Update loop management for erase
- rebase on v2019.10
- remove previous patch 16/16 pushed by error in v2
  http://patchwork.ozlabs.org/patch/1162076/

Changes in v2:
- Add dfu documentation
- Update dfu documentation for callbacks
- Add dfu documentation for several device
- Update commit message
- Update commit message
- Update dfu documentation for MTD
- Update dfu documentation for MTD
- Update dfu documentation for virtual backend
- Update dfu documentation for callbacks
- Update callbacks comment after Lukasz review
- Update after Lukasz Majewski comments

Patrick Delaunay (15):
  dfu: cosmetic: cleanup sf to avoid checkpatch error
  doc: dfu: Add dfu documentation
  dfu: sf: add partition support for nor backend
  dfu: prepare the support of multiple interface
  dfu: allow to manage DFU on several devices
  dfu: allow read with no data without error for EOF indication
  dfu: add backend for MTD device
  dfu: add partition support for MTD backend
  dfu: add DFU virtual backend
  dfu: add callback for flush and initiated operation
  stm32mp1: activate DFU support and command MTD
  stm32mp1: activate SET_DFU_ALT_INFO
  stm32mp1: configs: activate CONFIG_MTD_SPI_NAND
  stm32mp1: board: add spi nand support
  stm32mp1: add support for virtual partition read

 board/st/stm32mp1/README            | 111 ++++++++++
 board/st/stm32mp1/stm32mp1.c        | 164 ++++++++++++++-
 cmd/dfu.c                           |  21 +-
 configs/stm32mp15_basic_defconfig   |   6 +
 configs/stm32mp15_optee_defconfig   |   6 +
 configs/stm32mp15_trusted_defconfig |   6 +
 doc/README.dfu                      | 270 ++++++++++++++++++++++++
 drivers/dfu/Kconfig                 |  21 ++
 drivers/dfu/Makefile                |   2 +
 drivers/dfu/dfu.c                   | 145 +++++++++++--
 drivers/dfu/dfu_mtd.c               | 311 ++++++++++++++++++++++++++++
 drivers/dfu/dfu_sf.c                |  56 ++++-
 drivers/dfu/dfu_virt.c              |  49 +++++
 include/configs/stm32mp1.h          |  42 +++-
 include/dfu.h                       |  71 +++++++
 15 files changed, 1251 insertions(+), 30 deletions(-)
 create mode 100644 doc/README.dfu
 create mode 100644 drivers/dfu/dfu_mtd.c
 create mode 100644 drivers/dfu/dfu_virt.c

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
