Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7A157095B
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Jul 2022 19:45:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C63C7C03FE1;
	Mon, 11 Jul 2022 17:45:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 142B4C035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 17:45:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BDLhon016906;
 Mon, 11 Jul 2022 19:45:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=cg7KZoAQ5UFPRKXV5yk7XvafNemkwmOc1rPjiKFmDjs=;
 b=7e3Zr7qD+2tvsLiwsyxXb1wiMdHEssHZw5GFN7mNovRMbLgKFaswtfrbR6fJ30e25KS6
 ubzRGHRrBvCF39pS3DIZGUMSLgLUScRUnkyIN70ABqKf1ZjlmcB6P1E97+HkZgNOtXk6
 TaVY4FBUcguYZn8El1TCw76gQVSkWrms7hjQ9S9eLRU4YmD9h2bw7jdz3eISnoUuRDSi
 tXv9PRcPch8wDSS8c30ntGw7NVP3idCyoqSwDh9uO5p1PWA1OgdOVQLIoAME8N0C5EZw
 j173xswKoneJt6QD2+bw8djkWeoeE4UycSYa32iaW2YyORgpnlZi02wfB080Wywy0FAi bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h70jk4fxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 19:45:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2979910002A;
 Mon, 11 Jul 2022 19:45:52 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1939D2309ED;
 Mon, 11 Jul 2022 19:45:52 +0200 (CEST)
Received: from localhost (10.75.127.50) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 11 Jul
 2022 19:45:51 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 11 Jul 2022 19:45:50 +0200
Message-ID: <20220711194539.1.I96e7509b1edb4889e3d0d8a48e942556015ac705@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_22,2022-07-08_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32m15: support
	STM32MP_BOARD_EXTRA_ENV for st boards
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

Correctly handle STM32MP_BOARD_EXTRA_ENV define in stm32mp15_st_common.h;
the STM32MP_BOARD_EXTRA_ENV is added in CONFIG_EXTRA_ENV_SETTINGS
definition, as it is done "stm32mp15_st_common.h"

Without this patch, the content of STM32MP_BOARD_EXTRA_ENV is not used in
the default environment for STMicroelectronics boards.

Fixes: 806c4dd31532 ("configs: stm32mp1: set the console variable for extlinux.conf")
Reported-by: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/configs/stm32mp15_st_common.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/configs/stm32mp15_st_common.h b/include/configs/stm32mp15_st_common.h
index 37b216e6e9f..6bdc286cfca 100644
--- a/include/configs/stm32mp15_st_common.h
+++ b/include/configs/stm32mp15_st_common.h
@@ -48,7 +48,8 @@
 	ST_STM32MP1_BOOTCMD \
 	STM32MP_PARTS_DEFAULT \
 	BOOTENV \
-	STM32MP_EXTRA
+	STM32MP_EXTRA \
+	STM32MP_BOARD_EXTRA_ENV
 
 #endif
 #endif
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
