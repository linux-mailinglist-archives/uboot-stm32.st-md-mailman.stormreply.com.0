Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D19558D44E
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Aug 2022 09:14:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DAA8C04000;
	Tue,  9 Aug 2022 07:14:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC5C7C04000
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Aug 2022 07:14:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2791I7B7013029;
 Tue, 9 Aug 2022 09:14:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=hI/O/YbtY2zHs5mW7RG0E/VW7QdUFT5d8FKlHIkBnzo=;
 b=PaM8rNqmn43W1IdJuuWglyCvyDnSJny+SBIgNhzosQ7pkAFz/rr6HbDWSEx5YsieQFBw
 H3V5HsweKt9ON56nikuNkkhIwKogDVXMHjmT3j0G5IEVN61ErfWz9EStn+3A17yRoUbA
 k/xA31udRnfAoFdNkEHzTVVR+OE3lTGlf+tbvf0e/dtScZn5N7v1EFnApG1CUEvuAsIu
 xPknfsk2Du3RmWH1UCZ5z05s60wnx9t0bTxn28z6TDt9wqEo/FNvlGB5cLSwjt9S6y5G
 LB212hEt2FTOdnaKXdcb12DjUKbc4grzEHfImk0Oj5jTKSPTCAtguu0ipoejIBRUkKqJ Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hudt11ch5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 09:14:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9E21310002A;
 Tue,  9 Aug 2022 09:14:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A36A3215159;
 Tue,  9 Aug 2022 09:14:20 +0200 (CEST)
Received: from localhost (10.75.127.117) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 9 Aug
 2022 09:14:20 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Aug 2022 09:14:11 +0200
Message-ID: <20220809071415.366133-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE6.st.com (10.75.127.70) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_03,2022-08-09_01,2022-06-22_01
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Eddie James <eajames@linux.ibm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 0/4] gpio: update gpio_get_status()
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


Currently, if pin's function is GPIOF_FUNC, only "func" if displayed
without any other information. It would be interesting, if information is
available, to indicate which pinmuxing's name is used.


Changes in v2:
   - add gpio test

Patrice Chotard (4):
  gpio: Allow to print pin's label even for pin with GPIOF_FUNC function
  gpio: Fix pin's status display for pin with GPIOF_UNUSED function
  pinctrl: pinctrl_stm32: Populate uc_priv->name[] with pinmux node's
    name
  gpio: sandbox: Add GPIOD_IS_AF for gpio configured in alternate
    function

 drivers/gpio/gpio-uclass.c              | 18 ++++++++++-----
 drivers/gpio/sandbox.c                  |  5 +++++
 drivers/pinctrl/pinctrl_stm32.c         |  8 +++++--
 include/asm-generic/gpio.h              |  1 +
 include/dt-bindings/gpio/sandbox-gpio.h |  3 +++
 test/dm/gpio.c                          | 30 +++++++++++++++++++++++++
 6 files changed, 57 insertions(+), 8 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
