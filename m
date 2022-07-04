Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6B656640C
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Jul 2022 09:30:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91835C640F5;
	Tue,  5 Jul 2022 07:30:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8017C640ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 11:12:46 +0000 (UTC)
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4BC9E844D6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 13:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656933166;
 bh=rp4ZJmlDoLVC5loSJrvAUs7JdrUS5hrPrtPpaOK6rwM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MIfLn40URfnMYlVzaDubzRcCxQlwL6tWELChtkDO2iCgiHG5xY3J5X/EsBiyF1+WI
 q3bZfy33uxJhnAoYkW7jaRU/yvyZvMLsjAanT2yY8EAGq87bP90XB1bMs14OruXEOT
 9E7AxeUJZid5E5N9mkvLkzIhuQHFPYyjT2QEf6nV/bYyT6znzb5xHxWt23wEJ3kj0A
 lIooZ4MYvj1COIyT8mNmvHTsXaUy9u8Cb2Ov6MXB5iKeteBuwkkStLuGmu7i3L7SBn
 iBg0fulKqs9fU1EUBYd2cle0tUzjkFZXP0yqJA3sANSWFaqZ7b3lpZdgRhDYbh+zKL
 D6qpYYqSwOW8w==
Received: by janitor.denx.de (Postfix, from userid 108)
 id ECD51A020E; Mon,  4 Jul 2022 13:12:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on janitor.denx.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=ham autolearn_force=no version=3.4.2
Received: from xpert.denx.de (xpert.denx.de [192.168.0.4])
 by janitor.denx.de (Postfix) with ESMTPS id 6BE12A005A;
 Mon,  4 Jul 2022 13:12:41 +0200 (CEST)
Received: by xpert.denx.de (Postfix, from userid 535)
 id 624BC3E06E7; Mon,  4 Jul 2022 13:12:41 +0200 (CEST)
From: Philip Oberfichtner <pro@denx.de>
To: u-boot@lists.denx.de
Date: Mon,  4 Jul 2022 13:11:06 +0200
Message-Id: <20220704111106.1415208-5-pro@denx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220704111106.1415208-1-pro@denx.de>
References: <20220704111106.1415208-1-pro@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Tue, 05 Jul 2022 07:30:14 +0000
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, peng.fan@nxp.com,
 festevam@denx.de, u-boot@dh-electronics.com, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Philip Oberfichtner <pro@denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, sbabic@denx.de
Subject: [Uboot-stm32] [PATCH 4/4] ARM: stm32: DH: Use common mac address
	functions
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

To reduce code duplication, let the stm32 based DH boards use the common
code for setting up their mac addresses.

Signed-off-by: Philip Oberfichtner <pro@denx.de>

---

 board/dhelectronics/dh_stm32mp1/board.c | 104 +++++++++++-------------
 1 file changed, 47 insertions(+), 57 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index d407f0bf59..5d83d9cd3f 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -43,6 +43,7 @@
 #include <usb/dwc2_udc.h>
 #include <watchdog.h>
 #include <dm/ofnode.h>
+#include "../common/dh_common.h"
 #include "../../st/common/stpmic1.h"
 
 /* SYSCFG registers */
@@ -90,35 +91,18 @@ DECLARE_GLOBAL_DATA_PTR;
 #define KS_CIDER	0xC0
 #define CIDER_ID	0x8870
 
