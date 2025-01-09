Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C355A072E2
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2025 11:23:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C8C3C78F6C;
	Thu,  9 Jan 2025 10:23:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C64BC78011
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 10:23:29 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5098U0rP027670;
 Thu, 9 Jan 2025 11:23:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 nPvQ2HJEev8A8W2Vlt4kOE7MqJYgx3Zamu7ClCBmRIo=; b=y4pc4MDlRXJIJ1Il
 SPy1ZeQxaoTNAo62xjOL0mDFtoYqAbBT7QiwBFWkStOBpuzBZDCSN/m8U621qXeG
 /WL9ZI1uImssmhTZr32BSINbGGhGjqjBYdse2brTKzoYghXFOWbi8E0efNh5hlaa
 ekfwd2mEeStIXxkxZi7Rvqx8Jlwc8JV6c6T30GtJ2X9idpELIPnY+N8z43S0WEit
 hJdtCu4mkLE8EQ5avw56d/GiOEkn0ylg1vRUpKX9fkeIi8ZSlRFP3/fJ1fRuWzZ1
 obiftmHyTbSFSGGAoH20R7OO02DN3Qat2F5wzjKRDmoG3gBWaAX/P5W9Zxq+J86R
 1xc4og==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441txbv48f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 11:23:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7AD7440047;
 Thu,  9 Jan 2025 11:22:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D01422B16D;
 Thu,  9 Jan 2025 11:21:58 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 9 Jan
 2025 11:21:58 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Jan 2025 11:21:47 +0100
Message-ID: <20250109102148.1733810-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109102148.1733810-1-patrice.chotard@foss.st.com>
References: <20250109102148.1733810-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/2] stm32mp: Fix board_get_usable_ram_top()
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

mmu_set_region_dcache_behaviour() parameters must be aligned
which is not always the case.
For example for STM32MP2, we stayed stuck inside
mmu_set_region_dcache_behaviour() in an infinite loop because
set_one_region() always return 0 due to start parameter which is
not aligned.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/dram_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
index b06105768b3..34b958d7afd 100644
--- a/arch/arm/mach-stm32mp/dram_init.c
+++ b/arch/arm/mach-stm32mp/dram_init.c
@@ -81,7 +81,7 @@ phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 	/* add 8M for U-Boot reserved memory: display, fdt, gd,... */
 	size = ALIGN(SZ_8M + CONFIG_SYS_MALLOC_LEN + total_size, MMU_SECTION_SIZE);
 
-	reg = gd->ram_top - size;
+	reg = ALIGN(gd->ram_top - size, MMU_SECTION_SIZE);
 
 	/* Reserved memory for OP-TEE at END of DDR for STM32MP1 SoC */
 	if (IS_ENABLED(CONFIG_STM32MP13X) || IS_ENABLED(CONFIG_STM32MP15X)) {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
