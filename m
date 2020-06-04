Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B03D61EE465
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 14:30:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3408FC36B23
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 12:30:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CF44C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2020 12:30:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 054CC37C029075; Thu, 4 Jun 2020 14:30:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=b6gofwzwkYDOJXwj3mZwjbFCr6rup1nknQxjrg6aKac=;
 b=A+BEL2ZWq8vrYZp8WwMibsecXWFSxgGPV3WQpOm9faC+9rqPxlYJtVzIUHJSuikr6uin
 Ng31kUaltCUYCC6s/IucwxiuQw5Z1bRwCrvFJeD4m6OYyH91Pfu8IHaYukOod7A3Vs6J
 AQdClIWKXvUqUAGbmrGmKSFaqbYj8r/oN/T0YrcUCFiexfsO4lkYLnH11/FYFlMk22uU
 DqbAiQ4Fd5RD/A8NAZGukMpdqMgeei3zXBZlMpApRvO+4hnjV51ji+MBexzVr5U07lL5
 L7ORhqSEt/zbP6sSh+YlN+o7TOSd5brCkZSmrTlL2UHPjJjf3xdsI/nexBpcwIZQbCq5 xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31becg9y28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 14:30:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C893B100034;
 Thu,  4 Jun 2020 14:30:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A464210F6A;
 Thu,  4 Jun 2020 14:30:35 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 4 Jun 2020 14:30:34 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Jun 2020 14:30:22 +0200
Message-ID: <20200604123033.25499-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_10:2020-06-02,
 2020-06-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 00/11] stm32mp1: activate gpio hog support
	and add new pinctrl ops
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

This V2 serie of [1] updates the two pincontrol drivers for stm32mp1
and activates the gpio hog support.
It also adds pin information in pinmux command output for stm32 and
stmfx.

It is a rebased version, as dependency [2] is accepted merged.
I also split some patch for review.

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=138122&state=*

[2] V3 "dm: add support of new binding in gpio and pincontrol"
    http://patchwork.ozlabs.org/project/uboot/list/?series=152777&state=*

Regards.

Patrick


Changes in v2:
- NEW: split previous patch [5/5] gpio: stmfx: add set_config ops
- NEW: split previous patch [5/5] gpio: stmfx: add set_config ops
- NEW: split previous patch [5/5] gpio: stmfx: add set_config ops

Patrick Delaunay (11):
  configs: stm32mp1: activate CONFIG_GPIO_HOG
  board: stm32mp1: update the gpio hog support
  gpio: stm32: add ops set_dir_flags
  gpio: stm32: add ops get_dir_flags
  gpio: stmfx: move function to prepare new ops introduction
  gpio: stmfx: rename function used to change pin configuration
  gpio: stmfx: add function stmfx_read_reg and stmfx_write_reg
  gpio: stmfx: add ops set_dir_flag
  gpio: stmfx: add ops get_dir_flags
  pinctrl: stmfx: add information on pin configuration
  pinctrl: stm32: add information on pin configuration

 board/st/stm32mp1/stm32mp1.c        |  10 +-
 configs/stm32mp15_basic_defconfig   |   1 +
 configs/stm32mp15_trusted_defconfig |   1 +
 drivers/gpio/stm32_gpio.c           | 149 ++++++++++++++++--
 drivers/pinctrl/pinctrl-stmfx.c     | 225 ++++++++++++++++++++--------
 drivers/pinctrl/pinctrl_stm32.c     |  27 +++-
 6 files changed, 325 insertions(+), 88 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
