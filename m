Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC76756488
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Jun 2019 10:27:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 891D1C90620
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Jun 2019 08:27:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF2A9C9061E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2019 08:27:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5Q8R5hZ032153; Wed, 26 Jun 2019 10:27:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=txo/wdggwlmX8BurlzY+xilVv5y8k1BWGHPdH2u6ulg=;
 b=04go8yKS+hfe+q7b25pT4hQg40IUoyURihYPvRC7BxnD5upwIQl+zc7psSEq7mvPORkL
 /OTg33W9OUBo3kSND226PbvIxPwiOZDrT+Ew70Xba6eo4iCnPWSCaEffkc1wD1gqf2lq
 BJPqUsjv8k9O+FO6iY9q0Ucr0FuiYzEhzZ5DmQ1ERV1iP0rTkRc3WhQAz3wX0LprZv4C
 E6v2jyStpDohDwpd0UK2YJYsjvJlBsECV0uoy/5hVo/dUIf6oRxhClnbINv5z7AVW10d
 bBz1M5YX3Wj1oglIE5seqFu0h0ew0xhq0XpaxRnan0/0SJCT5DvtApz3N4+dnFhgJIL4 rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tb1f3ts5f-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 26 Jun 2019 10:27:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A89231;
 Wed, 26 Jun 2019 08:26:53 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E27651975;
 Wed, 26 Jun 2019 08:26:52 +0000 (GMT)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 26 Jun 2019 10:26:52 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 26 Jun 2019 10:26:41 +0200
Message-ID: <20190626082641.13869-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-26_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>
Subject: [Uboot-stm32] [PATCH] board: st: add missing gpio_request() for
	stm32f429-discovery
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

This fixes the following error message:

U-Boot 2019.07-rc4-00103-g5eea874b5e (Jun 25 2019 - 15:09:31 +0200)

DRAM:  8 MiB
gpio@40021800: dir_output: error: gpio GPIOG14 not reserved
gpio@40021800: dir_output: error: gpio GPIOG13 not reserved
gpio@40021800: set_value: error: gpio GPIOG14 not reserved
Flash: 2 MiB
....

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 board/st/stm32f429-discovery/led.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/st/stm32f429-discovery/led.c b/board/st/stm32f429-discovery/led.c
index 8320ad4fac..ae6df78f56 100644
--- a/board/st/stm32f429-discovery/led.c
+++ b/board/st/stm32f429-discovery/led.c
@@ -9,7 +9,9 @@
 
 void coloured_LED_init(void)
 {
+	gpio_request(CONFIG_RED_LED, "red led");
 	gpio_direction_output(CONFIG_RED_LED, 0);
+	gpio_request(CONFIG_GREEN_LED, "green led");
 	gpio_direction_output(CONFIG_GREEN_LED, 0);
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
