Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7695649F19
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Dec 2022 13:50:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88F19C65E7E;
	Mon, 12 Dec 2022 12:50:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B446EC65E60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 10:46:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCAawhl020508; Mon, 12 Dec 2022 11:46:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=b8h75I9hTBLSXh6L7f+19+lx3/JbhvxncgfzeU9Fdus=;
 b=P3+VD/XY3/hFB2Oxablx7nDEcMs+Vdt/3ZTFClZvvZeynVD3u2tYC66AR5vCg4Jir2ug
 R4EcJIOoGV3veSqh5z5t6u3XwKfVDOBY8ukdBb/ekd7/h5vYRB6JXVmL7tgAuGYxcGFi
 xDRCpuddZV5kQZdc8lwjPWGMcMvvU83IMbS8dhvWu5pPRDMZC3p4AFaC+h/QHK8YAlcU
 m2Pck35RVluF+UU3yFMhIni/Ziv9TFZvrlVnPzwIMZZgVuzpq5Cte9EfizlGsHoUCT9K
 HYW2kapB+etOQLPPGOHRLkCf7yGGRUZV7Hu0ajJTwhiWL+jxCZjpIgAMTiaIuI6li1fa nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mchvp30h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 11:46:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25968100038;
 Mon, 12 Dec 2022 11:46:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F64921A22C;
 Mon, 12 Dec 2022 11:46:23 +0100 (CET)
Received: from localhost (10.48.1.102) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 12 Dec
 2022 11:46:20 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 12 Dec 2022 11:44:34 +0100
Message-ID: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Mailman-Approved-At: Mon, 12 Dec 2022 12:50:06 +0000
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Thomas Huth <thuth@redhat.com>, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH 0/3] Add support for USB onboard HUB,
	used on stm32 boards
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

This series adds a driver to support USB onboard HUB, inspired by Linux
onboard hub driver.

Purpose is to manage the power supply regulator on STM32 boards, for
low power use case in Linux. U-boot driver allows to benefit of the
device tree part to supply the HUB when need, instead using an
always-on regulator.

It aligns the relevant DT part from emerging Linux v6.2. It also adds the
relevant default configuration on stm32mp15.


Fabrice Gasnier (3):
  usb: onboard-hub: add driver to manage onboard hub supplies
  configs: stm32: enable USB onboard HUB driver
  ARM: dts: stm32: add support for USB2514B onboard hub on
    stm32mp157c-ev1

 arch/arm/dts/stm32mp157c-ev1.dts    |  8 ++++
 common/Makefile                     |  1 +
 common/usb_onboard_hub.c            | 62 +++++++++++++++++++++++++++++
 configs/stm32mp15_basic_defconfig   |  1 +
 configs/stm32mp15_defconfig         |  1 +
 configs/stm32mp15_trusted_defconfig |  1 +
 drivers/usb/Kconfig                 | 10 +++++
 drivers/usb/host/usb-uclass.c       | 16 +++++---
 8 files changed, 94 insertions(+), 6 deletions(-)
 create mode 100644 common/usb_onboard_hub.c

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
