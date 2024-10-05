Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE539913B6
	for <lists+uboot-stm32@lfdr.de>; Sat,  5 Oct 2024 03:17:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 466D8C7802B;
	Sat,  5 Oct 2024 01:17:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56F10C7802B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Oct 2024 01:17:06 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9443D88CD9;
 Sat,  5 Oct 2024 03:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728091025;
 bh=IQJcBmbWl05FPZIOj9YPKWo7kYMGDe8HnZBDR/4Q2tc=;
 h=From:To:Cc:Subject:Date:From;
 b=f0v4W3D09kb3A2CubvxGnGIWj134ASOW2AHdlmdIbffH2Tn6w1UmyGtMv1IRRDALI
 MSD5ZyrstzXx8h1tXHzEJu6cEayFL17cJzjr83+numzWyLam9SDF8ZYTLQN0/AaYpo
 rhU1wa02694RQ09N/EFQpd75Sn5Wokh1JXCfiR0XHqu8gDAYe8sYzjRnYk+pGSwJPa
 HRuYsU0kq1HZadP1TXs6dP3xToWiuUaCEYvc4TxCKJ1gku0150KFW5FhpALSM7GzJD
 KDMKUgljuJ+v+Ku6tAIGX+ZDi1woPliP0y5YX4XMKr269m9WzRschzZqSuDwSdyt/d
 OxJkn6phPxMQg==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat,  5 Oct 2024 03:15:48 +0200
Message-ID: <20241005011647.436456-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 1/3] ARM: dts: stm32: Duplicate
	cpu0-opp-table node into stm32mp15-u-boot.dtsi
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

The cpu0-opp-table {} node does not exist in upstream Linux stm32mp151.dtsi
file, in order to enable conversion to OF_UPSTREAM, duplicate the node from
current U-Boot stm32mp151.dtsi into stm32mp15-u-boot.dtsi. This makes STM32
DTs buildable even with OF_UPSTREAM enabled. No functional change, since the
current U-Boot stm32mp151.dtsi already contains the cpu0-opp-table {} node,
stm32mp15-u-boot.dtsi is applied at the end, and does not bring in any new
content.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Sean Anderson <seanga2@gmail.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
V2: No change
---
 arch/arm/dts/stm32mp15-u-boot.dtsi | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index fe56f05616a..66d4c40c6a8 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -56,6 +56,24 @@
 			status = "okay";
 		};
 	};
+
+	cpu0_opp_table: cpu0-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+		bootph-pre-ram;
+		opp-650000000 {
+			bootph-pre-ram;
+			opp-hz = /bits/ 64 <650000000>;
+			opp-microvolt = <1200000>;
+			opp-supported-hw = <0x1>;
+		};
+		opp-800000000 {
+			bootph-pre-ram;
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1350000>;
+			opp-supported-hw = <0x2>;
+		};
+	};
 };
 
 &bsec {
@@ -82,14 +100,10 @@
 	bootph-all;
 };
 
-&cpu0_opp_table {
-	bootph-pre-ram;
-	opp-650000000 {
-		bootph-pre-ram;
-	};
-	opp-800000000 {
-		bootph-pre-ram;
-	};
+&cpu0 {
+	nvmem-cells = <&part_number_otp>;
+	nvmem-cell-names = "part_number";
+	operating-points-v2 = <&cpu0_opp_table>;
 };
 
 &gpioa {
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
