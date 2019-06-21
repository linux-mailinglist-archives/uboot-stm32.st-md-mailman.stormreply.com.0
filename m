Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A54B44E918
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74E1ACA4C96
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29B78CA0298
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDRHEM031159; Fri, 21 Jun 2019 15:27:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=lxO69YzjfDc1h0IYAmj1Aqp2VMWJL8cUDzP+v4Ckji8=;
 b=R+BHgw59K0VWuaEKvJSS/oWqd21EkBiKoCKpbjnh2LVRg2IM7xvxRVrfr2cBczCu9jsl
 aOVEYAmx8gaIrXAv5bPP1kRkZc4WOYmxP4Xh4mE2grxoHyQeNw4wV3gYzMwuB7LqswB9
 6uka8OwxUk1KBSHrZ7UFdATIbJ1t0/YJQoKPLfTJLH9AiVW0FhTpfSOywOo4rbtFa6BW
 1AV8DZWGqntZ1g4oKzhaFeZtzyIoDgNoIWTAbFifVau5fWBjqDVk2EU0R8OUTLvzgp3n
 g5U/4iA/1hP+EvErcD1gzZIgK9yFHr/1NCs1LsomNQ57ztQpG6h2D+LsOe1tmHufUzoB Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813qeac-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4053B3A;
 Fri, 21 Jun 2019 13:27:18 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 306652A50;
 Fri, 21 Jun 2019 13:27:18 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:17 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:17
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:52 +0200
Message-ID: <1561123618-2029-14-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 14/20] pinctrl: pinctrl_stm32: Fix warnings
	when compiling with W=1
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

warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
    if (*idx < 0)
             ^
drivers/pinctrl/pinctrl_stm32.c: At top level:
warning: no previous prototype for 'stm32_pinctrl_probe' [-Wmissing-prototypes]
 int stm32_pinctrl_probe(struct udevice *dev)
     ^~~~~~~~~~~~~~~~~~~

Signed-off-by: Patrice CHOTARD <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl_stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index 43dbdd9..a59b8ca 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -136,7 +136,7 @@ static struct udevice *stm32_pinctrl_get_gpio_dev(struct udevice *dev,
 			 */
 			*idx = stm32_offset_to_index(gpio_bank->gpio_dev,
 						     selector - pin_count);
-			if (*idx < 0)
+			if (IS_ERR_VALUE(*idx))
 				return NULL;
 
 			return gpio_bank->gpio_dev;
@@ -215,7 +215,7 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 
 #endif
 
-int stm32_pinctrl_probe(struct udevice *dev)
+static int stm32_pinctrl_probe(struct udevice *dev)
 {
 	struct stm32_pinctrl_priv *priv = dev_get_priv(dev);
 	int ret;
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
