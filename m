Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0851DED05
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 15:02:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A1C1C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 13:02:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6D1EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2019 13:02:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9LD0t5M025041; Mon, 21 Oct 2019 15:02:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=pHj6i7JwV+UMOcaxjaRkAfP2IuSM0tYtK1F1xntyadA=;
 b=LhMjoCH1mXfbM5c7B/+zmvt6rBsGH2d3UGwp+1dUcQGmhUH7UifaWWyzS5aQZQLlgPma
 Ww1ifzfl5Z7tVAl9bGk67OPAQSS3RVX0AJEBVvUoWxUr76+BxhwwTXDk+gNh05uf+zzU
 tq17GkIaePw8K2xmF7Pk+tX5ZZM6aZGZQqAJMohKcPTmoNpfrgXxY9v1nqrwObkakpTk
 AApOyz/4M5RZTVO0Rwgn33zf2rESikwwYWD1JtKAx0qkoRym78TPfmUfxoX2erayrg9I
 2Tqd3LHwqpPYZlWlKmoYbEbsl1WVKWJwqL55k+hmd6TheHkIHtbSBGwd8ET/4xAsiQF8 GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vqr8w23r3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2019 15:02:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A459510002A;
 Mon, 21 Oct 2019 15:02:43 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83D332FF5E0;
 Mon, 21 Oct 2019 15:02:43 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 21 Oct
 2019 15:02:43 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 21 Oct 2019 15:02:42
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 21 Oct 2019 15:02:40 +0200
Message-ID: <20191021130240.31808-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_04:2019-10-21,2019-10-21 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [Uboot-stm32] [PATCH v2] dm: pinctrl: fix for introduce
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

Correct the name of the define used CONFIG_IS_ENABLED which is
not aligned with Kconfig name: CONFIG_$(SPL_)PINCONF_RECURSIVE.

The recursive calls is conditional only for UCLASS_PINCONFIG
"pinconfig" driver.
It is always needed to call pinctrl_post_bind for UCLASS_PINCTRL
"pinctrl", the test CONFIG_IS_ENABLED(PINCONF_RECURSIVE) need to
be removed for this driver.

This correct a regression introduced because the same patch is
applied twice times in u-boot-dm branch:
- commit e878b53a79d1 ("dm: pinctrl: introduce PINCONF_RECURSIVE
  option")
- commit c20851b3d850 ("dm: pinctrl: introduce PINCONF_RECURSIVE
  option")

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
Hi,

This patch solve regression on stm32mp157c-ev1 board (boot failed)
on master branch since Merge tag 'dm-pull-15oct19' of
https://gitlab.denx.de/u-boot/custodians/u-boot-dm

The V1 patch was a partial solution, it solve the first issue
detected on sandbox.

Regards

Patrick

Changes in v2:
- update a second error after tests: don't remove post bind ops for
  pinctrl driver.

 drivers/pinctrl/pinctrl-uclass.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-uclass.c b/drivers/pinctrl/pinctrl-uclass.c
index 0b1eb7fab4..761ee29f41 100644
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
@@ -426,9 +426,7 @@ static int __maybe_unused pinctrl_post_bind(struct udevice *dev)
 
 UCLASS_DRIVER(pinctrl) = {
 	.id = UCLASS_PINCTRL,
-#if CONFIG_IS_ENABLED(PINCONF_RECURSIVE)
 	.post_bind = pinctrl_post_bind,
-#endif
 	.flags = DM_UC_FLAG_SEQ_ALIAS,
 	.name = "pinctrl",
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
