Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C03A636B60D
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Apr 2021 17:46:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BEDAC3FADC;
	Mon, 26 Apr 2021 15:46:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86C9FC32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 15:46:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QFS4Qv016834; Mon, 26 Apr 2021 17:46:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=Es2hkrGL83RJXr4ZFYe0y+esVKS7qAA9pkaKKTKKveE=;
 b=pCcyZ2+DGOX3kGQssuTAUby8wJHjl7BPnVvvvi5N9tPceDytHvca5HTLGKDRgzW7pZkp
 wiwPXn7tM56fLxXHSVvM3b4KNFWx07jBVYBUHrzRfuxLQ+tLbI6ertQVO+UGTP1mZdd4
 oJaNrpxICmFNC8BH9sFD7ZGcj1Ny1GXiurXLniqTphfypnjRDMejrIGb2ehMZB6gV6gT
 SiykRPtfceR6bIQhfw7OtIeYo0djK4iYMBIhQemVjixCkjIxZKVBIUAoxaJwAaWGJRbu
 R6c0dqaQ6aim1sbuP/D++PDOj8JNlC1tixINQR2jrdN4fn8blTgUAU15cL5mmcRImX8Q yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 385aeedy58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 17:46:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1E7A10002A;
 Mon, 26 Apr 2021 17:46:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B434423ABD8;
 Mon, 26 Apr 2021 17:46:06 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 17:46:06
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Apr 2021 17:45:58 +0200
Message-ID: <20210426154604.3345-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_07:2021-04-26,
 2021-04-26 signatures=0
Cc: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: [Uboot-stm32] [PATCH v2 0/6] net: dwc_eth_qos: add support of
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


It is the V2 version of [1] after Marek remarks: all commit are new.

I change the DWC_ETH_QOS STM32 variant by using generic eth phy driver.

This driver is updated to use the gpio reset and assert/deassert delay
from DT with the generic binding defined in linux:
  Documentation/devicetree/bindings/net/ethernet-phy.yaml
or in U-Boot: doc/device-tree-bindings/net/phy.txt

[1] net: dwc_eth_qos: add support of device tree configuration for reset delay
    http://patchwork.ozlabs.org/project/uboot/list/?series=238253&state=*


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
 drivers/net/eth-phy-uclass.c |  78 +++++++++++++++---
 3 files changed, 91 insertions(+), 140 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
