Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED13A2E208
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2025 02:33:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E52BC78F7B;
	Mon, 10 Feb 2025 01:33:36 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 801A8C78F7B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 01:33:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C613010382C23; Mon, 10 Feb 2025 02:33:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1739151213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WOJ7xW+QPNopnoExbXEMVQoomaCIQ1SCrYOkZiDddwE=;
 b=Fxg53b5phda4+2VnF9hYLZPwSX+BvNEVBCyI4FprBejCz7uodP194UcJBqrNXsWDiEyVzE
 NDgigBr9m6VXDBfheTUqZ1v9K33U2dmWie0p3JlSdNPVIzgoxiYBI39PpwQrFslE9j1RYI
 IugbASOhQaWQTG3oUAfVe11CZ2RO9XTjiT4z+8fDwZwqlto318EnKZ6orbBlkgU+ya6Wx1
 45Mh47HplH1FyE/+8XBD+cZgW36vj/3gV9b04zgYDBGfqGGTggzucEe7Vrer6v2Qwrk+qU
 cjg847BM5+IOWas6SPLlWWJDYIRpcgxjcFCAFqFAR5el2QtlYX4Uuf8XrjPq/w==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 10 Feb 2025 02:32:29 +0100
Message-ID: <20250210013322.350477-1-marex@denx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add support for environment
	in eMMC on STM32MP13xx DHCOR SoM
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

Enable support for environment in eMMC on STM32MP13xx DHCOR SoM,
in addition to existing support for environment in SPI NOR. The
environment size is the same, except in case the environment is
placed in eMMC, it is stored at the end of eMMC BOOT partitions
in the last 32 sectors of each eMMC HW BOOT partition.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Igor Opaniuk <igor.opaniuk@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi | 2 ++
 configs/stm32mp13_dhcor_defconfig          | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
index 9233f315ebc..3acf5138940 100644
--- a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
@@ -14,6 +14,8 @@
 	config {
 		dh,ddr3-coding-gpios = <&gpiod 5 0>, <&gpiod 9 0>;
 		dh,som-coding-gpios = <&gpioa 13 0>, <&gpioi 1 0>;
+		u-boot,mmc-env-offset = <0x3fc000>;
+		u-boot,mmc-env-offset-redundant = <0x3fc000>;
 	};
 };
 
diff --git a/configs/stm32mp13_dhcor_defconfig b/configs/stm32mp13_dhcor_defconfig
index ff948b904be..2da9287ea7b 100644
--- a/configs/stm32mp13_dhcor_defconfig
+++ b/configs/stm32mp13_dhcor_defconfig
@@ -28,10 +28,14 @@ CONFIG_CMD_RNG=y
 CONFIG_CMD_LOG=y
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_ENV_MMC_USE_DT=y
 CONFIG_ENV_SPI_MAX_HZ=50000000
 CONFIG_CLK_SCMI=y
 CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_SYS_I2C_EEPROM_ADDR=0x50
+CONFIG_SYS_MMC_ENV_DEV=0
+CONFIG_SYS_MMC_ENV_PART=1
 CONFIG_PHY_REALTEK=y
 CONFIG_DM_REGULATOR_SCMI=y
 CONFIG_RESET_SCMI=y
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
