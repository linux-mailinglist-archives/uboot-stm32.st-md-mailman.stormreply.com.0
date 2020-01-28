Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9262C14B1F6
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 10:44:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B997C36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 09:44:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 767D9C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:44:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S9hK6r010484; Tue, 28 Jan 2020 10:44:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=x9CFJQtZPiNPgughCKX/bMf7kh0GOufr4nFnMIiNyBw=;
 b=LV0PAUyrKA1vSGrWp+vAAC/YtpIY+oDrLByJqXq6adi/8fOxo6R0rnusyAuistrkWaVY
 dZF6akBcOaeqNYSCKCZLglYxIw9xIaIOA4fbYjN5V8WBZN1MRCgFGLnVtojeUja/W6Uu
 WQMPzghBBYAttUa2AHfOGYimzvP2YYGhna9kp4aEVE6kdiDfkRV8d7kTPiDrOAVSWiqH
 iZuh3d5rNotJkfI5R1afQhn9RuttRdcOdNcWKWWpIx1O6/R+Xt66cD3rEHMeQZpciuiT
 2/+NN/C58yTPC6MFRxA5JZkVW4Dvv5C2l0xz9g4jwERKM+OSE1FTM/3p3xrhPmH0HYQd dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpawaam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:44:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2EF7310003D;
 Tue, 28 Jan 2020 10:44:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28A0621CA8C;
 Tue, 28 Jan 2020 10:44:20 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 10:44:19 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jan 2020 10:44:14 +0100
Message-ID: <20200128094415.5768-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128094415.5768-1-patrick.delaunay@st.com>
References: <20200128094415.5768-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/4] pinctrl: stmfx: update the result type of
	dm_i2c_reg_read
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

Use int as result of dm_i2c_reg_read to avoid warning with
W=1 (warning: comparison is always false due to limited range
of data type [-Wtype-limits])

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl-stmfx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 0b5a0433cd..0def27166e 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -351,11 +351,12 @@ static int stmfx_chip_init(struct udevice *dev)
 	int ret;
 	struct dm_i2c_chip *chip = dev_get_parent_platdata(dev);
 
-	id = dm_i2c_reg_read(dev, STMFX_REG_CHIP_ID);
-	if (id < 0) {
-		dev_err(dev, "error reading chip id: %d\n", id);
+	ret = dm_i2c_reg_read(dev, STMFX_REG_CHIP_ID);
+	if (ret < 0) {
+		dev_err(dev, "error reading chip id: %d\n", ret);
 		return ret;
 	}
+	id = (u8)ret;
 	/*
 	 * Check that ID is the complement of the I2C address:
 	 * STMFX I2C address follows the 7-bit format (MSB), that's why
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
