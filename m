Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9AF37658B
	for <lists+uboot-stm32@lfdr.de>; Fri,  7 May 2021 14:50:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 848CAC59781;
	Fri,  7 May 2021 12:50:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99F2AC59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 May 2021 12:50:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147CmCOk017990; Fri, 7 May 2021 14:50:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=vQnbkGKU38g7h7e4AU3v2/Fm5/VRmTCzgCcbMQdMKFE=;
 b=IpBbBoPryuDb6yubp3XUXakaAkLKoKUyEDb/0EWwAB4ChXdGFdjbgLyLsY+un+0bRtZa
 cdMTXH+jDf8vvwzQboHMkTcF3cRf1LjDWtmg4EMYbhb0qGqsAsbz1XyzdKxUMpRzt6hs
 muFmT64/VnN3oyYuXSwchJbUEfRpa+2sjx/GvZKbPEAo0aT+w4IUzIaHK2ARL3jA8/Qu
 DIhaEXyA1aASKmhiv5ivtrzQAa+ikH3T0V6prbXWUOilvBoSR2zjvoeMsUuLoXIrHcdA
 GkivCyn1OM+VEDKZknuGOvgk45tTuFjbyMQ8VpUgS83jdPkkBS/s8LIp9qEUaZXFgdZM IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38csqrc1b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 14:50:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D4D2100039;
 Fri,  7 May 2021 14:50:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F03D21FB65;
 Fri,  7 May 2021 14:50:45 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May 2021 14:50:45
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 7 May 2021 14:50:30 +0200
Message-ID: <20210507145030.v4.2.I22712a112842c336b2934d240f18dc64f12919db@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507125035.1594-1-patrick.delaunay@foss.st.com>
References: <20210507125035.1594-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_04:2021-05-06,
 2021-05-07 signatures=0
Cc: Masahiro Yamada <masahiroy@kernel.org>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v4 2/7] lmb: add lmb_is_reserved_flags
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

Add a new function lmb_is_reserved_flags to check if
an address is reserved with a specific flags.

This function can be used to check if an address was
reserved with no-map flags with:

lmb_is_reserved_flags(lmb, addr, LMB_NOMAP);

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v4:
- Add comment for lmb_is_reserved_flags and remove extern
- Remove unnecessary !! on return of boolean in lmb_is_reserved_flags

 include/lmb.h | 9 +++++++++
 lib/lmb.c     | 9 +++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index e900b3dd65..3c4afdf9f0 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -100,6 +100,15 @@ extern phys_addr_t lmb_alloc_addr(struct lmb *lmb, phys_addr_t base,
 				  phys_size_t size);
 extern phys_size_t lmb_get_free_size(struct lmb *lmb, phys_addr_t addr);
 extern int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr);
+/**
+ * lmb_is_reserved_flags - test if tha address is in reserved region with a bitfield flag
+ *
+ * @lmb		the logical memory block struct
+ * @addr	address to be tested
+ * @flags	flags bitfied to be tested
+ * @return 0 if not reserved or reserved without the requested flag else 1
+ */
+int lmb_is_reserved_flags(struct lmb *lmb, phys_addr_t addr, int flags);
 extern long lmb_free(struct lmb *lmb, phys_addr_t base, phys_size_t size);
 
 extern void lmb_dump_all(struct lmb *lmb);
diff --git a/lib/lmb.c b/lib/lmb.c
index 69700bf9ba..a0fb8c7e88 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -443,7 +443,7 @@ phys_size_t lmb_get_free_size(struct lmb *lmb, phys_addr_t addr)
 	return 0;
 }
 
-int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
+int lmb_is_reserved_flags(struct lmb *lmb, phys_addr_t addr, int flags)
 {
 	int i;
 
@@ -451,11 +451,16 @@ int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
 		phys_addr_t upper = lmb->reserved.region[i].base +
 			lmb->reserved.region[i].size - 1;
 		if ((addr >= lmb->reserved.region[i].base) && (addr <= upper))
-			return 1;
+			return (lmb->reserved.region[i].flags & flags) == flags;
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
