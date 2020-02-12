Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BF415AFFC
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:38:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8341BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:38:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13498C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:38:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIWmWN015181; Wed, 12 Feb 2020 19:38:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=uETLc7e1J0Pu6Ue8PxFBh+MFmpA7TUsnGMbUCLzVN64=;
 b=oMnexdivW+rEWIcYWvW07W2q9ZDNS9m6epvJCe1UEHqfqBrioiTKd0elpan7PUaByTD+
 jv6T5EXQZOcQEE2tiqAO4yPB5eMcuGmvA6tl2dSk66neCqMd5iLAc/d2KThu+E2bkv+3
 SywVOn7cVJ5x8+redh3Rp3QncRqUBHEHady7QRoZ7vd2ICweydQV/F4jZgqyUFUs5TPP
 DPVMJyXF5M8GD9951aAW0u7WLJ9kp+Zuvye/cpkiPzy+mhbekEWGTJAAV7BiFgqE8UUU
 Z4CDJJY47h/8pT2yp77JAAFPNkB3jvylc2khBGEInwTO0FlxX8PxBQ78LXlQIvX7WJA1 gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uda03af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:38:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B1F710003D;
 Wed, 12 Feb 2020 19:37:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 425582C60AA;
 Wed, 12 Feb 2020 19:37:57 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:37:56 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:37:44 +0100
Message-ID: <20200212183744.5309-11-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183744.5309-1-patrick.delaunay@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 10/10] arm: stm32mp: fdt: update kernel device
	tree according the part number
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

Update the kernel device tree for STM32MP15x product lines according
the used soc and its part number, when CONFIG_OF_SYSTEM_SETUP is activated:
- STM32MP15XA hasn't Crypto (cryp1/2)
- STM32M151 and STM32M153 hasn't 3D GPU and DSI host
- STM32M151 hasn't CAN FD and has single A7

For example:

FDT: cpu 1 node remove for STM32MP151AAA Rev.B
FDT: can@4400e000 node disabled for STM32MP151AAA Rev.B
FDT: gpu@59000000 node disabled for STM32MP151AAA Rev.B
FDT: dsi@5a000000 node disabled for STM32MP151AAA Rev.B

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/fdt.c | 100 +++++++++++++++++++++++++++++++-----
 1 file changed, 88 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
index 82c430b7c7..a3db86dc46 100644
--- a/arch/arm/mach-stm32mp/fdt.c
+++ b/arch/arm/mach-stm32mp/fdt.c
@@ -23,6 +23,12 @@
 
 #define ETZPC_RESERVED		0xffffffff
 
