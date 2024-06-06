Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF7E8FE705
	for <lists+uboot-stm32@lfdr.de>; Thu,  6 Jun 2024 15:02:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DFD3C6DD67;
	Thu,  6 Jun 2024 13:02:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03638C030CA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jun 2024 13:02:40 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0CE8387666;
 Thu,  6 Jun 2024 15:02:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717678960;
 bh=23z1ORnaf1u25zvpf1Q3SGg8/rIdTwrB9Zrzf75ZDF0=;
 h=From:To:Cc:Subject:Date:From;
 b=gas3ImJsdLjNvTAxHFrhObIcVuPG+haz0mET8W4WupAp3gx6M1nBfvElp+99p5l40
 146+4kGg1n9HMqXB4bEzgJP/oyZHdKGxg5gYaGqOO1WfEXjU0eH6LndCWGNNprGUHJ
 Ap6Rw6mxQgIKhe3gsg5EUq6/2GUEOIcMkri0CKf4JPmz2xCMK5M/kW/LERSuGSuThH
 +J9gYj/5Yzi1PJ04ivZUbSPUYBjYsejTmsAs/W29A1aPNOY1II0TypGtfZGlXOC/ld
 WkzhYvDagC1Vt1hj4/H4dlu5j1v/tjOfcSc+xCOqrxc5GUhwhZ9RK7n6e0JMqoqcqJ
 sKE2asxKamqQw==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Thu,  6 Jun 2024 15:01:48 +0200
Message-ID: <20240606130222.24530-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Auto-detect second MAC on
	STM32MP15xx DH electronics DHCOM
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

Test whether this system is compatible with STM32MP15xx DHCOM SoM,
if so, test whether R292 pull up is populated on pin PC3, which is
an indication that the second MAC chip, KS8851-16MLL, is populated.
Use this information to patch 'status' DT property into the second
ethernet MAC DT node and enable/disable the MAC on systems where
the chip is/isn't populated respectively.

Use spl_perform_fixups() to patch the U-Boot proper DT from SPL and
ft_board_setup() to patch Linux DT from U-Boot proper. This way both
software components are configured the same way.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi |  1 +
 board/dhelectronics/dh_stm32mp1/board.c    | 65 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
index 1b445619325..d7b78cdcfa9 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
@@ -26,6 +26,7 @@
 		u-boot,error-led = "error";
 		dh,som-coding-gpios = <&gpiof 12 0>, <&gpiof 13 0>, <&gpiof 15 0>;
 		dh,ddr3-coding-gpios = <&gpioz 6 0>, <&gpioz 7 0>;
+		dh,mac-coding-gpios = <&gpioc 3 0>;
 	};
 };
 
diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index 20c9d70737e..ebd45f9053f 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -37,6 +37,7 @@
 #include <power/regulator.h>
 #include <remoteproc.h>
 #include <reset.h>
+#include <spl.h>
 #include <syscon.h>
 #include <usb.h>
 #include <usb/dwc2_udc.h>
@@ -672,12 +673,69 @@ void board_quiesce_devices(void)
 #endif
 }
 
+static void dh_stm32_ks8851_fixup(void *blob)
+{
+	struct gpio_desc ks8851intrn;
+	bool compatible = false;
+	int ks8851intrn_value;
+	const char *prop;
+	ofnode node;
+	int idx = 0;
+	int offset;
+	int ret;
+
+	/* Do nothing if not STM32MP15xx DHCOM SoM */
+	while ((prop = fdt_stringlist_get(blob, 0, "compatible", idx++, NULL))) {
+		if (!strstr(prop, "dhcom-som"))
+			continue;
+		compatible = true;
+		break;
+	}
+
+	if (!compatible)
+		return;
+
+	/*
+	 * Read state of INTRN pull up resistor, if this pull up is populated,
+	 * KS8851-16MLL is populated as well and should be enabled, otherwise
+	 * it should be disabled.
+	 */
+	node = ofnode_path("/config");
+	if (!ofnode_valid(node))
+		return;
+
+	ret = gpio_request_by_name_nodev(node, "dh,mac-coding-gpios", 0,
+					 &ks8851intrn, GPIOD_IS_IN);
+	if (ret)
+		return;
+
+	ks8851intrn_value = dm_gpio_get_value(&ks8851intrn);
+
+	dm_gpio_free(NULL, &ks8851intrn);
+
+	/* Set the 'status' property into KS8851-16MLL DT node. */
+	offset = fdt_path_offset(blob, "ethernet1");
+	ret = fdt_node_check_compatible(blob, offset, "micrel,ks8851-mll");
+	if (ret)	/* Not compatible */
+		return;
+
+	/* Add a bit of extra space for new 'status' property */
+	ret = fdt_shrink_to_minimum(blob, 4096);
+	if (!ret)
+		return;
+
+	fdt_setprop_string(blob, offset, "status",
+			   ks8851intrn_value ? "okay" : "disabled");
+}
+
 #if defined(CONFIG_OF_BOARD_SETUP)
 int ft_board_setup(void *blob, struct bd_info *bd)
 {
 	const char *buck3path = "/soc/i2c@5c002000/stpmic@33/regulators/buck3";
 	int buck3off, ret, uv;
 
+	dh_stm32_ks8851_fixup(blob);
+
 	ret = board_get_regulator_buck3_nvm_uv_av96(&uv);
 	if (ret)	/* Not Avenger96 board, do not patch Buck3 in DT. */
 		return 0;
@@ -698,6 +756,13 @@ int ft_board_setup(void *blob, struct bd_info *bd)
 }
 #endif
 
+#if defined(CONFIG_SPL_BUILD)
+void spl_perform_fixups(struct spl_image_info *spl_image)
+{
+	dh_stm32_ks8851_fixup(spl_image_fdt_addr(spl_image));
+}
+#endif
+
 static void board_copro_image_process(ulong fw_image, size_t fw_size)
 {
 	int ret, id = 0; /* Copro id fixed to 0 as only one coproc on mp1 */
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
