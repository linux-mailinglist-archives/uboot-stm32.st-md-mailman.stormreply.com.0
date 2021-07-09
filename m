Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0543C227B
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Jul 2021 12:47:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15B2DCFAC5A;
	Fri,  9 Jul 2021 10:47:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75777C424BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jul 2021 10:47:07 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169AfMFr010872; Fri, 9 Jul 2021 12:46:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=vja0ECqAmlrFyVv6Q/9X0CLfahcjOd91EsoWwV43dog=;
 b=pC3CCMmAATbCMl6IIhE/+CGeAiTQVTyoZ28XNc/8CjpAW5QJzJLfxf6TyhsAzq/HQ9GO
 3fqPmz2SyEk8YehciRF0PfuX+HBw/q1ooWTl+gjSyltyr0KHClu+aVEyy+ImukPuN6tm
 JojWbfwQPpJc+78dLjHNiguxFPgtkdOVZ9yJ5z74z5i7y7ROPYRKsU5mleHMRcAUrnHU
 De2gOTOe/tEl58eVJiRWVpCU0GARCucLsLY5jlT1RDwp722g3hHZkUbi8CPp2r+hhNST
 IJC09Vmkg+jIQITX3rznxUYDrJYZGxWwnguREKyH+gmTdLj6QrbuZqvh6sbUnWAVDhKU 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39p4vbcds7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 12:46:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0CEA510002A;
 Fri,  9 Jul 2021 12:46:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 369E8217B82;
 Fri,  9 Jul 2021 12:46:58 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul 2021 12:46:57
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 9 Jul 2021 12:46:49 +0200
Message-ID: <20210709124630.1.I212e7cd96724368b8272300c59c2a1c1f227ed67@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_05:2021-07-09,
 2021-07-09 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexander Graf <agraf@csgraf.de>
Subject: [Uboot-stm32] [PATCH] efi_loader: replace board_get_usable_ram_top
	by gd->ram_top
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

As gd->ram_top = board_get_usable_ram_top() in board_r
the EFI loader don't need to call this function again and after relocation.

This patch avoid issue if board assumed that this function is called
only one time and before relocation.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/7399


 lib/efi_loader/efi_memory.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/efi_loader/efi_memory.c b/lib/efi_loader/efi_memory.c
index be2f655dff..f5bc37a20a 100644
--- a/lib/efi_loader/efi_memory.c
+++ b/lib/efi_loader/efi_memory.c
@@ -7,7 +7,6 @@
 
 #include <common.h>
 #include <efi_loader.h>
-#include <init.h>
 #include <malloc.h>
 #include <mapmem.h>
 #include <watchdog.h>
@@ -731,7 +730,7 @@ efi_status_t efi_add_conventional_memory_map(u64 ram_start, u64 ram_end,
 
 __weak void efi_add_known_memory(void)
 {
-	u64 ram_top = board_get_usable_ram_top(0) & ~EFI_PAGE_MASK;
+	u64 ram_top = gd->ram_top & ~EFI_PAGE_MASK;
 	int i;
 
 	/*
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
