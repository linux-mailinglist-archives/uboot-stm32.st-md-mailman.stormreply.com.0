Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC98C1A175
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:28:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C117CB3CC1
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:28:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E8B5CA8E7F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:28:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6OvA020346; Fri, 10 May 2019 18:20:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=n/15SGmsbzJvgDa5ZvQm9ERaEcdZBoOwB7NIrVXGMpw=;
 b=unJKx9iaWUmCfLPL/iwyVCe8av5M/FkYVilXTBvyuBpx5rgHlliHO8Pq6hQTngW/cL8h
 NKxHx4e4QmrxklRJPtY2kfma6DnuIHk9VLZempKLbZROAT4x4Rri/rqtlAQ8rtAULmfH
 R7QT00IEnQ5C2G0kNi8NKPlYalH28AcRGc2ICNezLxbXo4YJRbXqzc8uAp+k8JQ9AB7B
 Csqejo48jaCVEJkiywX5DXGWgx8Lrh3YSCCkrCQTmtDYlhJxCkvpyL4POjGtw3O4jn6G
 th3EX5CwxtT5mhDTP+A9gcFEQcgt2/u9wcg1/3BojOZhBeBqVBvC/b69tT9IWgni5ADF rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2scfv2sr2f-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:20:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D5DC38;
 Fri, 10 May 2019 16:20:09 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 066592C4D;
 Fri, 10 May 2019 16:20:09 +0000 (GMT)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:20:08 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:19:01 +0200
Message-ID: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: Christophe KERELLO <christophe.kerello@st.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Alex Kiernan <alex.kiernan@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Vipul Kumar <vipul.kumar@xilinx.com>,
 Stephen Warren <swarren@nvidia.com>,
 Quentin Schulz <quentin.schulz@bootlin.com>, Adam Ford <aford173@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Michal Simek <michal.simek@xilinx.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, York Sun <york.sun@nxp.com>,
 Yaniv Levinsky <yaniv.levinsky@compulab.co.il>,
 Neil Stainton <nstainton@asl-control.co.uk>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Igor Grinberg <grinberg@compulab.co.il>, Jagan Teki <jagan@openedev.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Shyam Saini <mayhs11saini@gmail.com>
Subject: [Uboot-stm32] [PATCH 00/13] Add saveenv support for STM32MP1
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


This series adds saveenv support for STM32MP1 on several boot
devices. STM32MP1 is able to boot on eMMC, sdcard and NOR
(NAND support is not fully supported).

On eMMC and sdcard, environment is saved in EXT4 partition
On NOR, environment is saved in a dedicated partition
On NAND, environment is saved in a UBI volume.

This series:
  - enables NAND and NOR support on ev1 board
  - enables ENV_IS_IN_SPI_FLASH, ENV_IS_IN_UBI, ENV_IS_IN_EXT4
    flags
  - fixes get_mtdparts()
  - allows to override interface, device and partition for ext4
    environment
  - updates rule to set ENV_IS_NOWHERE value
  - introduce ENV_IS_IN_DEVICE


Patrice Chotard (10):
  stm32mp1: support dynamic MTDPARTS
  env: ext4: Allow overriding interface, device and partition
  board: stm32mp1: Add env_ext4_get_dev_part() and env_ext4_get_intf()
  env: allow ENV_IS_NOWHERE with other storage target
  stm32mp1: Add env_get_location()
  mtd: Fix get_mtdparts()
  stm32mp1: Move ENV_SIZE to Kconfig
  configs: stm32mp15: Enable ENV_IS_IN_UBI
  configs: stm32mp15: Enable ENV_IS_SPI_FLASH
  stm32mp1: Update env_get_location for NOR support

Patrick Delaunay (3):
  stm32mp1: activate NAND and NOR support on EV1
  env: enable saveenv command when one CONFIG_ENV_IS_IN is activated
  configs: stm32mp15: Enable ENV_IS_IN_EXT4 and all relative flags

 arch/arm/dts/stm32mp157-pinctrl.dtsi |  44 ++++++++++++
 arch/arm/dts/stm32mp157c-ev1.dts     |  16 +++++
 arch/arm/dts/stm32mp157c.dtsi        |  15 ++++
 arch/arm/mach-stm32mp/Kconfig        |   3 +
 board/st/stm32mp1/stm32mp1.c         | 136 +++++++++++++++++++++++++++++++++++
 cmd/nvedit.c                         |  36 ++++++----
 configs/stm32mp15_basic_defconfig    |  27 +++++++
 configs/stm32mp15_trusted_defconfig  |  27 +++++++
 drivers/mtd/mtd_uboot.c              |   5 +-
 env/Kconfig                          |  20 ++----
 env/ext4.c                           |  34 +++++----
 include/configs/stm32mp1.h           |  24 +++++--
 12 files changed, 338 insertions(+), 49 deletions(-)

-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
