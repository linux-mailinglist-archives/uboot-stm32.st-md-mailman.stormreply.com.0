Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F07FF3D0144
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Jul 2021 20:10:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A126AC597BD;
	Tue, 20 Jul 2021 18:10:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10935C597B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jul 2021 18:10:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KI2xIJ031721; Tue, 20 Jul 2021 20:10:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=kVpL7YyPqRq2G8J8jyluu7RivyRPBWbqZeIsTI1ROP4=;
 b=wg/r6Bl3lfjgXbh4Z3V11s09rki6ED4qqXisonRMvrJdMmvc4gVuwbYXuKIJ0sqaVMWb
 rfBbPi+g7h83ntqVgyXgcRXye9/kE96UOViPOLv9WmLvlpliNW++tPAL4VvrlEVz1FUW
 tImJw00T4gtRsy5knN6jYuzFvadMw6VIeVqP96MjMmQ1xa8RuezTgHHf11/YrICOWRQ5
 ZzMNUf1AcouIcp67cgf4wYGjR336ti887YP4CF+e1mv+GQ5+0vOWGqVk93xpi1iaPUf1
 +7+5E97xzo2aoagTqiO6z48xdOBL5Pl0/lvJtB7Rcs8fEigginh6KqoI7oQS4g1+gs+g xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39wu03u2nj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 20:10:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA6A810002A;
 Tue, 20 Jul 2021 20:10:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 999DE2C4217;
 Tue, 20 Jul 2021 20:10:40 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Jul 2021 20:10:39
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 20 Jul 2021 20:09:50 +0200
Message-ID: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 0/6] net: dwc_eth_qos: add support of
	device tree configuration for reset delay
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


It is the V3 version of [1], rebased and without compilation issue for
power PC baord withotu CONFIG_DM_GPIO.

I change the DWC_ETH_QOS STM32 variant by using generic the phy driver.

This driver is updated to use the gpio reset and assert/deassert delay
from DT with the generic binding defined in linux:
  Documentation/devicetree/bindings/net/ethernet-phy.yaml
or in U-Boot: doc/device-tree-bindings/net/phy.txt

[1] net: dwc_eth_qos: add support of device tree configuration for reset delay
    http://patchwork.ozlabs.org/project/uboot/list/?series=240808&state=*
    http://patchwork.ozlabs.org/project/uboot/list/?series=240807&state=*


Changes in v3:
- allow compilation without DM_GPIO

Changes in v2:
- Update eth-phy driver (NEW)
- use log macro in eth-phy driver (NEW)
- update eth-phy driver to support STM32 binding with a mdio0 subnode (NEW)
- remove unused element in the struct eqos_priv (NEW)
- use generic ethernet phy for stm32 variant, this patch is a REWORK of
  previous serie: the device parsing is done in eth-phy driver and the gpio
  support is removed in stm32 variant: eqos_start/stop_resets_stm32 and
  eqos_probe_resources_stm32.
- cleanup ops by adding a common null ops (NEW)

Patrick Delaunay (6):
  net: eth-phy: add support of device tree configuration for gpio reset
  net: eth-phy: use dev_dbg and log_notice
  net: eth-phy: manage subnode mdio0
  net: dwc_eth_qos: remove the field phyaddr of the struct eqos_priv
  net: dwc_eth_qos: use generic ethernet phy for stm32 variant
  net: dwc: add a common empty ops eqos_null_ops

 drivers/net/Kconfig          |   1 +
 drivers/net/dwc_eth_qos.c    | 152 +++++------------------------------
 drivers/net/eth-phy-uclass.c |  84 ++++++++++++++++---
 3 files changed, 97 insertions(+), 140 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
