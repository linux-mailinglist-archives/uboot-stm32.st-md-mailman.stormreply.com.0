Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 806E189DDA1
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Apr 2024 17:03:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F7C5C7128F;
	Tue,  9 Apr 2024 15:03:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 068C8C7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 15:03:17 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 439Baerh026315; Tue, 9 Apr 2024 17:02:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=9vWJEuXQC8qKujTxEws17ocEBM50snsjY3V9MDUkYKY=; b=eV
 wocMHeGbqFqMKY8BJUjjGXIYnqHOa5zPoRjGqBvZylkrKaMTeNNUgFUIqi2BLkct
 yiFZS0y+C3dUjarZN+Ko12nkEDM9ECKgWILgN6xbs80mS2Gq4iqVPxoDrtz4QD+G
 jmWuXLHmX+Ce+q5Dcucta4NSyVA6BWpx76rSlIoxbCOuHRXRPb3SObxcD1858BwD
 hOIPGbcP2MNJSAPGm0R21blUs0Nn0K+4dhkYhUGVUoGdKfH1Fo9JCN+MTo4scHGb
 uwqf71/4DXqPRYK8sfRQ4ciZU/HJljcBNGuZ9mr9ykk+HnmOT5cvI+nJyGEgQGTx
 IqLIY8NOku3NEUGtVpxg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xbfy0t0fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Apr 2024 17:02:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D6BC340045;
 Tue,  9 Apr 2024 17:02:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 334672207B0;
 Tue,  9 Apr 2024 17:02:22 +0200 (CEST)
Received: from localhost (10.48.86.98) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 9 Apr
 2024 17:02:21 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Apr 2024 17:01:53 +0200
Message-ID: <20240409150215.2497778-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_10,2024-04-09_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 03/25] configs: stm32mp1: Enable
	BUTTON_GPIO flag for stm32mp15_basic_defconfig
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

Enable BUTTON_GPIO flag for STM32MP15.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32mp15_basic_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 005f1d55f80..2e22bf86000 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -97,6 +97,8 @@ CONFIG_TFTP_TSIZE=y
 CONFIG_USE_SERVERIP=y
 CONFIG_SERVERIP="192.168.1.1"
 CONFIG_STM32_ADC=y
+CONFIG_BUTTON=y
+CONFIG_BUTTON_GPIO=y
 CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
