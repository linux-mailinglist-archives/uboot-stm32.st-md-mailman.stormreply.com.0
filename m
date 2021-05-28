Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 985E6395620
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 May 2021 09:30:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19474C58D58;
	Mon, 31 May 2021 07:30:42 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AA24C5718D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 16:54:47 +0000 (UTC)
Received: from [192.168.192.146] (port=39210 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1lmfkz-0008C0-6C; Fri, 28 May 2021 18:54:45 +0200
Date: Fri, 28 May 2021 18:54:43 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: u-boot@lists.denx.de
Message-ID: <33414ca650e577be89ca22ac370aa59019e59273.1622220270.git.gszymaszek@short.pl>
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
Subject: [Uboot-stm32] [PATCH 5/5] arm: dts: stm32mp157c-odyssey-som: enable
	SDMMC2 in SPL
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

Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
 .../dts/stm32mp157c-odyssey-som-u-boot.dtsi   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi b/arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi
index 6be728846e..4ff848350d 100644
--- a/arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi
@@ -123,3 +123,24 @@
 		u-boot,dm-pre-reloc;
 	};
 };
+
+&sdmmc2 {
+	u-boot,dm-spl;
+};
+
+&sdmmc2_b4_pins_a {
+	u-boot,dm-spl;
+	pins1 {
+		u-boot,dm-spl;
+	};
+	pins2 {
+		u-boot,dm-spl;
+	};
+};
+
+&sdmmc2_d47_pins_d {
+	u-boot,dm-spl;
+	pins {
+		u-boot,dm-spl;
+	};
+};
-- 
2.30.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
