Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 524D32CC41E
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 18:47:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19323C424C0;
	Wed,  2 Dec 2020 17:47:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68F01C06150
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 17:47:52 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B2Hgx1o025400; Wed, 2 Dec 2020 18:47:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=TpisubCoLOCYLnlowBwaa2GqKuKlwHbPCAWW//lLwqY=;
 b=DKiBiDjojPgH+ZF3qJ7C1UN2vq5R79C84YJtaJZIUdk6ncuGnHpPu0XrfzwEv+FX7y/o
 xt6nFBpS9MxWCB27UC6C49ngooFo1m8eHDj/eEEKkB5kJ/Zu1dVGbKrFUsqzMHRwc9yz
 1KWJWN3QCRIfFBT0x4+gyfkEMA/Nhu/PJb5iq70Tn3K4aSBMl7daRH68MTR5KbWHXuSI
 oZHCV47bMQLtT/A9TXOERuApVKwzdTWNkZdX9JEoaWjoqDGcXCMGJuq7Ow4QkSRIDzUR
 UXWsoVvCyqVHz7u/zBuF/tQUHHr1lKinOl+1cZnjElCPFMKHL7aniyUgW9Yi4JlNcDLo zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3e4r7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 18:47:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43E6010002A;
 Wed,  2 Dec 2020 18:47:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 332AB2562B7;
 Wed,  2 Dec 2020 18:47:39 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec 2020 18:47:38
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 2 Dec 2020 18:47:30 +0100
Message-ID: <20201202174731.9503-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202174731.9503-1-patrice.chotard@foss.st.com>
References: <20201202174731.9503-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_10:2020-11-30,
 2020-12-02 signatures=0
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 2/3] treewide: Update email address Patrick
	Delaunay and Patrice Chotard
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

Update Patrick and my email address with the one dedicated to
upstream activities.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 arch/arm/include/asm/arch-stih410/sdhci.h            | 2 +-
 arch/arm/include/asm/arch-stih410/sys_proto.h        | 2 +-
 arch/arm/include/asm/arch-stm32/stm32f.h             | 2 +-
 arch/arm/include/asm/arch-stm32f4/stm32_pwr.h        | 2 +-
 arch/arm/include/asm/arch-stm32f7/stm32_pwr.h        | 2 +-
 arch/arm/include/asm/arch-stm32h7/gpio.h             | 2 +-
 arch/arm/include/asm/arch-stm32h7/stm32.h            | 2 +-
 arch/arm/mach-stm32/soc.c                            | 2 +-
 board/st/stih410-b2260/board.c                       | 2 +-
 board/st/stm32f429-evaluation/stm32f429-evaluation.c | 2 +-
 board/st/stm32f469-discovery/stm32f469-discovery.c   | 2 +-
 board/st/stm32h743-disco/stm32h743-disco.c           | 2 +-
 board/st/stm32h743-eval/stm32h743-eval.c             | 2 +-
 drivers/clk/clk_stm32h7.c                            | 2 +-
 drivers/misc/stm32_rcc.c                             | 2 +-
 drivers/mmc/sti_sdhci.c                              | 2 +-
 drivers/mmc/stm32_sdmmc2.c                           | 2 +-
 drivers/phy/sti_usb_phy.c                            | 2 +-
 drivers/pinctrl/pinctrl-sti.c                        | 2 +-
 drivers/reset/sti-reset.c                            | 2 +-
 drivers/reset/stm32-reset.c                          | 2 +-
 drivers/serial/serial_sti_asc.c                      | 2 +-
 drivers/sysreset/sysreset_sti.c                      | 2 +-
 drivers/timer/sti-timer.c                            | 2 +-
 drivers/timer/stm32_timer.c                          | 2 +-
 drivers/usb/host/dwc3-sti-glue.c                     | 2 +-
 drivers/video/backlight_gpio.c                       | 2 +-
 include/configs/stih410-b2260.h                      | 2 +-
 include/configs/stm32f429-evaluation.h               | 2 +-
 include/configs/stm32f469-discovery.h                | 2 +-
 include/configs/stm32h743-disco.h                    | 2 +-
 include/configs/stm32h743-eval.h                     | 2 +-
 include/dwc3-sti-glue.h                              | 2 +-
 include/stm32_rcc.h                                  | 2 +-
 34 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/arm/include/asm/arch-stih410/sdhci.h b/arch/arm/include/asm/arch-stih410/sdhci.h
