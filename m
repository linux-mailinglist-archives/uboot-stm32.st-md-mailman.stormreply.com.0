Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 101E3B1EB3B
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Aug 2025 17:13:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D359DC3F952;
	Fri,  8 Aug 2025 15:12:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 914C6C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Aug 2025 15:12:57 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578FBaVg009805;
 Fri, 8 Aug 2025 17:12:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ogPoP2vh0zNHGg6dvxMz+dwk3N2nBZc3z1a2PnDp1Lc=; b=aQF72BORyFaXYGoC
 ZCnMWVk0AY5iQ31fSbieTswPVVVhD27IKXlF8r3Nrr3PPydwZ/ToFiFyZMrsQaFE
 I7ApiL4nu04pyn5hFQsNQi4Ws532hBAmAYSASvuc+i2jghJWOHlKvizdtzzE6D88
 qkKHxEdraYdCjdbpp+ifMcQpZs9H06IOeKCZ5evMccsuks9FlqbwAfEsGANd1rYx
 Vtd5byqakp8B9OwAiTiQuriJdSWCncO71cARmJmJTaZfLspz6Q950FYH+UWCQA7c
 BBTJQrWXyZv2aWSzXyALjF3RazWctH07nqlBwR7gkUShC1E+UmfAonZ3OopBdLDz
 5DTVng==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48bpx0cr9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Aug 2025 17:12:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8683140050;
 Fri,  8 Aug 2025 17:12:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C18D72A0C1;
 Fri,  8 Aug 2025 17:12:01 +0200 (CEST)
Received: from localhost (10.252.12.105) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 17:12:01 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 8 Aug 2025 17:11:50 +0200
Message-ID: <20250808151154.472860-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808151154.472860-1-patrice.chotard@foss.st.com>
References: <20250808151154.472860-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.12.105]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_04,2025-08-06_01,2025-03-28_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 1/5] ioport: Add resource check helpers
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

Add resource_overlaps() and resource_contains() helpers.
Code copied from kernel source.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 include/linux/ioport.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 85288c3729a..c12a7f70ad7 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -135,6 +135,22 @@ static inline unsigned long resource_type(const struct resource *res)
 	return res->flags & IORESOURCE_TYPE_BITS;
 }
 
+/* True iff r1 completely contains r2 */
+static inline bool resource_contains(struct resource *r1, struct resource *r2)
+{
+	if (resource_type(r1) != resource_type(r2))
+		return false;
+	if (r1->flags & IORESOURCE_UNSET || r2->flags & IORESOURCE_UNSET)
+		return false;
+	return r1->start <= r2->start && r1->end >= r2->end;
+}
+
+/* True if any part of r1 overlaps r2 */
+static inline bool resource_overlaps(struct resource *r1, struct resource *r2)
+{
+	return r1->start <= r2->end && r1->end >= r2->start;
+}
+
 /* Convenience shorthand with allocation */
 #define request_region(start,n,name)	__request_region(&ioport_resource, (start), (n), (name), 0)
 #define __request_mem_region(start,n,name, excl) __request_region(&iomem_resource, (start), (n), (name), excl)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
