Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0A1F19BA
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 16:17:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9C58C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 15:17:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C0FAC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 15:17:16 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA6F2d7W024644; Wed, 6 Nov 2019 16:16:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=yK9NqNQGSa7H6XctWIIaOScwCInRUVFerP1BkpI0IDA=;
 b=c2ZKCmARoZM0JCBedvV8ePtYno+4Rp1GtGk2lJZY2lv+xfOQIcwZXzbBunbp2iWZZ44V
 dF5NhhQBV6g9df3XFPATmNeTbTZ/a9n6Zf6++uZVxIYIYRi4ztycnrb1v8jX3MY+pj47
 82tOWeDnFb9uzHq7ierTPxlxYG4J4oobY+AR2/hflvq/Q08zLGTfYomq3cAgbE5kNNcu
 smQtJAakt3NS8TfTLhUjp9HNXKFWykiAWRrgB6lrxRpRCRQYIvaP90aupPwtaGh5KHSS
 D4lDCgn8Fcnvuxf7N2IL9+Q4nZpomt9tIBEUEv2zOWYYqGdYKhW73Bws0lLVYFAh+tLo Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w10f1p5td-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 16:16:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E245D10002A;
 Wed,  6 Nov 2019 16:16:40 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 854942BF9C6;
 Wed,  6 Nov 2019 16:16:40 +0100 (CET)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 6 Nov 2019
 16:16:40 +0100
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 6 Nov 2019 16:16:37
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 6 Nov 2019 16:16:31 +0100
Message-ID: <20191106151634.7834-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-06_04:2019-11-06,2019-11-06 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Rick Chen <rick@andestech.com>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@openedev.com>
Subject: [Uboot-stm32] [PATCH 0/3] ARM: dts: stm32: udpate device tree for
	v2020.01
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


Alignment of the device tree for all STM32 boards (MCU/MPU)
with the latest Linux kernel and solve STM32MP157c-EV1 issue
for eMMC on SDMMC2.

All the boards (except avenger96i: not available) correctly boot
after the patches.



Patrick Delaunay (3):
  ARM: dts: stm32: DT alignment with kernel v5.3
  ARM: dts: stm32: DT alignment with kernel v5.4-rc4
  ARM: dts: stm32: update eMMC configuration for stm32mp157c-ev1

 arch/arm/dts/st-pincfg.h                      |   1 +
 arch/arm/dts/stm32429i-eval.dts               |  29 ++--
 arch/arm/dts/stm32746g-eval.dts               | 105 +++++++++-----
 arch/arm/dts/stm32f4-pinctrl.dtsi             |  38 +-----
 arch/arm/dts/stm32f429-disco.dts              |  40 +-----
 arch/arm/dts/stm32f429-pinctrl.dtsi           |  38 +-----
 arch/arm/dts/stm32f429.dtsi                   | 127 +++++++++++------
 arch/arm/dts/stm32f469-disco.dts              |  39 +-----
 arch/arm/dts/stm32f469-pinctrl.dtsi           |  39 +-----
 arch/arm/dts/stm32f469.dtsi                   |   2 +-
 arch/arm/dts/stm32f746-disco.dts              |  39 +-----
 arch/arm/dts/stm32f746.dtsi                   |  54 +++-----
 arch/arm/dts/stm32f769-disco.dts              |  43 +-----
 arch/arm/dts/stm32h7-u-boot.dtsi              |  41 +-----
 arch/arm/dts/stm32h743-pinctrl.dtsi           |  83 +++++++++++
 arch/arm/dts/stm32h743.dtsi                   |  69 +++++-----
 arch/arm/dts/stm32h743i-disco-u-boot.dtsi     |   8 --
 arch/arm/dts/stm32h743i-disco.dts             |  76 ++++++-----
 arch/arm/dts/stm32h743i-eval-u-boot.dtsi      |   9 --
 arch/arm/dts/stm32h743i-eval.dts              |  42 +++++-
 arch/arm/dts/stm32mp157-pinctrl.dtsi          |  59 +++++++-
 .../arm/dts/stm32mp157a-avenger96-u-boot.dtsi |   5 +-
 arch/arm/dts/stm32mp157a-dk1.dts              | 129 ++++++++++++++++++
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      |   5 +-
 arch/arm/dts/stm32mp157c-ed1.dts              |  51 ++++++-
 arch/arm/dts/stm32mp157c-ev1.dts              |   3 +-
 arch/arm/dts/stm32mp157c.dtsi                 |  26 ++++
 include/dt-bindings/clock/stm32fx-clock.h     |   9 +-
 include/dt-bindings/mfd/st,stpmic1.h          |   4 +
 include/dt-bindings/mfd/stm32f7-rcc.h         |   1 +
 include/dt-bindings/mfd/stm32h7-rcc.h         |   2 +-
 31 files changed, 682 insertions(+), 534 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
