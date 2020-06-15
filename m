Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E58FC1F931D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 11:18:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9E4CC36B14
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 09:18:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A09A3C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 09:18:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F9Dv06029611; Mon, 15 Jun 2020 11:18:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=2BdY4ivC/kdgJ1fdC5LjGlv2Plmv05w8KiV7dnxHY7E=;
 b=U16xj8gIxGrzJrJTddvw/D9jRWmf83C5FxCHt35acGwZLR7YjEgOx3NP/Eq5FGJNdE5h
 Nd+fGsJCL8uJJ0RUZixeU2CdqXHE0ymlCU3a93m0BhtxMAKekNShAxMoIbw6sv7M4HQl
 5PyAo/9r6gyasDdJyFjJscP7Q7Vd39COk1IgXAvz85PcGi0NbZMw2laKdu4zpXGPtTGO
 QXoyJlL2aacsmM9khHxO45Sgp+XrgFqxOtSyTl7i2UghqEKpeiu7GIGO5kMn6OXUXnvG
 Zph4hVNKeb/bW5M/PjdZwjn7/sDvBs/RRfHTRndotbaktZ+i/Vp5Mjw21z2TPh91hCO7 xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mm91gu7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 11:18:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C740710002A;
 Mon, 15 Jun 2020 11:18:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC49D2C1E88;
 Mon, 15 Jun 2020 11:18:34 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 15 Jun 2020 11:18:34 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jun 2020 11:18:21 +0200
Message-ID: <20200615091824.3022-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-15,
 2020-06-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 0/3] stm32mp1: board: add support of
	CONFIG_ENV_IS_IN_MMC
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


Hi,

Rebased serie [1] with minor modification for avenger96 board
(as SD card is no more used for environment, replaced by SPI-NOR)

This serie depends on ENV patches [2] (RESEND of [3])

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=165333
[2] http://patchwork.ozlabs.org/project/uboot/list/?series=183363
[3] http://patchwork.ozlabs.org/project/uboot/list/?series=165325

Patrick

Changes in v2:
- remove impact on avenger96 board as ENV is saved in NOR for DHCOR SOM
  (CONFIG_ENV_IS_IN_SPI_FLASH in stm32mp15_dhcor_basic_defconfig)

Patrick Delaunay (3):
  stm32mp1: board: add support of CONFIG_ENV_IS_IN_MMC
  stm32mp1: use a specific SD/eMMC partition for U-Boot enviromnent
  configs:stm32mp1: activate env config in SPL

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi |  1 +
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi |  1 +
 board/st/stm32mp1/stm32mp1.c             | 20 +++++++++++++++++---
 configs/stm32mp15_basic_defconfig        |  8 ++++----
 configs/stm32mp15_trusted_defconfig      |  5 +----
 5 files changed, 24 insertions(+), 11 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
