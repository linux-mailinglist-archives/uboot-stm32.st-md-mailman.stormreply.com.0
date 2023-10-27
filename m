Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B927D9BE5
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Oct 2023 16:44:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6999AC6C85B;
	Fri, 27 Oct 2023 14:44:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8475DC6C85A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 14:44:15 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39RCMk4b017745; Fri, 27 Oct 2023 16:44:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=7cYgnHMNhr+Lyh2nB707/Y8/ss/EI7kLxr6PTiXrzcs=; b=7U
 p0ACuOVRHqzrqky+A2vD6nffp9G0tLj/we8g1OV5ZvhaIhxotV8bRl4UcmPx55zc
 zN82bb/BjOMGgHJ8+voo1ntxI2QgbZx6yMBhsrGmSAKmG9V2rY7t+JSABpgxnfNe
 vjETCabJsXlTdsGf+SgnLO1Tn35E/nU1bM7r37iCYMRK76lCS6g3j13A482jUS72
 QaWSnpw6a+Gf35jOWiGNHeSlRc/6g4GhKY6SwcjyFCI1hfD/awFnBeXsTcfK/FCC
 b79DLANieP/buwZ46ty5m1DaGY/9BHeSt2j6aP6pVQNJnlHtOSu1y2o7VYZmJVhs
 UZsuC1QpEaL2VJhZsTcw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tywqqc9vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 16:44:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 71858100062;
 Fri, 27 Oct 2023 16:44:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A7CE26DDCD;
 Fri, 27 Oct 2023 16:44:14 +0200 (CEST)
Received: from localhost (10.201.20.38) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 27 Oct
 2023 16:44:14 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Oct 2023 16:43:02 +0200
Message-ID: <20231027144304.1002307-8-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_13,2023-10-27_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v1 7/9] pinctrl: pinctrl_stm32: Add stm32mp2
	support
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

Add stm32mp2 compatible.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/pinctrl/pinctrl_stm32.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index 8bb7588714a..7120b8edba0 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -505,6 +505,8 @@ static const struct udevice_id stm32_pinctrl_ids[] = {
 	{ .compatible = "st,stm32mp157-pinctrl" },
 	{ .compatible = "st,stm32mp157-z-pinctrl" },
 	{ .compatible = "st,stm32mp135-pinctrl" },
+	{ .compatible = "st,stm32mp257-pinctrl" },
+	{ .compatible = "st,stm32mp257-z-pinctrl" },
 	{ }
 };
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
