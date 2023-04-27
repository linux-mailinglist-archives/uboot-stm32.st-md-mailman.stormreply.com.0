Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 528A76F06BC
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Apr 2023 15:36:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1768BC6907C;
	Thu, 27 Apr 2023 13:36:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15D18C6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 13:36:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RAm7ci004715; Thu, 27 Apr 2023 15:36:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=q5vg5BxCJxatI4XmqpaPwh+FEcyd1dAoii729ttyFXs=;
 b=hEvu+aOyGrnw222RmYXIC3hVpnzYw7cGAgB4SfxzgBfdqGvmi+ADo3wLA41f/5Wt5mR/
 CmqANTW8H0oYfq+fcNIl87xeH4IasWNqoLZiy/Z+wlHOGg6wioya04jwpThM6HadqJNJ
 O1VsVgZwgIZZNDj22N8Z1w20L16VR10ZwcuQll5N0KdkpmHweRpImqYpsYfzFw735f+U
 tfTmv6GrUkgDd9NbNFf8X6DCz5wKuu3xr4roE5dWXAaQ8zCxZBQncnO5Jn5nXT0DQ0jB
 +9LoXR99iwrkT0bLiKGUweHyC+V9vI9fOX7MRT+Svcy0GeF6lhAbX0hwKvxPo46Il35c eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q6xdjm4nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 15:36:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0982810002A;
 Thu, 27 Apr 2023 15:36:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB466226FD5;
 Thu, 27 Apr 2023 15:36:48 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 27 Apr
 2023 15:36:48 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 27 Apr 2023 15:36:32 +0200
Message-ID: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_07,2023-04-27_01,2023-02-09_01
Cc: Marek Vasut <marex@denx.de>, CITOOLS <MDG-smet-aci-reviews@list.st.com>,
 Simon Glass <sjg@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/6] stm32mp: soome changes and fixes for
	STM32MP13 and STM32MP15 boards
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

here come some cleanups and fixed for the STM32MP13 and STM32MP15 boards.



Patrick Delaunay (6):
  stm32mp: add support of STM32MP15x Rev.Y
  stm32mp: bsec: add check on null size in misc ops
  configs: stm32mp1: reduce DDR_CACHEABLE_SIZE to supported 256MB DDR
  stm32mp: stm32prog: fix OTP read/write error management
  stm32mp: stm32prog: use the decimal format by default for offset
    parsing
  pmic: stpmic1: support new prefix node name for regulator

 arch/arm/mach-stm32mp/bsec.c                    |  4 ++--
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 11 +++++++++--
 arch/arm/mach-stm32mp/include/mach/sys_proto.h  |  1 +
 arch/arm/mach-stm32mp/stm32mp15x.c              |  5 ++++-
 configs/stm32mp13_defconfig                     |  2 +-
 configs/stm32mp15_defconfig                     |  2 +-
 drivers/power/pmic/stpmic1.c                    |  2 ++
 7 files changed, 20 insertions(+), 7 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
