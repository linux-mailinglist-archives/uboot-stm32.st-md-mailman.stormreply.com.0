Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB093DB6FC
	for <lists+uboot-stm32@lfdr.de>; Fri, 30 Jul 2021 12:12:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D7D6C597AF;
	Fri, 30 Jul 2021 10:12:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4634AC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jul 2021 10:12:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UA2gYs025865; Fri, 30 Jul 2021 12:12:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=x6t0c9DCY9hIvQcZ7bezYlWjLTNmJ25MllFL+xDvKK8=;
 b=i/dCV1/h8GKEiZkIgB/KQqhqfQ3Mbynazr7IyotHpM54fBHZwHY7JPamjWsz/ySjILJ+
 lBoMP5NtUqz+QqWRNTeREqT3L78lJVUBjO4zFZVibK7fVyTQkztPkh94b4falJwpb3FE
 u8XuqyUelC9DwJsTvjuH6sj7x27JG0RMdnw5Axw9z324rwJH7gCchEk3dTmyHLI8PqZd
 uDpQw2VNy1585OBCuEAmqxzbMpSEJ4bhRcCVzsCQTNHtbpAlmCMNL+xE1/lvrcE+eM/n
 GwIhiarB1SZ3kPiXrXf9UB2qt4uoTPVF3E/54eHrXaq60N1bk9HFzdYHNtv+t7AyhMbs NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a3t82dk3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 12:12:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E3F3100034;
 Fri, 30 Jul 2021 12:12:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 74A9321FE94;
 Fri, 30 Jul 2021 12:12:16 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul 2021 12:12:15
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 30 Jul 2021 12:12:10 +0200
Message-ID: <20210730121202.1.If3a702960ca11240d2dbce54d144144f814d588a@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_05:2021-07-29,
 2021-07-30 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 1/2] pinctrl: change result for unsupported API
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
