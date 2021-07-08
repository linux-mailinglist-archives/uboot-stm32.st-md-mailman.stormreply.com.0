Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 418673BF761
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jul 2021 11:17:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1FFDC58D78;
	Thu,  8 Jul 2021 09:17:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72B56C57B5B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jul 2021 09:17:52 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1689DfkZ027985; Thu, 8 Jul 2021 11:17:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=1gfsJTk/zyilYfl+/j/fBANxqLWIQFrmVOcMWZh84v0=;
 b=XW9+RRu0WHHvO+WPwgZVyRN0gjlEaLHJParsM1oU3OcZJ9QFJvil58VPf9semm4yvlVE
 6+x6r0DSzsX2VuhCYfV938pYxgmRrlOD5p682Kh9BR5CzaXF6IfZZJHPkLhpsP5P2FDi
 /las2/vYX+WNHZLrsZr+lHwK8shtcBt+OKdenxoR3hHjGdQlw460lObp73y7tK0N+DMJ
 fARhs7sdJsmjP5pZLgRN6eiQfac4Fhg9Zv+/bAqYs1Z2W56AyX3vGGUgWaWidCo623Ea
 hS8BkITaN00/aAQNXRzs2H7nQQkYsWTn6Iekgt9PYRS+cdwMqS4eLhr/cRNhDVB6U6IR oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39nqk0jf68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 11:17:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6D2C210002A;
 Thu,  8 Jul 2021 11:17:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55161218132;
 Thu,  8 Jul 2021 11:17:49 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Jul 2021 11:17:48
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jul 2021 11:17:42 +0200
Message-ID: <20210708091747.317500-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_04:2021-07-06,
 2021-07-08 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 0/5] stm32mp1: handle TF-A boot with FIP
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


In next TF-A version the stm32mp1 platform will support the Firmware
Image Package (FIP) [1], a container filled with:
- the U-Boot binary = u-boot-nodtb.bin
- the U-Boot device tree = u-boot.dtb
- the Secure OS (OP-TEE) or the secure monitor (SP_MIN)

Upstream is in progress on TF-A side.

Each part of the FIP is loaded by TF-A BL2 and U-Boot
is executed with its device tree address as parameter (nt_fw_dtb = r2
introduced by commit 4ac345220afa ("board: stm32mp1: use FDT address
provided by TF-A at boot time")

This FIP container simplifies the OP-TEE management (same number of partition
with or without OP-TEE, OP-TEE dynamically updates the U-Boot device tree
to add the required OP-TEE nodes) and allow support of generic TF-A
features as PKI [2].

This serie allows to generate U-Boot configured for the TF-A BL2 image
types:
- STM32IMAGE: stm32mp15_trusted_defconfig (current behavior)
- FIP: stm32mp15_defconfig (NEW)

The FIP will be the STMicroelectronics recommended image type for
STM32MP15x and the STM32IMAGE support should be marked deprecated in a
future TF-A release or even removed.

To prepare this migration, the serie move all the specific code or
device tree nodes for TF-A load of STM32IMAGE under compilation
flag CONFIG_STM32MP15x_STM32IMAGE.

[1] 4.11. Firmware Image Package (FIP)
fiphttps://trustedfirmware-a.readthedocs.io/en/latest/design/firmware-design.html

[2] Authentication Framework & Chain of Trust
https://trustedfirmware-a.readthedocs.io/en/latest/design/auth-framework.html



Patrick Delaunay (5):
  arm: stm32mp: add config for STM32IMAGE support
  arm: stm32mp: handle the OP-TEE nodes in DT with FIP support
  arm: stm32mp: add defconfig for trusted boot with FIP
  doc: st: stm32mp1: Add FIP support for trusted boot
  stm32mp1: stm32prog: remove stm32prog_get_tee_partitions with FIP

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |   9 +-
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      |   9 +-
 arch/arm/mach-stm32mp/Kconfig                 |   7 +
 .../cmd_stm32prog/cmd_stm32prog.c             |   2 +
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    |   4 +
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   2 +
 arch/arm/mach-stm32mp/config.mk               |   2 +-
 arch/arm/mach-stm32mp/fdt.c                   |  11 +-
 .../arm/mach-stm32mp/include/mach/stm32prog.h |   2 +
 board/st/common/Kconfig                       |  21 ++-
 board/st/common/stm32mp_mtdparts.c            |  31 +++-
 board/st/stm32mp1/MAINTAINERS                 |   1 +
 board/st/stm32mp1/stm32mp1.c                  |  10 +-
 configs/stm32mp15_defconfig                   | 157 +++++++++++++++++
 configs/stm32mp15_trusted_defconfig           |   1 +
 doc/board/st/stm32mp1.rst                     | 166 ++++++++++--------
 16 files changed, 345 insertions(+), 90 deletions(-)
 create mode 100644 configs/stm32mp15_defconfig

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
