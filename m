Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 064DB1896C6
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:23:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2D46C36B0F
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:23:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CBE2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:23:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8IHAu021541; Wed, 18 Mar 2020 09:23:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=qIa9Xej7FfV6W0IjuVB3h9UM7ekmLJKDqmM27Xi8IlI=;
 b=t6L1DyzpdvjKGmlPEIbRDEtwV+o9eVFnk+99kBNCoLjBA/eaZJgnlllZipv+ounEtEOL
 +XVi753akmXqCKM2xyP02bwjiC4oip/zdCZm+tvAcW+iyDiw5jQBoHGcVV4cYwbMpGxs
 QNsN/dJ//e/scENoTcby+3TGIEKjWCpX4pG/TckJZVRQjvsFSartOilCEXoVj3BR07gL
 CV1in/vbzaP3CcYDtn3Eh0iAb0QPm0oHYfJYecRKw61DZwn+vpA/aw5T3qTp5txXPCdr
 Jr3apavN/Wk4/9xAvxqHaiztcunpVufG7ZxBq3P2tpcHRgDglou414EvNZlg2IGLkPN9 Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95uj2up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:23:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4269310002A;
 Wed, 18 Mar 2020 09:23:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F6A221CA90;
 Wed, 18 Mar 2020 09:23:02 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:23:01 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:22:48 +0100
Message-ID: <20200318082254.7522-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082254.7522-1-patrick.delaunay@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 05/11] board: stm32mp1: reserve memory for
	OP-TEE in device tree
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

Add reserve memory for OP-TEE in U-Boot and in kernel device tree:
- no more reduce the DDR size in "memory" node:
  CONFIG_SYS_MEM_TOP_HIDE is no more used
- U-Boot device-tree defines the needed "reserved-memory" for OP-TEE
  and U-Boot should not use this reserved memory: board_get_usable_ram_top
  use lmb lib to found the first free region, the not reserved
  memory, enough to relocate U-Boot: the needed size of U-Boot
  is estimated with gd->mon_len + CONFIG_SYS_MALLOC_LEN.
- the optee node ("optee@...": firmware with compatible "linaro,optee-tz")
  and the associated "reserved-memory" are deactivated in kernel device
  tree when OP-TEE is not detected by U-Boot to prevent kernel issue
  (memory is reserved but not used, optee driver probe failed).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
This patch depends on "ARM: bootm: take into account gd->ram_top"
http://patchwork.ozlabs.org/project/uboot/list/?series=158413

 arch/arm/dts/stm32mp157a-dk1.dts  |  5 +++++
 arch/arm/dts/stm32mp157c-ed1.dts  |  5 +++++
 arch/arm/mach-stm32mp/dram_init.c | 18 ++++++++++++++++++
 arch/arm/mach-stm32mp/fdt.c       | 23 +++++++++++++++++++++++
 include/configs/stm32mp1.h        |  4 ----
 5 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1.dts b/arch/arm/dts/stm32mp157a-dk1.dts
index 624bf6954b..70e7aa2fd7 100644
--- a/arch/arm/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/dts/stm32mp157a-dk1.dts
@@ -74,6 +74,11 @@
 			reg = <0xd4000000 0x4000000>;
 			no-map;
 		};
+
+		optee@de000000 {
+			reg = <0xde000000 0x02000000>;
+			no-map;
+		};
 	};
 
 	led {
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index ae4da39ce8..27a0d05d82 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -68,6 +68,11 @@
 			reg = <0xe8000000 0x8000000>;
 			no-map;
 		};
+
+		optee@fe000000 {
+			reg = <0xfe000000 0x02000000>;
+			no-map;
+		};
 	};
 
 	aliases {
diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
index 7688b3e315..3233415eff 100644
--- a/arch/arm/mach-stm32mp/dram_init.c
+++ b/arch/arm/mach-stm32mp/dram_init.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <lmb.h>
 #include <ram.h>
 
 DECLARE_GLOBAL_DATA_PTR;
@@ -31,3 +32,20 @@ int dram_init(void)
 
 	return 0;
 }
+
+ulong board_get_usable_ram_top(ulong total_size)
+{
+	phys_addr_t reg;
+	struct lmb lmb;
+
+	/* found enough not-reserved memory to relocated U-Boot */
+	lmb_init(&lmb);
+	lmb_add(&lmb, gd->ram_base, gd->ram_size);
+	boot_fdt_add_mem_rsv_regions(&lmb, (void *)gd->fdt_blob);
+	reg = lmb_alloc(&lmb, CONFIG_SYS_MALLOC_LEN + total_size, SZ_4K);
+
+	if (reg)
+		return ALIGN(reg + CONFIG_SYS_MALLOC_LEN + total_size, SZ_4K);
+
+	return gd->ram_top;
+}
diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
index 3ee7d6a833..ae82270e42 100644
--- a/arch/arm/mach-stm32mp/fdt.c
+++ b/arch/arm/mach-stm32mp/fdt.c
@@ -218,6 +218,26 @@ static void stm32_fdt_disable(void *fdt, int offset, u32 addr,
 		       string, addr, name);
 }
 
+static void stm32_fdt_disable_optee(void *blob)
+{
+	int off, node;
+
+	off = fdt_node_offset_by_compatible(blob, -1, "linaro,optee-tz");
+	if (off >= 0 && fdtdec_get_is_enabled(blob, off))
+		fdt_status_disabled(blob, off);
+
+	/* Disabled "optee@..." reserved-memory node */
+	off = fdt_path_offset(blob, "/reserved-memory/");
+	if (off < 0)
+		return;
+	for (node = fdt_first_subnode(blob, off);
+	     node >= 0;
+	     node = fdt_next_subnode(blob, node)) {
+		if (!strncmp(fdt_get_name(blob, node, NULL), "optee@", 6))
+			fdt_status_disabled(blob, node);
+	}
+}
+
 /*
  * This function is called right before the kernel is booted. "blob" is the
  * device tree that will be passed to the kernel.
@@ -302,5 +322,8 @@ int ft_system_setup(void *blob, bd_t *bd)
 				       "st,package", pkg, false);
 	}
 
+	if (!CONFIG_IS_ENABLED(STM32MP1_OPTEE))
+		stm32_fdt_disable_optee(blob);
+
 	return ret;
 }
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index a80741f6a2..c5b09f1a2a 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -23,10 +23,6 @@
 #define CONFIG_SYS_SDRAM_BASE			STM32_DDR_BASE
 #define CONFIG_SYS_INIT_SP_ADDR			CONFIG_SYS_TEXT_BASE
 
-#ifdef CONFIG_STM32MP1_OPTEE
-#define CONFIG_SYS_MEM_TOP_HIDE			SZ_32M
-#endif /* CONFIG_STM32MP1_OPTEE */
-
 /*
  * Console I/O buffer size
  */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
