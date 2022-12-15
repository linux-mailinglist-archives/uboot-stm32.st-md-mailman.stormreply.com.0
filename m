Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A764D815
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Dec 2022 09:55:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA2EFC65E46;
	Thu, 15 Dec 2022 08:55:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D75DFC64107
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Dec 2022 08:55:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BF62X0V021276; Thu, 15 Dec 2022 09:55:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=wFknKSWjLkofcPFEJjs1Y0LJF4H2YXvaa19vmHa/i/U=;
 b=Lo26vSGDsfFTV4cIqw19ioycZyRi58Qrix3hEDO75tZEeCwCVhY8huaDiF9PhvqkbRhv
 tEJzo6W1C0yU5gLlgvoKrw09Yy13MH20Tb3nQtaNmHNMnHCFv/5F7uHxWB5WgGOEXxzs
 t+ELMnpiV6m+m9Tb/vcnRVR6bjaLKfo8lZ/PhvGQEdpWJXocyIG96Q3A5wO6v/9YnlRE
 0E9vCAme4LEfdVwKvf3cNQxqAp6cYCBVTBmByGI7XTe/o4K28z4xGZ0rqAJuuLhPMf8b
 DSdJKC+kIyLQLJaAPnWwN9wTYWyNbnzEvx1llAWoH0WFpJmiFgv46yjGiPcmNYQZkEFN OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mf6uwsmtn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 09:55:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D4978100034;
 Thu, 15 Dec 2022 09:54:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDCE7215123;
 Thu, 15 Dec 2022 09:54:58 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 15 Dec
 2022 09:54:56 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 15 Dec 2022 09:54:52 +0100
Message-ID: <20221215095446.1.Ia16a826f3adcee45569a6d47e8ba5b5e3c1d7373@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_03,2022-12-14_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne CARRIERE <etienne.carriere@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [Uboot-stm32] [PATCH] optee: bind the TA drivers on OP-TEE node
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

In U-Boot driver model the devices can be referenced by
phandle in the U-Boot configuration nodes.

Without a valid node provided during the bind, the driver
associated to OP-TEE TA can't be referenced.

For example to force the sequence number with alias
(.flags = DM_UC_FLAG_SEQ_ALIAS)

 	aliases {
		rng0 = &optee;
 	};

or other configuration:

board-sysinfo {
   compatible = "vendor,sysinfo-board";
   ramdom = <&optee>;
}

With this patch all drivers bound from OP-TEE service
discovery are now associated are associated to OP-TEE
node, allowing to identify by phandle the driver
provided by the TA for one UCLASS without modifying
device tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/tee/optee/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index 9240277579be..96f08074443f 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -92,7 +92,8 @@ static int bind_service_list(struct udevice *dev, struct tee_shm *service_list,
 		if (!service)
 			continue;
 
-		ret = device_bind_driver(dev, service->driver_name, service->driver_name, NULL);
+		ret = device_bind_driver_to_node(dev, service->driver_name, service->driver_name,
+						 dev_ofnode(dev), NULL);
 		if (ret) {
 			dev_warn(dev, "%s was not bound: %d, ignored\n", service->driver_name, ret);
 			continue;
@@ -832,7 +833,8 @@ static int optee_probe(struct udevice *dev)
 		 * Discovery of TAs on the TEE bus is not supported in U-Boot:
 		 * only bind the drivers associated to the supported OP-TEE TA
 		 */
-		ret = device_bind_driver(dev, "optee-rng", "optee-rng", NULL);
+		ret = device_bind_driver_to_node(dev, "optee-rng", "optee-rng",
+						 dev_ofnode(dev), NULL);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
