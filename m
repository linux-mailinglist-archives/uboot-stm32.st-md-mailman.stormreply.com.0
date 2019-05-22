Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEFA25F09
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 10:07:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C37C7C62B40
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 08:07:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6C15C628C7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 08:07:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4M86hBa002737; Wed, 22 May 2019 10:07:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=bKpy9pVUTsAVosAQjAccdpYILPTRNGymjGDHgnoQCJc=;
 b=TLD02Ueuw6Rjq6rpcQf6s/X7OfbbbZ52vZIB7Ah7Ki7fLaOVt+WNUPELYe0+Y3n0v5hn
 asvFQMhmGCi0e5QR4PNqLA3vsCh9KZEy03ELEcmknBIxf3XKgvJnXGWwEOtzsiUwik7p
 2BO9OrJUFNb5T9ZYYHPaPilVI9eE7ACr1z3oC14EgHdLqBUyors189jF85SvzcEC0Fr0
 +0erBDRtEMjDLhqSvHY8cShCjgTWffA6F4baSo2/roaXkv8/QYME/5D112TwLFwNHy3s
 vhuQK/X2zSqAgO2Qa2S2mhL0TJn1nniTWKx4Ebh3x2j8TCtYbe2qSvs5q7zr0FDXQT4b ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj77477r8-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 22 May 2019 10:07:20 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C769E51;
 Wed, 22 May 2019 08:07:12 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B12E418B2;
 Wed, 22 May 2019 08:07:12 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.44) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May
 2019 10:07:12 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May 2019 10:07:12
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Wed, 22 May 2019 10:06:48 +0200
Message-ID: <1558512409-32376-7-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
References: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_03:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 6/7] MAINTAINERS: Add stm32 remoteproc driver
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

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 33fd465..5c505d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -309,6 +309,7 @@ F:	drivers/power/pmic/stpmic1.c
 F:	drivers/power/regulator/stm32-vrefbuf.c
 F:	drivers/power/regulator/stpmic1.c
 F:	drivers/ram/stm32mp1/
+F:	drivers/remoteproc/stm32_copro.c
 F:	drivers/misc/stm32_rcc.c
 F:	drivers/reset/stm32-reset.c
 F:	drivers/spi/stm32_qspi.c
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
