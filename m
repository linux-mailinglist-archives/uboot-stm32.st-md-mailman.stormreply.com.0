Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 906D952DA8C
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 May 2022 18:46:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AC75C03FCD;
	Thu, 19 May 2022 16:46:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED62AC03FCC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 16:46:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBWRSV017719;
 Thu, 19 May 2022 18:46:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=c4ON0j4rRHVjqEZ2IHZC2z2PYJHxlOCWFW3FYaHFjEE=;
 b=UbK4exUouZ4FmeT+OirREONRgeZhRIueKe1BmHtCe0gldrdgRGMU4KQ8vO/eS8N36w8W
 8oqlZqV7sRDKj0C4b7XH2HyoNd9FH6RowpAFK4pkIwApgNBcv+i2c3hAY6Z/KPqeTAOP
 0nctXNwWIWkTSdxIWSqHJhSTUzhOIweZ8ybZyfgVUBxkVUOaE7+18nTCPR9iKvzyOysV
 RK2Q59aRJj2GhXt/GCpB3Z+9sfIzGlH5Eyv/qd8uGDKvrhHkTLALEXsJkPPfjkV0A9jH
 LBNmUNKgfJkRT40HaEZrBsEz2DUkgVMZuyPr5Zk15MhQx5oLSShO8yCq84PQv7D6SdS8 iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j9ay40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 18:46:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DFEB10002A;
 Thu, 19 May 2022 18:46:46 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 417D722FA2B;
 Thu, 19 May 2022 18:46:46 +0200 (CEST)
Received: from localhost (10.75.127.50) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 19 May
 2022 18:46:41 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 May 2022 18:46:32 +0200
Message-ID: <20220519184552.RFC.1.I4f6455f026820524103f7fbdffaafd3b75585197@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_05,2022-05-19_03,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@dh-electronics.com
Subject: [Uboot-stm32] [RFC PATCH 1/2] board: dhelectronics: stm32mp1:
	convert to livetree
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

Replace call to fdt_*() functions and access to gd->fdt_blob
with call to ofnode_*() functions to support a live tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/dhelectronics/dh_stm32mp1/board.c | 38 +++++++++++--------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index d407f0bf59..f5afe97c73 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -9,7 +9,6 @@
 #include <net.h>
 #include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
-#include <asm/global_data.h>
 #include <asm/gpio.h>
 #include <asm/io.h>
 #include <bootm.h>
@@ -78,11 +77,6 @@
 #define SYSCFG_PMCSETR_ETH_SEL_RGMII	BIT(21)
 #define SYSCFG_PMCSETR_ETH_SEL_RMII	BIT(23)
 
-/*
- * Get a global data pointer
- */
-DECLARE_GLOBAL_DATA_PTR;
-
 #define KS_CCR		0x08
 #define KS_CCR_EEPROM	BIT(9)
 #define KS_BE0		BIT(12)
@@ -96,14 +90,15 @@ int setup_mac_address(void)
 	bool skip_eth0 = false;
 	bool skip_eth1 = false;
 	struct udevice *dev;
-	int off, ret;
+	int ret;
+	ofnode node;
 
 	ret = eth_env_get_enetaddr("ethaddr", enetaddr);
 	if (ret)	/* ethaddr is already set */
 		skip_eth0 = true;
 
-	off = fdt_path_offset(gd->fdt_blob, "ethernet1");
-	if (off < 0) {
+	node = ofnode_path("ethernet1");
+	if (!ofnode_valid(node)) {
 		/* ethernet1 is not present in the system */
 		skip_eth1 = true;
 		goto out_set_ethaddr;
@@ -116,7 +111,7 @@ int setup_mac_address(void)
 		goto out_set_ethaddr;
 	}
 
-	ret = fdt_node_check_compatible(gd->fdt_blob, off, "micrel,ks8851-mll");
+	ret = ofnode_device_is_compatible(node, "micrel,ks8851-mll");
 	if (ret)
 		goto out_set_ethaddr;
 
@@ -127,7 +122,7 @@ int setup_mac_address(void)
 	 * MAC address.
 	 */
 	u32 reg, cider, ccr;
-	reg = fdt_get_base_address(gd->fdt_blob, off);
+	reg = ofnode_get_addr(node);
 	if (!reg)
 		goto out_set_ethaddr;
 
@@ -149,13 +144,13 @@ out_set_ethaddr:
 	if (skip_eth0 && skip_eth1)
 		return 0;
 
-	off = fdt_path_offset(gd->fdt_blob, "eeprom0");
-	if (off < 0) {
+	node = ofnode_path("eeprom0");
+	if (!ofnode_valid(node)) {
 		printf("%s: No eeprom0 path offset\n", __func__);
-		return off;
+		return -ENOENT;
 	}
 
-	ret = uclass_get_device_by_of_offset(UCLASS_I2C_EEPROM, off, &dev);
+	ret = uclass_get_device_by_ofnode(UCLASS_I2C_EEPROM, node, &dev);
 	if (ret) {
 		printf("Cannot find EEPROM!\n");
 		return ret;
@@ -191,8 +186,8 @@ int checkboard(void)
 		mode = "basic";
 
 	printf("Board: stm32mp1 in %s mode", mode);
-	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
-				 &fdt_compat_len);
+	fdt_compat = ofnode_get_property(ofnode_root(), "compatible",
+					 &fdt_compat_len);
 	if (fdt_compat && fdt_compat_len)
 		printf(" (%s)", fdt_compat);
 	puts("\n");
@@ -289,7 +284,7 @@ int board_fit_config_name_match(const char *name)
 	const char *compat;
 	char test[128];
 
-	compat = fdt_getprop(gd->fdt_blob, 0, "compatible", NULL);
+	compat = ofnode_get_property(ofnode_root(), "compatible", NULL);
 
 	snprintf(test, sizeof(test), "%s_somrev%d_boardrev%d",
 		compat, somcode, brdcode);
@@ -604,14 +599,13 @@ static void board_init_fmc2(void)
 #define STPMIC_NVM_BUCKS_VOUT_SHR_BUCK_OFFSET(n)	((((n) - 1) & 3) * 2)
 static int board_get_regulator_buck3_nvm_uv_av96(int *uv)
 {
-	const void *fdt = gd->fdt_blob;
 	struct udevice *dev;
 	u8 bucks_vout = 0;
 	const char *prop;
 	int len, ret;
 
 	/* Check whether this is Avenger96 board. */
-	prop = fdt_getprop(fdt, 0, "compatible", &len);
+	prop = ofnode_get_property(ofnode_root(), "compatible", &len);
 	if (!prop || !len)
 		return -ENODEV;
 
@@ -701,8 +695,8 @@ int board_late_init(void)
 	const void *fdt_compat;
 	int fdt_compat_len;
 
-	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
-				 &fdt_compat_len);
+	fdt_compat = ofnode_get_property(ofnode_root(), "compatible",
+					  &fdt_compat_len);
 	if (fdt_compat && fdt_compat_len) {
 		if (strncmp(fdt_compat, "st,", 3) != 0)
 			env_set("board_name", fdt_compat);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
