Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 749A8552206
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jun 2022 18:13:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CE09C5E2C6;
	Mon, 20 Jun 2022 16:13:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7EF2C5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 16:13:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25KDrHNN025790;
 Mon, 20 Jun 2022 18:13:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=JPnC6/zpvXuvakgAn+FveV8QRpeMuvxMheBp46wJxBk=;
 b=1hlRniV8H86n4YwdVaQ7rIqYvIz45Cxmh7lhECugNNMfbF7DA/lihdhxoomHx4JxWq9Z
 w+kn2XC6H8fUyDov8rlT1dfMRULikp6MWUtA4r4XIMox2wIcbW4DDkTP99fHvKmQH+rz
 TWjdCd0uyKoG2sVetp4viiY3aENcj6s/JgsoAfBeOe2XBY9Vo1+eiX9/Qw2vHns5Zi2U
 1B1hOg0xU/TNKbc1HoIXgRfwsgIUjDkNKiFd0I+4bNSYC4hGxyLTCQMKq778HsIryCNW
 A0d2mrkBoDyB/50pPYMW11sZJAdvXwejn7kF48YHyQ1ySzUFZPnllG8iEJjD2WpCjlr+ hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gtntu2qbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 18:13:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 853BD10002A;
 Mon, 20 Jun 2022 18:13:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A8B322FA55;
 Mon, 20 Jun 2022 18:13:47 +0200 (CEST)
Received: from localhost (10.75.127.116) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 18:13:47 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Jun 2022 18:13:43 +0200
Message-ID: <20220620181341.1.Idba00f2816d362a1675c8c74eac80400cb2e4de7@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/3] mmc: stm32_sdmmc2: cosmetic: rename
	stm32_sdmmc_bind
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

Rename stm32_sdmmc_bind to stm32_sdmmc2_bind as all oter function
in SDMMCv2 driver

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/mmc/stm32_sdmmc2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index 81b07609a91..e3853b7fbfb 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -763,7 +763,7 @@ clk_free:
 	return ret;
 }
 
-static int stm32_sdmmc_bind(struct udevice *dev)
+static int stm32_sdmmc2_bind(struct udevice *dev)
 {
 	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
 
@@ -781,7 +781,7 @@ U_BOOT_DRIVER(stm32_sdmmc2) = {
 	.of_match = stm32_sdmmc2_ids,
 	.ops = &stm32_sdmmc2_ops,
 	.probe = stm32_sdmmc2_probe,
-	.bind = stm32_sdmmc_bind,
+	.bind = stm32_sdmmc2_bind,
 	.priv_auto	= sizeof(struct stm32_sdmmc2_priv),
 	.plat_auto	= sizeof(struct stm32_sdmmc2_plat),
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
