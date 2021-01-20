Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 493282FD15C
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Jan 2021 14:42:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16B8DC3FADA;
	Wed, 20 Jan 2021 13:42:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 184C6C3FADA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 13:42:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10KDaiY1030014; Wed, 20 Jan 2021 14:42:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=llADtb3YF4OCHKingIXY/GiiO5P/eK+1LREBBdpXZNw=;
 b=M4UL9kwuYo9xzPc4eqj0BcdgbfSMonSUOXsQD2hwrHcntX7oEkZD8xyabe68250CwRUO
 bJEviL1UccfUvDnuT4tBYuEV4QuWLnJ14txsCJts5UcpDhbXXPLUHi141UoL6oWDk+Rs
 LgqZ8laSEEJUU+Gq52riCBbnVyl0Jj9L8OXBhqpoYYsfeBgg9r2YGn4t1iqSlvtwYUGU
 OEjhZ5NFa2/1F8eG5d9qXX1Nz2xBKtMObdzLUx1KIVtObn6C68AqX0k4/8L77BaXAfAw
 q4TreCBiAb1HX1fC+91kfuQL0rEKsVrJLz3R/ucomJj5AsIpFjJe55teessmR2mqq5x4 YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pyvtk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 14:42:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E2D4A10002A;
 Wed, 20 Jan 2021 14:42:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DA7FB250725;
 Wed, 20 Jan 2021 14:42:25 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan 2021 14:42:24
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 Jan 2021 14:42:04 +0100
Message-ID: <20210120134205.30488-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120134205.30488-1-patrice.chotard@foss.st.com>
References: <20210120134205.30488-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_05:2021-01-20,
 2021-01-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 4/4] mtd: spinand: Add WATCHDOG_RESET() in
	spinand_mtd_read/write()
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

In case of big area read/write on spi nand, watchdog timeout may occurs.
To fix that, add WATCHDOG_RESET() in spinand_mtd_read() and
spinand_mtd_write() to ensure that watchdog is reset.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

 drivers/mtd/nand/spi/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index cb8ffa3fa9..7f54422c93 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -24,6 +24,7 @@
 #include <errno.h>
 #include <spi.h>
 #include <spi-mem.h>
+#include <watchdog.h>
 #include <linux/mtd/spinand.h>
 #endif
 
@@ -574,6 +575,7 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 #endif
 
 	nanddev_io_for_each_page(nand, from, ops, &iter) {
+		WATCHDOG_RESET();
 		ret = spinand_select_target(spinand, iter.req.pos.target);
 		if (ret)
 			break;
@@ -625,6 +627,7 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
 #endif
 
 	nanddev_io_for_each_page(nand, to, ops, &iter) {
+		WATCHDOG_RESET();
 		ret = spinand_select_target(spinand, iter.req.pos.target);
 		if (ret)
 			break;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
