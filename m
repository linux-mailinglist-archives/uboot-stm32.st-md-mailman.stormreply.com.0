Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ED01B2AC1
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 17:12:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D154C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 15:12:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79DA8C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 15:12:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LF8LMl002626; Tue, 21 Apr 2020 17:11:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=awq0gsAN8X8urdFefjXCis2horSUnNymcHWF8Uzu2Mg=;
 b=g+ilBIjoJYLY/XYjONEznUEjyMS2bo+7HfR0jhiBMUBxnZgRhIie+6eVzI6UFjMQPxFc
 uJw2k8egTcTcRKBFm9WuWRfNwjU+UNEWeKS26KmF6Ub4wFN/xr7nFHZ289F66RkgxCKH
 u/Ii1j7Yaqn9ulV1ikZAyn36PNZeTrtMRSyIWXtyhHqjycXou1iL5/xdxMaXbO+igYCv
 5x9MHoNPPozqSBM1qTLE0+hVjvDayxcTw8Xl3NqwGCQRhTh5ZsueWXATv2KRH8E4nAGh
 vz0SJufsRm5Cy55uTQLPnYOt69DKdxBLEL0yC6E2aN/hXFUFW19jdle5ePFx1l22LQi7 /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30freggter-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 17:11:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DEF210002A;
 Tue, 21 Apr 2020 17:11:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 72FEC2BE249;
 Tue, 21 Apr 2020 17:11:49 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 17:11:48 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Apr 2020 17:11:24 +0200
Message-ID: <20200421151128.18072-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421151128.18072-1-patrick.delaunay@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 5/9] ARM: stm32: Add board_early_init_f() to
	SPL
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

From: Marek Vasut <marex@denx.de>

Add weak implementation of board_early_init_f() hook into the
STM32MP1 SPL. This can be used to read out e.g. configuration
straps before initializing the DRAM.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/spl.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
index ca4231cd0d..cd14d1065e 100644
--- a/arch/arm/mach-stm32mp/spl.c
+++ b/arch/arm/mach-stm32mp/spl.c
@@ -76,6 +76,11 @@ void spl_display_print(void)
 }
 #endif
 
+__weak int board_early_init_f(void)
+{
+	return 0;
+}
+
 void board_init_f(ulong dummy)
 {
 	struct udevice *dev;
@@ -110,6 +115,12 @@ void board_init_f(ulong dummy)
 	/* enable console uart printing */
 	preloader_console_init();
 
+	ret = board_early_init_f();
+	if (ret) {
+		debug("board_early_init_f() failed: %d\n", ret);
+		hang();
+	}
+
 	ret = uclass_get_device(UCLASS_RAM, 0, &dev);
 	if (ret) {
 		printf("DRAM init failed: %d\n", ret);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
