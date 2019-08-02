Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA697F7D6
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 15:08:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5026EC35E03
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 13:08:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1341EC35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 13:08:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72D2NLE025017; Fri, 2 Aug 2019 15:07:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=OXaU2wOcFwj2pG5naEBeOV9TnbTOu855UIe+tq1aNJA=;
 b=SeRKrAWovcAv4g5KgxwSCsmDoy6y2TeIQt39eeEiYnSi57RaLd6fMKm7Sq48h11VHS+c
 z1XL8RKhtIljlUxRoL1hUMlNkAjIsBpc3+wH7Rxkklgl/ZdpHDCo/NEiJx0J/T9fapSf
 2WcaSTGpGkE0sIOLyfOC6f2EtXU0zA2Zl9RNtT1o5NDsEKRG1Ukn5TukNJi/lpvPfPqF
 Aqt/mXGkqcV07XM1ewgHblrB4hKtJxHCVufGWHi+I11lmN6M0919pbuS8IZuWZBsgUTv
 ueAS5km4B+1MUftnuA6KhtCi1ZhkxQl3Ko1BFMDlqOGzX59M4sFrsts0pU8XpzRCYiiS Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4us0e-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 15:07:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 62B9734;
 Fri,  2 Aug 2019 13:07:41 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4ADAD2C35C0;
 Fri,  2 Aug 2019 15:07:41 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 15:07:41 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 15:07:40
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 15:07:17 +0200
Message-ID: <1564751242-683-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
Cc: Albert Aribaud <albert.u.boot@aribaud.net>, Peng Fan <peng.fan@nxp.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Philippe
 Reynes <philippe.reynes@softathome.com>, Shawn Guo <shawn.guo@linaro.org>,
 Simon Glass <sjg@chromium.org>, Patrice
 Chotard <patrice.chotard@st.com>, Patrick Delaunay <patrick.delaunay@st.com>,
 Alex Kiernan <alex.kiernan@gmail.com>,
 Tien Fong Chee <tien.fong.chee@intel.com>,
 Fabien Dessenne <fabien.dessenne@st.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Julius Werner <jwerner@chromium.org>, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Chris Packham <judge.packham@gmail.com>, Stefano Babic <sbabic@denx.de>
Subject: [Uboot-stm32] [PATCH 0/5] stm32mp1: add support of M4 coprocessor
	firmware
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


Activate remoteproc and add the M4 coprocessor  support of firmware
in stm32mp157 U-Boot.

The M4 firmware can be loaded manually (with remoteproc command)
or automatically (with config selected in FIT including the M4 firmware
with extlinux for example).



Patrick Delaunay (5):
  stm32mp1: Add remoteproc support for m4 coprocessor
  image: add new "copro" image type
  stm32mp1: Add copro image support for M4 firmware
  stm32mp1: add example files for FIT generation
  stm32mp1: update README for remoteproc support

 arch/arm/dts/stm32mp157a-dk1.dts           |   6 ++
 arch/arm/dts/stm32mp157c-ed1.dts           |   6 ++
 arch/arm/dts/stm32mp157c.dtsi              |  20 ++++++
 board/st/stm32mp1/README                   |  36 +++++++++-
 board/st/stm32mp1/extlinux.conf            |  20 ++++++
 board/st/stm32mp1/fit_copro_kernel_dtb.its | 103 +++++++++++++++++++++++++++++
 board/st/stm32mp1/fit_kernel_dtb.its       |  82 +++++++++++++++++++++++
 board/st/stm32mp1/stm32mp1.c               |  24 +++++++
 common/image.c                             |   1 +
 configs/stm32mp15_basic_defconfig          |   1 +
 configs/stm32mp15_optee_defconfig          |   1 +
 configs/stm32mp15_trusted_defconfig        |   1 +
 drivers/remoteproc/stm32_copro.c           |   2 +-
 include/image.h                            |   1 +
 14 files changed, 301 insertions(+), 3 deletions(-)
 create mode 100644 board/st/stm32mp1/extlinux.conf
 create mode 100644 board/st/stm32mp1/fit_copro_kernel_dtb.its
 create mode 100644 board/st/stm32mp1/fit_kernel_dtb.its

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
