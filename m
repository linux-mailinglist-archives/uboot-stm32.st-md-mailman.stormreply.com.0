Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73353284FFE
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Oct 2020 18:37:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38F85C32E8F;
	Tue,  6 Oct 2020 16:37:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CE86C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Oct 2020 16:37:06 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 096GWGO6000778; Tue, 6 Oct 2020 18:36:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=QpHwqTFrSkg3e2J7KzJDYiFYQEzvVqSHrJoc/ABup08=;
 b=fFo3EZjm2MtzC/Imv6FQUL73CAiepvKUfKpYr/lY/Axf7+2MY3XUJipXr2YfjRpv9Q/E
 b3553hikGXiEWo6WqEVWwwf3a2n790Av+ZANOUP5ghadSj2AGON3YrGlhbX0tvvp4qDM
 ggTIbexgdiV6LgN8hnMsJ+XjyckYTHSmfGiC/2axZbrustmGiIRmNVnwVMGJYQFMbI3G
 qA0nqO6hYwLS4+iA0ai2RUzkrd1kFRyQG8szYwij0IhvwdgynJoyTnji7EGhvf5rjnBY
 WdoJmLdxdQgQZS10gou5ah/UQ4RF1HLbyS5/ADvRWYnbrcVyKzYaAORIIG9goXGiexMx 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tjfvdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 18:36:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 92D97100034;
 Tue,  6 Oct 2020 18:36:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67D142C38D0;
 Tue,  6 Oct 2020 18:36:34 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 6 Oct 2020 18:36:33
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Oct 2020 18:35:55 +0200
Message-ID: <20201006163602.21687-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-06_09:2020-10-06,
 2020-10-06 signatures=0
Cc: chenshuo <chenshuo@eswin.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 marek.bykowski@gmail.com, Stefan Roese <sr@denx.de>,
 Ard Biesheuvel <ardb@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Etienne Carriere <etienne.carriere@linaro.org>, Simon Glass <sjg@chromium.org>,
 Tero Kristo <t-kristo@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH 0/7] arm: cache: cp15: don't map reserved
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

On STM32MP15x platform we can use OP-TEE, loaded in DDR in a region
protected by a firewall. This region is reserved in device with "no-map"
property.

But sometime the platform boot failed in U-boot on a Cortex A7 access to
this region (depending of the binary and the issue can change with compiler
version or with code alignment), then the firewall raise a error,
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
mapped in U-Boot (mapped as DEVICE/NON-CACHEABLE wasn't enough) as it is
already done in Linux kernel.

I think that can be a general issue for ARM architecture: the no-map tag
in device should be respected by U-boot, so I propose a  generic solution
in arm/lib/cache-cp15.c:dram_bank_mmu_setup().

This serie is composed by 7 patches
- 1..4/7: preliminary steps to support flags in library in lmb
  (as it is done in memblock.c in Linux)
- 5/7: unitary test on the added feature in lmb lib
- 6/7: save the no-map flags in lmb when the device tree is parsed
- 7/7: update the generic behavior for "no-map" region in
       arm/lib/cache-cp15.c::dram_bank_mmu_setup()

It is a rebase on master branch of previous RFC [2].

I can change this last patch if this feature is note required by other
ARM architecture; it is a weak function so I can avoid to map the region
with "no-map" property in device tree only for STM32MP architecture
(in arch/arm/mach-stm32mp/cpu.c).

See also [1] which handle same speculative access on armv8 for area
with Executable attribute.

[1] http://patchwork.ozlabs.org/project/uboot/patch/20200903000106.5016-1-marek.bykowski@gmail.com/
[2] http://patchwork.ozlabs.org/project/uboot/list/?series=199486&archive=both&state=*

Regards
Patrick


Patrick Delaunay (7):
  lmb: Add support of flags for no-map properties
  lmb: add lmb_is_reserved_flags
  lmb: remove lmb_region.size
  lmb: add lmb_dump_region() function
  test: lmb: add test for lmb_reserve_flags
  image-fdt: save no-map parameter of reserve-memory
  arm: cache: cp15: don't map the reserved region with no-map property

 arch/arm/include/asm/system.h |   3 +
 arch/arm/lib/cache-cp15.c     |  19 ++++++-
 common/image-fdt.c            |  23 +++++---
 include/lmb.h                 |  22 +++++++-
 lib/lmb.c                     | 100 +++++++++++++++++++++++-----------
 test/lib/lmb.c                |  89 ++++++++++++++++++++++++++++++
 6 files changed, 212 insertions(+), 44 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
