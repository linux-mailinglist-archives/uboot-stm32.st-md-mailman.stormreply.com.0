Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B36750B1BD
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Apr 2022 09:38:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EE92C60496;
	Fri, 22 Apr 2022 07:38:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05711C60492
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:38:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M2iiqj028979;
 Fri, 22 Apr 2022 09:38:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=T/AuYMRvdKW3/GuSR+Eg21E3OslIHUyZWdRE09orsn0=;
 b=rcs49MNh47hYpBXEwN9e95qNVWLk3qS4hYOdN9eZi2y3EBsIzrKSWqBBF7zAT6xSsjkN
 crJWdXWQCNbALqYndqSukd5iKWZ8fsaANki9BKcTHWLm3cTxtZs5syhsuIlyzwF+wNWx
 Mhth1cB8EdFjOM5wjrsf1Oq19AGkHnZBspzHEFc0YZcqKeC419xiNB0sQHcw4OeBcc1Z
 VoBvdjPNJHGJMeNwbJSonO9sbp04Hs2Y0/2MwjYoFTDUyWqsmvDSgrK9anxPrtOP+69/
 LPb9opjBDYOcjk+R2lKlnx9ApEsXNE2sxyc6uvJvtPMRlXwh+zVgb7XYuCQ1MLtVy/mA 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fk4fvd7gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:38:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A1BC1100034;
 Fri, 22 Apr 2022 09:38:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C68A216833;
 Fri, 22 Apr 2022 09:38:36 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 09:38:36 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 22 Apr 2022 09:38:29 +0200
Message-ID: <20220422073831.15538-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/3] pinctrl: pinctrl_stm32: Update
	pinmux_mode definition
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

pinmux_mode[] is linked to gpio_function[] defined in gpio-uclass.c
So reuse the same gpio_func_t enum value

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/pinctrl/pinctrl_stm32.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index 5729799b12..5d8e156d62 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -42,13 +42,12 @@ struct stm32_gpio_bank {
 #ifndef CONFIG_SPL_BUILD
 
 static char pin_name[PINNAME_SIZE];
-#define PINMUX_MODE_COUNT		5
-static const char * const pinmux_mode[PINMUX_MODE_COUNT] = {
-	"gpio input",
-	"gpio output",
-	"analog",
-	"unknown",
-	"alt function",
+static const char * const pinmux_mode[GPIOF_COUNT] = {
+	[GPIOF_INPUT] = "gpio input",
+	[GPIOF_OUTPUT] = "gpio output",
+	[GPIOF_UNUSED] = "analog",
+	[GPIOF_UNKNOWN] = "unknown",
+	[GPIOF_FUNC] = "alt function",
 };
 
 static const char * const pinmux_bias[] = {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
