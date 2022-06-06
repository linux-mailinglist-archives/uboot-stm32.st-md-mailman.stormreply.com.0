Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA7A53E505
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jun 2022 16:21:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72BF3C0D2C0;
	Mon,  6 Jun 2022 14:21:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5E1AC0D2C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jun 2022 14:21:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256D2Jhf030658;
 Mon, 6 Jun 2022 16:21:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=hHx5igdwB13kmT6Va02grm2yHF5UNTVFTdGxVd8Voc4=;
 b=yvj+rkXkqxS4Z0+GC11p89FsMpOS8tdK0aiCBJP2YjP719oWK64zEHp3oQ4imWoE/slJ
 umbYl32fUpPBMdIkSpO61IVTzKrwLmOUw75bztD+lJ6U2uZdpLxxv5qT4lJWU+dkrGEL
 dfloXZc85wD2hFSTfr4mIo0pd+64Djdc1D7adUWjwCrv20uOx6/wiJE10WoWYJPVyzdB
 1b+j1NgTx0Ssy8JRXhgBxi2+VYL+ToZ5bs8K7wTmXy5hDL9IHgjHcjWGiLcrLkzbwJRU
 LAaVhRUy/zeh54lQbVmE0tT3kEoBFT46K9sVC5PUfj9M4gruxEfwMiUl0ZwlUEz4tfsJ Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gfvha37fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jun 2022 16:21:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 28A261000FD;
 Mon,  6 Jun 2022 16:04:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 038B022A6DF;
 Mon,  6 Jun 2022 16:04:20 +0200 (CEST)
Received: from localhost (10.75.127.50) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 6 Jun
 2022 16:04:19 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 6 Jun 2022 16:04:16 +0200
Message-ID: <20220606160414.v1.2.Ida901b98d25a7f60b6fb05d18f2e030d9c9ecc5c@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606160414.v1.1.I4f6455f026820524103f7fbdffaafd3b75585197@changeid>
References: <20220606160414.v1.1.I4f6455f026820524103f7fbdffaafd3b75585197@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-06_04,2022-06-03_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 2/2] ARM: stm32: activate OF_LIVE for DHSOM
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

Activate the live DT with CONFIG_OF_LIVE to reduce the DT parsing
time.

Tested-by: Marek Vasut <marex@denx.de>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v1:
- previously sent as RFC, Tested by Marek
  http://patchwork.ozlabs.org/project/uboot/list/?series=301157

 configs/stm32mp15_dhcom_basic_defconfig | 1 +
 configs/stm32mp15_dhcor_basic_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index ca3873c7e6..f91bc173d5 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -72,6 +72,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=nor0:256k(fsbl1),256k(fsbl2),1408k(uboot),64k(
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_ISO_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
+CONFIG_OF_LIVE=y
 CONFIG_OF_LIST="stm32mp15xx-dhcom-pdk2 stm32mp15xx-dhcom-drc02 stm32mp15xx-dhcom-picoitx"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index 4e70566e3f..b19033bdaa 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -70,6 +70,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=nor0:256k(fsbl1),256k(fsbl2),1408k(uboot),64k(
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_ISO_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
+CONFIG_OF_LIVE=y
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
