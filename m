Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 202426E391
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 11:39:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFF05C623F5
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 09:39:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1254BC61F9C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 09:39:50 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6J9aSi2003774; Fri, 19 Jul 2019 11:39:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=3nkrDhmCaABbNy7ztw/pVB46BByIccWv1tqk3a7Lfmo=;
 b=zks3v/ASjmbktP297tja2DYyHsWF0zqZz48gAr1ng0676/0TyIgDYqqlUS2hSXi/JElM
 wDwh1kmr14AQ9iw33ql1GSXAznCJFjNGkUAlzVBnDzI060KdwzuivB3pTdlnMPCgYqTv
 PKCrJhg6giW3Vg7XMEoQGxMcGOQBy5R+Za403cuosCgYtzICpBoY9GFkvlG45Sfhm1aj
 wuY6HZaWZgss0wLH2ktt8I6h2joL9r54jRhNPPaFZu7smsv9FEBN/hsE+9yCLwLx+iD4
 jzxWF4wIMiAMfggEmDDK0w/sexM3z+PIZGExXXSfSKt37C97YNLh2f5dLUpINHh0L5jX DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tsdepu6v6-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 11:39:45 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D754B5D;
 Fri, 19 Jul 2019 09:39:44 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE07A27E8;
 Fri, 19 Jul 2019 09:39:44 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 11:39:44 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 11:39:44
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 11:39:29 +0200
Message-ID: <1563529171-16796-4-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563529171-16796-1-git-send-email-patrick.delaunay@st.com>
References: <1563529171-16796-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/5] stpmic1: simplify stpmic1_sysreset_request
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

Retrieve parent device from dev->parent instead of
calling uclass_get_device_by_driver()

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/power/pmic/stpmic1.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/power/pmic/stpmic1.c b/drivers/power/pmic/stpmic1.c
index 9f20c31..b644176 100644
--- a/drivers/power/pmic/stpmic1.c
+++ b/drivers/power/pmic/stpmic1.c
@@ -232,19 +232,12 @@ U_BOOT_DRIVER(stpmic1_nvm) = {
 #ifdef CONFIG_SYSRESET
 static int stpmic1_sysreset_request(struct udevice *dev, enum sysreset_t type)
 {
-	struct udevice *pmic_dev;
+	struct udevice *pmic_dev = dev->parent;
 	int ret;
 
 	if (type != SYSRESET_POWER)
 		return -EPROTONOSUPPORT;
 
-	ret = uclass_get_device_by_driver(UCLASS_PMIC,
-					  DM_GET_DRIVER(pmic_stpmic1),
-					  &pmic_dev);
-
-	if (ret)
-		return -EOPNOTSUPP;
-
 	ret = pmic_reg_read(pmic_dev, STPMIC1_MAIN_CR);
 	if (ret < 0)
 		return ret;
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
