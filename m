Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80892A1353C
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Jan 2025 09:21:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BF6BC78F7A;
	Thu, 16 Jan 2025 08:21:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E028C78F6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 08:21:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G6woYf009433;
 Thu, 16 Jan 2025 09:21:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=FzoZC/AIq9vUx9x50CRg9Q
 yJyf75X5lmqsoXvDYek00=; b=PjuLfDKEQVTC3ZPbgGEjuniC1mIBuapW5K1fgX
 xteEDdJRcX9tjT4gHoOsWUR6ItpNw0nWxKRGcikqNqebcenhiP5wY/K8CNMXA3hf
 xbMoIaAq3MM0nzhOzgG6zX9y7V0xGxxerT9l2tKJqimqur8rL782bN0/F8I0zcVR
 dx2kmuZgCVX2uswEJrqjylOk8cpX4OeQf+IcQiEmYNg4RAAhVuFfIMYuG9M96hcI
 PiMdQE9tIDfH03M2+SmgbGJHbMbvsfj5GRb+0kph3HimrVoIB/pXDDo+4JSdbVjS
 vk+7QBhi/ms6JxZUKQQZKCmffLJ/31OF+IAkE4u6jWFL2jVA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 446kfg1x78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2025 09:21:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 00A5E4002D;
 Thu, 16 Jan 2025 09:19:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9EBB7281604;
 Thu, 16 Jan 2025 09:17:41 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 16 Jan
 2025 09:17:41 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 16 Jan 2025 09:17:29 +0100
Message-ID: <20250116081738.2511223-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_03,2025-01-16_01,2024-11-22_01
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kever Yang <kever.yang@rock-chips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabio Estevam <festevam@gmail.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Jonas Karlman <jonas@kwiboo.se>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Mathieu Othacehe <othacehe@gnu.org>, Robert Marko <robert.marko@sartura.hr>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Sjoerd Simons <sjoerd@collabora.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>, Simon Glass <sjg@chromium.org>,
 Sumit Garg <sumit.garg@linaro.org>
Subject: [Uboot-stm32] [PATCH v2 0/9] Restore USB and add UMS support for
	STiH407-B2260
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


This series is :
 _ restoring USB on STiH410-B2260 which hasn't been
   tested since a while.
 _ migrating STi DWC3 glue from proprietary driver to
   dwc3-generic driver.
 _ adding UMS support for STiH410-B2260.


Changes in v2:
  - remove useless include files
  - add dwc3-sti.c DWC3 wrapper as done for dwc3-am62.c
  - enable new flag USB_DWC3_STI

Patrice Chotard (9):
  ARM: dts: sti: Add fixed clock for ehci and ohci nodes in
    stih410-b2260.dtsi
  configs: stih410-b2260: Enable DM_REGULATOR flag
  usb: dwc3-generic: Reorder include
  usb: dwc3-generic: Add STih407 support
  configs: stih410-b2260: Enable USB_DWC3_GENERIC and USB_DWC3_STI flags
  usb: dwc3: Remove dwc3 glue driver support for STi
  configs: stih410-b2260: Enable DM_USB_GADGET flag
  board: stih410-b2260: Remove board_usb_init/cleanup()
  configs: stih410-b2260: Enable CMD_USB_MASS_STORAGE flag

 MAINTAINERS                            |   3 +-
 arch/arm/dts/stih410-b2260-u-boot.dtsi |  10 +
 board/st/stih410-b2260/board.c         |  30 ---
 configs/stih410-b2260_defconfig        |   5 +
 drivers/usb/dwc3/Kconfig               |   6 +
 drivers/usb/dwc3/Makefile              |   1 +
 drivers/usb/dwc3/dwc3-generic-sti.c    | 127 +++++++++++++
 drivers/usb/dwc3/dwc3-generic.c        |  20 +-
 drivers/usb/host/Kconfig               |   9 -
 drivers/usb/host/Makefile              |   1 -
 drivers/usb/host/dwc3-sti-glue.c       | 253 -------------------------
 include/dwc3-sti-glue.h                |  41 ----
 12 files changed, 154 insertions(+), 352 deletions(-)
 create mode 100644 drivers/usb/dwc3/dwc3-generic-sti.c
 delete mode 100644 drivers/usb/host/dwc3-sti-glue.c
 delete mode 100644 include/dwc3-sti-glue.h

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
