Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF195FC7CE
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Oct 2022 16:53:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B527C640FE;
	Wed, 12 Oct 2022 14:53:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD1F0C640F3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 12:33:58 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CAd0Dt004900;
 Wed, 12 Oct 2022 14:33:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=EeDI84gKYcHT1KDv6yYbenknw7Zo60L4x8Hj9kzHvjM=;
 b=BCm1rf3bGs177Qz470NYBKZwd0cnRv07rvIU2k/08NzDpf+1YowA2urc93yqKx5WAC/2
 Kk1WFGk1YiRHRsmsxi7yl3lDsfzUqQLLHTtI1AqDwN4eoYwTEYTiTN8sies8LSk63s5V
 mD4DeASeBXSe+WA5ggH3PB0Bl/GyfI+wmYvsISizras024EHR/NbxK/gB5XAqnJHHePV
 E0XvLWasXhIHiqt8seskZAUKcZpP9faad2C6aSPfhsqXbMXrUOFJkv4D0qw7kqYYvpMb
 ZedF0nKd1FjioDdEdJmVmPu9gVTYusHLGb8DHTplmXqsMbfzyhvkSkW7+hOaCBxlOp1m mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k31exsyfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 14:33:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E02FF10002A;
 Wed, 12 Oct 2022 14:33:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D69EC228A2A;
 Wed, 12 Oct 2022 14:33:51 +0200 (CEST)
Received: from localhost (10.75.127.121) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 12 Oct
 2022 14:33:51 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Oct 2022 14:33:14 +0200
Message-ID: <20221012123317.434898-1-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_06,2022-10-12_01,2022-06-22_01
X-Mailman-Approved-At: Wed, 12 Oct 2022 14:53:55 +0000
Cc: Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/3] Introduce STM32MP13 RCC driver
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

This serie adds support of clock and reset for STM32MP13.

Gabriel Fernandez (3):
  dt-bindings: stm32mp13: add clock & reset support for STM32MP13
  clk: stm32mp13: introduce STM32MP13 RCC driver
  arm: dts: stm32mp13: add support of RCC driver

 MAINTAINERS                                  |    2 +
 arch/arm/dts/stm32mp13-u-boot.dtsi           |    4 +
 arch/arm/dts/stm32mp131.dtsi                 |  119 +-
 arch/arm/dts/stm32mp133.dtsi                 |    4 +-
 arch/arm/dts/stm32mp13xf.dtsi                |    3 +-
 drivers/clk/stm32/Kconfig                    |   15 +
 drivers/clk/stm32/Makefile                   |    2 +
 drivers/clk/stm32/clk-stm32-core.c           |  349 ++++
 drivers/clk/stm32/clk-stm32-core.h           |  154 ++
 drivers/clk/stm32/clk-stm32mp13.c            |  839 +++++++++
 drivers/clk/stm32/stm32mp13_rcc.h            | 1751 ++++++++++++++++++
 include/dt-bindings/clock/stm32mp13-clks.h   |  229 +++
 include/dt-bindings/reset/stm32mp13-resets.h |  100 +
 13 files changed, 3493 insertions(+), 78 deletions(-)
 create mode 100644 drivers/clk/stm32/clk-stm32-core.c
 create mode 100644 drivers/clk/stm32/clk-stm32-core.h
 create mode 100644 drivers/clk/stm32/clk-stm32mp13.c
 create mode 100644 drivers/clk/stm32/stm32mp13_rcc.h
 create mode 100644 include/dt-bindings/clock/stm32mp13-clks.h
 create mode 100644 include/dt-bindings/reset/stm32mp13-resets.h

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
