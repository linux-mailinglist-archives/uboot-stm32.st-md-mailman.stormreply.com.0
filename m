Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E5825D6D5
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Sep 2020 12:51:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A9AAC3FADC
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Sep 2020 10:51:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5068DC36B26
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Sep 2020 10:51:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 084AoQL2023324; Fri, 4 Sep 2020 12:51:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=oRpFSVcPYO1CEgcPOhQAs2nSsTZrvOFBnsoNWDQfDqc=;
 b=SKt9duoOzA0pxhEhJb+ZUXzDNsiI3rxqxOysvcCTijfRwLFVJ8hfY3HRVSR1fzlpIPTI
 uNtfBQFILHjMyK6zPPKJhG3SAQJFEbqaMKHl7r/5AEKmct/Euwtz0PX2/S4Z+VeiNnSI
 CYkPM2YR2e6RV5zw1hYTCEYcqmiYBuxBARxuuocOThybIxgVYpu6hWtIREj0dwXUGM9Y
 kkzWdmfnub+ly9L7NMNJksguSfdMZnpPRTsbUXiMtvfrc5gRdYos7RQEZ0BavL3BqDA/
 4CboZqa7M3xD+7+dUFLLDOdZvd6uOyfeiaj1yYMYSRYOalH5hJINJz297dFkJ77cHKM3 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 337cg2194m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Sep 2020 12:51:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 45BE8100034;
 Fri,  4 Sep 2020 12:51:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B2A02AB332;
 Fri,  4 Sep 2020 12:51:36 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 4 Sep 2020 12:51:35 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 4 Sep 2020 12:51:27 +0200
Message-ID: <20200904125122.RFC.2.I22712a112842c336b2934d240f18dc64f12919db@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904105133.2502-1-patrick.delaunay@st.com>
References: <20200904105133.2502-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-04_06:2020-09-04,
 2020-09-04 signatures=0
Cc: Marek Vasut <marex@denx.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [RFC PATCH 2/7] lmb: add lmb_is_reserved_flags
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

This function can be used to check if an address had be
reserved with no-map flags with:

lmb_is_reserved_flags(lmb, addr, LMB_NOMAP);

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/lmb.h |  1 +
 lib/lmb.c     | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index 1c73f4851b..68e9cc007a 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -59,6 +59,7 @@ extern phys_addr_t lmb_alloc_addr(struct lmb *lmb, phys_addr_t base,
 				  phys_size_t size);
 extern phys_size_t lmb_get_free_size(struct lmb *lmb, phys_addr_t addr);
 extern int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr);
+extern int lmb_is_reserved_flags(struct lmb *lmb, phys_addr_t addr, int flags);
 extern long lmb_free(struct lmb *lmb, phys_addr_t base, phys_size_t size);
 
 extern void lmb_dump_all(struct lmb *lmb);
diff --git a/lib/lmb.c b/lib/lmb.c
index e85e08635c..3d64521a32 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -445,7 +445,7 @@ phys_size_t lmb_get_free_size(struct lmb *lmb, phys_addr_t addr)
 	return 0;
 }
 
-int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
+int lmb_is_reserved_flags(struct lmb *lmb, phys_addr_t addr, int flags)
 {
 	int i;
 
@@ -453,11 +453,17 @@ int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
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
