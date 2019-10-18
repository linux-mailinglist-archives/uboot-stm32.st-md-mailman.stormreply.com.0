Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C3FDCDF2
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Oct 2019 20:29:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA057C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Oct 2019 18:29:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 087B9C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2019 18:29:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9IILtJ6001584; Fri, 18 Oct 2019 20:29:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=cGmFuHcmaVEsivFHv14b32k4Ass0hQwq4z60lvJg9ZI=;
 b=VGEPBD6N0YDR7GCxkPTw9yG0r6Pm5Iilz2ihWVO/D7gLUGOS5M3QNqKW3ufOzEzSkpv0
 +2zXug8+G/yqJZ68hScjooHFe5fcpBrSv/nZDMRQRr+Yd5bIPW6RNIjSSGtqZsDt/smi
 9scE/bfnfceZtTUR44xnd9Eh9pG76SvUXMyYl6UVz11v7EBHC1glZbp4qTD/NLtMJC7j
 pcpvMTBPzyD+VGyt6x/znq8PkfZZFqhkhFP76Q3oL536OvarM5lIhkDa6p29Nmq/4Exp
 5HFfY4/h0A5Fuv++yn62dTcM58vSUPHnagT8/FOZVuzehxd/EaXx/nHFCJs4yJeZSf7d uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk3yabrcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2019 20:29:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F1C110002A;
 Fri, 18 Oct 2019 20:29:26 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 440922C9437;
 Fri, 18 Oct 2019 20:29:26 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 18 Oct
 2019 20:29:26 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 18 Oct 2019 20:29:25
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 18 Oct 2019 20:29:22 +0200
Message-ID: <20191018182922.22960-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-18_04:2019-10-18,2019-10-18 signatures=0
Cc: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Lukasz Majewski <lukma@denx.de>,
 Urja Rannikko <urjaman@gmail.com>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [Uboot-stm32] [PATCH] dm: pinctrl: fix for introduce
	PINCONF_RECURSIVE option
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

Correct the name of the define used in CONFIG_IS_ENABLED():
it is not align with Kconfig name= CONFIG_$(SPL_)PINCONF_RECURSIVE.

This correct a regression introduced by
commit c20851b3d850 ("dm: pinctrl: introduce PINCONF_RECURSIVE
option")

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl-uclass.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-uclass.c b/drivers/pinctrl/pinctrl-uclass.c
index 0b1eb7fab4..dc2340b779 100644
--- a/drivers/pinctrl/pinctrl-uclass.c
+++ b/drivers/pinctrl/pinctrl-uclass.c
@@ -157,7 +157,7 @@ static int pinconfig_post_bind(struct udevice *dev)
 
 UCLASS_DRIVER(pinconfig) = {
 	.id = UCLASS_PINCONFIG,
-#if CONFIG_IS_ENABLED(PINCONFIG_RECURSIVE)
+#if CONFIG_IS_ENABLED(PINCONF_RECURSIVE)
 	.post_bind = pinconfig_post_bind,
 #endif
 	.name = "pinconfig",
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
