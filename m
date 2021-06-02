Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C0C399B43
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Jun 2021 09:08:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 330ABC57B7A;
	Thu,  3 Jun 2021 07:08:08 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D35DC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 17:09:16 +0000 (UTC)
Received: from [192.168.192.146] (port=55142 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1loUMk-0000Xb-B8; Wed, 02 Jun 2021 19:09:14 +0200
Date: Wed, 2 Jun 2021 19:09:13 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: u-boot@lists.denx.de
Message-ID: <bc5e2aaf93fab7d50203752d99279725c3c94ef5.1622651232.git.gszymaszek@short.pl>
Mail-Followup-To: u-boot@lists.denx.de,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
References: <cover.1622651232.git.gszymaszek@short.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1622651232.git.gszymaszek@short.pl>
X-Mailman-Approved-At: Thu, 03 Jun 2021 07:08:06 +0000
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 4/5] arm: dts: stm32mp157c-odyssey-som:
 enable the SDMMC2 eMMC HS DDR mode
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

Enable the SDMMC2 eMMC high-speed DDR mode as it is done in the
corresponding Linux kernel device tree.

Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Changes for v2:
   - rebased on current master
   - added a short commit message body

 arch/arm/dts/stm32mp157c-odyssey-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/dts/stm32mp157c-odyssey-som.dtsi b/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
index 583812f137..1510a5b364 100644
--- a/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
+++ b/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
@@ -274,6 +274,7 @@
 	bus-width = <8>;
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&vdd>;
+	mmc-ddr-3_3v;
 	status = "okay";
 };
 
-- 
2.30.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
