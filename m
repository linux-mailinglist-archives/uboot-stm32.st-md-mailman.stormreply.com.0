Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B74F445B1D
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2019 13:06:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8149FC5BAE0
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2019 11:06:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE69BC5451D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2019 11:06:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5EAusdp023636; Fri, 14 Jun 2019 13:06:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Q3WruIIiD8EDNT46v0p9QeaelvaTF/j4M+IAc1I5qNI=;
 b=wvUy5vhPy7s2vF1dvCkp2cXX1NSAk/PcfsCQsweH3Arf4vv0sYsG4Z3htBVRICobelCL
 murvqaVJUcDPxqINveNIYfgfvL+wSjeYOhKUWb8EDbKLvMUKNKvKMerhOMzlqW1a0y3F
 87ItHHVx2AOQqCY97BDEkzfHK7E4RXRCZ0Ubh9yyr4VcpAdIfgnHbVOPGpjOWwWpODGW
 gdYzPxd0bzED64Hz0ZL7VYg/icpZXWfQc0PrzaRegm0etPsfx+OZG/Rr19MIFdPZS9qn
 Bjq2UwiRCqqO9PXc2q81nckfkN3zRrHbKNCh+htg/Qc/LxNEr7awKJiHGSxltUwhjdY9 xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t2f8ehqv0-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 14 Jun 2019 13:06:21 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61D753A;
 Fri, 14 Jun 2019 11:06:09 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4BBFD2820;
 Fri, 14 Jun 2019 11:06:09 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 14 Jun
 2019 13:06:09 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 14 Jun 2019 13:06:08
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Jun 2019 13:05:59 +0200
Message-ID: <1560510360-14446-3-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560510360-14446-1-git-send-email-patrick.delaunay@st.com>
References: <1560510360-14446-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-14_05:, , signatures=0
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Michal Simek <michal.simek@xilinx.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 York Sun <york.sun@nxp.com>, Vipul Kumar <vipul.kumar@xilinx.com>
Subject: [Uboot-stm32] [PATCH 2/2] stm32mp1: move CONFIG_ENV in Kconfig
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

Move 2 ENV configuration flags in board Kconfig
- CONFIG_ENV_SECT_SIZE
- CONFIG_ENV_OFFSET

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/Kconfig  | 6 ++++++
 env/Kconfig                | 5 ++---
 include/configs/stm32mp1.h | 5 -----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
index 5ab9415..5f81f94 100644
--- a/board/st/stm32mp1/Kconfig
+++ b/board/st/stm32mp1/Kconfig
@@ -9,4 +9,10 @@ config SYS_VENDOR
 config SYS_CONFIG_NAME
 	default "stm32mp1"
 
+config ENV_SECT_SIZE
+	default 0x40000 if ENV_IS_IN_SPI_FLASH
+
+config ENV_OFFSET
+	default 0x280000 if ENV_IS_IN_SPI_FLASH
+
 endif
diff --git a/env/Kconfig b/env/Kconfig
index 676d6eb..e03ec32 100644
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -468,8 +468,7 @@ if ARCH_ROCKCHIP || ARCH_SUNXI || ARCH_ZYNQ || ARCH_ZYNQMP || ARCH_VERSAL || ARC
 
 config ENV_OFFSET
 	hex "Environment Offset"
-	depends on !ENV_IS_IN_UBI
-	depends on !ENV_IS_NOWHERE
+	depends on (!ENV_IS_IN_UBI && !ENV_IS_NOWHERE) || ARCH_STM32MP
 	default 0x3f8000 if ARCH_ROCKCHIP
 	default 0x88000 if ARCH_SUNXI
 	default 0xE0000 if ARCH_ZYNQ
@@ -489,7 +488,7 @@ config ENV_SIZE
 
 config ENV_SECT_SIZE
 	hex "Environment Sector-Size"
-	depends on !ENV_IS_NOWHERE && (ARCH_ZYNQ || ARCH_ZYNQMP)
+	depends on (!ENV_IS_NOWHERE && (ARCH_ZYNQ || ARCH_ZYNQMP)) || ARCH_STM32MP
 	default 0x40000 if ARCH_ZYNQMP
 	default 0x20000 if ARCH_ZYNQ
 	help
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 0ce2fcb..637f9bf 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -38,11 +38,6 @@
  */
 #define CONFIG_SYS_LOAD_ADDR			STM32_DDR_BASE
 
-#if defined(CONFIG_ENV_IS_IN_SPI_FLASH)
-#define	CONFIG_ENV_SECT_SIZE			SZ_256K
-#define	CONFIG_ENV_OFFSET			0x00280000
-#endif
-
 /* ATAGs */
 #define CONFIG_CMDLINE_TAG
 #define CONFIG_SETUP_MEMORY_TAGS
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
