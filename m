Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7A47153A
	for <lists+uboot-stm32@lfdr.de>; Tue, 23 Jul 2019 11:31:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8215C58499
	for <lists+uboot-stm32@lfdr.de>; Tue, 23 Jul 2019 09:31:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 039CBC57DFD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2019 09:31:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6N9R1nQ018688; Tue, 23 Jul 2019 11:31:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=5x6KfWkmKMLUSIf+NR5xqqc4iNkSj7iuYVVTOGxow30=;
 b=h8iQcC5NH9D7BCfoykGIX9EGkKLmY/B2/+8WRium6wXE3QngnyAKqQlcFLu+2Tz1a3rO
 7tKbFJ84FCtw3sYRvd6KQYow7QFxGGHAMsNTJ9hOoc6mNHjLqbecpWt9flqYTW2oWDpp
 ijJTFRZZy9a27xbqJ5OhwEXpNhlSLgYLa1M32dCCOd1MCZYARdaeDV2GssggjUgDUR0l
 tL2lKgwK93D42Zbqb1xOrxBLqT1CvkP/ZmfNfAXmphd8Iqfva2romfyrIoNno4ZKsn/5
 hZxnHaeqkPuiBRBt/Bm/5bjrSoGdsWp64TXLiTQ9L8iJ2yA1T44LaElx6BpUt3PS9vUO hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ture1gm7d-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 23 Jul 2019 11:31:44 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5AB9E38;
 Tue, 23 Jul 2019 09:31:43 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24C8528B1;
 Tue, 23 Jul 2019 09:31:43 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 23 Jul
 2019 11:31:42 +0200
Received: from localhost (10.201.23.73) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 23 Jul 2019 11:31:42
 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 23 Jul 2019 11:31:28 +0200
Message-ID: <20190723093128.22007-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.23.73]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] mmc: sti_sdhci: Fix sdhci_setup_cfg() call.
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

host->mmc and host->mmc->dev must be set before calling
sdhci_setup_cfg() to avoid hang during mmc initialization.

Thanks to commit 3d296365e4e8
("mmc: sdhci: Add support for sdhci-caps-mask") which put
this issue into evidence.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 drivers/mmc/sti_sdhci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/sti_sdhci.c b/drivers/mmc/sti_sdhci.c
index 8ed47e113d..c7f1947edd 100644
--- a/drivers/mmc/sti_sdhci.c
+++ b/drivers/mmc/sti_sdhci.c
@@ -97,14 +97,14 @@ static int sti_sdhci_probe(struct udevice *dev)
 		       SDHCI_QUIRK_NO_HISPD_BIT;
 
 	host->host_caps = MMC_MODE_DDR_52MHz;
+	host->mmc = &plat->mmc;
+	host->mmc->dev = dev;
 
 	ret = sdhci_setup_cfg(&plat->cfg, host, 50000000, 400000);
 	if (ret)
 		return ret;
 
-	host->mmc = &plat->mmc;
 	host->mmc->priv = host;
-	host->mmc->dev = dev;
 	upriv->mmc = host->mmc;
 
 	return sdhci_probe(dev);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
