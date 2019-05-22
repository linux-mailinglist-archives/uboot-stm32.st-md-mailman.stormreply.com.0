Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E416B25F06
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 10:07:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2F2CC628C1
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 08:07:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76688C628B6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 08:07:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4M86jW7002745; Wed, 22 May 2019 10:07:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Q9m3nb1g+OtLINn0w/QbBUsa1AF16ZfjZSll5DbXTk8=;
 b=cWF6hGLe+aJVtFETpDSC4WLpTd5/TcU5GUbqgFanJG7SLFk/vfd3Rpgf7/g3kAdyH2kX
 sUNMxVtzjYv8uXCPDAdy+sUYPxq6CmUqsWCsPKrsz7oDJNxytCVsdhW2fXeWzLr/Dk4V
 zNYLgw11/iVUMYRIUGwf0vd+9QTQ4p6bG6LffMFAPkgisrOKidNOIUseQfk63FSnpTkD
 iOA7jjOkrtwr3973Qm6dy9v4PqAeq/j0l5nnI8B2wofmJdxmTSt2f0gEJ/ne34VRPmyc
 3WoAwy4mQACmQbLswSEkpJTZv+PhiJ/I98LaJxlOT4KjdpTK77+1XCfcIEd008sYxanZ Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj77477q0-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 22 May 2019 10:07:07 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65F2831;
 Wed, 22 May 2019 08:07:05 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3000B18F1;
 Wed, 22 May 2019 08:07:05 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.44) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May
 2019 10:07:05 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May 2019 10:07:04
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Wed, 22 May 2019 10:06:42 +0200
Message-ID: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_03:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 0/7] Add STM32 Cortex-M4 remoteproc driver
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

This patchset adds an STM32 remoteproc driver.

The two first patches add the xxx_translate_dma_address() API which is
the equivalent of the xxx_translate_address() relying on the "dma-ranges"
property instead of the "ranges" property.

The patches 3 & 4 add the support of the ELF image loading (the current
implementation supports only binary image loading).

The 5th patch is about the driver, and the two last patches are about
MAINTAINERS and configs update.

Fabien Dessenne (7):
  fdt: Introduce fdt_translate_dma_address()
  dm: core: Introduce xxx_translate_dma_address()
  remoteproc: add da_to_pa ops
  remoteproc: add elf file load support
  remoteproc: Introduce STM32 Cortex-M4 remoteproc driver
  MAINTAINERS: Add stm32 remoteproc driver
  configs: stm32mp15: enable stm32 remoteproc

 MAINTAINERS                         |   1 +
 common/fdt_support.c                |   6 +
 configs/stm32mp15_basic_defconfig   |   2 +
 configs/stm32mp15_trusted_defconfig |   2 +
 drivers/core/of_addr.c              |   4 +
 drivers/core/ofnode.c               |   8 ++
 drivers/core/read.c                 |   5 +
 drivers/remoteproc/Kconfig          |  10 ++
 drivers/remoteproc/Makefile         |   1 +
 drivers/remoteproc/rproc-uclass.c   | 128 ++++++++++++++++++
 drivers/remoteproc/stm32_copro.c    | 257 ++++++++++++++++++++++++++++++++++++
 include/dm/of_addr.h                |  18 +++
 include/dm/ofnode.h                 |  16 ++-
 include/dm/read.h                   |  20 ++-
 include/fdt_support.h               |   2 +
 include/remoteproc.h                |  32 ++++-
 16 files changed, 509 insertions(+), 3 deletions(-)
 create mode 100644 drivers/remoteproc/stm32_copro.c

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
