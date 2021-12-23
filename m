Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A27347E62D
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Dec 2021 17:09:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B1E6C5F1F6;
	Thu, 23 Dec 2021 16:09:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 860FBC5F1F5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Dec 2021 16:09:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BN9KUhB030753;
 Thu, 23 Dec 2021 17:09:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=aBf4iE9mZNf4SL3DkrAgEKQwDQDqpgACRnPnnnCqKZQ=;
 b=WhXlWo4yxKUMirUSypPE6odtPhp6EcOw7+UhKKw/rK18L1sXF5YHxCt+37K6oiucGe1h
 xdzQ4NW9qDx1rg3EB8Ysr/VBots1ttwyc/4mMkheipaRIwyrmqA/kcp7KL5/0RtKJ7u4
 XYW81cTq1cu6j63ifkYA/zDh1BHCE9uFgLxrjGGfNJATmmwaN3N8H3SK2fAY+O5WimFp
 KdBks3jMhFkQrGpwoyv2B0kANSI01V7CMZKq/UG5WjopTQC5+gtPlaejaUKyK7CvDXYk
 JaSE80jtiVOuE8TmWOn7t5lhR1WLNo2dwcYyIUqhAqdYNRGVg70BjE0DOxjp412AutqF Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3d4en2knhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 17:09:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7CD6A10002A;
 Thu, 23 Dec 2021 17:09:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D05720BE58;
 Thu, 23 Dec 2021 17:09:47 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 23 Dec 2021 17:09:46
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 23 Dec 2021 17:09:32 +0100
Message-ID: <20211223160932.4311-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-23_04,2021-12-22_01,2021-12-02_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH] dm: Fix OF_BAD_ADDR definition
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

When OF_LIVE flag is enabled on a 64 bits platform, there is an
issue when dev_read_addr() is called and need to perform an address
translation using __of_translate_address().

In case of error, __of_translate_address() return value is OF_BAD_ADDR
(wich is defined in include/dm/of.h to ((u64)-1) = 0xffffffffffffffff).
The return value of dev_read_addr() is often compared to FDT_ADDR_T_NONE
which is defined as (-1U) = 0xffffffff.
In this case the comparison is always false.

To fix this issue, define OF_BAD_ADDR to FDT_ADDR_T_NONE.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 include/dm/of.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dm/of.h b/include/dm/of.h
index 5cb6f44a6c..0208cc234a 100644
--- a/include/dm/of.h
+++ b/include/dm/of.h
@@ -95,7 +95,7 @@ static inline bool of_live_active(void)
 	return gd_of_root() != NULL;
 }
 
-#define OF_BAD_ADDR	((u64)-1)
+#define OF_BAD_ADDR	FDT_ADDR_T_NONE
 
 static inline const char *of_node_full_name(const struct device_node *np)
 {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
