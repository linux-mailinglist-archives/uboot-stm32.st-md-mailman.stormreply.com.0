Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6434DF55
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Apr 2019 11:23:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F09FC35E03
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Apr 2019 09:23:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E333BC36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 09:23:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3T9Mugn026985; Mon, 29 Apr 2019 11:23:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=LL8/flEh3u2qFs8Scv1VKpSriON+yRaHAT0GsRS6Bac=;
 b=pvENhkEIko/67SMlqb4MGzraXV+gERuwIUYT4EqKtcLOEp9kJ6u/4Uit5NIxQd9TSQnA
 8BuY2P8FyXETV5cgfy9RS9F5VX/fCEvoBLTexsJUJ4K/Lg8rVG0u5qIvIl9G7u1NsRvh
 mc+kXlb6CG4ZCMa42wco8ebmFEKGgXtLLknLsIMiBxFnl4n7E0Rowefv1AHjaK0I2vRr
 dbyWUJtqt+fVPhK92P5K/3TAxXy9L6kKmHGuDSAjHmRu9wDBbuVM/QTkMCer3+9Mfjkk
 PBpQ/FyJSaBEyo7osOrKLCj2r62PHYvBjdkQo/WpNuaabAW781f7yFol7ik8EAJ1mPG/ RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s4c7441gk-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 29 Apr 2019 11:23:46 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8CE8231;
 Mon, 29 Apr 2019 09:23:44 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69FFD1424;
 Mon, 29 Apr 2019 09:23:44 +0000 (GMT)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 29 Apr 2019 11:23:44 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: Simon Glass <sjg@chromium.org>, <michal.simek@xilinx.com>, <sr@denx.de>,
 <u-boot@lists.denx.de>
Date: Mon, 29 Apr 2019 11:23:21 +0200
Message-ID: <1556529805-23820-1-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 0/4] Add watchdog support for STM32MP1
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


This series:
  - sorts Kconfig entries in alphabetical order
  - enable watchdog support in SPL for STM32MP1
  - adds watchdog support to STM32MP1 boards



Patrice Chotard (4):
  watchdog: Kconfig: Sort entry alphabetically
  ARM: dts: stm32mp: Add iwdg2 support for stm32mp157c
  watchdog: stm32mp: Add watchdog driver
  configs: stm32mp15: Enable WDT flags

 MAINTAINERS                         |   1 +
 arch/arm/dts/stm32mp157-u-boot.dtsi |   4 ++
 arch/arm/mach-stm32mp/Kconfig       |   1 +
 configs/stm32mp15_basic_defconfig   |   2 +
 configs/stm32mp15_trusted_defconfig |   2 +
 drivers/watchdog/Kconfig            |  91 +++++++++++++-----------
 drivers/watchdog/Makefile           |   1 +
 drivers/watchdog/stm32mp_wdt.c      | 135 ++++++++++++++++++++++++++++++++++++
 8 files changed, 196 insertions(+), 41 deletions(-)
 create mode 100644 drivers/watchdog/stm32mp_wdt.c

-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