index d5557b89fc..1735c0e391 100644
--- a/arch/arm/include/asm/arch-stih410/sdhci.h
+++ b/arch/arm/include/asm/arch-stih410/sdhci.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef __STI_SDHCI_H__
diff --git a/arch/arm/include/asm/arch-stih410/sys_proto.h b/arch/arm/include/asm/arch-stih410/sys_proto.h
index f9e8d3704a..30e7f398eb 100644
--- a/arch/arm/include/asm/arch-stih410/sys_proto.h
+++ b/arch/arm/include/asm/arch-stih410/sys_proto.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef _ASM_ARCH_SYS_PROTO_H
diff --git a/arch/arm/include/asm/arch-stm32/stm32f.h b/arch/arm/include/asm/arch-stm32/stm32f.h
index bd3f4fd30a..a1ce81ecad 100644
--- a/arch/arm/include/asm/arch-stm32/stm32f.h
+++ b/arch/arm/include/asm/arch-stm32/stm32f.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef _ASM_ARCH_STM32F_H
diff --git a/arch/arm/include/asm/arch-stm32f4/stm32_pwr.h b/arch/arm/include/asm/arch-stm32f4/stm32_pwr.h
index 8af6de220d..fe6ca03d2d 100644
--- a/arch/arm/include/asm/arch-stm32f4/stm32_pwr.h
+++ b/arch/arm/include/asm/arch-stm32f4/stm32_pwr.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef __STM32_PWR_H_
diff --git a/arch/arm/include/asm/arch-stm32f7/stm32_pwr.h b/arch/arm/include/asm/arch-stm32f7/stm32_pwr.h
index 02faaeb663..5cd6553d04 100644
--- a/arch/arm/include/asm/arch-stm32f7/stm32_pwr.h
+++ b/arch/arm/include/asm/arch-stm32f7/stm32_pwr.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef __STM32_PWR_H_
diff --git a/arch/arm/include/asm/arch-stm32h7/gpio.h b/arch/arm/include/asm/arch-stm32h7/gpio.h
index 2dad52a400..4f57f175ff 100644
--- a/arch/arm/include/asm/arch-stm32h7/gpio.h
+++ b/arch/arm/include/asm/arch-stm32h7/gpio.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef _STM32_GPIO_H_
diff --git a/arch/arm/include/asm/arch-stm32h7/stm32.h b/arch/arm/include/asm/arch-stm32h7/stm32.h
index 458baca458..2b0a670008 100644
--- a/arch/arm/include/asm/arch-stm32h7/stm32.h
+++ b/arch/arm/include/asm/arch-stm32h7/stm32.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef _ASM_ARCH_HARDWARE_H
diff --git a/arch/arm/mach-stm32/soc.c b/arch/arm/mach-stm32/soc.c
index 1f12da401c..0bd8d7b22c 100644
--- a/arch/arm/mach-stm32/soc.c
+++ b/arch/arm/mach-stm32/soc.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/board/st/stih410-b2260/board.c b/board/st/stih410-b2260/board.c
index b1147f2e1a..e06f05bfa4 100644
--- a/board/st/stih410-b2260/board.c
+++ b/board/st/stih410-b2260/board.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/board/st/stm32f429-evaluation/stm32f429-evaluation.c b/board/st/stm32f429-evaluation/stm32f429-evaluation.c
index 92e3d40a1b..22a193d8fc 100644
--- a/board/st/stm32f429-evaluation/stm32f429-evaluation.c
+++ b/board/st/stm32f429-evaluation/stm32f429-evaluation.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/board/st/stm32f469-discovery/stm32f469-discovery.c b/board/st/stm32f469-discovery/stm32f469-discovery.c
index 85988acb24..4ad4ee69c7 100644
--- a/board/st/stm32f469-discovery/stm32f469-discovery.c
+++ b/board/st/stm32f469-discovery/stm32f469-discovery.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) STMicroelectronics SA 2017
- * Author(s): Patrice CHOTARD, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice CHOTARD, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/board/st/stm32h743-disco/stm32h743-disco.c b/board/st/stm32h743-disco/stm32h743-disco.c
index 0484c3c250..0b5afa05ac 100644
--- a/board/st/stm32h743-disco/stm32h743-disco.c
+++ b/board/st/stm32h743-disco/stm32h743-disco.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/board/st/stm32h743-eval/stm32h743-eval.c b/board/st/stm32h743-eval/stm32h743-eval.c
index 0484c3c250..0b5afa05ac 100644
--- a/board/st/stm32h743-eval/stm32h743-eval.c
+++ b/board/st/stm32h743-eval/stm32h743-eval.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/clk/clk_stm32h7.c b/drivers/clk/clk_stm32h7.c
index 5e6abca56f..edf90ee00f 100644
--- a/drivers/clk/clk_stm32h7.c
+++ b/drivers/clk/clk_stm32h7.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/misc/stm32_rcc.c b/drivers/misc/stm32_rcc.c
index b82fe54c60..86275454be 100644
--- a/drivers/misc/stm32_rcc.c
+++ b/drivers/misc/stm32_rcc.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/mmc/sti_sdhci.c b/drivers/mmc/sti_sdhci.c
index 5578feebef..c3a1b34442 100644
--- a/drivers/mmc/sti_sdhci.c
+++ b/drivers/mmc/sti_sdhci.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index 77871d5afc..1f1b6cf4fb 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/phy/sti_usb_phy.c b/drivers/phy/sti_usb_phy.c
index 2a20f7601c..51468b4573 100644
--- a/drivers/phy/sti_usb_phy.c
+++ b/drivers/phy/sti_usb_phy.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/pinctrl/pinctrl-sti.c b/drivers/pinctrl/pinctrl-sti.c
index 8e942a8280..2f3ee00453 100644
--- a/drivers/pinctrl/pinctrl-sti.c
+++ b/drivers/pinctrl/pinctrl-sti.c
@@ -3,7 +3,7 @@
  * Pinctrl driver for STMicroelectronics STi SoCs
  *
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/reset/sti-reset.c b/drivers/reset/sti-reset.c
index ac3a99f9bf..2cca67dc52 100644
--- a/drivers/reset/sti-reset.c
+++ b/drivers/reset/sti-reset.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/reset/stm32-reset.c b/drivers/reset/stm32-reset.c
index 20c36a99eb..d8902e9d9c 100644
--- a/drivers/reset/stm32-reset.c
+++ b/drivers/reset/stm32-reset.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/serial/serial_sti_asc.c b/drivers/serial/serial_sti_asc.c
index 33ff396bff..91e1574638 100644
--- a/drivers/serial/serial_sti_asc.c
+++ b/drivers/serial/serial_sti_asc.c
@@ -3,7 +3,7 @@
  * Support for Serial I/O using STMicroelectronics' on-chip ASC.
  *
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/sysreset/sysreset_sti.c b/drivers/sysreset/sysreset_sti.c
index 3482d2a078..43e161c65d 100644
--- a/drivers/sysreset/sysreset_sti.c
+++ b/drivers/sysreset/sysreset_sti.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/timer/sti-timer.c b/drivers/timer/sti-timer.c
index e6843ebb33..9d95f562fa 100644
--- a/drivers/timer/sti-timer.c
+++ b/drivers/timer/sti-timer.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/timer/stm32_timer.c b/drivers/timer/stm32_timer.c
index f517d5e61f..2f5f8f43b9 100644
--- a/drivers/timer/stm32_timer.c
+++ b/drivers/timer/stm32_timer.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/usb/host/dwc3-sti-glue.c b/drivers/usb/host/dwc3-sti-glue.c
index 3e6c1429d6..9dec087738 100644
--- a/drivers/usb/host/dwc3-sti-glue.c
+++ b/drivers/usb/host/dwc3-sti-glue.c
@@ -3,7 +3,7 @@
  * STiH407 family DWC3 specific Glue layer
  *
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <common.h>
diff --git a/drivers/video/backlight_gpio.c b/drivers/video/backlight_gpio.c
index 67fed7f224..433d0979e8 100644
--- a/drivers/video/backlight_gpio.c
+++ b/drivers/video/backlight_gpio.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author: Patrick Delaunay <patrick.delaunay@st.com>
+ * Author: Patrick Delaunay <patrick.delaunay@foss.st.com>
  */
 
 #include <common.h>
