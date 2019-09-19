Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C908B7EA6
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Sep 2019 17:57:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBA2BC36B3F
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Sep 2019 15:57:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8448C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Sep 2019 15:50:17 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8JFaL0M013146; Thu, 19 Sep 2019 17:50:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=YGxDs2A3zHvodPtTV9a4mFhuoyq9ymtVNDvQGw2SJbc=;
 b=RQ8mGSA1aNRjvf7ktD0YM7Orotp0LYV3EBxLPVdwA84EiFeQL8XoSEuiDRfweL80Gctn
 wJ8/UHr3yd3d4ZSeNNFQnSY1lgY+WcnSHdgeX07osF8ry7LBvrruJ1xaQUbji3Qh8iSX
 shrwyV9YHhdDxfdRvfBlufLBiDl3vUriJlXxxmUWBF3wTjQRhLsQzFRnOWpNEoblSfzT
 p80h0JpSn4c0k4y9vUrftmJFuCqH/gjTsOwqTgiyLMp5lqBpSp4ww3S/FfD1rKappIs8
 x8qIa0FYaUW5WjfE1SqBrp65qSaXvxM/v/QRn2TekFzzZDe2KoYOl4Rt8iBPMKhqASKq Vg== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v3vc4d7bm-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 19 Sep 2019 17:50:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D057023;
 Thu, 19 Sep 2019 15:50:10 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92A772BCDDF;
 Thu, 19 Sep 2019 17:50:10 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 19 Sep
 2019 17:50:10 +0200
Received: from localhost (10.48.1.208) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Thu, 19 Sep 2019 17:50:09 +0200
From: Yann Gautier <yann.gautier@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 Sep 2019 17:50:05 +0200
Message-ID: <20190919155005.1848-2-yann.gautier@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919155005.1848-1-yann.gautier@st.com>
References: <20190919155005.1848-1-yann.gautier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.208]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-19_05:2019-09-19,2019-09-19 signatures=0
X-Mailman-Approved-At: Thu, 19 Sep 2019 15:57:32 +0000
Cc: Peng
 Fan <peng.fan@nxp.com>, Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] mmc: stm32_sdmmc2: implement
	host_power_cycle callback
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

For the correct power cycle sequence with stm32_sdmmc2, the write of the
power cycle value in PWRCTL field of SDMMC_POWER register is now done in
stm32_sdmmc2_host_power_cycle() and no more in stm32_sdmmc2_pwrcycle().

Signed-off-by: Yann Gautier <yann.gautier@st.com>
---

 drivers/mmc/stm32_sdmmc2.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index 32434a4762..1726ed72ef 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -524,8 +524,6 @@ static void stm32_sdmmc2_pwrcycle(struct stm32_sdmmc2_priv *priv)
 		return;
 
 	stm32_sdmmc2_reset(priv);
-	writel(SDMMC_POWER_PWRCTRL_CYCLE | priv->pwr_reg_msk,
-	       priv->base + SDMMC_POWER);
 }
 
 /*
@@ -619,10 +617,21 @@ static int stm32_sdmmc2_getcd(struct udevice *dev)
 	return 1;
 }
 
+static int stm32_sdmmc2_host_power_cycle(struct udevice *dev)
+{
+	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
+
+	writel(SDMMC_POWER_PWRCTRL_CYCLE | priv->pwr_reg_msk,
+	       priv->base + SDMMC_POWER);
+
+	return 0;
+}
+
 static const struct dm_mmc_ops stm32_sdmmc2_ops = {
 	.send_cmd = stm32_sdmmc2_send_cmd,
 	.set_ios = stm32_sdmmc2_set_ios,
 	.get_cd = stm32_sdmmc2_getcd,
+	.host_power_cycle = stm32_sdmmc2_host_power_cycle,
 };
 
 static int stm32_sdmmc2_probe(struct udevice *dev)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
