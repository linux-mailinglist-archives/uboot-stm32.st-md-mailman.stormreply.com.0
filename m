Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C899A7E7
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2024 17:36:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81C91C7801E;
	Fri, 11 Oct 2024 15:36:33 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 564D3C71290
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2024 15:36:28 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BBd8Xj004260;
 Fri, 11 Oct 2024 17:36:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 SXe71tp0gTqoDf0AXg105FmgSSo+Jb3Uz7Ct8XCsLGY=; b=LvJHNRpf1jtqjnmp
 kXha8IGfeZyrm7HnchIlBCrhzEGEoEyavEuFVZ+KK7Uqs8U5DacJ0ImazYoV3kpL
 r/aDwn2iw+2AzuSxzqlAm/vXiYYltQrc4bQXxi6P6vGQx6WB3+D59/zY7x4gqJqH
 woloe/cocYVBdYfYBvXxVMVUJgoEIFLX84Lfl4Py+h+Fwe1BiPDWhDj2QRRgPt4t
 fxIgzdGgt/Gm5YWWm+OXlg0CIvJspMDSek6m3C61eZ8dqHvPKHzxOdK1KhncM32D
 IDXqS3MC9hijvYMEs4hCBz2Yt6SUFDR78mRZi21KjO/EQkNBNUA5uNdqlMrzQ6aL
 xYHBEw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 425w7xttrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 17:36:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 846BC4004B;
 Fri, 11 Oct 2024 17:35:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 348AF2538D4;
 Fri, 11 Oct 2024 17:32:30 +0200 (CEST)
Received: from localhost (10.48.86.243) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 11 Oct
 2024 17:32:29 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 11 Oct 2024 17:31:51 +0200
Message-ID: <20241011173140.4.Ib921aacc11dafeb000f894c2a0deaaf7f5619f6b@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011153152.1637303-1-patrick.delaunay@foss.st.com>
References: <20241011153152.1637303-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH 4/4] stm32mp: fix name of optee reserved
	memory node
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

In OP-TEE, the "optee_core@" node is reserved, appended in non secure
device tree (see mark_tzdram_as_reserved() function under CFG_DT) so
this name must be checked in optee_get_reserved_memory().
We keep the check on /reserved-memory/optee@ node to have backward
compatibility with STMT32Image booting, when the reserved node is
already present in U-Boot or SPL device tree with name "optee@".

This patch solves a boot issue on board with OP-TEE for U-Boot
compiled with stm32mp15_defconfig and without secure configuration
device tree (stm32mp157c-dk2.dts for example).

Fixes: 5fe9e0deabb1 ("stm32mp: allow calling optee_get_reserved_memory()
from U-Boot")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/dram_init.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
index 58290105d127..6a36aecf5cd3 100644
--- a/arch/arm/mach-stm32mp/dram_init.c
+++ b/arch/arm/mach-stm32mp/dram_init.c
@@ -25,8 +25,11 @@ int optee_get_reserved_memory(u32 *start, u32 *size)
 	ofnode node;
 
 	node = ofnode_path("/reserved-memory/optee");
-	if (!ofnode_valid(node))
-		return -ENOENT;
+	if (!ofnode_valid(node)) {
+		node = ofnode_path("/reserved-memory/optee_core");
+		if (!ofnode_valid(node))
+			return -ENOENT;
+	}
 
 	fdt_start = ofnode_get_addr_size(node, "reg", &fdt_mem_size);
 	*start = fdt_start;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