diff --git a/include/configs/stih410-b2260.h b/include/configs/stih410-b2260.h
index 169b9efeec..33b34ee0cd 100644
--- a/include/configs/stih410-b2260.h
+++ b/include/configs/stih410-b2260.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef __CONFIG_H
diff --git a/include/configs/stm32f429-evaluation.h b/include/configs/stm32f429-evaluation.h
index 8390535af0..fefdb2dd15 100644
--- a/include/configs/stm32f429-evaluation.h
+++ b/include/configs/stm32f429-evaluation.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) STMicroelectronics SA 2017
- * Author(s): Patrice CHOTARD, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice CHOTARD, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef __CONFIG_H
diff --git a/include/configs/stm32f469-discovery.h b/include/configs/stm32f469-discovery.h
index 57fb6b25af..ba9f05a61b 100644
--- a/include/configs/stm32f469-discovery.h
+++ b/include/configs/stm32f469-discovery.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) STMicroelectronics SA 2017
- * Author(s): Patrice CHOTARD, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice CHOTARD, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef __CONFIG_H
diff --git a/include/configs/stm32h743-disco.h b/include/configs/stm32h743-disco.h
index afc98ae791..6e10dbdfe9 100644
--- a/include/configs/stm32h743-disco.h
+++ b/include/configs/stm32h743-disco.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef __CONFIG_H
diff --git a/include/configs/stm32h743-eval.h b/include/configs/stm32h743-eval.h
index 66af8f50d9..268d39c7ad 100644
--- a/include/configs/stm32h743-eval.h
+++ b/include/configs/stm32h743-eval.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef __CONFIG_H
diff --git a/include/dwc3-sti-glue.h b/include/dwc3-sti-glue.h
index 3989a9bb53..546ffbaf7b 100644
--- a/include/dwc3-sti-glue.h
+++ b/include/dwc3-sti-glue.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef __DWC3_STI_UBOOT_H_
diff --git a/include/stm32_rcc.h b/include/stm32_rcc.h
index a09a09ff95..b559ea7728 100644
--- a/include/stm32_rcc.h
+++ b/include/stm32_rcc.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) STMicroelectronics SA 2017
- * Author(s): Patrice CHOTARD, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice CHOTARD, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #ifndef __STM32_RCC_H_
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
