Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6387F354E30
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Apr 2021 09:58:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31922C58D5C;
	Tue,  6 Apr 2021 07:58:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 488B8C58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 07:58:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1367v7Eu027409; Tue, 6 Apr 2021 09:57:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=tBcfYUdDikrjtyHJbdBXtBbvKzMOnDINFuM+iW19iPw=;
 b=gNj1vjVFo3sl0rCYzvC27N5qLBK2rIHkQSKU/uEj8zhWCaX/BExD8szC1zEsgE1Rkapf
 dGfdE5zW0tLvwiZezd/oknaLXbihGd1jx1gf3kfMxyYPv/TqVfXE+pB2fM0daIhxUE+P
 AibBG+iAyUJqt85QpufuT5EV5y0HOQloUGx++qrgohNaUg4eqG5XPIcRF5URsDlarxXl
 34KCvBLQEp4LoQeOACIccCsfNEEEn164/Q6yPUBh3W95vQQgkktFf+VFfosqAtajX1D1
 g6ZurTXZADOLeA6J2TiesgVdsYJwyVfBU4FsUwF+pETub3GctR49t2Cp5QHJr4EqSOMc Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37r6u738ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 09:57:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18D4710002A;
 Tue,  6 Apr 2021 09:57:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3177221783;
 Tue,  6 Apr 2021 09:57:57 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Apr 2021 09:57:57
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Apr 2021 09:57:54 +0200
Message-ID: <20210406095752.1.I339c57936517e4941007cc421c1e2cad5a08a0d3@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_01:2021-04-01,
 2021-04-06 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] stm32mp1: remove the board_check_usb_power
	function when ADC is not activated
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

Simplify the code of the function board_check_usb_power
based in CONFIG_ADC and adc_measurement; the function is removed by the
linker when the CONFIG_ADC is not activated.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/st/stm32mp1/stm32mp1.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 759181fb5d..261ec15e1b 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -347,6 +347,9 @@ static int board_check_usb_power(void)
 	u32 nb_blink;
 	u8 i;
 
+	if (!IS_ENABLED(CONFIG_ADC))
+		return -ENODEV;
+
 	node = ofnode_path("/config");
 	if (!ofnode_valid(node)) {
 		log_debug("no /config node?\n");
@@ -370,11 +373,7 @@ static int board_check_usb_power(void)
 
 	/* perform maximum of 2 ADC measurements to detect power supply current */
 	for (i = 0; i < 2; i++) {
-		if (IS_ENABLED(CONFIG_ADC))
-			ret = adc_measurement(node, adc_count, &min_uV, &max_uV);
-		else
-			ret = -ENODEV;
-
+		ret = adc_measurement(node, adc_count, &min_uV, &max_uV);
 		if (ret)
 			return ret;
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
