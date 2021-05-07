Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D303D37658D
	for <lists+uboot-stm32@lfdr.de>; Fri,  7 May 2021 14:50:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 969BCC59781;
	Fri,  7 May 2021 12:50:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A7E5C59780
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 May 2021 12:50:57 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147ClSI2001937; Fri, 7 May 2021 14:50:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Ixj1YQQL1yIiNJpRVQBYM6NNv1V/7TLwZScN7X17dEc=;
 b=igJacXjTi9es1blgs2Cm5Jc3akqqzIWTpZxbjHZ0Avba53hJqfkmJzwESthjH3hfYrN9
 AwaBajMG3u34bZhD0HxbTXWAmbhsS2GbeusOW/RBzwYfcVAbBqN3/F9TNMQO0jFjk2Q3
 c2akM6lXSXWBFJeLnx9IGP/+sI6tTr3DsKI7oVayqBQyeyuiybDkuFI0p1R4DRhVuDtm
 fY4r991taot+XczmMJ24XOI5BBQ4TlSsraLTDCMiynA2xFm+KAzNPO/3CZfiCvKMX4u4
 iylnalZ7hxWN2kSHQ2z50yFpn2QDztXp0OpNOhlvBq2Us0KXrG7GNwkTcYrHKqG0nNBg MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38csqg3xpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 14:50:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3152710002A;
 Fri,  7 May 2021 14:50:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2478C21CA8B;
 Fri,  7 May 2021 14:50:48 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May 2021 14:50:47
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 7 May 2021 14:50:33 +0200
Message-ID: <20210507145030.v4.5.Id906966934e591cb691481197488ae2cfa31ffa1@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507125035.1594-1-patrick.delaunay@foss.st.com>
References: <20210507125035.1594-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_04:2021-05-06,
 2021-05-07 signatures=0
Cc: chenshuo <chenshuo@eswin.com>, Simon Glass <sjg@chromium.org>,
 Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wasim Khan <wasim.khan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH v4 5/7] image-fdt: save no-map parameter of
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

Save the 'no-map' information present in 'reserved-memory' node to allow
correct handling when the MMU is configured in board to avoid
speculative access.

This binding is defined in
doc/device-tree-bindings/reserved-memory/reserved-memory.txt

Additional properties:
...
no-map (optional) - empty property
    - Indicates the operating system must not create a virtual mapping
      of the region as part of its standard mapping of system memory,
      nor permit speculative access to it under any circumstances other
      than under the control of the device driver using the region.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 common/image-fdt.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/common/image-fdt.c b/common/image-fdt.c
index d50e1ba3fe..06dce92a28 100644
--- a/common/image-fdt.c
+++ b/common/image-fdt.c
@@ -75,18 +75,20 @@ static const image_header_t *image_get_fdt(ulong fdt_addr)
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
 
@@ -106,6 +108,7 @@ void boot_fdt_add_mem_rsv_regions(struct lmb *lmb, void *fdt_blob)
 	int i, total, ret;
 	int nodeoffset, subnode;
 	struct fdt_resource res;
+	enum lmb_flags flags;
 
 	if (fdt_check_header(fdt_blob) != 0)
 		return;
@@ -115,7 +118,7 @@ void boot_fdt_add_mem_rsv_regions(struct lmb *lmb, void *fdt_blob)
 	for (i = 0; i < total; i++) {
 		if (fdt_get_mem_rsv(fdt_blob, i, &addr, &size) != 0)
 			continue;
-		boot_fdt_reserve_region(lmb, addr, size);
+		boot_fdt_reserve_region(lmb, addr, size, LMB_NONE);
 	}
 
 	/* process reserved-memory */
@@ -127,9 +130,13 @@ void boot_fdt_add_mem_rsv_regions(struct lmb *lmb, void *fdt_blob)
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
