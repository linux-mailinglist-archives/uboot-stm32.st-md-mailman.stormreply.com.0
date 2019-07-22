Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 479196FC5D
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 11:41:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F43FCCA76B
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 09:41:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C160DCCA76A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 09:41:16 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6M9f72b010476; Mon, 22 Jul 2019 11:41:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=3DRLIdweRJEdXv3AlboQUoGrDwdAqmJHev+9G3vvId4=;
 b=vc3GJTOmqnOgsFRDFZUbjNuJ9Sg851PWo1d4Wqmaf+AjjQRaVZlJ7IWrNLjligpnEFcd
 0K0vJa3b55XLSdoXQkpkMNh8LTrF4PesSyDENk4vxPIRdL0WejUN5QBzn0P51djDU8nS
 z4n03eqkJm5pxP6p1n9E9+esnqBIfkWtOqxRr9BtWdrGw5lrb2Wgp1clmYRQre47R0fZ
 hWXgzLenLo3sgpUXw/twf0s5lXwexXKfsMKZ+p5ivkUMBDg4zEdHIimy7lUhnHN+A6UI
 bxl3G/AUF8ZEls6iRLku3gRuA0rfeAdA3T0DlOd9oDkuyZ3P+B4OpUQ4DtbsMubAivcN CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tuw7w1mnx-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 11:41:14 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6033F3A;
 Mon, 22 Jul 2019 09:41:13 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 33DBE28CF;
 Mon, 22 Jul 2019 09:41:13 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul
 2019 11:41:13 +0200
Received: from localhost (10.201.23.73) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul 2019 11:41:12
 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 22 Jul 2019 11:41:10 +0200
Message-ID: <20190722094110.7789-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.23.73]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] mmc: stm32_sdmmc2: Increase
	SDMMC_BUSYD0END_TIMEOUT_US
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

Increase SDMMC_BUSYD0END_TIMEOUT_US from 1s to 2s to
avoid timeout error during blocks erase on some sdcard

Issue seen on Kingston 16GB :
  Device: STM32 SDMMC2
  Manufacturer ID: 27
  OEM: 5048
  Name: SD16G
  Bus Speed: 50000000
  Mode: SD High Speed (50MHz)
  card capabilities: widths [4, 1] modes [SD Legacy, SD High Speed (50MHz)]
  host capabilities: widths [4, 1] modes [MMC legacy, SD Legacy, MMC High Speed (26MHz), SD High Speed (50MHz), MMC High Speed (52MHz)]
  Rd Block Len: 512
  SD version 3.0
  High Capacity: Yes
  Capacity: 14.5 GiB
  Bus Width: 4-bit
  Erase Group Size: 512 Bytes

Issue reproduced with following command:

STM32MP> mmc erase 0 100000

MMC erase: dev # 0, block # 0, count 1048576 ... mmc erase failed
16384 blocks erased: ERROR

By by setting SDMMC_BUSYD0END_TIMEOUT_US at 2 seconds and by adding
time measurement in stm32_sdmmc2_end_cmd() as shown below:

	+start = get_timer(0);
	/* Polling status register */
	ret = readl_poll_timeout(priv->base + SDMMC_STA,
				 status, status & mask,
 				 SDMMC_BUSYD0END_TIMEOUT_US);

	+printf("time = %ld ms\n", get_timer(start));

We get the following trace:

STM32MP> mmc erase 0  100000

MMC erase: dev # 0, block # 0, count 1048576 ...
time = 17 ms
time = 1 ms
time = 1025 ms
time = 54 ms
time = 56 ms
time = 1021 ms
time = 57 ms
time = 56 ms
time = 1020 ms
time = 53 ms
time = 57 ms
time = 1021 ms
time = 53 ms
time = 57 ms
time = 1313 ms
time = 54 ms
time = 56 ms
time = 1026 ms
time = 54 ms
time = 56 ms
time = 1036 ms
time = 54 ms
time = 56 ms
time = 1028 ms
time = 53 ms
time = 56 ms
time = 1027 ms
time = 54 ms
time = 56 ms
time = 1024 ms
time = 54 ms
time = 56 ms
time = 1020 ms
time = 54 ms
time = 57 ms
time = 1023 ms
time = 54 ms
time = 56 ms
time = 1033 ms
time = 53 ms
time = 57 ms
....
time = 53 ms
time = 57 ms
time = 1021 ms
time = 56 ms
time = 56 ms
time = 1026 ms
time = 54 ms
time = 56 ms
1048576 blocks erased: OK

We see that 1 second timeout is not enough, we also see one measurement
up to 1313 ms. Set the timeout to 2 second to keep a security margin.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 drivers/mmc/stm32_sdmmc2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index 867ed569eb..0ade1b160e 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -190,7 +190,7 @@ struct stm32_sdmmc2_ctx {
 #define SDMMC_IDMACTRL_IDMAEN		BIT(0)
 
 #define SDMMC_CMD_TIMEOUT		0xFFFFFFFF
-#define SDMMC_BUSYD0END_TIMEOUT_US	1000000
+#define SDMMC_BUSYD0END_TIMEOUT_US	2000000
 
 static void stm32_sdmmc2_start_data(struct stm32_sdmmc2_priv *priv,
 				    struct mmc_data *data,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
