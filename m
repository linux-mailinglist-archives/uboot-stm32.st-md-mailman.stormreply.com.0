Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0E209AE2
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 10:00:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9550C36B0B
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 08:00:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 311ABC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 08:00:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P7vh87016203; Thu, 25 Jun 2020 10:00:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=1oV31yRSCHToj1TA/0fKrOCqRUrO2knEPEd18qsHaPI=;
 b=Ug+fSavuUpO8ZiNpVylDgAjHqeO42E5v+1WuYLU2gi9HM1YdM5/NE1187a+aPDNPamIX
 dctmh1Lzt8+4wEYM09xbbFvvemGnqdsmSTbEITncP4KHcF4du9EX7+QIwDbUzVY8OTKe
 bLeWUvCbU30yPCiamgwT7wkCuwMppTWCmMSC2IAbyHyrwbL+w6FGuO+l7sxhqnXY1H9+
 LYcFVg7OC4JMXg5PBEI4CuFuj5Gve6vFpvNeXZFgbt0fOd2Jqc92T5hMC0h8lmzKuXi0
 bQGPTXDpC+AtdQHCNIxLCO2u+lZOtcr8QcxsF+LaJqr7UX1fESXIRDs8054qaEzsWkbF Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuumgmx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 10:00:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B033410003D;
 Thu, 25 Jun 2020 10:00:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4F0D2A991B;
 Thu, 25 Jun 2020 10:00:25 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 25 Jun 2020 10:00:25 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Jun 2020 09:59:49 +0200
Message-ID: <20200625075958.9868-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625075958.9868-1-patrick.delaunay@st.com>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_03:2020-06-25,
 2020-06-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 05/14] env: nowhere: add .load ops
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

Add the ops .load for nowhere ENV backend to load the
default environment.

This ops is needed for the command 'env load'



Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3:
- new: add ?load ops in nowhere

 env/nowhere.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/env/nowhere.c b/env/nowhere.c
index f5b0a17652..6949810a1f 100644
--- a/env/nowhere.c
+++ b/env/nowhere.c
@@ -27,8 +27,17 @@ static int env_nowhere_init(void)
 	return 0;
 }
 
+static int env_nowhere_load(void)
+{
+	env_set_default(NULL, 0);
+	gd->env_valid	= ENV_INVALID;
+
+	return 0;
+}
+
 U_BOOT_ENV_LOCATION(nowhere) = {
 	.location	= ENVL_NOWHERE,
 	.init		= env_nowhere_init,
+	.load		= env_nowhere_load,
 	ENV_NAME("nowhere")
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
