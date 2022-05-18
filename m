Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E62C352B295
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 May 2022 08:47:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C76AC03FC8;
	Wed, 18 May 2022 06:47:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B167C035BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 May 2022 06:47:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24I5HiPX024882;
 Wed, 18 May 2022 08:46:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=3YmsCEwjrruekMIAnfA8lf8W7Gqy6oGEfxkL3OtLQao=;
 b=3hyvmFjcp+1sQBiBRxuILNqH9DsEvTfV29e3z3vmF+W5wG0HsjIjMJZ95zYK2G5yK+N7
 6B8EbuaDBIIz7sGWKsF9karkwAyomabJsFEDbY6NMSWwqsFCb1pOA4B7e8Pbhlm47fKr
 3vzKhLAQRqcQO7H7AsTI72QKxDw/zslRQiZi0DfpotOrIXovpr1GCIagfXhcxCrSWMLp
 Fl/WyB8GykGaB60Zi1EaR4NO19QuLWuoOuILN6wQxEHOvMrq1CXEikmiJ6m5CWMlo1FK
 sPL84K/tTnptK/RBgg5ceaB/zcVxeflLSo4/XsRLT7rYBvxRKkzN8yRa5bjkYcaaihoj 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23ahq0xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 08:46:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A123100034;
 Wed, 18 May 2022 08:46:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49DC720FA5A;
 Wed, 18 May 2022 08:46:50 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 18 May
 2022 08:46:49 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 May 2022 08:46:45 +0200
Message-ID: <20220518064648.1843664-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_02,2022-05-17_02,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Biwen Li <biwen.li@nxp.com>,
 Vignesh R <vigneshr@ti.com>, Jassi Brar <jaswinder.singh@linaro.org>,
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
Subject: [Uboot-stm32] [RESEND PATCH v4 0/3] spi: spi_flash_probe_bus_cs()
	rely on DT for spi speed and mode
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
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
