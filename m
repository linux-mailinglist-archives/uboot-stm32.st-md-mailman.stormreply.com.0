Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E04BE36D5BC
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Apr 2021 12:24:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5D73C58D5A;
	Wed, 28 Apr 2021 10:24:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C967C58D5E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Apr 2021 10:24:08 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SAGgl5025262; Wed, 28 Apr 2021 12:23:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=VMsvqT366Yd8O1jclaTd5hpZX6p4e47MiBhgYcaq+yE=;
 b=rsPm7LcFKsd9buDOmrqgXQo+3CZotM9IiC5Ce1DyG8LcfwUquH5YtKfxGIVP/RWV+DYC
 4dBbeD87/1lH8yJr5dp+2EtjNoQILJuwfNzPVcv65lG+gB9f0hVjHoimLyMIUhibM3/x
 3Dd6Z8Uv6ty2hiORytNTrmSEckojuNIYBxe5RYoDVvhjUbRi9yEf59PsSPffRBWGly5t
 tzuKnRbIVJl2Gbqf7M2Qqw9U30iqogMq6giBc/EUBgxBwUdvxrm3PR1/mK5W6dsaYF8D
 rS2VUsmkY1MmRoborXCFUj5xv23J9NAzKa9CZ/GEImFuGkUlyY/Jq4G33oMO+z1afKM/ vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 386ea8fm3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 12:23:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9625C10002A;
 Wed, 28 Apr 2021 12:23:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 786B9211B08;
 Wed, 28 Apr 2021 12:23:48 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 12:23:48
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 28 Apr 2021 12:23:38 +0200
Message-ID: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_04:2021-04-27,
 2021-04-28 signatures=0
Cc: Marek Vasut <marex@denx.de>, chenshuo <chenshuo@eswin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bin Meng <bmeng.cn@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Roese <sr@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Ard Biesheuvel <ardb@kernel.org>, Tero Kristo <t-kristo@ti.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis@collabora.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wasim Khan <wasim.khan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, marek.bykowski@gmail.com, Etienne
 Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH v3 0/7] arm: cache: cp15: don't map reserved
	region with no-map property
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

It it the v3 serie of [1].

This v3 serie is rebased on top of v2021.07-rc1 with integrated previous series:
- [2] for stm32mp parts and added dram_bank_mmu_setup
- [3] for LMB impacts

On STM32MP15x platform we can use OP-TEE, loaded in DDR in a region
protected by a firewall. This region is reserved in device with "no-map"
property.

Sometime the platform boot failed in U-Boot on a Cortex A7 access to
this region (depending of the binary and the issue can change with compiler
version or with code alignment), then the firewall raise an error,
for example:

E/TC:0   tzc_it_handler:19 TZC permission failure
E/TC:0   dump_fail_filter:420 Permission violation on filter 0
E/TC:0   dump_fail_filter:425 Violation @0xde5c6bf0, non-secure privileged read,
         AXI ID 5c0
E/TC:0   Panic

After investigation, the forbidden access is a speculative request performed
by the Cortex A7 because all the DDR is mapped as MEMORY with CACHEABLE
property.

The issue is solved only when the region reserved by OP-TEE is no more
mapped in U-Boot as it is already done in Linux kernel.

Tested on DK2 board with OP-TEE 3.12 / TF-A 2.4:

With hard-coded address for OP-TEE reserved memory,
the error doesn't occur.

 void dram_bank_mmu_setup(int bank)
 {
 ....

    	for (i = start >> MMU_SECTION_SHIFT;
 	     i < (start >> MMU_SECTION_SHIFT) + (size >> MMU_SECTION_SHIFT);
 	     i++) {
 		option = DCACHE_DEFAULT_OPTION;
 		if (i >= 0xde0)
 			option = INVALID_ENTRY;
 		set_section_dcache(i, option);
 	}
 }

Just by modifying the test on 0xde0 to 0xdf0, the OP-TEE memory protected
by firewall is mapped cacheable and the error occurs.

I think that can be a general issue for ARM architecture: the no-map tag
in device should be respected by U-Boot.

But I don't propose a generic
solution in arm/lib/cache-cp15.c:dram_bank_mmu_setup()
because the device tree parsing done in lmb_init_and_reserve() take a
long time when it is executed without data cache.

=> the previous path 7/7 of v2 series is dropped to avoid
   performance issue on other ARM target.

To avoid this issue on stm32mp32mp platform, this V3 series moves
the lmb initialization in enable_caches() and the lmb variable becomes a
static struct.

This v3 series is composed by 7 patches
- 1..3/7: preliminary steps to support flags in library in lmb
  (as it is done in memblock.c in Linux)
- 4/7: unitary test on the added feature in lmb lib
- 5/7: save the no-map flags in lmb when the device tree is parsed
- 6/7: solve issue for the size of cacheable area in pre-reloc case
- 7/7: update the stm32mp mmu support

See also [4] which handle same speculative access on armv8 for area
with Executable attribute.

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=228543&state=*
[2] http://patchwork.ozlabs.org/project/uboot/list/?series=228202&state=*
[3] http://patchwork.ozlabs.org/project/uboot/list/?series=227570&state=*
[4] http://patchwork.ozlabs.org/project/uboot/patch/20200903000106.5016-1-marek.bykowski@gmail.com/

Regards
Patrick

Changes in v3:
- NEW: solve performance issue as relocated DT is not marked cacheable
- call lmb_init_and_reserve when data cache is activated in enable_caches()
- drop v2 patch "arm: cache: cp15: don't map the reserved region
  with no-map property"

Changes in v2:
- remove unnecessary comments in lmb.h
- rebase on latest lmb patches
- NEW: update in stm32mp specific MMU setup functions

Patrick Delaunay (7):
  lmb: Add support of flags for no-map properties
  lmb: add lmb_is_reserved_flags
  lmb: add lmb_dump_region() function
  test: lmb: add test for lmb_reserve_flags
  image-fdt: save no-map parameter of reserve-memory
  stm32mp: Increase the reserved memory in board_get_usable_ram_top
  stm32mp: don't map the reserved region with no-map property

 arch/arm/mach-stm32mp/cpu.c       | 17 +++++-
 arch/arm/mach-stm32mp/dram_init.c |  3 +-
 common/image-fdt.c                | 23 +++++---
 include/lmb.h                     | 21 +++++++
 lib/lmb.c                         | 94 ++++++++++++++++++++++---------
 test/lib/lmb.c                    | 89 +++++++++++++++++++++++++++++
 6 files changed, 209 insertions(+), 38 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
