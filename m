Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7503730E98
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 May 2019 15:11:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 391F2C08554
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 May 2019 13:11:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D3B9C0854E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2019 13:11:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4VD7iaM005876; Fri, 31 May 2019 15:11:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=bKpy9pVUTsAVosAQjAccdpYILPTRNGymjGDHgnoQCJc=;
 b=KO17zhdXtQO8okIGbhESAZMKFK7Hg1LqOGxPGRlTKngxiybJvxnPt0VDhYpBp7R6NjC+
 gSrDquqwFXt6SkzqK7d/bjja9GbWwC0tVjUcN1KEGvcdxIh98yimM9vtnbW8CgMnWugt
 pggbLWT4dOCoRHYK2QdTx7MSnLI+GTms6SWC3K0bu4eve2WVEUMZBXh09a/5p6SFhHxO
 cDNQHBIyBzM4Rdr9ZxxRdwTc7j/Kv0LBiTeGDVybND3u31kp1XT9ctXU161ZpkJrKAIw
 HY/vL0f1otmaXg20oL9RdHx99Oe7r4T/yJ3ZwmDtSjJNCQ8NtPQbfw3ROHTs1geo44cG 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sptuacgdk-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 31 May 2019 15:11:51 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE27831;
 Fri, 31 May 2019 13:11:50 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B9AD829C8;
 Fri, 31 May 2019 13:11:50 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May
 2019 15:11:50 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May 2019 15:11:50
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Fri, 31 May 2019 15:11:35 +0200
Message-ID: <1559308296-17027-7-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-31_07:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH v3 6/7] MAINTAINERS: Add stm32 remoteproc
	driver
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

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 33fd465..5c505d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -309,6 +309,7 @@ F:	drivers/power/pmic/stpmic1.c
 F:	drivers/power/regulator/stm32-vrefbuf.c
 F:	drivers/power/regulator/stpmic1.c
 F:	drivers/ram/stm32mp1/
+F:	drivers/remoteproc/stm32_copro.c
 F:	drivers/misc/stm32_rcc.c
 F:	drivers/reset/stm32-reset.c
 F:	drivers/spi/stm32_qspi.c
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
