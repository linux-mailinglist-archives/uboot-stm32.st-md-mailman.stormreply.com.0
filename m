Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E4223405D
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 09:45:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EADE3C36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 07:45:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC98AC36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 07:45:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V7fagh006310; Fri, 31 Jul 2020 09:45:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=DDN+DW1EbFd5Lk/3FRvRtSazfO0l01WbdKeFy90c3YI=;
 b=hihasu5y7BxXmu2QD7j2WRJaAaSVLtYaWgtOHCq0gB5FrDFNbX/yWv5FH/jPQLdZ8rA4
 2y5ibHLcMH50RO0OuAMa8YATBDq7JgsXGa54QzCugIc5vTxpIptbR/yyMxh9lg4FD8eV
 n425ojcjuKJhaeWqIj9DwzR1RyFjygM6zpVUZU+JRz5exsUlKtstgj0hDxXi2O13xVEg
 Fc7XJn5bhC4sOf9y1vjaoBKpbCkPv4laCS5V1FVJmCsrVvnKhKhr75TUrCHLbkVVP1Ki
 s5xjqeydPh5ow53txj7THzJuHUxJSTtttG2lkBErfOHYnOPz5haxnSNAtew6OH5MH/Fi AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9wfy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 09:45:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB06310002A;
 Fri, 31 Jul 2020 09:45:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99152221084;
 Fri, 31 Jul 2020 09:45:12 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 09:45:11 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 09:45:05 +0200
Message-ID: <20200731074505.25642-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Kever Yang <kever.yang@rock-chips.com>
Subject: [Uboot-stm32] [RESEND][PATCH] usb: host: dwc3-sti-glue: Fix
	ofnode_valid() parameter
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

node varaible is used as iterator into ofnode_for_each_subnode()
loop, when exiting of it, node is no more a valid ofnode.
Use dwc3_node instead as parameter of ofnode_valid()

Fixes: ac28e59a574d ("usb: Migrate to support live DT for some driver")
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Cc: Kever Yang <kever.yang@rock-chips.com>
---

 drivers/usb/host/dwc3-sti-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/dwc3-sti-glue.c b/drivers/usb/host/dwc3-sti-glue.c
index a72ab20168..3e6c1429d6 100644
--- a/drivers/usb/host/dwc3-sti-glue.c
+++ b/drivers/usb/host/dwc3-sti-glue.c
@@ -159,7 +159,7 @@ static int sti_dwc3_glue_bind(struct udevice *dev)
 			dwc3_node = node;
 	}
 
-	if (!ofnode_valid(node)) {
+	if (!ofnode_valid(dwc3_node)) {
 		pr_err("Can't find dwc3 subnode for %s\n", dev->name);
 		return -ENODEV;
 	}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
