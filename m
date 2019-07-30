Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B47AFA4
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:18:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6F0DC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:18:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 425EFC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:18:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHGRsJ031350; Tue, 30 Jul 2019 19:17:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=KgOx32VzT936SrCWFDhKaJIhTd9sJ/nh8/KHj0tVLAA=;
 b=yzQpFgEaQMqfXHSTVsHY4jCMnd8PtXjOaDPERtbf2Ep80IeA1vuuXDFemGkElSCtoPoH
 s7WSzPUHFpn2RdBcfJD5qtAPaQZ/4GlR2ez0uvj+njQRwIRXaG1iT+s+6dFE5lHc8TvC
 1Qov1RoeOEP2zEjLwfZSs3BF6kUccVACc+1rBH4Z2yjTkqkNiazKLK5IP1+fUBrbIolh
 jB7XYq8XwkYcCsj9XcAm3ExrEeo5At1Bd9G53HdwSBkVK8xC/SOVYOPOg2dUOhvOQGRR
 4hU4J0VI6Wni1Fftj7nhVLt49t67dCXbqa9vGmXEvm/YM3T7XXiTPVbiWV+Hzq9Ma51W SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0br9yp9b-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:56 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF18231;
 Tue, 30 Jul 2019 17:17:55 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9EC5229B3;
 Tue, 30 Jul 2019 17:17:55 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:55 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:55
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:56 +0200
Message-ID: <1564507016-16570-49-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Liviu
 Dudau <Liviu.Dudau@foss.arm.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, "Andrew F. Davis" <afd@ti.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ryder Lee <ryder.lee@mediatek.com>,
 Mario Six <mario.six@gdsys.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 Stefan Roese <sr@denx.de>, Eugen Hristev <eugen.hristev@microchip.com>,
 Bin Meng <bmeng.cn@gmail.com>, Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [Uboot-stm32] [PATCH 48/48] MAINTAINERS: update ARM STM STM32MP and
	STM32MP1 BOARD
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

Add the missing driver and files for mach-stm32mp / stm32mp1 product.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 MAINTAINERS                   | 19 +++++++++++++++++--
 board/st/stm32mp1/MAINTAINERS |  5 +++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c28251e..8e2a999 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -298,14 +298,19 @@ ARM STM STM32MP
 M:	Patrick Delaunay <patrick.delaunay@st.com>
 M:	Patrice Chotard <patrice.chotard@st.com>
 L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm
+T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
 S:	Maintained
 F:	arch/arm/mach-stm32mp/
+F:	drivers/adc/stm32-adc*
 F:	drivers/clk/clk_stm32mp1.c
+F:	drivers/gpio/stm32_gpio.c
+F:	drivers/hwspinlock/stm32_hwspinlock.c
 F:	drivers/i2c/stm32f7_i2c.c
 F:	drivers/mailbox/stm32-ipcc.c
 F:	drivers/misc/stm32mp_fuse.c
+F:	drivers/misc/stm32_rcc.c
 F:	drivers/mmc/stm32_sdmmc2.c
+F:	drivers/mtd/nand/raw/stm32_fmc2_nand.c
 F:	drivers/phy/phy-stm32-usbphyc.c
 F:	drivers/pinctrl/pinctrl_stm32.c
 F:	drivers/power/pmic/stpmic1.c
@@ -313,11 +318,21 @@ F:	drivers/power/regulator/stm32-vrefbuf.c
 F:	drivers/power/regulator/stpmic1.c
 F:	drivers/ram/stm32mp1/
 F:	drivers/remoteproc/stm32_copro.c
-F:	drivers/misc/stm32_rcc.c
 F:	drivers/reset/stm32-reset.c
+F:	drivers/rtc/stm32_rtc.c
+F:	drivers/serial/serial_stm32.*
 F:	drivers/spi/stm32_qspi.c
 F:	drivers/spi/stm32_spi.c
+F:	drivers/video/stm32/stm32_ltdc.c
 F:	drivers/watchdog/stm32mp_wdt.c
+F:	include/dt-bindings/clock/stm32fx-clock.h
+F:	include/dt-bindings/clock/stm32mp1-clks.h
+F:	include/dt-bindings/clock/stm32mp1-clksrc.h
+F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
+F:	include/dt-bindings/reset/stm32mp1-resets.h
+F:	include/stm32_rcc.h
+F:	tools/stm32image.c
+
 
 ARM STM STV0991
 M:	Vikas Manocha <vikas.manocha@st.com>
diff --git a/board/st/stm32mp1/MAINTAINERS b/board/st/stm32mp1/MAINTAINERS
index 3bf4c21..2930947 100644
--- a/board/st/stm32mp1/MAINTAINERS
+++ b/board/st/stm32mp1/MAINTAINERS
@@ -1,9 +1,10 @@
 STM32MP1 BOARD
 M:	Patrick Delaunay <patrick.delaunay@st.com>
 L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
+T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
 S:	Maintained
-F:	arch/arm/dts/stm32mp157*
-F:	board/st/stm32mp1
+F:	arch/arm/dts/stm32mp15*
+F:	board/st/stm32mp1/
 F:	configs/stm32mp15_basic_defconfig
 F:	configs/stm32mp15_optee_defconfig
 F:	configs/stm32mp15_trusted_defconfig
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
