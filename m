Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F35BB1FBB58
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 18:19:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92634C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 16:19:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1A22C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 16:19:35 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GG2uOI016492; Tue, 16 Jun 2020 18:19:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=HPv/FSHJVSsQrbpEwGRfgyUmJeEFKT4svN8mgo5NpQQ=;
 b=WW/mZyh4i+Zkd/MPWj/oBoFJz2e98MbkTAc5NppW6MP753rncXdEy5YnJp9Wp9AEnKm3
 lh8LgMHJ6lZrU9et0Fh1vxX4RRGabRX8emsiTn91ELCS18rg/Kf8alxeGoL/EotmNsuM
 AruQuyyPVFsxOjccUQQRg9Moj4Hvw6OhYvEUsK220YWhXIV8b/JeVt6sT6Mzo0CGBWsw
 Pwql0/hG03gcg0PA6IDu4NZuaDv+3xpIyoUZVAj6DauuPsd2rQoK3IFd4OLc6/vci3QT
 YHgY0hh7TIiONmhIr7PQTTZPF2bLl4WiyOIm1tp3s595pwptewTh6EBsp+P1nODnVjgY ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mmjw0c06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 18:19:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4704B10002A;
 Tue, 16 Jun 2020 18:19:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E6112AC941;
 Tue, 16 Jun 2020 18:19:30 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 18:19:29 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 16 Jun 2020 18:19:28 +0200
Message-ID: <20200616181919.1.I835f0c06bfc195456c3b4a0ff8e427013f9fe097@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_07:2020-06-16,
 2020-06-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] board: st: stm32mp1: increase teed partition
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

With TEE 3.7.0, the partition teed (OP-TEE pageable
code and data) need to increase up to 512KB in NOR device.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
index 015ba40939..750dbb6451 100644
--- a/board/st/common/Kconfig
+++ b/board/st/common/Kconfig
@@ -39,7 +39,7 @@ config MTDPARTS_NOR0_BOOT
 
 config MTDPARTS_NOR0_TEE
 	string "mtd tee partitions for nor0"
-	default "256k(teeh),256k(teed),256k(teex)"
+	default "256k(teeh),512k(teed),256k(teex)"
 	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
 	help
 	  This define the tee partitions added in mtparts dynamically
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
