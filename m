Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4C352DA8D
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 May 2022 18:47:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5407AC03FCD;
	Thu, 19 May 2022 16:47:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8CBFC03FCC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 16:47:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JF45C4009064;
 Thu, 19 May 2022 18:46:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=4uFj9z4mN/k3ys5mUTCv1CNuZk5Tg926kDPfFd9RFwo=;
 b=ZQ4DtDkA9SVG2ERq0GoI8lczoH30RrGvNoczzFiPFYwCSJ2K2Fr/Lv4BdDkoneIzVkd5
 GW4TZVa4LaU8Gp0Dp/jsUbaQkhyPja3z6dCZBzDMwCktgDmpTiuHp7QTauSU02hlapHl
 QqUxaX9fGo4wUN+WaKa2WhO0coal3f/6kqm0T43/bqy6vmfLJlqh2CyqO8znc1T8/DZR
 DVCnJUmWLDMoWX42/A/8Jv2k32sk2qDNFq1Kby46NShjbDTs9BzGNX0ds4Dn7JNz43Ax
 7PmwdBSUKlL/itEaYqL7mbBQFVo23MVNtF47gu5GMBI8FiCbQn9r2bXMpAmoEmNMynLS 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j9ay4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 18:46:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 47B0710002A;
 Thu, 19 May 2022 18:46:56 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FD9C22FA2B;
 Thu, 19 May 2022 18:46:56 +0200 (CEST)
Received: from localhost (10.75.127.49) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 19 May
 2022 18:46:41 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 May 2022 18:46:33 +0200
Message-ID: <20220519184552.RFC.2.Ida901b98d25a7f60b6fb05d18f2e030d9c9ecc5c@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519184552.RFC.1.I4f6455f026820524103f7fbdffaafd3b75585197@changeid>
References: <20220519184552.RFC.1.I4f6455f026820524103f7fbdffaafd3b75585197@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_05,2022-05-19_03,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [RFC PATCH 2/2] ARM: stm32: activate OF_LIVE for DHSOM
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

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
