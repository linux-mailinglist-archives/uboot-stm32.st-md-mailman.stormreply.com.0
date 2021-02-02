Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAD330BEEF
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Feb 2021 14:00:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BB52C57184;
	Tue,  2 Feb 2021 13:00:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98221C57181
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Feb 2021 13:00:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 112CuTcu022759; Tue, 2 Feb 2021 13:59:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=6m6XV5V9fk/DzeOR1wXX+/yA4XuQDqnJE7W2ojscZug=;
 b=4H9BghTrlzLB1zomLxTnaqZ2rWsb7ITaFwFazuz+p4DHthOXV1qUGyB8L6IvJueT0Axd
 OjHeQMgZMcxeVbuGhH0YADcliUufAj7BfrhXUaeyaaY20mCoM1xc4C+wnHHZ6vOHMv5g
 31TQZvNkfMItTWuiI4wlXZQ/QmDgv9JXsnEgm9MZJpvrJPmFi2oBf/cE2FcWFN1OaPbK
 v5pzCwwanBYm3lFgUCGy+QJVvanEZZ/Oi9S1QnF++ykgWD+6w0pxuKCyIX6XDvnqG7XQ
 j6XIqXW2Lr49XisGuR9KQW1FTsQdd3EyUsPu48NeZqoP3X1nDqgZ9rrkcXFzX7ScftsC Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36ey7gttkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 13:59:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB7A8100039;
 Tue,  2 Feb 2021 13:59:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F789234481;
 Tue,  2 Feb 2021 13:59:35 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Feb 2021 13:59:35
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 2 Feb 2021 13:59:07 +0100
Message-ID: <20210202125913.13597-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_06:2021-02-02,
 2021-02-02 signatures=0
Cc: Reuben Dowle <reubendowle0@gmail.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>, Rick Chen <rick@andestech.com>,
 uboot-snps-arc@synopsys.com, Max Filippov <jcmvbkbc@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Naoki Hayama <naoki.hayama@lineo.co.jp>,
 Masahiro Yamada <masahiroy@kernel.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Thomas Chou <thomas@wytron.com.tw>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Andre Przywara <andre.przywara@arm.com>, Huan Wang <alison.wang@nxp.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Aswath Govindraju <a-govindraju@ti.com>, Adam Ford <aford173@gmail.com>,
 Michal Simek <monstr@monstr.eu>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Atish Patra <atish.patra@wdc.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>, Simon Glass <sjg@chromium.org>,
 Tero Kristo <t-kristo@ti.com>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH 0/5] lmb: Add config for the number of memory
	and reserved regions
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

I propose a update of the lmb library to allow the configuration
with Kconfig of the number of memory and reserved regions in lmb
libary:
- CONFIG_LMB_RESERVED_REGIONS
- CONFIG_LMB_MEMORY_REGIONS

By default, I keep the default value of 8 regions.

This serie avoids issue on stm32mp15 platform,
as the kernel device tree defines many and non contiguous reserved
regions.



Patrick Delaunay (5):
  lmb: move CONFIG_LMB in Kconfig
  lmb: remove lmb_region.size
  lmb: Move lmb property arrays in struct lmb
  lmb: Add 2 config to define the max number of regions
  configs: stm32mp15: increase the number of reserved memory region in
    lmb

 arch/arc/include/asm/config.h        |  2 --
 arch/arm/include/asm/config.h        |  1 -
 arch/m68k/include/asm/config.h       |  1 -
 arch/microblaze/include/asm/config.h |  2 --
 arch/mips/include/asm/config.h       |  1 -
 arch/nds32/include/asm/config.h      |  1 -
 arch/powerpc/include/asm/config.h    |  1 -
 arch/riscv/include/asm/config.h      |  1 -
 arch/sh/include/asm/config.h         |  2 --
 arch/x86/include/asm/config.h        |  1 -
 arch/xtensa/include/asm/config.h     |  2 --
 configs/stm32mp15_basic_defconfig    |  1 +
 configs/stm32mp15_trusted_defconfig  |  1 +
 include/configs/10m50_devboard.h     |  5 ----
 include/configs/3c120_devboard.h     |  5 ----
 include/configs/sandbox.h            |  2 --
 include/configs/x86-common.h         |  2 --
 include/image.h                      |  2 +-
 include/lmb.h                        | 34 ++++++++++++++++++++++++----
 lib/Kconfig                          | 23 +++++++++++++++++++
 lib/lmb.c                            | 14 ++++++------
 scripts/config_whitelist.txt         |  1 -
 22 files changed, 63 insertions(+), 42 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
