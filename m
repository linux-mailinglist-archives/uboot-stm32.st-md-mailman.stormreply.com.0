Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F741E3AD3
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 May 2020 09:43:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 693A5C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 May 2020 07:43:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A05C1C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 07:43:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04R7c4j0025576; Wed, 27 May 2020 09:43:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=zk18XYzYIKybXFGKOTqgy++HEDd4+J1YFPVPxg2PwN8=;
 b=rQVTD5thDFZFGQkAe7NvOOpr2C37kLZ6p+0ejtN1DWG70nVYcoCIuCA6mc6+mA4Kqzk+
 4WziGcEUwM0It5PO/xTDjH47SwGl7jMq6E8d7qPBCnYixgXsBYFwJ69mZFUe8eF92ZzR
 TzAECm4u9JpXx5emfQgi95l4PL0WLsr8ZcW6xwRS4vnvwnejcXUE22sGZQBT9Y6cVroa
 Azwa5Yv3i9la+3FQKvL9QXjo3o1kPPbj3LS/TiB+itmk3/ZlEaaneRoDcTKQZpYxQJeD
 MlTmZHUZZKt24GJZwcXpojhmc50l20c9dIaFRp2GClNotVYMNRf3Hc2vfF0bSh0M9bt4 DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316sa244rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 May 2020 09:43:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE2E5100034;
 Wed, 27 May 2020 09:43:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2E4620E68C;
 Wed, 27 May 2020 09:43:33 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 27 May 2020 09:43:33 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 27 May 2020 09:43:31 +0200
Message-ID: <20200527074331.4607-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-27_02:2020-05-26,
 2020-05-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2] doc: log: correct option name
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

Changes in v2:
- add commnet for TPL with CONFIG_TPL_LOG_MAX_LEVEL example

 doc/README.log | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/doc/README.log b/doc/README.log
index 1057981f45..ba838824a9 100644
--- a/doc/README.log
+++ b/doc/README.log
@@ -60,13 +60,14 @@ Enabling logging
 The following options are used to enable logging at compile time:
 
    CONFIG_LOG		- Enables the logging system
-   CONFIG_MAX_LOG_LEVEL - Max log level to build (anything higher is compiled
+   CONFIG_LOG_MAX_LEVEL - Max log level to build (anything higher is compiled
 				out)
    CONFIG_LOG_CONSOLE	- Enable writing log records to the console
 
 If CONFIG_LOG is not set, then no logging will be available.
 
-The above have SPL versions also, e.g. CONFIG_SPL_MAX_LOG_LEVEL.
+The above have SPL and TPL versions also, e.g. CONFIG_SPL_LOG_MAX_LEVEL and
+CONFIG_TPL_LOG_MAX_LEVEL.
 
 
 Temporary logging within a single file
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
