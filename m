Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 012DC4E8D7
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:22:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4D41CA0264
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:22:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F574CA0262
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:22:18 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDH43W024268; Fri, 21 Jun 2019 15:22:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=C9zSAtkOspHHWk7KYQJupCGgZ2J4MUj8nORecMKD5Ko=;
 b=plIsSsOzIGrxZ2KxHJkvqljFggIVbVAnL50DjWsgOcJQ6e9V6n+H/4zIOdvz4KgSSyzk
 KEOsmIkvkI7utvSFsEAOfZowUM/mDviYJStn8+awGK5W2lpR98bEminKH6UuMaDKFQ3x
 BAWe9OlBB/3HwLmREJpm4A45WQpMIntEG4F1y4wudDK1xx5S6rkLPEm1M4JM3r99saxk
 9oQrGMXGLQynEl2SxKY63aqr8cs2+h4+Y4nPm0GXYGMKf2fqvWjFU4BrrtA3yy2rbuoO
 5eZ8uUJXYv9peejpQzVAESSILw61LprTm2ijJVfDe7wkkSEYSjKuWfU2KlmgdppUipD9 eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813qdjj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:22:17 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB97938;
 Fri, 21 Jun 2019 13:22:16 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7A7D2A2E;
 Fri, 21 Jun 2019 13:22:16 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:22:16 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:22:16
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:21:47 +0200
Message-ID: <1561123314-709-10-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
References: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 09/16] stm32mp1: add stboard command
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

Allow to update board identification in OTP 59.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/Kconfig       |   7 ++
 board/st/stm32mp1/Makefile      |   1 +
 board/st/stm32mp1/cmd_stboard.c | 145 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 board/st/stm32mp1/cmd_stboard.c

diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
index 5ab9415..92d8f90 100644
--- a/board/st/stm32mp1/Kconfig
+++ b/board/st/stm32mp1/Kconfig
@@ -9,4 +9,11 @@ config SYS_VENDOR
 config SYS_CONFIG_NAME
 	default "stm32mp1"
 
+config CMD_STBOARD
+	bool "stboard - command for OTP board information"
+	default y
+	help
+	  This compile the stboard command to
+	  read and write the board in the OTP.
+
 endif
diff --git a/board/st/stm32mp1/Makefile b/board/st/stm32mp1/Makefile
index 8188075..3c6c035 100644
--- a/board/st/stm32mp1/Makefile
+++ b/board/st/stm32mp1/Makefile
@@ -7,6 +7,7 @@ ifdef CONFIG_SPL_BUILD
 obj-y += spl.o
 else
 obj-y += stm32mp1.o
+obj-$(CONFIG_CMD_STBOARD) += cmd_stboard.o
 endif
 
 obj-y += board.o
diff --git a/board/st/stm32mp1/cmd_stboard.c b/board/st/stm32mp1/cmd_stboard.c
new file mode 100644
index 0000000..f781c36
--- /dev/null
+++ b/board/st/stm32mp1/cmd_stboard.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
+ */
+
+#include <common.h>
+#include <console.h>
+#include <misc.h>
+#include <dm/device.h>
+#include <dm/uclass.h>
+
+static bool check_stboard(u16 board)
+{
+	unsigned int i;
+	const u16 st_board_id[] = {
+		0x1272,
+		0x1263,
+		0x1264,
+		0x1298,
+		0x1341,
+		0x1497,
+	};
+
+	for (i = 0; i < ARRAY_SIZE(st_board_id); i++)
+		if (board == st_board_id[i])
+			return true;
+
+	return false;
+}
+
+static void display_stboard(u32 otp)
+{
+	printf("Board: MB%04x Var%d Rev.%c-%02d\n",
+	       otp >> 16,
+	       (otp >> 12) & 0xF,
+	       ((otp >> 8) & 0xF) - 1 + 'A',
+	       otp & 0xF);
+}
+
+static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
+		      char * const argv[])
+{
+	int ret;
+	u32 otp;
+	u8 revision;
+	unsigned long board, variant, bom;
+	struct udevice *dev;
+	int confirmed = argc == 6 && !strcmp(argv[1], "-y");
+
+	argc -= 1 + confirmed;
+	argv += 1 + confirmed;
+
+	if (argc != 0 && argc != 4)
+		return CMD_RET_USAGE;
+
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_GET_DRIVER(stm32mp_bsec),
+					  &dev);
+
+	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
+			&otp, sizeof(otp));
+
+	if (ret) {
+		puts("OTP read error");
+		return CMD_RET_FAILURE;
+	}
+
+	if (argc == 0) {
+		if (!otp)
+			puts("Board : OTP board FREE\n");
+		else
+			display_stboard(otp);
+		return CMD_RET_SUCCESS;
+	}
+
+	if (otp) {
+		display_stboard(otp);
+		printf("ERROR: OTP board not FREE\n");
+		return CMD_RET_FAILURE;
+	}
+
+	if (strict_strtoul(argv[0], 16, &board) < 0 ||
+	    board == 0 || board > 0xFFFF) {
+		printf("argument %d invalid: %s\n", 1, argv[0]);
+		return CMD_RET_USAGE;
+	}
+
+	if (strict_strtoul(argv[1], 10, &variant) < 0 ||
+	    variant == 0 || variant > 15) {
+		printf("argument %d invalid: %s\n", 2, argv[1]);
+		return CMD_RET_USAGE;
+	}
+
+	revision = argv[2][0] - 'A' + 1;
+	if (strlen(argv[2]) > 1 || revision == 0 || revision > 15) {
+		printf("argument %d invalid: %s\n", 3, argv[2]);
+		return CMD_RET_USAGE;
+	}
+
+	if (strict_strtoul(argv[3], 10, &bom) < 0 ||
+	    bom == 0 || bom > 15) {
+		printf("argument %d invalid: %s\n", 4, argv[3]);
+		return CMD_RET_USAGE;
+	}
+
+	otp = (board << 16) | (variant << 12) | (revision << 8) | bom;
+	display_stboard(otp);
+	printf("=> OTP[%d] = %08X\n", BSEC_OTP_BOARD, otp);
+
+	if (!check_stboard((u16)board)) {
+		printf("Unknown board MB%04x\n", (u16)board);
+		return CMD_RET_FAILURE;
+	}
+	if (!confirmed) {
+		printf("Warning: Programming BOARD in OTP is irreversible!\n");
+		printf("Really perform this OTP programming? <y/N>\n");
+
+		if (!confirm_yesno()) {
+			puts("BOARD programming aborted\n");
+			return CMD_RET_FAILURE;
+		}
+	}
+
+	ret = misc_write(dev, STM32_BSEC_OTP(BSEC_OTP_BOARD),
+			 &otp, sizeof(otp));
+
+	if (ret) {
+		puts("BOARD programming error\n");
+		return CMD_RET_FAILURE;
+	}
+	puts("BOARD programming done\n");
+
+	return CMD_RET_SUCCESS;
+}
+
+U_BOOT_CMD(stboard, 6, 0, do_stboard,
+	   "read/write board reference in OTP",
+	   "\n"
+	   "  Print current board information\n"
+	   "stboard [-y] <Board> <Variant> <Revision> <BOM>\n"
+	   "  Write board information\n"
+	   "  - Board: xxxx, example 1264 for MB1264\n"
+	   "  - Variant: 1 ... 15\n"
+	   "  - Revision: A...O\n"
+	   "  - BOM: 1...15\n");
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
