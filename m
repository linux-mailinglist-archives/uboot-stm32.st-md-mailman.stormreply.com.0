Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6264B63369E
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Nov 2022 09:06:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29CD6C6507D;
	Tue, 22 Nov 2022 08:06:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15D5FC64104
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 08:06:39 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AM13GLr013900; Tue, 22 Nov 2022 09:06:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=wST+xZUlNS0MmiDy+02+77leKqX+gJqzHH8LaYkx7oM=;
 b=iQ29fLdNq+zNuIuPHjJqgPdIqPdIDVyPZsjkCB+is87GPcj9XSa8N9JFHhHcEeCQkbyq
 D5HGKqGwfsej/Cayzm+qBYBXOGzc50YUnE6otmwfB+krQ5KQXRKKptJBCKM5AHjnfqkg
 5mHth7/rq25JJxQf6IPIZlmLw1r8olp6XQzIOYw6qX+ADjF/dKDUSyFc3vp0ojL5AnMC
 WbjysyMJuwJwvaX1v23jxlbcCcXNmYPRwJTAOGP15AHzGqEJeOPVDHVzz+FfhpmqR5Aa
 EVgoS6gLuePwtRaaZ7zPyG0vEiISUwGUbhDSt8q+Jshfwh8aaDQFpi6bEU0R0oC/FpCa vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kxrabfdwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Nov 2022 09:06:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 739D910002A;
 Tue, 22 Nov 2022 09:05:42 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 632C3216851;
 Tue, 22 Nov 2022 09:05:42 +0100 (CET)
Received: from localhost (10.201.22.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 22 Nov
 2022 09:05:42 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 22 Nov 2022 09:05:37 +0100
Message-ID: <20221122080540.351469-1-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_04,2022-11-18_01,2022-06-22_01
Cc: Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 0/3] Introduce STM32MP13 RCC driver
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

Changes in v3:
- fix cosmetic
- add comments in commit message
- explanation of stm32 clock gating

Changes in v2:
- deference check_security() call back
- use of ccf_clk_(enable/disable/get_rate/set_rate) ops
- fix gate refcounting
- documented structures in clock-core API
- remove useless spinlocks
- cosmetic changes
- remove useless defines

Gabriel Fernandez (3):
  dt-bindings: stm32mp13: add clock & reset support for STM32MP13
  clk: stm32mp13: introduce STM32MP13 RCC driver
  arm: dts: stm32mp13: add support of RCC driver

 MAINTAINERS                                  |   2 +
 arch/arm/dts/stm32mp13-u-boot.dtsi           |   4 +
 arch/arm/dts/stm32mp131.dtsi                 | 119 +--
 arch/arm/dts/stm32mp133.dtsi                 |   4 +-
 arch/arm/dts/stm32mp13xc.dtsi                |   3 +-
 arch/arm/dts/stm32mp13xf.dtsi                |   3 +-
 drivers/clk/stm32/Kconfig                    |  15 +
 drivers/clk/stm32/Makefile                   |   2 +
 drivers/clk/stm32/clk-stm32-core.c           | 268 ++++++
 drivers/clk/stm32/clk-stm32-core.h           | 276 ++++++
 drivers/clk/stm32/clk-stm32mp13.c            | 841 +++++++++++++++++++
 drivers/clk/stm32/stm32mp13_rcc.h            | 288 +++++++
 include/dt-bindings/clock/stm32mp13-clks.h   | 229 +++++
 include/dt-bindings/reset/stm32mp13-resets.h | 100 +++
 14 files changed, 2075 insertions(+), 79 deletions(-)
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
