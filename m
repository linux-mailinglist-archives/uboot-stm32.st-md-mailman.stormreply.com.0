Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D754B1A10A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:11:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6C7FCA8E4C
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:11:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77D6ECA8E4B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:11:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6UrU020376; Fri, 10 May 2019 18:11:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=F3CR0IpwnpPZcIQ8gckCsBOv9DmEupfDcXLZoOVisis=;
 b=TcR+7o9zZiWvzLdGHLlnsSuUEBK1/TAgAK5rvnLxIB0lx8HCGivnCkZsgC0ibB8mWZGd
 7CuZXoUxcuPuMu7SyaxPb3NY5BImmtpRtAWbX/11nPTXda1/TphpH2p5mglK/fE91zMG
 k8QPHFrNUegdziOqhkcZ+wUr9W77UoZZoD9HYoBfwxtMnAF7I2H6LD2/apHxfRTtXxcT
 O8NpSIWebEmJ6itYbuuzVfkg3e5KyRFu4pr2jkHp6QVUalkSxWRwPx+ADvBZh8fQ3BXB
 VbBnMAwvDz/xcchL0YJMET0ss6tCjneNcRUx2TyRLQgvwpS7XCFpytivQIs0uX6SwBJe 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2scfv2spty-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:11:43 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41C9038;
 Fri, 10 May 2019 16:11:43 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2487C2C1E;
 Fri, 10 May 2019 16:11:43 +0000 (GMT)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:11:42 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:11:28 +0200
Message-ID: <1557504691-26188-12-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557504691-26188-1-git-send-email-patrice.chotard@st.com>
References: <1557504691-26188-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Michal Simek <michal.simek@xilinx.com>, Shyam Saini <mayhs11saini@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 York Sun <york.sun@nxp.com>, Vipul Kumar <vipul.kumar@xilinx.com>
Subject: [Uboot-stm32] [PATCH 11/14] stm32mp1: Move ENV_SIZE to Kconfig
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

Move ENV_SIZE from include/configs/stm32mp1.h to
arch/arm/mach-stm32mp/Kconfig

Increase ENV_SIZE from 4 to 8 Ko

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 arch/arm/mach-stm32mp/Kconfig | 3 +++
 env/Kconfig                   | 2 +-
 include/configs/stm32mp1.h    | 5 -----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 73aa382..5a7f40d 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -23,6 +23,9 @@ config SPL
 config SYS_SOC
 	default "stm32mp"
 
+config ENV_SIZE
+	default 0x2000
+
 config TARGET_STM32MP1
 	bool "Support stm32mp1xx"
 	select ARCH_SUPPORT_PSCI if !STM32MP1_TRUSTED
diff --git a/env/Kconfig b/env/Kconfig
index ca889cc..1091c89 100644
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -464,7 +464,7 @@ config ENV_EXT4_FILE
 	  It's a string of the EXT4 file name. This file use to store the
 	  environment (explicit path to the file)
 
-if ARCH_ROCKCHIP || ARCH_SUNXI || ARCH_ZYNQ || ARCH_ZYNQMP || ARCH_VERSAL || ARC
+if ARCH_ROCKCHIP || ARCH_SUNXI || ARCH_ZYNQ || ARCH_ZYNQMP || ARCH_VERSAL || ARC || ARCH_STM32MP
 
 config ENV_OFFSET
 	hex "Environment Offset"
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 254aad1..51f1736 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -43,11 +43,6 @@
  */
 #define CONFIG_SYS_LOAD_ADDR			STM32_DDR_BASE
 
-/*
- * Env parameters
- */
-#define CONFIG_ENV_SIZE				SZ_4K
-
 /* ATAGs */
 #define CONFIG_CMDLINE_TAG
 #define CONFIG_SETUP_MEMORY_TAGS
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
