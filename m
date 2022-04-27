Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 239B7511670
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Apr 2022 13:54:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E38E5C6046D;
	Wed, 27 Apr 2022 11:54:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E888EC6049D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Apr 2022 11:54:07 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RAEWjt005834;
 Wed, 27 Apr 2022 13:54:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=7SHepgh8SfCl2IVPelCWGOzPYSeObMFDHmoDTvJC90I=;
 b=0OZEpiQYMQlnn7HA3YEkXKyrvcBrGJ56lyb5UJZzBLaKfiQN/99OFg9DBlWoYh6yC++R
 L+0Cloj2SisIu0lM1O++8EMHfeZbxxwG+OfE1dF2OITNp3GTPH3mKavTvJED21NVu4vl
 M9p15tqtFNhv/5SvNyEk6N7H78vCi5N+phUuH3R1vSN5FE1sSKqpi4L+6VUfu+P6ehL+
 lA2ukz4EmCqMSk5lMKRXigZAim1zw5o236FVbZpC1B1wY2G3D5eE0MMIt6cDJbOB2ACr
 yuO+L9dBXIpmy1fMrDzMfzfkyJI22VYQ8YGyK7qHPMgMnmowNi0kTNkrlkOolvoeRQ3p OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fprt4ujga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 13:54:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5796010002A;
 Wed, 27 Apr 2022 13:54:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5043521E69F;
 Wed, 27 Apr 2022 13:54:03 +0200 (CEST)
Received: from localhost (10.75.127.44) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 27 Apr
 2022 13:54:03 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 27 Apr 2022 13:53:49 +0200
Message-ID: <20220427115401.155400-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-27_04,2022-04-27_01,2022-02-23_01
Cc: Vikas Manocha <vikas.manocha@st.com>, Simon Glass <sjg@chromium.org>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 00/12] stm32: add new board support,
	defconfig and documentation
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

Add new stm32746g-eval board support
Add defconfig for SPL and none SPL mode for STM32F7 boards.
Add documentation on how to build and flash STM32 MCUs.

Changes in v2:
   - fix documentation file stm32_MCU.rst

Patrice Chotard (12):
  configs: stm32f746-disco: Concatenate spl and u-boot binaries
  configs: stm32f746-disco: Rename stm32f746-disco_defconfig to
    stm32f746-disco_spl_defconfig
  configs: stm32f746-disco: Add stm32f746-disco_defconfig
  configs: stm32f769-disco: Rename stm32f769-disco_defconfig to
    stm32f769-disco_spl_defconfig
  configs: stm32f769-disco: Add stm32f769-disco_defconfig
  configs: stm32f769-disco: Migrate SPL flags to defconfig
  configs: stm32f746-disco: Migrate SPL flags to defconfig
  board: stm32f746-disco: Fix dram_init() in none SPL config
  configs: stm32f746-disco: use CONFIG_DEFAULT_DEVICE_TREE as fdtfile
  configs: stm32746g-eval: Add stm32746g-eval_defconfig
  configs: stm32746g-eval: Add stm32746g-eval_spl_defconfig
  doc: Add documentation for STM32 MCUs

 arch/arm/mach-stm32/Kconfig                |  20 ---
 board/st/stm32f429-discovery/MAINTAINERS   |   1 +
 board/st/stm32f429-evaluation/MAINTAINERS  |   1 +
 board/st/stm32f469-discovery/MAINTAINERS   |   1 +
 board/st/stm32f746-disco/MAINTAINERS       |   5 +
 board/st/stm32f746-disco/stm32f746-disco.c |   2 +-
 board/st/stm32h743-disco/MAINTAINERS       |   1 +
 board/st/stm32h743-eval/MAINTAINERS        |   1 +
 board/st/stm32h750-art-pi/MAINTAINERS      |   1 +
 configs/stm32746g-eval_defconfig           |  64 +++++++
 configs/stm32746g-eval_spl_defconfig       |  86 ++++++++++
 configs/stm32f746-disco_defconfig          |   9 +-
 configs/stm32f746-disco_spl_defconfig      |  86 ++++++++++
 configs/stm32f769-disco_defconfig          |   9 +-
 configs/stm32f769-disco_spl_defconfig      |  87 ++++++++++
 doc/board/st/index.rst                     |   1 +
 doc/board/st/stm32_MCU.rst                 | 186 +++++++++++++++++++++
 include/configs/stm32f746-disco.h          |   3 +-
 18 files changed, 528 insertions(+), 36 deletions(-)
 create mode 100644 configs/stm32746g-eval_defconfig
 create mode 100644 configs/stm32746g-eval_spl_defconfig
 create mode 100644 configs/stm32f746-disco_spl_defconfig
 create mode 100644 configs/stm32f769-disco_spl_defconfig
 create mode 100644 doc/board/st/stm32_MCU.rst

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
