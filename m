Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB942FD15A
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Jan 2021 14:42:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC0D6C3FADA;
	Wed, 20 Jan 2021 13:42:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2E0EC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 13:42:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10KDbNZB024205; Wed, 20 Jan 2021 14:42:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=NCIJCQjLzYd7pp7/ILL9nyY88H9x8n64ifwpXxG0s5A=;
 b=li/52wnluM+qDUPtU8N0dlnIjt/1Woen1L47rt0+5R0lQe0ATSJe/ykcIQfsMDX5cD6T
 gMmG661qYj6e5xQbp5tQlCW3dNlT+9/uGpXKwyMZTim/j1hMvfdM74MXz1wl5hoLFBXd
 0csKsKcxQ868pQ9AHnq/uISMvHH2wEzUGHp0aG6QjBROnCAEMQVWrETZvssY8PXVJPTN
 pwI9p4vXM8h4ml/t1Mxwy6uGDEYzS0bcIEIlUmwaSATtRjNxDR5oCmwSAij+r93jFEqm
 osEob+nhMG0JpOx1DpJXyxB+QAhSrl1YWD/3GNPbMtHT6+GbyUkME8AKinVd+NTTT4rh 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pdmscd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 14:42:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08E6110002A;
 Wed, 20 Jan 2021 14:42:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0A1C250724;
 Wed, 20 Jan 2021 14:42:17 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan 2021 14:42:16
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 Jan 2021 14:42:02 +0100
Message-ID: <20210120134205.30488-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120134205.30488-1-patrice.chotard@foss.st.com>
References: <20210120134205.30488-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_05:2021-01-20,
 2021-01-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 2/4] spi: stm32_qspi: Add WATCHDOG_RESET in
	_stm32_qspi_read_fifo()
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

In case of reading large area and memory-map mode is misconfigured
(memory-map size declared lower than the real size of the memory chip)
watchdog can be triggered.

Add WATCHDOG_RESET() in _stm32_qspi_read_fifo to fix it.

Issue reproduced with stm32mp157c-ev1 board and memory map size set to
1, with following command:
sf read 0xC0000000 0 0x4000000

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/spi/stm32_qspi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
index 958c394a1a..c3da17f991 100644
--- a/drivers/spi/stm32_qspi.c
+++ b/drivers/spi/stm32_qspi.c
@@ -11,6 +11,7 @@
 #include <clk.h>
 #include <reset.h>
 #include <spi-mem.h>
+#include <watchdog.h>
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
 #include <linux/sizes.h>
@@ -163,6 +164,7 @@ static int _stm32_qspi_wait_cmd(struct stm32_qspi_priv *priv,
 static void _stm32_qspi_read_fifo(u8 *val, void __iomem *addr)
 {
 	*val = readb(addr);
+	WATCHDOG_RESET();
 }
 
 static void _stm32_qspi_write_fifo(u8 *val, void __iomem *addr)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
