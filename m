Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3792855140B
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jun 2022 11:18:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFFECC5EC6B;
	Mon, 20 Jun 2022 09:18:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 499DCC5EC6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 09:18:32 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K8j0rl003757;
 Mon, 20 Jun 2022 11:18:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=rvR4yTZS1ftk9bsrV62+RuVByGORo3ilTlhA7UQj9gc=;
 b=I9zzxwnqV1dc7mP6N3W7xkfJERLAUJM3RkvR4McbTUKYowKZLtJKJ11QOL+JnG6C/9o5
 OOZfwIw3baNAAn4xq7Lqn3t55LEZmQzCfnVOPQZdpn530GY/yBAdPn5sVOLvyHZvx1Bu
 L/q3V3kfym53dPR2HF8vln+KuLdCi8RHY573sKtjcVhh2FcxvInx6FlMwD0Bk6HOcQ7r
 hARAK1RArO+NDgx7P88qATxF9Ni0mL71ww57JU/Wmvvc/JNeEHcRqLfXWZ66iVCEUFgM
 IxXGUSTi/aaOlRyYMaYrYsKR6R9/JVUsLoeUauRDKvPOQ2D6w78EUnm+qE4PDNu//9t9 /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gs71tj36f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 11:18:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 49F8D10002A;
 Mon, 20 Jun 2022 11:18:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4614F2171FB;
 Mon, 20 Jun 2022 11:18:31 +0200 (CEST)
Received: from localhost (10.75.127.119) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 11:18:31 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Jun 2022 11:17:12 +0200
Message-ID: <20220620111707.9.Ib45cd17f31c3ffeccd95a162ea3ecf7e5a4392a1@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620111707.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
References: <20220620111707.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 09/10] configs: stm32mp13: activate I2C support
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

Activate the I2C driver in STM32MP13x config.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp13_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 9b0c5a36b04..f58c73b7c79 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -24,6 +24,7 @@ CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
 CONFIG_CMD_CLK=y
 CONFIG_CMD_GPIO=y
+CONFIG_CMD_I2C=y
 CONFIG_CMD_MMC=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_TIME=y
@@ -37,6 +38,8 @@ CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_SYS_MMC_ENV_DEV=-1
 CONFIG_CLK_SCMI=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_STM32F7=y
 CONFIG_STM32_SDMMC2=y
 CONFIG_DM_ETH=y
 CONFIG_PINCONF=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
