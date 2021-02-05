Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D67B310B66
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Feb 2021 13:54:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24447C57B54;
	Fri,  5 Feb 2021 12:54:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C438C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 12:54:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115CS9JL020666; Fri, 5 Feb 2021 13:53:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=IqgmEGlkFCcOaV42JteGsKIrCz+T+8r8Sr/KvYE9l6Y=;
 b=4q7GwOP1eXYNq7RgGmkEdaCWI3o9wK7p61TJ5mZ3TmgHGrf01hjW3GCxAU/3VC8SpMxh
 fxp098JbWXil2Ts+DAlpz7sIxadrkmeXf1Nkbx5gqtbwXLvQhT8TP5pu9j2TC4IvIzlS
 QKbuWq9CCxh2lMvxwJBleAX+ZiHohUJEeXKZta67rx6Pa4u3t1UZu06sF5s4NhbJlwwh
 98Qmmv1xMI19XcrkMXLQFbeP2pKNHAbaHLtEG6DitfB1vxgf0aTKElJvBroXwEOFxQS7
 a+Ov0ele+ug5TQinBjqOV+8WvvpgNMkhyluGxV2q97qrya8obofJpcjU9thfq70HRx6J XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0fsetkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 13:53:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2BCD410002A;
 Fri,  5 Feb 2021 13:53:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4B37231DDA;
 Fri,  5 Feb 2021 13:53:41 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 13:53:41
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Feb 2021 13:53:31 +0100
Message-ID: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_07:2021-02-05,
 2021-02-05 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Ovidiu Panait <ovpanait@gmail.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andre Przywara <andre.przywara@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Ovidiu Panait <ovidiu.panait@windriver.com>, Patrick
 Delaunay <patrick.delaunay@st.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Ard Biesheuvel <ardb@kernel.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH 0/8]
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

Serie proposed after analysis in [1], to correctly handle Domain Access
Control Register (DACR) and activate the domain checking in MMU against
the permission bits in the translation tables and avoids prefetching issue
on ARMv7, as indicated in [1].

I propose a clean and general solution for ARMv7, when the LPAE is not
activated; after this update, I revert the correction done for OMAP
by the commit de63ac278cba ("ARM: mmu: Set domain permissions to client
access")

Tests on ARMv7 platform is requested before integration,
so I think the target can be v2021.07 (next).

The 2 first patch of the serie solve issues for stm32mp platform
when dcache is activate in pre-reloc or in SPL.

See also correction for LPAE mode in commit 06d43c808d61 ("arm: Set TTB
XN bit in case DCACHE_OFF for LPAE mode")


[1] [PATCH 0/7] arm: cache: cp15: don't map reserved region with no-map
    property
http://u-boot.10912.n7.nabble.com/PATCH-0-7-arm-cache-cp15-don-t-map-reserved-region-with-no-map-property-tt428715.html



Patrick Delaunay (8):
  stm32mp: update MMU config before the relocation
  stm32mp: update the mmu configuration for SPL and prereloc
  arm: remove TTB_SECT_XN_MASK in DCACHE_WRITETHROUGH
  arm: cosmetic: align TTB_SECT define value
  arm: cp15: update DACR value to activate access control
  arm: omap2: remove arm_init_domains
  arm: cp15: remove weak function arm_init_domains
  arm: remove set_dacr/get_dacr functions

 arch/arm/cpu/armv7/cache_v7.c     |  3 ---
 arch/arm/include/asm/cache.h      |  1 -
 arch/arm/include/asm/system.h     | 18 ++------------
 arch/arm/lib/cache-cp15.c         | 13 ++++------
 arch/arm/mach-omap2/omap-cache.c  | 17 -------------
 arch/arm/mach-stm32mp/cpu.c       | 40 +++++++++++++++++++++++--------
 arch/arm/mach-stm32mp/dram_init.c | 13 ++++++----
 7 files changed, 46 insertions(+), 59 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
