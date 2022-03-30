Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 494624EBBC9
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Mar 2022 09:33:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07731C60465;
	Wed, 30 Mar 2022 07:33:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C50A5C01577
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 07:33:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22U2u5oQ017466;
 Wed, 30 Mar 2022 09:33:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=RjBh+O+7pTWJHuXNu/Ip+N+sq6dC6vFs0Vxg7PqECXk=;
 b=1I25NSuSKNoScQflD7HGXtpVFwT8rmKUYhUeAJ7/OK61XlB1dBEr4Gh/DXNPl4coqRn4
 2RlcKEcdpQZ7uT4VzewNwQpdTcmy7Pq5Z0F4yYux7JQYmptq2Iamdjq3H2lKkw3zmwVq
 bNSCFiQf7/b7ngCUK2Mtn8v8MO5iyuiwh/wuPb3f4UZ3J5wHsIkGqbhjv+qFLSv2K7XU
 I9kcnJJcT/0mCQofunyINIo5bO/djjBYJt3yS3skSWFzSFQipTA45yzuGlWhVoZJBOY6
 rDLqtnzVNyiz21/EFPnGcOtsBllxA3iprFtUNywZmPywmhY4pz+RXTbKxMhLSilVLP2X Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1tkmfeyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 09:33:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5222810002A;
 Wed, 30 Mar 2022 09:33:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3C9BA2128CB;
 Wed, 30 Mar 2022 09:33:26 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 30 Mar
 2022 09:33:25 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 30 Mar 2022 09:33:12 +0200
Message-ID: <20220330073315.7703-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_02,2022-03-29_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, Anji J <anji.jagarlmudi@nxp.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Chaitanya Sakinam <chaitanya.sakinam@nxp.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Pratyush Yadav <p.yadav@ti.com>, Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH v4 0/3] spi: spi_flash_probe_bus_cs() rely on
	DT for spi speed and mode
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


Since commit e2e95e5e2542 ("spi: Update speed/mode on change")
when calling "sf probe" or "env save" on SPI flash,
spi_set_speed_mode() is called twice.

spi_get_bus_and_cs()
      |--> spi_claim_bus()
      |       |--> spi_set_speed_mode(speed and mode from DT)
      ...
      |--> spi_set_speed_mode(default speed and mode value)

The first spi_set_speed_mode() call is done with speed and mode
values from DT, whereas the second call is done with speed
and mode set to default value (speed is set to CONFIG_SF_DEFAULT_SPEED)

This is an issue because SPI flash performance are impacted by
using default speed which can be lower than the one defined in DT.

One solution is to set CONFIG_SF_DEFAULT_SPEED to the speed defined
in DT, but we loose flexibility offered by DT.

Another issue can be encountered with 2 SPI flashes using 2 different
speeds. In this specific case usage of CONFIG_SF_DEFAULT_SPEED is not
flexible compared to get the 2 different speeds from DT.


Changes in v4:
  - Split previous series in 3 patches
  - Update commit message with additionnal information

Changes in v3:
  - Update commit header to reflect what the patch really do.
  - Rename legacy spi_get_bus_and_cs() to _spi_get_bus_and_cs().
  - New spi_get_bus_and_cs() rely on DT for spi speed and mode values.
  - spi_flash_probe_bus_cs() rely also on DT for spi and mode values.

Changes in v2:
  - add spi_flash_probe_bus_cs_default() which calls spi_get_bus_and_cs()
    with "use_dt" param set to true, whereas spi_flash_probe_bus_cs() calls
    spi_get_bus_and_cs() with "use_dt" param set to true.

Patrice Chotard (3):
  spi: spi-uclass: Add new spi_get_bus_and_cs() implementation
  spi: spi_flash_probe_bus_cs() rely on DT for spi speed and mode
  test: dm: spi: Replace _spi_get_bus_and_cs() by spi_get_bus_and_cs()
    in some case

 board/CZ.NIC/turris_mox/turris_mox.c |  6 +--
 cmd/sf.c                             | 15 +++++--
 cmd/spi.c                            |  4 +-
 drivers/mtd/spi/sf-uclass.c          | 33 +++++++-------
 drivers/net/fm/fm.c                  |  4 +-
 drivers/net/pfe_eth/pfe_firmware.c   | 19 ++------
 drivers/net/sni_netsec.c             |  6 +--
 drivers/spi/spi-uclass.c             | 66 +++++++++++++++++++++++++---
 drivers/usb/gadget/max3420_udc.c     |  4 +-
 env/sf.c                             |  1 -
 include/spi.h                        | 19 +++++++-
 include/spi_flash.h                  |  1 -
 test/dm/spi.c                        | 33 +++++++-------
 13 files changed, 137 insertions(+), 74 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
