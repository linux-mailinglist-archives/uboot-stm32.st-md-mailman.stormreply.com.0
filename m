Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDE71F91A9
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 10:39:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69792C36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 08:39:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFEC0C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 08:39:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F8bvvd005573; Mon, 15 Jun 2020 10:39:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=sYy2RhO/nteDPCrvv3ZLZtWfNJs9jmQxruLwIYRNRbY=;
 b=QJjnZbGy5HhPnh0X6LuBxcnlcj0FJyxlvPcQaztCR3B6beXnMUCsz72wLj3pmeeR+C+T
 OYpx/m3E/1YGzu3mXj1+VhA4KR28+j9yrhqH3J1rVh4i6+j3vwG8HX2lRJW9WNJDR1fr
 F20iazSYwRfHd+HooCO+u1AJikzN2nqmZM3MOha2T79GS+vgq2BU8JJwrdziluiSYzi1
 I3q8p1vcpoSlU2+LAMva0m3Okd0l9UvNdCxkAKS8KEd97DSqW8OhcwUvfByvrtEJVVFm
 yJgmGkwT3B0LN2vtQt4ngGs6X0O7JByfgpLU5amkVTmohVXErfB3NhDm6sh1dDw0LOHJ sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mnph0cmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 10:39:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D7B2710002A;
 Mon, 15 Jun 2020 10:39:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDDED2BC7D7;
 Mon, 15 Jun 2020 10:39:10 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 15 Jun 2020 10:39:10 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jun 2020 10:38:57 +0200
Message-ID: <20200615103839.RESEND.3.I3f39ef337e2318d7c857e0458d5bc66e374dfaba@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615083857.3825-1-patrick.delaunay@st.com>
References: <20200615083857.3825-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-15,
 2020-06-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH 3/3] env: mmc: add redundancy support
	in mmc_offset_try_partition
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
index 5de4a45817..aca61b75e9 100644
--- a/env/mmc.c
+++ b/env/mmc.c
@@ -34,7 +34,7 @@ __weak int mmc_get_env_dev(void)
 }
 
 #if CONFIG_IS_ENABLED(OF_CONTROL)
-static inline int mmc_offset_try_partition(const char *str, s64 *val)
+static inline int mmc_offset_try_partition(const char *str, int copy, s64 *val)
 {
 	struct disk_partition info;
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