-int setup_mac_address(void)
-{
-	unsigned char enetaddr[6];
-	bool skip_eth0 = false;
-	bool skip_eth1 = false;
-	struct udevice *dev;
-	int off, ret;
 
-	ret = eth_env_get_enetaddr("ethaddr", enetaddr);
-	if (ret)	/* ethaddr is already set */
-		skip_eth0 = true;
+static bool dh_stm32_mac_is_in_ks8851(void)
+{
+	int off;
+	u32 reg, cider, ccr;
 
 	off = fdt_path_offset(gd->fdt_blob, "ethernet1");
-	if (off < 0) {
-		/* ethernet1 is not present in the system */
-		skip_eth1 = true;
-		goto out_set_ethaddr;
-	}
+	if (off < 0)
+		return false;
 
-	ret = eth_env_get_enetaddr("eth1addr", enetaddr);
-	if (ret) {
-		/* eth1addr is already set */
-		skip_eth1 = true;
-		goto out_set_ethaddr;
-	}
-
-	ret = fdt_node_check_compatible(gd->fdt_blob, off, "micrel,ks8851-mll");
-	if (ret)
-		goto out_set_ethaddr;
+	if (fdt_node_check_compatible(gd->fdt_blob, off, "micrel,ks8851-mll"))
+		return false;
 
 	/*
 	 * KS8851 with EEPROM may use custom MAC from EEPROM, read
@@ -126,56 +110,62 @@ int setup_mac_address(void)
 	 * is present. If EEPROM is present, it must contain valid
 	 * MAC address.
 	 */
-	u32 reg, cider, ccr;
 	reg = fdt_get_base_address(gd->fdt_blob, off);
 	if (!reg)
-		goto out_set_ethaddr;
+		return false;
 
 	writew(KS_BE0 | KS_BE1 | KS_CIDER, reg + 2);
 	cider = readw(reg);
-	if ((cider & 0xfff0) != CIDER_ID) {
-		skip_eth1 = true;
-		goto out_set_ethaddr;
-	}
+	if ((cider & 0xfff0) != CIDER_ID)
+		return true;
 
 	writew(KS_BE0 | KS_BE1 | KS_CCR, reg + 2);
 	ccr = readw(reg);
-	if (ccr & KS_CCR_EEPROM) {
-		skip_eth1 = true;
-		goto out_set_ethaddr;
-	}
+	if (ccr & KS_CCR_EEPROM)
+		return true;
+
+	return false;
+}
+
+static int dh_stm32_setup_ethaddr(void)
+{
+	unsigned char enetaddr[6];
 
-out_set_ethaddr:
-	if (skip_eth0 && skip_eth1)
+	if (dh_mac_is_in_env("ethaddr"))
 		return 0;
 
-	off = fdt_path_offset(gd->fdt_blob, "eeprom0");
-	if (off < 0) {
-		printf("%s: No eeprom0 path offset\n", __func__);
-		return off;
-	}
+	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0"))
+		return eth_env_set_enetaddr("ethaddr", enetaddr);
 
-	ret = uclass_get_device_by_of_offset(UCLASS_I2C_EEPROM, off, &dev);
-	if (ret) {
-		printf("Cannot find EEPROM!\n");
-		return ret;
-	}
+	return -ENXIO;
+}
 
-	ret = i2c_eeprom_read(dev, 0xfa, enetaddr, 0x6);
-	if (ret) {
-		printf("Error reading configuration EEPROM!\n");
-		return ret;
-	}
+static int dh_stm32_setup_eth1addr(void)
+{
+	unsigned char enetaddr[6];
 
-	if (is_valid_ethaddr(enetaddr)) {
-		if (!skip_eth0)
-			eth_env_set_enetaddr("ethaddr", enetaddr);
+	if (dh_mac_is_in_env("eth1addr"))
+		return 0;
+
+	if (dh_stm32_mac_is_in_ks8851())
+		return 0;
 
+	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0")) {
 		enetaddr[5]++;
-		if (!skip_eth1)
-			eth_env_set_enetaddr("eth1addr", enetaddr);
+		return eth_env_set_enetaddr("eth1addr", enetaddr);
 	}
 
+	return -ENXIO;
+}
+
+int setup_mac_address(void)
+{
+	if (dh_stm32_setup_ethaddr())
+		printf("%s: Unable to setup ethaddr!\n", __func__);
+
+	if (dh_stm32_setup_eth1addr())
+		printf("%s: Unable to setup eth1addr!\n", __func__);
+
 	return 0;
 }
 
-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
