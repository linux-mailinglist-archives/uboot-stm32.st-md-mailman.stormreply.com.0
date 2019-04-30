Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21779FD7E
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 18:08:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E54E9C35E04
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 16:08:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED561C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 16:08:54 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UFpdq4020405; Tue, 30 Apr 2019 18:08:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=m4LwrmOJHGE3oawAWJHxtBQt0jeOUFo+DgkRbNnj908=;
 b=MuzV3ZJBlbYu4RXusmR0jnhZ3gwSjoLKSw/GcO3Fi++qsLOhVm6vWzRTt2ANU/+jHqDh
 lcj996SAek1HL3QX5YHztESNAnHrQ3htVabzyQV2DVCkRvtRtBmMwixMWdKzpG4kW/3a
 QJWQeCL79Lxmc1Nq+DFQd+9EX5N7C/f/tTNrkAl1lLXiwz7nYGqtY180mxKxUtwPGAX+
 p25B0Eu7V58zF8oVA1H1wumSV2SCYr2JUAcHbEyiOzUgitcvcFK6WOPfO+SvDWNbRVRM
 hgV8G/3cUhii3dn+PpsUJALyks9C56WZdXZW0eSGFpoLQWnVA3+SjdtTlQ/HZnrNgbQr NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2s6r948d7w-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Apr 2019 18:08:33 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0F7923A;
 Tue, 30 Apr 2019 16:08:30 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEB882999;
 Tue, 30 Apr 2019 16:08:29 +0000 (GMT)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 30 Apr 2019 18:08:29 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Apr 2019 18:08:26 +0200
Message-ID: <1556640509-27836-1-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_08:, , signatures=0
Cc: Alexander Graf <agraf@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Christophe Kerello <christophe.kerello@st.com>,
 Liviu Dudau <Liviu.Dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Michal Simek <michal.simek@xilinx.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Mario Six <mario.six@gdsys.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, "Andrew F. Davis" <afd@ti.com>,
 Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH 0/3] Add SPI driver suport for STM32MP1
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
 - adds SPI1 clock entry in clock driver
 - adds STM32MP1 SPI driver
 - enables SPI for STM32MP1


Patrice Chotard (3):
  clk: stm32mp1: Add SPI1 clock entry
  spi: stm32: Add Serial Peripheral Interface driver for STM32MP
  configs: stm32mp15: Enable SPI relative flags

 MAINTAINERS                         |   1 +
 configs/stm32mp15_basic_defconfig   |   4 +
 configs/stm32mp15_trusted_defconfig |   4 +
 drivers/clk/clk_stm32mp1.c          |   7 +
 drivers/spi/Kconfig                 |   8 +
 drivers/spi/Makefile                |   1 +
 drivers/spi/stm32_spi.c             | 615 ++++++++++++++++++++++++++++++++++++
 7 files changed, 640 insertions(+)
 create mode 100644 drivers/spi/stm32_spi.c

-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
