Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1B24E90A
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 967CBCA0281
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E61DCA027E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:12 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDGtfg032277; Fri, 21 Jun 2019 15:27:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=scRKMtwvh4xfqogtwoZBwzfC1p/caRej9P9riJgU45w=;
 b=shM/US+xyTkEknGrtadGx6JnT2NzuaRMUroG/tKhTNduowZjqm9O8Pkn1fZpYb4jRjtn
 nStVYUzsLKjwI6H4+ls6jWiUaJMnwfCTDhtwJELEpzpvMvl16AQTkWaIUftbBrwckean
 E7fAKLm+SIfRs3YQf2eJ/Mbwk217lqj7yNjFZY0woZ0c//kDsagNaZ6Y6FdxXYYeDUXs
 8bc1bcc507Tg4Cfy7L6b/uAHnicfQd0FylrokA9xYLH/NmGnWAlZNE9JtWih3sKa6H9g
 vekydodgJymxK80WGa5CzIvL18ObrsCfy2pyL6Wib+pVRjmAILhOXQxT02dgReB6328O ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7wxss9jc-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:11 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BDC5D58;
 Fri, 21 Jun 2019 13:27:10 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9E232A50;
 Fri, 21 Jun 2019 13:27:10 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:10 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:10
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:46 +0200
Message-ID: <1561123618-2029-8-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 08/20] gpio: stm32_gpio: Fix warnings when
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

drivers/gpio/stm32_gpio.c: In function 'stm32_offset_to_index':
: comparison between signed and unsigned integer expressions [-Wsign-compare]
    if (idx == offset)
            ^~
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/gpio/stm32f7_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/stm32f7_gpio.c b/drivers/gpio/stm32f7_gpio.c
index 5c9f2fe..e89707c 100644
--- a/drivers/gpio/stm32f7_gpio.c
+++ b/drivers/gpio/stm32f7_gpio.c
@@ -27,7 +27,7 @@
 int stm32_offset_to_index(struct udevice *dev, unsigned int offset)
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
-	int idx = 0;
+	unsigned int idx = 0;
 	int i;
 
 	for (i = 0; i < STM32_GPIOS_PER_BANK; i++) {
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
