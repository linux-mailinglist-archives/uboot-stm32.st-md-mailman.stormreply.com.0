Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AD836D5BA
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Apr 2021 12:24:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4DB4C58D63;
	Wed, 28 Apr 2021 10:24:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BD14C58D64
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Apr 2021 10:23:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SAICxI031795; Wed, 28 Apr 2021 12:23:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=CfFhxuU1beoIImNvxE1NwvD3bC4p3BOahSR7hILDAz0=;
 b=vyt7ht6b68MeiDFGxuHQWu9oRzz3H+D5mkgfLD/Q8pTtALW218CUuH6TUpC0tF9UaqyI
 dtr0ta0ENfmr7IPM/Ia3cpyC5uZbLJTkMbt022sahwJPjaJkuFxELkVUzTQxQcxuwFB8
 oG2/V2CfPR6zbaKSdi5ulT04OxrHfNF044ct027YWrzFTqGMN/apK+VFCDG74RkEP7cf
 jBmUSSVIUc4etQbI38+yujMlrzdUzAGJ/JmaXMddfVJq2/guHx6alxvD2RwfQCx+YEy+
 /BesqLsJwbZVfG280t9xbpMh6wonjVIrVfb7AqSsXW7GwizHe5gEY3+U3DVqhKfYE/S2 xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3871k11wcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 12:23:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1867310003A;
 Wed, 28 Apr 2021 12:23:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 06CAC211B08;
 Wed, 28 Apr 2021 12:23:51 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 12:23:50
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 28 Apr 2021 12:23:41 +0200
Message-ID: <20210428122109.v3.3.I45ee4207ad3fed413a4f3382b0698998aef3266e@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
References: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_04:2021-04-27,
 2021-04-28 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Stefan Roese <sr@denx.de>,
 Ard Biesheuvel <ardb@kernel.org>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, marek.bykowski@gmail.com,
 Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH v3 3/7] lmb: add lmb_dump_region() function
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 lib/lmb.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/lib/lmb.c b/lib/lmb.c
index e270e86186..3b1878fd58 100644
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
