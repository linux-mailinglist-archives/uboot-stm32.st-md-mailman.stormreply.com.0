Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E66E18B0B5
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 11:00:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08051C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 10:00:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F95DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 10:00:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J9gr9i026342; Thu, 19 Mar 2020 11:00:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=gRU5fv1EhiseRpOlvHFGSW3zppoKvafZlYIhM7IgrzQ=;
 b=rlDglTYcqkhIK/ngg6b9ZYmHBZreO5v0bzKols4pSghhaDIyK89OD6rkkYcyQI3gabsq
 VjyE6Iw2a/81HEHiz/O49iyIAA3xrlkG2K7EsIwVCxD+QGcfDnCRfaOxFdgXkrh1U+Ds
 VwFmeNa4XGI7kltHGz4MROwuVeNajLrszdFVhz1gzI7rEZrGj/U3G07EqbJDcog8d/Gk
 BkeusomhTaISruAbZ7N8eW6oLdmLHu99oDT1tpBgENYIldamR48T6w7OIPyAgQHQ05EQ
 w1owKYibrSTfUMj6J/91l1x1e7WCi63j7Gr3WuXI6fqeeYnXlGYydodwNILndGtP8ZOs QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95uruep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 11:00:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32A0110003E;
 Thu, 19 Mar 2020 11:00:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1914F2A4D7E;
 Thu, 19 Mar 2020 11:00:04 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 19 Mar 2020 11:00:03 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 Mar 2020 10:59:33 +0100
Message-ID: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_02:2020-03-18,
 2020-03-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/3] env: mmc: allow support of
	mmc_get_env_dev with OF_CONTROL
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

Use the weak function mmc_get_env_dev in mmc_offset_try_partition
function to allow dynamic selection of mmc device to use
and no more use directly the define CONFIG_SYS_MMC_ENV_DEV.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 env/mmc.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/env/mmc.c b/env/mmc.c
index 251ad07d7c..902cca23ad 100644
--- a/env/mmc.c
+++ b/env/mmc.c
@@ -24,14 +24,25 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
+#if !defined(CONFIG_SYS_MMC_ENV_DEV)
+#define CONFIG_SYS_MMC_ENV_DEV 0
+#endif
+
+__weak int mmc_get_env_dev(void)
+{
+	return CONFIG_SYS_MMC_ENV_DEV;
+}
+
 #if CONFIG_IS_ENABLED(OF_CONTROL)
 static inline int mmc_offset_try_partition(const char *str, s64 *val)
 {
 	disk_partition_t info;
 	struct blk_desc *desc;
 	int len, i, ret;
+	char dev_str[4];
 
-	ret = blk_get_device_by_str("mmc", STR(CONFIG_SYS_MMC_ENV_DEV), &desc);
+	snprintf(dev_str, sizeof(dev_str), "%d", mmc_get_env_dev());
+	ret = blk_get_device_by_str("mmc", dev_str, &desc);
 	if (ret < 0)
 		return (ret);
 
@@ -114,11 +125,6 @@ __weak int mmc_get_env_addr(struct mmc *mmc, int copy, u32 *env_addr)
 	return 0;
 }
 
-__weak int mmc_get_env_dev(void)
-{
-	return CONFIG_SYS_MMC_ENV_DEV;
-}
-
 #ifdef CONFIG_SYS_MMC_ENV_PART
 __weak uint mmc_get_env_part(struct mmc *mmc)
 {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
