Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA7A1A4780
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 16:34:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BB76C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 14:34:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7713C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 14:34:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03AESH0u027092; Fri, 10 Apr 2020 16:34:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=57qDscKNP+cKSW0VOOVLwN8XJizX0zNbx2aES4Acy0E=;
 b=nvNYNWtUnCYlrMhrehDaLPGjSnbVvYkAWwGqJU2PA90CdhAXab+HjF9AG1Ci9rRla6J/
 ZbDTWiZyMErWY94WjXgmJ91M2LQ4HL4d7PSyI790F1d8W1QW9xB7dWgiAod+C16LfbvT
 u0x8sx0nv2QfsDrcF03QVCqv3fNLtjQCAq8eLFU3VMSfY0edmTd8qhWuxs4A6JcGZigW
 ztL267cVEm84Uk8NCnQj2UaE0yeyr20QNHJ8eylMTqxFKR+FneYBwdku3NGSP6XBPAoF
 HMby/pLeax10lw4CZVr3Q3opPyNJRfL6275ymyIh8MofhdPMR/I1k1T+95V+QjpOdLMU gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091k78xjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2020 16:34:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A173100034;
 Fri, 10 Apr 2020 16:34:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A1C32BF9C6;
 Fri, 10 Apr 2020 16:34:46 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 10 Apr 2020 16:34:45 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 Apr 2020 16:34:40 +0200
Message-ID: <20200410163403.1.I3190d9b77167a808c65f44883fd1bc1c1d15218a@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-10_05:2020-04-09,
 2020-04-10 signatures=0
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Thomas Hebb <tommyhebb@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: [Uboot-stm32] [PATCH 1/3] cosmetic: README: Fix one CONFIG name
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

Only replace CONFIF_ by CONFIG_

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 8cfa92fac9..6cb7656fa0 100644
--- a/README
+++ b/README
@@ -1640,7 +1640,7 @@ The following options need to be configured:
 		  - CONFIG_SYS_RCAR_I2C2_SPEED for for the speed channel 2
 		  - CONFIG_SYS_RCAR_I2C3_BASE for setting the register channel 3
 		  - CONFIG_SYS_RCAR_I2C3_SPEED for for the speed channel 3
-		  - CONFIF_SYS_RCAR_I2C_NUM_CONTROLLERS for number of i2c buses
+		  - CONFIG_SYS_RCAR_I2C_NUM_CONTROLLERS for number of i2c buses
 
 		- drivers/i2c/sh_i2c.c:
 		  - activate this driver with CONFIG_SYS_I2C_SH
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
