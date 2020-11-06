Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 826732A9010
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 08:12:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B24DC3FAE3;
	Fri,  6 Nov 2020 07:12:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EE61C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 07:12:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A67CFob005488; Fri, 6 Nov 2020 08:12:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ChFGyRr3b9mh03kUM6oZ/OLXUbNgBUlNCl+TgdxKDZw=;
 b=EzetVEp2Tt8+mv8JTNFx2adnj+z+s7/rgHx9TG44bGD+AmGUypCEmPkgP8r7Q1kpcbIr
 PxzhFXURMsXLmOuxXj5IEVZ6Ns/AobzMRC0fJpehvtI6+cepxY4OAbEYTNO/ie4/96V7
 ZKYg7l7FGhDx4RdEnNId5H8CgVKuP+txXG5t7hmbvfDfnuZnEWqWvZQ1YWytqJpvg6GK
 ZRUByiagDdUTs0YQU/mvbGjoeucm9ybs/px5ImNNBWra63/3ct5L7a6pvkYo9rl3TIv9
 knnypyaYuLah3u/2EATWD3YUT9nUH5J9LCYdWbeE1tJ6tEHRW/f4KEDWrDJbzUyWZOpp Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywrcfut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 08:12:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AF9A10003A;
 Fri,  6 Nov 2020 08:12:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E41722460A;
 Fri,  6 Nov 2020 08:12:39 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 08:12:11
 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 08:11:56 +0100
Message-ID: <20201106071200.6933-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_02:2020-11-05,
 2020-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v1 0/4] ARM: dts: STM32: MCU's DT update
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

   - Sync STM32 MCU's DT with kernel v5.10-rc1
   - Fix typo
   - Fix timer init
   - Sync armv7-m.dtsi with kernel v5.10-rc1


Patrice Chotard (4):
  ARM: dts: sync armv7-m.dtsi with kernel v5.10-rc1
  ARM: dts: stm32: DT sync with kernel v5.10-rc1 for MCU's boards
  ARM: dts: stm32: Fix timer initialization for stm32 MCU's board
  ARM: dts: stm32: Fix typo in stm32h7-u-boot.dtsi

 arch/arm/dts/armv7-m.dtsi                |   4 +-
 arch/arm/dts/stm32429i-eval-u-boot.dtsi  |   6 +-
 arch/arm/dts/stm32429i-eval.dts          |  21 +++--
 arch/arm/dts/stm32746g-eval-u-boot.dtsi  |   4 +-
 arch/arm/dts/stm32746g-eval.dts          |  13 ++-
 arch/arm/dts/stm32f4-pinctrl.dtsi        | 107 ++++++++++++++++++++---
 arch/arm/dts/stm32f429-disco-u-boot.dtsi |   6 +-
 arch/arm/dts/stm32f429-disco.dts         |  99 ++++++++++++++++++++-
 arch/arm/dts/stm32f429.dtsi              |  30 +++++--
 arch/arm/dts/stm32f469-disco-u-boot.dtsi |  26 +++---
 arch/arm/dts/stm32f469-disco.dts         |  19 ++--
 arch/arm/dts/stm32f469.dtsi              |   1 -
 arch/arm/dts/stm32f7-pinctrl.dtsi        |  22 ++---
 arch/arm/dts/stm32f7-u-boot.dtsi         |   3 +-
 arch/arm/dts/stm32f746-disco-u-boot.dtsi |   8 +-
 arch/arm/dts/stm32f746-disco.dts         |   2 +-
 arch/arm/dts/stm32f746.dtsi              |  12 ++-
 arch/arm/dts/stm32f769-disco-u-boot.dtsi |   4 +-
 arch/arm/dts/stm32f769-disco.dts         |   6 +-
 arch/arm/dts/stm32h7-u-boot.dtsi         |   6 +-
 arch/arm/dts/stm32h743-pinctrl.dtsi      |  10 +--
 arch/arm/dts/stm32h743.dtsi              |  37 +++++---
 arch/arm/dts/stm32h743i-disco.dts        |   2 +-
 arch/arm/dts/stm32h743i-eval.dts         |   2 +-
 24 files changed, 334 insertions(+), 116 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
