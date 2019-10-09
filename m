Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF7BD12E6
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Oct 2019 17:36:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96418C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Oct 2019 15:36:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E25E8C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 15:36:44 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x99FM0Uh026773; Wed, 9 Oct 2019 17:36:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=lQhIr//18JbNi5kPeKiE9967iamR4rQuKxeNXQK39JE=;
 b=MAYbhTf7pIN9EjrJdWthRmxUsdwOTlsZCSrphNDUXx5UvPXTSv9ZyD9VYYtA5UmSaRi1
 Kt801jKHa8GlaBjM0At/iIeUTwnNtupoqIss9RdYNDUMqTIijt4DgZ1Z3ubze4IQWIpE
 ajJiJZrqanhOeIeigNL3q+2dLbhJNEiyQxaz5/lfwCgkFYTWsAqG1keA8fCF2dfdIZyE
 xlDms1Vz6oRBuxwKzTxog1f30sFvXCjdGXEG+wHvycqqDcsxKCmo23lhgTUqDKQqjuqd
 48N/rQMYgbJq4dV+2FjKI8UpNJsI7zvXFz+s+L/km/yAgcQWuavvq8sziqyjKwCQeUNf bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegxvxruv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2019 17:36:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 80B21100039;
 Wed,  9 Oct 2019 17:36:40 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7698C2A56A6;
 Wed,  9 Oct 2019 17:36:40 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019
 17:36:40 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019 17:36:40
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, Lokesh Vutla <lokeshvutla@ti.com>
Date: Wed, 9 Oct 2019 17:36:24 +0200
Message-ID: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_07:2019-10-08,2019-10-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 0/5] remoteproc: add elf resource table loader
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

Add some helpers that can be called by the drivers to load the firmware
resource table from an elf32 / elf64 image.
The stm32 remoteproc driver makes use of it, to load the resource table before
the elf image itself.

This series applies on top of the "remoteproc: Add support for R5F and DSP
processors" series [1] proposed by Lokesh Vutla which introduces the elf64
support.

[1]: https://patchwork.ozlabs.org/project/uboot/list/?series=128946

Fabien Dessenne (5):
  remoteproc: elf_loader: Add elf resource table load support
  stm32mp1: declare backup register for copro resource table address
  remoteproc: stm32: load resource table from firmware
  stm32mp1: Fixup the Linux DeviceTree with coprocessor information
  remoteproc: stm32: invert the is_running() return value

 arch/arm/mach-stm32mp/include/mach/stm32.h |   1 +
 board/st/stm32mp1/stm32mp1.c               |  16 +-
 drivers/remoteproc/rproc-elf-loader.c      | 269 +++++++++++++++++++++++++++++
 drivers/remoteproc/stm32_copro.c           |  17 +-
 include/remoteproc.h                       |  70 ++++++++
 test/dm/remoteproc.c                       |  91 ++++++++--
 6 files changed, 448 insertions(+), 16 deletions(-)

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
