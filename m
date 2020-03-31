Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 700F5199AD9
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:05:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A89CC36B11
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:05:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F3ACC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:05:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VG4neB027845; Tue, 31 Mar 2020 18:05:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=vqjjQ+SYTIgbGUzzbVOWz0b8KNKprw3Bve1TjqUngDw=;
 b=hjMM6QBgGYAQKRROLSkrKDLFLIQ3OYJRtPwichBam7eTdXJ/kjeDH9JG73zI3+7SY1Il
 sEZhLomg2NLQ9SWv++TQrwMAQx9wwFYWkCL10IfQO5iNgZYr0mC5K9vuHsOl5gxZ/pAX
 vukxYQpj5hkI3tPm13bQraNezej+oJPScEPJ8u7tMv8yAPm4KPSdK9cIpzTYpBglLa3u
 wmj7l5WhnQsGFMhSvRxm2N0WltM/0R/vWdytKe04F/KDWrd/VJnK/V92Ea+0xminA4h2
 EmB6mUaez+i8/awbyWrp/FJw9L/n4lK9ok2ZHPVimSs0k4Tq879ubJwlcL6u9q/69SMo 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301xbmfyuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 18:05:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB74210002A;
 Tue, 31 Mar 2020 18:05:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E480A2BEC70;
 Tue, 31 Mar 2020 18:05:05 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 31 Mar 2020 18:05:05 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 31 Mar 2020 18:04:32 +0200
Message-ID: <20200331180330.15.I7cedf843510610b1a89f70db103e9f4c3e264560@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_05:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 15/16] configs: stm32mp1: activate Ethernet
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

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 6d82365348..30cfb8d8e1 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -101,6 +101,7 @@ CONFIG_SPI_FLASH_WINBOND=y
 # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
 CONFIG_SPI_FLASH_MTD=y
 CONFIG_SPL_SPI_FLASH_MTD=y
+CONFIG_PHY_REALTEK=y
 CONFIG_DM_ETH=y
 CONFIG_DWC_ETH_QOS=y
 CONFIG_PHY=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 6928e9a65c..aefad2b109 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -86,6 +86,7 @@ CONFIG_SPI_FLASH_STMICRO=y
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
