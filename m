Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB246A109DA
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Jan 2025 15:49:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91A7EC78F65;
	Tue, 14 Jan 2025 14:49:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 764E3C78F64
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 14:49:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ED8GJb012102;
 Tue, 14 Jan 2025 15:48:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=qVGcNSudVeeIWGnOimpNyN
 CALC039EG9/DriGmeonuw=; b=Egak+CNkVvXhL3WkWQU032s0JKUzg/28N/PYpP
 yLkAN7gr0LT7gh1a2eahZaWbmA3dP9JgQfO3NVdg6sslAbPUg1YqJldBYcP4jjqY
 6T8RVyFtT9ZaVcqtmpPD+H6fBfBJ2fJCXNUiWlxYzbwg4qUr9A1m6ZiC8A1bWVKx
 ZFirWjGQL2uxxS3jnPDVfMzTDoKEv44N7nmq07sWS6Od9Bz7NkgRQkLtH3EUBKhZ
 0jxe/xD6VJ1ZkbsxL3mMtefcRO+twWhcwYDRqdXCVW+NPbCj7/2yqRjwzF/q9fPU
 8ugyqDPJiEZmdUuCgprrcdOZ57YzQlcgzR3S723AMqzH1nUA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4453a7ware-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2025 15:48:47 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8F56F40045;
 Tue, 14 Jan 2025 15:46:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 677062A98AA;
 Tue, 14 Jan 2025 15:45:31 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 14 Jan
 2025 15:45:31 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 14 Jan 2025 15:45:18 +0100
Message-ID: <20250114144528.1612168-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
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
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sjoerd Simons <sjoerd@collabora.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>, Simon Glass <sjg@chromium.org>,
 Sumit Garg <sumit.garg@linaro.org>
Subject: [Uboot-stm32] [PATCH 00/10] Restore USB and add UMS support for
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



Patrice Chotard (10):
  ARM: dts: sti: Add fixed clock for ehci and ohci nodes in
    stih410-b2260.dtsi
  configs: stih410-b2260: Enable DM_REGULATOR flag
  usb: dwc3-generic: Reorder include
  usb: dwc3-generic: Add STih407 support
  configs: stih410-b2260: Enable USB_DWC3_GENERIC flag
  dw3-generic: Add dependencies whith SYSCON and REGMAP
  usb: dwc3: Remove dwc3 glue driver support for STi
  configs: stih410-b2260: Enable DM_USB_GADGET flag
  board: stih410-b2260: Remove board_usb_init/cleanup()
  configs: stih410-b2260: Enable CMD_USB_MASS_STORAGE flag

 MAINTAINERS                            |   2 -
 arch/arm/dts/stih410-b2260-u-boot.dtsi |  10 +
 board/st/stih410-b2260/board.c         |  30 ---
 configs/stih410-b2260_defconfig        |   4 +
 drivers/usb/dwc3/Kconfig               |   4 +
 drivers/usb/dwc3/dwc3-generic.c        | 129 +++++++++++--
 drivers/usb/host/Kconfig               |   9 -
 drivers/usb/host/Makefile              |   1 -
 drivers/usb/host/dwc3-sti-glue.c       | 253 -------------------------
 9 files changed, 136 insertions(+), 306 deletions(-)
 delete mode 100644 drivers/usb/host/dwc3-sti-glue.c

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
