Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08021213CBD
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 17:37:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C47DEC36B24
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 15:37:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A0B0C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 15:37:36 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 063FX98d002298; Fri, 3 Jul 2020 17:37:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=JT/EgjMvT9BGlYUQQpfEQPtdABruY+WNSCjTwnx6Cbs=;
 b=DtJ/jEclyswuoJdCeBe77MpRTnJvJvmlKAO2Y1KOpfggquPx/J3N7zIwG0Kpqzd7ejWQ
 mRH1c6ozi0gKRU3BWLnjxdMeehFO9kK/VAW4pck6KWhklfuu416M1PMc8wMrEJm7zPQh
 vouhgDLujzoL10J8x1jVE0n5tywxLjSkM/qMRx7pXVsp9D5md1JKGlzNI+M7gkPVaUeC
 opR5aAZNSkuBztEpfJAvtDRD7/IXK5ZEBr/p0u7OroTm+o8svSrAhQjzpJPl3CO4KrP8
 46BPv1g7lqsl1vNPjC8xOZNQNNlUYginDa1aK5TimOPk1OqHTkxBTc7ImQniOoOfpXgg 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuvwqa3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 17:37:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08B6A100039;
 Fri,  3 Jul 2020 17:36:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDC362A9AFF;
 Fri,  3 Jul 2020 17:36:58 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 3 Jul 2020 17:36:58 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Jul 2020 17:36:39 +0200
Message-ID: <20200703153646.28533-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_10:2020-07-02,
 2020-07-03 signatures=0
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Weijie Gao <weijie.gao@mediatek.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot-amlogic@groups.io,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Michal Suchanek <msuchanek@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Anatolij Gustschin <agust@denx.de>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [Uboot-stm32] [PATCH v3 0/7] phy: generic: add error trace to
	detect PHY issue in uclass
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


Hi,

it is a V3 serie for [1].

After rebase 2 patches are no more needed:
[v2,2/8] usb: gadget: dwc2: change trace level for phy errors managed by uclass
[v2,6/8] usb: dwc3: change trace level for phy errors managed by uclass

And I add a patch in this V3 serie:
[PATCH v3 7/7] arm: meson: change trace level for phy errors managed

Regards,

Patrick

[1] [v2,1/8] phy: generic: add error trace to detect PHY issue in uclass
http://patchwork.ozlabs.org/project/uboot/list/?series=159187&state=*

Changes in v3:
- rebase on next branch
- removed added dm/device_compat.h include after rebase
- simplify test on ops presence after Marek review
- add update for mach-meson board-gx: new generic_phy API usage

Changes in v2:
- Rebase and add include dm/device_compat.h
- Added patch after rebase: new generic_phy API usage

Patrick Delaunay (7):
  phy: generic: add error trace to detect PHY issue in uclass
  board: sunxi: change trace level for phy errors managed by uclass
  usb: host: ohci: change trace level for phy errors managed by uclass
  usb: host: ehci-hcd: change trace level for phy errors managed by
    uclass
  ata: dwc-ahci: change trace level for phy errors managed by uclass
  usb: musb-new: sunxi: change trace level for phy errors managed by
    uclass
  arm: meson: change trace level for phy errors managed by uclass

 arch/arm/mach-meson/board-gx.c  |  8 +++---
 board/sunxi/board.c             |  2 +-
 drivers/ata/dwc_ahci.c          |  4 +--
 drivers/phy/phy-uclass.c        | 45 +++++++++++++++++++++++++++++----
 drivers/usb/host/ehci-hcd.c     |  8 +++---
 drivers/usb/host/ohci-generic.c |  8 +++---
 drivers/usb/musb-new/sunxi.c    |  8 +++---
 7 files changed, 59 insertions(+), 24 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
