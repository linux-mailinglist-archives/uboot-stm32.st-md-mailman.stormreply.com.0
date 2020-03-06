Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C0317B9EF
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:14:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6749C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 10:14:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 703D4C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 10:14:17 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026A4OrF009684; Fri, 6 Mar 2020 11:14:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=CCHuNETVxPByWHHvlP5wZrk2FutAOE5jI2aVRj1P/PY=;
 b=Q2lnNRluXUvtHAFIKndJ9Ff6EaZ5NO4Ym5zbyRp4L0/fVv/x1KA0iced84IvPaW7/oK0
 q59zU+TKPWf1yUwxQcew8/zHFg4yKcSMhO6eQ8182hLM5kzlJcGifhxtMHCp1xZcDuiQ
 JU12JFwKe0KAiYhQP4aJWbJ9F/ESyTY9JbvtR2btDkEGqs8kpD88QuKmM6L8/M0h/Lsg
 jhgbnpGHA3Lnn3INgbQfQ6nBbqGtCybfMrSUJA3h4tfhRSyVRxFDxBgzRbJ31i8u1jW2
 pW+UAk6ooVBqbqD0sffK4krDSn6F3dn05zJOQ5cJ65j9Am51R0fP0RnUO4nKTL0AugZT Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfea7ef1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:14:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 35FC810002A;
 Fri,  6 Mar 2020 11:14:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BFFF2A7189;
 Fri,  6 Mar 2020 11:14:14 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 11:14:13 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 11:14:02 +0100
Message-ID: <20200306101412.15376-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 0/9] ram: stm32mp1: fixes
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


This serie fixes the stm32mp1 ram driver:
- adapt voltage for the LPDDR2 and LPDDR3
- solve tuning and BIST issues
- allow to skip built-in calibration

Most of these patch are available on the latest STM32MP downstrean
U-Boot: https://github.com/STMicroelectronics/u-boot



Patrick Delaunay (9):
  ram: stm32mp1: increase vdd2_ddr: buck2 for 32bits LPDDR
  ram: stm32mp1: display result for software read DQS gating
  ram: stm32mp1: don't display the prompt two times
  ram: stm32mp1: tuning: add timeout for polling BISTGSR.BDDONE
  ram: stm32mp1: tuning: deactivate derating during BIST test
  ram: stm32mp1: update BIST config for tuning
  ram: stm32mp1_ddr: fix self refresh disable during DQS training
  ram: stm32mp1: reduce delay after BIST reset for tuning
  ram: stm32mp1: the property st,phy-cal becomes optional

 arch/arm/dts/stm32mp15-ddr.dtsi               |   3 +
 arch/arm/mach-stm32mp/include/mach/ddr.h      |   6 +-
 board/st/stm32mp1/board.c                     |  23 +-
 .../memory-controllers/st,stm32mp1-ddr.txt    |   2 +
 drivers/ram/stm32mp1/stm32mp1_ddr.c           |  54 ++++-
 drivers/ram/stm32mp1/stm32mp1_ddr.h           |   1 +
 drivers/ram/stm32mp1/stm32mp1_ddr_regs.h      |   1 +
 drivers/ram/stm32mp1/stm32mp1_interactive.c   |  17 +-
 drivers/ram/stm32mp1/stm32mp1_ram.c           |  34 ++-
 drivers/ram/stm32mp1/stm32mp1_tuning.c        | 223 +++++++++++++++---
 include/power/stpmic1.h                       |   1 +
 11 files changed, 300 insertions(+), 65 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
