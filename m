Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6826FCD3
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 17:26:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 992E9C35E09
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 15:26:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD035C35E03
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 15:26:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UFLgtZ016934; Tue, 30 Apr 2019 17:26:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=5oOudXHZUxzR+fyUvpj8se1eCpJ1hRRb4gdgpnbvDSQ=;
 b=M9pupNrqcQTAxkHW3YewtCq1sStk1wTHOPSIHSPfDARhGOeKj7MaHYCvcN9sQH/RtK3G
 Q7Dm4u8a0mo3ZsbmLpQ7bs4lIAqBqp7NO0cBIiHVTiyl0QcNfcWSWliZtFqz3enxIlnx
 LoHMlpadJfzGBVRWVJHrVYvxgF8v0MSinpJOv+GS6h4+XxBqxItJ7F7SOesEM+ME7YlL
 xYXchz7Wy5HeNe0cKqFq65gYgSRU8gSpdHu5Gt5YuvOBDMZswb9WFp97SVHVqwZF3LR6
 EHAzEN6FXYa7mngHxJS3GoMRPNyFNnBuH5SgkJpAPxB6NbM5ONlRegTPmoHpk3YZ8NGi Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s61r0evh3-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Apr 2019 17:26:30 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E953334;
 Tue, 30 Apr 2019 15:26:29 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE82128B8;
 Tue, 30 Apr 2019 15:26:29 +0000 (GMT)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 30 Apr 2019 17:26:29 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: Simon Glass <sjg@chromium.org>, <michal.simek@xilinx.com>, <sr@denx.de>,
 <u-boot@lists.denx.de>
Date: Tue, 30 Apr 2019 17:26:19 +0200
Message-ID: <1556637983-5654-1-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 0/4] Add watchdog support for STM32MP1
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


Changes in v2:
   - Rename timeout variable in timeout_ms in stm32mp_wdt_start()

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
