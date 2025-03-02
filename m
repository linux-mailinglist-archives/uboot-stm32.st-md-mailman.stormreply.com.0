Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F171FA4B2AE
	for <lists+uboot-stm32@lfdr.de>; Sun,  2 Mar 2025 16:44:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAA96C7801E;
	Sun,  2 Mar 2025 15:44:53 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D84CC030CB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Mar 2025 15:44:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E945210382D03; Sun,  2 Mar 2025 16:44:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1740930290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xZYx1dIwK5FAkAjyPFC06ex1KaFT1IUk2n2Y1GLkbOM=;
 b=PEfoKN7P574mkiHN3dAD2SgdUR8lyrke4yjE8rLKsk7CoOi1ygNUjK3ikN+tdJbIwtvCeR
 OPT4DGhkxyuV/PhxzeKOr4Kcszn0hdMaXOu28Ee0cxGqxZtGY77FavYd2ixYQpTmtnBgmv
 zpEfO6gFryTF1mabnc+bccDCfHgtep1+KPfg8kCaHHO+CT2HTqBlCjX7ruOVMaZgRwI/t1
 CqZQIqlZUOwAr4x8F27ajZDlYvR/biYgL+9Koi5X40Cl0JV/n+A6GdSSCkH6b8mcaCQYoO
 Nqb3LUT+YC4CQ4OC6HgEcf9a9Htcbqrwjh98YWiN3SEd8plMRwOH92gO70Xx1Q==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sun,  2 Mar 2025 16:43:41 +0100
Message-ID: <20250302154429.65581-1-marex@denx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add support for STM32MP13xx
	DHCOR SoM and DHSBC rev.200 board
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

LDO2 is expansion connector supply on STM32MP13xx DHCOR DHSBC rev.200.
LDO5 is carrier board supply on STM32MP13xx DHCOR DHSBC rev.200. Keep
both regulators always enabled to make sure both the carrier board and
the expansion connector is always powered on and supplied with correct
voltage.

Describe ST33TPHF2XSPI TPM 2.0 chip reset lines.

This is a port of Linux kernel patch posted at:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250302152605.54792-1-marex@denx.de/
This change shall be removed when the Linux kernel DT change lands
and Linux kernel DTs get synchronized with U-Boot DTs.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 .../dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi b/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi
index d718aae16ca..eace94f5fa4 100644
--- a/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi
@@ -23,3 +23,25 @@
 &usbphyc {
 	bootph-all;
 };
+
+&st33htph {
+	reset-gpios = <&gpioe 12 GPIO_ACTIVE_LOW>;
+};
+
+/* LDO2 is expansion connector 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
+&vdd_ldo2 {
+	bootph-all;
+	regulator-always-on;
+	regulator-boot-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+/* LDO5 is carrier board 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
+&vdd_sd {
+	bootph-all;
+	regulator-always-on;
+	regulator-boot-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
