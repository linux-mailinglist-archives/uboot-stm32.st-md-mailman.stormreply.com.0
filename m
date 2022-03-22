Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B114E402F
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Mar 2022 15:07:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AFF6C5F1D6;
	Tue, 22 Mar 2022 14:07:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8358EC01577
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Mar 2022 14:07:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22MAXoeE004216;
 Tue, 22 Mar 2022 15:07:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=ARtSMvs0g5OLkCqcJM7OJKARybOKaPRpHVWAFifIOMs=;
 b=K/v7I7EJSOb1jPTU5KIkq40xervrQLEHp8sO0QYVEG4r24Olf04s5k3q9X09J994MT50
 LuvycAy0XLN6X1H9IvmYxpxo689kU1YdaHfUe7PoTFYap91KB4Xvw5wylPHu/vhwMHM3
 iEHKaFijGu6EE8SSFvKc8nK3GT29d/9TmRlx4WwF28Wi6YEDl8tgziqiQGP10f77WFVW
 GXU4f4gGQzc/MlvCmJeWukEEuJ5368RlCeyUJPZ6lOWIpbrAMimSCaWRE6IXbTx6RivO
 YV/mISf5ZQR3uuU34RBoVEFPG9YaYN/FYuesE6HYUc2dptjHYcJYNh8fZBRwUSAWYuEV vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ewr5fr16s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 15:07:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3CAC610002A;
 Tue, 22 Mar 2022 15:07:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3509422A6C3;
 Tue, 22 Mar 2022 15:07:04 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 22 Mar 2022 15:07:03
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 22 Mar 2022 15:06:52 +0100
Message-ID: <20220322150558.2.I610cd6d6ab087268c699b320865cffe3bc899ff9@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322150558.1.I2d5fc62b65a61d4e11ce442f3b5572ec03f39cf6@changeid>
References: <20220322150558.1.I2d5fc62b65a61d4e11ce442f3b5572ec03f39cf6@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_06,2022-03-22_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [Uboot-stm32] [PATCH 2/3] tee: optee: bind rng optee driver
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

In U-Boot, the discovery of TA based on its UUID on the TEE bus is
not supported.

This patch only binds the driver associated to the new supported
OP-TEE TA = TA_HWRNG when this driver is enable.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/tee/optee/core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index dad46aa388..a89d62aaf0 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -7,6 +7,7 @@
 #include <cpu_func.h>
 #include <dm.h>
 #include <dm/device_compat.h>
+#include <dm/lists.h>
 #include <log.h>
 #include <malloc.h>
 #include <tee.h>
@@ -641,6 +642,8 @@ static int optee_probe(struct udevice *dev)
 {
 	struct optee_pdata *pdata = dev_get_plat(dev);
 	u32 sec_caps;
+	struct udevice *child;
+	int ret;
 
 	if (!is_optee_api(pdata->invoke_fn)) {
 		dev_err(dev, "OP-TEE api uid mismatch\n");
@@ -665,6 +668,16 @@ static int optee_probe(struct udevice *dev)
 		return -ENOENT;
 	}
 
+	/*
+	 * in U-Boot, the discovery of TA on the TEE bus is not supported:
+	 * only bind the drivers associated to the supported OP-TEE TA
+	 */
+	if (IS_ENABLED(CONFIG_RNG_OPTEE)) {
+		ret = device_bind_driver(dev, "optee-rng", "optee-rng", &child);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
