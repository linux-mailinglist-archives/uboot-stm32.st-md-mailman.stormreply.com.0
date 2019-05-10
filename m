Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 943971A102
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:11:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AB9FC9AE5A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:11:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D6A4C9AE54
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:11:39 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6CiK014689; Fri, 10 May 2019 18:11:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=+fCeoJM8YM8xNMTIZXjGsXsuVw3NiDjHY25F1+t5dbo=;
 b=a0+WZiwhhauIiBa2s74ufmOhZfnOZqaRO79QUxjLLYz+sSZllgL6EnVRI5orPBNxw0Z6
 uOtmheQtDZ0QC0amdIFAd6rcn5qe9ipqImug3D69PFYGoX3DeRN/g3XDEdyadgrvGiGO
 M7K5Xtlj5eCuBXBMrHCgOSKkPHbw6Hxd25heHeAOI4OiJ8b7n2uEunRkBxjXptiHOCXW
 D928JXc5Bmw2jbDmqpJwy6ngwci5Cra5N3z4dwjWPpdaaIyI7HCOAepFsgsSyyxUMR0+
 kmF8AYOweFuAX+kKOO5F8Dra7/Vud2NfU93/DsVTRAry6c6B/L68C+LpMUvh/TX18dch Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2scbkajk2j-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:11:35 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B6FDA34;
 Fri, 10 May 2019 16:11:34 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9939C2C20;
 Fri, 10 May 2019 16:11:34 +0000 (GMT)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:11:34 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:11:18 +0200
Message-ID: <1557504691-26188-2-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557504691-26188-1-git-send-email-patrice.chotard@st.com>
References: <1557504691-26188-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: Tom Rini <trini@konsulko.com>, Baruch Siach <baruch@tkos.co.il>,
 Christophe KERELLO <christophe.kerello@st.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jagdish Gediya <jagdish.gediya@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Chris Packham <judge.packham@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [Uboot-stm32] [PATCH 01/14] Prepare v2019.07-rc1
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

From: Tom Rini <trini@konsulko.com>

Signed-off-by: Tom Rini <trini@konsulko.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index f2c7bb6..d6a6ef1 100644
--- a/Makefile
+++ b/Makefile
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0+
 
 VERSION = 2019
-PATCHLEVEL = 04
+PATCHLEVEL = 07
 SUBLEVEL =
-EXTRAVERSION =
+EXTRAVERSION = -rc1
 NAME =
 
 # *DOCUMENTATION*
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
