Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ED17A6814
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Sep 2023 17:28:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57336C6C824;
	Tue, 19 Sep 2023 15:28:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29DCEC6B477
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 15:28:49 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38JCaeVT026711; Tue, 19 Sep 2023 17:28:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=6l204M8IV7BQBJCUuRnmYG1WtvCJL7LNIOpnBsDLS+M=; b=UN
 OCRunCQEU+KFlcw6DNE5OoMV3nN1GHaltxBiKJi5PHwhIgjW/BDjXZGmFuPHrs+J
 FAehqJhLuh/pSN5Kh80ijpjt9YavESby1jLtF2sBhxbK28pn9MT7/tKVKhNQWlP0
 0GoNwElfu/DjZmGfnTv3fQ3PHOvx3Akp6zYB/DvpgcBpN/Cp2EfTgZTgZOsKEfNR
 74YypqsRvizPA5CtjV2pyT7y8AGo4srHCFFN6QalUQNXU8goHVNlYIlOvyjHFIzl
 DefSXrq9LciQ7khFOPYqY9PcXvEfcWFGl0Xk9x3RHmkDfU0pMP1HWqBtkLVx8bmY
 ml+DPY/VPQauiNvHdaMw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t53pwub2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 17:28:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B76DF100058;
 Tue, 19 Sep 2023 17:28:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B093D21BF67;
 Tue, 19 Sep 2023 17:28:46 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 17:28:46 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 19 Sep 2023 17:27:54 +0200
Message-ID: <20230919152759.327420-3-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230919152759.327420-1-gatien.chevallier@foss.st.com>
References: <20230919152759.327420-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_06,2023-09-19_01,2023-05-22_02
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 2/7] configs: default activate
	CONFIG_RNG_STM32 for STM32MP13x platforms
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

Default embed this configuration. If OP-TEE PTA RNG is exposed, it means
that the RNG is managed by the secure world. Therefore, the RNG node
should be disabled in the device tree as an access would be denied
by the hardware firewall.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Changes in V2:
	- Added Patrick's tag

 configs/stm32mp13_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 82b62744f6..4a899c85de 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -65,6 +65,7 @@ CONFIG_DM_REGULATOR_GPIO=y
 CONFIG_DM_REGULATOR_SCMI=y
 CONFIG_RESET_SCMI=y
 CONFIG_DM_RNG=y
+CONFIG_RNG_STM32=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
