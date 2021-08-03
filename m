Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ECB3DEA5D
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Aug 2021 12:05:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5ED2FC5A4D7;
	Tue,  3 Aug 2021 10:05:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9702DC5A4CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 10:05:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173A3R97001225; Tue, 3 Aug 2021 12:05:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=EmxgR1fdfNMtWCaqSMTwZAw/NeQtlLbNoV5a/q4TxLU=;
 b=MNxy65UGq2uHNMejzTwh4VUZQ5B8aZxrII/6PkK5G0POVpsE8M4YFi/bxyC4oCW6oALd
 c1Z+oJm6I7KmRhzPyWz6OWy8yGuqkaxhIM5rVXcFd7CmqQiF173pwWckO754eTZhgkso
 wA6L1s6/dg+512ja01Klnqy4Lb9IKQnCeVWNs8FhIKD785Tgw7CaTnZgV0FJgbfwXloy
 bcgHsodK1nbPoB2oESIaimiNseMe/y+bll/au8Q6gPQPX5W1e9YjdZ7zWvr7adm58bQw
 cu7vhwh6uJZR1ncvaY0xoTG0Ojk0oPjJHsb7lWyFkh0vrcnHfqWUhlYZBHifX3LeiRUZ Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a6fc8nere-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 12:05:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB6DC100034;
 Tue,  3 Aug 2021 12:05:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF69C21BF5A;
 Tue,  3 Aug 2021 12:05:33 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021 12:05:33
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Aug 2021 12:05:11 +0200
Message-ID: <20210803100515.29383-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210803100515.29383-1-patrice.chotard@foss.st.com>
References: <20210803100515.29383-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_02:2021-08-03,
 2021-08-03 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 dillon min <dillon.minfei@gmail.com>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 3/7] arm: dts: stm32: Add i2c-analog-filter
	property in I2C nodes for stm32h743
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

Add i2c-analog-filter property in I2C nodes to enable analog
filter feature.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32h743.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
index ed6857512f..dbfebf07f2 100644
--- a/arch/arm/dts/stm32h743.dtsi
+++ b/arch/arm/dts/stm32h743.dtsi
@@ -124,6 +124,7 @@
 				     <32>;
 			resets = <&rcc STM32H7_APB1L_RESET(I2C1)>;
 			clocks = <&rcc I2C1_CK>;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -136,6 +137,7 @@
 				     <34>;
 			resets = <&rcc STM32H7_APB1L_RESET(I2C2)>;
 			clocks = <&rcc I2C2_CK>;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -148,6 +150,7 @@
 				     <73>;
 			resets = <&rcc STM32H7_APB1L_RESET(I2C3)>;
 			clocks = <&rcc I2C3_CK>;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -395,6 +398,7 @@
 				     <96>;
 			resets = <&rcc STM32H7_APB4_RESET(I2C4)>;
 			clocks = <&rcc I2C4_CK>;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
