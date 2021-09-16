Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4442740DC1E
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Sep 2021 16:01:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDF34C597BE;
	Thu, 16 Sep 2021 14:01:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A74C2C5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Sep 2021 14:01:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GCL68w029363; 
 Thu, 16 Sep 2021 16:01:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=j+RHXFIcqGGoca0nwFDsyohCJ/TZecZ4hc/nw82uHks=;
 b=kjI4GbHQUQcYKvbg3dV8+9WKxcW9dOboDkex8EDLWnS/RjHao/ZfTdxdL7Jq0bUKeEjJ
 VNfwmLgCGJkTCaax357xZiN8VGIjIr9CyF5abLDt9DCoK8dtFLBlnbINUzriPeGmtvvA
 eHWovFhoACX13BTJtoNCTcpCJxSDWyyLGmZmRwvCVwBVSGxNmwwT+EN1XE/gBrVfrkoC
 13YbGPNlTKWxYFiYIAt8haDlGFZ6zVYttohRTVSCOoMvkYuSevf+x3iy3vViJeP1kzV2
 RQvL/CHEq+xk8ZjHxuW95CTWl7BDkxKX1R+wj8hI79ML+o3JTRB3df0Z1kcPiePGOV1r ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b41kutcud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 16:01:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E0DD100034;
 Thu, 16 Sep 2021 16:01:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0464020FA59;
 Thu, 16 Sep 2021 16:01:22 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep 2021 16:01:22
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 16 Sep 2021 16:01:17 +0200
Message-ID: <20210916155040.v3.1.I81b4f1edfe925b001299e3b7ba0cf602d9268d59@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
References: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-16_04,2021-09-16_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH v3 1/2] mtd: cfi_flash: use
	cfi_flash_num_flash_banks only when supported
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

When CONFIG_SYS_MAX_FLASH_BANKS_DETECT is activated,
CONFIG_SYS_MAX_FLASH_BANKS is replaced by cfi_flash_num_flash_banks,
but this variable is defined in drivers/mtd/cfi_flash.c, which is
compiled only when CONFIG_FLASH_CFI_DRIVER is activated, in U-Boot
or in SPL when CONFIG_SPL_MTD_SUPPORT is activated.

This patch deactivates this feature CONFIG_SYS_MAX_FLASH_BANKS_DETECT
when flash cfi driver is not activated to avoid compilation issue in
the next patch, when CONFIG_SYS_MAX_FLASH_BANKS is used in spi_nor_scan().

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
see error in
https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/9138

drivers/mtd/spi/spi-nor-core.o: in function `spi_nor_scan':
drivers/mtd/spi/spi-nor-core.c:3672:
    undefined reference to `cfi_flash_num_flash_banks'

compilation issue for the boards:
- j721e_hs_evm_r5
- j721e_evm_r5j
- j721e_hs_evm_a72
- j721e_evm_a72
- sagem_f@st1704_ram

Changes in v3:
- NEW: solve compilation issue when CONFIG_SYS_MAX_FLASH_BANKS is used

 include/mtd/cfi_flash.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/mtd/cfi_flash.h b/include/mtd/cfi_flash.h
index 4963c89642..a1af6fc200 100644
--- a/include/mtd/cfi_flash.h
+++ b/include/mtd/cfi_flash.h
@@ -157,11 +157,17 @@ struct cfi_pri_hdr {
  * Use CONFIG_SYS_MAX_FLASH_BANKS_DETECT if defined
  */
 #if defined(CONFIG_SYS_MAX_FLASH_BANKS_DETECT)
-#define CONFIG_SYS_MAX_FLASH_BANKS	(cfi_flash_num_flash_banks)
 #define CFI_MAX_FLASH_BANKS	CONFIG_SYS_MAX_FLASH_BANKS_DETECT
+/* map to cfi_flash_num_flash_banks only when supported */
+#if IS_ENABLED(CONFIG_FLASH_CFI_DRIVER) && \
+    (!IS_ENABLED(CONFIG_SPL_BUILD) || IS_ENABLED(CONFIG_SPL_MTD_SUPPORT))
+#define CONFIG_SYS_MAX_FLASH_BANKS	(cfi_flash_num_flash_banks)
 /* board code can update this variable before CFI detection */
 extern int cfi_flash_num_flash_banks;
 #else
+#define CONFIG_SYS_MAX_FLASH_BANKS	CONFIG_SYS_MAX_FLASH_BANKS_DETECT
+#endif
+#else
 #define CFI_MAX_FLASH_BANKS	CONFIG_SYS_MAX_FLASH_BANKS
 #endif
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
