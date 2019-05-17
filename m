Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B040218E3
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 May 2019 15:09:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19294C54B38
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 May 2019 13:09:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD587C05842
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2019 13:09:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HD72oS003558; Fri, 17 May 2019 15:08:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=2G8ZvLMtijOhH6k+pqNNmPDOh+n2G/cerDKxDnZftp4=;
 b=sk4A7HmQskzo6RL4z0QWOkdgU7gTmh+az5k7joenE0YEPV4kTDJ3Axt1hi/HT5bnPJ3+
 rSD2t79aqMJF6AHhIg6l29IB/If/qXUEpESYjY1vgwcqdTfB9HsfUkfAodmMo0XaL3Pm
 zCVJDoaXs09SeB7O/Vno8YpCk1bgN2sddwekPLIjBkQZIxyiV3fqQh4sZH+v10mAkfCg
 s+/fPS2GMNoz5WwWnz4M4iFM6rE7EXWFGioIA1kdhgQ+soL4xj5PShSpMp9Qut+rjrUE
 JmiM/wBPswpfc96/MJT+dxT7nRIIIM70fnjjN2c1OYqJ/4vsA9pnEml4SLKnLjIzHiS2 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdkv0dv36-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 17 May 2019 15:08:51 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F3ED93A;
 Fri, 17 May 2019 13:08:49 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D17332B19;
 Fri, 17 May 2019 13:08:49 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 17 May
 2019 15:08:49 +0200
Received: from localhost (10.201.22.222) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 17 May 2019 15:08:49
 +0200
From: Christophe Roullier <christophe.roullier@st.com>
To: Christophe Roullier <christophe.roullier@st.com>, <u-boot@lists.denx.de>
Date: Fri, 17 May 2019 15:08:41 +0200
Message-ID: <20190517130847.13144-1-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.222]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_07:, , signatures=0
Cc: Tom Rini <trini@konsulko.com>,
 Christophe KERELLO <christophe.kerello@st.com>, Albert
 Aribaud <albert.u.boot@aribaud.net>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v2 0/6] - Add Ethernet support for stm32mpu
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

       Support all PHY config:
         PHY_MODE (MII,GMII, RMII, RGMII)
         Phy wo crystal (25Mhz and 50 Mhz), No 125Mhz from PHY config

Changes in v2:
-remark from Joe Hershberger to replace "int interface" with "phy_interface_t interface"
 and manage return values "-1", "0" with PHY_INTERFACE_MODE_NONE and PHY_INTERFACE_MODE_MII

Christophe Roullier (5):
  board: stm32mp1: Add board_interface_eth_init
  net: dwc_eth_qos: add Ethernet stm32mp1 support
  ARM: dts: stm32: Add Ethernet support on stm32mp1
  stm32mp1: Add Ethernet support for stm32mp1 board
  configs: stm32mp15: Enable Ethernet feature

Patrick Delaunay (1):
  stm32mp1: clk: use the correct identifier for ethck

 arch/arm/dts/stm32mp157-pinctrl.dtsi |   9 +-
 arch/arm/dts/stm32mp157c-ev1.dts     |   2 +-
 arch/arm/dts/stm32mp157c.dtsi        |  16 +-
 board/st/stm32mp1/stm32mp1.c         |  68 ++++-
 configs/stm32mp15_basic_defconfig    |   2 +
 drivers/clk/clk_stm32mp1.c           |   2 +-
 drivers/net/dwc_eth_qos.c            | 435 +++++++++++++++++++++++----
 include/configs/stm32mp1.h           |  12 +-
 8 files changed, 480 insertions(+), 66 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
