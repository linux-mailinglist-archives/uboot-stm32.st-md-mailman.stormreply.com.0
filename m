Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3C3E2039
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 18:12:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6777C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 16:12:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B34BBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 16:12:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NG6fdn009740; Wed, 23 Oct 2019 18:12:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=pKqhskLEolbp2uGzWaP+MspMGzBMgyIz9f4P2iEAACQ=;
 b=ferYc5Q2sqitv7ZoOddGNyuU3vuhZ5b/RRZBBDyXNqR21sN6gY8/ll86hasUFB1y2VMR
 m7Ya86QO/OJqpAkR4KoAJm4LiP66ivzCldn+Nj0Xb0wOz433PFegpKaOAiJTaxQmkH6m
 MHVPWKDfr14zhO53xGJAsb8grN3AfBQN/uVR7qOZyAasYYR83qJCEytjyGfoF/2yKmFY
 u9ItXLZ5+eceJni3taYDiMbQnwYSUC8+6b/Sj9MWknH8ukpdiLKdfZVPnxgqXwqj54wD
 qXmSBurjbSHfsDRZs2O+UogBPX+tI0Mjzu2JO2DHPyOkBCXVBJkCowNlKtvjIctUm2uj Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s4vna3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 18:12:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CDE1010002A;
 Wed, 23 Oct 2019 18:12:07 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C64932C2E62;
 Wed, 23 Oct 2019 18:12:07 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 18:12:07 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 18:12:07
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 18:11:58 +0200
Message-ID: <20191023161203.23616-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_04:2019-10-23,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 0/5] stm32mp1: activate gpio hog support and
	add new pinctrl ops
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

This serie updates the two pincontrol drivers for stm32mp1
and activates the gpio hog support to prepare the rebase on
the v5.4 linux kernel device tree.

The 2 last commits have dependency with the previous serie
"dm: add support of new binding in gpio and pincontrol"
http://patchwork.ozlabs.org/project/uboot/list/?series=138082

My working branch:
https://github.com/patrickdelaunay/u-boot/tree/dm

CI-Travis build:
https://travis-ci.org/patrickdelaunay/u-boot/builds/601829330

Regards.

Patrick


Patrick Delaunay (5):
  pinctrl: stmfx: add information on pin configuration
  pinctrl: stm32: add information on pin configuration
  stm32mp1: activate CONFIG_GPIO_HOG and update the gpio hog support
  gpio: stm32: add set_config ops
  gpio: stmfx: add set_config ops

 board/st/stm32mp1/stm32mp1.c        |  10 +-
 configs/stm32mp15_basic_defconfig   |   1 +
 configs/stm32mp15_optee_defconfig   |   1 +
 configs/stm32mp15_trusted_defconfig |   1 +
 drivers/gpio/stm32_gpio.c           |  58 ++++++++++++
 drivers/pinctrl/pinctrl-stmfx.c     | 140 ++++++++++++++++++++--------
 drivers/pinctrl/pinctrl_stm32.c     |  27 +++++-
 7 files changed, 190 insertions(+), 48 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
