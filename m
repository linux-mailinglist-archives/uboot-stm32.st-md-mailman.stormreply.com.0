Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CCA1C5ED
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 May 2019 11:22:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8732AC35E08
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 May 2019 09:22:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0475C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 09:21:16 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E96xoX001197; Tue, 14 May 2019 11:20:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=faHO7zEj8Km6uTAcxdwEPmKa384U5AziqFazg8Nbtd8=;
 b=UqnVRgngaWOY8OmKFIRYfZH4MtsuQYX8sg5YDgguv83aRSD5ikOZf/8vDpEc+uuvszy+
 EJxIyYVK96UkuVNKCfzW3GsTZEJ4wg22s3HjmDf6C2ppkto6DQLV9BIXUNK3oFF5AwnS
 KX0Krjc7LV8TLtCu0KtTNG8gNQTx+kLYCdbqQVOMG7ImJIbnHiKnM9MpxzVNRihKxBpm
 wrOAeZNe9OgsWtTbDqCYwPnwFlJeM9qpOep0ai+siSSwM/F54lu8Z2L2Z8o9LbqbVY1b
 7zlNjCStbFCxL40J2+Q8S9LbzGCx4PMJ+XQBitMJs7Gas/7jt9h9jCk4ENo/+02pyJGa qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdm5tyxec-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 14 May 2019 11:20:54 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9E8103A;
 Tue, 14 May 2019 09:20:50 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 49E871693;
 Tue, 14 May 2019 09:20:50 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May
 2019 11:20:50 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May 2019 11:20:49
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Patrick Delaunay <patrick.delaunay@st.com>, Albert Aribaud
 <albert.u.boot@aribaud.net>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>, Alexander Graf
 <agraf@suse.de>, Stefan Roese <sr@denx.de>, Mario Six <mario.six@gdsys.cc>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, "Andrew F . Davis"
 <afd@ti.com>, Michal Simek <michal.simek@xilinx.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Ryder Lee <ryder.lee@mediatek.com>, Liviu Dudau
 <Liviu.Dudau@foss.arm.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, York Sun <york.sun@nxp.com>,
 "Andreas Dannenberg" <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>, "Lokesh Vutla" <lokeshvutla@ti.com>
Date: Tue, 14 May 2019 11:20:33 +0200
Message-ID: <1557825637-25153-1-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_05:, , signatures=0
X-Mailman-Approved-At: Tue, 14 May 2019 09:22:33 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 0/4] mailbox: introduce stm32-ipcc driver for
	stm32mp157
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

This patchset adds the mailbox ipcc driver for the stm32mp1 SOC
and enables it for the stm32mp157 boards.

Fabien Dessenne (4):
  mailbox: introduce stm32-ipcc driver
  MAINTAINERS: Add stm32 mailbox IPPC driver
  configs: stm32mp15: enable IPCC mailbox
  ARM: dts: stm32: Add ipcc mailbox support on stm32mp1

 MAINTAINERS                         |   1 +
 arch/arm/dts/stm32mp157a-dk1.dts    |   4 +
 arch/arm/dts/stm32mp157c-ed1.dts    |   4 +
 arch/arm/dts/stm32mp157c.dtsi       |  13 +++
 configs/stm32mp15_basic_defconfig   |   2 +
 configs/stm32mp15_trusted_defconfig |   2 +
 drivers/mailbox/Kconfig             |   7 ++
 drivers/mailbox/Makefile            |   1 +
 drivers/mailbox/stm32-ipcc.c        | 167 ++++++++++++++++++++++++++++++++++++
 9 files changed, 201 insertions(+)
 create mode 100644 drivers/mailbox/stm32-ipcc.c

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
