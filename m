Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDDD2FD046
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Jan 2021 13:44:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A01BC3FAD8;
	Wed, 20 Jan 2021 12:44:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E7CDC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 12:43:59 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10KCc1a4009493; Wed, 20 Jan 2021 13:43:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=k72S0uMu6iZr3n5TfxSk07MhZuiHGMP1BFYQihBc7lM=;
 b=AOLvWFli1Z/jksVKrBLEMxyDqN15yiXaodxhM5rfeM40bfdzY8fGARgwVisY9ef24FUE
 pKkczBf2o/kkPskYMIr2QvaSjdTG9EgmuNNuxtfxJK2WEvck2+w97VEErshkJSfC8eld
 4M+q8dGSJnpxvL+2CNJ2K2Pvn+mhH0dyfhGDHSFgwEKpEmTbBt9eZN7rcqTaNhZQyf+f
 g4zNAcyJKiIZ7KLXVMqbhe067Sx6YCaF1muPG4lB8nNT9aUtv5DNnclw14v5KyEBvFqF
 bVEWLV3eqVXdz9VstTghJuSpmHFl+gvbE2qQv8+EkUZynbEi59mT9lFvdFdOFRJ0C55j BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pq4dtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 13:43:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D77C810002A;
 Wed, 20 Jan 2021 13:43:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFC0C236920;
 Wed, 20 Jan 2021 13:43:55 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan 2021 13:43:54
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 Jan 2021 13:43:40 +0100
Message-ID: <20210120124340.23612-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120124340.23612-1-patrice.chotard@foss.st.com>
References: <20210120124340.23612-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_05:2021-01-20,
 2021-01-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] pinctrl: stmfx: Use PINNAME_SIZE for
	pin's name size
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

Instead of redefining a pin's name size, use PINNAME_SIZE defined
in include/dm/pinctrl.h

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/pinctrl/pinctrl-stmfx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index b789f3686c..fbbd479575 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -346,15 +346,14 @@ static int stmfx_pinctrl_get_pins_count(struct udevice *dev)
  * STMFX pins[15:0] are called "gpio[15:0]"
  * and STMFX pins[23:16] are called "agpio[7:0]"
  */
-#define MAX_PIN_NAME_LEN 7
-static char pin_name[MAX_PIN_NAME_LEN];
+static char pin_name[PINNAME_SIZE];
 static const char *stmfx_pinctrl_get_pin_name(struct udevice *dev,
 					      unsigned int selector)
 {
 	if (selector < STMFX_MAX_GPIO)
-		snprintf(pin_name, MAX_PIN_NAME_LEN, "gpio%u", selector);
+		snprintf(pin_name, PINNAME_SIZE, "gpio%u", selector);
 	else
-		snprintf(pin_name, MAX_PIN_NAME_LEN, "agpio%u", selector - 16);
+		snprintf(pin_name, PINNAME_SIZE, "agpio%u", selector - 16);
 	return pin_name;
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
