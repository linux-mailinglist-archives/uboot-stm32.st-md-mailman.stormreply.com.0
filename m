Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50621467408
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Dec 2021 10:27:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A061C5F1E0;
	Fri,  3 Dec 2021 09:27:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9AA5CFAC52
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 09:27:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B37fxNt016005;
 Fri, 3 Dec 2021 10:27:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=XYopCYC3ev1qfdpBlU+eR3Q1jR9RZIT9wKvArNmJ8xc=;
 b=SQc9llXKXj6zObJKBaY+t0l62yuYqfTsHTk5ubP8zM6hhJgkXS5EjjzNiqWUIfqU1Dbg
 jiMC/mKqW61QEN4GkQdNRarkko0j0Hm4gUG0R0mdsGAvcQdAJ59pupGgYSB8yRQvHfB2
 xrkSH+HOhNJx5ir9R8fYHTdyUEN+XjIJeT8/Qyp+gB1fgT/ode9RQvXWAupONxcbgtNb
 o9Nx93QgbIbZZlNPposJmfkdexr4CyYDifvpcGfG3tH02QQy666JF91Pf6tHgpJ4wt25
 TmZrLDOw5NHI479srZBlA05IT6xd/mPhSTdXYdoEI6Ac/u7mGGKHryARn9kC1yyZOZ/q dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cq4rr34g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 10:27:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 369F210002A;
 Fri,  3 Dec 2021 10:27:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0EED72289A8;
 Fri,  3 Dec 2021 10:27:47 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 3 Dec 2021 10:27:46
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Dec 2021 10:27:44 +0100
Message-ID: <20211203092744.24870-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_05,2021-12-02_01,2021-12-02_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [Uboot-stm32] [PATCH] mtd: cfi_mtd: populate mtd->dev with
	flash_info->dev
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

Populate mtd->dev with flash_info->dev which allows to get
full mtd information using the "mtd list" command.
Before, "mtd list" command returns :

List of MTD devices:
* nor0
  - type: NOR flash
  - block size: 0x40000 bytes
  - min I/O: 0x1 bytes
  - 0x000000000000-0x000004000000 : "nor0"

After this patch we get for example:

List of MTD devices:
* nor0
  - device: flash@0
  - parent: spi@40430000
  - driver: cfi_flash
  - path: /soc/spi@40430000/flash@0
  - type: NOR flash
  - block size: 0x40000 bytes
  - min I/O: 0x1 bytes
  - 0x000000000000-0x000004000000 : "nor0"

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/mtd/cfi_mtd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/cfi_mtd.c b/drivers/mtd/cfi_mtd.c
index 2295bb7220..1475461a59 100644
--- a/drivers/mtd/cfi_mtd.c
+++ b/drivers/mtd/cfi_mtd.c
@@ -221,6 +221,9 @@ int cfi_mtd_init(void)
 			continue;
 
 		sprintf(cfi_mtd_names[i], "nor%d", i);
+#ifdef CONFIG_CFI_FLASH
+		mtd->dev		= fi->dev;
+#endif
 		mtd->name		= cfi_mtd_names[i];
 		mtd->type		= MTD_NORFLASH;
 		mtd->flags		= MTD_CAP_NORFLASH;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
