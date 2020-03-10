Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A52AF17F33B
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 10:15:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E4C7C36B10
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 09:15:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56902C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 09:15:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02A9F9OD006752; Tue, 10 Mar 2020 10:15:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=tpilscSXcBmm8ma7SEhiBR43sdJOaje96cBErLIxvqc=;
 b=0DJ1usxcVFgqsp2ZVbgMXFiqkyA0UX6eBxzEx2g2jWJLBnY5Il/M/iKNwLRXxZY2p13u
 i0PEWUWmhAf3q20kTgzJ2WBU0eFIiEInIR66YlviSOnwlO43zRI2kVNlVg5D7HLy4C7c
 ZF6QZYRSxwAL22gqgtAH0Ro2UVJ/WooXBs7D+ke8FT2ocjBfz6TKrBaX/BAfzuGNdmv4
 7X8TWrmLNEv9QbSJrNfCItTcfXVgjyoHmiMfnFoa9gryUStUzfPzsGP8nPvnMgWPD96J
 dJHVzIJvBBeEo468s2WtAZyX46vlLDweh3bbXLikMiGJgcgOY5VTzGr1iU1mfauBM+IK dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym1y6j8fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2020 10:15:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 19B8F100038;
 Tue, 10 Mar 2020 10:15:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0CC1021FE91;
 Tue, 10 Mar 2020 10:15:15 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 10 Mar 2020 10:15:14 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 10 Mar 2020 10:15:05 +0100
Message-ID: <20200310091505.24862-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310091505.24862-1-patrick.delaunay@st.com>
References: <20200310091505.24862-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_04:2020-03-09,
 2020-03-10 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ovidiu
 Panait <ovpanait@gmail.com>, Patrick Delaunay <patrick.delaunay@st.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v4 4/4] board_f.c: Ensure 16 alignment of
	start_addr_sp and reserved memory
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

Add a function reserve_stack_aligned() to reserved memory with 16 bits
alignment after the stack pointer (gd->start_addr_sp) and use this new
function in board_f.c to reserve all the memory area (malloc, board, gd,
fdt, bootstage, stacks).

This 16 byte alignment is needed for cast on struct pointer
for the reserved memory, for example:
+ x86_64 ABI: https://reviews.llvm.org/D30049: 16 bytes
+ ARMv8 Instruction Set Overview: quad word, 16 bytes

An other alignment value could be needed for other architecture.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Acked-by: Stephen Warren <swarren@nvidia.com>
---

Changes in v4:
- replace insure by ensure

Changes in v3:
- rename reserve_sp to reserve_stack_aligned

Changes in v2:
- fix commit message s/bits/bytes/

 common/board_f.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/common/board_f.c b/common/board_f.c
index 0427b7b096..2ec5dbaa68 100644
--- a/common/board_f.c
+++ b/common/board_f.c
@@ -472,6 +472,17 @@ static int reserve_uboot(void)
 	return 0;
 }
 
+/*
+ * reserve after start_addr_sp the requested size and make the stack pointer
+ * 16-byte aligned, this alignment is needed for cast on the reserved memory
+ * ref = x86_64 ABI: https://reviews.llvm.org/D30049: 16 bytes
+ *     = ARMv8 Instruction Set Overview: quad word, 16 bytes
+ */
+static unsigned long reserve_stack_aligned(size_t size)
+{
+	return ALIGN_DOWN(gd->start_addr_sp - size, 16);
+}
+
 #ifdef CONFIG_SYS_NONCACHED_MEMORY
 static int reserve_noncached(void)
 {
@@ -497,7 +508,7 @@ static int reserve_noncached(void)
 /* reserve memory for malloc() area */
 static int reserve_malloc(void)
 {
-	gd->start_addr_sp = gd->start_addr_sp - TOTAL_MALLOC_LEN;
+	gd->start_addr_sp = reserve_stack_aligned(TOTAL_MALLOC_LEN);
 	debug("Reserving %dk for malloc() at: %08lx\n",
 	      TOTAL_MALLOC_LEN >> 10, gd->start_addr_sp);
 #ifdef CONFIG_SYS_NONCACHED_MEMORY
@@ -511,7 +522,7 @@ static int reserve_malloc(void)
 static int reserve_board(void)
 {
 	if (!gd->bd) {
-		gd->start_addr_sp -= sizeof(bd_t);
+		gd->start_addr_sp = reserve_stack_aligned(sizeof(bd_t));
 		gd->bd = (bd_t *)map_sysmem(gd->start_addr_sp, sizeof(bd_t));
 		memset(gd->bd, '\0', sizeof(bd_t));
 		debug("Reserving %zu Bytes for Board Info at: %08lx\n",
@@ -530,7 +541,7 @@ static int setup_machine(void)
 
 static int reserve_global_data(void)
 {
-	gd->start_addr_sp -= sizeof(gd_t);
+	gd->start_addr_sp = reserve_stack_aligned(sizeof(gd_t));
 	gd->new_gd = (gd_t *)map_sysmem(gd->start_addr_sp, sizeof(gd_t));
 	debug("Reserving %zu Bytes for Global Data at: %08lx\n",
 	      sizeof(gd_t), gd->start_addr_sp);
@@ -548,7 +559,7 @@ static int reserve_fdt(void)
 	if (gd->fdt_blob) {
 		gd->fdt_size = ALIGN(fdt_totalsize(gd->fdt_blob) + 0x1000, 32);
 
-		gd->start_addr_sp -= gd->fdt_size;
+		gd->start_addr_sp = reserve_stack_aligned(gd->fdt_size);
 		gd->new_fdt = map_sysmem(gd->start_addr_sp, gd->fdt_size);
 		debug("Reserving %lu Bytes for FDT at: %08lx\n",
 		      gd->fdt_size, gd->start_addr_sp);
@@ -563,12 +574,7 @@ static int reserve_bootstage(void)
 #ifdef CONFIG_BOOTSTAGE
 	int size = bootstage_get_size();
 
-	gd->start_addr_sp -= size;
-	/*
-	 * Ensure that start_addr_sp is aligned down to reserve enough
-	 * space for new_bootstage
-	 */
-	gd->start_addr_sp = ALIGN_DOWN(gd->start_addr_sp, 16);
+	gd->start_addr_sp = reserve_stack_aligned(size);
 	gd->new_bootstage = map_sysmem(gd->start_addr_sp, size);
 	debug("Reserving %#x Bytes for bootstage at: %08lx\n", size,
 	      gd->start_addr_sp);
@@ -585,8 +591,7 @@ __weak int arch_reserve_stacks(void)
 static int reserve_stacks(void)
 {
 	/* make stack pointer 16-byte aligned */
-	gd->start_addr_sp -= 16;
-	gd->start_addr_sp &= ~0xf;
+	gd->start_addr_sp = reserve_stack_aligned(16);
 
 	/*
 	 * let the architecture-specific code tailor gd->start_addr_sp and
@@ -598,8 +603,7 @@ static int reserve_stacks(void)
 static int reserve_bloblist(void)
 {
 #ifdef CONFIG_BLOBLIST
-	gd->start_addr_sp &= ~0xf;
-	gd->start_addr_sp -= CONFIG_BLOBLIST_SIZE;
+	gd->start_addr_sp = reserve_stack_aligned(CONFIG_BLOBLIST_SIZE);
 	gd->new_bloblist = map_sysmem(gd->start_addr_sp, CONFIG_BLOBLIST_SIZE);
 #endif
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
