Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0EC4E995
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:40:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 148A9CA75C1
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:40:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ED56CA75BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:40:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDeNKW000636; Fri, 21 Jun 2019 15:40:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=GHMtLza8y6FiK8YVjE1phJGrVmSfBAVWqvhuOQYQLTE=;
 b=XRjBN1sEfNhe9pqNFhEAnzwC79OYYXzqbiZoqcs2ZydNwrIHEy+PQ1A7Fa1KrJTbOMtm
 KArN2lqWBr4TFVemHSMzJF2+0oGT9FnnigYas8ZmfiGzMs4ioG8im8RmY/uo2Euh6S5B
 gzEYRFVrOceM4K6sFI7Oe2BpcY/z4QzLPjrJCD5bR7iSlt1cN9k9dOcOZ4j8MkO5VVu7
 mRGofj8oVl2C4Lxshpf2ZDaBobA+43qSqssMvfLDrjmOzHeNnX1Z+rU/W2gWNsnGgnPB
 ad6yTw6Og1YdWEImKX0k+WPXxKj0oH1dkZtfi6tCOP4PkSrnXmn44c0UF14RrIyO+fDS pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t78137vqp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:40:24 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1670548;
 Fri, 21 Jun 2019 13:39:27 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB21C2A69;
 Fri, 21 Jun 2019 13:39:26 +0000 (GMT)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 21 Jun 2019 15:39:26 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:39:21 +0200
Message-ID: <20190621133925.8643-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_10:, , signatures=0
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Bin Meng <bmeng.cn@gmail.com>, Christophe Kerello <christophe.kerello@st.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Simon Glass <sjg@chromium.org>,
 Weijie Gao <weijie.gao@mediatek.com>, Michal Simek <michal.simek@xilinx.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, Stefan Roese <sr@denx.de>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [Uboot-stm32] [PATCH 0/4] STM32 gpio/pinctrl update
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


  - Rename stm32f7_gpio to stm32_gpio
  - Update .bind callback for pinctrl_stm32 driver
  - Remove useless "st,stm32-gpio" compatible string in DT
  - Remove .ofmatch callback from stm32_gpio driver


Patrice Chotard (4):
  gpio: stm32: Rename stm32f7_gpio to stm32_gpio
  pinctrl: stm32: update .bind callback
  ARM: dts: stm32: Remove useless "st,stm32-gpio" compatible string
  gpio: stm32: Remove .ofmatch callback

 arch/arm/dts/stm32429i-eval-u-boot.dtsi       | 11 -------
 arch/arm/dts/stm32f429-disco-u-boot.dtsi      | 11 -------
 arch/arm/dts/stm32f469-disco-u-boot.dtsi      | 11 -------
 arch/arm/dts/stm32f7-u-boot.dtsi              | 17 ----------
 arch/arm/dts/stm32mp157-u-boot.dtsi           | 12 -------
 drivers/gpio/Kconfig                          |  4 +--
 drivers/gpio/Makefile                         |  2 +-
 drivers/gpio/{stm32f7_gpio.c => stm32_gpio.c} |  6 ----
 drivers/pinctrl/pinctrl_stm32.c               | 32 ++++++++++++++++++-
 9 files changed, 34 insertions(+), 72 deletions(-)
 rename drivers/gpio/{stm32f7_gpio.c => stm32_gpio.c} (97%)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
