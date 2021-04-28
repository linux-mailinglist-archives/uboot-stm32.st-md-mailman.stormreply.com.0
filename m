Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EC636D5B5
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Apr 2021 12:23:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6947C58D59;
	Wed, 28 Apr 2021 10:23:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3775DC57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Apr 2021 10:23:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SAGgc4025303; Wed, 28 Apr 2021 12:23:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=gLujTg0m32QTOT+jlJu5pWMI3c7V9MSpx/uoy2Ahca4=;
 b=p1TMkLWuRNGt4wKDgaAvpFBBZ4cBibuY1F+dkX9/kV+e22XgK3gcvQxUwi6vJCTSERcW
 7mC5eb2lQruhk8nBR2e+JjQENKZDN8KUBFt/2fGmpD3fdhr6o4grnBSflhmzTMAbBuXo
 Gz9MfvWcJ9Uzn2Op5LAso173FmWhYIu5uzzJpxdfFYwQhhMgs2wL1V4a9NuJMM5EM5Oi
 wIaxyNf9SpIWpIpcMI3KmqQeB0VfNqKvD8UrvuSnksoO2DEGiIvcWN0gfmHhlRoLjCvm
 arWRs87sgJusShkm1xlmmSn19KAI/ZMwd6SuobHqvEQv/lzCCWNn+8E5A90ZHqJuzny2 bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 386ea8fm3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 12:23:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B34E100039;
 Wed, 28 Apr 2021 12:23:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 240AC211B0B;
 Wed, 28 Apr 2021 12:23:50 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 12:23:49
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 28 Apr 2021 12:23:40 +0200
Message-ID: <20210428122109.v3.2.I22712a112842c336b2934d240f18dc64f12919db@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
References: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_04:2021-04-27,
 2021-04-28 signatures=0
Cc: Marek Vasut <marex@denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Stefan Roese <sr@denx.de>,
 Ard Biesheuvel <ardb@kernel.org>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, marek.bykowski@gmail.com,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH v3 2/7] lmb: add lmb_is_reserved_flags
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

Add a new function lmb_is_reserved_flags to check is a
address is reserved with a specific flags.

This function can be used to check if an address was
reserved with no-map flags with:

lmb_is_reserved_flags(lmb, addr, LMB_NOMAP);

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 include/lmb.h |  1 +
 lib/lmb.c     | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index aa196c63bf..6537d56e18 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -91,6 +91,7 @@ extern phys_addr_t lmb_alloc_addr(struct lmb *lmb, phys_addr_t base,
 				  phys_size_t size);
 extern phys_size_t lmb_get_free_size(struct lmb *lmb, phys_addr_t addr);
 extern int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr);
+extern int lmb_is_reserved_flags(struct lmb *lmb, phys_addr_t addr, int flags);
 extern long lmb_free(struct lmb *lmb, phys_addr_t base, phys_size_t size);
 
 extern void lmb_dump_all(struct lmb *lmb);
diff --git a/lib/lmb.c b/lib/lmb.c
index 69700bf9ba..e270e86186 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -443,7 +443,7 @@ phys_size_t lmb_get_free_size(struct lmb *lmb, phys_addr_t addr)
 	return 0;
 }
 
-int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
+int lmb_is_reserved_flags(struct lmb *lmb, phys_addr_t addr, int flags)
 {
 	int i;
 
@@ -451,11 +451,17 @@ int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
 		phys_addr_t upper = lmb->reserved.region[i].base +
 			lmb->reserved.region[i].size - 1;
 		if ((addr >= lmb->reserved.region[i].base) && (addr <= upper))
-			return 1;
+			return !!((lmb->reserved.region[i].flags & flags)
+				   == flags);
 	}
 	return 0;
 }
 
+int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
+{
+	return lmb_is_reserved_flags(lmb, addr, LMB_NONE);
+}
+
 __weak void board_lmb_reserve(struct lmb *lmb)
 {
 	/* please define platform specific board_lmb_reserve() */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
