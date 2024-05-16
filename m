Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 196168C7F08
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 May 2024 01:48:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB2D1C6C855;
	Thu, 16 May 2024 23:48:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B0B7C6A61D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 23:47:53 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 28B6688453;
 Fri, 17 May 2024 01:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715903272;
 bh=ZYf2OMFdtMJ9n0iWBDn6vJaysrAe8miBtmG01x23INk=;
 h=From:To:Cc:Subject:Date:From;
 b=hrqQngZcEwNs7/F4NIx9ztHAj4Rk+P0/7+PwI6DqQG6mQppboGRGM6JRwjTrilPL3
 v7zW2QkmIf644ot0I6kibgL0PHwq6bAgiT+M/yGbL2z/5eUwi58Yd7E/6TxN2f3/mw
 sRCXrDOmIn+H9xVnT7ONd71ptdv/GsSDJupdL7r9Exy59WB6qG3ec0P/XKG/xrUTZk
 Cg5CemLw0gRwQoLnl0JdOjFUn6FVmMRH2G5AQUSoo2VLcHmVhK0YYTTbo7DyTzju8I
 O1M55NT1dQouHxQjU+Mk9BAXDVYsCrPhGWkR9HooyrZq65XtqfkHhwynY6BnUKokCL
 4hEed9YTiK/cA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Fri, 17 May 2024 01:47:04 +0200
Message-ID: <20240516234737.201250-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add generic SoM compatible
	to STM32MP15xx DH electronics DHSOM
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

Add generic SoM compatible string into machine compatible string
for all STM32MP15xx based DH electronics DHSOM. This way, common
board code can match on this compatible. No functional change.

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
 arch/arm/dts/stm32mp15xx-dhcom-drc02.dts       | 4 +++-
 arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts        | 4 +++-
 arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts     | 4 +++-
 arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts   | 4 +++-
 arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts | 4 +++-
 arch/arm/dts/stm32mp15xx-dhcor-testbench.dts   | 4 +++-
 6 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/arm/dts/stm32mp15xx-dhcom-drc02.dts b/arch/arm/dts/stm32mp15xx-dhcom-drc02.dts
index 1ef9ac29cea..90625bf6b60 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-drc02.dts
+++ b/arch/arm/dts/stm32mp15xx-dhcom-drc02.dts
@@ -11,5 +11,7 @@
 
 / {
 	model = "DH Electronics STM32MP15xx DHCOM DRC02";
-	compatible = "dh,stm32mp15xx-dhcom-drc02", "st,stm32mp1xx";
+	compatible = "dh,stm32mp15xx-dhcom-drc02",
+		     "dh,stm32mp15xx-dhcom-som",
+		     "st,stm32mp1xx";
 };
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts b/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts
index e2e01e2146c..b2e450aa13b 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts
+++ b/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts
@@ -11,5 +11,7 @@
 
 / {
 	model = "STMicroelectronics STM32MP15xx DHCOM Premium Developer Kit (2)";
-	compatible = "dh,stm32mp15xx-dhcom-pdk2", "st,stm32mp15x";
+	compatible = "dh,stm32mp15xx-dhcom-pdk2",
+		     "dh,stm32mp15xx-dhcom-som",
+		     "st,stm32mp15x";
 };
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts b/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts
index 06770b47873..3e908102f61 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts
+++ b/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts
@@ -11,5 +11,7 @@
 
 / {
 	model = "DH Electronics STM32MP15xx DHCOM PicoITX";
-	compatible = "dh,stm32mp15xx-dhcom-picoitx", "st,stm32mp1xx";
+	compatible = "dh,stm32mp15xx-dhcom-picoitx",
+		     "dh,stm32mp15xx-dhcom-som",
+		     "st,stm32mp1xx";
 };
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts b/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
index 76ac5a873c1..dd8fcecbca5 100644
--- a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
+++ b/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
@@ -14,5 +14,7 @@
 
 / {
 	model = "Arrow Electronics STM32MP15xx Avenger96 board";
-	compatible = "arrow,stm32mp15xx-avenger96", "st,stm32mp15x";
+	compatible = "arrow,stm32mp15xx-avenger96",
+		     "dh,stm32mp15xx-dhcor-som",
+		     "st,stm32mp15x";
 };
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts b/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts
index 77dd944ff53..c1f99c1685e 100644
--- a/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts
+++ b/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts
@@ -12,5 +12,7 @@
 
 / {
 	model = "DH electronics STM32MP15xx DHCOR DRC Compact";
-	compatible = "dh,stm32mp15xx-dhcor-drc-compact", "st,stm32mp1xx";
+	compatible = "dh,stm32mp15xx-dhcor-drc-compact",
+		     "dh,stm32mp15xx-dhcor-som",
+		     "st,stm32mp1xx";
 };
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-testbench.dts b/arch/arm/dts/stm32mp15xx-dhcor-testbench.dts
index c9163e1c028..5fdd762ddbf 100644
--- a/arch/arm/dts/stm32mp15xx-dhcor-testbench.dts
+++ b/arch/arm/dts/stm32mp15xx-dhcor-testbench.dts
@@ -9,7 +9,9 @@
 
 / {
 	model = "DH electronics STM32MP15xx DHCOR Testbench";
-	compatible = "dh,stm32mp15xx-dhcor-testbench", "st,stm32mp1xx";
+	compatible = "dh,stm32mp15xx-dhcor-testbench",
+		     "dh,stm32mp15xx-dhcor-som",
+		     "st,stm32mp1xx";
 
 	aliases {
 		ethernet0 = &ethernet0;
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
