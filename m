Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF7218B0B6
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 11:00:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12F7DC36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 10:00:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2174DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 10:00:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J9xeWf030715; Thu, 19 Mar 2020 11:00:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=z7XKBpqieG+fMPNZPVfzO2qSnfO5U0XBf1OJwFfymB4=;
 b=IPbuC4FTihmlUo8F/lkNlL8hOlMY4KcK5O0H0VEy0YylJj9R1uLJJ1p+p2xew0JLgUZF
 /eeWbksqlC1QvvtWRq8GKm18LdDU4t67MItn3krO1UbItf8VySlEnv4zWqMpFRcxiimB
 Xc9bIqMpvtH5+evGO2oEc9GLyXnX6RNgwIO6pqraWc0KhoG3o5dOdci8TWtTezHBoQ+w
 d/p9qm5m9+waaZwAOmJwSQmLPWBoHSSfDYY1fXz2mHQyljC14abqTjCFQLAvZoxHjpLX
 iH2kf+k7pNpe4kezuRG71ZmKT3iCxQm5754/W1ZriDdsL7cVEUPiXTh4ZFxax3WWN9t/ YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yua4wgk8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 11:00:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C11B9100048;
 Thu, 19 Mar 2020 11:00:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0A912A4D7E;
 Thu, 19 Mar 2020 11:00:05 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 19 Mar 2020 11:00:04 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 Mar 2020 10:59:34 +0100
Message-ID: <20200319105917.2.Ib5b400348308b65bb50d9bfff5fe681027bff4e5@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
References: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_02:2020-03-18,
 2020-03-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/3] env: mmc: correct the offset returned by
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
index 902cca23ad..c24b169f3e 100644
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
