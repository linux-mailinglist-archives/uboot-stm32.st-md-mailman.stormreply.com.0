Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D153A5200D0
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 May 2022 17:13:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FA49C5EC6C;
	Mon,  9 May 2022 15:13:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4430CC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 May 2022 15:13:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249EOP4E011800;
 Mon, 9 May 2022 17:13:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=IFOxyQ37Bsmjh2K/bY/tNgEhPmCthrDpZlv7DjaBYr0=;
 b=RXeoRawQp0p4p9/uPFKss3sPfpuJRRRPm/jXRGQLVXhqGzwdGHynDeXln+E63jKpKnfe
 WFBOPKCizHLkMGyLQ7UQ853T23nYej1TfCxSxagmLiCHottXAgQF160Cpvjp+V5gpYog
 JPa5Aal6uZTw9aWPJPeGL6+OTm5ZrZDalDvBV+E8pzqFi+gRPIpp3kNcmA9QfKiXROvW
 jXGz4Kz6yx2stauLAhAIbLqLLOLqEik6a4zU8WfKqhlO9tlE4vW7VkU0c8JOgnYzSV34
 TWOFelcAGL+xAyV5u//lvLnsJDXBgWAiP17D+P9Ig604MgBLjjSywCXo5xu5esc7wywW Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwfngc7af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 May 2022 17:13:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B74F100034;
 Mon,  9 May 2022 17:13:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 944E022A6DD;
 Mon,  9 May 2022 17:13:32 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 9 May 2022 17:13:32
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 9 May 2022 17:13:21 +0200
Message-ID: <20220509171309.1.Ie4f29021d76802af1c22e1df1a6a55ae6a5f55d9@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_04,2022-05-09_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] stm32mp: fdt: update etzpc for STM32MP15x
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

Introduce STM32MP15 function and defines to prepare the
STM32MP13 introduction.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/fdt.c | 123 ++++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 56 deletions(-)

diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
index ad45728949..5d37a44d97 100644
--- a/arch/arm/mach-stm32mp/fdt.c
+++ b/arch/arm/mach-stm32mp/fdt.c
@@ -28,13 +28,13 @@
 
 #define ETZPC_RESERVED		0xffffffff
 
-#define STM32_FDCAN_BASE	0x4400e000
-#define STM32_CRYP2_BASE	0x4c005000
-#define STM32_CRYP1_BASE	0x54001000
-#define STM32_GPU_BASE		0x59000000
-#define STM32_DSI_BASE		0x5a000000
+#define STM32MP15_FDCAN_BASE	0x4400e000
+#define STM32MP15_CRYP2_BASE	0x4c005000
+#define STM32MP15_CRYP1_BASE	0x54001000
+#define STM32MP15_GPU_BASE	0x59000000
+#define STM32MP15_DSI_BASE	0x5a000000
 
