Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C72EA313339
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Feb 2021 14:27:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91DFEC57B54;
	Mon,  8 Feb 2021 13:27:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A78D8C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 13:27:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 118DMFpC002301; Mon, 8 Feb 2021 14:27:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=mueA0Uzok0tMqJRXljofCSzdZENulmpRYxdOFX7aGdc=;
 b=Z81VAHJrt9pAup6jCzyNyVjtpNqG7nF2zgGtKb/XcZZ450ggG75IDXPbOzRir4I/Dt/1
 P7E+n3E2WoNmN28F13O19AipCT7tufJfmNF7qbwNdpnQw/59bo3XjrV55Z5NcnaxaV2e
 skP3gim8cqn/DhKlpdmaV9tUfiu0eJBdi2vyi7f88DLmHwdj9fJnqPaBqKGt/h14CbR8
 uYMUth10fE6fUgVIddvPNPwGyfhwYW1Rn0lkg7qfSO1fPXPPBjeQEPPA1/NIAu7TAfDA
 uvme/qo4KjftTpyHM8QslFKVs+iHR324C1mBHRH+i39H0qc1KhmdAGPG9ctP380LD+mk Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hraujc3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 14:27:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D5F5610002A;
 Mon,  8 Feb 2021 14:27:21 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0B942AD2C0;
 Mon,  8 Feb 2021 14:27:21 +0100 (CET)
Received: from localhost (10.75.127.122) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 8 Feb 2021 14:27:21 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 8 Feb 2021 14:26:53 +0100
Message-ID: <20210208142645.v2.5.Id906966934e591cb691481197488ae2cfa31ffa1@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
References: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG3NODE5.st.com (10.75.127.72) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-08_06:2021-02-08,
 2021-02-08 signatures=0
Cc: Marek Vasut <marex@denx.de>, chenshuo <chenshuo@eswin.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Tero Kristo <t-kristo@ti.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis@collabora.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Hongwei Zhang <hongweiz@ami.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, marek.bykowski@gmail.com,
 Etienne
 Carriere <etienne.carriere@linaro.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: [Uboot-stm32] [PATCH v2 5/7] image-fdt: save no-map parameter of
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

Save the no-map information present in 'reserved-memory' node to allow
correct handling when the MMU is configured in board to avoid
speculative access.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 common/image-fdt.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/common/image-fdt.c b/common/image-fdt.c
index 707b44a69d..efd29fdb7b 100644
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
