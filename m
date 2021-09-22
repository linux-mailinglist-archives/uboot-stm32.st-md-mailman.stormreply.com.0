Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5F414E1C
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 18:29:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11E98C5A4CC;
	Wed, 22 Sep 2021 16:29:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F10DC5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 16:29:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18MDOW0j004931; 
 Wed, 22 Sep 2021 18:29:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=9TMnvKWc2GBZTU1KIZRpbjiunWgjDnwhgrVHuXspYVg=;
 b=loU0xgbQYvc6TnbhbOqSguK692H5lVYoh2HYWKbNXG97TrWeewfiuSxLXwd2C8zowlJ3
 EheBsz7xbYkkK10jlrwRyUswtwppJV+4KwUNNPo5hcApH+SIp4VzIaEwJ8LAZGHGf8Kv
 3Emno4xHZE4TiS6K3xrHuOOJmup1oQnKKJ7noUAGeGpEyW2mi7BDGXnne2Ug387qWPno
 QSbHQEE8uU7b3V92lHXnRuUVIuNBOptlibom5VZRnkWAHK4+CsT1+ci8TETxRqeaLc/U
 kDZcq9KbARy3sLgr6ZPtSfMbQbEliKmQ903U/PCRV9531qNCMCu9OdY/QKSpq/13Hu4S NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b81gs2k51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 18:29:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 98A8910002A;
 Wed, 22 Sep 2021 18:29:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7300F24A55D;
 Wed, 22 Sep 2021 18:29:11 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 22 Sep 2021 18:29:10
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Sep 2021 18:29:06 +0200
Message-ID: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-22_06,2021-09-22_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH v4 0/2] mtd: spi: nor: force mtd name to
	"nor%d"
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


This serie is a V4 for [1].

Now the SPI nor are named "norN" with N after the CFI nor device:
"nor0" to "norM" => N= M+1.

See also an other proposal from Marek (not working after test)
"mtd: spi-nor: Fix SF MTDIDS when registering multiple MTDs with
DM enabled"

http://patchwork.ozlabs.org/project/uboot/list/?series=262362

The first patch of the serie fixed the compilation issues around
'cfi_flash_num_flash_banks' found in CI:

https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/9138

[1] Series: mtd: spi: nor: force mtd name to "nor%d"
http://patchwork.ozlabs.org/project/uboot/list/?series=262632&state=*
http://patchwork.ozlabs.org/project/uboot/list/?series=262017&state=*
http://patchwork.ozlabs.org/project/uboot/list/?series=262013&state=*

Patrick


Changes in v4:
- introduce macro MTD_NAME_SIZE for mtd_name size and use MTD_DEV_TYPE
  to retrieved the "nor" string.

Changes in v3:
- NEW: solve compilation issue when CONFIG_SYS_MAX_FLASH_BANKS is used
- start index after the last CFI device, use CONFIG_SYS_MAX_FLASH_BANKS

Changes in v2:
- correct commit message

Patrick Delaunay (2):
  mtd: cfi_flash: use cfi_flash_num_flash_banks only when supported
  mtd: spi: nor: force mtd name to "nor%d"

 drivers/mtd/spi/spi-nor-core.c | 17 ++++++++++++++---
 include/dm/device.h            |  3 ++-
 include/linux/mtd/spi-nor.h    |  2 ++
 include/mtd.h                  |  4 ++++
 include/mtd/cfi_flash.h        |  8 +++++++-
 5 files changed, 29 insertions(+), 5 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
