Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5047BEF01
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Oct 2023 01:16:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB1FDC6B442;
	Mon,  9 Oct 2023 23:16:19 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99475C6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 23:16:18 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0B8DE86CAD;
 Tue, 10 Oct 2023 01:15:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1696893358;
 bh=zHiegYBVTYNt3kicUspPR8jsYsgvsymnJ6TXbGuJhAQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Z4iV3Ey19aO/42GiTo+UERC5ZOagYh3mtf33B8OUex1e/hssW3YQ/LJ4ucXKAxbUO
 +wPgSB1jWcl+ENovTb4z2ifWsa5Q469RngiI/AJQulRH1HYLBmJ2+15KVftTHfjF13
 u4r6R5Xkrx1t7rr/DpcPCwG6WGB9YLWjC291O8Qg+GkYN5yTKdTNbgmvw8PMmz50oO
 yLbjm+aTgYaRv0p5bqtsN1WMcsKDp+moTr9U5vXgTvsguV7mmfEDrU//p7s7RQotfr
 +ZqO+UKTCAbFMI/awrGgM1kJsi4n2WMB1mMx83z9pLCmxgfEmXOAt8SJJem4EjSujR
 7OJRRm06xVjCw==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Tue, 10 Oct 2023 01:15:51 +0200
Message-Id: <20231009231551.354425-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32mp: Repair damage from
	alignment with v6.3
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

The patch fixed by this commit renders ST STM32MP15xx EV1 board and
all DHSOM SoM based boards unbootable from SPI NOR. Fix the damage
by updating -u-boot.dtsi to match the stm32mp15-pinctrl.dtsi update.

Fixes: 08002ffd083d ("ARM: dts: stm32mp: alignment with v6.3")
Signed-off-by: Marek Vasut <marex@denx.de>
---
NOTE: It is truly incomprehensible how 08002ffd083d was ever tested
      at ST, I can only speculate it never was tested at all, grumb.
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi   | 16 ++++++++++++----
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi | 12 +++---------
 arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi |  8 ++++++--
 3 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
index 1f7fdbce530..eb283cacd27 100644
--- a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
@@ -135,20 +135,28 @@
 
 &qspi_bk1_pins_a {
 	bootph-pre-ram;
-	pins1 {
+	pins {
 		bootph-pre-ram;
 	};
-	pins2 {
+};
+
+&qspi_cs1_pins_a {
+	bootph-pre-ram;
+	pins {
 		bootph-pre-ram;
 	};
 };
 
 &qspi_bk2_pins_a {
 	bootph-pre-ram;
-	pins1 {
+	pins {
 		bootph-pre-ram;
 	};
-	pins2 {
+};
+
+&qspi_cs2_pins_a {
+	bootph-pre-ram;
+	pins {
 		bootph-pre-ram;
 	};
 };
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
index f12941b05f6..2f70b0690d2 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
@@ -134,20 +134,14 @@
 
 &qspi_bk1_pins_a {
 	bootph-pre-ram;
-	pins1 {
-		bootph-pre-ram;
-	};
-	pins2 {
+	pins {
 		bootph-pre-ram;
 	};
 };
 
-&qspi_bk2_pins_a {
+&qspi_cs1_pins_a {
 	bootph-pre-ram;
-	pins1 {
-		bootph-pre-ram;
-	};
-	pins2 {
+	pins {
 		bootph-pre-ram;
 	};
 };
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
index eb905ad2820..552b35db3c7 100644
--- a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
@@ -98,10 +98,14 @@
 
 &qspi_bk1_pins_a {
 	bootph-pre-ram;
-	pins1 {
+	pins {
 		bootph-pre-ram;
 	};
-	pins2 {
+};
+
+&qspi_cs1_pins_a {
+	bootph-pre-ram;
+	pins {
 		bootph-pre-ram;
 	};
 };
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
