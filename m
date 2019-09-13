Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A2EB21C3
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 16:19:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E12AAC35E02
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 14:19:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC7C1C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 14:19:52 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8DEGWEq017394; Fri, 13 Sep 2019 16:19:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=cxUylxXjf9T0Kz5VOnP5GM/meSDv0+GfGHgSlTLdcyY=;
 b=mIG3aaGkUOF31hNuyb3ryDu7PycY6Vof9Sijvx3KFrdLZ6xqbFWgrXctA3r/sRFYJh2E
 O62yM/mKket9zRMdf8/aAI3lQJojVDgxbEEjzIPb/QsJ+toXqs4UNI4wanpdxntkrsnb
 C0hkbFK8H6zJZQk4LonY2i7P5NcBurrSbtU5k303KIaQZEAztADPniH2PYdy9Uy7ZkBe
 sZzEPzkI4OzZdfPFgERby6/PfwTm87xguAuUmkEXohF2bNPM/z1+WWeRSD7LWgN59OZ6
 Y1S9gtlIFRWqV2B2DK6XKc1MlH/NZCYFVzex9CZ2Mn1oUyrTITmB7vyUfFFX9vvL9OMH fA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uyte2wddx-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 16:19:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E8FDC51;
 Fri, 13 Sep 2019 14:19:48 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54E7D2C7F40;
 Fri, 13 Sep 2019 16:19:48 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 16:19:48 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 16:19:47
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 13 Sep 2019 16:19:28 +0200
Message-ID: <20190913141930.15784-13-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913141930.15784-2-patrick.delaunay@st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_07:2019-09-11,2019-09-13 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 12/14] stp32mp1: configs: activate
	CONFIG_MTD_SPI_NAND
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

Activate the support of SPI NAND in stm32mp1 U-Boot.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_optee_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index bc9018684d..8e90505070 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -86,6 +86,7 @@ CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
 CONFIG_NAND=y
 CONFIG_NAND_STM32_FMC2=y
+CONFIG_MTD_SPI_NAND=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SPI_FLASH_MACRONIX=y
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
index 8d3d2e8508..387de0ad35 100644
--- a/configs/stm32mp15_optee_defconfig
+++ b/configs/stm32mp15_optee_defconfig
@@ -73,6 +73,7 @@ CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
 CONFIG_NAND=y
 CONFIG_NAND_STM32_FMC2=y
+CONFIG_MTD_SPI_NAND=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SPI_FLASH_MACRONIX=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 8da8c4e22a..29c23c634d 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -72,6 +72,7 @@ CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
 CONFIG_NAND=y
 CONFIG_NAND_STM32_FMC2=y
+CONFIG_MTD_SPI_NAND=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SPI_FLASH_MACRONIX=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