-static const u32 stm32mp1_ip_addr[] = {
+static const u32 stm32mp15_ip_addr[] = {
 	0x5c008000,	/* 00 stgenc */
 	0x54000000,	/* 01 bkpsram */
 	0x5c003000,	/* 02 iwdg1 */
@@ -44,7 +44,7 @@ static const u32 stm32mp1_ip_addr[] = {
 	ETZPC_RESERVED,	/* 06 reserved */
 	0x54003000,	/* 07 rng1 */
 	0x54002000,	/* 08 hash1 */
-	STM32_CRYP1_BASE,	/* 09 cryp1 */
+	STM32MP15_CRYP1_BASE,	/* 09 cryp1 */
 	0x5a003000,	/* 0A ddrctrl */
 	0x5a004000,	/* 0B ddrphyc */
 	0x5c009000,	/* 0C i2c6 */
@@ -97,7 +97,7 @@ static const u32 stm32mp1_ip_addr[] = {
 	0x4400b000,	/* 3B sai2 */
 	0x4400c000,	/* 3C sai3 */
 	0x4400d000,	/* 3D dfsdm */
-	STM32_FDCAN_BASE,	/* 3E tt_fdcan */
+	STM32MP15_FDCAN_BASE,	/* 3E tt_fdcan */
 	ETZPC_RESERVED,	/* 3F reserved */
 	0x50021000,	/* 40 lptim2 */
 	0x50022000,	/* 41 lptim3 */
@@ -110,7 +110,7 @@ static const u32 stm32mp1_ip_addr[] = {
 	0x48003000,	/* 48 adc */
 	0x4c002000,	/* 49 hash2 */
 	0x4c003000,	/* 4A rng2 */
-	STM32_CRYP2_BASE,	/* 4B cryp2 */
+	STM32MP15_CRYP2_BASE,	/* 4B cryp2 */
 	ETZPC_RESERVED,	/* 4C reserved */
 	ETZPC_RESERVED,	/* 4D reserved */
 	ETZPC_RESERVED,	/* 4E reserved */
@@ -163,8 +163,13 @@ static int stm32_fdt_fixup_etzpc(void *fdt, int soc_node)
 	int offset, shift;
 	u32 addr, status, decprot[ETZPC_DECPROT_NB];
 
-	array = stm32mp1_ip_addr;
-	array_size = ARRAY_SIZE(stm32mp1_ip_addr);
+	if (IS_ENABLED(CONFIG_STM32MP13x))
+		return 0;
+
+	if (IS_ENABLED(CONFIG_STM32MP15x)) {
+		array = stm32mp15_ip_addr;
+		array_size = ARRAY_SIZE(stm32mp15_ip_addr);
+	}
 
 	for (i = 0; i < ETZPC_DECPROT_NB; i++)
 		decprot[i] = readl(ETZPC_DECPROT(i));
@@ -248,33 +253,9 @@ static void stm32_fdt_disable_optee(void *blob)
 	}
 }
 
-/*
- * This function is called right before the kernel is booted. "blob" is the
- * device tree that will be passed to the kernel.
- */
-int ft_system_setup(void *blob, struct bd_info *bd)
+static void stm32mp15_fdt_fixup(void *blob, int soc, u32 cpu, char *name)
 {
-	int ret = 0;
-	int soc;
-	u32 pkg, cpu;
-	char name[SOC_NAME_SIZE];
-
-	if (IS_ENABLED(CONFIG_STM32MP13x))
-		return 0;
-
-	soc = fdt_path_offset(blob, "/soc");
-	if (soc < 0)
-		return soc;
-
-	if (CONFIG_IS_ENABLED(STM32_ETZPC)) {
-		ret = stm32_fdt_fixup_etzpc(blob, soc);
-		if (ret)
-			return ret;
-	}
-
-	/* MPUs Part Numbers and name*/
-	cpu = get_cpu_type();
-	get_soc_name(name);
+	u32 pkg;
 
 	switch (cpu) {
 	case CPU_STM32MP151Fxx:
@@ -284,19 +265,18 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 		stm32_fdt_fixup_cpu(blob, name);
 		/* after cpu delete we can't trust the soc offsets anymore */
 		soc = fdt_path_offset(blob, "/soc");
-		stm32_fdt_disable(blob, soc, STM32_FDCAN_BASE, "can", name);
-		/* fall through */
+		stm32_fdt_disable(blob, soc, STM32MP15_FDCAN_BASE, "can", name);
+		fallthrough;
 	case CPU_STM32MP153Fxx:
 	case CPU_STM32MP153Dxx:
 	case CPU_STM32MP153Cxx:
 	case CPU_STM32MP153Axx:
-		stm32_fdt_disable(blob, soc, STM32_GPU_BASE, "gpu", name);
-		stm32_fdt_disable(blob, soc, STM32_DSI_BASE, "dsi", name);
+		stm32_fdt_disable(blob, soc, STM32MP15_GPU_BASE, "gpu", name);
+		stm32_fdt_disable(blob, soc, STM32MP15_DSI_BASE, "dsi", name);
 		break;
 	default:
 		break;
 	}
-
 	switch (cpu) {
 	case CPU_STM32MP157Dxx:
 	case CPU_STM32MP157Axx:
@@ -304,13 +284,14 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 	case CPU_STM32MP153Axx:
 	case CPU_STM32MP151Dxx:
 	case CPU_STM32MP151Axx:
-		stm32_fdt_disable(blob, soc, STM32_CRYP1_BASE, "cryp", name);
-		stm32_fdt_disable(blob, soc, STM32_CRYP2_BASE, "cryp", name);
+		stm32_fdt_disable(blob, soc, STM32MP15_CRYP1_BASE, "cryp",
+				  name);
+		stm32_fdt_disable(blob, soc, STM32MP15_CRYP2_BASE, "cryp",
+				  name);
 		break;
 	default:
 		break;
 	}
-
 	switch (get_cpu_package()) {
 	case STM32MP15_PKG_AA_LBGA448:
 		pkg = STM32MP_PKG_AA;
@@ -334,18 +315,48 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 		do_fixup_by_compat_u32(blob, "st,stm32mp157-z-pinctrl",
 				       "st,package", pkg, false);
 	}
+}
+
+/*
+ * This function is called right before the kernel is booted. "blob" is the
+ * device tree that will be passed to the kernel.
+ */
+int ft_system_setup(void *blob, struct bd_info *bd)
+{
+	int ret = 0;
+	int soc;
+	u32 cpu;
+	char name[SOC_NAME_SIZE];
+
+	soc = fdt_path_offset(blob, "/soc");
+	if (soc < 0)
+		return soc;
+
+	if (CONFIG_IS_ENABLED(STM32_ETZPC)) {
+		ret = stm32_fdt_fixup_etzpc(blob, soc);
+		if (ret)
+			return ret;
+	}
 
-	/*
-	 * TEMP: remove OP-TEE nodes in kernel device tree
-	 *       copied from U-Boot device tree by optee_copy_fdt_nodes
-	 *       when OP-TEE is not detected (probe failed)
-	 * these OP-TEE nodes are present in <board>-u-boot.dtsi
-	 * under CONFIG_STM32MP15x_STM32IMAGE only for compatibility
-	 * when FIP is not used by TF-A
-	 */
-	if (CONFIG_IS_ENABLED(STM32MP15x_STM32IMAGE) &&
-	    !tee_find_device(NULL, NULL, NULL, NULL))
-		stm32_fdt_disable_optee(blob);
+	/* MPUs Part Numbers and name*/
+	cpu = get_cpu_type();
+	get_soc_name(name);
+
+	if (IS_ENABLED(CONFIG_STM32MP15x)) {
+		stm32mp15_fdt_fixup(blob, soc, cpu, name);
+
+		/*
+		 * TEMP: remove OP-TEE nodes in kernel device tree
+		 *       copied from U-Boot device tree by optee_copy_fdt_nodes
+		 *       when OP-TEE is not detected (probe failed)
+		 * these OP-TEE nodes are present in <board>-u-boot.dtsi
+		 * under CONFIG_STM32MP15x_STM32IMAGE only for compatibility
+		 * when FIP is not used by TF-A
+		 */
+		if (CONFIG_IS_ENABLED(STM32MP15x_STM32IMAGE) &&
+		    !tee_find_device(NULL, NULL, NULL, NULL))
+			stm32_fdt_disable_optee(blob);
+	}
 
 	return ret;
 }
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
