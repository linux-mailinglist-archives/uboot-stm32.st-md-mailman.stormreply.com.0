Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 616CDB8B73
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Sep 2019 09:20:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19842C36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Sep 2019 07:20:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB8F7C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 07:20:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8K75aRs021650; Fri, 20 Sep 2019 09:20:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=f5U32b6B0b5AN2+3vD4YuCW8RJkjCtmavePGRvXGcDQ=;
 b=XSCqz0v/4ze4F7s6kZkFNYH+gwxZMOJSjqMUGL1K2WOsC8+y1gqgYRiNmuhmeYC39bx5
 h6or/rBmbwDDyIqrn3nf3Sz3tPPLZgeroBLPuu/JmnF6HNNtks2ZvV03QEbM2thsiJwJ
 7NK12LbszvluW3dvTdI2rcTQEecFHKOqZ83ApFU2Tx3247QHUmGY0wQ/ZJ0GJjnagXI7
 h0KIjhWca0geB3Cb14QnuuGz8HQPy/6OJho/KxYdQAa1cPaOmjxChtgIs2J34DZ9YZQW
 iO8fjyaMVTkfT+oXx+2ptQO/L8qYv7eKL/KmvX2miFhc+uZ66KKj3zLusOTHQAO1+3K7 VQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v3vcbs6vg-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 20 Sep 2019 09:20:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 061764C;
 Fri, 20 Sep 2019 07:20:17 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE25B2AE960;
 Fri, 20 Sep 2019 09:20:16 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 20 Sep
 2019 09:20:16 +0200
Received: from localhost (10.201.21.107) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 20 Sep 2019 09:20:16
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 20 Sep 2019 09:20:12 +0200
Message-ID: <20190920072012.17841-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-20_01:2019-09-19,2019-09-20 signatures=0
Cc: Quentin Schulz <quentin.schulz@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH] cmd: mtd: solve bad block support in erase
	command
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

This patch modify the loop in mtd erase command to erase one by one
the blocks in the requested area.

It solves issue on "mtd erase" command on nand with existing bad block,
the command is interrupted on the first bad block with the trace:
	"Skipping bad block at 0xffffffffffffffff"

In MTD driver (nand/raw), when a bad block is present on the MTD
device, the erase_op.fail_addr is not updated and we have the initial
value MTD_FAIL_ADDR_UNKNOWN = (ULL)-1.

This case seems normal in nand_base.c:nand_erase_nand(),
we have the 2 exit cases during the loop:

1/ we have a bad block (nand_block_checkbad)
	instr->state = MTD_ERASE_FAILED
	loop interrupted (goto erase_exit)

2/ if block erase failed (status & NAND_STATUS_FAIL)
	instr->state = MTD_ERASE_FAILED;
	instr->fail_addr =
				((loff_t)page << chip->page_shift);
	loop interrupted (goto erase_exit)

So erase_op.fail_addr can't be used if bad blocks were present
in the erased area; we need to use mtd_erase only one block to detect
and skip these existing bad blocks (as it is done in nand_util.c).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Hi,

Found a correct in the mtd erase command.

I detect the issue and test the patch on STM32MP157C-EV1 board,
with nor and nand. We have the block table at the end of the nand
so the 4 last blocks are marked bad.

And I try to erase all the nand with the command "mtd erase".

Before the patch:

The "nand erase" command behavior is OK:

STM32MP> nand erase 0x0 0x000040000000

NAND erase: device 0 whole chip
Skipping bad block at  0x3ff00000
Skipping bad block at  0x3ff40000
Skipping bad block at  0x3ff80000
Skipping bad block at  0x3ffc0000

But the "mtd erase" command is not correct:

STM32MP> mtd list
SF: Detected mx66l51235l with page size 256 Bytes, erase size 64 KiB, total 64 MiB
List of MTD devices:
* nand0
  - type: NAND flash
  - block size: 0x40000 bytes
  - min I/O: 0x1000 bytes
  - OOB size: 224 bytes
  - OOB available: 118 bytes
  - ECC strength: 8 bits
  - ECC step size: 512 bytes
  - bitflip threshold: 6 bits
  - 0x000000000000-0x000040000000 : "nand0"
          - 0x000000000000-0x000000200000 : "fsbl"
          - 0x000000200000-0x000000400000 : "ssbl1"
          - 0x000000400000-0x000000600000 : "ssbl2"
          - 0x000000600000-0x000040000000 : "UBI"
* nor0
  - type: NOR flash
  - block size: 0x10000 bytes
  - min I/O: 0x1 bytes
  - 0x000000000000-0x000004000000 : "nor0"
          - 0x000000000000-0x000000040000 : "fsbl1"
          - 0x000000040000-0x000000080000 : "fsbl2"
          - 0x000000080000-0x000000280000 : "ssbl"
          - 0x000000280000-0x000000300000 : "u-boot-env"
          - 0x000000300000-0x000004000000 : "nor_user"

STM32MP> mtd erase nand0 0x0 0x000040000000
Erasing 0x00000000 ... 0x3fffffff (4096 eraseblock(s))
Skipping bad block at 0xffffffffffffffff

OK

The 4 bad blocks are not correctly skipped,
the command is stopped on the first error.

After the patch, the "mtd erase" command skips the 4 bad block
exactly as the "nand erase" command:

STM32MP> mtd erase nand0 0x000000000000 0x000040000000
SF: Detected mx66l51235l with page size 256 Bytes, erase size 64 KiB, total 64 MiB
Erasing 0x00000000 ... 0x3fffffff (4096 eraseblock(s))
Skipping bad block at 0x3ff00000
Skipping bad block at 0x3ff40000
Skipping bad block at 0x3ff80000
Skipping bad block at 0x3ffc0000

Regards

Patrick


 cmd/mtd.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/cmd/mtd.c b/cmd/mtd.c
index 1b6b8dda2b..a559b5a4a3 100644
--- a/cmd/mtd.c
+++ b/cmd/mtd.c
@@ -387,7 +387,7 @@ static int do_mtd_erase(cmd_tbl_t *cmdtp, int flag, int argc,
 	struct mtd_info *mtd;
 	u64 off, len;
 	bool scrub;
-	int ret;
+	int ret = 0;
 
 	if (argc < 2)
 		return CMD_RET_USAGE;
@@ -423,22 +423,22 @@ static int do_mtd_erase(cmd_tbl_t *cmdtp, int flag, int argc,
 
 	erase_op.mtd = mtd;
 	erase_op.addr = off;
-	erase_op.len = len;
+	erase_op.len = mtd->erasesize;
 	erase_op.scrub = scrub;
 
-	while (erase_op.len) {
+	while (len) {
 		ret = mtd_erase(mtd, &erase_op);
 
-		/* Abort if its not a bad block error */
-		if (ret != -EIO)
-			break;
-
-		printf("Skipping bad block at 0x%08llx\n", erase_op.fail_addr);
+		if (ret) {
+			/* Abort if its not a bad block error */
+			if (ret != -EIO)
+				break;
+			printf("Skipping bad block at 0x%08llx\n",
+			       erase_op.addr);
+		}
 
-		/* Skip bad block and continue behind it */
-		erase_op.len -= erase_op.fail_addr - erase_op.addr;
-		erase_op.len -= mtd->erasesize;
-		erase_op.addr = erase_op.fail_addr + mtd->erasesize;
+		len -= mtd->erasesize;
+		erase_op.addr += mtd->erasesize;
 	}
 
 	if (ret && ret != -EIO)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
