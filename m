Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 063BD6091D
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 17:20:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5AC1C35E02
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 15:20:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4D38C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 15:20:33 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65FFoLV006731; Fri, 5 Jul 2019 17:20:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=sfRYQRLcCzBPMGZ1uH7RhBoPZv7L9C50AGixzFxwPY0=;
 b=dxZ9EZU7gqQzwleBDa2RwzJ/GmPey0JFMD012fIssoXlMq4B4AcSKFYfn3sc9z/T2Lmj
 6vaD0CWgOML4C7EoYB1LERD/cFd8dXQR+NVJQrgnAjINIYm3mXvcFznYLPsZMfmNJIOq
 z4cSgPWeKnWCHJy68S3Ac4M7PcH7SN59drqQaBAWyzbzh5cCc7+OzJYvafvBjzQtNPWU
 GuYt1QNcRcyAGUsXBNbFZ+hYIm2Nx/VTr+XkjZ/WErARC9fWtWgoMp+tjEJkJ/nDqaxQ
 pKE228YzEaoTrpzcDV3zQ1A4tW/GmrowBFaskMczEUm1YF3HSRFQWdzJMDzuG4XpohKD ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tgx0qy81k-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 17:20:27 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3821B31;
 Fri,  5 Jul 2019 15:20:27 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 191FA4FB8;
 Fri,  5 Jul 2019 15:20:27 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019
 17:20:27 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019 17:20:26
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Jul 2019 17:20:07 +0200
Message-ID: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [Uboot-stm32] [PATCH v2 00/16] stm32m1 patches for v2019.10
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


Some remaining patches for stm32mp1
- some cleanup in files
- add 2 specific commands for stm32mp1 board
- use OF_SYSTEM_SETUP to update kernel device tree
- synchronization with latest device tree


Changes in v2:
- missing alignment on ethernet@5800a000
- set ethernet0 phy-mode to "rgmii-id" for dk1
  (needed modification not yet upstreamed)

Patrick Delaunay (16):
  stm32mp1: deactivate WATCHDOG in defconfig
  stm32mp1: call regulators_enable_boot_on in board_init
  stm32mp1: syscon: remove etzpc support
  stm32mp1: syscon: remove stgen
  dt-bindings: pinctrl: stm32: add new entry for package information
  stm32mp1: export get_cpu_package function
  stm32mp1: update package information in device tree
  stm32mp1: update device tree with ETZPC status
  stm32mp1: add stboard command
  stm32mp1: key: add stm32key command
  stm32mp1: update README
  stm32mp1: cosmetic: remove unnecessary include
  stm32mp1: configs: Add CONFIG_OF_SPL_REMOVE_PROPS
  stm32mp1: add check for presence of environment in boot device
  stm32mp1: force boot_net_usb_start
  ARM: dts: stm32mp1: sync device tree with v5.2-rc4

 arch/arm/Kconfig                                   |   1 +
 arch/arm/dts/stm32mp15-ddr.dtsi                    |   2 +-
 arch/arm/dts/stm32mp157-pinctrl.dtsi               | 270 ++++++++++++++++++++-
 arch/arm/dts/stm32mp157-u-boot.dtsi                |  67 ++---
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi           |   4 -
 arch/arm/dts/stm32mp157a-dk1.dts                   |  32 ++-
 arch/arm/dts/stm32mp157c-dk2.dts                   |   1 +
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi           |  15 +-
 arch/arm/dts/stm32mp157c-ed1.dts                   | 205 ++++------------
 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi           |   3 -
 arch/arm/dts/stm32mp157c-ev1.dts                   |  12 +-
 arch/arm/dts/stm32mp157c.dtsi                      | 215 +++++++++++-----
 arch/arm/mach-stm32mp/Kconfig                      |  15 ++
 arch/arm/mach-stm32mp/Makefile                     |   2 +
 arch/arm/mach-stm32mp/cmd_stm32key.c               | 101 ++++++++
 arch/arm/mach-stm32mp/cpu.c                        |   7 +-
 arch/arm/mach-stm32mp/fdt.c                        | 223 +++++++++++++++++
 arch/arm/mach-stm32mp/include/mach/stm32.h         |   3 +-
 arch/arm/mach-stm32mp/include/mach/sys_proto.h     |   9 +
 arch/arm/mach-stm32mp/syscon.c                     |   2 -
 board/st/stm32mp1/Kconfig                          |   7 +
 board/st/stm32mp1/Makefile                         |   1 +
 board/st/stm32mp1/README                           |  15 +-
 board/st/stm32mp1/cmd_stboard.c                    | 145 +++++++++++
 board/st/stm32mp1/spl.c                            |   1 -
 board/st/stm32mp1/stm32mp1.c                       |   4 +
 configs/stm32mp15_basic_defconfig                  |   3 +-
 configs/stm32mp15_trusted_defconfig                |   2 -
 .../pinctrl/st,stm32-pinctrl.txt                   | 101 +++++++-
 drivers/clk/clk_stm32mp1.c                         |   3 +-
 include/configs/stm32mp1.h                         |   7 +-
 include/dt-bindings/pinctrl/stm32-pinfunc.h        |   6 +
 32 files changed, 1165 insertions(+), 319 deletions(-)
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32key.c
 create mode 100644 arch/arm/mach-stm32mp/fdt.c
 create mode 100644 board/st/stm32mp1/cmd_stboard.c

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
