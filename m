Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EF81A141
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:20:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 937D2CA8E69
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:20:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CCC6CA8E68
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:20:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6TdF025384; Fri, 10 May 2019 18:20:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=gCPI9nsZIRdQyxiy/jN5C95zgHZkx3J+49WnZSa1lvE=;
 b=K/7oeBGhVidF/bEB9GHnSJzgLRecuhha9M6BvCtG1P4o9s8OLrrQiXzqZAJgjUEPtwOU
 LHxS1ZT8SPEh8Yp1OwlaqT48l+JF/0CRv5hD2UdOVK+85sFeNFXN7Szinnr93AtrfcAq
 MQau03JaPG68of23fKflAcGyUShsamq50NAH1shc8sidZTvyJzo/IaclKSfZqpDelO7x
 wrPhxZvCmlRIlHYddlaFDwbBigkBc/F0p4ZJunBHqYIyjUeqqPx7UIhlZWdsiAzTJCI+
 PGwRrcybn1EC8lBe7S0byGBvNJyamebYzve4Sk2+DX9x2vW3+aDcbRTGuk2eEycfo058 iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sc9s4kftw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:20:16 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFA3E31;
 Fri, 10 May 2019 16:20:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 557AD25C0;
 Fri, 10 May 2019 16:20:15 +0000 (GMT)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:20:14 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:19:06 +0200
Message-ID: <1557505154-3856-6-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
References: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: Christophe KERELLO <christophe.kerello@st.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Michal Simek <michal.simek@xilinx.com>, Shyam Saini <mayhs11saini@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 York Sun <york.sun@nxp.com>, Alex Kiernan <alex.kiernan@gmail.com>,
 Vipul Kumar <vipul.kumar@xilinx.com>
Subject: [Uboot-stm32] [PATCH 05/13] env: allow ENV_IS_NOWHERE with other
	storage target
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

Allow U-Boot to get default environment for some boot mode
(USB for example), and to select storage location when it is
booting from flash device;
ENVL_NOWHERE is present in env_locations with other one.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 env/Kconfig | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/env/Kconfig b/env/Kconfig
index 7830066..ca889cc 100644
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -2,18 +2,12 @@ menu "Environment"
 
 config ENV_IS_NOWHERE
 	bool "Environment is not stored"
-	depends on !ENV_IS_IN_EEPROM
-	depends on !ENV_IS_IN_EXT4
-	depends on !ENV_IS_IN_FAT
-	depends on !ENV_IS_IN_FLASH
-	depends on !ENV_IS_IN_MMC
-	depends on !ENV_IS_IN_NAND
-	depends on !ENV_IS_IN_NVRAM
-	depends on !ENV_IS_IN_ONENAND
-	depends on !ENV_IS_IN_REMOTE
-	depends on !ENV_IS_IN_SPI_FLASH
-	depends on !ENV_IS_IN_UBI
-	default y
+	default y if !ENV_IS_IN_EEPROM && !ENV_IS_IN_EXT4 && \
+		     !ENV_IS_IN_FAT && !ENV_IS_IN_FLASH && \
+		     !ENV_IS_IN_MMC && !ENV_IS_IN_NAND && \
+		     !ENV_IS_IN_NVRAM && !ENV_IS_IN_ONENAND && \
+		     !ENV_IS_IN_REMOTE && !ENV_IS_IN_SPI_FLASH && \
+		     !ENV_IS_IN_UBI
 	help
 	  Define this if you don't want to or can't have an environment stored
 	  on a storage medium. In this case the environment will still exist
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
