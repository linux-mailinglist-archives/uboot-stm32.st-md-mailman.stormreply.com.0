Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 994F11B4520
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 14:29:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 609DFC36B0E
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 12:29:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F30F9C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:29:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MCCNqk015755; Wed, 22 Apr 2020 14:29:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=QOTO347xU5g+Sa19DVBHmoqZZCMF/dffHc8SmZOJMrI=;
 b=d5HvFPG7qtrx0ZkqGw+Yo6NKDyIQpzpEehw8Z5LUD9H4rVKplMFpgMmF5iCuq56BweiI
 2ER9mQqIuHBON78uaUVVm18lwD4zPLLzGt+UqxLB93r/b/ApEAQ79KiM7Hp2onu4MCfi
 SRAk4DP56v8HxFslVFQ+iWeNWV7y3xym80h4Ufb1G7Nk0VCaB+Agy0z5PP/qqPAMYqUe
 d9FDsT1pXwlU2QwmF44bjFurLY0+EFPvKMDs5niAv2Xrnaxx4blWhtOOW1Wh7QVbj3fd
 X3URVKbdUV0FvSkW/Lbl0usBn7qu7p3cqCN9WTnFuXqTW/cwP8vevHgAEoNMdWInRxHz PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fregpatr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:29:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 47357100034;
 Wed, 22 Apr 2020 14:29:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3ED2C2AE6C5;
 Wed, 22 Apr 2020 14:29:24 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 22 Apr 2020 14:29:23 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Apr 2020 14:29:11 +0200
Message-ID: <20200422142834.v2.3.I5954842931a3f46d943b91004a060d6fb5072109@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422122920.19340-1-patrick.delaunay@st.com>
References: <20200422122920.19340-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 03/12] board: stm32mp1: Keep error led ON
	in case of low power detection
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

From: Patrice Chotard <patrice.chotard@st.com>

Since commit commit dd2810851eb1 ("stm32mp1: board: support of
error led on ed1/ev1 board") the attended behavior was no more
respected in case of low power source detection on DK2.

The expected behavior is either the error LED keeps blinking for ever,
or blinks 2 or 3 times and must stay ON.

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 board/st/stm32mp1/stm32mp1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 45068b1cd9..d85a57cee2 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -316,6 +316,7 @@ static void __maybe_unused led_error_blink(u32 nb_blink)
 			mdelay(125);
 			WATCHDOG_RESET();
 		}
+		led_set_state(led, LEDST_ON);
 	}
 #endif
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
