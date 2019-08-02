Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C257FB6C
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 15:46:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2378C35E03
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 13:46:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23AA2C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 13:46:39 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72DkDAs029649; Fri, 2 Aug 2019 15:46:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=uiD7w4YMZkebAFpVh8pRsYsd/3exynhs/ilGCfcIr4M=;
 b=plmZQKRQ4XJkapRyZPkCpxYa2YKD7YbdWMz5fTyd0w5SN/ctaIVtTTUwFIn+1YbTJRC3
 Hja/4bA+McKU05WqNSYlpJVjDLqCAQHjRzXkXRDMAbbp1k+XVNEMuv94ZZyfAvAIBgpL
 i4+MV6cPI7PxleXT3WUmlDlLke4E739Ih85OyAeAfTwjw+ufjjqrAcWbbDqSpWipgqCz
 /QbZKikJ/gjKCM9I3H59LPKh/nvJRAlybIspMtYsJWLtsjvLADD6njADm2w9qK2rEtlj
 KXzgpai2nrFvtTg1rEzMN+EU64Q519ta/XQGkAX5hhTib6rR/ZAWsvSCgmqBGgpUxl8W ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u3vd07k3g-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 15:46:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D525838;
 Fri,  2 Aug 2019 13:46:35 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7D1C2C3ECE;
 Fri,  2 Aug 2019 15:46:35 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 15:46:35 +0200
Received: from localhost (10.201.23.73) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 15:46:35
 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 15:46:29 +0200
Message-ID: <20190802134629.12749-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.23.73]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH] spi: soft_spi: Fix data abort if slave is not
	probed
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

From: Christophe Kerello <christophe.kerello@st.com>

In case spi_get_bus_and_cs callback is used, spi bus is first probed
then slave devices are probed. To avoid a data abort in soft_spi probe
function, we need to check that (slave != NULL).

If slave is NULL, cs_flags and clk_flags will be initialized with
respectively GPIOD_ACTIVE_LOW and 0.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 drivers/spi/soft_spi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/soft_spi.c b/drivers/spi/soft_spi.c
index b06883f9d0..b80f810bd1 100644
--- a/drivers/spi/soft_spi.c
+++ b/drivers/spi/soft_spi.c
@@ -215,8 +215,8 @@ static int soft_spi_probe(struct udevice *dev)
 	int cs_flags, clk_flags;
 	int ret;
 
-	cs_flags = (slave->mode & SPI_CS_HIGH) ? 0 : GPIOD_ACTIVE_LOW;
-	clk_flags = (slave->mode & SPI_CPOL) ? GPIOD_ACTIVE_LOW : 0;
+	cs_flags = (slave && slave->mode & SPI_CS_HIGH) ? 0 : GPIOD_ACTIVE_LOW;
+	clk_flags = (slave && slave->mode & SPI_CPOL) ? GPIOD_ACTIVE_LOW : 0;
 
 	if (gpio_request_by_name(dev, "cs-gpios", 0, &plat->cs,
 				 GPIOD_IS_OUT | cs_flags) ||
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
