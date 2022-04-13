Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C85B4FF9AE
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Apr 2022 17:05:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D84B6C6049C;
	Wed, 13 Apr 2022 15:05:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99CE4C60496
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 15:05:16 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23DEwJn5000824;
 Wed, 13 Apr 2022 17:05:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=DNnQOTxLX30BVz/uWGPw+tv3QYPhEms58TdWkc31F2w=;
 b=Jyn9fekgrS+2vE0YnaEhV2/McE1GLT6bRdeQO0jf/dwsk4xb5DY0I3nIMUlq+AYdJEOe
 0PmAPKauWvhzmX8/ea5Bk0dfW02BnI8nWZ8trUL7SnmNc8SytG8tBfIb0hzvbtlNsns6
 4Vb7S04TzkIj4zycEdqmven9t8v0ioB3uxvJdA9xjU8yl2j8QWi9OQUpFBnrcEIe9d4R
 cxDUp538JaOiDX+yn2p2tzd+3lqXsJQ8wTkqtJ+d/cJWpN71+qQIZB0+P3PmU8RRZVmf
 /vjt4mvj1uC8Dt3AgghSvzlNF+Wf4druBKWzXTeWDY8JXgSUQXDwxJhuFZVhC/CqrzZI xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fb74qeues-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Apr 2022 17:05:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3431E10002A;
 Wed, 13 Apr 2022 17:05:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C7CA221789;
 Wed, 13 Apr 2022 17:05:13 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Apr
 2022 17:05:13 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 13 Apr 2022 17:04:48 +0200
Message-ID: <20220413150500.23883-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_02,2022-04-13_01,2022-02-23_01
Cc: Vikas Manocha <vikas.manocha@st.com>, Simon Glass <sjg@chromium.org>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v1 00/12] stm32: add new board support,
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
 configs/stm32f746-disco_defconfig          |   7 +-
 configs/stm32f746-disco_spl_defconfig      |  86 ++++++++++
 configs/stm32f769-disco_defconfig          |   7 +-
 configs/stm32f769-disco_spl_defconfig      |  87 ++++++++++
 doc/board/st/index.rst                     |   1 +
 doc/board/st/stm32_MCU.rst                 | 186 +++++++++++++++++++++
 include/configs/stm32f746-disco.h          |   3 +-
 18 files changed, 526 insertions(+), 34 deletions(-)
 create mode 100644 configs/stm32746g-eval_defconfig
 create mode 100644 configs/stm32746g-eval_spl_defconfig
 create mode 100644 configs/stm32f746-disco_spl_defconfig
 create mode 100644 configs/stm32f769-disco_spl_defconfig
 create mode 100644 doc/board/st/stm32_MCU.rst

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
