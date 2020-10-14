Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A3928DC84
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:16:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04D6CC3FADE;
	Wed, 14 Oct 2020 09:16:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54F28C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:16:53 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9D80h008187; Wed, 14 Oct 2020 11:16:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=um3B5kTf+7jrfmfGWKKobxN55Y68L80XHOnTxpEvvjs=;
 b=P3ukErKwv3A6TKpAm/ftK64toPmzFkCdwWXaD4DRNa3lGejlj+TOHCX9mdb1J/yxB1K3
 1uhdvFJZYsChLq0wRSgiJ4PmlkMNMTX5NuyJS8ewkWN9iNdvQlTNg76PAheIW+M2bYaR
 pRZOpFvML3DtcPygEs+pF+NDDDqCxYwxlRyfGXQIxnWLL8HFYjP8Ia2bThZeTtueo7un
 ziAmxQVkgZOADo/1HNZIkCGGmffwB1AWyNibg8iCfemhvXLoBBVed0+9hv6Bsa0eo8Dk
 /xv85NKgaVyXxeygCpeujJTfIYDis4g7rvs2iC1fYbfO51lEid3ABMRtbqv/LG2TtfQf Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34356ecffa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:16:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA3BD100038;
 Wed, 14 Oct 2020 11:16:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DFE0C2ABA3E;
 Wed, 14 Oct 2020 11:16:49 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:16:49
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:14 +0200
Message-ID: <20201014091646.4233-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 01/33] arm: stm32mp: migrate trace to log macro
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

Change debug and pr_ macro to log macro and define LOG_CATEGORY.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/boot_params.c   |  8 +++++---
 arch/arm/mach-stm32mp/cmd_stm32key.c  |  3 ++-
 arch/arm/mach-stm32mp/cpu.c           | 18 ++++++++++--------
 arch/arm/mach-stm32mp/dram_init.c     |  8 +++++---
 arch/arm/mach-stm32mp/fdt.c           | 17 ++++++++++-------
 arch/arm/mach-stm32mp/pwr_regulator.c |  2 ++
 arch/arm/mach-stm32mp/spl.c           | 16 +++++++++-------
 7 files changed, 43 insertions(+), 29 deletions(-)

diff --git a/arch/arm/mach-stm32mp/boot_params.c b/arch/arm/mach-stm32mp/boot_params.c
index 37ee9e1612..13322e34d6 100644
--- a/arch/arm/mach-stm32mp/boot_params.c
+++ b/arch/arm/mach-stm32mp/boot_params.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY LOGC_ARCH
+
 #include <common.h>
 #include <log.h>
 #include <asm/sections.h>
@@ -32,15 +34,15 @@ void save_boot_params(unsigned long r0, unsigned long r1, unsigned long r2,
  */
 void *board_fdt_blob_setup(void)
 {
-	debug("%s: nt_fw_dtb=%lx\n", __func__, nt_fw_dtb);
+	log_debug("%s: nt_fw_dtb=%lx\n", __func__, nt_fw_dtb);
 
 	/* use external device tree only if address is valid */
 	if (nt_fw_dtb >= STM32_DDR_BASE) {
 		if (fdt_magic(nt_fw_dtb) == FDT_MAGIC)
 			return (void *)nt_fw_dtb;
-		debug("%s: DTB not found.\n", __func__);
+		log_debug("%s: DTB not found.\n", __func__);
 	}
-	debug("%s: fall back to builtin DTB, %p\n", __func__, &_end);
+	log_debug("%s: fall back to builtin DTB, %p\n", __func__, &_end);
 
 	return (void *)&_end;
 }
diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index f191085a12..86307a9ae8 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -6,6 +6,7 @@
 #include <common.h>
 #include <command.h>
 #include <console.h>
+#include <log.h>
 #include <misc.h>
 #include <dm/device.h>
 #include <dm/uclass.h>
@@ -34,7 +35,7 @@ static void fuse_hash_value(u32 addr, bool print)
 					  DM_GET_DRIVER(stm32mp_bsec),
 					  &dev);
 	if (ret) {
-		pr_err("Can't find stm32mp_bsec driver\n");
+		log_err("Can't find stm32mp_bsec driver\n");
 		return;
 	}
 
diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index f19e5c3f33..ad9f633a29 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -2,6 +2,9 @@
 /*
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
  */
