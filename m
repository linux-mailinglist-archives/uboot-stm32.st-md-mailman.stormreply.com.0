Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AC658D44F
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Aug 2022 09:14:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45CE6C5C829;
	Tue,  9 Aug 2022 07:14:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F24ADC04001
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Aug 2022 07:14:33 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2791UANN011605;
 Tue, 9 Aug 2022 09:14:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=0I38qWsbSuLPX0QK2scQI3WdJV0OdVPJ/ifgWD0SDPQ=;
 b=bTCaTsn8Mjt6t/aP1QHSEaaLPlZgwzhmlSftlo08k6l730lXKLRaMwJBDQUF3lwypj70
 5i9s3GFvKB6BW0RPX2vjucPjo9s36BGZYaL6o8nFpCgKgVuI0NpN+xNiaxCn/eIgsoPT
 c3GpExkDME6JEIp7IaEevd//GMLLWV0/3Y0dN+abBzmGUBCT3Z6hJhxr0dydVzlIlEuT
 zSJShXXFAfsxZB1pJ/s3ViZLRzLUFrR2UR+YMx+qbT7t2OGeJcg4LtSaIHMBIGfHjAmx
 WQ8AnQF7Aj0sEdPDykUV8OdmXstLP2l6blblGqeGMa+l0CER/RaWmGhdKgrU7uTUjq8T Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hudynsb5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 09:14:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3186F10003A;
 Tue,  9 Aug 2022 09:14:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29DC421515B;
 Tue,  9 Aug 2022 09:14:23 +0200 (CEST)
Received: from localhost (10.75.127.45) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 9 Aug
 2022 09:14:22 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Aug 2022 09:14:13 +0200
Message-ID: <20220809071415.366133-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220809071415.366133-1-patrice.chotard@foss.st.com>
References: <20220809071415.366133-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_03,2022-08-09_01,2022-06-22_01
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Eddie James <eajames@linux.ibm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 2/4] gpio: Fix pin's status display for pin
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

(no changes since v1)

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
