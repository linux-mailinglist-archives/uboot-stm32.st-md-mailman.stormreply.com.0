Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0DE31333A
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Feb 2021 14:27:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A59AC57B56;
	Mon,  8 Feb 2021 13:27:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF8A7C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 13:27:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 118DR60k030254; Mon, 8 Feb 2021 14:27:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=g5KGOyFQP1y39etuBZrYWHWpD6gqP7/NvZCxQ9tg3b0=;
 b=NWWllRuIXwvfh9IFygph9fGlopaY3E0Oy9wnrt54H/7ZVjLhTsu+KQlpQt4pq6w4Mx4Z
 UI/UbfcZdJqEKzKK2uy6HkKSQhRiOuSPWYhq7qLe+NKUImHR7bDeMd8+HlmxvHGPyqzG
 1ZxeXQT7wU9BSBCv8EEByS0jR4Scf1H01odvcudPbWIar3UJPjSSVFkUPKGlS9gaQICr
 I9lr8oH0lLZKeb8egXXpNR8E9miGux2wSmqxGcPOfPNihnlAeYOVTeQNXdUFCFSAUHfq
 aYtx/zlxIWuCgTsEg691lfUCgixEai2UpK6IsU5UFFrWkn6NdGvhD5oVuIQ68ADJ818E hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrf72aqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 14:27:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B699310002A;
 Mon,  8 Feb 2021 14:27:03 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DE352AD2BF;
 Mon,  8 Feb 2021 14:27:03 +0100 (CET)
Received: from localhost (10.75.127.122) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 8 Feb 2021 14:27:02 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 8 Feb 2021 14:26:48 +0100
Message-ID: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-08_06:2021-02-08,
 2021-02-08 signatures=0
Cc: chenshuo <chenshuo@eswin.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 marek.bykowski@gmail.com, Stefan Roese <sr@denx.de>,
 Ard Biesheuvel <ardb@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis@collabora.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Etienne
 Carriere <etienne.carriere@linaro.org>, Simon Glass <sjg@chromium.org>,
 Tero Kristo <t-kristo@ti.com>, Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Hongwei Zhang <hongweiz@ami.com>
Subject: [Uboot-stm32] [PATCH v2 0/7] arm: cache: cp15: don't map reserved
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

It it the v2 serie of [1].

This v2 serie is build/can be applied on top of 2 previous series
- [2] for stm32mp parts and added dram_bank_mmu_setup
- [3] for LMB impacts

After V1 remarks, I propose this separate serie [2] for DACR support.

On STM32MP15x platform we can use OP-TEE, loaded in DDR in a region
protected by a firewall. This region is reserved in device with "no-map"
property.

Sometime the platform boot failed in U-boot on a Cortex A7 access to
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
in device should be respected by U-boot, so I propose a  generic solution
in arm/lib/cache-cp15.c:dram_bank_mmu_setup().

This v2 serie is composed by 7 patches
- 1..3/7: preliminary steps to support flags in library in lmb
  (as it is done in memblock.c in Linux)
- 4/7: unitary test on the added feature in lmb lib
- 5/7: save the no-map flags in lmb when the device tree is parsed
- 6/7: update the stm32mp mmu support
- 7/7: update the generic behavior for "no-map" region in
       arm/lib/cache-cp15.c::dram_bank_mmu_setup()

I can drop this last patch if this feature is not required by other
ARM architectures; the weak function is updated in patch 6
in STM32MP architecture (in arch/arm/mach-stm32mp/cpu.c)
to correct the initial problem.

See also [4] which handle same speculative access on armv8 for area
with Executable attribute.

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=206296&state=*
[2] http://patchwork.ozlabs.org/project/uboot/list/?series=228202&state=*
[3] http://patchwork.ozlabs.org/project/uboot/list/?series=227570&state=*
[4] http://patchwork.ozlabs.org/project/uboot/patch/20200903000106.5016-1-marek.bykowski@gmail.com/

Regards
Patrick

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
  stm32mp: don't map the reserved region with no-map property
  arm: cache: cp15: don't map the reserved region with no-map property

 arch/arm/include/asm/system.h |  3 ++
 arch/arm/lib/cache-cp15.c     | 19 ++++++-
 arch/arm/mach-stm32mp/cpu.c   | 16 +++++-
 common/image-fdt.c            | 23 ++++++---
 include/lmb.h                 | 21 ++++++++
 lib/lmb.c                     | 94 +++++++++++++++++++++++++----------
 test/lib/lmb.c                | 89 +++++++++++++++++++++++++++++++++
 7 files changed, 226 insertions(+), 39 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
