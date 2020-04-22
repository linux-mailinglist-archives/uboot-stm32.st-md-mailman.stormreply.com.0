Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 120341B4528
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 14:29:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C642FC36B14
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 12:29:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8F31C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:29:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MCEBWB031946; Wed, 22 Apr 2020 14:29:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=HUyrCh2aBpM1FRk7Y3eQOUoEvZftLKtaPqb97a2Nhkw=;
 b=V+IXW1KsTITfTK12l6L3pAqI381fmGqMf86A4S47IUq33193z/oGOvZ50RkqlucmG5dN
 0Br30mNckzYWUacbA3HSMmNBohOw/azdDmdP+leKnfcJV5ZX/QgbR2ubis8/RWt2+I0i
 qtKpeLHXf/xiP+mQB6NJT8ZlZz1R+PFJ917h8Kf9iy1YL4KwqjR1ql/CTPQe1bJ13uNI
 FaiKjCoXHYrhOhxS/gWRp2qseFkr/XXfGjWb7FIgMTJLDLYRjFaNNCICQmhEasIl3nLF
 c6D79DLqme9d08PuMtiClqsMZ4gQK8Mwdl7PTBcvrAxAOXdr9ckEZbgrkVavzVXEnBwn Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq11pcf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:29:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E7DB10002A;
 Wed, 22 Apr 2020 14:29:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 238372AE6C5;
 Wed, 22 Apr 2020 14:29:30 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 22 Apr 2020 14:29:29 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Apr 2020 14:29:19 +0200
Message-ID: <20200422142834.v2.11.I7cedf843510610b1a89f70db103e9f4c3e264560@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422122920.19340-1-patrick.delaunay@st.com>
References: <20200422122920.19340-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 11/12] configs: stm32mp1: activate Ethernet
	PHY Realtek
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

From: Christophe Roullier <christophe.roullier@st.com>

Need Realtek driver to manage in RTL8211F the configuration of the LED.
Initialize LCR (LED Control Register) to configure green LED for Link,
yellow LED for Active

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index c8f1780cab..9a16ada428 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -98,6 +98,7 @@ CONFIG_SPI_FLASH_WINBOND=y
 # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
 CONFIG_SPI_FLASH_MTD=y
 CONFIG_SPL_SPI_FLASH_MTD=y
+CONFIG_PHY_REALTEK=y
 CONFIG_DM_ETH=y
 CONFIG_DWC_ETH_QOS=y
 CONFIG_PHY=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index d22605f398..8085d28772 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -84,6 +84,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
 CONFIG_SPI_FLASH_MTD=y
+CONFIG_PHY_REALTEK=y
 CONFIG_DM_ETH=y
 CONFIG_DWC_ETH_QOS=y
 CONFIG_PHY=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
