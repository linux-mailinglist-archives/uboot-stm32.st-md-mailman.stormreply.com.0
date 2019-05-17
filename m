Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED14218E4
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 May 2019 15:09:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24A6FC57168
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 May 2019 13:09:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0177CC05842
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2019 13:09:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HD6dWM002007; Fri, 17 May 2019 15:09:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=vCMvRtDiHQdbO1tEjjT2NqVSXPFBaxzAWZbFNNtQIxo=;
 b=fLb6QrodNFisE5sBUA6qRiOC/b/Qu8me77NKf3AGvVEih1Ae1r95IxkpfH5WYi+o3BQK
 31/QS0BL60K2robHpFFw+RNBcfdoMxu10gAWoQ0Mtdqj3lUVZmebnax9xjPd6/fkT/j/
 qFd/l+brb+684/16b9GQIy7OTgxDotUc2E+fcOYIcaI68EbYLJaFxbkfXw9uHwHjDc8J
 DVO+9VrwV6zhCabKn/CehMxE8rA51OQ6M5dljEIlk37WuBwDu/f0DtR5aigwsKVbadCm
 rRNgnbF8HDpw3mESfRTOv6gqN5SfjH8A6UER+/GMJs5XtQI58ts9tvxykZ2V9iepHLO0 Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sdn9geeqc-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 17 May 2019 15:09:00 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 658F03A;
 Fri, 17 May 2019 13:08:59 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 50EA32B1B;
 Fri, 17 May 2019 13:08:59 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 17 May
 2019 15:08:59 +0200
Received: from localhost (10.201.22.222) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 17 May 2019 15:08:58
 +0200
From: Christophe Roullier <christophe.roullier@st.com>
To: Christophe Roullier <christophe.roullier@st.com>, <u-boot@lists.denx.de>
Date: Fri, 17 May 2019 15:08:47 +0200
Message-ID: <20190517130847.13144-7-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517130847.13144-1-christophe.roullier@st.com>
References: <20190517130847.13144-1-christophe.roullier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.222]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 6/6] configs: stm32mp15: Enable Ethernet
	feature
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

This allows to enable Ethernet and use driver for
Synopsys Ethernet QoS device

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---

Changes in v2:
-remark from Joe Hershberger to replace "int interface" with "phy_interface_t interface"
 and manage return values "-1", "0" with PHY_INTERFACE_MODE_NONE and PHY_INTERFACE_MODE_MII

 configs/stm32mp15_basic_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 0ea9dff43de..7456cc9a163 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -55,6 +55,8 @@ CONFIG_LED_GPIO=y
 CONFIG_DM_MMC=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
+CONFIG_DM_ETH=y
+CONFIG_DWC_ETH_QOS=y
 CONFIG_PHY=y
 CONFIG_PHY_STM32_USBPHYC=y
 CONFIG_PINCONF=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
