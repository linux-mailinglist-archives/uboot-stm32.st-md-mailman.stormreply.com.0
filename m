Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 972C058799E
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Aug 2022 11:09:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B8D0C640F8;
	Tue,  2 Aug 2022 09:09:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0B6DC0D2C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Aug 2022 09:09:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2728AvGB005975;
 Tue, 2 Aug 2022 11:09:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=wJERq5Zn6QOWlT2en4mgKUntoVtkqaMaGyGADk0sh+Y=;
 b=ubYsV9FYg11ujjGBNBmFfu8aVflG9w3Ne2ZWpjMx3IyVwVuWy2dyuVf+jkdL5jdJC56r
 aGGnetidXwDuJNkLcoFVgoXLlLDfxHIfVIlshIXl0AnGEZxe2HQX//eOv1fYowm/z0aG
 czwNjpz5RGFObDsx/pevy0WN6Jw1IFx0Svb0klL+lQlw4OTDmBlqWQrZRcZvl04AK2Ds
 u6+23Nl7SjgPWCI+xMF1KppZ0ncw6HPD8FbM///haNirj8EF8lJdeDyBB3JcB8jh3cM9
 jnDUNnQtEaUT68HCqZ2oblMqipMoTyVJqDp3+WafZ6UkMkaoCinQStBQdAjTTj/+8EhM Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hq06kge3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 11:09:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94C5A100034;
 Tue,  2 Aug 2022 11:09:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8EEEF21FEB3;
 Tue,  2 Aug 2022 11:09:13 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 2 Aug
 2022 11:09:13 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 2 Aug 2022 11:09:09 +0200
Message-ID: <20220802090910.277343-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802090910.277343-1-patrice.chotard@foss.st.com>
References: <20220802090910.277343-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_05,2022-08-01_01,2022-06-22_01
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Eddie James <eajames@linux.ibm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/3] gpio: Fix pin's status display for pin
	with GPIOF_UNUSED function
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

Even pin with GPIOF_UNUSED function can have a label.
The criteria to add or not a space character is linked to label not to
the used/unused status.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/gpio/gpio-uclass.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index d60e46159a..a00880e446 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -916,7 +916,7 @@ int gpio_get_status(struct udevice *dev, int offset, char *buf, int buffsize)
 		snprintf(str + len, buffsize - len, ": %d [%c]%s%s",
 			 ret,
 			 used ? 'x' : ' ',
-			 used ? " " : "",
+			 label ? " " : "",
 			 label ? label : "");
 		break;
 	}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
