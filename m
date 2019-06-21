Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1874A4E980
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:39:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBB06CA75BA
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:39:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F3EFCA75B9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:39:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDal4f017770; Fri, 21 Jun 2019 15:39:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=CkeG7yyJ5ztv+NmStRGt9vI95NvQyoXbFUYvoqF4D6g=;
 b=OmttV0ICehkq/r4Hu65a2ATGnCLqrYvssv+GGNbO3lphRXO8LXxzhnUDHuO4wSvxNFOH
 bEWiIZyFNCB3DBKTXx43eO965S8xB4qT2SIlD967040X49606d3kE4v/4FbwjmAx2/jJ
 q3sqNgYYcP4gAeOqnceU6Mo1HlvaXddemAs5AEJ5aI8MIeJGonb4+LKMWVBpvyKstsH1
 pMsduYiAuQ0gqNWVPsglxtBdO9Y9DbIM4afvui+vRhnCLx2PkXOx2WjkkDJBPv/oohs1
 OvnrJXjyeqivcbcXMd/wZ0GbjXyRps7GbOuiOImpWmEBA5rLA+/hzzxIRndc5b11LU2U +Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t781v7r4c-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:39:28 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA69049;
 Fri, 21 Jun 2019 13:39:27 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C0CD92A67;
 Fri, 21 Jun 2019 13:39:27 +0000 (GMT)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 21 Jun 2019 15:39:27 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:39:22 +0200
Message-ID: <20190621133925.8643-2-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621133925.8643-1-patrice.chotard@st.com>
References: <20190621133925.8643-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: Peng Fan <peng.fan@nxp.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Michal Simek <michal.simek@xilinx.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Lars Povlsen <lars.povlsen@microchip.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [Uboot-stm32] [PATCH 1/4] gpio: stm32: Rename stm32f7_gpio to
	stm32_gpio
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

As this driver is used on stm32f4/f7/h7 and stm32mp1
SoCs, rename it with a more generic name.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 drivers/gpio/Kconfig                          | 4 ++--
 drivers/gpio/Makefile                         | 2 +-
 drivers/gpio/{stm32f7_gpio.c => stm32_gpio.c} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/gpio/{stm32f7_gpio.c => stm32_gpio.c} (100%)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e36a8abc42..be073335c2 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -255,13 +255,13 @@ config PIC32_GPIO
 	help
 	  Say yes here to support Microchip PIC32 GPIOs.
 
-config STM32F7_GPIO
+config STM32_GPIO
 	bool "ST STM32 GPIO driver"
 	depends on DM_GPIO && (STM32 || ARCH_STM32MP)
 	default y
 	help
 	  Device model driver support for STM32 GPIO controller. It should be
-	  usable on many stm32 families like stm32f4 & stm32H7.
+	  usable on many stm32 families like stm32f4/f7/h7 and stm32mp1.
 	  Tested on STM32F7.
 
 config MVEBU_GPIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 7337153e0e..4a8aa0ff6f 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -47,7 +47,7 @@ obj-$(CONFIG_ADI_GPIO2)	+= adi_gpio2.o
 obj-$(CONFIG_TCA642X)		+= tca642x.o
 obj-$(CONFIG_SUNXI_GPIO)	+= sunxi_gpio.o
 obj-$(CONFIG_LPC32XX_GPIO)	+= lpc32xx_gpio.o
-obj-$(CONFIG_STM32F7_GPIO)	+= stm32f7_gpio.o
+obj-$(CONFIG_STM32_GPIO)	+= stm32_gpio.o
 obj-$(CONFIG_GPIO_UNIPHIER)	+= gpio-uniphier.o
 obj-$(CONFIG_ZYNQ_GPIO)		+= zynq_gpio.o
 obj-$(CONFIG_VYBRID_GPIO)	+= vybrid_gpio.o
diff --git a/drivers/gpio/stm32f7_gpio.c b/drivers/gpio/stm32_gpio.c
similarity index 100%
rename from drivers/gpio/stm32f7_gpio.c
rename to drivers/gpio/stm32_gpio.c
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
