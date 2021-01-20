Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 843A02FD159
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Jan 2021 14:42:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C0CAC3FADA;
	Wed, 20 Jan 2021 13:42:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 041F0C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 13:42:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10KDbwwk008193; Wed, 20 Jan 2021 14:42:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=/0P+hRhK+za4/ezDxCcPtTY4rP3jHy5+aM1UkCkjdWE=;
 b=RdeAaUdLvqar/0TnvUe0odbovqJkNuA9YTyMkAIWbnF683WhMrqbQnSxlsdI/E+xkR5+
 ULUmnkIUnbSou10K5gP6S/mjkYGqoRKN3s/QoODX7JMEQuYVc0+won9XdbBq4gJ+xEJ/
 TMOBosLK2gXxRVlb2qqbJxH6jhGG7t7X6E7R3f+W1MCZ8OmCejLNDNoXotpiMFKiOnYw
 wUUSuyeWpgpTqnQ+IiDPqg0eny23aZ+UznP26/QEtAdBz5FR5pOH04rlGNLYlpL+nv92
 WHDXBItM8bDEyNJeqNSnAL9v3j1HmuyJRPwGcOX9CobfphsD2a9L7GHmJNGBaXnm+fSY lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pq4scn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 14:42:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C95310002A;
 Wed, 20 Jan 2021 14:42:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1FDF3250724;
 Wed, 20 Jan 2021 14:42:14 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan 2021 14:42:13
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 Jan 2021 14:42:01 +0100
Message-ID: <20210120134205.30488-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120134205.30488-1-patrice.chotard@foss.st.com>
References: <20210120134205.30488-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_05:2021-01-20,
 2021-01-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vignesh R <vigneshr@ti.com>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 1/4] mtd: spi-nor: Add WATCHDOG_RESET() in
	spi_nor_core callbacks
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

In case of big area write/erase on spi nor, watchdog timeout may occurs.
Issue reproduced on stm32mp157c-ev1 with following commands:

sf write 0xC0000000 0 0x3000000
or
sf erase 0 0x1000000

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/mtd/spi/spi-nor-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index eb49a6c11c..51e0613d4c 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -10,6 +10,7 @@
  */
 
 #include <common.h>
+#include <watchdog.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/log2.h>
@@ -557,6 +558,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	len = instr->len;
 
 	while (len) {
+		WATCHDOG_RESET();
 #ifdef CONFIG_SPI_FLASH_BAR
 		ret = write_bar(nor, addr);
 		if (ret < 0)
@@ -1235,6 +1237,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	for (i = 0; i < len; ) {
 		ssize_t written;
 		loff_t addr = to + i;
+		WATCHDOG_RESET();
 
 		/*
 		 * If page_size is a power of two, the offset can be quickly
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
