Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5389A8761A8
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Mar 2024 11:13:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBD3BC6C83D;
	Fri,  8 Mar 2024 10:13:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2868C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Mar 2024 10:13:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4286FxoH031642; Fri, 8 Mar 2024 11:13:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=C0NQpfM
 kBt8cf0x4Be6nUzwu9u2Imx+XbfpiPqCjCzA=; b=OdPmCFtwLHgRQ0gQTW0MQGz
 t+vfdRSlH2jk0r3FKZkw0inAPFJ/gyv3IKXElkdz/81lRlnDCmaSWq4K43u/OsH4
 q0wz07D+m5K4HD/W26A/oIzksC+8IJiJW2OPo1nVrzBqd6Y8hsOqubPQkLUI4hAB
 MdDeSK9oA2ZT8ZcXqLwoH+QLkCBjzUuupwgDn14JY+w4CW4G/8zrFjj9CuDdg/iV
 O+i8EMsWCekxrzDGjHQ1w8M8qWCJrDaxAt2fGgG6QhCpXPSbdvP4fgHVaFCV/gJj
 p7Ssi3LlJAlSgDn/ygL0ch7aWEwEy8oC+/CCR3x20R2IcwdJ6aiVZyO40uOh7cQ=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wkuvj3xvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Mar 2024 11:13:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 09F8940047;
 Fri,  8 Mar 2024 11:12:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D567C25ED6B;
 Fri,  8 Mar 2024 11:12:39 +0100 (CET)
Received: from localhost (10.252.7.115) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Mar
 2024 11:12:39 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 8 Mar 2024 11:12:30 +0100
Message-ID: <20240308101230.2595220-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.7.115]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_07,2024-03-06_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [Uboot-stm32] [PATCH] stm32mp: Reserve OPTEE area in EFI memory map
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

Since commit 7b78d6438a2b3 ("efi_loader: Reserve unaccessible memory")
memory region above ram_top is tagged in EFI memory map as
EFI_BOOT_SERVICES_DATA.
In case of STM32MP1 platform, above ram_top, there is one reserved-memory
region tagged "no-map" dedicated to OP-TEE (addr=de000000 size=2000000).

Before booting kernel, EFI memory map is first built, the OPTEE region is
tagged as EFI_BOOT_SERVICES_DATA and when reserving LMB, the tag LMB_NONE
is used.

Then after, the LMB are completed by boot_fdt_add_mem_rsv_regions()
which try to add again the same OPTEE region (addr=de000000 size=2000000)
but now with LMB_NOMAP tag which produces the following error message :

"ERROR: reserving fdt memory region failed (addr=de000000 size=2000000 flags=4)"

To avoid this, OPTEE area shouldn't be used by EFI, so we need to mark
it as reserved.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/dram_init.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
index fb1208fc5d5..f67f54f2ae0 100644
--- a/arch/arm/mach-stm32mp/dram_init.c
+++ b/arch/arm/mach-stm32mp/dram_init.c
@@ -7,6 +7,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <efi_loader.h>
 #include <image.h>
 #include <init.h>
 #include <lmb.h>
@@ -75,3 +76,14 @@ phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 
 	return reg + size;
 }
+
+void efi_add_known_memory(void)
+{
+	if (IS_ENABLED(CONFIG_EFI_LOADER))
+		/*
+		 * Memory over ram_top is reserved to OPTEE.
+		 * Declare to EFI only memory area below ram_top
+		 */
+		efi_add_memory_map(gd->ram_base, gd->ram_top - gd->ram_base,
+				   EFI_CONVENTIONAL_MEMORY);
+}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
