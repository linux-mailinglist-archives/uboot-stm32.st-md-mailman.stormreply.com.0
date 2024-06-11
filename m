Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2739F90382E
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jun 2024 11:53:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCCACC78004;
	Tue, 11 Jun 2024 09:53:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB769C5E2CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 09:53:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B7cBHD027314;
 Tue, 11 Jun 2024 11:52:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=CWcMcrLpnoYHzZVY3hF1l0
 TplOVYjPU5azWHGte4oVc=; b=kRZoKqV4SmYAPG4a0jX5+VjfY0Q0GPS8F8JvbR
 66URsvtipvEfRlOYXV2i0fA/eeL1wIRWTNKfyZmqLjdooGX8WYEghGI+Y3vGkAKp
 1+7oGv5XdnV8We1ol3l+CRr/2705mZ73Z2p2DgTHrmNgzU6uMu1GiXN+7VkdUh2V
 QKViMllLckTHT8iqV7RjZ2eJybjXAIGRNGWAkE/Mr2bJqGcgk2Cu1kcucBJKQzXt
 7RtXKxEKvTl8kBPPgPjVLdYwAqvGVd9vhwqdIJPjzIX9hwAzZZhINIrNFvci2Y7v
 zI2jFIKMIrfATQq89hkPxS3IgixPX5z0golT0O3/ws0ka/fA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp426en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 11:52:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A00204002D;
 Tue, 11 Jun 2024 11:52:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C2F8212FAD;
 Tue, 11 Jun 2024 11:52:42 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 11:52:42 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 11 Jun 2024 11:52:38 +0200
Message-ID: <20240611095239.16026-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_05,2024-06-11_01,2024-05-17_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 1/2] stm32mp1: spl: Fix compilation warnings
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

Fix the following compilation warnings :

../arch/arm/mach-stm32mp/stm32mp1/spl.c: In function 'stm32_init_tzc_for_optee':
../arch/arm/mach-stm32mp/stm32mp1/spl.c:148:37: warning: 'optee_size' may be used uninitialized [-Wmaybe-uninitialized]
  148 |         tee_shmem_base = optee_base + optee_size - CFG_SHMEM_SIZE;
      |                          ~~~~~~~~~~~^~~~~~~~~~~~
../arch/arm/mach-stm32mp/stm32mp1/spl.c:137:30: note: 'optee_size' was declared here
  137 |         uint32_t optee_base, optee_size, tee_shmem_base;
      |                              ^~~~~~~~~~
../arch/arm/mach-stm32mp/stm32mp1/spl.c:148:37: warning: 'optee_base' may be used
uninitialized [-Wmaybe-uninitialized]
  148 |         tee_shmem_base = optee_base + optee_size - CFG_SHMEM_SIZE;
      |                          ~~~~~~~~~~~^~~~~~~~~~~~
../arch/arm/mach-stm32mp/stm32mp1/spl.c:137:18: note: 'optee_base' was declared here
  137 |         uint32_t optee_base, optee_size, tee_shmem_base;
      |                  ^~~~~~~~~~

Fix also the following checkpatch "check" :

CHECK: Prefer kernel type 'u32' over 'uint32_t'
37: FILE: arch/arm/mach-stm32mp/stm32mp1/spl.c:137:
+	uint32_t optee_base = 0, optee_size = 0, tee_shmem_base;

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/stm32mp1/spl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/spl.c b/arch/arm/mach-stm32mp/stm32mp1/spl.c
index 6c79259b2c8..10abbed87f0 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/spl.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/spl.c
@@ -134,7 +134,7 @@ void stm32_init_tzc_for_optee(void)
 {
 	const uint32_t dram_size = stm32mp_get_dram_size();
 	const uintptr_t dram_top = STM32_DDR_BASE + (dram_size - 1);
-	uint32_t optee_base, optee_size, tee_shmem_base;
+	u32 optee_base = 0, optee_size = 0, tee_shmem_base;
 	const uintptr_t tzc = STM32_TZC_BASE;
 	int ret;
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
