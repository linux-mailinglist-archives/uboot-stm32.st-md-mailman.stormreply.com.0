Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 689C8333886
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Mar 2021 10:16:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F11EC57B7A;
	Wed, 10 Mar 2021 09:16:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 613E1C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 09:16:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A9D6wd003440; Wed, 10 Mar 2021 10:16:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=T4Yg+Uhf22fA86JZks2IFuZVb7ppMfIYnJgfBynCtiE=;
 b=oSc4WMYG7mysTOzuJiN0T19ELw3gDger3jMVQsIqJZl7o8Nkhk9FwZ7/MEfDzHlhIdLy
 v0xBUu+jcPJHrBwfyhs95gjrrVnlGCq6E92eUoNTCH3oOGK6KloDYUA79L42QWDaHas0
 BgWBQsVZjZboNQSKH8CIiuCDuevPFGzskBEUOP8g2C5RmzjwBaA60LcDpHzu81npoJXg
 x+Pkt22WW6j9DfGimMg21CfvKfoiMbsbOx16QYb9UrPvFyiuAjOdr0u7i8FVflfdsRXO
 /tp4MlBEqzhMtgxEpRHeiRPHmf39whn1cVzO+ZTOlXR7cqgTXnQsWC2IQglOvNMRaQJo 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741gpq1q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 10:16:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77017100039;
 Wed, 10 Mar 2021 10:16:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6BE2B228D95;
 Wed, 10 Mar 2021 10:16:46 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Mar 2021 10:16:46
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 10 Mar 2021 10:16:29 +0100
Message-ID: <20210310101622.v2.5.I94c52853f676d92dcacf734240d54cbb6bc38ef4@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_07:2021-03-09,
 2021-03-10 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tero Kristo <t-kristo@ti.com>, Masahiro Yamada <masahiroy@kernel.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 5/8] lmb: correct size of the regions array
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

As in lmb_region, cnt < max and in the lmb library
use region[i] only with i in 0...cnt, this region array size
can be reduced by 1 element without overflow.

This patch allows to reduce the struct lmb size.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- new in V2: reduce size impact by correct regions array size

 include/lmb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/lmb.h b/include/lmb.h
index d3adf8ef69..898ce15d07 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -20,7 +20,7 @@ struct lmb_property {
 struct lmb_region {
 	unsigned long cnt;
 	unsigned long max;
-	struct lmb_property region[CONFIG_LMB_MAX_REGIONS + 1];
+	struct lmb_property region[CONFIG_LMB_MAX_REGIONS];
 };
 
 struct lmb {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
