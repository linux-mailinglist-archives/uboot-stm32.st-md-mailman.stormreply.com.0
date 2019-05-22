Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB225F05
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 10:07:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A99FEC628C4
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 08:07:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8136BC628BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 08:07:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4M86hBX002737; Wed, 22 May 2019 10:07:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=rh7TOf41mgwe1cs7VtchDwGhqTdx2UTTPBaTfNCUaAw=;
 b=bwAfT+bxJEOqS3fxZ0PsghF8ggeYdIbqD/lJ5q1rpZ+Xr+9D0/XaN7FHnjD5/fpfSKJ2
 20VsYEyDxB4Vf4RjxzpHu3s4L53PLWqaMPbWE+Vstc5EHAbTXSHIceljiLwbiFvRBA/H
 iHuEdwW2c0tfOEKhZ36b1lrpsStycod8bskD9czo7dRT/VHLX6VHUcw2nq8/MOrRbUZb
 qGUXup5nkWFPbbnoZgrv97S0Gv96u4z7M2m+9eCIKXXeuQT1l3rp/rAX1OFCURHNLNlD
 WylZAtFRp0K1S/rsnLukkOZKYnWb5z03odARRZWMnwuKJZdNk5SUHM1fXNbngTbUiXP6 dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj77477q1-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 22 May 2019 10:07:07 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 623E73F;
 Wed, 22 May 2019 08:07:06 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4CEDB18E2;
 Wed, 22 May 2019 08:07:06 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.44) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May
 2019 10:07:06 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May 2019 10:07:05
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Wed, 22 May 2019 10:06:43 +0200
Message-ID: <1558512409-32376-2-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
References: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_03:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 1/7] fdt: Introduce fdt_translate_dma_address()
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

Add the fdt_translate_dma_address() function to translate DMA address to
CPU address.
This function works the same way as fdt_translate_address(), with the
difference that the translation relies on the "dma-ranges" property
instead of the "ranges" property.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 common/fdt_support.c  | 6 ++++++
 include/fdt_support.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/common/fdt_support.c b/common/fdt_support.c
index 4e7cf6e..6ec0742 100644
--- a/common/fdt_support.c
+++ b/common/fdt_support.c
@@ -1279,6 +1279,12 @@ u64 fdt_translate_address(const void *blob, int node_offset,
 	return __of_translate_address(blob, node_offset, in_addr, "ranges");
 }
 
+u64 fdt_translate_dma_address(const void *blob, int node_offset,
+			      const fdt32_t *in_addr)
+{
+	return __of_translate_address(blob, node_offset, in_addr, "dma-ranges");
+}
+
 /**
  * fdt_node_offset_by_compat_reg: Find a node that matches compatiable and
  * who's reg property matches a physical cpu address
diff --git a/include/fdt_support.h b/include/fdt_support.h
index 27fe564..b92d8c0 100644
--- a/include/fdt_support.h
+++ b/include/fdt_support.h
@@ -220,6 +220,8 @@ static inline void fdt_fixup_mtdparts(void *fdt,
 void fdt_del_node_and_alias(void *blob, const char *alias);
 u64 fdt_translate_address(const void *blob, int node_offset,
 			  const __be32 *in_addr);
+u64 fdt_translate_dma_address(const void *blob, int node_offset,
+			      const __be32 *in_addr);
 int fdt_node_offset_by_compat_reg(void *blob, const char *compat,
 					phys_addr_t compat_off);
 int fdt_alloc_phandle(void *blob);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
