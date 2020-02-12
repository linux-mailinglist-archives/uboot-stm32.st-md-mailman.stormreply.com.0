Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF3915AFF7
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:38:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E958EC36B0F
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:38:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DF00C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:38:26 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIYYGd011083; Wed, 12 Feb 2020 19:38:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=sn44/J9gJCuiBz8cZ7uWq6kla3cE2pcDWeG/ZPN+ULM=;
 b=BK3fxscRKsj1kPa39Qap1XlBB7rXha3YHPbX6qr+AXkzGybAKanpuP44vt8oaNDYAiTD
 kqwOLqnik9v4lKd008cbqTbYgDO3q4FbFqQNcLwsnf2DBRMv2arYozbZY8UDz79XNMd9
 VfKQFyh2R+QohGD4BxlRENIj4weTKYxoe0jW8T6GZZXR56quui+lJF1tNMePDw8+qwyz
 xKka4hbDRvcVyM9mA1xCjmO4P4AH5NS2PxDiP2Nqk8PyMdeNnX55TOvrdKC+/APVZYw/
 eVHp0BZdxQEF6JmttqLDw7vskawcSn8P+zATo0l56nkkjXXF8jKBFNze1Nwn7VhxpyN8 hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufhgbej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:38:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6261410008C;
 Wed, 12 Feb 2020 19:37:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5919B2C60AA;
 Wed, 12 Feb 2020 19:37:54 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:37:53 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:37:41 +0100
Message-ID: <20200212183744.5309-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183744.5309-1-patrick.delaunay@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 07/10] board: stm32mp1: add finished good in
	board identifier OTP
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

Update the command stboard to support the coding of OTP 59 with
finished good:

bit [31:16] (hex) => MBxxxx
bit [15:12] (dec) => Variant CPN (1....15)
bit [11:8]  (dec) => Revision board (index with A = 1, Z = 26)
bit [7:4]   (dec) => Variant FG : finished good (NEW)
bit [3:0]   (dec) => BOM (01, .... 255)

the command is:
stboard [-y] <Board> <VarCPN> <Revision> <VarFG> <BOM>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/common/cmd_stboard.c | 31 ++++++++++++++++++++-----------
 board/st/stm32mp1/stm32mp1.c  |  3 ++-
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
index 1573e35410..3ead1edecd 100644
--- a/board/st/common/cmd_stboard.c
+++ b/board/st/common/cmd_stboard.c
@@ -31,9 +31,10 @@ static bool check_stboard(u16 board)
 
 static void display_stboard(u32 otp)
 {
-	printf("Board: MB%04x Var%d Rev.%c-%02d\n",
+	printf("Board: MB%04x Var%d.%d Rev.%c-%02d\n",
 	       otp >> 16,
 	       (otp >> 12) & 0xF,
+	       (otp >> 4) & 0xF,
 	       ((otp >> 8) & 0xF) - 1 + 'A',
 	       otp & 0xF);
 }
@@ -44,14 +45,14 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
 	int ret;
 	u32 otp, lock;
 	u8 revision;
-	unsigned long board, variant, bom;
+	unsigned long board, var_cpn, var_fg, bom;
 	struct udevice *dev;
-	int confirmed = argc == 6 && !strcmp(argv[1], "-y");
+	int confirmed = argc == 7 && !strcmp(argv[1], "-y");
 
 	argc -= 1 + confirmed;
 	argv += 1 + confirmed;
 
-	if (argc != 0 && argc != 4)
+	if (argc != 0 && argc != 5)
 		return CMD_RET_USAGE;
 
 	ret = uclass_get_device_by_driver(UCLASS_MISC,
@@ -95,8 +96,8 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
 		return CMD_RET_USAGE;
 	}
 
-	if (strict_strtoul(argv[1], 10, &variant) < 0 ||
-	    variant == 0 || variant > 15) {
+	if (strict_strtoul(argv[1], 10, &var_cpn) < 0 ||
+	    var_cpn == 0 || var_cpn > 15) {
 		printf("argument %d invalid: %s\n", 2, argv[1]);
 		return CMD_RET_USAGE;
 	}
@@ -107,13 +108,20 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
 		return CMD_RET_USAGE;
 	}
 
-	if (strict_strtoul(argv[3], 10, &bom) < 0 ||
+	if (strict_strtoul(argv[3], 10, &var_fg) < 0 ||
+	    var_fg > 15) {
+		printf("argument %d invalid: %s\n", 4, argv[3]);
+		return CMD_RET_USAGE;
+	}
+
+	if (strict_strtoul(argv[4], 10, &bom) < 0 ||
 	    bom == 0 || bom > 15) {
 		printf("argument %d invalid: %s\n", 4, argv[3]);
 		return CMD_RET_USAGE;
 	}
 
-	otp = (board << 16) | (variant << 12) | (revision << 8) | bom;
+	otp = (board << 16) | (var_cpn << 12) | (revision << 8) |
+	      (var_fg << 4) | bom;
 	display_stboard(otp);
 	printf("=> OTP[%d] = %08X\n", BSEC_OTP_BOARD, otp);
 
@@ -153,15 +161,16 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
 	return CMD_RET_SUCCESS;
 }
 
-U_BOOT_CMD(stboard, 6, 0, do_stboard,
+U_BOOT_CMD(stboard, 7, 0, do_stboard,
 	   "read/write board reference in OTP",
 	   "\n"
 	   "  Print current board information\n"
-	   "stboard [-y] <Board> <Variant> <Revision> <BOM>\n"
+	   "stboard [-y] <Board> <VarCPN> <Revision> <VarFG> <BOM>\n"
 	   "  Write board information\n"
 	   "  - Board: xxxx, example 1264 for MB1264\n"
-	   "  - Variant: 1 ... 15\n"
+	   "  - VarCPN: 1...15\n"
 	   "  - Revision: A...O\n"
+	   "  - VarFG: 0...15\n"
 	   "  - BOM: 1...15\n");
 
 #endif
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index e82a43074f..76399e2d62 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -109,9 +109,10 @@ int checkboard(void)
 		ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
 				&otp, sizeof(otp));
 	if (ret > 0 && otp) {
-		printf("Board: MB%04x Var%d Rev.%c-%02d\n",
+		printf("Board: MB%04x Var%d.%d Rev.%c-%02d\n",
 		       otp >> 16,
 		       (otp >> 12) & 0xF,
+		       (otp >> 4) & 0xF,
 		       ((otp >> 8) & 0xF) - 1 + 'A',
 		       otp & 0xF);
 	}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
