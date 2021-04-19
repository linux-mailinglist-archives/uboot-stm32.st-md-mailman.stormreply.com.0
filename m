Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7A4363F21
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Apr 2021 11:47:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFC0CC57196;
	Mon, 19 Apr 2021 09:47:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5A09C57195
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 09:47:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13J9QQN3027950; Mon, 19 Apr 2021 11:47:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=ATIc7SUsTxJsjq4YW33a0TTT27HVdB54agNjcD8MlVM=;
 b=l9sFPv1J33zbrHoXh3yCoczUfUjl/s1rKFw/tEiL/fE17K8S2wdI8EJvfHaDr5A97Mg1
 HVdwR1yYaC0sA7LAaCUSwuRkV//DHwsPPjR7pFF9mBFtP+xCg/tVZ+wRzIYVf2L4ojcm
 oT2r38B5kUwhuZm2KBR3Xp8tB3OaMdJRfQb/W51uKhYn7jpkbyqyLFDx1sHaaae88cLs
 JHoDl5OiLmhqtePa9zawuTor3SxTSRetz25qxVB2MUyGtbkoE/5ujHrP+SV04JLouYsR
 puirZN2VdSS4HTvLwV/nRG+90bXRuyCsDs7BrpOcB435n72nkAABMUiheIoaqfliLGw9 tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 380s533dxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 11:46:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3B4910002A;
 Mon, 19 Apr 2021 11:45:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C642520A66D;
 Mon, 19 Apr 2021 11:45:45 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr 2021 11:45:45
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 19 Apr 2021 11:45:29 +0200
Message-ID: <20210419094534.9748-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_05:2021-04-16,
 2021-04-19 signatures=0
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Stefan Roese <sr@denx.de>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Bin Meng <bin.meng@windriver.com>, Lukasz Majewski <lukma@denx.de>,
 Pratyush Yadav <p.yadav@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ye Li <ye.li@nxp.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Walter Lozano <walter.lozano@collabora.com>
Subject: [Uboot-stm32] [PATCH v2 0/5] cmd: bind: Fix driver binding
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


This series is fixing issues reported by Herbert Poetzl when trying to
bind Ethernet gadget over USB on STM32MP1 platform.
2 issues have been found:
   - fix the bind command.
   - add dwc2 bcdDevice in USB gadget controller.
   - add test to check binding of driver without compatible string.

Changes in v2:
  - add bind test

Patrice Chotard (5):
  cmd: bind: Fix driver binding on a device
  usb: gadget: Add bcdDevice for the DWC2 USB Gadget Controller
  usb: sandbox: Add gadget callbacks
  configs: sandbox: add USB_ETHER and GADGET_DOWNLOAD gadget support
  test/py: Add usb gadget binding test

 cmd/bind.c                        |  2 +-
 configs/sandbox_defconfig         |  3 +++
 drivers/core/device.c             |  2 +-
 drivers/core/lists.c              | 11 ++++++++---
 drivers/core/root.c               |  2 +-
 drivers/misc/imx8/scu.c           |  2 +-
 drivers/serial/serial-uclass.c    |  2 +-
 drivers/timer/timer-uclass.c      |  2 +-
 drivers/usb/gadget/gadget_chips.h |  8 ++++++++
 drivers/usb/host/usb-sandbox.c    | 28 ++++++++++++++++++++++++++++
 include/dm/lists.h                |  3 ++-
 test/dm/nop.c                     |  2 +-
 test/dm/test-fdt.c                |  2 +-
 test/py/tests/test_bind.py        |  7 +++++++
 14 files changed, 64 insertions(+), 12 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