+#define STM32_FDCAN_BASE	0x4400e000
+#define STM32_CRYP2_BASE	0x4c005000
+#define STM32_CRYP1_BASE	0x54001000
+#define STM32_GPU_BASE		0x59000000
+#define STM32_DSI_BASE		0x5a000000
+
 static const u32 stm32mp1_ip_addr[] = {
 	0x5c008000,	/* 00 stgenc */
 	0x54000000,	/* 01 bkpsram */
@@ -33,7 +39,7 @@ static const u32 stm32mp1_ip_addr[] = {
 	ETZPC_RESERVED,	/* 06 reserved */
 	0x54003000,	/* 07 rng1 */
 	0x54002000,	/* 08 hash1 */
-	0x54001000,	/* 09 cryp1 */
+	STM32_CRYP1_BASE,	/* 09 cryp1 */
 	0x5a003000,	/* 0A ddrctrl */
 	0x5a004000,	/* 0B ddrphyc */
 	0x5c009000,	/* 0C i2c6 */
@@ -86,7 +92,7 @@ static const u32 stm32mp1_ip_addr[] = {
 	0x4400b000,	/* 3B sai2 */
 	0x4400c000,	/* 3C sai3 */
 	0x4400d000,	/* 3D dfsdm */
-	0x4400e000,	/* 3E tt_fdcan */
+	STM32_FDCAN_BASE,	/* 3E tt_fdcan */
 	ETZPC_RESERVED,	/* 3F reserved */
 	0x50021000,	/* 40 lptim2 */
 	0x50022000,	/* 41 lptim3 */
@@ -99,7 +105,7 @@ static const u32 stm32mp1_ip_addr[] = {
 	0x48003000,	/* 48 adc */
 	0x4c002000,	/* 49 hash2 */
 	0x4c003000,	/* 4A rng2 */
-	0x4c005000,	/* 4B cryp2 */
+	STM32_CRYP2_BASE,	/* 4B cryp2 */
 	ETZPC_RESERVED,	/* 4C reserved */
 	ETZPC_RESERVED,	/* 4D reserved */
 	ETZPC_RESERVED,	/* 4E reserved */
@@ -126,11 +132,13 @@ static const u32 stm32mp1_ip_addr[] = {
 static bool fdt_disable_subnode_by_address(void *fdt, int offset, u32 addr)
 {
 	int node;
+	fdt_addr_t regs;
 
 	for (node = fdt_first_subnode(fdt, offset);
 	     node >= 0;
 	     node = fdt_next_subnode(fdt, node)) {
-		if (addr == (u32)fdt_getprop(fdt, node, "reg", 0)) {
+		regs = fdtdec_get_addr(fdt, node, "reg");
+		if (addr == regs) {
 			if (fdtdec_get_is_enabled(fdt, node)) {
 				fdt_status_disabled(fdt, node);
 
@@ -143,11 +151,11 @@ static bool fdt_disable_subnode_by_address(void *fdt, int offset, u32 addr)
 	return false;
 }
 
-static int stm32_fdt_fixup_etzpc(void *fdt)
+static int stm32_fdt_fixup_etzpc(void *fdt, int soc_node)
 {
 	const u32 *array;
 	int array_size, i;
-	int soc_node, offset, shift;
+	int offset, shift;
 	u32 addr, status, decprot[ETZPC_DECPROT_NB];
 
 	array = stm32mp1_ip_addr;
@@ -156,10 +164,6 @@ static int stm32_fdt_fixup_etzpc(void *fdt)
 	for (i = 0; i < ETZPC_DECPROT_NB; i++)
 		decprot[i] = readl(ETZPC_DECPROT(i));
 
-	soc_node = fdt_path_offset(fdt, "/soc");
-	if (soc_node < 0)
-		return soc_node;
-
 	for (i = 0; i < array_size; i++) {
 		offset = i / NB_PROT_PER_REG;
 		shift = (i % NB_PROT_PER_REG) * DECPROT_NB_BITS;
@@ -180,6 +184,40 @@ static int stm32_fdt_fixup_etzpc(void *fdt)
 	return 0;
 }
 
+/* deactivate all the cpu except core 0 */
+static void stm32_fdt_fixup_cpu(void *blob, char *name)
+{
+	int off;
+	u32 reg;
+
+	off = fdt_path_offset(blob, "/cpus");
+	if (off < 0) {
+		printf("%s: couldn't find /cpus node\n", __func__);
+		return;
+	}
+
+	off = fdt_node_offset_by_prop_value(blob, -1, "device_type", "cpu", 4);
+	while (off != -FDT_ERR_NOTFOUND) {
+		reg = fdtdec_get_addr(blob, off, "reg");
+		if (reg != 0) {
+			fdt_del_node(blob, off);
+			printf("FDT: cpu %d node remove for %s\n", reg, name);
+			/* after delete we can't trust the offsets anymore */
+			off = -1;
+		}
+		off = fdt_node_offset_by_prop_value(blob, off,
+						    "device_type", "cpu", 4);
+	}
+}
+
+static void stm32_fdt_disable(void *fdt, int offset, u32 addr,
+			      const char *string, const char *name)
+{
+	if (fdt_disable_subnode_by_address(fdt, offset, addr))
+		printf("FDT: %s@%08x node disabled for %s\n",
+		       string, addr, name);
+}
+
 /*
  * This function is called right before the kernel is booted. "blob" is the
  * device tree that will be passed to the kernel.
@@ -187,14 +225,52 @@ static int stm32_fdt_fixup_etzpc(void *fdt)
 int ft_system_setup(void *blob, bd_t *bd)
 {
 	int ret = 0;
-	u32 pkg;
+	int soc;
+	u32 pkg, cpu;
+	char name[SOC_NAME_SIZE];
+
+	soc = fdt_path_offset(blob, "/soc");
+	if (soc < 0)
+		return soc;
 
 	if (CONFIG_IS_ENABLED(STM32_ETZPC)) {
-		ret = stm32_fdt_fixup_etzpc(blob);
+		ret = stm32_fdt_fixup_etzpc(blob, soc);
 		if (ret)
 			return ret;
 	}
 
+	/* MPUs Part Numbers and name*/
+	cpu = get_cpu_type();
+	get_soc_name(name);
+
+	switch (cpu) {
+	case CPU_STM32MP151Cxx:
+	case CPU_STM32MP151Axx:
+		stm32_fdt_fixup_cpu(blob, name);
+		/* after cpu delete we can't trust the soc offsets anymore */
+		soc = fdt_path_offset(blob, "/soc");
+		stm32_fdt_disable(blob, soc, STM32_FDCAN_BASE, "can", name);
+		/* fall through */
+	case CPU_STM32MP153Cxx:
+	case CPU_STM32MP153Axx:
+		stm32_fdt_disable(blob, soc, STM32_GPU_BASE, "gpu", name);
+		stm32_fdt_disable(blob, soc, STM32_DSI_BASE, "dsi", name);
+		break;
+	default:
+		break;
+	}
+
+	switch (cpu) {
+	case CPU_STM32MP157Axx:
+	case CPU_STM32MP153Axx:
+	case CPU_STM32MP151Axx:
+		stm32_fdt_disable(blob, soc, STM32_CRYP1_BASE, "cryp", name);
+		stm32_fdt_disable(blob, soc, STM32_CRYP2_BASE, "cryp", name);
+		break;
+	default:
+		break;
+	}
+
 	switch (get_cpu_package()) {
 	case PKG_AA_LBGA448:
 		pkg = STM32MP_PKG_AA;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
