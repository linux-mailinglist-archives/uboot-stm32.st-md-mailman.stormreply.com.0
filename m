Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE161C02C3
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 18:41:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D685C36B0D
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 16:41:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B15E7C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 16:41:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03UGcPYT017416; Thu, 30 Apr 2020 18:41:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=uvgGwjWO6sm5lBbUJL1NOmi9M46vXeAysSmn1Pn14DY=;
 b=Tyu5Ec3UFl+pdHDEPqJiGRAogwjCqRrLGIIkyVNXK71fS88Fi+WB1KFE2VbpISPJ5K2T
 Q+zvv4qm4RGWOwp1a3IKz5tNu2tjiRsz52S+s0mFX9U7ha5CBzJAB6oQNcvVKTV+MYHs
 Wc6sHgWpEEjYaVwc6QUlrJiIFXeTPP/v3goJE4WQiAEGIi5gW22GOlQTegqix7BG5OOZ
 1hfzquv1tqmHoR8dztvjHnJR7vfoWvQO6dMLFUoFUhxJTGVpQ8QSdLTbgn0zb063AvvE
 9fzjJbF9CQ4zNGja+ZW8S4N0TMIBTBDdGffWWUBKNd4TXbybVW2CoHOlrWU3fX2BQxRB zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30n4j69ry0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 18:41:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6261310002A;
 Thu, 30 Apr 2020 18:41:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 491902AAF64;
 Thu, 30 Apr 2020 18:41:11 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 30 Apr 2020 18:41:10 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Apr 2020 18:41:05 +0200
Message-ID: <20200430164105.20486-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_11:2020-04-30,
 2020-04-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] stm32mp1: Fix warning display when 1.5A power
	supply is used
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

On DK1/2 board, when a 1.5A power supply is detected, a warning
message is displayed. In this message, "1.5mA" is displayed instead
of "1.5A".

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 45068b1cd9..a4e4d8e9fe 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -435,7 +435,7 @@ static int board_check_usb_power(void)
 	if (max_uV > USB_WARNING_LOW_THRESHOLD_UV &&
 	    max_uV <= USB_START_LOW_THRESHOLD_UV &&
 	    min_uV <= USB_LOW_THRESHOLD_UV) {
-		pr_err("*       WARNING 1.5mA power supply detected        *\n");
+		pr_err("*       WARNING 1.5A power supply detected        *\n");
 		nb_blink = 3;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
