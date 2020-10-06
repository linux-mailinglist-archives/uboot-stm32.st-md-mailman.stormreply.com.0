Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C06284FFC
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Oct 2020 18:36:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A381DC32E8F;
	Tue,  6 Oct 2020 16:36:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33D60C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Oct 2020 16:36:49 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 096GWBXD023659; Tue, 6 Oct 2020 18:36:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=utKjETz0m/dSHV+L1Qwt0gTNu2HqxC3DygiywBoouro=;
 b=NW24Pw0fWy0DAiGWIcbHoyJLDcf2D0UgUR59b+kauBGg1Npm0CATni94Qp+Oycq4nh+s
 1ofj+qDR7VwuDfXtyOz0NL6yyd7JRocw7XiZjw5VnAN4/vsde7j01WJECCS84pye7Lva
 fjC9+vfIsSQUUQo0ijG42aRyB/oIlpFfRUQ7EMnuYuEntzMG1+KHBibjqHVVVomfO4Fc
 IZ23VQXqsgEZnSDm8xcO0pi4UWOFhbWJUxBBs22BjaBUeZ7J0OkAcKhLOK2J84IiJB3n
 5yhxp9mqtxRSCplYCV2kt5lS7Kb6HDNfxSvVsq3rJyLDjujQcS7eRxEGVFWhmFe2HCcu 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tjqty0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 18:36:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FB0110002A;
 Tue,  6 Oct 2020 18:36:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71B142C38BB;
 Tue,  6 Oct 2020 18:36:39 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 6 Oct 2020 18:36:38
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Oct 2020 18:36:01 +0200
Message-ID: <20201006183548.6.Id906966934e591cb691481197488ae2cfa31ffa1@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006163602.21687-1-patrick.delaunay@st.com>
References: <20201006163602.21687-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-06_09:2020-10-06,
 2020-10-06 signatures=0
Cc: Marek Vasut <marex@denx.de>, chenshuo <chenshuo@eswin.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Tero Kristo <t-kristo@ti.com>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 marek.bykowski@gmail.com, Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH 6/7] image-fdt: save no-map parameter of
	reserve-memory
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

Save the no-map information present in reserve-memory node to allow
correct handling when the MMU is configured in board to avoid
speculative access.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 common/image-fdt.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/common/image-fdt.c b/common/image-fdt.c
index 3d6935ad40..55b3593762 100644
--- a/common/image-fdt.c
+++ b/common/image-fdt.c
@@ -74,18 +74,20 @@ static const image_header_t *image_get_fdt(ulong fdt_addr)
 #endif
 
 static void boot_fdt_reserve_region(struct lmb *lmb, uint64_t addr,
-				    uint64_t size)
+				    uint64_t size, enum lmb_flags flags)
 {
 	long ret;
 
-	ret = lmb_reserve(lmb, addr, size);
+	ret = lmb_reserve_flags(lmb, addr, size, flags);
 	if (ret >= 0) {
-		debug("   reserving fdt memory region: addr=%llx size=%llx\n",
-		      (unsigned long long)addr, (unsigned long long)size);
+		debug("   reserving fdt memory region: addr=%llx size=%llx flags=%x\n",
+		      (unsigned long long)addr,
+		      (unsigned long long)size, flags);
 	} else {
 		puts("ERROR: reserving fdt memory region failed ");
-		printf("(addr=%llx size=%llx)\n",
-		       (unsigned long long)addr, (unsigned long long)size);
+		printf("(addr=%llx size=%llx flags=%x)\n",
+		       (unsigned long long)addr,
+		       (unsigned long long)size, flags);
 	}
 }
 
@@ -105,6 +107,7 @@ void boot_fdt_add_mem_rsv_regions(struct lmb *lmb, void *fdt_blob)
 	int i, total, ret;
 	int nodeoffset, subnode;
 	struct fdt_resource res;
+	enum lmb_flags flags;
 
 	if (fdt_check_header(fdt_blob) != 0)
 		return;
@@ -114,7 +117,7 @@ void boot_fdt_add_mem_rsv_regions(struct lmb *lmb, void *fdt_blob)
 	for (i = 0; i < total; i++) {
 		if (fdt_get_mem_rsv(fdt_blob, i, &addr, &size) != 0)
 			continue;
-		boot_fdt_reserve_region(lmb, addr, size);
+		boot_fdt_reserve_region(lmb, addr, size, LMB_NONE);
 	}
 
 	/* process reserved-memory */
@@ -126,9 +129,13 @@ void boot_fdt_add_mem_rsv_regions(struct lmb *lmb, void *fdt_blob)
 			ret = fdt_get_resource(fdt_blob, subnode, "reg", 0,
 					       &res);
 			if (!ret && fdtdec_get_is_enabled(fdt_blob, subnode)) {
+				flags = LMB_NONE;
+				if (fdtdec_get_bool(fdt_blob, subnode,
+						    "no-map"))
+					flags = LMB_NOMAP;
 				addr = res.start;
 				size = res.end - res.start + 1;
-				boot_fdt_reserve_region(lmb, addr, size);
+				boot_fdt_reserve_region(lmb, addr, size, flags);
 			}
 
 			subnode = fdt_next_subnode(fdt_blob, subnode);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
