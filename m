Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A07F75BEAB6
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Sep 2022 18:04:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D123C640F0;
	Tue, 20 Sep 2022 16:04:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98C4EC62D6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 16:04:40 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KFgIKV009381;
 Tue, 20 Sep 2022 18:04:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=2LVic5c7bEypwGLJLZKYAfH+oCrezOEhvFxS1Fq1wkg=;
 b=ESKHNQ8vdg1ye5UJHZHczubcOb/ae1i/YGTcy6lIYryxNHrEmcrqq4InP5OvJmg5eJw8
 IQiYKzBBZV9WykqDt7qpLoPSWP93TFclhIedOqBFgCEti5y5fSp7Zc1hX1nFErtSCGuN
 XxYXOxfZFdjgYCeHlt2RH3NJLDx7ZDqYM9wJICl06GaBOMUgEmswFMJAsdRnGlIjr8kt
 26oGlhH0Ek0DNuddNz4BKzDahZCM6Vyd/nFG/t36zyyQBWqlrUmihYt+urdxNIpDE2aB
 HBFx5bXeP6GShFfKQhPLiAFbJqCLVhPymaEIARiab82uEaZiwCnDNjBKVab+Nc+wmLDH Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6g5akfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 18:04:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42F6210002A;
 Tue, 20 Sep 2022 18:04:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 219A1245530;
 Tue, 20 Sep 2022 18:04:39 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 20 Sep
 2022 18:04:38 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 20 Sep 2022 18:04:29 +0200
Message-ID: <20220920160436.117811-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE6.st.com (10.75.127.70) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_06,2022-09-20_02,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v2 0/7] SPL fixes for STM32F7 MCUs
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


This series is fixing issues in SPL boot mode:
   - SPL binary size over 0x8000 bytes for STM32F746-disco, STM32F769-DISCO and STM32746G-EVAL boards
   - fix embedded flash size for STM32F769-DISCO
   - fix CONFIG_SYS_SPL_ARGS_ADDR for STM32F746-DISCO and STM32746G-EVAL

Changes in v2:
  - Remove SYS_UBOOT_FLAG from stm32f746-disco.h

Patrice Chotard (7):
  configs: stm32f746-disco: Fix SPL boot
  configs: stm32f769-disco: Fix SPL boot
  configs: stm32746g-eval: Fix SPL boot
  configs: stm32f746-disco: Fix CONFIG_SYS_SPL_ARGS_ADDR
  configs: stm32746g-eval: Fix CONFIG_SYS_SPL_ARGS_ADDR
  config: stm32f769-disco: Fix internal flash size
  configs: stm32f746-disco: Remove CONFIG_SYS_UBOOT_START flag

 arch/arm/include/asm/arch-stm32f7/stm32.h | 6 +++---
 configs/stm32746g-eval_spl_defconfig      | 9 +++++----
 configs/stm32f746-disco_spl_defconfig     | 9 +++++----
 configs/stm32f769-disco_defconfig         | 2 +-
 configs/stm32f769-disco_spl_defconfig     | 9 +++++----
 include/configs/stm32f746-disco.h         | 1 -
 6 files changed, 19 insertions(+), 17 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
