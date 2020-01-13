Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 013F813937F
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 15:17:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA614C36B0C
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 14:17:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94E30C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 14:17:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DECMuR003766; Mon, 13 Jan 2020 15:17:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=M17fRy4wAR8+XErcAmWOjAtvaI/x3ArtuUVapMdmiMs=;
 b=NVNcCvsNqdD4HDkFsXo3ufCIEwBs5SvHdSKjG9PLf4pk9s4weKiknflfE0JYIll9hYjj
 2TOPkKq1NmzYIelYepAceSForoRfxJ37oiA0VL6l9GRKKd1SMzS9qjMMfs7tWaW0zWzb
 b0Hn5N2k25vHTLfR/VJc2rG8lcbyAQbr4W4MgAF/XpY/oz23uZ3v7KGzx7zZvxO4OfuS
 sMqQq7/7y39nKGBbwdzr+RUuFZpGDYcgk6QJE+YO8smHBIZYfq/T+QM/dmunCSBRR3ln
 tC08Ag2VUTYbRaSriVvIYCLLnWI3V21BOlYf2iOql7VE79jh5MBg9OpU5B7++Qfas2uQ sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf7jp8e0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 15:17:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B177100046;
 Mon, 13 Jan 2020 15:17:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 223C32BE22F;
 Mon, 13 Jan 2020 15:17:47 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 15:17:46 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 15:17:40 +0100
Message-ID: <20200113141742.28182-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113141742.28182-1-patrick.delaunay@st.com>
References: <20200113141742.28182-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_04:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/3] stm32mp1: move stboard command in
	board/st/common directory
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

Move the ST command in board/st/common, as this command is only used
by ST board. Prepare the support in U-Boot of boards with STM32MP15x
SOC but not STMicroelectronics.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/common/Kconfig                     | 6 ++++++
 board/st/common/MAINTAINERS                 | 6 ++++++
 board/st/common/Makefile                    | 6 ++++++
 board/st/{stm32mp1 => common}/cmd_stboard.c | 3 +++
 board/st/stm32mp1/Kconfig                   | 9 ++-------
 board/st/stm32mp1/Makefile                  | 1 -
 6 files changed, 23 insertions(+), 8 deletions(-)
 create mode 100644 board/st/common/Kconfig
 create mode 100644 board/st/common/MAINTAINERS
 create mode 100644 board/st/common/Makefile
 rename board/st/{stm32mp1 => common}/cmd_stboard.c (98%)

diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
new file mode 100644
index 0000000000..1824087afc
--- /dev/null
+++ b/board/st/common/Kconfig
@@ -0,0 +1,6 @@
+config CMD_STBOARD
+	bool "stboard - command for OTP board information"
+	default y
+	help
+	  This compile the stboard command to
+	  read and write the board in the OTP.
diff --git a/board/st/common/MAINTAINERS b/board/st/common/MAINTAINERS
new file mode 100644
index 0000000000..3b02f4ab98
--- /dev/null
+++ b/board/st/common/MAINTAINERS
@@ -0,0 +1,6 @@
+ST BOARDS
+M:	Patrick Delaunay <patrick.delaunay@st.com>
+L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
+T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
+S:	Maintained
+F:	board/st/common/
diff --git a/board/st/common/Makefile b/board/st/common/Makefile
new file mode 100644
index 0000000000..8553606b90
--- /dev/null
+++ b/board/st/common/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+#
+# Copyright (C) 2020, STMicroelectronics - All Rights Reserved
+#
+
+obj-$(CONFIG_CMD_STBOARD) += cmd_stboard.o
diff --git a/board/st/stm32mp1/cmd_stboard.c b/board/st/common/cmd_stboard.c
similarity index 98%
rename from board/st/stm32mp1/cmd_stboard.c
rename to board/st/common/cmd_stboard.c
index 04352ae8ed..e994a88e71 100644
--- a/board/st/stm32mp1/cmd_stboard.c
+++ b/board/st/common/cmd_stboard.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
  */
 
+#ifndef CONFIG_SPL_BUILD
 #include <common.h>
 #include <console.h>
 #include <misc.h>
@@ -143,3 +144,5 @@ U_BOOT_CMD(stboard, 6, 0, do_stboard,
 	   "  - Variant: 1 ... 15\n"
 	   "  - Revision: A...O\n"
 	   "  - BOM: 1...15\n");
+
+#endif
diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
index 4fa2360b4f..9f985e5775 100644
--- a/board/st/stm32mp1/Kconfig
+++ b/board/st/stm32mp1/Kconfig
@@ -15,15 +15,10 @@ config ENV_SECT_SIZE
 config ENV_OFFSET
 	default 0x280000 if ENV_IS_IN_SPI_FLASH
 
-config CMD_STBOARD
-	bool "stboard - command for OTP board information"
-	default y
-	help
-	  This compile the stboard command to
-	  read and write the board in the OTP.
-
 config TARGET_STM32MP157C_DK2
 	bool "support of STMicroelectronics STM32MP157C-DK2 Discovery Board"
 	default y
 
+source "board/st/common/Kconfig"
+
 endif
diff --git a/board/st/stm32mp1/Makefile b/board/st/stm32mp1/Makefile
index 3c6c035b11..8188075b1a 100644
--- a/board/st/stm32mp1/Makefile
+++ b/board/st/stm32mp1/Makefile
@@ -7,7 +7,6 @@ ifdef CONFIG_SPL_BUILD
 obj-y += spl.o
 else
 obj-y += stm32mp1.o
-obj-$(CONFIG_CMD_STBOARD) += cmd_stboard.o
 endif
 
 obj-y += board.o
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
