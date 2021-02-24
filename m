Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F4230323C56
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 13:54:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFC44C57B53;
	Wed, 24 Feb 2021 12:54:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F135C3087A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 12:54:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OChMOd010281; Wed, 24 Feb 2021 13:48:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=ESW7ROx9TLWBGbeDydhwLOLz0m+XBdzDr3ffC8VsDss=;
 b=X5/GmKvIPK7+FcziOLPN/TKiNfIDd0xJy1+TVkjFcdw54uBB8/u99HlcVtMXweVwSZOK
 DUkZi69i7bR46q3eRr1ePnu6pDJmGjwhRZsrdqqMHKtbx91Akt8EEWS+3bkWf8LgMiBQ
 MHihrtMakIUVhxLuapsuAmKCaDlg4qiz839XRR6vS7P7vA3TPljQIidYanpbbiIN9CZv
 7Q3AjohkdSb3PLW0IPhupQ1rwduMR/npudx2E5/JxMdFo8NJfdFV8xFkyBZaR4yyD/+7
 dYPn+R1itTIx7S/d+BsfYWnSuqboHLGZGdevDPqDe4uI9TY7GZALKZ7v32LUkGI8kzGe bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66xx5vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 13:48:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DA7F10002A;
 Wed, 24 Feb 2021 13:48:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A68A22D604;
 Wed, 24 Feb 2021 13:48:49 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Feb 2021 13:48:48
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Feb 2021 13:48:42 +0100
Message-ID: <20210224124843.12648-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_04:2021-02-24,
 2021-02-24 signatures=0
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andy Fleming <afleming@gmail.com>, Stefan Roese <sr@denx.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek
 Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>, Daniel
 Schwierzeck <daniel.schwierzeck@gmail.com>, Angelo
 Dureghello <angelo@sysam.it>, Masahiro Yamada <masahiroy@kernel.org>,
 Macpaul Lin <macpaul@andestech.com>, Thomas Chou <thomas@wytron.com.tw>,
 Scott McNutt <smcnutt@psyent.com>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Alison Wang <alison.wang@nxp.com>,
 Michal Simek <monstr@monstr.eu>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Mario Six <mario.six@gdsys.cc>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH] arch: cache: cp15: Add
	mmu_set_region_dcache_behaviour() when SYS_DCACHE_OFF is enable
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

From: Patrice Chotard <patrice.chotard@st.com>

Fix following compilation issue when SYS_DCACHE_OFF is enable:
drivers/misc/scmi_agent.c:128: undefined reference to `mmu_set_region_dcache_behaviour'

when SYS_DCACHE_OFF is enable, mmu_set_region_dcache_behaviour() must be
defined.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/lib/cache-cp15.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
index 24050e5bdd..f1703ead96 100644
--- a/arch/arm/lib/cache-cp15.c
+++ b/arch/arm/lib/cache-cp15.c
@@ -97,12 +97,6 @@ void mmu_set_region_dcache_behaviour_phys(phys_addr_t start, phys_addr_t phys,
 	mmu_page_table_flush(startpt, stoppt);
 }
 
-void mmu_set_region_dcache_behaviour(phys_addr_t start, size_t size,
-				     enum dcache_option option)
-{
-	mmu_set_region_dcache_behaviour_phys(start, start, size, option);
-}
-
 __weak void dram_bank_mmu_setup(int bank)
 {
 	struct bd_info *bd = gd->bd;
@@ -314,6 +308,12 @@ int dcache_status(void)
 {
 	return 0;					/* always off */
 }
+
+void mmu_set_region_dcache_behaviour(phys_addr_t start, size_t size,
+				     enum dcache_option option)
+{
+}
+
 #else
 void dcache_enable(void)
 {
@@ -329,4 +329,10 @@ int dcache_status(void)
 {
 	return (get_cr() & CR_C) != 0;
 }
+
+void mmu_set_region_dcache_behaviour(phys_addr_t start, size_t size,
+				     enum dcache_option option)
+{
+	mmu_set_region_dcache_behaviour_phys(start, start, size, option);
+}
 #endif
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
