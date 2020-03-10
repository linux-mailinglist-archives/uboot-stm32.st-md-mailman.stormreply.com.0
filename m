Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244617F339
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 10:15:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 296E2C36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 09:15:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC00BC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 09:15:22 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02A9EsF7013955; Tue, 10 Mar 2020 10:15:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wRhyh/+hrM3lbK3R2emoWhfpUy0a8TGCkQaw/J137Ro=;
 b=KhLobw6w93cCmm4qq4TFwAtUFUGZXkzvPxjlGZn71dfCnp61cxQHAjv5Z9xT0b03yq1X
 andDeRfgiPf8lfj79sHBiBWzZMsj2mkJFgW8Hra8iKDeV3yxXW3O7XYAe3/IGTP1RfOU
 SCw65WSkZ/875uMvk8yGZSGD87SugVZHt/iG1SsAOugEts99xoesFyrne8kdY7LTx5Zc
 SiY9E4N3wUf1r+/UhBHQ4Js/JsR5aZ+W1C4yq7eofmMNBAs+R1BO1XGS8qYp5uLXIDIX
 Qf5ZLolq6RWSN9Hl7Uj9RxDsyPTWjVf0POdlY7B4WE5HH27DfcAy/wh8Jw9pxKz9g6+N ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym292a5na-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2020 10:15:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA1C510003D;
 Tue, 10 Mar 2020 10:15:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A6D821FE91;
 Tue, 10 Mar 2020 10:15:13 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 10 Mar 2020 10:15:13 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 10 Mar 2020 10:15:03 +0100
Message-ID: <20200310091505.24862-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310091505.24862-1-patrick.delaunay@st.com>
References: <20200310091505.24862-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_04:2020-03-09,
 2020-03-10 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH v4 2/4] Revert "stm32mp1: remove the imply
	BOOTSTAGE"
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

This reverts the workaround introduced by the
commit 16fec9b0bc1a ("stm32mp1: remove the imply BOOTSTAGE")
As the bootstage alignment issue is now solved.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 arch/arm/mach-stm32mp/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index e4d621dee8..1489cbd5f3 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -62,7 +62,9 @@ config TARGET_ST_STM32MP15x
 	bool "STMicroelectronics STM32MP15x boards"
 	select STM32MP15x
 	imply BOOTCOUNT_LIMIT
+	imply BOOTSTAGE
 	imply CMD_BOOTCOUNT
+	imply CMD_BOOTSTAGE
 	imply CMD_CLS if CMD_BMP
 	imply DISABLE_CONSOLE
 	imply PRE_CONSOLE_BUFFER
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
