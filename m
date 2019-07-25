Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1C9747EA
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jul 2019 09:13:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75DD1C1E9DD
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jul 2019 07:13:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 849C8C1E9D8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 07:13:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6P768o1009020; Thu, 25 Jul 2019 09:13:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=luxTaIp7mfWS/DFt0s5+sFlmPnrNvZKz/d/YF91wtCs=;
 b=0segR5fYQBIlXuT7pOalYdOnr7qetYkG7elPxUWMpGoNGEI6aN3aLVgV1QkQ6tjR2fvP
 BUHEH0bN10SjgpsQC7xQITTZGTRUBe+rQR1O3uvWMQyxVBAqpMhsg7jxSEJcSYBTKNMT
 CjlaE+rLFdEsd2udnpQPfNkeguuy3Rn9sdXlUn1/Rw3omSAWFD5nfd3KJuUIYrbo2tYh
 XsGpFuIe8q8ZOBb637mtIo8sh1eqQTbdDblUqzfSLwRFFuY+jcqH8J+nLpqGvzFRS3RM
 wwowOZzdNivWa3n/9rR+A2WvxhWepwPJ0mYYWmh2CPzS7778dwrq4KeSpFdLP67ArGDH uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tx604a29s-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 25 Jul 2019 09:13:02 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 729B841;
 Thu, 25 Jul 2019 07:12:51 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 504DC16A6;
 Thu, 25 Jul 2019 07:12:51 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 25 Jul
 2019 09:12:51 +0200
Received: from localhost (10.201.23.73) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 25 Jul 2019 09:12:50
 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Jul 2019 09:12:39 +0200
Message-ID: <20190725071239.31398-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.23.73]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-25_03:, , signatures=0
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Lukasz
 Majewski <lukma@denx.de>, Jaehoon Chung <jh80.chung@samsung.com>,
 Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] regulator: fixed: Modify enable-active-high
	behavior
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

Regulator should not be enabled at probe time if regulator-boot-on
property is not in the dt node.

"enable-active-high" property is only used to indicate the GPIO
polarity.

See kernel documentation :
 - Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
 - Documentation/devicetree/bindings/regulator/gpio-regulator.yaml

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 drivers/power/regulator/regulator_common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/power/regulator/regulator_common.c b/drivers/power/regulator/regulator_common.c
index 3dabbe2a85..2e8a083c75 100644
--- a/drivers/power/regulator/regulator_common.c
+++ b/drivers/power/regulator/regulator_common.c
@@ -15,7 +15,9 @@ int regulator_common_ofdata_to_platdata(struct udevice *dev,
 	int flags = GPIOD_IS_OUT;
 	int ret;
 
-	if (dev_read_bool(dev, "enable-active-high"))
+	if (!dev_read_bool(dev, "enable-active-high"))
+		flags |= GPIOD_ACTIVE_LOW;
+	if (uc_pdata->boot_on)
 		flags |= GPIOD_IS_OUT_ACTIVE;
 
 	/* Get optional enable GPIO desc */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
