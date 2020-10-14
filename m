Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A32128DC87
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:16:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 110A3C424AF;
	Wed, 14 Oct 2020 09:16:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09997C424B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:16:55 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9DB50008297; Wed, 14 Oct 2020 11:16:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=fJdiBx0bE5pGADZ2cFe48UR/AoK9yPMByuzq2v3Gk1g=;
 b=pJfXV5SFL+/oEqz3ziGrFij+wZxdk/KGyxly92Hpno2NOWT6Gqf5r8c6JhJSwlbMFNks
 86H4jClyCEnse8cjWji5lFBFSpTeQox/7XX6i7L559RsjwxSL4IXkTIel/d84G3EL6Mi
 l4At39co9H1of+Jhcxx0IyiYN0IB/jvzPhRKTxx+xBgQhtgI95t3U7RtY5KVrxfwQ8Z3
 02CA2X2P5QtepS7LpGP6rf+5/+en0jl1EdnQidjgmCcAvUR3VnXOr230AaUWE8FtWwJ/
 dFLEp4lWqtNuAo6tFYLCFUYYqWSzSYoHHYhBlI/MD5OYMVGSg764F3Fv4hVNzbngV5UB mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34356ecfft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:16:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C63BA10002A;
 Wed, 14 Oct 2020 11:16:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE3E92ABA3E;
 Wed, 14 Oct 2020 11:16:53 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:16:53
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:18 +0200
Message-ID: <20201014091646.4233-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 05/33] gpio: stm32-gpio: migrate trace to dev
	and log macro
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

Change debug to dev_dbg macro and define LOG_CATEGORY.

Remove dev->name as it is already displayed by dev macro.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/gpio/stm32_gpio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
index 473e364796..3b17b632db 100644
--- a/drivers/gpio/stm32_gpio.c
+++ b/drivers/gpio/stm32_gpio.c
@@ -4,6 +4,8 @@
  * Author(s): Vikas Manocha, <vikas.manocha@st.com> for STMicroelectronics.
  */
 
+#define LOG_CATEGORY UCLASS_GPIO
+
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
@@ -329,7 +331,7 @@ static int gpio_stm32_probe(struct udevice *dev)
 		dev_err(dev, "failed to enable clock\n");
 		return ret;
 	}
-	debug("clock enabled for device %s\n", dev->name);
+	dev_dbg(dev, "clock enabled\n");
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
