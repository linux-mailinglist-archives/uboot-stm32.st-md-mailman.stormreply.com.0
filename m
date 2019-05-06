Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6435714762
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 May 2019 11:17:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31020C9AE49
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 May 2019 09:17:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1538C9AE41
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 09:17:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x469GrYF010403; Mon, 6 May 2019 11:17:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=YDmvYIa58WSrs82WfLbJHHWIQXAgvwbMBT0EZWFTVn0=;
 b=AKFPCOx1qnJdmtmro8kMEQprItKqjr/aV9XVopX1qw8l9W6J/9UeBBBHt1BGaHDreuC2
 kw9Da8Fw7s1vI3+JjNj3/1dEPdZjUCEQgS4gkav8qV+Dm7B7Ug2anZqD7lMx1fZgYLwb
 QqZvd1iceB6D+fyMfkL86kB7olYJN0aLHvju+5z2ICoVVCguCK+YRWZZlXtp6MhaAqZp
 xiUBAfxU1dc+dcEwdOCI7vsERP786daiJmlO5tevr9juBF3lLX5TsJy+OU120FTmXCUG
 blWFAYKU6KAclmzGn8qk5Ae12brjDkjFu74lkQX0/wjwSvzCAkIUKiHBdXXTcYM57hec Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2s94cd8eat-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 06 May 2019 11:17:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F1793D;
 Mon,  6 May 2019 09:17:08 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE84415C7;
 Mon,  6 May 2019 09:17:07 +0000 (GMT)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 6 May 2019 11:17:07 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 6 May 2019 11:16:51 +0200
Message-ID: <1557134223-4549-1-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_06:, , signatures=0
Cc: Tom Rini <trini@konsulko.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Lokesh Vutla <lokeshvutla@ti.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH 00/12] SPI flash STM32 MCU's fixes
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


This series update MCU's DT in order to fix SPI flash
configuration:
  - Adds MPU region dedicated for SPI flash used in memory mapped mode.
  - Fixes compatible string.
  - Fixes memory map size.
  - Updates spi-tx-bus-width and spi-rx-bus-width property values.
  - Adds QSPI flash support for STM32F469-disco board


Patrice Chotard (12):
  mach-stm32: Add MPU region for spi-nor memory mapped region
  ARM: dts: stm32: Fix qspi memory map size for stm32f7 boards
  ARM: dts: stm32: add qspi flash compatible string for stm32f769-disco
  ARM: dts: stm32: add qspi flash compatible string for stm32f746-eval
  ARM: dts: stm32: Set spi-rx/tx-bus-width to 4 for stm32f746-eval
  ARM: dts: stm32: Set spi-rx/tx-bus-width to 4 for stm32f746-disco
  ARM: dts: stm32: Remove useless spi-nor compatible string
  ARM: dts: stm32: Set spi-rx/tx-bus-width to 4 for stm32f769-disco
  ARM: dts: stm32: Add qspi support for stm32f469-disco board
  spi: Kconfig: Add STM32F4 support for STM32_QSPI driver
  configs: stm32f469-disco: Enable QSPI relative flags
  configs: stm32f469-disco: Disable PINCTRL_FULL flag

 arch/arm/dts/stm32746g-eval-u-boot.dtsi  |  6 +++--
 arch/arm/dts/stm32f469-disco-u-boot.dtsi | 39 ++++++++++++++++++++++++++++++++
 arch/arm/dts/stm32f746-disco-u-boot.dtsi |  8 +++----
 arch/arm/dts/stm32f769-disco-u-boot.dtsi |  3 +++
 arch/arm/mach-stm32/soc.c                |  3 +++
 configs/stm32f469-discovery_defconfig    |  9 ++++++++
 drivers/spi/Kconfig                      |  2 +-
 7 files changed, 63 insertions(+), 7 deletions(-)

-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
