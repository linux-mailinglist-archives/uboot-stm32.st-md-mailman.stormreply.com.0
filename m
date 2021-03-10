Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9971D33388B
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Mar 2021 10:17:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 664CDC57B77;
	Wed, 10 Mar 2021 09:17:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE22CC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 09:17:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A9CqJi020841; Wed, 10 Mar 2021 10:16:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=N9BtmuhEL5kzPEKPH+3gezIWzsTqxt8ZSJWK1PUEGVA=;
 b=W7t4g/v20B53n3qhBaqdbvbAKy/FkRfX+c9Kp+sHDJXSwOrIee/aKbWo2vM/unzgg7f7
 QqbT8g4WsiUpV3mxwNIizsKSSfH/bFElWk6L7UzX/rfcGXsNJrzhlhoh5dkuoSvl5Gkf
 U5+eV1Zb9I6pQ2d/jiEKHsFIQeYDdhcDge9kY02ydLU/HhqYC8gIm87i+Wj7ZWhUB+97
 yI/Y0xV+CumCpHDxXlx4BakLAlr/9rs4HaaHtbdH9OnrnerxeG68dDO5CFVOZKGqXDKG
 k+yXTU7mn/vIxZgLVe7KLbLZNP2puUruzf5Nrzt+dR2/jYwZSSXge1CwqmfbAVC2z+f9 rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yreqsqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 10:16:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AEEB510002A;
 Wed, 10 Mar 2021 10:16:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22EB7228D95;
 Wed, 10 Mar 2021 10:16:37 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Mar 2021 10:16:36
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 10 Mar 2021 10:16:24 +0100
Message-ID: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_07:2021-03-09,
 2021-03-10 signatures=0
Cc: Reuben Dowle <reubendowle0@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>, Rick Chen <rick@andestech.com>,
 uboot-snps-arc@synopsys.com, Max Filippov <jcmvbkbc@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Naoki Hayama <naoki.hayama@lineo.co.jp>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Thomas Chou <thomas@wytron.com.tw>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Huan Wang <alison.wang@nxp.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Adam Ford <aford173@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Atish Patra <atish.patra@wdc.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>, Simon Glass <sjg@chromium.org>,
 Tero Kristo <t-kristo@ti.com>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH v2 0/8] lmb: Add config for the number of
	memory and reserved regions
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


Hi,

It is the V2 of [1]

I propose a update of the lmb library to allow the configuration
with Kconfig of the number of memory regions and of reserved regions
in lmb library with:
- CONFIG_LMB_RESERVED_REGIONS
- CONFIG_LMB_MEMORY_REGIONS

This serie avoids issue on stm32mp15 platform,
as the kernel device tree defines many and non contiguous reserved
regions.

It is based on latest memblock library in kernel (it was a preliminary
step for dynamic allocation of regions array to avoid any static limitation).

PS: in patch 1, I manage CONFIG_LMB dependency in lib/Kconfig file, with
	default y depends on ...
    but it can  do also in each arch by an imply or a select
    as it is done in [2].
    I am not sure what is the best solution for this dependency.

In this V2 series, I keep the default value of 8 regions defined in
struct lmb_region with:
- CONFIG_LMB_USE_MAX_REGIONS = n
- CONFIG_LMB_MAX_REGIONS = 8

When the array is located in struct lmb_region
(with CONFIG_LMB_USE_MAX_REGIONS = n), the compiler do some
optimization useful for size-constraint target, for example
the nokia_rx51 target increases by 152 bytes.

arm: (for 3/3 boards) all +50.7 bss +2.7 text +48.0
 nokia_rx51     : all +152 bss +8 text +144
   u-boot: add: 2/0, grow: 5/-2 bytes: 192/-40 (152)
     function                                   old     new   delta
     lmb_remove_region                            -      96     +96
     lmb_init                                     -      44     +44
     lmb_add_region                             416     440     +24
     __lmb_alloc_base                           224     236     +12
     images                                     288     296      +8
     lmb_overlaps_region                         80      84      +4
     lmb_alloc_addr                             108     112      +4
     lmb_init_and_reserve_range                  56      36     -20
     lmb_init_and_reserve                       100      80     -20

But it is not the case for all platform (STM32MP15 for example).

To optimize this size impact, I reduce the the regions array size
and add a test on overflow management in the lmb, but it is not enough.

So I try to optimized the lmb code to avoid the size impact when
CONFIG_LMB_USE_MAX_REGIONS = y but it is not working
and I prefer kept a code align with Linux kernel memblock library
and kept the current behavior a this.

With v2 the CI/CD build is now OK [3]

[1] lmb: Add config for the number of memory and reserved regions
http://patchwork.ozlabs.org/project/uboot/list/?series=227570&state=*

[2] arch: Move NEEDS_MANUAL_RELOC symbol to Kconfig
http://patchwork.ozlabs.org/project/uboot/list/?series=212154&state=*

[3] https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/6616


Changes in v2:
- add a max parameter extracted from v1 [3/5]
- new in v2: introduced MAX_LMB_REGIONS
- new in V2: reduce size impact by correct regions array size
- new in V2: add test for overflow protection in lmb libary
- rework v1 [4/5] to keep current optimization by default
  when CONFIG_LMB_USE_MAX_REGIONS=n
- Add CONFIG_LMB_USE_MAX_REGIONS=n and reduce LMB_MEMORY_REGIONS
  to reduce the used size in stack

Patrick Delaunay (8):
  lmb: move CONFIG_LMB in Kconfig
  lmb: remove lmb_region.size
  lmb: add a max parameter in the struct lmb_region
  lmb: move MAX_LMB_REGIONS value in Kconfig
  lmb: correct size of the regions array
  test: lmb: add test for overflow protection in lmb_add_region
  lmb: Add 2 config to define the max number of regions
  configs: stm32mp15: increase the number of reserved memory region in
    lmb

 arch/arc/include/asm/config.h        |  2 -
 arch/arm/include/asm/config.h        |  1 -
 arch/m68k/include/asm/config.h       |  1 -
 arch/microblaze/include/asm/config.h |  2 -
 arch/mips/include/asm/config.h       |  1 -
 arch/nds32/include/asm/config.h      |  1 -
 arch/powerpc/include/asm/config.h    |  1 -
 arch/riscv/include/asm/config.h      |  1 -
 arch/sh/include/asm/config.h         |  2 -
 arch/x86/include/asm/config.h        |  1 -
 arch/xtensa/include/asm/config.h     |  2 -
 configs/stm32mp15_basic_defconfig    |  3 ++
 configs/stm32mp15_trusted_defconfig  |  3 ++
 include/configs/10m50_devboard.h     |  5 ---
 include/configs/3c120_devboard.h     |  5 ---
 include/configs/sandbox.h            |  2 -
 include/configs/x86-common.h         |  2 -
 include/image.h                      |  2 +-
 include/lmb.h                        | 40 +++++++++++++++--
 lib/Kconfig                          | 44 ++++++++++++++++++-
 lib/lmb.c                            | 17 +++++---
 scripts/config_whitelist.txt         |  1 -
 test/lib/lmb.c                       | 64 ++++++++++++++++++++++++++++
 23 files changed, 160 insertions(+), 43 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