+
+#define LOG_CATEGORY LOGC_ARCH
+
 #include <common.h>
 #include <clk.h>
 #include <cpu_func.h>
@@ -462,8 +465,8 @@ static void setup_boot_mode(void)
 	struct udevice *dev;
 	int alias;
 
-	pr_debug("%s: boot_ctx=0x%x => boot_mode=%x, instance=%d forced=%x\n",
-		 __func__, boot_ctx, boot_mode, instance, forced_mode);
+	log_debug("%s: boot_ctx=0x%x => boot_mode=%x, instance=%d forced=%x\n",
+		  __func__, boot_ctx, boot_mode, instance, forced_mode);
 	switch (boot_mode & TAMP_BOOT_DEVICE_MASK) {
 	case BOOT_SERIAL_UART:
 		if (instance > ARRAY_SIZE(serial_addr))
@@ -509,7 +512,7 @@ static void setup_boot_mode(void)
 		env_set("boot_instance", "0");
 		break;
 	default:
-		pr_debug("unexpected boot mode = %x\n", boot_mode);
+		log_debug("unexpected boot mode = %x\n", boot_mode);
 		break;
 	}
 
@@ -536,7 +539,7 @@ static void setup_boot_mode(void)
 	case BOOT_NORMAL:
 		break;
 	default:
-		pr_debug("unexpected forced boot mode = %x\n", forced_mode);
+		log_debug("unexpected forced boot mode = %x\n", forced_mode);
 		break;
 	}
 
@@ -576,14 +579,13 @@ __weak int setup_mac_address(void)
 		enetaddr[i] = ((uint8_t *)&otp)[i];
 
 	if (!is_valid_ethaddr(enetaddr)) {
-		pr_err("invalid MAC address in OTP %pM\n", enetaddr);
+		log_err("invalid MAC address in OTP %pM\n", enetaddr);
 		return -EINVAL;
 	}
-	pr_debug("OTP MAC address = %pM\n", enetaddr);
+	log_debug("OTP MAC address = %pM\n", enetaddr);
 	ret = eth_env_set_enetaddr("ethaddr", enetaddr);
 	if (ret)
-		pr_err("Failed to set mac address %pM from OTP: %d\n",
-		       enetaddr, ret);
+		log_err("Failed to set mac address %pM from OTP: %d\n", enetaddr, ret);
 #endif
 
 	return 0;
diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
index 0e8ce63f4a..32b177bb79 100644
--- a/arch/arm/mach-stm32mp/dram_init.c
+++ b/arch/arm/mach-stm32mp/dram_init.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY LOGC_ARCH
+
 #include <common.h>
 #include <dm.h>
 #include <image.h>
@@ -21,15 +23,15 @@ int dram_init(void)
 
 	ret = uclass_get_device(UCLASS_RAM, 0, &dev);
 	if (ret) {
-		debug("RAM init failed: %d\n", ret);
+		log_debug("RAM init failed: %d\n", ret);
 		return ret;
 	}
 	ret = ram_get_info(dev, &ram);
 	if (ret) {
-		debug("Cannot get RAM size: %d\n", ret);
+		log_debug("Cannot get RAM size: %d\n", ret);
 		return ret;
 	}
-	debug("RAM init base=%lx, size=%x\n", ram.base, ram.size);
+	log_debug("RAM init base=%lx, size=%x\n", ram.base, ram.size);
 
 	gd->ram_size = ram.size;
 
diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
index 0de1d82291..aaedeac8d5 100644
--- a/arch/arm/mach-stm32mp/fdt.c
+++ b/arch/arm/mach-stm32mp/fdt.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2019-2020, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY LOGC_ARCH
+
 #include <common.h>
 #include <fdt_support.h>
 #include <log.h>
@@ -172,15 +174,15 @@ static int stm32_fdt_fixup_etzpc(void *fdt, int soc_node)
 		status = (decprot[offset] >> shift) & DECPROT_MASK;
 		addr = array[i];
 
-		debug("ETZPC: 0x%08x decprot %d=%d\n", addr, i, status);
+		log_debug("ETZPC: 0x%08x decprot %d=%d\n", addr, i, status);
 
 		if (addr == ETZPC_RESERVED ||
 		    status == DECPROT_NON_SECURED)
 			continue;
 
 		if (fdt_disable_subnode_by_address(fdt, soc_node, addr))
