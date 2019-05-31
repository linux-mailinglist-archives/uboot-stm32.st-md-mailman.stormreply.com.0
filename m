Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5806830E93
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 May 2019 15:11:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0408AC640F5
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 May 2019 13:11:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E903C640F4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2019 13:11:46 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4VD6JD0014886; Fri, 31 May 2019 15:11:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=+/9wiY1UavmlkSxWDhjlxVc2iPL/5HHwrLAmbh/FHdw=;
 b=fBPiA95KEXVqI7BByXlPgElvG+bF10ZBww7k2FA4s3S4VinmtR7mDE7TBMqG+utk72wy
 ve/UUPZ1DEeEchIc+TZo8coorJ0hhDFK1hbxrGqZCMOw5OUMzClz1vaRux8p1svy5lHC
 kxNjtblhbGWu1yYAX1PVCyKy/8ZVSetSLRIgGQx3XpifzuKI+Ktg/DM3WqgBRdxrrQuM
 HH6YFp7B7VHQghCDIyeX6GTDHZng0vFQXZkcwetSBBq6z7TcU2+MP9yB/OCHWobwg8ew
 Fe9OihwRsLBwiqWhhi/qHpxK9+aY6yzaCLdzZ0jxhQ0AMfY67Lmz5qFnsq/lYwRCV2wn Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2su26j0tsp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 31 May 2019 15:11:45 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 68C8E31;
 Fri, 31 May 2019 13:11:43 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 46A3829C5;
 Fri, 31 May 2019 13:11:43 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May
 2019 15:11:43 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May 2019 15:11:42
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Fri, 31 May 2019 15:11:29 +0200
Message-ID: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-31_08:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH v3 0/7] Add STM32 Cortex-M4 remoteproc driver
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

Patch 1 adds the xxx_translate_dma_address() API which is the equivalent
of the xxx_translate_address() relying on the "dma-ranges" property
instead of the "ranges" property.

Patch 2 fixes and completes function headers of remoteproc.h.

Patch 3 & 4 add the support of the ELF image loading (the current
implementation supports only binary image loading).

Patch 5 is about the driver, and patches 6 & 7 are about MAINTAINERS
and configs update.

Changes since v2:
-Moved helpers to rproc-elf-loader.c
-Rename *elf* functions in *elf32*, preparing future support for elf64
Changes since v1:
-Added tests for rproc_elf*() and *_translate_dma_address()
-Changed memory translation ops from da_to_pa() to device_to_virt() : the name
 is updated and the translation now converts to virtual instead of physical.
-Merged rproc_elf_is_valid() in rproc_elf_sanity_check()
-Used explicit error values in rproc_elf_sanity_check()
-Added and fix comments in various headers
-Misc minor changes

Fabien Dessenne (7):
  dm: core: Introduce xxx_translate_dma_address()
  remoteproc: fix function headers
  remoteproc: add device_to_virt ops
  remoteproc: add elf file load support
  remoteproc: Introduce STM32 Cortex-M4 remoteproc driver
  MAINTAINERS: Add stm32 remoteproc driver
  configs: stm32mp15: enable stm32 remoteproc

 MAINTAINERS                           |   1 +
 arch/sandbox/dts/test.dts             |   4 +
 common/fdt_support.c                  |   6 +
 configs/stm32mp15_basic_defconfig     |   2 +
 configs/stm32mp15_trusted_defconfig   |   2 +
 drivers/core/of_addr.c                |   4 +
 drivers/core/ofnode.c                 |   8 ++
 drivers/core/read.c                   |   5 +
 drivers/remoteproc/Kconfig            |  10 ++
 drivers/remoteproc/Makefile           |   3 +-
 drivers/remoteproc/rproc-elf-loader.c | 106 ++++++++++++++
 drivers/remoteproc/sandbox_testproc.c |  19 +++
 drivers/remoteproc/stm32_copro.c      | 257 ++++++++++++++++++++++++++++++++++
 include/dm/of_addr.h                  |  18 +++
 include/dm/ofnode.h                   |  16 ++-
 include/dm/read.h                     |  20 ++-
 include/fdt_support.h                 |  24 ++++
 include/remoteproc.h                  | 146 +++++++++++++------
 test/dm/remoteproc.c                  | 122 ++++++++++++++++
 test/dm/test-fdt.c                    |  12 ++
 20 files changed, 743 insertions(+), 42 deletions(-)
 create mode 100644 drivers/remoteproc/rproc-elf-loader.c
 create mode 100644 drivers/remoteproc/stm32_copro.c

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
