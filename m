Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 189AE1F91AD
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 10:39:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5251C36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 08:39:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E20ABC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 08:39:28 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F8cnAu021393; Mon, 15 Jun 2020 10:39:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=d847tcbM3FiBrcmKnEUWpoxM+lRnESKbuUZrU3d6a+s=;
 b=rVn2+PCaAt2dQSO/k11MPKr81bgAQk1YeaHrp+fw6deYFeDhODggRUCkX6OoovY41iMa
 wZ3YJV7DS9BKkuA88K/QHuStoL3O6wE3sb+nAsUXP0bpYakKBW1b8+6MjhjY/Cnu9ud1
 4HTKf8yPeyWFPyI7F2j3iduGgKicDD2QjhjMFIEn/y374kUjT+sl2STo4nVaaAil/Cj0
 eZsdR03hYJPE8D133HSoYDtuUojXnZsHiqHLEpnjsxN1LvcWJjqel5NS3k64WzxYwp16
 4On0j+mVU8t1wupz6/27YNm8muSdX7awRRqu10a7z5fByMR0wK5EWxZdmGyj4ZSrU6eC 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mmjvrj13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 10:39:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37FDB10002A;
 Mon, 15 Jun 2020 10:39:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2EACF2BC7D5;
 Mon, 15 Jun 2020 10:39:10 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 15 Jun 2020 10:39:09 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jun 2020 10:38:56 +0200
Message-ID: <20200615103839.RESEND.2.Ib5b400348308b65bb50d9bfff5fe681027bff4e5@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615083857.3825-1-patrick.delaunay@st.com>
References: <20200615083857.3825-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-15,
 2020-06-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH 2/3] env: mmc: correct the offset
	returned by mmc_offset_try_partition
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

The output of the function mmc_offset_try_partition must be a
byte offset in mmc and not a multiple of blksz.

This function is used in mmc_offset(), called by mmc_get_env_addr()
and the offset is used in write_env(), erase_env() and read_env().

In these function, blk_start = offset / mmc->read_bl_len
or /write_bl_len so this offset is not a multiple of blksz.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 env/mmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/env/mmc.c b/env/mmc.c
index e67ef90bce..5de4a45817 100644
--- a/env/mmc.c
+++ b/env/mmc.c
@@ -56,10 +56,10 @@ static inline int mmc_offset_try_partition(const char *str, s64 *val)
 	}
 
 	/* round up to info.blksz */
-	len = (CONFIG_ENV_SIZE + info.blksz - 1) & ~(info.blksz - 1);
+	len = DIV_ROUND_UP(CONFIG_ENV_SIZE, info.blksz);
 
 	/* use the top of the partion for the environment */
-	*val = (info.start + info.size - 1) - len / info.blksz;
+	*val = (info.start + info.size - len) * info.blksz;
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
