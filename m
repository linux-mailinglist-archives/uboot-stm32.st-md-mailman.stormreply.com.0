Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD70764556B
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Dec 2022 09:27:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71D2FC65E6B;
	Wed,  7 Dec 2022 08:27:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8283C65E69
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 08:27:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B73eoJV006005; Wed, 7 Dec 2022 09:27:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=2zjf+plCdvu248t9MmxLAZbmq6kPIyKind+hDt/YcCo=;
 b=TmG07hZm4O7tQ31vCxplL2O24FEov8L/L9rzzpAFuRDolZbTuAcrpmN0CyquylsMRequ
 wkDmrD23G+QJRvmzbTy4kZFLk9j9hv3K+6zMsOi1tn0dw4ItStlXxwi/kkGQ3b0ObbDQ
 xcYjbolPBEJKBUPSsucdIqV3ZfKuNaLq0xG5e5IDtkg6g8z5C8SXwyfDA/5D0OXzAF0l
 wWEcC31Toui/UUfAEuRZzAe4g1TEKsg+PfCGoNF4fDQxW6VhoQR3kGz5ckHw6mmLJD8l
 hxumo+zC/yiC/2x5+r309hiYoXM4NzRXUA6ixmOfiDowhsHSA3eJ9U1OtfAZBpB81xJE qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7x7pxtd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 09:27:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 619BB100040;
 Wed,  7 Dec 2022 09:26:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 596CA218D0F;
 Wed,  7 Dec 2022 09:26:46 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 7 Dec
 2022 09:26:46 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 7 Dec 2022 09:26:39 +0100
Message-ID: <20221207082644.3515486-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_04,2022-12-06_01,2022-06-22_01
Cc: Govindaraji Sivanantham <Govindaraji.Sivanantham@in.bosch.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Hiremath Gireesh <Gireesh.Hiremath@in.bosch.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/5] Complete the migration of
	MTDPARTS_DEFAULT / MTDIDS_DEFAULT
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


Addition for previous commit a331017c237c ("Complete migration of
MTDPARTS_DEFAULT / MTDIDS_DEFAULT, include in environment")

Remove the remaining defines MTDPARTS_DEFAULT and MTDIDS_DEFAULT
in the configuration files (include/configs/*.h).

After this serie, the only remaining references of these 2 defines are
located in cmd/mtdparts.c and only for local purpose when
CONFIG_MTDIDS_DEFAULT or CONFIG_MTDPART_DEFAULT are not defined.

Patrick.


Patrick Delaunay (5):
  configs: am333x_guardian: move MTDIDS_DEFAULT in defconfif
  configs: x530: move MTDPART/MTDIDS_DEFAULT in defconfig
  configs: SBx81LIFXCAT: move MTDPART_DEFAULT in defconfig
  configs: SBx81LIFKW: move MTDPART_DEFAULT in defconfig
  configs: remove support of MTDIDS_DEFAULT/MTDPARTS_DEFAULT

 cmd/mtdparts.c                    | 5 +----
 configs/SBx81LIFKW_defconfig      | 1 +
 configs/SBx81LIFXCAT_defconfig    | 1 +
 configs/am335x_guardian_defconfig | 1 +
 configs/x530_defconfig            | 2 ++
 drivers/mtd/mtd_uboot.c           | 4 ----
 include/configs/SBx81LIFKW.h      | 1 -
 include/configs/SBx81LIFXCAT.h    | 1 -
 include/configs/am335x_guardian.h | 1 -
 include/configs/x530.h            | 2 --
 10 files changed, 6 insertions(+), 13 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
