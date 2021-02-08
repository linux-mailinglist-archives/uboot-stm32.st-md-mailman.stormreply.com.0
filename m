Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E342313334
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Feb 2021 14:27:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FB89C5718A;
	Mon,  8 Feb 2021 13:27:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42032C5717D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 13:27:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 118DRCmx030377; Mon, 8 Feb 2021 14:27:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=zrpFI2YN2btKVRGLQ5fVd0pUyLCTQFRIR/xcxCJMa7E=;
 b=65wn0bpyMALQDTnOvRFoltGYwuvl5y0pNzK/Q6N3Zv5TFl3iz/IV+9IqbYKj0GuhEsME
 +8yxdhM1waj6VeahXLfv8LeGnX7iHMaEZ6JoMsFQ4Keeb6yiSoHTW4N1HU/R8xl3KwMx
 U6iGr0ERXvRyoFSvxFc18qMSZxa2PKdVWXj87W8iAIoDB4VxgrSfeGi9fvO8/Y7a2KTb
 1WMoG4RH8Y91/7yxUyscpCpg2Hp4VksPrewuXLltgSXVuRMQXPz/naqM/lBji99Z8VvI
 97ZR5QNziO1tc642oOANBpfzFSFRx0PLBQuJlfwkTZcxjGF6yKxPd4I+Q3VfCUmeldTg zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrf72asr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 14:27:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E54D10002A;
 Mon,  8 Feb 2021 14:27:17 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3578E2AD2C0;
 Mon,  8 Feb 2021 14:27:17 +0100 (CET)
Received: from localhost (10.75.127.122) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 8 Feb 2021 14:27:16 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 8 Feb 2021 14:26:50 +0100
Message-ID: <20210208142645.v2.2.I22712a112842c336b2934d240f18dc64f12919db@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
References: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE6.st.com (10.75.127.70) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-08_06:2021-02-08,
 2021-02-08 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Stefan Roese <sr@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, marek.bykowski@gmail.com, Etienne
 Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: [Uboot-stm32] [PATCH v2 2/7] lmb: add lmb_is_reserved_flags
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
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 include/lmb.h |  1 +
 lib/lmb.c     | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index 4987e61bf3..59db94501d 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -85,6 +85,7 @@ extern phys_addr_t lmb_alloc_addr(struct lmb *lmb, phys_addr_t base,
 				  phys_size_t size);
 extern phys_size_t lmb_get_free_size(struct lmb *lmb, phys_addr_t addr);
 extern int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr);
+extern int lmb_is_reserved_flags(struct lmb *lmb, phys_addr_t addr, int flags);
 extern long lmb_free(struct lmb *lmb, phys_addr_t base, phys_size_t size);
 
 extern void lmb_dump_all(struct lmb *lmb);
diff --git a/lib/lmb.c b/lib/lmb.c
index 5975f6b6e1..af398c5144 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -440,7 +440,7 @@ phys_size_t lmb_get_free_size(struct lmb *lmb, phys_addr_t addr)
 	return 0;
 }
 
-int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
+int lmb_is_reserved_flags(struct lmb *lmb, phys_addr_t addr, int flags)
 {
 	int i;
 
@@ -448,11 +448,17 @@ int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
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
