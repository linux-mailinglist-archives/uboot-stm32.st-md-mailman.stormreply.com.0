Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E0D6E6679
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Apr 2023 15:59:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2553C69065;
	Tue, 18 Apr 2023 13:59:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1211BC01E98
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 13:59:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33IDTeEV014365; Tue, 18 Apr 2023 15:59:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=QxTXl9rVKG4GtLck4ABLDC3i8/GOI1cc0d0Row6+JMw=;
 b=7RBi5F4eCSj9nAHLObcd5C3h+oV2EtM3m4pUov+cQbQx4cTyJZYq37d4Ca261QHOYeQ4
 IgH8k0FktM7VrTfAy7n0xUk+y63OhT54lQvU76d4XziyRb2X6nnz8AzbhSEXOhOm+CgS
 H97k7MTSVfipnmRGT3Jp1Hw/EP1svU/NmLYynDMdmNFo1Fn9OYopV3rW6V3ZQG/huT4J
 Asz7ido4xgGfIfKCkd69xZuAjpm+FbiY4V+uHVMkjb8BVCIUHyEoIUNCea53xKAwEM6a
 m5ToJ/WcU5JI/4wwFMUCfxsP3oQ1Ohg40TJqzt5meyXFu5sMFYuFi/KWubbKG8wOnQnQ hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q1rhrst5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Apr 2023 15:59:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8CF6910002A;
 Tue, 18 Apr 2023 15:59:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7E400222CBD;
 Tue, 18 Apr 2023 15:59:43 +0200 (CEST)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 18 Apr
 2023 15:59:43 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 Apr 2023 15:59:39 +0200
Message-ID: <20230418135941.774340-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_10,2023-04-18_01,2023-02-09_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/2] ARM: dts: stm32mp: alignment with v6.3-rc3
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


Alignment with Linux device tree v6.3-rc3 for STM32MP13x and STM32MP15x
STMicroelectronics board and common files, SoC and pincontrol dtsi.

I also include the new dt-bindings files video-interfaces.h as it is done
in Linux kernel.



Patrick Delaunay (2):
  media: dt-bindings: media: Add macros for video interface bus types
  ARM: dts: stm32mp: alignment with v6.3-rc3

 arch/arm/dts/stm32mp13-pinctrl.dtsi          | 138 +++
 arch/arm/dts/stm32mp131.dtsi                 | 993 ++++++++++++++++++-
 arch/arm/dts/stm32mp133.dtsi                 |  31 +
 arch/arm/dts/stm32mp135f-dk.dts              | 235 ++++-
 arch/arm/dts/stm32mp15-pinctrl.dtsi          |  50 +-
 arch/arm/dts/stm32mp151.dtsi                 |   2 -
 arch/arm/dts/stm32mp157c-ev1.dts             |  18 +-
 arch/arm/dts/stm32mp15xx-dhcom-som.dtsi      |   8 +-
 arch/arm/dts/stm32mp15xx-dhcor-som.dtsi      |   8 +-
 arch/arm/dts/stm32mp15xx-dkx.dtsi            |  10 +-
 include/dt-bindings/clock/stm32mp13-clks.h   |   2 +-
 include/dt-bindings/media/video-interfaces.h |  16 +
 include/dt-bindings/reset/stm32mp13-resets.h |   2 +-
 13 files changed, 1475 insertions(+), 38 deletions(-)
 create mode 100644 include/dt-bindings/media/video-interfaces.h

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
