Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 029617D9BAD
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Oct 2023 16:40:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B14B8C6C85A;
	Fri, 27 Oct 2023 14:40:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FBA9C6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 14:40:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39RCdkBm027442; Fri, 27 Oct 2023 16:40:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=A6g0JDe+Pj9676lOj7uwOMTvkoplbz/jE4GpxcMBfTU=; b=Nw
 i1PPVRDKu3wHEWXhlshLImwz+aHnBjFBKd9vOpjOZ6VQIA22Z46fPqY4Z3ShtBj9
 rx5o71pzgBsPTi9P3utvztJSNMFNGLhWtswUoFol5Z5i8Pmkz0OD5boHkm8i9Yxz
 mBeT1jkmLq2IgJX4Zw8oOKS9zdwFyOvAGkmCZhuDwna9s2tgQ/opO6qLszlpUrwK
 2/o4YQuLGI5rnNYR4ZZznbGx9h0WGuAgsdw74kMk+gv97Y5e63/4c/lTmgowoHu1
 UJz8J4del2FtE3SatlPLCDq1zNZEYMv/gu7Ax4jNe7/UMMaAk4oIqFBubazehxCj
 imiGBQt28t3hP9NgCkag==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tywqsc8db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 16:40:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9D8E3100066;
 Fri, 27 Oct 2023 16:40:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 96BE323D41E;
 Fri, 27 Oct 2023 16:40:31 +0200 (CEST)
Received: from localhost (10.201.20.38) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 27 Oct
 2023 16:40:31 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Oct 2023 16:39:56 +0200
Message-ID: <20231027144002.1001881-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231027144002.1001881-1-patrice.chotard@foss.st.com>
References: <20231027144002.1001881-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_13,2023-10-27_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v1 3/9] stm32mp: dram_init: Fix AARCH64
	compilation warnings
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

When building with AARCH64 defconfig, we got warnings for debug
message
- format '%x' expects argument of type 'unsigned int',
   but argument 3 has type 'size_t' {aka 'long unsigned int'}).
- format '%lx' expects argument of type 'long unsigned int',
  but argument 2 has type 'phys_addr_t' {aka 'long long unsigned
  int'}

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/dram_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
index a1e77a42e4f..cb35ed60ca1 100644
--- a/arch/arm/mach-stm32mp/dram_init.c
+++ b/arch/arm/mach-stm32mp/dram_init.c
@@ -36,7 +36,7 @@ int dram_init(void)
 		log_debug("Cannot get RAM size: %d\n", ret);
 		return ret;
 	}
-	log_debug("RAM init base=%lx, size=%x\n", ram.base, ram.size);
+	log_debug("RAM init base=%p, size=%zx\n", (void *)ram.base, ram.size);
 
 	gd->ram_size = ram.size;
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
