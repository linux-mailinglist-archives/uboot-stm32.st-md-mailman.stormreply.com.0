Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A48406D72
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Sep 2021 16:17:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88EE5C5A4D5;
	Fri, 10 Sep 2021 14:17:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F49CC5A4D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Sep 2021 14:17:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18ADEIwe023375;
 Fri, 10 Sep 2021 16:16:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=VJsOIwydECbitgE4+ldqmBqul0lOCpKo0towtq44NFg=;
 b=OIPG30mPQI9D7PEwcjDDje64VfzFHmsArNpa2xeUvFyJeUs03a6a8dgTkGjrGoWTjwVV
 jz9Kh3pWogra7JKt+R5f0tPmkYo1b/9bHHIQ00olJlrtS8XZBPX7VJCBdu3DG1uVsfuU
 LQyEqNsHzphmOg4HjwUe7OjcTo15/T9tWlvO2K8kv3SMmpuWaedblauDJ3nmbcNffPTj
 Y7WIT8r/4MO3UxRSDXJzT80vqazjh7bI55SFqc2l2Kr2bD0UyfkRKNLrrkY4aOWtrbrc
 hBcIuJmUnHR4F/Y1r1sWlmsyFUEW4CN9R1YxkrJr4geVDCKQ1hDde3C34BUe4P3rhtVG WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3aytdk47jk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 16:16:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B58E710002A;
 Fri, 10 Sep 2021 16:16:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node2.st.com [10.75.127.2])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 07A8621F0A7;
 Fri, 10 Sep 2021 16:16:27 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG1NODE2.st.com (10.75.127.2)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 10 Sep 2021 16:16:26
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 Sep 2021 16:16:19 +0200
Message-ID: <20210910141624.25133-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG1NODE2.st.com
 (10.75.127.2)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_04,2021-09-09_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Bin Meng <bin.meng@windriver.com>, Sean Anderson <seanga2@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Pratyush Yadav <p.yadav@ti.com>, Nandor Han <nandor.han@vaisala.com>
Subject: [Uboot-stm32] [RESEND][PATCH v2 0/5] cmd: bind: Fix driver binding
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
 test/py/tests/test_bind.py        |  7 +++++++
 13 files changed, 63 insertions(+), 11 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
