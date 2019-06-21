Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C923A4E91B
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 986C4CA75A7
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B529CA75A4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:46 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDRhYt031633; Fri, 21 Jun 2019 15:27:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=AsviwS1IkQDvH+WngrNDkfFLZp/TlTBD/Jwbo8Y37Pc=;
 b=t3nApLluWuzvWEp76izzgypgZ3+9FyHhasOuyDrsy8iVFtvbxI4xFotElJQOgXaP7T9K
 wpRK2GLLw6BcAd4qEmEKNOa09mD0XSs4BnLl6wji6wv6g8DB7rquBdQwUdDWJ4QdgeXC
 NfOCgtF/K30T5qIv9MfY8SDKabnMX2VFMUEHN5Fw6aP8mwuGitbEez7VZZxxMm6vgU8Q
 wMtq4g8zXtUnUgDPvDlsMVFCHZmh/S0fuq0Q0IB6CQhqaDFv73bHDrCqQiagjLpUZwB6
 ckgetXXveLMf4J8NafG8uZ7aHMe4hJQ2gRjV/CftvpBrx/GyW0iA66fbUrsGJM5P6uRs lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813qe9b-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:42 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 687175D;
 Fri, 21 Jun 2019 13:27:08 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5375D2A50;
 Fri, 21 Jun 2019 13:27:08 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:08 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:06
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:44 +0200
Message-ID: <1561123618-2029-6-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 06/20] adc: stm32-adc: Fix warnings when
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

drivers/adc/stm32-adc.c: In function 'stm32_adc_chan_of_init':
warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
  if (num_channels > adc->cfg->max_channels) {
                   ^
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/adc/stm32-adc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/adc/stm32-adc.c b/drivers/adc/stm32-adc.c
index e108062..029338e 100644
--- a/drivers/adc/stm32-adc.c
+++ b/drivers/adc/stm32-adc.c
@@ -163,15 +163,16 @@ static int stm32_adc_chan_of_init(struct udevice *dev)
 	struct adc_uclass_platdata *uc_pdata = dev_get_uclass_platdata(dev);
 	struct stm32_adc *adc = dev_get_priv(dev);
 	u32 chans[STM32_ADC_CH_MAX];
-	int i, num_channels, ret;
+	unsigned int i, num_channels;
+	int ret;
 
 	/* Retrieve single ended channels listed in device tree */
-	num_channels = dev_read_size(dev, "st,adc-channels");
-	if (num_channels < 0) {
-		dev_err(dev, "can't get st,adc-channels: %d\n", num_channels);
-		return num_channels;
+	ret = dev_read_size(dev, "st,adc-channels");
+	if (ret < 0) {
+		dev_err(dev, "can't get st,adc-channels: %d\n", ret);
+		return ret;
 	}
-	num_channels /= sizeof(u32);
+	num_channels = ret / sizeof(u32);
 
 	if (num_channels > adc->cfg->max_channels) {
 		dev_err(dev, "too many st,adc-channels: %d\n", num_channels);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
