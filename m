Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A09213CAF
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 17:37:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 926DCC36B24
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 15:37:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61B94C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 15:37:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 063FXAxa029282; Fri, 3 Jul 2020 17:37:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=xH6592N2LYwTXVjGalymmvENfuE4mbqnsctecC1C9DY=;
 b=qXN5iRBjHG7aK13tCpe6fyOEtla/TjU3gQSdr8F2PJe11SCbZrs17Ysgbp7oIRmKTJEg
 02sIAH5X0Fkj+Y3bvSQ5YFt+lIkRZannMKjFo5Dc8fvP3/1cEQ8q19iAoYDnFM7XaiP5
 AlhvN9EQ/3cCc3otZ+BOxQjdyNGPS5otIDoN+n8vsadxnopEswoHy+9ejD7GhsKOy6rz
 boUdiyqszk26zYO+GQw1mNev08OGDS0L5Big+K83yEvdughfgVePN27tpYBv38qI+xjZ
 hTnBP4TqCRWOhfEiTvnXyCUT05uhOdWY2ZqYaYTMKiIvFrfRK13iUQ67MtH8DR6pZbht Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0gqjb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 17:37:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8E7C10002A;
 Fri,  3 Jul 2020 17:37:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D12E52AA26A;
 Fri,  3 Jul 2020 17:37:02 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 3 Jul 2020 17:37:02 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Jul 2020 17:36:44 +0200
Message-ID: <20200703153646.28533-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703153646.28533-1-patrick.delaunay@st.com>
References: <20200703153646.28533-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_10:2020-07-02,
 2020-07-03 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 5/7] ata: dwc-ahci: change trace level for
	phy errors managed by uclass
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

As the error message is now displayed by generic phy functions,
the pr_err can be change to pr_debug.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

(no changes since v1)

 drivers/ata/dwc_ahci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/dwc_ahci.c b/drivers/ata/dwc_ahci.c
index 017650ae46..3c2a3ac201 100644
--- a/drivers/ata/dwc_ahci.c
+++ b/drivers/ata/dwc_ahci.c
@@ -62,13 +62,13 @@ static int dwc_ahci_probe(struct udevice *dev)
 
 	ret = generic_phy_init(&phy);
 	if (ret) {
-		pr_err("unable to initialize the sata phy\n");
+		pr_debug("unable to initialize the sata phy\n");
 		return ret;
 	}
 
 	ret = generic_phy_power_on(&phy);
 	if (ret) {
-		pr_err("unable to power on the sata phy\n");
+		pr_debug("unable to power on the sata phy\n");
 		return ret;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
