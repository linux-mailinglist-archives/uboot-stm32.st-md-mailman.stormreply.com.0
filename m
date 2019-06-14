Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7553345B1C
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2019 13:06:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 433C9C55595
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2019 11:06:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2303BC55593
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2019 11:06:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5EAusdo023636; Fri, 14 Jun 2019 13:06:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=lN2jWPq3Ct+XxvJMlFk+rqHvyLIe1Q6j862PzgOXmJY=;
 b=gRjRlDmwpCMI3gBGDMxaR0YXZWKc4xmJU1gRm7v5SDmWFgYQK2heQQMJDEkG+42em2Nh
 5zK+YqY8GKOuS+KyQWoRgNs4HC/LdWpXapE1uRLmV5qDIPkv6qLXZW525+DIwWqYZAwE
 vaAKpobfOkJNSdo2swNX+0qBsb0ejZ5I2neu8ezMF0mqGWgKwXOmo2UFSG82hiwSKQWD
 HPJpRhi6D3I0LgD2W2mQ3ajlVMZaNW4neO5j0wDhEFodK3CisAauMssyIj0LLZ3lwD+Z
 mApjFY0aV2kFdI+7sAVxlr8+4bqQvgoBPoXq4bjThhbyoBmDP1Rqs4wBSWTpcZUS/MNZ 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t2f8ehqus-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 14 Jun 2019 13:06:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 57BEC34;
 Fri, 14 Jun 2019 11:06:08 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 193132820;
 Fri, 14 Jun 2019 11:06:08 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 14 Jun
 2019 13:06:07 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 14 Jun 2019 13:06:07
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Jun 2019 13:05:58 +0200
Message-ID: <1560510360-14446-2-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560510360-14446-1-git-send-email-patrick.delaunay@st.com>
References: <1560510360-14446-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-14_05:, , signatures=0
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Alexey
 Brodkin <abrodkin@synopsys.com>, Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, Marek Vasut <marek.vasut@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 York Sun <york.sun@nxp.com>, Vipul Kumar <vipul.kumar@xilinx.com>
Subject: [Uboot-stm32] [PATCH 1/2] env: Move CONFIG_ENV_UBI_VOLUME_REDUND in
	Kconfig
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

Add support of CONFIG_ENV_UBI_VOLUME_REDUND in Kconfig
as it is already done for CONFIG_ENV_UBI_VOLUME.

As this string is optional, the patch introduces the new boolean
option CONFIG_USE_ENV_UBI_VOLUME_REDUND to activate the feature.

Only the stm32mp1 board is impacted.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   |  2 ++
 configs/stm32mp15_trusted_defconfig |  2 ++
 env/Kconfig                         | 11 +++++++++++
 include/configs/stm32mp1.h          |  4 ----
 4 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 4aa184f..f4b42eb 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -52,6 +52,8 @@ CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
 CONFIG_ENV_EXT4_FILE="/uboot.env"
 CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="uboot_config"
+CONFIG_USE_ENV_UBI_VOLUME_REDUND=y
+CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
 CONFIG_STM32_ADC=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 66361c8..91b450c 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -44,6 +44,8 @@ CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
 CONFIG_ENV_EXT4_FILE="/uboot.env"
 CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="uboot_config"
+CONFIG_USE_ENV_UBI_VOLUME_REDUND=y
+CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
 CONFIG_STM32_ADC=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
diff --git a/env/Kconfig b/env/Kconfig
index 5651685..676d6eb 100644
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -507,6 +507,17 @@ config ENV_UBI_VOLUME
 	help
 	  Name of the volume that you want to store the environment in.
 
+config USE_ENV_UBI_VOLUME_REDUND
+	bool "Enable redunbant UBI volume"
+	depends on ENV_IS_IN_UBI
+
+config ENV_UBI_VOLUME_REDUND
+	string "UBI volume name, second copy"
+	depends on USE_ENV_UBI_VOLUME_REDUND
+	help
+	  Name of the second volume that you want to store the redundant
+	  environment in.
+
 endif
 
 config USE_DEFAULT_ENV_FILE
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 1d385e0..0ce2fcb 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -38,10 +38,6 @@
  */
 #define CONFIG_SYS_LOAD_ADDR			STM32_DDR_BASE
 
-#if defined(CONFIG_ENV_IS_IN_UBI)
-#define CONFIG_ENV_UBI_VOLUME_REDUND		"uboot_config_r"
-#endif
-
 #if defined(CONFIG_ENV_IS_IN_SPI_FLASH)
 #define	CONFIG_ENV_SECT_SIZE			SZ_256K
 #define	CONFIG_ENV_OFFSET			0x00280000
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
