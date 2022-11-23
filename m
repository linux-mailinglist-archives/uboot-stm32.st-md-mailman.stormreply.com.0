Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2890463844A
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Nov 2022 08:12:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB344C65E4B;
	Fri, 25 Nov 2022 07:12:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96FEDC6507B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 15:20:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANDq0Eh021301; Wed, 23 Nov 2022 16:20:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=1rZLK7Qku2vvDkaLAfPAqFrJg6la2CInsvjL6xsg+0Y=;
 b=USy9M1JMa097HnXZpv/5QClb7fiN37805PuyVTrVf/pTvVbBrhEQTTPgrWWeWkIdWgjU
 c1llyyxsJON6mdxIPcRvrz2TEzVCmBHzJZ6bNEgVMTRkgim018NUqrsH0gdWFvk/KWwe
 A9xMoVNa7SrWR7CrIBTTftJY9z9Zt8sCc12fCYLlcTCr3x/4DrDixpyKwJ6RO4fIr2dz
 VJsxpCc1d4VBP5ir+jcmQIC81dWZj2yypshc0CkVa2iry9HLSNGnBUmSjMUR74Edw65e
 PBWijhpntnu72ASDqY/2Eo9hMq/Ie08BnE+isLrFMlmszo1Gz6ycFlFjqqFZGrzG/uCw kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kxrax9nby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 16:20:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 873E7100039;
 Wed, 23 Nov 2022 16:20:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7FB4322A6DF;
 Wed, 23 Nov 2022 16:20:19 +0100 (CET)
Received: from localhost (10.252.10.13) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 16:20:19 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Nov 2022 16:20:15 +0100
Message-ID: <20221123162012.1.Ifdbb454600c4e2d48e6dde70ff5354e4aaff9c17@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123152016.27936-1-olivier.moysan@foss.st.com>
References: <20221123152016.27936-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.10.13]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_08,2022-11-23_01,2022-06-22_01
X-Mailman-Approved-At: Fri, 25 Nov 2022 07:12:21 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/2] adc: stm32mp15: split channel init into
	several routines
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

Split stm32_adc_chan_of_init channel initialization function into
several routines to increase readability and prepare channel
generic binding handling.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---

 drivers/adc/stm32-adc.c | 44 +++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/adc/stm32-adc.c b/drivers/adc/stm32-adc.c
index ad8d1a32cdba..1250385fbb92 100644
--- a/drivers/adc/stm32-adc.c
+++ b/drivers/adc/stm32-adc.c
@@ -162,12 +162,8 @@ static int stm32_adc_channel_data(struct udevice *dev, int channel,
 	return 0;
 }
 
-static int stm32_adc_chan_of_init(struct udevice *dev)
+static int stm32_adc_get_legacy_chan_count(struct udevice *dev)
 {
-	struct adc_uclass_plat *uc_pdata = dev_get_uclass_plat(dev);
-	struct stm32_adc *adc = dev_get_priv(dev);
-	u32 chans[STM32_ADC_CH_MAX];
-	unsigned int i, num_channels;
 	int ret;
 
 	/* Retrieve single ended channels listed in device tree */
@@ -176,12 +172,16 @@ static int stm32_adc_chan_of_init(struct udevice *dev)
 		dev_err(dev, "can't get st,adc-channels: %d\n", ret);
 		return ret;
 	}
-	num_channels = ret / sizeof(u32);
 
-	if (num_channels > adc->cfg->max_channels) {
-		dev_err(dev, "too many st,adc-channels: %d\n", num_channels);
-		return -EINVAL;
-	}
+	return (ret / sizeof(u32));
+}
+
+static int stm32_adc_legacy_chan_init(struct udevice *dev, unsigned int num_channels)
+{
+	struct adc_uclass_plat *uc_pdata = dev_get_uclass_plat(dev);
+	struct stm32_adc *adc = dev_get_priv(dev);
+	u32 chans[STM32_ADC_CH_MAX];
+	int i, ret;
 
 	ret = dev_read_u32_array(dev, "st,adc-channels", chans, num_channels);
 	if (ret < 0) {
@@ -197,6 +197,30 @@ static int stm32_adc_chan_of_init(struct udevice *dev)
 		uc_pdata->channel_mask |= 1 << chans[i];
 	}
 
+	return ret;
+}
+
+static int stm32_adc_chan_of_init(struct udevice *dev)
+{
+	struct adc_uclass_plat *uc_pdata = dev_get_uclass_plat(dev);
+	struct stm32_adc *adc = dev_get_priv(dev);
+	unsigned int num_channels;
+	int ret;
+
+	ret = stm32_adc_get_legacy_chan_count(dev);
+	if (ret < 0)
+		return ret;
+	num_channels = ret;
+
+	if (num_channels > adc->cfg->max_channels) {
+		dev_err(dev, "too many st,adc-channels: %d\n", num_channels);
+		return -EINVAL;
+	}
+
+	ret = stm32_adc_legacy_chan_init(dev, num_channels);
+	if (ret < 0)
+		return ret;
+
 	uc_pdata->data_mask = (1 << adc->cfg->num_bits) - 1;
 	uc_pdata->data_format = ADC_DATA_FORMAT_BIN;
 	uc_pdata->data_timeout_us = 100000;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
