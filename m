Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52996323A61
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 11:20:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A3DFC57B59;
	Wed, 24 Feb 2021 10:20:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4712C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 10:20:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OAH5Bv007769; Wed, 24 Feb 2021 11:20:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=hU3EQvI0JcyZOblFchbKW4eRmXIPo4lhApbQxSbwVeo=;
 b=bnDmKgK3WCW1d5F0sTRErxu4FaQkhC1SoOpDpN8NuL0bU+eqOZFgjQhF48kdP30r9ceL
 lVu30vx8tSZBTTz3a5vAnjtHAABuknejLC2zm6Dq0RJBYHayHRB9vgY2YiHBCDGMRBWO
 B6r9I+q0PKYglYdK8p1kfulTIZ9M3Bl1SE4UL/JabSDo4t1Z5/HrG6sdZeYwrNNkPNFs
 ZhKTCbd0qseJ50tA7l3vd5YwBTGbMLMj/pb7ARdKPxki82wARmwUMVwjWrL579y8WUSz
 Xd7nQ66+f59isYyjHnMwdP6Lq/MuWI0n7L3H9UTtDLDMs0fsL8DfVxfn1n4L+Cruyvia YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66cd9mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 11:20:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 59C9110002A;
 Wed, 24 Feb 2021 11:20:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4359A225296;
 Wed, 24 Feb 2021 11:20:10 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Feb 2021 11:20:09
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Feb 2021 11:19:40 +0100
Message-ID: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_03:2021-02-24,
 2021-02-24 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH 0/6] stm32mp1_trusted_defconfig rely on SCMI
	support
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


This Serie is a preliminary step to allow support of secured clocks
provided by SCMI server running in secure world (TF-A or OP-TEE).

This serie only activate the needed drivers in the trusted defconfig
before alignment with device tree including SCMI support [1] and
upstream of SCMI server in TF-A/OP-TEE.

[1] current patch for SCMI clock support in device tree
 "ARM: dts: stm32: move clocks/resets to SCMI resources for stm32mp15"
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210126090120.19900-13-gabriel.fernandez@foss.st.com/



Etienne Carriere (2):
  ARM: dts: stm32mp1: explicit clock reference needed by RCC clock
    driver
  clk: stm32mp1: gets root clocks from fdt

Patrick Delaunay (4):
  scmi: Include device_compat.h
  scmi: define LOG_CATEGORY
  scmi: cosmetic: reorder include files
  configs: stm32mp1_trusted_defconfig rely on SCMI support

 arch/arm/dts/stm32mp151.dtsi                 |  4 ++
 configs/stm32mp15_trusted_defconfig          |  2 +
 drivers/clk/clk_stm32mp1.c                   | 62 ++++++++------------
 drivers/firmware/scmi/mailbox_agent.c        |  4 +-
 drivers/firmware/scmi/sandbox-scmi_agent.c   |  2 +
 drivers/firmware/scmi/sandbox-scmi_devices.c |  2 +
 drivers/firmware/scmi/scmi_agent-uclass.c    |  5 +-
 drivers/firmware/scmi/smccc_agent.c          |  3 +
 drivers/firmware/scmi/smt.c                  |  2 +
 9 files changed, 44 insertions(+), 42 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
