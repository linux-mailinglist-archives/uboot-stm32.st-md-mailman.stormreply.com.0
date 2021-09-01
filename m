Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5613FD4C9
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Sep 2021 09:56:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64A81C5A4F3;
	Wed,  1 Sep 2021 07:56:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF0D8C57196
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Sep 2021 07:56:09 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1812hVfB003456;
 Wed, 1 Sep 2021 09:56:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=Wd1p1oH33di5JlF122u9wjTJj9TZBwf9Jp23/aFtibY=;
 b=yWqC4lJc00A5W1t1YTNcAS9uG29ezAOmbGzEB3R6i2wyTeLXbvg8sY7ixOxS/hyYvr+n
 I2LmalzOOr2Nbrb8yRSbNOAeuSft0zxXLEPJA0MAKefVet1NANbAFsFyW+5Hb9hmy6Y3
 y0qSwn/60E0e+VdZF2wPoCTGETXWYThQg5u8IpExJdN0cfSUFArmk4UGXsmWx1yPtZD2
 dqQ4sHjUwNg66kO/RitAJbI27DFwt40wdbhPae9y24s3naqusKDzzzaGxqPdsU7mBgiC
 1QnUMUE/dNml90dxxw2Vc7MUR5K2eyLqazGM4sbPHGU/0NWABkpjN6N/5iy49MwndwpW 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3at1019h10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 09:56:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9502510002A;
 Wed,  1 Sep 2021 09:56:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8034B2138F6;
 Wed,  1 Sep 2021 09:56:07 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep 2021 09:56:07
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 1 Sep 2021 09:56:02 +0200
Message-ID: <20210901075602.17345-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-01_02,2021-08-31_01,2020-04-07_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: Fix board_get_usable_ram_top()
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

When booting in EFI, lib/efi_loader/efi_memory.c calls
board_get_usable_ram_top(0) which returns by default
gd->ram_base + gd->ram_size which is the top of DDR.

In case of OPTEE boot, the top of DDR is currently reserved by OPTEE,
board_get_usable_ram_top(0) must return an address outside OPTEE
reserved memory.

gd->ram_top matches this constraint as it has already been initialized
by substracting all DT reserved-memory (included OPTEE memory area).

Fixes: 92b611e8b003 ("stm32mp: correctly handle board_get_usable_ram_top(0)")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/dram_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
index 94f25f34e0..920b99bb68 100644
--- a/arch/arm/mach-stm32mp/dram_init.c
+++ b/arch/arm/mach-stm32mp/dram_init.c
@@ -47,7 +47,7 @@ ulong board_get_usable_ram_top(ulong total_size)
 	struct lmb lmb;
 
 	if (!total_size)
-		return gd->ram_base + gd->ram_size;
+		return gd->ram_top;
 
 	/* found enough not-reserved memory to relocated U-Boot */
 	lmb_init(&lmb);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
