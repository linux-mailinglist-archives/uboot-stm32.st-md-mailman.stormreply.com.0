Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3732A9B6D
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3244C3FAD5;
	Fri,  6 Nov 2020 18:02:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E479C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:33 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HwKGr022850; Fri, 6 Nov 2020 19:02:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=BgVwD2b8swn8GP8p9CZA2ADi1XEdDFqp5qWomFmU6ZQ=;
 b=EBez7jvTxv/54+ZpcA7gnZAYTHf1K1o4tWRr5WJLMwq6ycTKuZxvpHiscF9g3HkNFdoB
 AU07nKjm2cAIupV+rkbvPZimmxo80O1hqMj5iwQgU0CjIbeR/LHqXZyAQFt/FLKlHz0o
 GhwXJf17rkshFgYNX58O9qg15XwD6DvS4mfXj88bneEfJzQwCtVAlUgM72TZoZa+mpZu
 Zk3M3Tx+9fhZYyXzIz3HYnIfpvPgstaKDt+rXwdiyESMs+FG273oL6u+RmH6zbBK4fc/
 uE+7qmu9msnUL8pyCh9QM2kbCenQhrh6+VGPPvmpTGGjzHuLwvgd+sA25c+I4XrPVy/c /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h00ewu8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E4BD10002A;
 Fri,  6 Nov 2020 19:02:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47AD024C7A5;
 Fri,  6 Nov 2020 19:02:32 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:31
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:44 +0100
Message-ID: <20201106180201.31784-17-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 16/33] misc: rcc: keep the rcc device name
	for subnode
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
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

---

(no changes since v1)

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
