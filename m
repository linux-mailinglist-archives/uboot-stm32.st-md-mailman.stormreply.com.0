Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 863305A62E9
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Aug 2022 14:09:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F383C640FC;
	Tue, 30 Aug 2022 12:09:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9418C5EC6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 12:09:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U9SHKH029915;
 Tue, 30 Aug 2022 14:09:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=7dRStxo1tOhRD+1SnObrepPRLAejTCZza4qcEyku5HU=;
 b=wYwpeTx/NBdAtdEDNh1ojl9dx8zPN1R2Ey6MTi46tfwJrBfdy9LxjnO54fD+5s3bAb70
 DKbWCKYs3ibTO0QR4BK+3pSTUpNTOiHr5rYOnX9Oun+vXK9k8ad6tk7UwgWGWNRz46vk
 k5r1geNi/tv69K1p1G8hOFkwOw7SkEk1bboPAXX5lk7FQSyooLDLh4iYfehOkkTH6rrW
 M0r2BaLv7iF9ayjSIfPf021qcYZHuOhM8Qm4ziWLKCPSDAnYyL9/i9gQdxKfbzTEIONE
 s3Ik3gow3Y+L6rpdzElGa/XUmKb7ZYq7iQCyd6L58Aice4uH6GT4psEqLvNdSHnn2zIW wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j7am0yjsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 14:09:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F1B110002A;
 Tue, 30 Aug 2022 14:09:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5EC98226FCA;
 Tue, 30 Aug 2022 14:09:20 +0200 (CEST)
Received: from localhost (10.75.127.44) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 30 Aug
 2022 14:09:20 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Aug 2022 14:09:10 +0200
Message-ID: <20220830120914.2329522-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_06,2022-08-30_01,2022-06-22_01
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Eddie James <eajames@linux.ibm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 0/4] gpio: update gpio_get_status()
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


Changes in v3:
   - add lost Simon Glass's reviewed-by during v1 review in patch 1 and 2

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
