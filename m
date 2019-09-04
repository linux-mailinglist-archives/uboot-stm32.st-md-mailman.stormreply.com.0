Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B43DBA7D16
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Sep 2019 09:53:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 643B3C36B3F
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Sep 2019 07:53:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1541CC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 07:53:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x847p8hp007131; Wed, 4 Sep 2019 09:53:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=zDNYR1PFaspce2lSaQcE0Vs61WY8bHZWSD4DU2vbfN0=;
 b=Aa6pZ9XHbHls3ZlVpYxow29T8trxJc7KXfWiXoZHZ1Rb6Sku/2Ln9a67hQWC3byS3URM
 f/hJML/7yX6tl2vnxHEAK64eqPDFQtyRWiyH38lyjD6ubRHvvdFE6dVjI26w0tC+199n
 maPQNxoNc9mQt/701b3AwBEPoVJxrk94xn9OQzFa/eFba/vOPbPOiuzba1V6gJjpb2Ib
 N1eUFBnZnNSCXinKFtAW6P86pA918/235dyFc7gq5ig+xSn3iwVvwPBQSerEIFRkBOWy
 szjSUjALahqFwsefxUCWXMoHxb4jyLsIzdRuOtqw7BzZcOQinL/KboS9BwNXvKTdhSQM 0w== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uqec2ytqw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 04 Sep 2019 09:53:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CDC894E;
 Wed,  4 Sep 2019 07:53:37 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 233952B6BCC;
 Wed,  4 Sep 2019 09:53:37 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 4 Sep 2019
 09:53:37 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 4 Sep 2019 09:53:36
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: <u-boot@lists.denx.de>, Lokesh Vutla <lokeshvutla@ti.com>, Loic Pallardy
 <loic.pallardy@st.com>
Date: Wed, 4 Sep 2019 09:53:22 +0200
Message-ID: <1567583602-17022-1-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-04_01:2019-09-03,2019-09-04 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH] remoteproc: elf_loader: fix program header
	parsing
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

Fix an issue where some sections are never loaded : if p_type is
different from PT_LOAD the phdr pointer must be incremented.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/remoteproc/rproc-elf-loader.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/rproc-elf-loader.c b/drivers/remoteproc/rproc-elf-loader.c
index 67937a7..23d502d 100644
--- a/drivers/remoteproc/rproc-elf-loader.c
+++ b/drivers/remoteproc/rproc-elf-loader.c
@@ -78,7 +78,7 @@ int rproc_elf32_load_image(struct udevice *dev, unsigned long addr)
 	ops = rproc_get_ops(dev);
 
 	/* Load each program header */
-	for (i = 0; i < ehdr->e_phnum; ++i) {
+	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
 		void *dst = (void *)(uintptr_t)phdr->p_paddr;
 		void *src = (void *)addr + phdr->p_offset;
 
@@ -99,7 +99,6 @@ int rproc_elf32_load_image(struct udevice *dev, unsigned long addr)
 			    roundup((unsigned long)dst + phdr->p_filesz,
 				    ARCH_DMA_MINALIGN) -
 			    rounddown((unsigned long)dst, ARCH_DMA_MINALIGN));
-		++phdr;
 	}
 
 	return 0;
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
