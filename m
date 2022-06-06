Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE0A53E504
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jun 2022 16:21:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63B2FC0D2BF;
	Mon,  6 Jun 2022 14:21:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C7EFC0D2BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jun 2022 14:21:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256DT9EW011039;
 Mon, 6 Jun 2022 16:21:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=cjuFPkdImqi11gNmVxIbYQ1KELwKE2qY++Ts1HXzgxU=;
 b=UBLefo0+r0R0Kheokmzuowe6YMcZuVzK/hzyvZ1+jkDLSkzFh3pfnfImBJtQp41NEyvM
 Y/956XGffkM+7xdt8k6jlInIfgaZNTUXxjhYjmKxmxy+G69YjNilOHhFq5YIDwoD+cQt
 RqlsE1xtIt9DqVhUGerdy8soa/VPXEJzoWsMJGK9LX8dPyqlSwf5vCFEc/pNpeg9St4X
 UwKW6heV5K2Kc+whkUTQ4g1fa7sChhKU67M0OFp1tbSWdRmpqK6TNK12fOeTSeS5OXMe
 HOeKT9hLVlqiySbd6SKs6dcHqXaYwleKfGAJAUs0oY+RIBY01sUHOuZ6Evsk/QVwdBEm KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gfxr22pc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jun 2022 16:21:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29A661000FE;
 Mon,  6 Jun 2022 16:04:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CD2422A6DB;
 Mon,  6 Jun 2022 16:04:19 +0200 (CEST)
Received: from localhost (10.75.127.50) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 6 Jun
 2022 16:04:18 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 6 Jun 2022 16:04:15 +0200
Message-ID: <20220606160414.v1.1.I4f6455f026820524103f7fbdffaafd3b75585197@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-06_04,2022-06-03_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH v1 1/2] board: dhelectronics: stm32mp1:
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

Tested-by: Marek Vasut <marex@denx.de>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v1:
- previously sent as RFC, Tested by Marek
  http://patchwork.ozlabs.org/project/uboot/list/?series=301157

 board/dhelectronics/dh_stm32mp1/board.c | 38 +++++++++++--------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index d407f0bf59..7a4c08cb7f 100644
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
+					 &fdt_compat_len);
 	if (fdt_compat && fdt_compat_len) {
 		if (strncmp(fdt_compat, "st,", 3) != 0)
 			env_set("board_name", fdt_compat);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
