Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA55ADF9D
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Sep 2022 08:16:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35C71C640FE;
	Tue,  6 Sep 2022 06:16:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E2B2C640F2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 06:16:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2865AeZQ014214;
 Tue, 6 Sep 2022 08:15:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=lO1MuN5JNxhBYx8CjSu2u2L1kOXHbQCOGheAZnDKLEU=;
 b=o+yXJ7gqIsdfiR+TRuerOwC8fSj7sgcdP0BYcW6D1FYokAc+TARHxY/sv5oqZ0NMrsXl
 66b4+8B80L0kASeLxXvYUQSGRJuhtkGtp6PH+HP4dKiQ8U4iSoKykRGN1CVchJ5t1sQy
 Qm6ILiNFUsAYd+XXRtIf3B+QPF+c7d7R5OKhDiIs4nnAIi4SHMTh0+ZhFGo8Y2cJKgzC
 mtI/VeCvqJg7/W99flWyS1YpGKwRsG8Uk0TaCjXcvH4JjdDpdRVWxmds7O28O459Bsuy
 5I13TPMHb5zjUlTw+/9Gd9MMEw0tHSjj9k4HCGsU0LJ+U5pcl4MTEV1sa8sslOTddBBU 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jdamg7077-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 08:15:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A7840100038;
 Tue,  6 Sep 2022 08:15:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2AD452132D2;
 Tue,  6 Sep 2022 08:15:32 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 6 Sep 2022
 08:15:31 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Sep 2022 08:15:25 +0200
Message-ID: <20220906061529.3788894-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_03,2022-09-05_03,2022-06-22_01
Cc: Fabio Estevam <festevam@denx.de>, Angus Ainslie <angus@akkea.ca>,
 Sean Anderson <seanga2@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Adam Ford <aford173@gmail.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Ramon Fried <rfried.dev@gmail.com>,
 Marek Vasut <marex@denx.de>, Wolfgang Denk <wd@denx.de>,
 Andre Przywara <andre.przywara@arm.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, Andrew Scull <ascull@google.com>,
 Michal Simek <michal.simek@amd.com>, Alexander Dahl <ada@thorsis.com>,
 Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v1 0/4] phy: Add generic_{setup,
	shutdown}_phy() helpers
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


In drivers ehci-generic.c and ohci-generic.c, specific phy
helpers has been added and shared 95% of common code.
Factorize this code in generic_{setup,shutdown}_phy() helpers
and update all consumers.



Patrice Chotard (4):
  phy: Add generic_{setup,shutdown}_phy() helpers
  usb: ohci: Make usage of generic_{setup,shutdown}_phy() helpers
  usb: ehci: Make usage of generic_{setup,shutdown}_phy() helpers
  usb: ehci: Remove unused ehci_{setup,shutdown}_phy() helpers

 drivers/phy/phy-uclass.c        | 42 +++++++++++++++++++++
 drivers/usb/host/ehci-generic.c |  6 +--
 drivers/usb/host/ehci-hcd.c     | 66 ---------------------------------
 drivers/usb/host/ehci-msm.c     |  4 +-
 drivers/usb/host/ehci-mx6.c     |  6 +--
 drivers/usb/host/ehci-pci.c     |  4 +-
 drivers/usb/host/ehci.h         |  4 --
 drivers/usb/host/ohci-generic.c | 56 ++--------------------------
 include/generic-phy.h           | 30 +++++++++++++++
 9 files changed, 85 insertions(+), 133 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
