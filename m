Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C35ED18B127
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 11:21:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75F6CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 10:21:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07657C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 10:21:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02JA9YgD007936; Thu, 19 Mar 2020 11:21:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=CxGsk7IxZ6OqqIm/9ol+N9uH7BH9oNvNG8f2iquYnUE=;
 b=0DvCrSYWEk5KcWlNer7AUpfo2n07b+BERkyAkr/gYJlXl6WJNj+CJ+0/AMwSqVCB+xE3
 yYzJDMLuJFGZ2S4rTdLk8dx+OvSTchHDrG1zuhaa5Z4n+7bWNkDMvm6x/yd0WbX3q2fC
 sxuV9QnozwqFmjUKWUKntWf3Jn8l360y5zsvEBX0Xq/tFXBltJKy9AJVaW0v7IMpngdU
 6zZ4agW2FYhzRPsAR+y61Y1N2aRxvLKc7681edLkzjiegXMMAWGnVL8CG8e6l887635d
 HVZjZukQx8zK/B5RfPGvNRhvfbONq2l8ls71xOIHKbYCwGm39q9K6OunsrqCsndTHlNC iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yua4wgpx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 11:21:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 018A2100034;
 Thu, 19 Mar 2020 11:21:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EACD721FE99;
 Thu, 19 Mar 2020 11:21:23 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 19 Mar 2020 11:21:23 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 Mar 2020 11:21:12 +0100
Message-ID: <20200319102114.8644-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_02:2020-03-18,
 2020-03-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/3] stm32mp1: board: add support of
	CONFIG_ENV_IS_IN_MMC
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

Add support of CONFIG_ENV_IS_IN_MMC in env_get_location, used for
all mmc device (SD card and eMMC).
The 2 configs CONFIG_ENV_IS_IN_MMC and CONFIG_ENV_IS_IN_EXT4 are
incompatible.

Add the weak function mmc_get_env_dev to select the mmc boot instance.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index c36e7655c0..effba41ad1 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -785,6 +785,11 @@ enum env_location env_get_location(enum env_operation op, int prio)
 		return ENVL_UNKNOWN;
 
 	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
+#ifdef CONFIG_ENV_IS_IN_MMC
+	case BOOT_FLASH_SD:
+	case BOOT_FLASH_EMMC:
+		return ENVL_MMC;
+#endif
 #ifdef CONFIG_ENV_IS_IN_EXT4
 	case BOOT_FLASH_SD:
 	case BOOT_FLASH_EMMC:
@@ -826,6 +831,15 @@ const char *env_ext4_get_dev_part(void)
 }
 #endif
 
+#if defined(CONFIG_ENV_IS_IN_MMC)
+int mmc_get_env_dev(void)
+{
+	u32 bootmode = get_bootmode();
+
+	return (bootmode & TAMP_BOOT_INSTANCE_MASK) - 1;
+}
+#endif
+
 #ifdef CONFIG_SYS_MTDPARTS_RUNTIME
 
 #define MTDPARTS_LEN		256
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
