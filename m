Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D65D36B619
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Apr 2021 17:47:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCE80C57B51;
	Mon, 26 Apr 2021 15:47:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6249CC3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 15:47:07 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QFS4TO016829; Mon, 26 Apr 2021 17:47:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=Es2hkrGL83RJXr4ZFYe0y+esVKS7qAA9pkaKKTKKveE=;
 b=0Al6BKQU/3HjA/NyABSS/1sKwoLIUXnsoqa2GyE2Zg0E7U9Eime7I81k/W1WxJIJ/ntD
 x2GIIp6a/aCUDORlKKN9zZz+rnQoarx0walXfkW+0MwVid19kcKFImB6ESXm2QJm6So7
 ceDHU7BFlvfFb/D7DLVyC6s34uH8CKl3amYIY0kB5bveUtpJ7gzxBWEPugRTCNCsnXd/
 dnZVsZSDobzglW9FrRXQ8Gw0Olar5u2bJVUqIUFOyXVPUq1ZduwqH/1AnaMg3m12eT/f
 vDK1xE8y+Uicbvtf2RF42SxduDX8aW1nbL7F+8V2IZBsNrUUEJMlhUmGLudSDigPXk+Z iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 385aeedy8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 17:47:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2538A10002A;
 Mon, 26 Apr 2021 17:47:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0DB5123BD64;
 Mon, 26 Apr 2021 17:47:02 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 17:47:01
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Apr 2021 17:46:46 +0200
Message-ID: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_07:2021-04-26,
 2021-04-26 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
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
