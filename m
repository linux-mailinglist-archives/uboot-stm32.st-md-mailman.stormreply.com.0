Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4F725D6D7
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Sep 2020 12:51:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E1B6C3FAE0
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Sep 2020 10:51:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9EE3C36B21
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Sep 2020 10:51:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 084AmZB3003962; Fri, 4 Sep 2020 12:51:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=8il2m+J9iQ/vM2/7Z3Lx0xrPNNzSKWCXqsluHUq6U1Y=;
 b=GSFihMycMuvlXfrUL3UJvaIYLB+UgF8I1HqYBPDGnNXnp6gaSfoP55ANaxNG4naEUUo5
 b6eXdgECJGR7MELSTToVeFz0L3U/DJi2BRCKG0wYt2RM+kk6WAkaEuNUMOeSED7LxrX1
 zUp+IZfu5BNnX9MR6Guda4jxQqetxmlPnxeQLPt9fgD7w5p47rC09u7P51N9mJjcEVP9
 p/moUacUZLGjc5rm4J9n22rT3YDaOiP0CgsZ1AbPTnt8JvYO939FdxdgddGjN14OiNBM
 G8EdUIJf117vUAnUNKaSydmEuRO6EU3TLwbvotYa4YgcUokzMfYH8up+Vp+yAONJ2ukL JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 337dwhs4ss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Sep 2020 12:51:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1C0E100034;
 Fri,  4 Sep 2020 12:51:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E60412AB32C;
 Fri,  4 Sep 2020 12:51:37 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 4 Sep 2020 12:51:37 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 4 Sep 2020 12:51:29 +0200
Message-ID: <20200904125122.RFC.4.I45ee4207ad3fed413a4f3382b0698998aef3266e@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904105133.2502-1-patrick.delaunay@st.com>
References: <20200904105133.2502-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-04_05:2020-09-04,
 2020-09-04 signatures=0
Cc: Marek Vasut <marex@denx.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [RFC PATCH 4/7] lmb: add lmb_dump_region() function
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

A example of bdinfo output is:

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
---

 lib/lmb.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/lib/lmb.c b/lib/lmb.c
index eac0143501..793fe411f2 100644
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