-			printf("ETZPC: 0x%08x node disabled, decprot %d=%d\n",
-			       addr, i, status);
+			log_notice("ETZPC: 0x%08x node disabled, decprot %d=%d\n",
+				   addr, i, status);
 	}
 
 	return 0;
@@ -194,7 +196,7 @@ static void stm32_fdt_fixup_cpu(void *blob, char *name)
 
 	off = fdt_path_offset(blob, "/cpus");
 	if (off < 0) {
-		printf("%s: couldn't find /cpus node\n", __func__);
+		log_warning("%s: couldn't find /cpus node\n", __func__);
 		return;
 	}
 
@@ -203,7 +205,8 @@ static void stm32_fdt_fixup_cpu(void *blob, char *name)
 		reg = fdtdec_get_addr(blob, off, "reg");
 		if (reg != 0) {
 			fdt_del_node(blob, off);
-			printf("FDT: cpu %d node remove for %s\n", reg, name);
+			log_notice("FDT: cpu %d node remove for %s\n",
+				   reg, name);
 			/* after delete we can't trust the offsets anymore */
 			off = -1;
 		}
@@ -216,8 +219,8 @@ static void stm32_fdt_disable(void *fdt, int offset, u32 addr,
 			      const char *string, const char *name)
 {
 	if (fdt_disable_subnode_by_address(fdt, offset, addr))
-		printf("FDT: %s@%08x node disabled for %s\n",
-		       string, addr, name);
+		log_notice("FDT: %s@%08x node disabled for %s\n",
+			   string, addr, name);
 }
 
 static void stm32_fdt_disable_optee(void *blob)
diff --git a/arch/arm/mach-stm32mp/pwr_regulator.c b/arch/arm/mach-stm32mp/pwr_regulator.c
index 900dee4c38..b9b4c7d439 100644
--- a/arch/arm/mach-stm32mp/pwr_regulator.c
+++ b/arch/arm/mach-stm32mp/pwr_regulator.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY UCLASS_REGULATOR
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
index e84bdad7bf..4c3c691c32 100644
--- a/arch/arm/mach-stm32mp/spl.c
+++ b/arch/arm/mach-stm32mp/spl.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY LOGC_ARCH
+
 #include <common.h>
 #include <cpu_func.h>
 #include <dm.h>
@@ -78,7 +80,7 @@ void spl_display_print(void)
 	 */
 	model = fdt_getprop(gd->fdt_blob, 0, "model", NULL);
 	if (model)
-		printf("Model: %s\n", model);
+		log_info("Model: %s\n", model);
 }
 #endif
 
@@ -96,25 +98,25 @@ void board_init_f(ulong dummy)
 
 	ret = spl_early_init();
 	if (ret) {
-		debug("spl_early_init() failed: %d\n", ret);
+		log_debug("spl_early_init() failed: %d\n", ret);
 		hang();
 	}
 
 	ret = uclass_get_device(UCLASS_CLK, 0, &dev);
 	if (ret) {
-		debug("Clock init failed: %d\n", ret);
+		log_debug("Clock init failed: %d\n", ret);
 		hang();
 	}
 
 	ret = uclass_get_device(UCLASS_RESET, 0, &dev);
 	if (ret) {
-		debug("Reset init failed: %d\n", ret);
+		log_debug("Reset init failed: %d\n", ret);
 		hang();
 	}
 
 	ret = uclass_get_device(UCLASS_PINCTRL, 0, &dev);
 	if (ret) {
-		debug("%s: Cannot find pinctrl device\n", __func__);
+		log_debug("%s: Cannot find pinctrl device\n", __func__);
 		hang();
 	}
 
@@ -123,13 +125,13 @@ void board_init_f(ulong dummy)
 
 	ret = board_early_init_f();
 	if (ret) {
-		debug("board_early_init_f() failed: %d\n", ret);
+		log_debug("board_early_init_f() failed: %d\n", ret);
 		hang();
 	}
 
 	ret = uclass_get_device(UCLASS_RAM, 0, &dev);
 	if (ret) {
-		printf("DRAM init failed: %d\n", ret);
+		log_err("DRAM init failed: %d\n", ret);
 		hang();
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
