Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4615313337
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Feb 2021 14:27:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EC61C57B56;
	Mon,  8 Feb 2021 13:27:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12A20C5717D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 13:27:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 118DR4pj030233; Mon, 8 Feb 2021 14:27:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=b+BBseNXOvRc6bT4A0GHBbX414lChHamMxqzI9SHiV4=;
 b=HuEjeriX1/u1nHtgykcOWNgZq9JrVN3B3f834vlIXOV+QuaKuOoi4Xd1mCIkBai+Gtfo
 mudWcKvM2HGSFFPynJ+FJ9/gzWjRrFlprN7xcIHbEneV0fu4YRE0M7s3WZST4mhEgZDr
 R42/WNB6K7X/kJLvxrDW9ZaUeRdk7nki/HcR4zmXPCfC3YU72yff8X51oUzszGKv61Ud
 yLW0Nfnp/byrz9/SMtXj5ArL7vpb3I5ZWkLG/O5wQ/LuqP1AgLoGfvnV7uuGdOL3BMIa
 Fadi4qN6X45nWsR/aBb3vliqoPHUVg0gb6qIh/ruSsEMWnXt0Z+o3F+WolgUgC2vVZw8 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrf72asv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 14:27:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D435B10002A;
 Mon,  8 Feb 2021 14:27:18 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C38B62AD2C0;
 Mon,  8 Feb 2021 14:27:18 +0100 (CET)
Received: from localhost (10.75.127.122) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 8 Feb 2021 14:27:18 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 8 Feb 2021 14:26:51 +0100
Message-ID: <20210208142645.v2.3.I45ee4207ad3fed413a4f3382b0698998aef3266e@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
References: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG1NODE5.st.com (10.75.127.66) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-08_06:2021-02-08,
 2021-02-08 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bin Meng <bmeng.cn@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Roese <sr@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, marek.bykowski@gmail.com, Etienne
 Carriere <etienne.carriere@linaro.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: [Uboot-stm32] [PATCH v2 3/7] lmb: add lmb_dump_region() function
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

Add lmb_dump_region() function, to simplify lmb_dump_all_force().
This patch is based on Linux memblock dump function.

An example of bdinfo output is:

.....
fdt_size    = 0x000146a0
FB base     = 0xfdd00000
lmb_dump_all:
 memory.cnt  = 0x1
 memory[0]	[0xc0000000-0xffffffff], 0x40000000 bytes flags: 0
 reserved.cnt  = 0x6
 reserved[0]	[0x10000000-0x10045fff], 0x00046000 bytes flags: 4
 reserved[1]	[0x30000000-0x3003ffff], 0x00040000 bytes flags: 4
 reserved[2]	[0x38000000-0x3800ffff], 0x00010000 bytes flags: 4
 reserved[3]	[0xe8000000-0xefffffff], 0x08000000 bytes flags: 4
 reserved[4]	[0xfbaea344-0xfdffffff], 0x02515cbc bytes flags: 0
 reserved[5]	[0xfe000000-0xffffffff], 0x02000000 bytes flags: 4
arch_number = 0x00000000
TLB addr    = 0xfdff0000
....

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 lib/lmb.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/lib/lmb.c b/lib/lmb.c
index af398c5144..b24eda89fb 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -14,32 +14,32 @@
 
 #define LMB_ALLOC_ANYWHERE	0
 
-void lmb_dump_all_force(struct lmb *lmb)
+static void lmb_dump_region(struct lmb_region *rgn, char *name)
 {
-	unsigned long i;
+	unsigned long long base, size, end;
+	enum lmb_flags flags;
+	int i;
 
-	printf("lmb_dump_all:\n");
-	printf("    memory.cnt		   = 0x%lx\n", lmb->memory.cnt);
-	for (i = 0; i < lmb->memory.cnt; i++) {
-		printf("    memory.reg[0x%lx].base   = 0x%llx\n", i,
-		       (unsigned long long)lmb->memory.region[i].base);
-		printf("		   .size   = 0x%llx\n",
-		       (unsigned long long)lmb->memory.region[i].size);
-		printf("		   .flags   = 0x%x\n",
-		       lmb->memory.region[i].flags);
-	}
+	printf(" %s.cnt  = 0x%lx\n", name, rgn->cnt);
 
-	printf("\n    reserved.cnt	   = 0x%lx\n", lmb->reserved.cnt);
-	for (i = 0; i < lmb->reserved.cnt; i++) {
-		printf("    reserved.reg[0x%lx].base = 0x%llx\n", i,
-		       (unsigned long long)lmb->reserved.region[i].base);
-		printf("		     .size = 0x%llx\n",
-		       (unsigned long long)lmb->reserved.region[i].size);
-		printf("		     .flags = 0x%x\n",
-		       lmb->reserved.region[i].flags);
+	for (i = 0; i < rgn->cnt; i++) {
+		base = rgn->region[i].base;
+		size = rgn->region[i].size;
+		end = base + size - 1;
+		flags = rgn->region[i].flags;
+
+		printf(" %s[%d]\t[0x%llx-0x%llx], 0x%08llx bytes flags: %x\n",
+		       name, i, base, end, size, flags);
 	}
 }
 
+void lmb_dump_all_force(struct lmb *lmb)
+{
+	printf("lmb_dump_all:\n");
+	lmb_dump_region(&lmb->memory, "memory");
+	lmb_dump_region(&lmb->reserved, "reserved");
+}
+
 void lmb_dump_all(struct lmb *lmb)
 {
 #ifdef DEBUG
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
