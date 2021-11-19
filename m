Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 034D8456C07
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Nov 2021 10:02:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B18CEC5E2CC;
	Fri, 19 Nov 2021 09:02:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EEB8C5C82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 09:02:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJ0etoB001983;
 Fri, 19 Nov 2021 10:02:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=4+uVWf3gEbKjrpZeIj5cMQD978FeSSssd5HscSsfxvU=;
 b=XeTeY23tt3e5lj6kCwYsxsA0gAVoYoJww0uIcEhyyllD30vUFU3DA9raGeTr+4U6tMUQ
 xvmWRL18XqDY4zH9aLrZE9xVR8F5PylVHBObadGa+PxMl2mv/gCH72bhwguumYrBiBMi
 OTv3pW8VznfqBEHfxOt8rSh2+Rvy9jSIFuJiPY4pt1IfRXm8EIpFS/BiOc1I/9o8hDQa
 8DPmGTpDA7kq9SXyMBUrH8vn8Vv87rbOlfjWREdfhXfzy3iZkA/D0o9AWd5uF3vKdXZV
 Kc6O+SZq7QCwXeiKfufqh4Io70FAksP8DAq2D2E12c6Rok9vVwttCTWsDTs2hBVY5shO kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ce1kna9t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 10:02:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBFDA10002A;
 Fri, 19 Nov 2021 10:02:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4BA321BDD4;
 Fri, 19 Nov 2021 10:02:32 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 19 Nov 2021 10:02:32
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Nov 2021 10:02:26 +0100
Message-ID: <20211119090227.126391-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_08,2021-11-17_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [RESEND PATCH 1/2] pinctrl: change result for
	unsupported API
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

Use the return value ENOSYS for unsupported API
- pinctrl_generic_set_state
- pinctrl_select_state

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

 include/dm/pinctrl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dm/pinctrl.h b/include/dm/pinctrl.h
index 695e78ad0d..8b869c4fbf 100644
--- a/include/dm/pinctrl.h
+++ b/include/dm/pinctrl.h
@@ -495,7 +495,7 @@ int pinctrl_generic_set_state(struct udevice *pctldev, struct udevice *config);
 static inline int pinctrl_generic_set_state(struct udevice *pctldev,
 					    struct udevice *config)
 {
-	return -EINVAL;
+	return -ENOSYS;
 }
 #endif
 
@@ -512,7 +512,7 @@ int pinctrl_select_state(struct udevice *dev, const char *statename);
 static inline int pinctrl_select_state(struct udevice *dev,
 				       const char *statename)
 {
-	return -EINVAL;
+	return -ENOSYS;
 }
 #endif
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
