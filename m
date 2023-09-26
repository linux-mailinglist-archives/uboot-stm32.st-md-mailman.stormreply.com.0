Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E437AEF37
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Sep 2023 17:09:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE268C6B474;
	Tue, 26 Sep 2023 15:09:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC6E0C6B473
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 15:09:32 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38QAmIUD000848; Tue, 26 Sep 2023 17:09:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=6EfKPf1SUh9OAnat34kiws77ZDQQD0kQqIjNOacqndE=; b=QI
 PWB6LPyMQRSHGTtsxVTDx0cOpOi02/XB9Vb7WxtYwfZpgsD7hBiKFRk8sDxej0++
 /Sn3LF2bFPPHjU0QkLEj1omxlfK5pgjAq52ahf7oHxgSO5t7xhybFC+7MV3VI5zl
 /WdbsUCMvLuRl+Tt2xvxOjfebXQQP3UZo1C3ZlSQ6DnXuVDO/pjsZ7dszKhZVUGH
 OPoIszeY6y1mf1hk95cln1F4gKWFp8WijdStjsyQO49fD4bj3Bk0BtRnvgvUdJ01
 k51N+OmSDj3upAfHCnF02bTRwT8KbpaIFD51umxa3/+y5O4Jwo8ZpgqcLxkdnrUK
 SfcEjuhF5cEmO9H7YEUg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ta9k0avvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 17:09:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 95FBE10005A;
 Tue, 26 Sep 2023 17:09:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F5CF2C41E8;
 Tue, 26 Sep 2023 17:09:30 +0200 (CEST)
Received: from localhost (10.201.20.38) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 17:09:30 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Sep 2023 17:09:20 +0200
Message-ID: <20230926150924.1150082-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926150924.1150082-1-patrice.chotard@foss.st.com>
References: <20230926150924.1150082-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_12,2023-09-26_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 3/6] configs: stm32mp13: Enable USB related
	flags
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

Enable USB related flags.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32mp13_defconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 82b62744f6d..f962d0eab97 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -32,6 +32,8 @@ CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 CONFIG_CMD_LSBLK=y
 CONFIG_CMD_MMC=y
+CONFIG_CMD_USB=y
+CONFIG_CMD_USB_MASS_STORAGE=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_EFIDEBUG=y
 CONFIG_CMD_TIME=y
@@ -58,6 +60,8 @@ CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
 CONFIG_DM_MTD=y
+CONFIG_PHY=y
+CONFIG_PHY_STM32_USBPHYC=y
 CONFIG_PINCONF=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
@@ -72,6 +76,20 @@ CONFIG_SYSRESET_PSCI=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 # CONFIG_OPTEE_TA_AVB is not set
+CONFIG_USB=y
+CONFIG_DM_USB_GADGET=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_GENERIC=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_GENERIC=y
+CONFIG_USB_ONBOARD_HUB=y
+CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2000
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
+CONFIG_USB_GADGET_VENDOR_NUM=0x0483
+CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
+CONFIG_USB_GADGET_DWC2_OTG=y
+CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_ERRNO_STR=y
 # CONFIG_LMB_USE_MAX_REGIONS is not set
 CONFIG_LMB_MEMORY_REGIONS=2
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
