Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB264CEF9
	for <lists+uboot-stm32@lfdr.de>; Thu, 20 Jun 2019 15:36:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5371C63327
	for <lists+uboot-stm32@lfdr.de>; Thu, 20 Jun 2019 13:36:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73EACC63326
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2019 13:36:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5KDWlR2024219; Thu, 20 Jun 2019 15:35:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=/uxovGov3Owzx5TeeN6n4BWdBLNN8U2iV3XvSG5M7WY=;
 b=ELFPonlflQL4MVB7cIW5diN9xTyPBkNHQY6SEnwyxel3YfJrs5AzUW6goDJ727GclePz
 NVyhRcp/PqjaG8gOLhnk/u5c4IwLKwQ8wnG9tCOfCKubBMiyRi9xQEpHiyF0TBBn61bY
 l0+uj61gEAjr6NChqkhp54s99BhqebgrVJJmAYI7crAh+bVCyCjFG81CqRZx8jnkaEE6
 /VSrQeW/O6PfZMvh3s0BDSPE2ee4GqA+ml/1317fOmX9iqIrCI0/M0mxR1Z3X8je4OtZ
 oZTkwdCRkOg/3n997whOnHmayeMiauUPO4QtSym20JjErgK0tdJFXajyokXfukdXNbOY ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t781v1yjc-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 20 Jun 2019 15:35:47 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5424538;
 Thu, 20 Jun 2019 13:35:45 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0CAB72A65;
 Thu, 20 Jun 2019 13:35:45 +0000 (GMT)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 20 Jun 2019 15:35:44 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 20 Jun 2019 15:35:28 +0200
Message-ID: <20190620133528.7584-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_09:, , signatures=0
Cc: Ryder Lee <ryder.lee@mediatek.com>, Liviu Dudau <Liviu.Dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Alexander Graf <agraf@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Patrice Chotard <patrice.chotard@st.com>, Mario Six <mario.six@gdsys.cc>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Stefan Roese <sr@denx.de>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>
Subject: [Uboot-stm32] [PATCH] MAINTAINERS: Add git custodians for ARM STM
	STM32MP entry
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

Add git custodians for STMicroelectronics STM32MP entry.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 14c332e423..455466df25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -297,6 +297,7 @@ ARM STM STM32MP
 M:	Patrick Delaunay <patrick.delaunay@st.com>
 M:	Patrice Chotard <patrice.chotard@st.com>
 L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
+T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm
 S:	Maintained
 F:	arch/arm/mach-stm32mp/
 F:	drivers/clk/clk_stm32mp1.c
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
