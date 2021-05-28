Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5402F39561E
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 May 2021 09:30:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03137C57B75;
	Mon, 31 May 2021 07:30:42 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CD44C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 16:54:37 +0000 (UTC)
Received: from [192.168.192.146] (port=39202 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1lmfko-0008BT-OV; Fri, 28 May 2021 18:54:35 +0200
Date: Fri, 28 May 2021 18:54:33 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: u-boot@lists.denx.de
Message-ID: <14a9a4a33f349059fc1d3f2f999f27c545f721f2.1622220270.git.gszymaszek@short.pl>
Mail-Followup-To: u-boot@lists.denx.de,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
References: <cover.1622220270.git.gszymaszek@short.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1622220270.git.gszymaszek@short.pl>
X-Mailman-Approved-At: Mon, 31 May 2021 07:30:40 +0000
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>
Subject: [Uboot-stm32] [PATCH 3/5] arm: dts: stm32mp157c-odyssey-som: set
 the SDMMC2 VQMMC supply
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

Set the SDMMC2 VQMMC supply to vdd (buck3). Note that in the
corresponding Linux kernel device tree, the supply is set to v3v3
(buck4), which is wrong.

Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
 arch/arm/dts/stm32mp157c-odyssey-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/dts/stm32mp157c-odyssey-som.dtsi b/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
index 5801b7a968..76a364d4ca 100644
--- a/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
+++ b/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
@@ -269,6 +269,7 @@
 	st,neg-edge;
 	bus-width = <8>;
 	vmmc-supply = <&v3v3>;
+	vqmmc-supply = <&vdd>;
 	status = "okay";
 };
 
-- 
2.30.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
