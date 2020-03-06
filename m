Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F23F317B9FA
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:14:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5FA4C36B11
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 10:14:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DB0FC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 10:14:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026AER18020373; Fri, 6 Mar 2020 11:14:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=f5dDxHRMJUvIBsf+b85Ws8pDiAWN0GyEzrMBS0C6Pm4=;
 b=bGd54edfhb2oKnpMATfHDIEQi4hpLFMnsFAtqmYqnkGsQu7GGAq9Cyrou/qz0bVNR4Ie
 SwBKK1hwaqI2dZ8jXoFPsdxb/rqyS+Nws0flhjE+vvnTWzCTEkbLOrvPVn2+wIkd2R4p
 f4RaTGzXxsDo0Nk14ukkg+4FO+ztqLQ5TU9Udgzp+0iq+rPK4Joqh9sx3xn+SBgn1mss
 Zcv0Tm3UKUG1egq3IFsjlGFC1sQs1rgBbEsyiwXdpIArrqV1DKflGYXc/S7aGDZEDcc1
 qln6ISItdRFmFSdRM9jLibuK0FagmZr2Ef074t4jkvjOlasIo2onxHeq4Q6VgDQ3d46U tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yffqqegrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:14:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A1C64100038;
 Fri,  6 Mar 2020 11:14:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AE3D2A7189;
 Fri,  6 Mar 2020 11:14:32 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 11:14:32 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 11:14:05 +0100
Message-ID: <20200306111355.3.I6004c77337da88fcc073b421245687c3f74b30a8@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306101412.15376-1-patrick.delaunay@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/9] ram: stm32mp1: don't display the prompt
	two times
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

Remove one "DDR>" display on command
- next
- step
- go

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_interactive.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_interactive.c b/drivers/ram/stm32mp1/stm32mp1_interactive.c
index cc9b2e7c96..cedf92cb5f 100644
--- a/drivers/ram/stm32mp1/stm32mp1_interactive.c
+++ b/drivers/ram/stm32mp1/stm32mp1_interactive.c
@@ -367,7 +367,6 @@ bool stm32mp1_ddr_interactive(void *priv,
 			      enum stm32mp1_ddr_interact_step step,
 			      const struct stm32mp1_ddr_config *config)
 {
-	const char *prompt = "DDR>";
 	char buffer[CONFIG_SYS_CBSIZE];
 	char *argv[CONFIG_SYS_MAXARGS + 1];	/* NULL terminated */
 	int argc;
@@ -403,13 +402,12 @@ bool stm32mp1_ddr_interactive(void *priv,
 	}
 
 	printf("%d:%s\n", step, step_str[step]);
-	printf("%s\n", prompt);
 
 	if (next_step > step)
 		return false;
 
 	while (next_step == step) {
-		cli_readline_into_buffer(prompt, buffer, 0);
+		cli_readline_into_buffer("DDR>", buffer, 0);
 		argc = cli_simple_parse_line(buffer, argv);
 		if (!argc)
 			continue;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
