Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE2059FBE4
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Aug 2022 15:44:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69E67C6410C;
	Wed, 24 Aug 2022 13:44:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC4A5C640FA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 13:44:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O9ml6W026046;
 Wed, 24 Aug 2022 15:44:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=BJbo4C6O52FUizhXMognE6mLt8Pa+WEzucVPavVy0To=;
 b=jewJy7bcECBRxPPfs6xT7ChDdBLy5oGrL3ylos0484zDeuIc5Q1D77yTUUv3X5reNdsE
 jDeYfO223FpAddxBmbq9ogAWXtV4gUf0DFtvIVmj846q7KP8LnvMtTa5+NZazVqhIOsL
 gBnkAfWBUiZu+ybXlH5jTmPibBaEshH+6jJLGBBYJi9G4KRJECRnVm2RoZ16ymvqNjIj
 cyCJuD18s5ctorKd5gFvInAR9jB1vjRin2zh5cwIss30S2ovY44cylacAAs3W0HIPR7O
 klaHADLdbLSryASxbQ2my2jWWeFcdrAr3/UTuYBY9IFXuSFChMpzV1Vlt2lsZRTX5VZC xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j52b0p21r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 15:44:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9951100034;
 Wed, 24 Aug 2022 15:44:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A2A40231529;
 Wed, 24 Aug 2022 15:44:42 +0200 (CEST)
Received: from localhost (10.75.127.117) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 24 Aug
 2022 15:44:42 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Aug 2022 15:44:40 +0200
Message-ID: <20220824134440.1091826-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-24_07,2022-08-22_02,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32: Enable CONFIG_DM_REGULATOR
	for stm32f769-disco
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

Since commit 5bc6f8c2a97e("video: stm32: remove test on CONFIG_DM_REGULATOR")
backlight was broken with the following message at boot:
stm32-display-dsi dsi@40016c00: Warning: cannot get phy dsi supply
stm32_display display-controller@40016800: panel panel enable backlight error -38

DM_REGULATOR flag must be enabled to fix this issue

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32f769-disco_defconfig     | 1 +
 configs/stm32f769-disco_spl_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
index c177bd8c73..c316ec7344 100644
--- a/configs/stm32f769-disco_defconfig
+++ b/configs/stm32f769-disco_defconfig
@@ -51,6 +51,7 @@ CONFIG_ETH_DESIGNWARE=y
 CONFIG_DW_ALTDESCRIPTOR=y
 CONFIG_MII=y
 # CONFIG_PINCTRL_FULL is not set
+CONFIG_DM_REGULATOR=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
index 7515574dfb..3c1563f140 100644
--- a/configs/stm32f769-disco_spl_defconfig
+++ b/configs/stm32f769-disco_spl_defconfig
@@ -72,6 +72,7 @@ CONFIG_ETH_DESIGNWARE=y
 CONFIG_DW_ALTDESCRIPTOR=y
 CONFIG_MII=y
 # CONFIG_PINCTRL_FULL is not set
+CONFIG_DM_REGULATOR=y
 CONFIG_SPL_PINCTRL=y
 CONFIG_SPL_RAM=y
 CONFIG_SPECIFY_CONSOLE_INDEX=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
