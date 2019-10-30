Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9436E9C70
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 14:38:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FF91C36B0F
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 13:38:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FE81C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 13:38:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9UDcOlE014681; Wed, 30 Oct 2019 14:38:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=roi/Q0HXXSSbPQXsstRv452Zy0apopNl1TcrPM6RSSc=;
 b=Nt0xsWXMhzjoRKfom8xTiAnkrHnIOD0DWuOOi/OMcAWpZjqxDDyv2bIt5OTrT/ByIeJ1
 1zGaHeZjj7mQrBUSteFuwF7tPh72qqmu+XrSqhX2k3nBSw4Lng6GlkrBDFc0BoOBV+9p
 X99UB3e2+ZIyZ8sq7Ydx1OUVCpsySKkdZDmZUYb5Ar1JqTOxZWgp1XCrUMm+3nmk/YuV
 /94PYJaEvsK6GbfOQL1PRTHz3WFM+s+poCZplcFUMkrkMXnMamWUFVIfLfH23vfsy1WY
 gtIHSfEV3W1I8N2ZT6d3FEgn5jCaOB7Sj9QucgeoU+9j11mW7/vHJPxGJuQh9n8KuPjU uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vxwf43yrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 14:38:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5910B100034;
 Wed, 30 Oct 2019 14:38:44 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B9732BEC75;
 Wed, 30 Oct 2019 14:38:44 +0100 (CET)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 30 Oct
 2019 14:38:44 +0100
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 30 Oct 2019 14:38:43
 +0100
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, "Lokesh
 Vutla" <lokeshvutla@ti.com>, Suman Anna <s-anna@ti.com>
Date: Wed, 30 Oct 2019 14:38:27 +0100
Message-ID: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-30_06:2019-10-30,2019-10-30 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH v2 0/6] remoteproc: add elf resource table
	loader
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

Changes since v1:
-Do not fixup the DeviceTree to track the stm32 coprocessor state. Instead of
 this, use a dedicated register.

Fabien Dessenne (6):
  remoteproc: elf_loader: Add elf resource table load support
  stm32mp1: declare backup registers for coprocessor
  stm32mp1: reset coprocessor status at cold boot
  remoteproc: stm32: track the coprocessor state in a backup register
  stm32mp1: remove copro_state environment variable
  remoteproc: stm32: load resource table from firmware

 arch/arm/mach-stm32mp/cpu.c                |   7 +
 arch/arm/mach-stm32mp/include/mach/stm32.h |   9 +
 board/st/stm32mp1/stm32mp1.c               |   4 +-
 drivers/remoteproc/rproc-elf-loader.c      | 269 +++++++++++++++++++++++++++++
 drivers/remoteproc/stm32_copro.c           |  27 ++-
 include/remoteproc.h                       |  70 ++++++++
 test/dm/remoteproc.c                       |  91 ++++++++--
 7 files changed, 454 insertions(+), 23 deletions(-)

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
