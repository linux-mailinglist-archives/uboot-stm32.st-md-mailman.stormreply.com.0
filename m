Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C077E16227C
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 09:38:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CB2DC36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 08:38:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B85CC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 08:38:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01I8cXSc007897; Tue, 18 Feb 2020 09:38:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=UQbn9VHvYX/uAzxtu0yfX4150ag+T2acRAb0gQSrQNQ=;
 b=I3LY7SPatpBtLIaczDxR09xbwNOcOxdCbRQq1dzTE/1Euna4lezQyzZXCa0eAwMEbbc+
 umSxtpCdlXjVKyHMNBdW4oWeZ4EIhiM06IR0RxnV8d3AyBDlc79QmE8yjGl0nvAWd0UH
 AkoTAoMxsO9aZmICPmzbCFoSgPfs6ZvxF3soxmqy63qz7I2eqwXd01IP0DUm9HJaHWx7
 vCWDYBSef6PyAOwGE9ju3YpVwtmxBGJGvXt4tlABo09jD/zC9nKHK4BEitFgDiYVSTaK
 46/yFbPvZbPMT0/5/F0tXEt34Ir704RmUz06wTqj2yrLoo9VzrRze2ntgKRb7B1QONNC cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y68dp7un4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 09:38:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D97410003E;
 Tue, 18 Feb 2020 09:38:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 05D1821F692;
 Tue, 18 Feb 2020 09:38:47 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 18 Feb 2020 09:38:46 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 Feb 2020 09:38:35 +0100
Message-ID: <20200218083836.6369-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218083836.6369-1-patrick.delaunay@st.com>
References: <20200218083836.6369-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_01:2020-02-17,
 2020-02-18 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 7/8] ata: dwc-ahci: change trace level for
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

Changes in v2: None

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
