Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 099064F57D4
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Apr 2022 10:38:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2EDDC60492;
	Wed,  6 Apr 2022 08:38:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 550A0C60467
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Apr 2022 08:38:04 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2364PJWk021551;
 Wed, 6 Apr 2022 10:37:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=4GiV+kEiBHntEKmx3ybxjqXWLfxGH1Ex3jKJ+3t16Fs=;
 b=5i9UmC5zgWDqP9iAEv81lMfosbp8Cr2LPY9HBl/tCHXppzzfssduC3ld8tjXUoW0gNPp
 B14FF4r5waUzF5eGsMOPJomyRuMOb1IHhAOMv9Kd7mk9oEYaOmdSgE45L98gVCAd8g56
 yC/Pcl/2+CVJ7AozKIo2j4eLH8UKawlq0SqgJ4tzrMdqaM1cBvdp2N/mPNwqsixzRsZX
 UOycJbQvy1hkwoGAj1OnkdTMEwQwOZS29l/Fw8zOjCGPSwiMtMM/uT2E0M3q2OgYe7Kq
 rzSHr9qHdqSqpA96CJ/Ejxv1qr6zEK32AwJoRVEPgS2+UQ6zdk8XjtS/KAp2MxqNEw6m Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f6bwk4mb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 10:37:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 96EA410002A;
 Wed,  6 Apr 2022 10:37:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76607209748;
 Wed,  6 Apr 2022 10:37:56 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 6 Apr 2022 10:37:56
 +0200
From: Yannick FERTRE <yannick.fertre@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 6 Apr 2022 10:37:42 +0200
Message-ID: <20220406083742.291491-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_02,2022-04-05_01,2022-02-23_01
Cc: Yannick FERTRE <yannick.fertre@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH] video: stm32: stm32_ltdc: fix data enable
	polarity
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

Wrong DISPLAY_FLAGS used to set the data enable polarity.

Signed-off-by: Yannick FERTRE <yannick.fertre@foss.st.com>
---

 drivers/video/stm32/stm32_ltdc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
index e741e74739..9269d4bfb4 100644
--- a/drivers/video/stm32/stm32_ltdc.c
+++ b/drivers/video/stm32/stm32_ltdc.c
@@ -255,7 +255,7 @@ static void stm32_ltdc_set_mode(struct stm32_ltdc_priv *priv,
 		val |= GCR_HSPOL;
 	if (timings->flags & DISPLAY_FLAGS_VSYNC_HIGH)
 		val |= GCR_VSPOL;
-	if (timings->flags & DISPLAY_FLAGS_DE_HIGH)
+	if (timings->flags & DISPLAY_FLAGS_DE_LOW)
 		val |= GCR_DEPOL;
 	if (timings->flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
 		val |= GCR_PCPOL;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
