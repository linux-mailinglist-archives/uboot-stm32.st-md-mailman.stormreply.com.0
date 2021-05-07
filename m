Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD1537658F
	for <lists+uboot-stm32@lfdr.de>; Fri,  7 May 2021 14:51:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F57EC59781;
	Fri,  7 May 2021 12:51:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D48F3C59780
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 May 2021 12:51:01 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147ClSRJ001907; Fri, 7 May 2021 14:50:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=Oi0rVW9iCwJ2Y3jz8se58GcxPW9/M4L1zRzEXcPaCZo=;
 b=YY3vPdx4U+IX2lfHdZleLu5JG3YL4V61W6jOW5CMAOr13hm+SaGF1BfKO8cEmeNpEKY0
 BjGiyLVSDJfmkZu/TzHcgeCKkTJM8QRc0KlAGscnRMSQpJSVvyoI6JLb7OmLUft2uvpr
 rIURUKON3J7px8jCpJmFrHFkppYJ8j9uVUbAUYmV+wjn9R8RfFEoU6n1d7SvmsM6tDhu
 +hCa4/FgZx0wnvfYeAQPmAB1UHSZ7HhvvGPEPFhDBrxOrqYriORpJ0+VvYSHnlMurLEs
 mR5QdeYwEMjfJS+CnWv8WwtNwPn8x6YCPdR4knCsDqwmklHBeR5t0TfwNSCjWR9cM6Dl yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38csqg3xp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 14:50:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D2E0310002A;
 Fri,  7 May 2021 14:50:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC41121CA8B;
 Fri,  7 May 2021 14:50:43 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May 2021 14:50:43
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 7 May 2021 14:50:28 +0200
Message-ID: <20210507125035.1594-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_04:2021-05-06,
 2021-05-07 signatures=0
Cc: chenshuo <chenshuo@eswin.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Stefan Roese <sr@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wasim Khan <wasim.khan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH v4 0/7] arm: cache: cp15: don't map reserved
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

It it the v4 serie of [1].

This v4 serie is rebased on top of master branch with update after Simon
Glass review and added tags.

On STM32MP15x platform we can use OP-TEE, loaded in DDR in a region
protected by a firewall. This region is reserved in the device with
the "no-map" property as defined in the binding file
doc/device-tree-bindings/reserved-memory/reserved-memory.txt.

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

I think that it can be a general issue for ARM architecture: the "no-map" tag
of reserved memory in device should be respected by U-Boot if firewall
is configured before U-Boot execution.

But I don't propose a generic solution in
arm/lib/cache-cp15.c:dram_bank_mmu_setup()
because the device tree parsing done in lmb_init_and_reserve() takes a
long time when it is executed without data cache.

=> the previous path 7/7 of v2 series is dropped to avoid
  performance issue on other ARM target.

To avoid this performance issue on stm32mp32mp platform, the lmb
initialization is done in enable_caches() when dcache is still enable.

This v3 series is composed by 7 patches
- 1..3/7: preliminary steps to support flags in library in lmb
  (as it is done in memblock.c in Linux)
- 4/7: unitary test on the added feature in lmb lib
- 5/7: save the no-map flags in lmb when the device tree is parsed
- 6/7: solve issue for the size of cacheable area in pre-reloc case
- 7/7: update the stm32mp mmu support

See also [2] which handle same speculative access on armv8 for area
with Executable attribute.

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=241122&state=*
[2] http://patchwork.ozlabs.org/project/uboot/patch/20200903000106.5016-1-marek.bykowski@gmail.com/

Regards
Patrick

Changes in v4:
- Add comment for lmb_reserve_flags and remove extern
- Remove unnecessary !! on return of boolean in lmb_is_nomap
- Add comment for lmb_is_reserved_flags and remove extern
- Remove unnecessary !! on return of boolean in lmb_is_reserved_flags
- map the end of the DDR only before relocation, in board_f.c;
  this test avoid issue when board_get_usable_ram_top() is called
  in efi_loader function efi_add_known_memory()

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
 arch/arm/mach-stm32mp/dram_init.c |  7 ++-
 common/image-fdt.c                | 23 +++++---
 include/lmb.h                     | 38 +++++++++++++
 lib/lmb.c                         | 93 ++++++++++++++++++++++---------
 test/lib/lmb.c                    | 89 +++++++++++++++++++++++++++++
 6 files changed, 228 insertions(+), 39 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
