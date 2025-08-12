Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2EAB22712
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Aug 2025 14:37:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F384C3F93B;
	Tue, 12 Aug 2025 12:37:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F97CC3F931
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 12:37:40 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CCYffq029054;
 Tue, 12 Aug 2025 14:37:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=FhbPKTp8pgOPW1lJoNZOSD
 j6wNSwN4hJGyLbpVb/pjc=; b=dMdHGiLRarZvhWxS5Bt83cBIHiLQgSxOBzUW5m
 32I3tMjvb9E6jtQgQUif3VDoY/oVH4InalkZp5zHQF8dLfzaFpIEDzM2Gds0mwYl
 vTQsmvy2YMmGKeHdJMrKeKkWV2K3Xa60pJCbniP7JXqx8CK+RGbMn5T87rHV9UCD
 XnyVMA+LvgJUspzULIp7xysgLJU4/yvX3puD70QUoecBiOO4CgDRZTenhwVT1tK5
 eN5aJ3O45ws9aHLSjbBUhpvjLAsSwspG8v98YK91Dc3EtrMYLI3yPRskqRd5MvKm
 L3EuMLO8kAZv06DzmCbWR7ZeqSERTtObAjpZNzCHBo0Bu3tA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48efw4rejy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Aug 2025 14:37:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8083240046;
 Tue, 12 Aug 2025 14:36:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8765B783009;
 Tue, 12 Aug 2025 14:36:03 +0200 (CEST)
Received: from localhost (10.48.87.65) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 14:36:03 +0200
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 12 Aug 2025 14:35:11 +0200
Message-ID: <20250812123511.250782-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.65]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH] mtd: rawnand: stm32_fmc2: set available OOB
	bytes per page
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

File system such as YAFFS2 need to know the number of available
OOB bytes per page to be able to choose if they should locate their
metadata in the data area or in the spare area.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index d1c88643c98..21e3c88a55a 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1034,6 +1034,7 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
 		ecclayout->eccpos[i] = oob_index;
 	ecclayout->oobfree->offset = oob_index;
 	ecclayout->oobfree->length = mtd->oobsize - ecclayout->oobfree->offset;
+	ecclayout->oobavail = ecclayout->oobfree->length;
 	chip->ecc.layout = ecclayout;
 
 	if (chip->options & NAND_BUSWIDTH_16)
-- 
2.25.1

base-commit: a0b83b90e0fbdb15546f34c660c87f1aca999452
branch: FMC-YAFFS2
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
