Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCDC324FE5
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Feb 2021 13:37:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C874C57B53;
	Thu, 25 Feb 2021 12:37:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0EBEC3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 12:37:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PCaXoa002136; Thu, 25 Feb 2021 13:37:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=lcnX/VCA6d3pIQQUHssqEzjNwoEKnbP6jK1wxyfLDgI=;
 b=OZ1BjDIukhWtF6fyUV52nX2VXCl5WrfIe5qztIYS6aRyvz5pbOJLMH9UaI8bETwu5ZHn
 5oykIy+6UfPn1ZfXTkyG9WrPixe40VwLcoganu+DQJ1orAaH7hcltqd3A1y8XJePNI53
 +3r4OzjwyH5HSaGEIFQkV+pa3dqrsUQAl+LzwV+axnoDY70hwY/GShElHBhXQZrGr4rU
 3ETTyPkS86zF0Wl+TJxKIDdO9EOXsAwYmIas1x33Iin8seAeDfsZLi2PbSkmuGXTJuVc
 BSUYj35aHjBxLHOyBIqMT5596FMIhAB9C+GI5MnwYbz4UmqTT03CYev1WagEj4KHCQD0 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66vnnm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 13:37:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E0D7F10002A;
 Thu, 25 Feb 2021 13:37:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5B9B22D616;
 Thu, 25 Feb 2021 13:37:05 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Feb 2021 13:37:05
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Feb 2021 13:37:00 +0100
Message-ID: <20210225133652.1.I2edaac51f69d6eb9e62ab7aeb01a3f352a364af5@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_07:2021-02-24,
 2021-02-25 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/4] stm32mp: stm32prog: Add Kconfig file for
	stm32prog command
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

Move CONFIG_CMD_STM32PROG in a specific Kconfig file for stm32prog command.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/Kconfig               | 18 +-----------------
 arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index f538d7cb83..079d66a80c 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -121,23 +121,6 @@ config STM32_ETZPC
 	help
 	  Say y to enable STM32 Extended TrustZone Protection
 
-config CMD_STM32PROG
-	bool "command stm32prog for STM32CudeProgrammer"
-	select DFU
-	select DFU_RAM
-	select DFU_VIRT
-	select PARTITION_TYPE_GUID
-	imply CMD_GPT if MMC
-	imply CMD_MTD if MTD
-	imply DFU_MMC if MMC
-	imply DFU_MTD if MTD
-	help
-		activate a specific command stm32prog for STM32MP soc family
-		witch update the device with the tools STM32CubeProgrammer,
-		using UART with STM32 protocol or USB with DFU protocol
-		NB: access to not volatile memory (NOR/NAND/SD/eMMC) is based
-		    on U-Boot DFU framework
-
 config CMD_STM32KEY
 	bool "command stm32key to fuse public key hash"
 	default y
@@ -177,6 +160,7 @@ config DEBUG_UART_CLOCK
 	default 64000000
 endif
 
+source "arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig"
 source "board/st/stm32mp1/Kconfig"
 source "board/dhelectronics/dh_stm32mp1/Kconfig"
 
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
new file mode 100644
index 0000000000..609a678793
--- /dev/null
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
@@ -0,0 +1,18 @@
+
+config CMD_STM32PROG
+	bool "command stm32prog for STM32CudeProgrammer"
+	select DFU
+	select DFU_RAM
+	select DFU_VIRT
+	select PARTITION_TYPE_GUID
+	imply CMD_GPT if MMC
+	imply CMD_MTD if MTD
+	imply DFU_MMC if MMC
+	imply DFU_MTD if MTD
+	help
+		activate a specific command stm32prog for STM32MP soc family
+		witch update the device with the tools STM32CubeProgrammer,
+		using UART with STM32 protocol or USB with DFU protocol
+		NB: access to not volatile memory (NOR/NAND/SD/eMMC) is based
+		    on U-Boot DFU framework
+
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
