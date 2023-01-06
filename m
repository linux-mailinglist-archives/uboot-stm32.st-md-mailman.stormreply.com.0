Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ACC660025
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Jan 2023 13:20:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D706FC6905D;
	Fri,  6 Jan 2023 12:20:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A93E8C640EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jan 2023 12:20:30 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30680Igx013565; Fri, 6 Jan 2023 13:20:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=OU0MLvlD6hskWPXFVOtPMThUuC6uAIV7AH7Bf+WXVRE=;
 b=qZ3PEML7hI6H7H3SIBJk1baj45hSUuyI/C+wlFKuATC4vxNuL8Yhmcp9PNneEPH+Fwza
 5O6Mak+hH762qMczqd9GkBtLhFEE09atX3Z2GHNiyFD6Tsj2/3NK42gBmAAq9aS4ZPfS
 j4Mgu0plgFbU104JPpI3GOffys6SIwni5WrmnK9j0VN7ewIh/GAM/yM5ingi9nwPvG+P
 Gp//tKYGenSbcLAr2ZtZyoD9LBElUPpYL3mqjNDgx3GSnvdDO89spOAexbAZI7Pxm3Z1
 m7LgbysTVychWhkKSwjCy3+r8Lwdt0mwJld6cfRFT4+FAL5oTj7WlRcVH6D2dIJO7vJt gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtbcqfkc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 13:20:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A2A210002A;
 Fri,  6 Jan 2023 13:20:28 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 327152105A1;
 Fri,  6 Jan 2023 13:20:28 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 6 Jan
 2023 13:20:27 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Jan 2023 13:20:14 +0100
Message-ID: <20230106131952.1.Id87d79fb5d89d09c18a30daf4e27b1c78f2ea268@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
References: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_06,2023-01-06_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne CARRIERE <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH 1/6] stm32mp: cosmetic: Update of bsec driver
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

Remove unnecessary return in stm32mp_bsec_write_lock and replace tab
by space for plat_auto opts.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/bsec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index c00130b08b36..51ccff9aa560 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -468,8 +468,6 @@ static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
 	plat = dev_get_plat(dev);
 
 	return bsec_permanent_lock_otp(dev, plat->base, otp);
-
-	return -EINVAL;
 }
 
 static int stm32mp_bsec_read(struct udevice *dev, int offset,
@@ -608,7 +606,7 @@ U_BOOT_DRIVER(stm32mp_bsec) = {
 	.id = UCLASS_MISC,
 	.of_match = stm32mp_bsec_ids,
 	.of_to_plat = stm32mp_bsec_of_to_plat,
-	.plat_auto	= sizeof(struct stm32mp_bsec_plat),
+	.plat_auto = sizeof(struct stm32mp_bsec_plat),
 	.ops = &stm32mp_bsec_ops,
 	.probe = stm32mp_bsec_probe,
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
