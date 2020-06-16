Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD69B1FAA20
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 09:41:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2362C36B27
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 07:41:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56B8BC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 07:41:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05G7e7l0028817; Tue, 16 Jun 2020 09:40:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=edqOSd8/G/p4S3zF96jlp+NTwDFo8MuEcvzFZHJDHDo=;
 b=QVOvCLNGSW7+rPNn9ZvwpXawdQdhuMmaOuSdHfjOR+KGBKpJ5aqRhmVoaKPJR5S5si57
 8JXfwrVoUXZiNiSOXsicb1EDKqBjeCicHg26OmelhmWyJun5AGhZZx2dDWzX9ZfEsAni
 Tv0Q6Rb9HAfBdgMPaetRxEcIzArZ7ErMvysAOdnQJAJbqyQ0+dFUi5FlcHcf3HUhBn06
 7kVRt/uXuepasgZqnvAHpF5ZqjRnwwdLUigM2jIoGg35G5kAktOkYKSS7PrFgpIjWD0m
 TdP9tCxQrs3x4jdl+UHCHAcr5sEW9A/lXxSv4gRly7x5AoIkdXq1PbxAPa5tkt8SQWYz tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mnph5mqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 09:40:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 82AE3100034;
 Tue, 16 Jun 2020 09:40:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76E792AEF8D;
 Tue, 16 Jun 2020 09:40:51 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 09:40:51 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 16 Jun 2020 09:40:40 +0200
Message-ID: <20200616074048.7898-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616074048.7898-1-patrick.delaunay@st.com>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_02:2020-06-15,
 2020-06-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 1/9] env: add absolute path at
	CONFIG_ENV_EXT4_FILE
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

Add the absolute path to the default value of
CONFIG_ENV_EXT4_FILE = "/uboot.env".

This patch avoid the error :
  Saving Environment to EXT4... File System is consistent
  Please supply Absolute path

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

For information, it is the value used today by all the boards:

dragonboard820c_defconfig:29:CONFIG_ENV_EXT4_FILE="/uboot.env"
hikey960_defconfig:25:CONFIG_ENV_EXT4_FILE="/uboot.env"
stm32mp15_basic_defconfig:64:CONFIG_ENV_EXT4_FILE="/uboot.env"
stm32mp15_trusted_defconfig:50:CONFIG_ENV_EXT4_FILE="/uboot.env"


(no changes since v1)

 env/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/env/Kconfig b/env/Kconfig
index ca7fef682b..9dad1cf8c1 100644
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -469,7 +469,7 @@ config ENV_EXT4_DEVICE_AND_PART
 config ENV_EXT4_FILE
 	string "Name of the EXT4 file to use for the environment"
 	depends on ENV_IS_IN_EXT4
-	default "uboot.env"
+	default "/uboot.env"
 	help
 	  It's a string of the EXT4 file name. This file use to store the
 	  environment (explicit path to the file)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
