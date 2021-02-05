Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B473310B64
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Feb 2021 13:53:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12E05C57B56;
	Fri,  5 Feb 2021 12:53:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 544A0C57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 12:53:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115CR6kL013444; Fri, 5 Feb 2021 13:53:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=qQgyRfrkDMQF9EiSQW2mkkT58vR+/gnKxTr9kyFKmoo=;
 b=4pN+w2BCcNhAr6hOOSPj9mC+g9MHdQqYn+4Zb9x/3MB7+lF2G3DsfnHcN29iXQdtMj5l
 N5MgPE8PSu0w+g6JDm49MP2CK7hWM6524zyMrBC/aKAyV7T3+RRDPW8NcinRc1xVNVL3
 96KPGRB3TF7Xd9CpVBrQ9mkwz7ADExkACVZx8I269FJPP3HGLf5uTTWFL0BnEY3g6asv
 5T6TCLKr3r/u3FQPudvlRH1Ms7alFXirlcVVWZkvqpijRb2fwkPOi0LrrnBs7LUDAIG4
 E1yZytkByGyYrHYo+yV1aFAChH7d8sBXJOF7Eunf2waSm/cAETHj5dZaiSUyDYzHDCw/ 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0nsfm8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 13:53:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F038610002A;
 Fri,  5 Feb 2021 13:53:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6A62230A83;
 Fri,  5 Feb 2021 13:53:47 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 13:53:47
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Feb 2021 13:53:38 +0100
Message-ID: <20210205135332.7.Ib32061f8d5bd96afb1a641107fef22ae96e05280@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_07:2021-02-05,
 2021-02-05 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Ovidiu Panait <ovpanait@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH 7/8] arm: cp15: remove weak function
	arm_init_domains
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

Remove the unused weak function arm_init_domains used to change the
DACR value.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/cpu/armv7/cache_v7.c | 3 ---
 arch/arm/include/asm/cache.h  | 1 -
 arch/arm/lib/cache-cp15.c     | 6 ------
 3 files changed, 10 deletions(-)

diff --git a/arch/arm/cpu/armv7/cache_v7.c b/arch/arm/cpu/armv7/cache_v7.c
index 146cf52608..19ff432352 100644
--- a/arch/arm/cpu/armv7/cache_v7.c
+++ b/arch/arm/cpu/armv7/cache_v7.c
@@ -176,9 +176,6 @@ void mmu_page_table_flush(unsigned long start, unsigned long stop)
 {
 }
 
-void arm_init_domains(void)
-{
-}
 #endif /* #if !CONFIG_IS_ENABLED(SYS_DCACHE_OFF) */
 
 #if !CONFIG_IS_ENABLED(SYS_ICACHE_OFF)
diff --git a/arch/arm/include/asm/cache.h b/arch/arm/include/asm/cache.h
index c20e05ec7f..b10edf805b 100644
--- a/arch/arm/include/asm/cache.h
+++ b/arch/arm/include/asm/cache.h
@@ -35,7 +35,6 @@ void l2_cache_disable(void);
 void set_section_dcache(int section, enum dcache_option option);
 
 void arm_init_before_mmu(void);
-void arm_init_domains(void);
 void cpu_cache_initialization(void);
 void dram_bank_mmu_setup(int bank);
 
diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
index f78ce33b18..8a49e5217c 100644
--- a/arch/arm/lib/cache-cp15.c
+++ b/arch/arm/lib/cache-cp15.c
@@ -21,10 +21,6 @@ __weak void arm_init_before_mmu(void)
 {
 }
 
-__weak void arm_init_domains(void)
-{
-}
-
 static void set_section_phys(int section, phys_addr_t phys,
 			     enum dcache_option option)
 {
@@ -209,8 +205,6 @@ static inline void mmu_setup(void)
 	asm volatile("mcr p15, 0, %0, c3, c0, 0"
 		     : : "r" (0x55555555));
 
-	arm_init_domains();
-
 	/* and enable the mmu */
 	reg = get_cr();	/* get control reg. */
 	set_cr(reg | CR_M);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
