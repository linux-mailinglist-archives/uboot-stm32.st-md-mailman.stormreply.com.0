Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBBF359678
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 09:36:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91F03C56639;
	Fri,  9 Apr 2021 07:36:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2CA8C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 07:36:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1397a5vP029592; Fri, 9 Apr 2021 09:36:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=X+zVCdkjehWbF+A2rg5jED0HFrgMEWtmulZAqzgZbR8=;
 b=ZW/0djt0k/25P2cgiAMRpIe1pjPx3Zf7Z2shzajUtK9FBPk7g4FyhxXMd6AYUAcyW3pP
 xFoyj/HoAgEdHMQpLKnASEpLM69sMwdX0wq+HCU+xq/z/Cd/mrq4Sbr/J3kpcF8tPWw3
 jKwgn1qpB11KInBXOEmAz9J2zAzIaTaslfkTzRIRBqYi89VlKx445sSOBaU4ZAye7Fh0
 I32jXUNdmZNl9gw+XHeuqqE6TlYR3ErJuWwOfU2ecicTrymw/lUOxHL/TEe9wEQgJSwo
 iEOUlbTlMP0tmZ3KqVLRykyO17mD1dyMczSbfn6LGS+a1lFD5MrzCg9c9dcK2ocfsJcv 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37sw5yxuvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 09:36:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3592410002A;
 Fri,  9 Apr 2021 09:36:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14E7121B2EC;
 Fri,  9 Apr 2021 09:36:20 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr 2021 09:36:19
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 9 Apr 2021 09:36:15 +0200
Message-ID: <20210409073617.16045-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_04:2021-04-08,
 2021-04-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, Lukasz Majewski <lukma@denx.de>,
 Pratyush Yadav <p.yadav@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [Uboot-stm32] [PATCH v1 0/2] cmd: bind: Fix driver binding
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
   - fix the bind command
   - add dwc2 bcdDevice in USB gadget controller


Patrice Chotard (2):
  cmd: bind: Fix driver binding on a device
  usb: gadget: Add bcdDevice for the DWC2 USB Gadget Controller

 cmd/bind.c                        |  2 +-
 drivers/core/device.c             |  2 +-
 drivers/core/lists.c              | 11 ++++++++---
 drivers/core/root.c               |  2 +-
 drivers/misc/imx8/scu.c           |  2 +-
 drivers/serial/serial-uclass.c    |  2 +-
 drivers/timer/timer-uclass.c      |  2 +-
 drivers/usb/gadget/gadget_chips.h |  8 ++++++++
 include/dm/lists.h                |  3 ++-
 test/dm/nop.c                     |  2 +-
 test/dm/test-fdt.c                |  2 +-
 11 files changed, 26 insertions(+), 12 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
