Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A094E97A6
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Mar 2022 15:11:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F41A8C5EC47;
	Mon, 28 Mar 2022 13:11:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91C2DC5C842
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 13:11:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S8K8CF021069;
 Mon, 28 Mar 2022 15:11:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=535/o59FcJgbJJ7gqqcpFg+mJP4533aWFIJfsKIe2xw=;
 b=mXz8hZo4EhAEs/7MOK0X9/jjZx3UK/vo864WIhrh8y/Wj/077GB4PPLPB1zomGmk8Eb3
 jCf0jZWrYsWYBZVYqqTlS7rGImfXyQXunIz1sXtRoQdxPcNDZLNtRPPuJKDp9Uk+AzEG
 98Tvut7efdvWmBdjAaJkjXc63lfL1gz9Pa6SoA1lbgZrlMBTR8MiBlQxZU/A0QyMgW4q
 joXSKFycmQNerArgID3gg8Ssn2+vsRpEpDGrgHSMgqw3lUPgKBQZ1PZDXb++KTDVES8f
 f7UiQHQVBtYtFxEEuM1xnFbylOPwqz5b4P8lOCcM+Df8+4Fbr5YT4Ro3koL/LvT16pNd KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1u241hxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 15:11:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 79F2B10002A;
 Mon, 28 Mar 2022 15:11:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 750E22194FE;
 Mon, 28 Mar 2022 15:11:34 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 28 Mar 2022 15:11:33
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Mar 2022 15:11:28 +0200
Message-ID: <20220328151023.v2.3.I0782b2e4122e700b562bf2149fa3668e82a15b24@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328151023.v2.1.I2d5fc62b65a61d4e11ce442f3b5572ec03f39cf6@changeid>
References: <20220328151023.v2.1.I2d5fc62b65a61d4e11ce442f3b5572ec03f39cf6@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_05,2022-03-28_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH v2 3/3] configs: add support of OPTEE RNG in
	stm32mp15 defconfig
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

When the RNG device is secured with OP-TEE, it is only accessible with
the HWRNG TA, the CONFIG_RNG_OPTEE is needed for STM32MP15 targets
with OP-TEE support.

The probe of this RNG driver fails when the TA is not available in OP-TEE
and the previous driver can be used, as CONFIG_RNG_STM32MP1 is activated
and when the associated node is activated in the device tree with:

&rng1 {
	status = "okay";
};

When the RNG is used in OP-TEE, this node should be deactivated in
the Linux and U-Boot device tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 configs/stm32mp15_defconfig         | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 2beb88e81d..3f48c677e6 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -119,6 +119,7 @@ CONFIG_DM_REGULATOR_STPMIC1=y
 CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_RESET_SCMI=y
 CONFIG_DM_RNG=y
+CONFIG_RNG_OPTEE=y
 CONFIG_RNG_STM32MP1=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index c6857d08ec..9f869aca36 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -120,6 +120,7 @@ CONFIG_DM_REGULATOR_STPMIC1=y
 CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_RESET_SCMI=y
 CONFIG_DM_RNG=y
+CONFIG_RNG_OPTEE=y
 CONFIG_RNG_STM32MP1=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
