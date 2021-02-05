Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F33310B61
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Feb 2021 13:53:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C68F2C57B52;
	Fri,  5 Feb 2021 12:53:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88839C57B54
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 12:53:48 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115CQoc6028747; Fri, 5 Feb 2021 13:53:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=2Wg+L14y1GYLKiICZuqXy+1SMY92TnVsc4IFh2XG2bs=;
 b=B6Rkdm0ubZGCln2ZmIo1lntz6zSNQkB/7J6aPJt2eHGDPSrBhBhf/3ipK9RE+k/MReS1
 0wJrgeqBSRg+JRDtrwZjHnjN4gV8rfymPIM8pXianwCdVFOm+3JOmDGhxsX4wgWDA/IP
 Io5hFcwCs17iN6OJzH+6d+HfNaDSGnrfYTsO9FRvXybGSSRsU99sXw25IdSo28VZa1RM
 jPYCZhNJDcknc8IDF+0CUGU++ZcC4z8XpF10pxz/2qlZ3CKlOMYUjSG8YyTUx9i2DEjG
 VbEnbcPZTAfyIea2h7a0RZfDuGHeKaKICydmdesiOtypWPqHUmHoFvsat48FC1kIzEpc PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36ey7hgc47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 13:53:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2267910002A;
 Fri,  5 Feb 2021 13:53:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 190EA230A83;
 Fri,  5 Feb 2021 13:53:47 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 13:53:46
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Feb 2021 13:53:37 +0100
Message-ID: <20210205135332.6.I70595b1999985446f2156eb37b3d973ba489c82c@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_07:2021-02-05,
 2021-02-05 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 6/8] arm: omap2: remove arm_init_domains
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

Remove the arm_init_domains and the DACR update, as it is now done
in ARMv7 CP15 level.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-omap2/omap-cache.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/arm/mach-omap2/omap-cache.c b/arch/arm/mach-omap2/omap-cache.c
index 502ea6987a..451d8e4542 100644
--- a/arch/arm/mach-omap2/omap-cache.c
+++ b/arch/arm/mach-omap2/omap-cache.c
@@ -40,9 +40,6 @@ DECLARE_GLOBAL_DATA_PTR;
 #define ARMV7_DCACHE_POLICY	DCACHE_WRITEBACK & ~TTB_SECT_XN_MASK
 #endif
 
-#define ARMV7_DOMAIN_CLIENT	1
-#define ARMV7_DOMAIN_MASK	(0x3 << 0)
-
 void enable_caches(void)
 {
 
@@ -66,17 +63,3 @@ void dram_bank_mmu_setup(int bank)
 	for (i = start; i < end; i++)
 		set_section_dcache(i, ARMV7_DCACHE_POLICY);
 }
-
-void arm_init_domains(void)
-{
-	u32 reg;
-
-	reg = get_dacr();
-	/*
-	* Set DOMAIN to client access so that all permissions
-	* set in pagetables are validated by the mmu.
-	*/
-	reg &= ~ARMV7_DOMAIN_MASK;
-	reg |= ARMV7_DOMAIN_CLIENT;
-	set_dacr(reg);
-}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
