Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F709DE679
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 Nov 2024 13:28:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24BD6C78025;
	Fri, 29 Nov 2024 12:28:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FB3EC78025
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2024 12:28:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATB2oRQ032280;
 Fri, 29 Nov 2024 13:28:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ej7J32RCXt7d/5dbzpSWaTJ8vWGLuF31eg8X6IpZdTo=; b=GBU0/EjAx0x++CSo
 fO4L0qj3hA5bDyjoW0RNZDPjoNmFfK6J6j4u4yE5MtQ0CcblC7kl5H2MYbUv3LqJ
 X7PQSE/y+Wc0us9OCsFhDMW9LEvxYzdvIwTqyflwyyqxVyiYJvLF47RiNO4ZUTW/
 nU3M9e2XxmT3zalJp+5IswftutWslgZdKP3Ug3zf5KBswFxUMDb40QR7ga8fLCFN
 rBwBwV5qWAB0uRAkZ/LQU4JUEh2WLWTCw0U9CF7OAEGJs6CON4QA0SQA9Khk9aJv
 TuDqfcnRsoybOSbjjMqPWPs9/R+A7DcFHL818saslDdWcjqGeIjCqrj229Mf7hk7
 MPTdlA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 436713sr6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 13:28:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 04BB840045;
 Fri, 29 Nov 2024 13:27:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB0F528AF0F;
 Fri, 29 Nov 2024 13:27:18 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 29 Nov
 2024 13:27:18 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 29 Nov 2024 13:27:06 +0100
Message-ID: <20241129122711.411917-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129122711.411917-1-patrice.chotard@foss.st.com>
References: <20241129122711.411917-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 1/6] fastboot: Fix warning when
	CONFIG_SYS_64BIT_LBA is enable
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

If CONFIG_SYS_64BIT_LBA is enable, following compilation warning is
triggered:

 CC      drivers/fastboot/fb_mmc.o
../drivers/fastboot/fb_mmc.c: In function 'fb_mmc_erase_mmc_hwpart':
../drivers/fastboot/fb_mmc.c:215:35: warning: format '%lu' expects
argument of type 'long unsigned int', but argument 2 has type
'long long unsigned int' [-Wformat=]
  215 |         printf("........ erased %lu bytes from mmc hwpart[%u]\n",
      |                                 ~~^
      |                                   |
      |                                   long unsigned int
      |                                 %llu
  216 |                dev_desc->lba * dev_desc->blksz, dev_desc->hwpart);
      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                              |
      |                              long long unsigned int
../drivers/fastboot/fb_mmc.c: In function 'fb_mmc_boot_ops':
../drivers/fastboot/fb_mmc.c:261:42: warning: format '%lu' expects
argument of type 'long unsigned int', but argument 2 has type
'long long unsigned int' [-Wformat=]
  261 |                 printf("........ wrote %lu bytes to EMMC_BOOT%d\n",
      |                                        ~~^
      |                                          |
      |                                          long unsigned int
      |                                        %llu
  262 |                        blkcnt * blksz, hwpart);
      |                        ~~~~~~~~~~~~~~
      |                               |
      |                               long long unsigned int

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/fastboot/fb_mmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/fastboot/fb_mmc.c b/drivers/fastboot/fb_mmc.c
index f11eb66761b..dca7c222f35 100644
--- a/drivers/fastboot/fb_mmc.c
+++ b/drivers/fastboot/fb_mmc.c
@@ -211,8 +211,8 @@ static int fb_mmc_erase_mmc_hwpart(struct blk_desc *dev_desc)
 		return 1;
 	}
 
-	printf("........ erased %lu bytes from mmc hwpart[%u]\n",
-	       dev_desc->lba * dev_desc->blksz, dev_desc->hwpart);
+	printf("........ erased %llu bytes from mmc hwpart[%u]\n",
+	       (u64)(dev_desc->lba * dev_desc->blksz), dev_desc->hwpart);
 
 	return 0;
 }
@@ -257,8 +257,8 @@ static void fb_mmc_boot_ops(struct blk_desc *dev_desc, void *buffer,
 			return;
 		}
 
-		printf("........ wrote %lu bytes to EMMC_BOOT%d\n",
-		       blkcnt * blksz, hwpart);
+		printf("........ wrote %llu bytes to EMMC_BOOT%d\n",
+		       (u64)(blkcnt * blksz), hwpart);
 	} else { /* erase */
 		if (fb_mmc_erase_mmc_hwpart(dev_desc)) {
 			pr_err("Failed to erase EMMC_BOOT%d\n", hwpart);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
