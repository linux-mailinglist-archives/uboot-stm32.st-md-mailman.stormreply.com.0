Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB4D57FB2B
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Jul 2022 10:20:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53C54C5C829;
	Mon, 25 Jul 2022 08:20:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C9BCC03FC0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jul 2022 08:20:36 +0000 (UTC)
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BDD198419E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jul 2022 10:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658737235;
 bh=RYJaoax6CTOghFvncoODiWc7E4KTNOu5FSB3Uz/9WoQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o19wdp9ZvpSXIaJzQLcYWirQ0/M6gpsZ4dDSN5AovMkfpMJcE5dqIgpxIqjRisDW6
 v7x0HodPS535l0xv5i6mruimtc/F/ZmnrIfUFzzycpW3Gzr3Yi7ZR0bnj6WyflD9bV
 /5q/PwtXdQLzkLdevgJ8AubbrjL4icOX2mXD0wU8Egd9d5lltFZIK8Qdna2XwhUSyO
 zlL9EFOhPD1CfD+t26DExEFuYH5I9FwGyNMqpLytkswlem3gjP0DghS8P1G5LlpSoX
 lZtdADekUKiLK+eHKm35WvstIua+HIMRrYngCy2PTzwWYlyOVESUy0FB/UeMELNBim
 mPQBGiTKfD67A==
Received: by janitor.denx.de (Postfix, from userid 108)
 id 6AA2DA00AA; Mon, 25 Jul 2022 10:20:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on janitor.denx.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.2
Received: from xpert.denx.de (xpert.denx.de [192.168.0.4])
 by janitor.denx.de (Postfix) with ESMTPS id E1F5BA025A;
 Mon, 25 Jul 2022 10:20:13 +0200 (CEST)
Received: by xpert.denx.de (Postfix, from userid 535)
 id D3AA33E006E; Mon, 25 Jul 2022 10:20:13 +0200 (CEST)
From: Philip Oberfichtner <pro@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 25 Jul 2022 10:19:50 +0200
Message-Id: <20220725081950.25452-5-pro@denx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220725081950.25452-1-pro@denx.de>
References: <20220725081950.25452-1-pro@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, peng.fan@nxp.com,
 festevam@denx.de, u-boot@dh-electronics.com, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Philip Oberfichtner <pro@denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, sbabic@denx.de
Subject: [Uboot-stm32] [PATCH v3 4/4] ARM: stm32: DH: Use common MAC address
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
code for setting up their MAC addresses.

Signed-off-by: Philip Oberfichtner <pro@denx.de>
Tested-by: Marek Vasut <marex@denx.de>
Reviewed-by: Marek Vasut <marex@denx.de>

---

Changes in v3:
        - Reviewed by Marek

Changes in v2:
        - convert to livetree (rebase on commit 5a605b7c86152)
        - Tested-by Marek

 board/dhelectronics/dh_stm32mp1/board.c | 102 +++++++++++-------------
 1 file changed, 45 insertions(+), 57 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index 7a4c08cb7f..ab354e3e33 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -42,6 +42,7 @@
 #include <usb/dwc2_udc.h>
 #include <watchdog.h>
 #include <dm/ofnode.h>
+#include "../common/dh_common.h"
 #include "../../st/common/stpmic1.h"
 
 /* SYSCFG registers */
@@ -84,36 +85,17 @@
 #define KS_CIDER	0xC0
 #define CIDER_ID	0x8870
 
-int setup_mac_address(void)
+static bool dh_stm32_mac_is_in_ks8851(void)
 {
-	unsigned char enetaddr[6];
-	bool skip_eth0 = false;
-	bool skip_eth1 = false;
-	struct udevice *dev;
-	int ret;
 	ofnode node;
-
-	ret = eth_env_get_enetaddr("ethaddr", enetaddr);
-	if (ret)	/* ethaddr is already set */
-		skip_eth0 = true;
+	u32 reg, cider, ccr;
 
 	node = ofnode_path("ethernet1");
-	if (!ofnode_valid(node)) {
-		/* ethernet1 is not present in the system */
-		skip_eth1 = true;
-		goto out_set_ethaddr;
-	}
+	if (!ofnode_valid(node))
+		return false;
 
-	ret = eth_env_get_enetaddr("eth1addr", enetaddr);
-	if (ret) {
-		/* eth1addr is already set */
-		skip_eth1 = true;
-		goto out_set_ethaddr;
-	}
-
-	ret = ofnode_device_is_compatible(node, "micrel,ks8851-mll");
-	if (ret)
-		goto out_set_ethaddr;
+	if (ofnode_device_is_compatible(node, "micrel,ks8851-mll"))
+		return false;
 
 	/*
 	 * KS8851 with EEPROM may use custom MAC from EEPROM, read
@@ -121,56 +103,62 @@ int setup_mac_address(void)
 	 * is present. If EEPROM is present, it must contain valid
 	 * MAC address.
 	 */
-	u32 reg, cider, ccr;
 	reg = ofnode_get_addr(node);
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
 
-out_set_ethaddr:
-	if (skip_eth0 && skip_eth1)
+static int dh_stm32_setup_ethaddr(void)
+{
+	unsigned char enetaddr[6];
+
+	if (dh_mac_is_in_env("ethaddr"))
 		return 0;
 
-	node = ofnode_path("eeprom0");
-	if (!ofnode_valid(node)) {
-		printf("%s: No eeprom0 path offset\n", __func__);
-		return -ENOENT;
-	}
+	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0"))
+		return eth_env_set_enetaddr("ethaddr", enetaddr);
 
-	ret = uclass_get_device_by_ofnode(UCLASS_I2C_EEPROM, node, &dev);
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
 
+	if (dh_stm32_mac_is_in_ks8851())
+		return 0;
+
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
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
