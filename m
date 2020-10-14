Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F258A28DC93
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:17:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7BE2C424B3;
	Wed, 14 Oct 2020 09:17:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B737C424B9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:17:05 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9DIWE020404; Wed, 14 Oct 2020 11:17:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=vf7L88lC7TPThwXr0LhF3vzi8QrkPbU3rEZOORstfBo=;
 b=H+fBX3mgDNJRUFHW31mmc6ZVri1jjwfT3mhZmfCJbx0ioKJDtv+rv6kx/fjkCo7F5J37
 7RXkrV5i+WFFjGXUuQUO9TewOuyCafzkFd+/xCsm+ftLP76heIioEwY9c/ALxsnxtSMC
 +5JJSQ1f7iNogWjBiTMiGSc0PFW/lYIT1HwgcyR4RJesW5OMO1Mm1o8i/O567ynNH3QH
 1hDNAF4BQpRAyd93e/sUwdwEpiqtd/b8FtFhH4yWwCdwGawz/gBPoTW2+7C+hVQsJkls
 1kHEvyWTmneyo4WKIqDCyx2RkicQRYnCG2xO/h/c6vlqOHRq3Pq6QWsOgffRTKPyuarb 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3435874huq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:17:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 06C8410002A;
 Wed, 14 Oct 2020 11:17:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F26A72ABA3E;
 Wed, 14 Oct 2020 11:17:03 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:17:03
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:29 +0200
Message-ID: <20201014091646.4233-17-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 16/33] misc: rcc: keep the rcc device name for
	subnode
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

Update the name associated with the RCC drivers to avoid
duplicated name with the driver name.

With this patch the traces displayed with log macro provide a
correct device name.

The rcc device name before the patch is:

 Class     Index  Probed  Driver                Name
-----------------------------------------------------------
 root          0  [ + ]   root_driver           root_driver
 simple_bus    0  [ + ]   simple_bus            |-- soc
 (...)
 nop           0  [ + ]   stm32-rcc             |   |-- rcc@50000000
 clk           0  [ + ]   stm32mp1_clk          |   |   |-- stm32mp1_clk
 reset         0  [ + ]   stm32_rcc_reset       |   |   `-- stm32_rcc_reset

And they become:
 (...)
 nop           0  [ + ]   stm32-rcc             |   |-- rcc@50000000
 clk           0  [ + ]   stm32mp1_clk          |   |   |-- rcc@50000000
 reset         0  [ + ]   stm32_rcc_reset       |   |   `-- rcc@50000000

The traces is correct:
stm32mp1_clk rcc@stm32mp1_clk: .....
=>
stm32mp1_clk rcc@50000000: .....

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

---

 drivers/misc/stm32_rcc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/stm32_rcc.c b/drivers/misc/stm32_rcc.c
index c1a99d78e2..e46685f0e1 100644
--- a/drivers/misc/stm32_rcc.c
+++ b/drivers/misc/stm32_rcc.c
@@ -54,7 +54,7 @@ static int stm32_rcc_bind(struct udevice *dev)
 		return -ENOENT;
 	}
 
-	ret = device_bind_with_driver_data(dev, drv, rcc_clk->drv_name,
+	ret = device_bind_with_driver_data(dev, drv, dev->name,
 					   rcc_clk->soc,
 					   dev_ofnode(dev), &child);
 
@@ -67,7 +67,7 @@ static int stm32_rcc_bind(struct udevice *dev)
 		return -ENOENT;
 	}
 
-	return device_bind_with_driver_data(dev, drv, "stm32_rcc_reset",
+	return device_bind_with_driver_data(dev, drv, dev->name,
 					    rcc_clk->soc,
 					    dev_ofnode(dev), &child);
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
