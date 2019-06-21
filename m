Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E48B4E90F
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF93ACA028A
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF801CA0285
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:22 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDRG0g031158; Fri, 21 Jun 2019 15:27:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=XpYjz8oiFqDi3SomA2KRm8MLl45VbsWBxXIs+sdaz5E=;
 b=xRZcmKsLi7FR96r/QKh9DD0LJHBnp5h3wii7Fos0pNH2HqhXE651D5kJUrpyKB5k4I38
 PT9phaJeKbGEaMbAaRSbONmQIwKZejJenutzPEPy4R9tB1R+JmGZ1UooFH0eWdCfsPVE
 qU7/a31XNt12WXHMIN+jvg7ez1ynmmG0u1QfIWZWPaVmGMuortBgMJre92t/tW9k29R/
 rwhuBzOsTARszc47LahF1ybgdXBL+kiCTdXuoHal0Ov92TIEat3/fOAgnZN4RWaUEl1U
 XeO9uv0+69OtZ+Ct11PsvQu22R8ZsboS9dYyOJ/CYDcpU9+SPeZD5dFxUxBdVkv7ZqIo eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813qe9r-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:20 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2A6158;
 Fri, 21 Jun 2019 13:27:11 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D279F2A50;
 Fri, 21 Jun 2019 13:27:11 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:11 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:11
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:47 +0200
Message-ID: <1561123618-2029-9-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 09/20] i2c: stm32f7_i2c: Fix warnings when
	compiling with W=1
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

This patch solves the following warnings:

drivers/i2c/stm32f7_i2c.c: In function 'stm32_i2c_compute_solutions':
warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
    if (scldel < scldel_min)
               ^
warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (((sdadel >= sdadel_min) &&
                  ^~
warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
          (sdadel <= sdadel_max)) &&
                  ^~
drivers/i2c/stm32f7_i2c.c: In function 'stm32_i2c_choose_solution':
warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (clk_error < clk_error_prev) {
                    ^
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/i2c/stm32f7_i2c.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index 50c4fd0..2b18735 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -519,13 +519,13 @@ static int stm32_i2c_compute_solutions(struct stm32_i2c_setup *setup,
 	/* Compute possible values for PRESC, SCLDEL and SDADEL */
 	for (p = 0; p < STM32_PRESC_MAX; p++) {
 		for (l = 0; l < STM32_SCLDEL_MAX; l++) {
-			u32 scldel = (l + 1) * (p + 1) * i2cclk;
+			int scldel = (l + 1) * (p + 1) * i2cclk;
 
 			if (scldel < scldel_min)
 				continue;
 
 			for (a = 0; a < STM32_SDADEL_MAX; a++) {
-				u32 sdadel = (a * (p + 1) + 1) * i2cclk;
+				int sdadel = (a * (p + 1) + 1) * i2cclk;
 
 				if (((sdadel >= sdadel_min) &&
 				     (sdadel <= sdadel_max)) &&
@@ -613,10 +613,12 @@ static int stm32_i2c_choose_solution(struct stm32_i2c_setup *setup,
 				if ((tscl >= clk_min) && (tscl <= clk_max) &&
 				    (tscl_h >= i2c_specs[setup->speed].h_min) &&
 				    (i2cclk < tscl_h)) {
-					int clk_error = tscl - i2cbus;
+					u32 clk_error;
 
-					if (clk_error < 0)
-						clk_error = -clk_error;
+					if (tscl > i2cbus)
+						clk_error = tscl - i2cbus;
+					else
+						clk_error = i2cbus - tscl;
 
 					if (clk_error < clk_error_prev) {
 						clk_error_prev = clk_error;
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
