Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB022347D2
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 16:32:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44E18C36B3A
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 14:32:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D758C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:32:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VESldn019777; Fri, 31 Jul 2020 16:31:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=xxxU16cH1xuCx+Y8BlRlAJc1W4slCdor0gU9y+nmGEc=;
 b=uFfZyBaeypy4gnwPGRuz8BDTpuvQAWawa3znqisFEJXYw5Cc9nIPALs0aS/5RazF97dw
 l4eG0hCoJj2jxOiOcy0Pp72bKzFddoqseVJhzfxRBJTSH85YrX0aaCM855QTypsFTANA
 5qhLWUrX9E6z/AqQ/P/JO4UQdkXGwRLQJxfVz6LvGVDqLcfrNe1YnTzOMSkTuJ0aXRXP
 580OKQlUOsvfd/7n8rLruBtmIMZU5fvmhTCIjToOLlo53vMuo/f9MNJhKqipbYpl7Sc5
 yrI8BoE5nhJ0xKnnsOkrAlgCKPfmVuGkttws8fm3EkhgyUjvznjdzRvK+dNs7Q0mWZOa Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga72dw2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 16:31:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C498E100034;
 Fri, 31 Jul 2020 16:31:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDFE22B1899;
 Fri, 31 Jul 2020 16:31:58 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 16:31:58 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 16:31:44 +0200
Message-ID: <20200731143152.8812-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731143152.8812-1-patrick.delaunay@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_05:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 03/11] board: stm32mp1: use IS_ENABLED to
	prevent ifdef in board_check_usb_power
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

Use IS_ENABLED to prevent ifdef in board_check_usb_power.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 5c84b09c3e..3182f44598 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -288,7 +288,6 @@ static void __maybe_unused led_error_blink(u32 nb_blink)
 		hang();
 }
 
-#ifdef CONFIG_ADC
 static int board_check_usb_power(void)
 {
 	struct ofnode_phandle_args adc_args;
@@ -300,6 +299,10 @@ static int board_check_usb_power(void)
 	int ret, uV, adc_count;
 	u32 nb_blink;
 	u8 i;
+
+	if (!IS_ENABLED(CONFIG_ADC))
+		return -ENODEV;
+
 	node = ofnode_path("/config");
 	if (!ofnode_valid(node)) {
 		debug("%s: no /config node?\n", __func__);
@@ -422,7 +425,6 @@ static int board_check_usb_power(void)
 
 	return 0;
 }
-#endif /* CONFIG_ADC */
 
 static void sysconf_init(void)
 {
@@ -699,10 +701,8 @@ int board_late_init(void)
 	}
 #endif
 
-#ifdef CONFIG_ADC
 	/* for DK1/DK2 boards */
 	board_check_usb_power();
-#endif /* CONFIG_ADC */
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
