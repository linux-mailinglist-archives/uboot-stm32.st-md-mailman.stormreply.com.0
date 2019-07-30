Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD827AF95
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9428CC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42836C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHFqQ2001893; Tue, 30 Jul 2019 19:17:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=eq1Eb5EJNPKonpIDDrDzKenh9kOQA9pnS8/Cs5/4N78=;
 b=mQgeFCPDlSIJS/cJ5qc3B/q+wl9kZZ7hPrBaxapq1KCM7uASqOcXUXv8mkjt3rjynWSV
 ePUCngPPbD8E/uCsLZooRth/AMIWBUoQcnHGfZ9LT09T1104wYWVh/+sDiy6Vz8jul0B
 HpqPCiP+rjKGgi1XwbnBDC+bHJY6i7Apk7XJvi6PUX5hzg8caqLXjjRJeBydF4MjupDj
 hlN0QbODbZrtEKZAwXTNZtTM7KO7zF+Kz34nCWNMWWw3vJyZnGWmkOropFe/foujMoh5
 12vbCNAndX87aVROh8T/HaIX6lHnh+WCIYVWA3ZYMjGFV+IzAFEMWYaaMc51qmF0+qtd /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4acuj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D556834;
 Tue, 30 Jul 2019 17:17:40 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CECEBCEA01;
 Tue, 30 Jul 2019 19:17:40 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:40 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:40
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:43 +0200
Message-ID: <1564507016-16570-36-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 35/48] stm32mp1: board: remove
	board_check_usb_power when ADC is not activated
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

Avoid compilation issue when CONFIG_ADC is not activated

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index a96e675..a67e33e 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -296,6 +296,7 @@ static void __maybe_unused led_error_blink(u32 nb_blink)
 		hang();
 }
 
+#ifdef CONFIG_ADC
 static int board_check_usb_power(void)
 {
 	struct ofnode_phandle_args adc_args;
@@ -429,6 +430,7 @@ static int board_check_usb_power(void)
 
 	return 0;
 }
+#endif /* CONFIG_ADC */
 
 static void sysconf_init(void)
 {
@@ -659,8 +661,10 @@ int board_late_init(void)
 	}
 #endif
 
+#ifdef CONFIG_ADC
 	/* for DK1/DK2 boards */
 	board_check_usb_power();
+#endif /* CONFIG_ADC */
 
 	/* Check the boot-source to disable bootdelay */
 	boot_device = env_get("boot_device");
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
