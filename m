Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EE94E97D
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:39:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB9E2CA75B8
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:39:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4484ACA75B6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:39:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDWgmB002769; Fri, 21 Jun 2019 15:39:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=rrz4vrvBh4sKVUGCfvygzr/5Qt6xGSvfaE4KbHq5Hfw=;
 b=aaqV+2PniZBszfHzJnDWtsLf/upUvcPoQNHfPGWaTVzPG74/sHfSqUnlCEhtvif4Ewj5
 v85b3MOaSp+EFVQsNpiQciXFSWWdyTSW7pKeYqy4jPq4F/lFID1O74rA7pavJjNTrIbt
 4WRzbz+x4jxQpYbb/lnB/18doc4ZtFRXGO2qUH9VxLsSilmkZCEFrZTHjzDFVTt1qaoG
 xATCDbpCBNh3n/qAvUHK7Sw1Bgl6+cUR28L9LAKf7Q+O5NVVIlxxFWvXzJwiFR3v0vrE
 CNIDR6hShvMK2KPMPrximqUPNgu0a2kmEi6Rm9RY4hN9ghoalsC2530GUrBSmwVRvn/A VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813qg2t-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:39:30 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6263F4D;
 Fri, 21 Jun 2019 13:39:30 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 522382A67;
 Fri, 21 Jun 2019 13:39:30 +0000 (GMT)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 21 Jun 2019 15:39:29 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:39:25 +0200
Message-ID: <20190621133925.8643-5-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621133925.8643-1-patrice.chotard@st.com>
References: <20190621133925.8643-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 4/4] gpio: stm32: Remove .ofmatch callback
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

As compatible string "st,stm32-gpio" is no more used, .ofmatch
callback becomes useless, remove it.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

---

 drivers/gpio/stm32_gpio.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
index 5c9f2fe64d..226f350b1a 100644
--- a/drivers/gpio/stm32_gpio.c
+++ b/drivers/gpio/stm32_gpio.c
@@ -210,15 +210,9 @@ static int gpio_stm32_probe(struct udevice *dev)
 	return 0;
 }
 
-static const struct udevice_id stm32_gpio_ids[] = {
-	{ .compatible = "st,stm32-gpio" },
-	{ }
-};
-
 U_BOOT_DRIVER(gpio_stm32) = {
 	.name	= "gpio_stm32",
 	.id	= UCLASS_GPIO,
-	.of_match = stm32_gpio_ids,
 	.probe	= gpio_stm32_probe,
 #ifndef CONFIG_SPL_BUILD
 	.ops	= &gpio_stm32_ops,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
