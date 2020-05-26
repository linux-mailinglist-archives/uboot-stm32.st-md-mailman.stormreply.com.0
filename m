Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A9B1E1F1F
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 May 2020 11:50:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73FAAC36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 May 2020 09:50:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3769C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 09:50:17 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04Q9o9Y8027344; Tue, 26 May 2020 11:50:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=nI1+No94v2bUzs+tpw8wE/PquQmedS96h/3FLKIloSE=;
 b=bW1krOzEUpM2+da4C+nD4RWP+3L6Rr3ZgF+G6mkjWrIp1ctqzDXzQK8qnSbCS5csFaiU
 B6iXL7SEpbsRyK0OXdLecbTGE1nTeDB9WSyjBtTtk7PWeouFT57/XgP/8YpDiLnPVCVi
 JKnoNScYQCNSWw/OAtdSeo+fvszWhsyCTKjOv+eB+19VoxHyE/giCVxlGepMHM14+7Bb
 tL6iziFqNt3izcWklDxtUm6a5zgy63wqt8dRWXGM8mNfbhxyopRsYCzDoUue9n4nQeNW
 2XE1mAS46pFFG+XGoP9WSiIMfUAd0quXTLNYwiafM48NMMEKMCT05yAi56P6BT8wFcKF gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316sa1y16d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 11:50:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA4BF100034;
 Tue, 26 May 2020 11:48:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C9DAD2BE24C;
 Tue, 26 May 2020 11:48:04 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 May 2020 11:48:04 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 May 2020 11:48:02 +0200
Message-ID: <20200526094802.10927-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-26_01:2020-05-26,
 2020-05-26 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] doc: log: correct option name
	CONFIG_LOG_MAX_LEVEL
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

Replace CONFIG_(SPL_)MAX_LOG_LEVEL by the correct name as defined in
common/Kconfig:
line 668:config LOG_MAX_LEVEL
line 688:config SPL_LOG_MAX_LEVEL
line 708:config TPL_LOG_MAX_LEVEL

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 doc/README.log | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/doc/README.log b/doc/README.log
index 1057981f45..170e4ba24e 100644
--- a/doc/README.log
+++ b/doc/README.log
@@ -60,13 +60,13 @@ Enabling logging
 The following options are used to enable logging at compile time:
 
    CONFIG_LOG		- Enables the logging system
-   CONFIG_MAX_LOG_LEVEL - Max log level to build (anything higher is compiled
+   CONFIG_LOG_MAX_LEVEL - Max log level to build (anything higher is compiled
 				out)
    CONFIG_LOG_CONSOLE	- Enable writing log records to the console
 
 If CONFIG_LOG is not set, then no logging will be available.
 
-The above have SPL versions also, e.g. CONFIG_SPL_MAX_LOG_LEVEL.
+The above have SPL versions also, e.g. CONFIG_SPL_LOG_MAX_LEVEL.
 
 
 Temporary logging within a single file
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
