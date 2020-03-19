Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D0C18B0B7
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 11:00:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C145C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 10:00:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33B40C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 10:00:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J9gqro026336; Thu, 19 Mar 2020 11:00:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=GZ5altIhl3lz+D673IAg02GSzGi8pjX5P9Ida2RuRQU=;
 b=Mv9kqm/4VHhvAcVJmVmmBZ2Olpcn94lLvM8GwBmYlefLePBctJwgCQVNTpPWX2CpOc2d
 rn/bkzA2PyUwenlEZQ3a15D2negRHBUQOk16DniHwPdhtUbeSu97yShfmlc7Aa0Mhgml
 ILrbfaAD9s18CTwO0deXJN9cCb8UOwoaFaBQ/cI4sSCPfonKgjwkNev5EL7EQGBKs6yW
 xRcNVKBeJD0LxsC3DgxgCASgLPKA0gKui4tpUUEPAvs0iyLdguLwZ17IjqFu0bx5t6oI
 oAEBbhTGx2XhUOt0mZu2iWx/Kjnsl6Hp2OBSL//wiUYp7ddmndZ5zzGqfHn8tU/b76EC 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95uruf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 11:00:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EFEE210004A;
 Thu, 19 Mar 2020 11:00:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E16572A4D7D;
 Thu, 19 Mar 2020 11:00:06 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 19 Mar 2020 11:00:06 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 Mar 2020 10:59:35 +0100
Message-ID: <20200319105917.3.I3f39ef337e2318d7c857e0458d5bc66e374dfaba@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
References: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_02:2020-03-18,
 2020-03-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/3] env: mmc: add redundancy support in
	mmc_offset_try_partition
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

Manage 2 copy at the end of the partition selected by config
"u-boot,mmc-env-partition" to save the U-Boot environment,
with CONFIG_ENV_SIZE and 2*CONFIG_ENV_SIZE offset.

This patch allows to support redundancy (CONFIG_ENV_OFFSET_REDUND).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 env/mmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/env/mmc.c b/env/mmc.c
index c24b169f3e..677a3d4668 100644
--- a/env/mmc.c
+++ b/env/mmc.c
@@ -34,7 +34,7 @@ __weak int mmc_get_env_dev(void)
 }
 
 #if CONFIG_IS_ENABLED(OF_CONTROL)
-static inline int mmc_offset_try_partition(const char *str, s64 *val)
+static inline int mmc_offset_try_partition(const char *str, int copy, s64 *val)
 {
 	disk_partition_t info;
 	struct blk_desc *desc;
@@ -59,7 +59,7 @@ static inline int mmc_offset_try_partition(const char *str, s64 *val)
 	len = DIV_ROUND_UP(CONFIG_ENV_SIZE, info.blksz);
 
 	/* use the top of the partion for the environment */
-	*val = (info.start + info.size - len) * info.blksz;
+	*val = (info.start + info.size - (1 + copy) * len) * info.blksz;
 
 	return 0;
 }
@@ -84,7 +84,7 @@ static inline s64 mmc_offset(int copy)
 	str = fdtdec_get_config_string(gd->fdt_blob, dt_prop.partition);
 	if (str) {
 		/* try to place the environment at end of the partition */
-		err = mmc_offset_try_partition(str, &val);
+		err = mmc_offset_try_partition(str, copy, &val);
 		if (!err)
 			return val;
 	}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
