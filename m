Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 750347294D
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jul 2019 09:51:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 312C3C424CB
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jul 2019 07:51:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A880C424C9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2019 07:51:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6O7kWmu009638; Wed, 24 Jul 2019 09:51:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=pUjUWa0FYgtSb89I+Dbxnlf4+fsPW3oCwA9C3tu01H8=;
 b=0Seil7i4Z/O1YIxw9EZSUMN+XLcNejVEewG+apFqH7JckL8XN58p5VHoz4/1aCWjkFf9
 /XWGpOBFJprMB0v1HlczuuckEVnfAphDORTFPsLWbPASFQ7U+hOKJ/Fztr2htN3d1wXH
 bODNWJ24o2uZXLGmAFt8eFTbdWalMDW5aP0ayYIb7GgO6Yc/2kk/D8R2uDp7ZEr/kMAH
 KUkWGNmNgbEvCVEFuC1I8wFaQEGm26A5inFQnWiNpujpZ+aDcqLO02lAYtfTgsEnFHxT
 5fsApaC9V+toLshHPUe8LG9vbFNOqep2DbCPJWwmVY7VBlukJ9r4lOJge0BLt+pmNSfL Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tx607uu04-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 24 Jul 2019 09:51:08 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A2AB34;
 Wed, 24 Jul 2019 07:51:07 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4FF3824E5;
 Wed, 24 Jul 2019 07:51:07 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 24 Jul
 2019 09:51:07 +0200
Received: from localhost (10.201.23.73) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 24 Jul 2019 09:51:07
 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Jul 2019 09:51:02 +0200
Message-ID: <20190724075102.26679-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.23.73]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-24_02:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2] mmc: sti_sdhci: Fix sdhci_setup_cfg() call.
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

host->mmc, host->mmc->dev and host->mmc->priv must be set
before calling sdhci_setup_cfg() to avoid hang during mmc
initialization.

Thanks to commit 3d296365e4e8
("mmc: sdhci: Add support for sdhci-caps-mask") which put
this issue into evidence.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2:
  - move host->mmc->priv initialization before sdhci_setup_cfg() call

 drivers/mmc/sti_sdhci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/sti_sdhci.c b/drivers/mmc/sti_sdhci.c
index 8ed47e113d..d6c75ea601 100644
--- a/drivers/mmc/sti_sdhci.c
+++ b/drivers/mmc/sti_sdhci.c
@@ -97,14 +97,14 @@ static int sti_sdhci_probe(struct udevice *dev)
 		       SDHCI_QUIRK_NO_HISPD_BIT;
 
 	host->host_caps = MMC_MODE_DDR_52MHz;
+	host->mmc = &plat->mmc;
+	host->mmc->dev = dev;
+	host->mmc->priv = host;
 
 	ret = sdhci_setup_cfg(&plat->cfg, host, 50000000, 400000);
 	if (ret)
 		return ret;
 
-	host->mmc = &plat->mmc;
-	host->mmc->priv = host;
-	host->mmc->dev = dev;
 	upriv->mmc = host->mmc;
 
 	return sdhci_probe(dev);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
